Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BBD86E6ADC5
	for <linux-mediatek@archiver.kernel.org>; Mon, 22 Dec 2025 20:38:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=7yDDh11SanuErCPDyP++RlnzB0pdnbW9EeqbEVC9sdM=; b=IQZdoUd9E8orkJAMVX2/C5DWPt
	HEr2IrEi44rAqZ7TBSTXZ62dQflAezd+QyEV3+UvRgh3rxWsp1p2jFzDVLsqbmPquathvzccxnZAI
	ODnHsRUmAztboTbBZBmwCd0RnVVq7yqNetbOlZ4y2c4F5jBG/HiYdk2Ou9qqVX9h0i5vO+L8mJ+/y
	eC4WmwHMWxvUU11GjTeu/Dc0md4FoOvfvRhxrAnQvc6mX6rmm0gTu93ra7MVTUrli/XVpSdsv/+sX
	sDb2Ul24dDGZE08A2mI+VJWflc9apc4hzMY0xbiwJVkuod4UDe181vduX1tE7tsnvZRtrx3h5kwpu
	4VPfq6kg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vXmfI-0000000E98c-2CRo;
	Mon, 22 Dec 2025 20:38:00 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vXmfG-0000000E98E-2vjm
	for linux-mediatek@lists.infradead.org;
	Mon, 22 Dec 2025 20:37:59 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id B17DA4384A;
	Mon, 22 Dec 2025 20:37:57 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 997FCC116D0;
	Mon, 22 Dec 2025 20:37:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1766435877;
	bh=QvJ1CW2dTGSVQI9v1hkF14kO+wZVUTltwp45UZxtMDc=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=X1diPkQWUD8viHi49Bj+t7AL3mo311LJJ0cqvIEZddRz7YYFXsFTenawWyC6fLyXW
	 ViUwKvu2DMUbe+E6kt/2DYz2KZ12ieBkB8un3TqtyWegmi9ftTIvdlnvH4ixnprDKB
	 BZK4h6lUKklET0HCNW93DYSyhN94AWwrgjDqY2AcLeDju/9kIa+BQNO8/hUMzOCrwB
	 vo+keM3wp+mEioOmmQnsRANL66xi7zlvmh6BJ1H9kXmRbKaMuRgzLnEulsZCWQciZt
	 j3euIabD1LY0/ylYkQHJ2Fh2QeAJR/ps2sTC7U4ouNRdqqZ6DeJJtya7BR7AWtZkNr
	 PF/bouE5g9b8g==
From: "Rafael J. Wysocki" <rafael@kernel.org>
To: Linux PM <linux-pm@vger.kernel.org>
Cc: LKML <linux-kernel@vger.kernel.org>, Ulf Hansson <ulf.hansson@linaro.org>,
 Brian Norris <briannorris@chromium.org>,
 Tiffany Lin <tiffany.lin@mediatek.com>,
 Andrew-CT Chen <andrew-ct.chen@mediatek.com>,
 Yunfei Dong <yunfei.dong@mediatek.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 linux-media@vger.kernel.org, linux-mediatek@lists.infradead.org
Subject: [PATCH v1 07/23] media: mediatek: vcodec: Discard pm_runtime_put() return
 value
Date: Mon, 22 Dec 2025 21:06:16 +0100
Message-ID: <3690736.iIbC2pHGDl@rafael.j.wysocki>
Organization: Linux Kernel Development
In-Reply-To: <6245770.lOV4Wx5bFT@rafael.j.wysocki>
References: <6245770.lOV4Wx5bFT@rafael.j.wysocki>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251222_123758_783391_17548E06 
X-CRM114-Status: GOOD (  14.04  )
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

From: Rafael J. Wysocki <rafael.j.wysocki@intel.com>

Printing error messages on pm_runtime_put() returning negative values
is not particularly useful.

Returning an error code from pm_runtime_put() merely means that it has
not queued up a work item to check whether or not the device can be
suspended and there are many perfectly valid situations in which that
can happen, like after writing "on" to the devices' runtime PM "control"
attribute in sysfs for one example.

Accordingly, update mtk_vcodec_enc_pw_off() and mtk_vcodec_dec_pw_off()
to simply discard the return value of pm_runtime_put().

This will facilitate a planned change of the pm_runtime_put() return
type to void in the future.

Signed-off-by: Rafael J. Wysocki <rafael.j.wysocki@intel.com>
---

This patch is part of a series, but it doesn't depend on anything else
in that series.  The last patch in the series depends on it.

It can be applied by itself and if you decide to do so, please let me
know.

Otherwise, an ACK or equivalent will be appreciated, but also the lack
of specific criticism will be eventually regarded as consent.

---
 drivers/media/platform/mediatek/vcodec/decoder/mtk_vcodec_dec_pm.c |    6 +-----
 drivers/media/platform/mediatek/vcodec/encoder/mtk_vcodec_enc_pm.c |    6 +-----
 2 files changed, 2 insertions(+), 10 deletions(-)

--- a/drivers/media/platform/mediatek/vcodec/decoder/mtk_vcodec_dec_pm.c
+++ b/drivers/media/platform/mediatek/vcodec/decoder/mtk_vcodec_dec_pm.c
@@ -67,11 +67,7 @@ static int mtk_vcodec_dec_pw_on(struct m
 
 static void mtk_vcodec_dec_pw_off(struct mtk_vcodec_pm *pm)
 {
-	int ret;
-
-	ret = pm_runtime_put(pm->dev);
-	if (ret && ret != -EAGAIN)
-		dev_err(pm->dev, "pm_runtime_put fail %d", ret);
+	pm_runtime_put(pm->dev);
 }
 
 static void mtk_vcodec_dec_clock_on(struct mtk_vcodec_pm *pm)
--- a/drivers/media/platform/mediatek/vcodec/encoder/mtk_vcodec_enc_pm.c
+++ b/drivers/media/platform/mediatek/vcodec/encoder/mtk_vcodec_enc_pm.c
@@ -71,11 +71,7 @@ int mtk_vcodec_enc_pw_on(struct mtk_vcod
 
 void mtk_vcodec_enc_pw_off(struct mtk_vcodec_pm *pm)
 {
-	int ret;
-
-	ret = pm_runtime_put(pm->dev);
-	if (ret && ret != -EAGAIN)
-		dev_err(pm->dev, "pm_runtime_put fail %d", ret);
+	pm_runtime_put(pm->dev);
 }
 
 void mtk_vcodec_enc_clock_on(struct mtk_vcodec_pm *pm)




