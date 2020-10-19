Return-Path: <SRS0=Vpwr=D2=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,
	UNWANTED_LANGUAGE_BODY,URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 79301C433E7
	for <linux-mediatek@archiver.kernel.org>; Mon, 19 Oct 2020 14:08:19 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id E69F022263
	for <linux-mediatek@archiver.kernel.org>; Mon, 19 Oct 2020 14:08:18 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="k/xUluwv";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=baylibre-com.20150623.gappssmtp.com header.i=@baylibre-com.20150623.gappssmtp.com header.b="My2XOU4M"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org E69F022263
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-Id:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=xCE9UYJq04VQfC3BtKsx9l4iqgWMEPOxA/mxs1sqqyE=; b=k/xUluwv2xrRxJqVTidmpj52a
	jHUCEsYRVSgM1D5S3O0B3xzYuhD9t4yuwve6uxaWNJnY59uxVyshlNnCUE9Fsg8ObZTXKOwSu3zty
	u+4E7ddTMjbdjfE1DzacJVyjn64NVtAiZ9XSRRbdPGlN17jyRGqkKtchUdIzdYM/WHnUB3tA7bDqR
	GHDwu+bbUQkI3Onuqi/w3+V/wMvH4PDbSXWlI9EJSrrHEaiHHZUFfiQq+D1wZaIjMI3m3A181p2js
	DpqnWY53dlzClcZxNPtc1Demy9yosa1RYuhfcC6FLGWalMm+gR2V/n7F/rKix2eYBc0hjtbFkdi+f
	NOx1Z6qxA==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kUVpX-0004d8-Is; Mon, 19 Oct 2020 14:08:07 +0000
Received: from mail-wm1-x342.google.com ([2a00:1450:4864:20::342])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kUVoi-0004FY-P7
 for linux-mediatek@lists.infradead.org; Mon, 19 Oct 2020 14:07:20 +0000
Received: by mail-wm1-x342.google.com with SMTP id k18so13021830wmj.5
 for <linux-mediatek@lists.infradead.org>; Mon, 19 Oct 2020 07:07:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=D3Li+sQUwDiy01vgvmIIRdUEc3y1uDj2ZfggKxaTpm0=;
 b=My2XOU4Mc8Cjt3OIle3OjrmpttFQr8rNVInWtvQtF+8kSYnHcmu2f2TFy0T7sTUTzJ
 r5Q/sMW0rTXS2e9tnAQbRnMZAFFvAutWsJuGbZcljXuF94Pq6s4NmiLXygDZvVfraUYT
 FXtY8tj/QWjkupNCk1YGt8AzHU6Do+owEM5yC+ywMTb45HOziqqGDd5vDuVJlT2RIqLj
 GvWGx+tWNSz8801aG5t7p6mHKDO6sjrknJzEjg27MCQ6aWlhSUzn9TNNB2NWiiqLjmdf
 y0UjJbLvZYAWGUHdXzzOnaB/CHmOZTbi2XiZ4KwD2ZMpTxVwIV1AaOlKxDm4qF2DT35A
 ZktQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=D3Li+sQUwDiy01vgvmIIRdUEc3y1uDj2ZfggKxaTpm0=;
 b=OTQLmafK6xOIZ4z8VYXnjJSaDGK3ufxJLwwkEE7dDWIf044SIcToDMu/gDWgkk7wxG
 xwmwYnNk+19lOz9CVAAm2Dz0GDIm7nzMK7ju71pDzKjfJJMxUnsJp/Ie1xLNBfMJzr98
 mw8D0jnozmjdR9QSaob9pDYddI5+K6C4No7R4UDBeS9SxpNpBJbvU3XfNH9Y4zlltJSb
 gEFJLTJfz0Tk0KhMFp3zc8CFfGUsP0udMFSBSkeI4LYwUTI6lHWuB4RZ5kJOm0+WQd5v
 WOIWqqTfd1lACrq5f3FCaPY+Qp7J7bungq7PIWDuyafN899hZTN8ZXpZhGfTLsxyI5d/
 w+Hg==
X-Gm-Message-State: AOAM533OCFDLrf/xSbzrX09wJ43R9qj4Fu0zJgoG5Nln+TBOH9iHzQVJ
 b2tQhOne5zJ3r9a81MMlfTYXKCA2Xsp3gQ==
X-Google-Smtp-Source: ABdhPJxTtRwa45FbRqYGWLXbhD/Wmp3nnFk48uFyq7/Acm7NbdVSp0yBk/ZY5MwmW5FwS/KYQkZoBw==
X-Received: by 2002:a7b:c242:: with SMTP id b2mr3032645wmj.25.1603116434905;
 Mon, 19 Oct 2020 07:07:14 -0700 (PDT)
Received: from localhost.localdomain (26.167.185.81.rev.sfr.net.
 [81.185.167.26])
 by smtp.gmail.com with ESMTPSA id a3sm114182wmb.46.2020.10.19.07.07.13
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 19 Oct 2020 07:07:14 -0700 (PDT)
From: Fabien Parent <fparent@baylibre.com>
To: linux-mediatek@lists.infradead.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
 linux-pwm@vger.kernel.org
Subject: [PATCH 3/5] pwm: pwm-mediatek: Add MT8183 SoC support
Date: Mon, 19 Oct 2020 16:07:03 +0200
Message-Id: <20201019140705.1518822-4-fparent@baylibre.com>
X-Mailer: git-send-email 2.28.0
In-Reply-To: <20201019140705.1518822-1-fparent@baylibre.com>
References: <20201019140705.1518822-1-fparent@baylibre.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201019_100717_760761_1A237E43 
X-CRM114-Status: GOOD (  12.46  )
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
Cc: robh+dt@kernel.org, Fabien Parent <fparent@baylibre.com>,
 thierry.reding@gmail.com, u.kleine-koenig@pengutronix.de,
 matthias.bgg@gmail.com, lee.jones@linaro.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

Add PWM support for the MT8183 SoC

Signed-off-by: Fabien Parent <fparent@baylibre.com>
---
 drivers/pwm/pwm-mediatek.c | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/drivers/pwm/pwm-mediatek.c b/drivers/pwm/pwm-mediatek.c
index 108881619aea..9052b500b8f0 100644
--- a/drivers/pwm/pwm-mediatek.c
+++ b/drivers/pwm/pwm-mediatek.c
@@ -314,6 +314,12 @@ static const struct pwm_mediatek_of_data mt7629_pwm_data = {
 	.has_ck_26m_sel = false,
 };
 
+static const struct pwm_mediatek_of_data mt8183_pwm_data = {
+	.num_pwms = 4,
+	.pwm45_fixup = false,
+	.has_ck_26m_sel = true,
+};
+
 static const struct pwm_mediatek_of_data mt8516_pwm_data = {
 	.num_pwms = 5,
 	.pwm45_fixup = false,
@@ -326,6 +332,7 @@ static const struct of_device_id pwm_mediatek_of_match[] = {
 	{ .compatible = "mediatek,mt7623-pwm", .data = &mt7623_pwm_data },
 	{ .compatible = "mediatek,mt7628-pwm", .data = &mt7628_pwm_data },
 	{ .compatible = "mediatek,mt7629-pwm", .data = &mt7629_pwm_data },
+	{ .compatible = "mediatek,mt8183-pwm", .data = &mt8183_pwm_data },
 	{ .compatible = "mediatek,mt8516-pwm", .data = &mt8516_pwm_data },
 	{ },
 };
-- 
2.28.0


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
