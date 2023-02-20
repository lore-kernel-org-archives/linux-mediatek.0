Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 76442C05027
	for <linux-mediatek@archiver.kernel.org>; Mon, 20 Feb 2023 09:34:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=auUSvs8UsdFaj/xThMRdjaVCog/Zx9EFkKoJMU//YhU=; b=JxhxxrnohfraCvQELS6qT5e3BZ
	E4RzTj5krYS7ySaUSgJBFdJnbGv8WPdlNos7oU3GCbXxFsk+uWO4m1/h+TpzMk9CSPr1bEXjf+QI6
	0ZbQctaiImHmUbTZgpL59yGHsDkN2nHnPnbfH0+cSLObJiu6GgZdDdOEQOhNSz6TkvaWtCNe9+/iZ
	+3fGdWcHvlRsbiku0faVG7NZRpYJZZmBrfQNAg624wVNpitPn2O45ebnokj5+fQLjZIXJi42Rx4gs
	V+gSOfND6YKpTja7UvbCqWZM1x31Z4mKN1HbFll7h7fvFVM9Xm+iGAGkDwsIUXmPTFYhWGvx/G3pW
	5cKCNm6Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pU2YY-003WOn-Ix; Mon, 20 Feb 2023 09:33:58 +0000
Received: from mail-pl1-x62a.google.com ([2607:f8b0:4864:20::62a])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pU2YT-003WLp-DI
	for linux-mediatek@lists.infradead.org; Mon, 20 Feb 2023 09:33:56 +0000
Received: by mail-pl1-x62a.google.com with SMTP id z2so794465plf.12
        for <linux-mediatek@lists.infradead.org>; Mon, 20 Feb 2023 01:33:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=auUSvs8UsdFaj/xThMRdjaVCog/Zx9EFkKoJMU//YhU=;
        b=VEzgNlH1ZIpSeIIW4BHakqAskqPavaOvnwg+FDMkymbI+7fRGLlkwr/700K8ZFQqJg
         aqdAQuNVLlRPa6+vEKtYLb6ZYTpXrj7248N7dJQSbSTS3XLrbD5J2mXlMnb5MW20z/lv
         vfcUsoDMycHnvx4SXBpfS5WMxKHzjKjYiqqR4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=auUSvs8UsdFaj/xThMRdjaVCog/Zx9EFkKoJMU//YhU=;
        b=w25qpiiKUut/D1hOA3oDZpFvSwX0pkLaDyVSckZ01MDPg88MS+jAeJtLzNFjTdBEVP
         S8TEmlQWOgWycvG/cL79A5Wp5MIPWUb3UCBgrxHMtHLf4Gn13+Y+kdYl/fahsq4q17a/
         KjI0jAVxFab6R4Xd8u7PcmpA9HzO3JOsf3Fsodh2soWONCXEdqsjzFtI4iX9gOrSfNuz
         CiJfPrPm83eE/Ig3MRZq+p5kVhzQWMK/RFD8q2NLhNWMaNzvo69D9uew77lqB20iq63B
         1FauXmo7mTJGVQ+vRJMSQHoeOH41TjTry/yhf/5BQAAwli3SMPeHtBOK+9jByj73PDI+
         KPog==
X-Gm-Message-State: AO0yUKW9PrbYaLk3hzxWjNkOOdzcYHMoVDAnuDetdN0tAD2ha0cea4RC
	f30G6r4ILUS19FzCJEEKpeadlA==
X-Google-Smtp-Source: AK7set/mx+AT01XAXlnDozbSnH6dwDZECdvgBPrkFE3Z+Q+N302TjAwATXil1kIEzmGxWYX76fcotg==
X-Received: by 2002:a17:902:f94e:b0:19b:e73:809c with SMTP id kx14-20020a170902f94e00b0019b0e73809cmr764263plb.1.1676885628697;
        Mon, 20 Feb 2023 01:33:48 -0800 (PST)
Received: from hsinyi-z840.tpe.corp.google.com ([2401:fa00:1:10:22dd:c2d9:add9:3828])
        by smtp.gmail.com with ESMTPSA id q7-20020a170902a3c700b0019324fbec59sm7427728plb.41.2023.02.20.01.33.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 20 Feb 2023 01:33:48 -0800 (PST)
From: Hsin-Yi Wang <hsinyi@chromium.org>
To: Matthias Brugger <matthias.bgg@gmail.com>
Cc: Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org
Subject: [PATCH] arm64: dts: mediatek: mt8183: kukui: Add scp firmware-name
Date: Mon, 20 Feb 2023 17:33:43 +0800
Message-Id: <20230220093343.3447381-1-hsinyi@chromium.org>
X-Mailer: git-send-email 2.39.2.637.g21b0678d19-goog
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230220_013353_505499_05135E16 
X-CRM114-Status: UNSURE (   9.42  )
X-CRM114-Notice: Please train this message.
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

The upstream SCP firmware path is /lib/firmware/mediatek/mt8183/scp.img

Signed-off-by: Hsin-Yi Wang <hsinyi@chromium.org>
---
 arch/arm64/boot/dts/mediatek/mt8183-kukui.dtsi | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/arch/arm64/boot/dts/mediatek/mt8183-kukui.dtsi b/arch/arm64/boot/dts/mediatek/mt8183-kukui.dtsi
index fbe14b13051a..8390e89dbc83 100644
--- a/arch/arm64/boot/dts/mediatek/mt8183-kukui.dtsi
+++ b/arch/arm64/boot/dts/mediatek/mt8183-kukui.dtsi
@@ -807,6 +807,8 @@ &pwm0 {
 
 &scp {
 	status = "okay";
+
+	firmware-name = "mediatek/mt8183/scp.img";
 	pinctrl-names = "default";
 	pinctrl-0 = <&scp_pins>;
 
-- 
2.39.2.637.g21b0678d19-goog


