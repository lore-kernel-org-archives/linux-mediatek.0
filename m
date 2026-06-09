Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9B1EBCD8C85
	for <linux-mediatek@archiver.kernel.org>; Tue,  9 Jun 2026 08:13:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=DfwEQkFOR/ISCnGVWXbZ1uHPBV2amccjhWepZ+480bc=; b=wIu0Y9YLiRGS0kGdPEm4i1CVN2
	Ovpn16m7L8eVfjA+vEBIqJKQGYbAAtHc+Gru9Z2aq2qMDEFOS+LGl2BonAUNHm0XzRFMBEe6jpj1D
	fBUyyd8YFOXRXp5QnK8XBH+/9CIK11/fT9O7mm5DH77GkkLn8hYERmWvobaqnDbhkaOGKYhsj7TqP
	1r1cOWtdCoVB81SOO9hB+9en2bInjp/rMKbVCbgNyIObqBfm+BbiHqgj1I+YQcDQSvhF4KjRSq01K
	irWAOB/e0wM3kaz0IbnhZrlvAeymhP5EXL53K6z04QXa0gQln7+nGcbT+M4JZtqdScWC0yGL5oMAy
	p1e8L59A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wWraJ-000000052MJ-0Lf5;
	Tue, 09 Jun 2026 08:13:19 +0000
Received: from smtp25.cstnet.cn ([159.226.251.25] helo=cstnet.cn)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wWraG-000000052LQ-1tY1;
	Tue, 09 Jun 2026 08:13:18 +0000
Received: from dfae2b116770.home.arpa (unknown [36.110.52.2])
	by APP-05 (Coremail) with SMTP id zQCowACnAdUTyydqqErOEg--.7605S2;
	Tue, 09 Jun 2026 16:13:07 +0800 (CST)
From: Wentao Liang <vulab@iscas.ac.cn>
To: nbd@nbd.name,
	lorenzo@kernel.org,
	andrew+netdev@lunn.ch,
	davem@davemloft.net,
	edumazet@google.com,
	kuba@kernel.org,
	pabeni@redhat.com,
	matthias.bgg@gmail.com,
	angelogioacchino.delregno@collabora.com
Cc: netdev@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	Wentao Liang <vulab@iscas.ac.cn>,
	stable@vger.kernel.org
Subject: [PATCH] net: ethernet: mediatek: fix refcount leak in mtk_probe()
Date: Tue,  9 Jun 2026 08:13:00 +0000
Message-Id: <20260609081300.208168-1-vulab@iscas.ac.cn>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID: zQCowACnAdUTyydqqErOEg--.7605S2
X-Coremail-Antispam: 1UD129KBjvJXoW7Zw1DuF1rXFyDZr1xtry7Jrb_yoW8Jw4kpr
	WUtayUCF95Jr13Ga1kua18XF1rAayrKry5Gr15Zw1fZ3s0yrW7JFyFqayjkFyIvrW0k3ZI
	yrnFv39xCFyqvaDanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDU0xBIdaVrnRJUUU9Y14x267AKxVW8JVW5JwAFc2x0x2IEx4CE42xK8VAvwI8IcIk0
	rVWrJVCq3wAFIxvE14AKwVWUJVWUGwA2ocxC64kIII0Yj41l84x0c7CEw4AK67xGY2AK02
	1l84ACjcxK6xIIjxv20xvE14v26ryj6F1UM28EF7xvwVC0I7IYx2IY6xkF7I0E14v26F4j
	6r4UJwA2z4x0Y4vEx4A2jsIE14v26rxl6s0DM28EF7xvwVC2z280aVCY1x0267AKxVW0oV
	Cq3wAS0I0E0xvYzxvE52x082IY62kv0487Mc02F40EFcxC0VAKzVAqx4xG6I80ewAv7VC0
	I7IYx2IY67AKxVWUAVWUtwAv7VC2z280aVAFwI0_Cr1j6rxdMcvjeVCFs4IE7xkEbVWUJV
	W8JwACjcxG0xvY0x0EwIxGrwACjI8F5VA0II8E6IAqYI8I648v4I1lFIxGxcIEc7CjxVA2
	Y2ka0xkIwI1lc7CjxVAaw2AFwI0_Jw0_GFyl42xK82IYc2Ij64vIr41l4I8I3I0E4IkC6x
	0Yz7v_Jr0_Gr1lx2IqxVAqx4xG67AKxVWUJVWUGwC20s026x8GjcxK67AKxVWUGVWUWwC2
	zVAF1VAY17CE14v26r1q6r43MIIYrxkI7VAKI48JMIIF0xvE2Ix0cI8IcVAFwI0_Jr0_JF
	4lIxAIcVC0I7IYx2IY6xkF7I0E14v26r4j6F4UMIIF0xvE42xK8VAvwI8IcIk0rVWUJVWU
	CwCI42IY6I8E87Iv67AKxVWUJVW8JwCI42IY6I8E87Iv6xkF7I0E14v26r4j6r4UJbIYCT
	nIWIevJa73UjIFyTuYvjfU7TmhDUUUU
X-Originating-IP: [36.110.52.2]
X-CM-SenderInfo: pyxotu46lvutnvoduhdfq/1tbiDAgNA2onpvyVpQAAst
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260609_011316_874950_FCBBAD49 
X-CRM114-Status: GOOD (  11.85  )
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

If mtk_sgmii_init() fails after successfully creating some PCS
instances, it returns an error without cleaning up the partially
created ones.  mtk_pcs_lynxi_create() increments the fwnode
refcount for each PCS it creates, but this refcount is never
released because mtk_probe() uses a plain "return err" instead of
a goto to the err_destroy_sgmii label.  This leaks both the PCS
devices and their fwnode references.

Fix the leak by jumping to the existing err_destroy_sgmii path
which calls mtk_sgmii_destroy() to safely release all allocated
resources.

Cc: stable@vger.kernel.org
Fixes: 9ffee4a8276c ("net: ethernet: mediatek: Extend SGMII related functions")
Signed-off-by: Wentao Liang <vulab@iscas.ac.cn>
---
 drivers/net/ethernet/mediatek/mtk_eth_soc.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/net/ethernet/mediatek/mtk_eth_soc.c b/drivers/net/ethernet/mediatek/mtk_eth_soc.c
index 8d225bc9f063..0f185462cf85 100644
--- a/drivers/net/ethernet/mediatek/mtk_eth_soc.c
+++ b/drivers/net/ethernet/mediatek/mtk_eth_soc.c
@@ -5169,7 +5169,7 @@ static int mtk_probe(struct platform_device *pdev)
 		err = mtk_sgmii_init(eth);
 
 		if (err)
-			return err;
+			goto err_destroy_sgmii;
 	}
 
 	if (eth->soc->required_pctl) {
-- 
2.34.1


