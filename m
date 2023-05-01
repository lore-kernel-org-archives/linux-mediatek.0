Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A4E2EC77B73
	for <linux-mediatek@archiver.kernel.org>; Mon,  1 May 2023 18:33:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	Message-ID:Subject:To:From:Date:Reply-To:Cc:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=6A1dW7hrcJbyNOQT+fMhA0InvfL3QrG+RoN83ZNMrW0=; b=vj/D5GsLDS0knBBFAsii+yPCr1
	BPW2akpsot8bnzE2qq6EKwejNggsRnnRyCFoG8cWSktRuqtgSJwTf20qf2RtXEt3F6AK/RWUK/F7k
	jPdtBi7DHQkVoUKwbmYpE22VbUcindLYUSgYarVYAA5EB6K/vNktEccITRilBJ4ueVOvaIYrrxEfo
	2ko5G2XB7X3fNf9pEkb8W/YRWnQdJKw5jdf1IzutCMNrKJx0Bv3lIlQZCszMHZvoi+1oVAx/Td2uZ
	aTNabBmwooGJmdshORlpBTqthZqKdvp8QYDd2kzgRtIXL6IoLWu51I9A6EI630d5l/CdYiPYp/YLo
	14Q4D20A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1ptYLE-00GYeo-2N;
	Mon, 01 May 2023 18:33:40 +0000
Received: from fudo.makrotopia.org ([2a07:2ec0:3002::71])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1ptYL7-00GYe1-0n;
	Mon, 01 May 2023 18:33:39 +0000
Received: from local
	by fudo.makrotopia.org with esmtpsa (TLS1.3:TLS_AES_256_GCM_SHA384:256)
	 (Exim 4.96)
	(envelope-from <daniel@makrotopia.org>)
	id 1ptYKz-00077z-1m;
	Mon, 01 May 2023 20:33:25 +0200
Date: Mon, 1 May 2023 19:33:14 +0100
From: Daniel Golle <daniel@makrotopia.org>
To: linux-spi@vger.kernel.org, linux-mediatek@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	Mark Brown <broonie@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Leilk Liu <leilk.liu@mediatek.com>
Subject: [PATCH] spi: mt65xx: make sure operations completed before unloading
Message-ID: <ZFAF6pJxMu1z6k4w@makrotopia.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230501_113333_309720_D727D522 
X-CRM114-Status: GOOD (  11.30  )
X-BeenThere: linux-mediatek@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-mediatek.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mediatek>,
 <mailto:linux-mediatek-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mediatek/>
List-Post: <mailto:linux-mediatek@lists.infradead.org>
List-Help: <mailto:linux-mediatek-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mediatek>,
 <mailto:linux-mediatek-request@lists.infradead.org?subject=subscribe>
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

When unloading the spi-mt65xx kernel module during an ongoing spi-mem
operation the kernel will Oops shortly after unloading the module.
This is because wait_for_completion_timeout was still running and
returning into the no longer loaded module:

Internal error: Oops: 0000000096000005 [#1] SMP
Modules linked in: [many, but spi-mt65xx is no longer there]
CPU: 0 PID: 2578 Comm: block Tainted: G        W  O       6.3.0-next-20230428+ #0
Hardware name: Bananapi BPI-R3 (DT)
pstate: 804000c5 (Nzcv daIF +PAN -UAO -TCO -DIT -SSBS BTYPE=--)
pc : __lock_acquire+0x18c/0x20e8
lr : __lock_acquire+0x9b8/0x20e8
sp : ffffffc009ec3400
x29: ffffffc009ec3400 x28: 0000000000000001 x27: 0000000000000004
x26: ffffff80082888c8 x25: 0000000000000000 x24: 0000000000000000
x23: ffffffc009609da8 x22: ffffff8008288000 x21: ffffff8008288968
x20: 00000000000003c2 x19: ffffff8008be7990 x18: 00000000000002af
x17: 0000000000000000 x16: 0000000000000000 x15: ffffffc008d78970
x14: 000000000000080d x13: 00000000000002af x12: 00000000ffffffea
x11: 00000000ffffefff x10: ffffffc008dd0970 x9 : ffffffc008d78918
x8 : 0000000000017fe8 x7 : 0000000000000001 x6 : 0000000000000000
x5 : ffffff807fb53910 x4 : 0000000000000000 x3 : 0000000000000027
x2 : 0000000000000027 x1 : 0000000000000000 x0 : 00000000000c03c2
Call trace:
 __lock_acquire+0x18c/0x20e8
 lock_acquire+0x100/0x2a4
 _raw_spin_lock_irq+0x58/0x74
 __wait_for_common+0xe0/0x1b4
 wait_for_completion_timeout+0x1c/0x24
 0xffffffc000acc8a4 <--- used to be mtk_spi_transfer_wait
 spi_mem_exec_op+0x390/0x3ec
 spi_mem_no_dirmap_read+0x6c/0x88
 spi_mem_dirmap_read+0xcc/0x12c
 spinand_read_page+0xf8/0x1dc
 spinand_mtd_read+0x1b4/0x2fc
 mtd_read_oob_std+0x58/0x7c
 mtd_read_oob+0x8c/0x148
 mtd_read+0x50/0x6c
 ...

Prevent this by completing in mtk_spi_remove if needed.

Fixes: 9f763fd20da7 ("spi: mediatek: add spi memory support for ipm design")
Signed-off-by: Daniel Golle <daniel@makrotopia.org>
---

A short grep revealed that many if not most other SPI drivers may need
the same fix. However, I can impossibly test all of them, so let's
start with this one.

 drivers/spi/spi-mt65xx.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/spi/spi-mt65xx.c b/drivers/spi/spi-mt65xx.c
index 21c321f437667..d7432e2219d85 100644
--- a/drivers/spi/spi-mt65xx.c
+++ b/drivers/spi/spi-mt65xx.c
@@ -1275,6 +1275,9 @@ static int mtk_spi_remove(struct platform_device *pdev)
 	struct mtk_spi *mdata = spi_master_get_devdata(master);
 	int ret;
 
+	if (mdata->use_spimem && !completion_done(&mdata->spimem_done))
+		complete(&mdata->spimem_done);
+
 	ret = pm_runtime_resume_and_get(&pdev->dev);
 	if (ret < 0)
 		return ret;
-- 
2.40.1


