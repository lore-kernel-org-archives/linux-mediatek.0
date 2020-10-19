Return-Path: <SRS0=Vpwr=D2=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4854AC433DF
	for <linux-mediatek@archiver.kernel.org>; Mon, 19 Oct 2020 14:08:38 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 963A422263
	for <linux-mediatek@archiver.kernel.org>; Mon, 19 Oct 2020 14:08:37 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="1oNAEIzf";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=baylibre-com.20150623.gappssmtp.com header.i=@baylibre-com.20150623.gappssmtp.com header.b="jXznkorp"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 963A422263
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-Id:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=YgbzEQmJ7NXFGYPCHtHQ65psIRG7YmIxaGJGBDnmOgk=; b=1oNAEIzfQydFcGK9HSDEpUsT5
	EDikZzeXQHI79V22CWAIdIxhEoxs/JABQ91M8K4trdQx9Yq2MmQCOWEeFRjiTJ8w5/RsHL4lO3hf0
	zzvh61wX70+6Si7noVoLby+EiccT10NQ0KsmwTkhc3+7lUypwZlO14QnrfH5PgDam9tUpv0SV+Xi6
	tqW+EsPaib9vqkqCUB86m9ddPNzz2ho9pEG6Bj9YA9ZAMZ3wy+Nl899RbHwxVeWFMkPGkW9RoB6YP
	mGEqaXCarZSbHHiFc2zojaonWJw0d/LxG9eqFpVG6CSvWok6r72h8+sxC6s7GD6BWj8Z8qjg0S7vx
	evkPS7S4A==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kUVpn-0004ne-73; Mon, 19 Oct 2020 14:08:23 +0000
Received: from mail-wr1-x443.google.com ([2a00:1450:4864:20::443])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kUVon-0004I5-8B
 for linux-mediatek@lists.infradead.org; Mon, 19 Oct 2020 14:07:31 +0000
Received: by mail-wr1-x443.google.com with SMTP id g12so11595548wrp.10
 for <linux-mediatek@lists.infradead.org>; Mon, 19 Oct 2020 07:07:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=PndEcJoIhu8Ps+w0iBL39IDLYKub+UL8r52UvlKnJPk=;
 b=jXznkorpMbudtjKvBK4N2QF2KUBXyVi6JOt43LjMCWyqO0eI+NX5Ra79Mw6fO6R4hV
 VQQao6w/fLm0ghZUYIZk5zVG7sGfX/Q5W/6c4jiY04AJ4mZZ7BC7Gybz9AACJs178wF/
 NRCf2NNy/LKrKLIZkF8QxD+aJngGEvFGnsJIYdiMAy+FQqdaB3suFwIKI3pTM/2S2Rhg
 QV8yxYmPM5QglOe4SR1YeNEdTW8UzDkYonThnq725J+DuvVxhby2SgS1U+sZ8zUvLnAB
 6TGjK+mYNHJWehouP+Lha3mwUxtpTWDrhz1tesldO1lxVOiMxWVcRHu9kSbla0L23zyD
 JXwg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=PndEcJoIhu8Ps+w0iBL39IDLYKub+UL8r52UvlKnJPk=;
 b=Z+I5eoT8Gw2hwBaMNK08mOSAxEU1ukoS8USs7xwqXgKk8P1E87VwSP3d3bYL1n1wZV
 3LhzliYA5o+CcmduSqzM6IN59juw6n9vopYzzNe3Yr34RQh579Zpj2wEhkd5So/sLtg7
 PK51auDsj3pmYvlyYoAwnfT6J7QGW+z9A+uWMPH6sXmat6yIH41SE6CPzZtCjKQ+X+pu
 AnuxPkBCq8/0yFKfdE4i8BlHNJxH2cOAcINGT7fVK1I2nSzxYICeNXry2fZWPtJEfUHb
 RBD5UXvPyqdgAr+DY7Nnlf0/fbGra+ZblQbI7ZtX+TIbZ5/hJUM4rTP7YEr+52H4oQoj
 DLoA==
X-Gm-Message-State: AOAM532wF24W91/kPT8ffl0ZoQwrx0nPBXT18mOWC4ys0SyeNQbv2Xt2
 wsF31vChpDUbuDQnZ0lvlafHGEA3YSEoDg==
X-Google-Smtp-Source: ABdhPJxbu5w5soYFv2Gj3kP13jgoxuRXjNkYcBYnVYdc/YxGK5tt2wig/DTZ0pvnP2bONQqInoEfww==
X-Received: by 2002:adf:ed8f:: with SMTP id c15mr19230884wro.136.1603116438263; 
 Mon, 19 Oct 2020 07:07:18 -0700 (PDT)
Received: from localhost.localdomain (26.167.185.81.rev.sfr.net.
 [81.185.167.26])
 by smtp.gmail.com with ESMTPSA id a3sm114182wmb.46.2020.10.19.07.07.16
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 19 Oct 2020 07:07:17 -0700 (PDT)
From: Fabien Parent <fparent@baylibre.com>
To: linux-mediatek@lists.infradead.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
 linux-pwm@vger.kernel.org
Subject: [PATCH 5/5] arm64: dts: mediatek: mt8183-evb: add PWM support
Date: Mon, 19 Oct 2020 16:07:05 +0200
Message-Id: <20201019140705.1518822-6-fparent@baylibre.com>
X-Mailer: git-send-email 2.28.0
In-Reply-To: <20201019140705.1518822-1-fparent@baylibre.com>
References: <20201019140705.1518822-1-fparent@baylibre.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201019_100721_619531_12E184B3 
X-CRM114-Status: GOOD (  12.18  )
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

Enable the pwm driver and set the pinctrl for PWM A line.

Signed-off-by: Fabien Parent <fparent@baylibre.com>
---
 arch/arm64/boot/dts/mediatek/mt8183-evb.dts | 12 ++++++++++++
 1 file changed, 12 insertions(+)

diff --git a/arch/arm64/boot/dts/mediatek/mt8183-evb.dts b/arch/arm64/boot/dts/mediatek/mt8183-evb.dts
index ae405bd8f06b..c8e1d97e564f 100644
--- a/arch/arm64/boot/dts/mediatek/mt8183-evb.dts
+++ b/arch/arm64/boot/dts/mediatek/mt8183-evb.dts
@@ -333,6 +333,12 @@ pins_spi{
 			bias-disable;
 		};
 	};
+
+	pwm0_pin_default: pwm0 {
+		pwm {
+			pinmux = <PINMUX_GPIO90__FUNC_PWM_A>;
+		};
+	};
 };
 
 &spi0 {
@@ -381,3 +387,9 @@ &spi5 {
 &uart0 {
 	status = "okay";
 };
+
+&pwm0 {
+	status = "okay";
+	pinctrl-0 = <&pwm0_pin_default>;
+	pinctrl-names = "default";
+};
-- 
2.28.0


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
