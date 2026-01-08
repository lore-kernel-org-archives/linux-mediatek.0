Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 25D7ED185C8
	for <linux-mediatek@archiver.kernel.org>; Thu,  8 Jan 2026 10:51:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=4rMHsJjiUV86PAj6jvywgEhs1dLS6nmBWhNCaoGf/Rw=; b=dMzpjvuKY0p23ZL392n7gJhimC
	v+/XpIbA5/Eyfv5uPW7f76nWpOgsnJKFcJGX2xSSULM72FrAt6R5Im0PlcfsBVXB+eIMXhjUE7GNb
	x4loKLbH+DU3/gApAxIUwNUsI3W1TemJ9QHPDzCddXrO1a4BteuYCT4jzwQ6kCuRf/P4KzG9UtPlr
	qthT3G5q9MMZditsFBGi67F1SOucrUXaaftXbfS2vObt3EHhvEdvvCzf0QJ7jHFI+bh+oADpX3DxU
	aIuutY5cuBYyk/pZYiqvq5Z0bId2s3HMjsWq6PI33NQ0hWNl76f0lUb3dd23FvdiDjT6Z9k5SQvED
	J6bWRPPQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vdncM-0000000Ghtq-0Ngr;
	Thu, 08 Jan 2026 10:51:50 +0000
Received: from sender4-pp-f112.zoho.com ([136.143.188.112])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vdnc9-0000000GhYD-0l6Q;
	Thu, 08 Jan 2026 10:51:39 +0000
ARC-Seal: i=1; a=rsa-sha256; t=1767869487; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=QDXPtw3rPiPWIHc9kLwJxjugFAKrnvXvPgr2AnLCUvar8InqE5gR8DoDEGayYtdNl1gX8bU9weULoa88t0RUW+Uiy8guEj1h3WtTMrxbghIjFto0h3zGT+rJ4P4LRuO9Fu9kAhvsIAeEXrHXTt64zhOfVGgsVIfgER+c9ZoQn5U=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1767869487; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=4rMHsJjiUV86PAj6jvywgEhs1dLS6nmBWhNCaoGf/Rw=; 
	b=It4X1hfSIhnlb3wLPsMxo7FA/C7q0hfY0Z5wIeFtWQis1BLpgZRqEcvRcXTRKPxngb9cNzDRnqADEdk4dNkUeRRmsMSmAJwm0UL2OnlqyG7mmIlx/T3dT3OhCjkSRqvTLrANP6ABINusfwryPzAcOh587IrsP5vsLuZ8FyrwXyU=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=collabora.com;
	spf=pass  smtp.mailfrom=nicolas.frattaroli@collabora.com;
	dmarc=pass header.from=<nicolas.frattaroli@collabora.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1767869487;
	s=zohomail; d=collabora.com; i=nicolas.frattaroli@collabora.com;
	h=From:From:Date:Date:Subject:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:Message-Id:Message-Id:References:In-Reply-To:To:To:Cc:Cc:Reply-To;
	bh=4rMHsJjiUV86PAj6jvywgEhs1dLS6nmBWhNCaoGf/Rw=;
	b=ECkDbJJWmvPzxcQ0Ux7cPXNmwWFDQhWmsq/lI3TCzxvzLMVEj6R9h0TUQDiHmEa0
	BtqRtsaPw1nyZH2C8yzu25IeEvH15RUuezraKQJll+pBrUWNqfBdyNtXycvJHbmfoBF
	0myuQmLdhpOOuKJTWGy2KIdALmNDv/YFEIq579fs=
Received: by mx.zohomail.com with SMTPS id 1767869485778694.0441057375441;
	Thu, 8 Jan 2026 02:51:25 -0800 (PST)
From: Nicolas Frattaroli <nicolas.frattaroli@collabora.com>
Date: Thu, 08 Jan 2026 11:49:34 +0100
Subject: [PATCH v5 15/24] scsi: ufs: mediatek: Remove
 mediatek,ufs-broken-rtc property
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260108-mt8196-ufs-v5-15-49215157ec41@collabora.com>
References: <20260108-mt8196-ufs-v5-0-49215157ec41@collabora.com>
In-Reply-To: <20260108-mt8196-ufs-v5-0-49215157ec41@collabora.com>
To: Alim Akhtar <alim.akhtar@samsung.com>, 
 Avri Altman <avri.altman@wdc.com>, Bart Van Assche <bvanassche@acm.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 Chunfeng Yun <chunfeng.yun@mediatek.com>, Vinod Koul <vkoul@kernel.org>, 
 Kishon Vijay Abraham I <kishon@kernel.org>, 
 Peter Wang <peter.wang@mediatek.com>, Stanley Jhu <chu.stanley@gmail.com>, 
 "James E.J. Bottomley" <James.Bottomley@HansenPartnership.com>, 
 "Martin K. Petersen" <martin.petersen@oracle.com>, 
 Philipp Zabel <p.zabel@pengutronix.de>, Liam Girdwood <lgirdwood@gmail.com>, 
 Mark Brown <broonie@kernel.org>, Chaotian Jing <Chaotian.Jing@mediatek.com>, 
 Neil Armstrong <neil.armstrong@linaro.org>
Cc: Louis-Alexis Eyraud <louisalexis.eyraud@collabora.com>, 
 kernel@collabora.com, linux-scsi@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, 
 linux-phy@lists.infradead.org, 
 Nicolas Frattaroli <nicolas.frattaroli@collabora.com>
X-Mailer: b4 0.14.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260108_025137_402439_9EE4F85A 
X-CRM114-Status: GOOD (  10.05  )
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

This flag property was never described in the binding, and its
capability wrapper seems pointless.

If one of the MediaTek SoCs needs the ufshcd quirk applied, then this
can be done per-compatible, without needing to give the device tree
author the option to forget to set it.

Remove it and the associated capability flag wrapping code.

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Signed-off-by: Nicolas Frattaroli <nicolas.frattaroli@collabora.com>
---
 drivers/ufs/host/ufs-mediatek.c | 5 -----
 drivers/ufs/host/ufs-mediatek.h | 2 --
 2 files changed, 7 deletions(-)

diff --git a/drivers/ufs/host/ufs-mediatek.c b/drivers/ufs/host/ufs-mediatek.c
index 230e11533eac..424533538b90 100644
--- a/drivers/ufs/host/ufs-mediatek.c
+++ b/drivers/ufs/host/ufs-mediatek.c
@@ -655,9 +655,6 @@ static void ufs_mtk_init_host_caps(struct ufs_hba *hba)
 	if (of_property_read_bool(np, "mediatek,ufs-rtff-mtcmos"))
 		host->caps |= UFS_MTK_CAP_RTFF_MTCMOS;
 
-	if (of_property_read_bool(np, "mediatek,ufs-broken-rtc"))
-		host->caps |= UFS_MTK_CAP_MCQ_BROKEN_RTC;
-
 	dev_info(hba->dev, "caps: 0x%x", host->caps);
 }
 
@@ -1185,8 +1182,6 @@ static int ufs_mtk_init(struct ufs_hba *hba)
 	hba->quirks |= UFSHCI_QUIRK_SKIP_MANUAL_WB_FLUSH_CTRL;
 
 	hba->quirks |= UFSHCD_QUIRK_MCQ_BROKEN_INTR;
-	if (host->caps & UFS_MTK_CAP_MCQ_BROKEN_RTC)
-		hba->quirks |= UFSHCD_QUIRK_MCQ_BROKEN_RTC;
 
 	hba->vps->wb_flush_threshold = UFS_WB_BUF_REMAIN_PERCENT(80);
 
diff --git a/drivers/ufs/host/ufs-mediatek.h b/drivers/ufs/host/ufs-mediatek.h
index 4e6a34f4ac39..9c377745f7a0 100644
--- a/drivers/ufs/host/ufs-mediatek.h
+++ b/drivers/ufs/host/ufs-mediatek.h
@@ -138,8 +138,6 @@ enum ufs_mtk_host_caps {
 	UFS_MTK_CAP_DISABLE_MCQ                = 1 << 8,
 	/* Control MTCMOS with RTFF */
 	UFS_MTK_CAP_RTFF_MTCMOS                = 1 << 9,
-
-	UFS_MTK_CAP_MCQ_BROKEN_RTC             = 1 << 10,
 };
 
 struct ufs_mtk_crypt_cfg {

-- 
2.52.0


