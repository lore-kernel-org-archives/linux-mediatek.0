Return-Path: <SRS0=ZZ2m=JU=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 64B8FC433ED
	for <linux-mediatek@archiver.kernel.org>; Fri, 23 Apr 2021 17:28:30 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id E577C608FE
	for <linux-mediatek@archiver.kernel.org>; Fri, 23 Apr 2021 17:28:29 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org E577C608FE
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=collabora.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:MIME-Version:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Message-Id:Date:Subject:Cc:To:From:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=hZZm8H3df0x2S0cPQCc1/1BV5sKmtJfxCy74ZYeqZrw=; b=L/qqc38PTCo9Ircp8WYbv8nGwG
	6SgtJoTWL5RXYYM0vr4VFmGNvkanBbfD1mvOEw0lYjKRlkiCg+v+aFya6lUw9dGEQ2R2IyyZV+EPP
	kHaoG3Ii3Ik/1/nOcrPIAm1XNZ9o1aWf0dRU/VxBmCgOgBVm5QcP+GeEvsnux/bImYy8JhEskTLLE
	zUZ5kfCMyEUZktqcy7dve6xbHIfY7s7ReP/XePLy0W5yU6Nq/jh7RzAVnuOjnvJYaB9rg7c1CfgvA
	xaRYqwiacyLaboQj4YV77ESNDmwuHXThImoUHJb8Mtp6rmzaCIiP2NSfNep10myCCgJXXDKw0ICCA
	dzAF5NbA==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lZzbB-0020m1-6M; Fri, 23 Apr 2021 17:28:13 +0000
Received: from bombadil.infradead.org ([2607:7c80:54:e::133])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lZzax-0020kk-Oe; Fri, 23 Apr 2021 17:27:59 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=Message-Id:Date:Subject:Cc:To:From:
 Sender:Reply-To:MIME-Version:Content-Type:Content-Transfer-Encoding:
 Content-ID:Content-Description:In-Reply-To:References;
 bh=gvl56fYnLpHhLJvB6UVqd/NKK076ova45HsUmXI7OmQ=; b=kM34yf7hey3jkW8QUB3oYHu6bn
 mSFUKzgzPPrbYq+uOdBPk8itj385NdeP71B64xkKzhc64e/omMc0UuVbSmhxO+28T3scS8p1HdjzD
 bxjHlYwB6IN18aQEAsGq0+kJpRB3e9TCAo3SDKFw/F8wqTj0VOS6/vmnyNwg4sXUWUoKODxlyKUEJ
 jWEpNsrUtreiVGvaEIqRVvQ/TzOMG4IN7WhQsHjuIR4jNBrzGOdfVUBpVER23GJbu32U9MUb/jNbM
 wGW/XAmKXuWjyGJy60H0K06FoVkVa5ljg1GkYoGXT8yH+II3CINcg7hLwsEAM504GwAHcTphXsACn
 TJx8kQuQ==;
Received: from bhuna.collabora.co.uk ([2a00:1098:0:82:1000:25:2eeb:e3e3])
 by bombadil.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lZzav-00EajD-1p; Fri, 23 Apr 2021 17:27:58 +0000
Received: from guri.fritz.box (unknown
 [IPv6:2a02:810a:880:f54:79a2:c598:7744:783a])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested) (Authenticated sender: dafna)
 by bhuna.collabora.co.uk (Postfix) with ESMTPSA id 735381F43D84;
 Fri, 23 Apr 2021 18:27:52 +0100 (BST)
From: Dafna Hirschfeld <dafna.hirschfeld@collabora.com>
To: linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org,
 linux-kernel@vger.kernel.org
Cc: dafna.hirschfeld@collabora.com, kernel@collabora.com, dafna3@gmail.com,
 enric.balletbo@collabora.com, tiffany.lin@mediatek.com,
 andrew-ct.chen@mediatek.com, minghsiu.tsai@mediatek.com,
 houlong.wei@mediatek.com, mchehab@kernel.org, matthias.bgg@gmail.com,
 linux-media@vger.kernel.org
Subject: [PATCH] media: mtk-vpu: on suspend,
 read/write regs only if vpu is running
Date: Fri, 23 Apr 2021 19:27:45 +0200
Message-Id: <20210423172745.30092-1-dafna.hirschfeld@collabora.com>
X-Mailer: git-send-email 2.17.1
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210423_102757_227075_C4FA84BE 
X-CRM114-Status: GOOD (  12.56  )
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
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

If the vpu is not running, we should not relay on VPU_IDLE_REG
value. In this case, the suspend cb should only unprepare the
clock. This fixes a system-wide suspend to ram failure:

[  273.073363] PM: suspend entry (deep)
[  273.410502] mtk-msdc 11230000.mmc: phase: [map:ffffffff] [maxlen:32] [final:10]
[  273.455926] Filesystems sync: 0.378 seconds
[  273.589707] Freezing user space processes ... (elapsed 0.003 seconds) done.
[  273.600104] OOM killer disabled.
[  273.603409] Freezing remaining freezable tasks ... (elapsed 0.001 seconds) done.
[  273.613361] mwifiex_sdio mmc2:0001:1: None of the WOWLAN triggers enabled
[  274.784952] mtk_vpu 10020000.vpu: vpu idle timeout
[  274.789764] PM: dpm_run_callback(): platform_pm_suspend+0x0/0x70 returns -5
[  274.796740] mtk_vpu 10020000.vpu: PM: failed to suspend: error -5
[  274.802842] PM: Some devices failed to suspend, or early wake event detected
[  275.426489] OOM killer enabled.
[  275.429718] Restarting tasks ...
[  275.435765] done.
[  275.447510] PM: suspend exit

Fixes: 1f565e263c3e ("media: mtk-vpu: VPU should be in idle state before system is suspended")
Signed-off-by: Dafna Hirschfeld <dafna.hirschfeld@collabora.com>
---
 drivers/media/platform/mtk-vpu/mtk_vpu.c | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/drivers/media/platform/mtk-vpu/mtk_vpu.c b/drivers/media/platform/mtk-vpu/mtk_vpu.c
index 043894f7188c..f49f6d53a941 100644
--- a/drivers/media/platform/mtk-vpu/mtk_vpu.c
+++ b/drivers/media/platform/mtk-vpu/mtk_vpu.c
@@ -987,6 +987,12 @@ static int mtk_vpu_suspend(struct device *dev)
 		return ret;
 	}
 
+	if (!vpu_running(vpu)) {
+		vpu_clock_disable(vpu);
+		clk_unprepare(vpu->clk);
+		return 0;
+	}
+
 	mutex_lock(&vpu->vpu_mutex);
 	/* disable vpu timer interrupt */
 	vpu_cfg_writel(vpu, vpu_cfg_readl(vpu, VPU_INT_STATUS) | VPU_IDLE_STATE,
-- 
2.17.1


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
