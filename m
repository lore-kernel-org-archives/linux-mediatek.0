Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9C8D9606A321
	for <linux-mediatek@archiver.kernel.org>; Mon, 23 Nov 2026 07:43:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=PEmO9HXs;
	dkim=pass (1024-bit key) header.d=cmss.chinamobile.com header.i=@cmss.chinamobile.com header.a=rsa-sha256 header.s=default header.b=vuq3J68w
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Unsubscribe-Post:List-Owner;
	bh=3s3oA+u0H6a4lKx+c9GboAwYFSdRKDU2CgYddA0tZCg=; b=PEmO9HXsgU2RNKIEgJYwH1oi6n
	thD20al9sVV8IZuEFtCW8L20NGDwxiw+yQNvkYRPMFUvdulXA+UWEi2bhwZ6OZKG+HjvvKcEWT5T5
	AyHVhNYylwlH6VQ3SiDzEF21yt9Zu+gP155g80+NW4pmdtYUFPZ61SOEuGGvTTuG8BPw/OqYa8anl
	uPYrk7yEJEj5GLYsF2AlIcQO0ycRITZWaln99zcx/r2qypP1ViOR5PzwqXpbYOFDz6CtG5Sj+Ppyi
	/QD29YI4Oto409n24DkZw9kxCmb3+zWHeC5a0QFc1gPNhS3fJuWY5zjBj5u6QqpFNxlWsqfsR7IYE
	A8L4FTpA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xVOiQ-00000002Tt4-1bZ0;
	Mon, 23 Nov 2026 07:43:54 +0000
Received: from cmccmta6.chinamobile.com ([111.22.67.139])
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xVOiF-00000002Tqx-07AW;
	Mon, 23 Nov 2026 07:43:51 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=cmss.chinamobile.com; s=default; l=0;
	h=from:subject:message-id:to:cc:mime-version;
	bh=47DEQpj8HBSa+/TImW+5JCeuQeRkm5NMpJWZG3hSuFU=;
	b=vuq3J68woXJgi7jG8hvgDNB5il+19wwqo0VgZtvjuSYTJZ5EDenuKLbRDYiOhzY7hH260UQT9l83s
	 Ry07KWuJELHvSywmc7Vza7naoBg7x/HhS5b6tped1bJi8pcBazzjk3YGfHwyWjFMju6n/iNRxw1DHW
	 5K2BsvFmbXY9By3k=
X-RM-TagInfo: emlType=0                                       
X-RM-SPAM-FLAG: 00000000
Received: from spf.mail.chinamobile.com (unknown[10.188.0.87])
	by rmmx-syy-dmz-app05-12005 (RichMail) with SMTP id 2ee56b03ee9fa36-387e0;
	Mon, 23 Nov 2026 15:43:27 +0800 (CST)
X-RM-TRANSID: 2ee56b03ee9fa36-387e0
X-RM-TagInfo: emlType=0                                       
X-RM-SPAM-FLAG: 00000000
Received: from devin-VMware-Virtual-Platform (unknown[10.55.1.71])
	by rmsmtp-syy-appsvr08-12008 (RichMail) with SMTP id 2ee86b03ee9d78c-f4bec;
	Mon, 23 Nov 2026 15:43:27 +0800 (CST)
X-RM-TRANSID: 2ee86b03ee9d78c-f4bec
From: Zhu Jun <zhujun2@cmss.chinamobile.com>
To: broonie@kernel.org
Cc: lgirdwood@gmail.com,
	matthias.bgg@gmail.com,
	angelogioacchino.delregno@collabora.com,
	kaichieh.chuang@mediatek.com,
	linux-mediatek@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Zhu Jun <zhujun2@cmss.chinamobile.com>
Subject: [PATCH v2] ASoC: mediatek: mt6797: Fix runtime PM handling in probe
Date: Mon, 23 Nov 2026 15:43:25 +0800
Message-ID: <20261123074326.11494-1-zhujun2@cmss.chinamobile.com>
X-Mailer: git-send-email 2.51.0
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261122_234344_984931_AFBBF342 
X-CRM114-Status: GOOD (  11.06  )
X-Spam-Score: -2.4 (--)
X-BeenThere: linux-mediatek@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-mediatek.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-mediatek/>
List-Post: <mailto:linux-mediatek@lists.infradead.org>
List-Help: <mailto:linux-mediatek-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mediatek>,
 <mailto:linux-mediatek-request@lists.infradead.org?subject=subscribe>
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
X-Spam-Status: No, score=-16.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

The MT6797 AFE probe registers its components even when the runtime
resume fails to enable the clocks. If component registration fails
after a successful resume, the probe disables runtime PM while still
holding its usage reference. The runtime PM disabled path also
returns the previous successful result without registering components.

Use pm_runtime_resume_and_get() and stop on a resume error. On a
component registration failure, drop the probe's reference without
idling, disable runtime PM and directly suspend the AFE if it is still
active. This ensures the clocks are disabled even if userspace forces
power/control to on or a resume races with probe cleanup.

Keep failures before a successful resume on a disable-only path so
cleanup does not disable clocks that were never enabled. Return an
error when runtime PM is unavailable.

Fixes: 3901b9fc0f0d ("ASoC: mt6797: add mt6797 platform driver")
Signed-off-by: Zhu Jun <zhujun2@cmss.chinamobile.com>
---
 sound/soc/mediatek/mt6797/mt6797-afe-pcm.c | 21 +++++++++++++++++----
 1 file changed, 17 insertions(+), 4 deletions(-)

diff --git a/sound/soc/mediatek/mt6797/mt6797-afe-pcm.c b/sound/soc/mediatek/mt6797/mt6797-afe-pcm.c
index 2069c340ca39..cbe7c3a2eedb 100644
--- a/sound/soc/mediatek/mt6797/mt6797-afe-pcm.c
+++ b/sound/soc/mediatek/mt6797/mt6797-afe-pcm.c
@@ -828,16 +828,21 @@ static int mt6797_afe_pcm_dev_probe(struct platform_device *pdev)
 	platform_set_drvdata(pdev, afe);
 
 	pm_runtime_enable(dev);
-	if (!pm_runtime_enabled(dev))
+	if (!pm_runtime_enabled(dev)) {
+		ret = -EOPNOTSUPP;
+		goto err_pm_disable;
+	}
+
+	ret = pm_runtime_resume_and_get(dev);
+	if (ret)
 		goto err_pm_disable;
-	pm_runtime_get_sync(&pdev->dev);
 
 	/* register component */
 	ret = devm_snd_soc_register_component(dev, &mtk_afe_pcm_platform,
 					      NULL, 0);
 	if (ret) {
 		dev_warn(dev, "err_platform\n");
-		goto err_pm_disable;
+		goto err_pm_put;
 	}
 
 	ret = devm_snd_soc_register_component(afe->dev,
@@ -846,11 +851,19 @@ static int mt6797_afe_pcm_dev_probe(struct platform_device *pdev)
 				     afe->num_dai_drivers);
 	if (ret) {
 		dev_warn(dev, "err_dai_component\n");
-		goto err_pm_disable;
+		goto err_pm_put;
 	}
 
 	return 0;
 
+err_pm_put:
+	pm_runtime_put_noidle(dev);
+	pm_runtime_disable(dev);
+	if (!pm_runtime_status_suspended(dev))
+		mt6797_afe_runtime_suspend(dev);
+
+	return ret;
+
 err_pm_disable:
 	pm_runtime_disable(dev);
 
-- 
2.51.0




