Return-Path: <SRS0=sDSL=4F=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,INCLUDES_PATCH,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5DF25C3402A
	for <linux-mediatek@archiver.kernel.org>; Mon, 17 Feb 2020 22:04:34 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 30BB520836
	for <linux-mediatek@archiver.kernel.org>; Mon, 17 Feb 2020 22:04:34 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="HCub/+vg"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 30BB520836
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Message-Id:
	In-Reply-To:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	References:List-Owner; bh=c8g9UEenuNrPB1imTYx1pck6sTOcy04zBuMfax6oy70=; b=HCu
	b/+vgZVE8XLAR9p4xn6LQ55QWq95kzP0ISoLkwHOmsYdeAnypTxQbXhXxfnNG8gw939YxfYHWsSx/
	zp9pHM19kiaPGZSQgHVr18/VnXDeJ4GHN5+faiAwhgZdCckRT+7BFOo3DBk2kF2jeRtmDDAPliK7A
	N7fpPrE8uP2SGFUlPfV8JJ9qUIosGCxjK7i2R1I5QZozYra7tpfmskuOBwq4I6K7wv6IFGvFHGgwR
	wrT0IT4sHZx93ne5te4NAtqKSfdMhPOnpziOjmNtueMiPoeteBFX0W5hvhgssBeWO192JNOlEahH6
	g7c2kMJMeLiyL/Qimk5qZwE205Nw7rg==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1j3oV8-000680-6C; Mon, 17 Feb 2020 22:04:26 +0000
Received: from foss.arm.com ([217.140.110.172])
 by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
 id 1j3oUi-0005Xb-OC; Mon, 17 Feb 2020 22:04:02 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id EC783106F;
 Mon, 17 Feb 2020 14:03:59 -0800 (PST)
Received: from localhost (unknown [10.37.6.21])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 6F72E3F703;
 Mon, 17 Feb 2020 14:03:59 -0800 (PST)
Date: Mon, 17 Feb 2020 22:03:57 +0000
From: Mark Brown <broonie@kernel.org>
To: Tzung-Bi Shih <tzungbi@google.com>
Subject: Applied "drm/mediatek: fix race condition for HDMI jack status
 reporting" to the asoc tree
In-Reply-To: <20200217105513.2.I477092c2f104fd589133436c3ae4590e6fc6323b@changeid>
Message-Id: <applied-20200217105513.2.I477092c2f104fd589133436c3ae4590e6fc6323b@changeid>
X-Patchwork-Hint: ignore
X-Bad-Reply: In-Reply-To but no 'Re:' in Subject.
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200217_140400_897588_03422343 
X-CRM114-Status: GOOD (  16.92  )
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
Cc: alsa-devel@alsa-project.org, cychiang@google.com, tzungbi@google.com,
 airlied@linux.ie, dri-devel@lists.freedesktop.org, matthias.bgg@gmail.com,
 Mark Brown <broonie@kernel.org>, linux-mediatek@lists.infradead.org,
 daniel@ffwll.ch, ck.hu@mediatek.com, p.zabel@pengutronix.de, dgreid@google.com,
 linux-arm-kernel@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

The patch

   drm/mediatek: fix race condition for HDMI jack status reporting

has been applied to the asoc tree at

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git 

All being well this means that it will be integrated into the linux-next
tree (usually sometime in the next 24 hours) and sent to Linus during
the next merge window (or sooner if it is a bug fix), however if
problems are discovered then the patch may be dropped or reverted.  

You may get further e-mails resulting from automated or manual testing
and review of the tree, please engage with people reporting problems and
send followup patches addressing any issues that are reported if needed.

If any updates are required or you are submitting further changes they
should be sent as incremental updates against current git, existing
patches will not be replaced.

Please add any relevant lists and maintainers to the CCs when replying
to this mail.

Thanks,
Mark

From f07980d4ed60fbb35857b655c94b111f4ddf2abf Mon Sep 17 00:00:00 2001
From: Tzung-Bi Shih <tzungbi@google.com>
Date: Mon, 17 Feb 2020 11:16:53 +0800
Subject: [PATCH] drm/mediatek: fix race condition for HDMI jack status
 reporting

hdmi_conn_detect and mtk_hdmi_audio_hook_plugged_cb would be called
by different threads.

Imaging the following calling sequence:
           Thread A                            Thread B
--------------------------------------------------------------------
mtk_hdmi_audio_hook_plugged_cb()
mtk_cec_hpd_high() -> disconnected
                                     hdmi_conn_detect()
                                     mtk_cec_hpd_high() -> connected
                                     plugged_cb(connected)
plugged_cb(disconnected)

The latest disconnected is false reported.  Makes mtk_cec_hpd_high
and plugged_cb atomic to fix.

Also uses the same lock to protect read/write of plugged_cb and codec_dev.

Fixes: 5d3c64477392 ("drm/mediatek: support HDMI jack status reporting")
Signed-off-by: Tzung-Bi Shih <tzungbi@google.com>
Acked-by: CK Hu <ck.hu@mediatek.com>
Link: https://lore.kernel.org/r/20200217105513.2.I477092c2f104fd589133436c3ae4590e6fc6323b@changeid
Signed-off-by: Mark Brown <broonie@kernel.org>
---
 drivers/gpu/drm/mediatek/mtk_hdmi.c | 11 ++++++++++-
 1 file changed, 10 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/mediatek/mtk_hdmi.c b/drivers/gpu/drm/mediatek/mtk_hdmi.c
index 03aeb73005ef..d80017e3d84a 100644
--- a/drivers/gpu/drm/mediatek/mtk_hdmi.c
+++ b/drivers/gpu/drm/mediatek/mtk_hdmi.c
@@ -12,6 +12,7 @@
 #include <linux/io.h>
 #include <linux/kernel.h>
 #include <linux/mfd/syscon.h>
+#include <linux/mutex.h>
 #include <linux/of_platform.h>
 #include <linux/of.h>
 #include <linux/of_gpio.h>
@@ -171,6 +172,7 @@ struct mtk_hdmi {
 	bool enabled;
 	hdmi_codec_plugged_cb plugged_cb;
 	struct device *codec_dev;
+	struct mutex update_plugged_status_lock;
 };
 
 static inline struct mtk_hdmi *hdmi_ctx_from_bridge(struct drm_bridge *b)
@@ -1199,10 +1201,13 @@ static void mtk_hdmi_clk_disable_audio(struct mtk_hdmi *hdmi)
 static enum drm_connector_status
 mtk_hdmi_update_plugged_status(struct mtk_hdmi *hdmi)
 {
-	bool connected = mtk_cec_hpd_high(hdmi->cec_dev);
+	bool connected;
 
+	mutex_lock(&hdmi->update_plugged_status_lock);
+	connected = mtk_cec_hpd_high(hdmi->cec_dev);
 	if (hdmi->plugged_cb && hdmi->codec_dev)
 		hdmi->plugged_cb(hdmi->codec_dev, connected);
+	mutex_unlock(&hdmi->update_plugged_status_lock);
 
 	return connected ?
 	       connector_status_connected : connector_status_disconnected;
@@ -1669,8 +1674,11 @@ static int mtk_hdmi_audio_hook_plugged_cb(struct device *dev, void *data,
 {
 	struct mtk_hdmi *hdmi = data;
 
+	mutex_lock(&hdmi->update_plugged_status_lock);
 	hdmi->plugged_cb = fn;
 	hdmi->codec_dev = codec_dev;
+	mutex_unlock(&hdmi->update_plugged_status_lock);
+
 	mtk_hdmi_update_plugged_status(hdmi);
 
 	return 0;
@@ -1729,6 +1737,7 @@ static int mtk_drm_hdmi_probe(struct platform_device *pdev)
 		return ret;
 	}
 
+	mutex_init(&hdmi->update_plugged_status_lock);
 	platform_set_drvdata(pdev, hdmi);
 
 	ret = mtk_hdmi_output_init(hdmi);
-- 
2.20.1


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
