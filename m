Return-Path: <SRS0=0J5R=7B=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,USER_AGENT_GIT
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9F530C433DF
	for <linux-mediatek@archiver.kernel.org>; Tue, 19 May 2020 09:41:12 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 61413207D8
	for <linux-mediatek@archiver.kernel.org>; Tue, 19 May 2020 09:41:12 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="uUHspZVR"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 61413207D8
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=collabora.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:To
	:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=S22EuEZ/GaOv9bTJPBc3zNUj1qS0GHipoyYSVCq2YKg=; b=uUHspZVRyBmg2A
	U8Vo6/c7QIIaKREalyvwg5YByjbSps562hthpbcC9DkUOLn38vJHWLvNBqsQ/SNruVqOMpeAwpqe4
	nHosmR1gHBaKKOb+KGamIORlos4/Pv9vxOxOZ4sbKgMCVln1U3JO8tlF2s4TSLrn77vcQKlth918V
	uJGNOFkfx0baZDx26OwN96yF7p65NmZxbVtjTDnoSSF62nAaYy/sLslT12qQ/kp8SlE5D7yK5j/qW
	a6yYwxuXP1EvBUE6dd5t19Zzitcoe7whHswKgmslli4Xn0mK7z6Ykg+ygvY/1Xh8fY6X8Ojut6z6H
	EgY3MRq+GJXoQHlJf2ag==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jaykD-0004KE-Vt; Tue, 19 May 2020 09:41:05 +0000
Received: from bhuna.collabora.co.uk ([46.235.227.227])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jayk4-0004Au-7m; Tue, 19 May 2020 09:40:57 +0000
Received: from [127.0.0.1] (localhost [127.0.0.1])
 (Authenticated sender: eballetbo) with ESMTPSA id C65332A03BE
From: Enric Balletbo i Serra <enric.balletbo@collabora.com>
To: linux-kernel@vger.kernel.org
Subject: [PATCH] drm/mediatek: mtk_mt8173_hdmi_phy: Remove unnused const
 variables
Date: Tue, 19 May 2020 11:40:45 +0200
Message-Id: <20200519094045.2447940-1-enric.balletbo@collabora.com>
X-Mailer: git-send-email 2.26.2
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200519_024056_406687_9AC8C852 
X-CRM114-Status: UNSURE (   7.18  )
X-CRM114-Notice: Please train this message.
X-BeenThere: linux-mediatek@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <linux-mediatek.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mediatek>, 
 <mailto:linux-mediatek-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mediatek/>
List-Post: <mailto:linux-mediatek@lists.infradead.org>
List-Help: <mailto:linux-mediatek-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mediatek>, 
 <mailto:linux-mediatek-request@lists.infradead.org?subject=subscribe>
Cc: Chun-Kuang Hu <chunkuang.hu@kernel.org>, drinkcat@chromium.org,
 Philipp Zabel <p.zabel@pengutronix.de>, David Airlie <airlied@linux.ie>,
 dri-devel@lists.freedesktop.org, linux-mediatek@lists.infradead.org,
 Daniel Vetter <daniel@ffwll.ch>, hsinyi@chromium.org, matthias.bgg@gmail.com,
 Collabora Kernel ML <kernel@collabora.com>,
 linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

There are some `static const u8` variables that are not used, this
triggers a warning building with `make W=1`, it is safe to remove them,
so do it and make the compiler more happy.

Signed-off-by: Enric Balletbo i Serra <enric.balletbo@collabora.com>
---

 .../gpu/drm/mediatek/mtk_mt8173_hdmi_phy.c    | 48 -------------------
 1 file changed, 48 deletions(-)

diff --git a/drivers/gpu/drm/mediatek/mtk_mt8173_hdmi_phy.c b/drivers/gpu/drm/mediatek/mtk_mt8173_hdmi_phy.c
index 1c3575372230..827b93786fac 100644
--- a/drivers/gpu/drm/mediatek/mtk_mt8173_hdmi_phy.c
+++ b/drivers/gpu/drm/mediatek/mtk_mt8173_hdmi_phy.c
@@ -107,54 +107,6 @@
 #define RGS_HDMITX_5T1_EDG		(0xf << 4)
 #define RGS_HDMITX_PLUG_TST		BIT(0)
 
-static const u8 PREDIV[3][4] = {
-	{0x0, 0x0, 0x0, 0x0},	/* 27Mhz */
-	{0x1, 0x1, 0x1, 0x1},	/* 74Mhz */
-	{0x1, 0x1, 0x1, 0x1}	/* 148Mhz */
-};
-
-static const u8 TXDIV[3][4] = {
-	{0x3, 0x3, 0x3, 0x2},	/* 27Mhz */
-	{0x2, 0x1, 0x1, 0x1},	/* 74Mhz */
-	{0x1, 0x0, 0x0, 0x0}	/* 148Mhz */
-};
-
-static const u8 FBKSEL[3][4] = {
-	{0x1, 0x1, 0x1, 0x1},	/* 27Mhz */
-	{0x1, 0x0, 0x1, 0x1},	/* 74Mhz */
-	{0x1, 0x0, 0x1, 0x1}	/* 148Mhz */
-};
-
-static const u8 FBKDIV[3][4] = {
-	{19, 24, 29, 19},	/* 27Mhz */
-	{19, 24, 14, 19},	/* 74Mhz */
-	{19, 24, 14, 19}	/* 148Mhz */
-};
-
-static const u8 DIVEN[3][4] = {
-	{0x2, 0x1, 0x1, 0x2},	/* 27Mhz */
-	{0x2, 0x2, 0x2, 0x2},	/* 74Mhz */
-	{0x2, 0x2, 0x2, 0x2}	/* 148Mhz */
-};
-
-static const u8 HTPLLBP[3][4] = {
-	{0xc, 0xc, 0x8, 0xc},	/* 27Mhz */
-	{0xc, 0xf, 0xf, 0xc},	/* 74Mhz */
-	{0xc, 0xf, 0xf, 0xc}	/* 148Mhz */
-};
-
-static const u8 HTPLLBC[3][4] = {
-	{0x2, 0x3, 0x3, 0x2},	/* 27Mhz */
-	{0x2, 0x3, 0x3, 0x2},	/* 74Mhz */
-	{0x2, 0x3, 0x3, 0x2}	/* 148Mhz */
-};
-
-static const u8 HTPLLBR[3][4] = {
-	{0x1, 0x1, 0x0, 0x1},	/* 27Mhz */
-	{0x1, 0x2, 0x2, 0x1},	/* 74Mhz */
-	{0x1, 0x2, 0x2, 0x1}	/* 148Mhz */
-};
-
 static int mtk_hdmi_pll_prepare(struct clk_hw *hw)
 {
 	struct mtk_hdmi_phy *hdmi_phy = to_mtk_hdmi_phy(hw);
-- 
2.26.2


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
