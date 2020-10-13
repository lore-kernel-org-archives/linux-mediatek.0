Return-Path: <SRS0=564r=DU=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 465A4C433DF
	for <linux-mediatek@archiver.kernel.org>; Tue, 13 Oct 2020 08:55:45 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 7C0FA208D5
	for <linux-mediatek@archiver.kernel.org>; Tue, 13 Oct 2020 08:55:44 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="Rmp3lC8r"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 7C0FA208D5
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=vivo.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=pRA9K35Gp8vD4yQ8JKKjHZeebVDYlSLxE8FNjXBdc0U=; b=Rmp3lC8rzzA/sAOu+mA7o04fs+
	by4ftmbNyaCnTnpLIoNCWpWFuFAOiN1zR6RYU4/4fiNA/T/pyTEc48xr7YKUkifUbV7HjQxnTYTqY
	GBHFZEShp9p1cch7sqRY+91vJNsp+feoitBRhO+864RHopcKW4gSNvTbTCiEjaLXjTZW6MAMH2NWs
	XX4js4j6c/2SinAjUYtvSpMW/xOhg0ZeMzgEIhmFg1bhLMJeiOQWU6MkJHMOkr2Q/x41pjQqrKFLB
	J7Uq82WuxtZ6ANYIlGl29i1yHpECulhDAHdjloUUPglCQ/r6xc0ITwzdXYzrGJTGdubysA5kXB9IM
	MzTk9zIA==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kSG5n-0001eD-RT; Tue, 13 Oct 2020 08:55:35 +0000
Received: from mail-m17613.qiye.163.com ([59.111.176.13])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kSG5i-0001d2-FV
 for linux-mediatek@lists.infradead.org; Tue, 13 Oct 2020 08:55:33 +0000
Received: from ubuntu.localdomain (unknown [157.0.31.124])
 by mail-m17613.qiye.163.com (Hmail) with ESMTPA id 4D4B948295F;
 Tue, 13 Oct 2020 16:55:19 +0800 (CST)
From: Bernard Zhao <bernard@vivo.com>
To: Chun-Kuang Hu <chunkuang.hu@kernel.org>,
 Philipp Zabel <p.zabel@pengutronix.de>, David Airlie <airlied@linux.ie>,
 Daniel Vetter <daniel@ffwll.ch>, Matthias Brugger <matthias.bgg@gmail.com>,
 dri-devel@lists.freedesktop.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: [PATCH] drm/mediatek: Optimize functions which do not need to return
Date: Tue, 13 Oct 2020 01:55:12 -0700
Message-Id: <20201013085512.12857-1-bernard@vivo.com>
X-Mailer: git-send-email 2.28.0
MIME-Version: 1.0
X-HM-Spam-Status: e1kfGhgUHx5ZQUtXWQgYFAkeWUFZS1VLWVdZKFlBSE83V1ktWUFJV1kPCR
 oVCBIfWUFZTEwYTB9PS0tDGkxJVkpNS0lOTEJISkJOTE5VEwETFhoSFyQUDg9ZV1kWGg8SFR0UWU
 FZT0tIVUpKS0hKTFVLWQY+
X-HM-Sender-Digest: e1kMHhlZQR0aFwgeV1kSHx4VD1lBWUc6NRQ6PBw5Lj8sSjhMGjMXEUIh
 LjkaChNVSlVKTUtJTkxCSElLS0lJVTMWGhIXVRkeCRUaCR87DRINFFUYFBZFWVdZEgtZQVlKTkxV
 S1VISlVKSU9ZV1kIAVlBT09LSjcG
X-HM-Tid: 0a75212bcacc93bakuws4d4b948295f
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201013_045532_590558_07719012 
X-CRM114-Status: GOOD (  10.30  )
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
Cc: opensource.kernel@vivo.com, Bernard Zhao <bernard@vivo.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

Function mtk_hdmi_aud_set_input always return 0, no need to
keep the return value. Functions mtk_hdmi_aud_enable_packet &
mtk_hdmi_aud_on_off_hw_ncts are the same, these two functions
just call next functions. Maybe it`s a bit better to just call
the inner function.

Signed-off-by: Bernard Zhao <bernard@vivo.com>
---
 drivers/gpu/drm/mediatek/mtk_hdmi.c | 27 +++++++--------------------
 1 file changed, 7 insertions(+), 20 deletions(-)

diff --git a/drivers/gpu/drm/mediatek/mtk_hdmi.c b/drivers/gpu/drm/mediatek/mtk_hdmi.c
index a97725680d4e..f1d987df0550 100644
--- a/drivers/gpu/drm/mediatek/mtk_hdmi.c
+++ b/drivers/gpu/drm/mediatek/mtk_hdmi.c
@@ -870,19 +870,8 @@ static void mtk_hdmi_video_set_display_mode(struct mtk_hdmi *hdmi,
 	mtk_hdmi_hw_msic_setting(hdmi, mode);
 }
 
-static int mtk_hdmi_aud_enable_packet(struct mtk_hdmi *hdmi, bool enable)
-{
-	mtk_hdmi_hw_send_aud_packet(hdmi, enable);
-	return 0;
-}
 
-static int mtk_hdmi_aud_on_off_hw_ncts(struct mtk_hdmi *hdmi, bool on)
-{
-	mtk_hdmi_hw_ncts_enable(hdmi, on);
-	return 0;
-}
-
-static int mtk_hdmi_aud_set_input(struct mtk_hdmi *hdmi)
+static void mtk_hdmi_aud_set_input(struct mtk_hdmi *hdmi)
 {
 	enum hdmi_aud_channel_type chan_type;
 	u8 chan_count;
@@ -912,8 +901,6 @@ static int mtk_hdmi_aud_set_input(struct mtk_hdmi *hdmi)
 	chan_count = mtk_hdmi_aud_get_chnl_count(chan_type);
 	mtk_hdmi_hw_aud_set_i2s_chan_num(hdmi, chan_type, chan_count);
 	mtk_hdmi_hw_aud_set_input_type(hdmi, hdmi->aud_param.aud_input_type);
-
-	return 0;
 }
 
 static int mtk_hdmi_aud_set_src(struct mtk_hdmi *hdmi,
@@ -921,7 +908,7 @@ static int mtk_hdmi_aud_set_src(struct mtk_hdmi *hdmi,
 {
 	unsigned int sample_rate = hdmi->aud_param.codec_params.sample_rate;
 
-	mtk_hdmi_aud_on_off_hw_ncts(hdmi, false);
+	mtk_hdmi_hw_ncts_enable(hdmi, false);
 	mtk_hdmi_hw_aud_src_disable(hdmi);
 	mtk_hdmi_clear_bits(hdmi, GRL_CFG2, CFG2_ACLK_INV);
 
@@ -959,7 +946,7 @@ static int mtk_hdmi_aud_output_config(struct mtk_hdmi *hdmi,
 				      struct drm_display_mode *display_mode)
 {
 	mtk_hdmi_hw_aud_mute(hdmi);
-	mtk_hdmi_aud_enable_packet(hdmi, false);
+	mtk_hdmi_hw_send_aud_packet(hdmi, false);
 
 	mtk_hdmi_aud_set_input(hdmi);
 	mtk_hdmi_aud_set_src(hdmi, display_mode);
@@ -968,8 +955,8 @@ static int mtk_hdmi_aud_output_config(struct mtk_hdmi *hdmi,
 
 	usleep_range(50, 100);
 
-	mtk_hdmi_aud_on_off_hw_ncts(hdmi, true);
-	mtk_hdmi_aud_enable_packet(hdmi, true);
+	mtk_hdmi_hw_ncts_enable(hdmi, true);
+	mtk_hdmi_hw_send_aud_packet(hdmi, true);
 	mtk_hdmi_hw_aud_unmute(hdmi);
 	return 0;
 }
@@ -1097,13 +1084,13 @@ static int mtk_hdmi_output_init(struct mtk_hdmi *hdmi)
 
 static void mtk_hdmi_audio_enable(struct mtk_hdmi *hdmi)
 {
-	mtk_hdmi_aud_enable_packet(hdmi, true);
+	mtk_hdmi_hw_send_aud_packet(hdmi, true);
 	hdmi->audio_enable = true;
 }
 
 static void mtk_hdmi_audio_disable(struct mtk_hdmi *hdmi)
 {
-	mtk_hdmi_aud_enable_packet(hdmi, false);
+	mtk_hdmi_hw_send_aud_packet(hdmi, false);
 	hdmi->audio_enable = false;
 }
 
-- 
2.28.0


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
