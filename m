Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0318DC3DA7F
	for <linux-mediatek@archiver.kernel.org>; Mon,  5 Aug 2024 06:51:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=6p/MeCAGJmUZEzkpiAKS5tn4Lz8oeVbtRys6Pcnb/O8=; b=hg4xMHlH+gkG92U3cOzflt4Y8E
	Jhq9jdjnpoSvgfUuNxHayCkhUept7qYmCOBAPMRz+bmPwW/0Zp0gz1KFES/oxjTwTRP7OX+pBnQ/w
	7IUnVS+1luqj+km5pMEi3VsfRh795dKRf2tKGtuF+IxdI3VyC+JHZuHeuLb25JT+U/tRLc6hOEWbY
	YPughtiDFeNFGBp/yYy0vpAOZsUJiwP58ItOHecCQC7t7wb03nViyP4EqU/D4gzW9XU2OYjWNbygu
	oDjn8XaIbciVdkhTYh/T72Bhm34UPuPArFnoaqedr2Ksw/OOv2Jo1Lj3P9oxounbdVcfDtAR5g1tA
	YcmafdzQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sarYj-0000000Eqk6-13Ix;
	Mon, 05 Aug 2024 06:51:09 +0000
Received: from mail-oi1-x22e.google.com ([2607:f8b0:4864:20::22e])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sarYe-0000000Eqil-0FgW
	for linux-mediatek@lists.infradead.org;
	Mon, 05 Aug 2024 06:51:08 +0000
Received: by mail-oi1-x22e.google.com with SMTP id 5614622812f47-3db13410adfso5747329b6e.2
        for <linux-mediatek@lists.infradead.org>; Sun, 04 Aug 2024 23:51:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1722840662; x=1723445462; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=6p/MeCAGJmUZEzkpiAKS5tn4Lz8oeVbtRys6Pcnb/O8=;
        b=aTri5pzPaeXURtT7aim9aUa4YsPKdt4ffmAAnaGWd3O8Rfp+T8dZ5/V13a0M3Bcpvp
         ezhsupaUsed5MpipgMnsH089f/ZaxrOivFVuQRxK8U3RoECnJMtQPrMcRgv0Zcd3REx9
         0GqdlPTYcfOBTKCIi5tLBmH9GrU7zQLj7Be1I=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1722840662; x=1723445462;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=6p/MeCAGJmUZEzkpiAKS5tn4Lz8oeVbtRys6Pcnb/O8=;
        b=goU3+NDbTg4AR5sTXmXVVXq8s0VotFmA5TQIanHg10QNNwnuVvpdLI3abnR2142Gke
         vj0OJ5RbPhoeCetM2iffsCSQM6YbFwYXPd6hxFf0Gw1stTl1wBRodeB+Xvh2+YkhHVLC
         RKce2ntDUbMVlhK3WWKNjLdvM1dCKl6dzv1b3+BWsMk1NApsZzGTaiPs7ERqD8KPwBcs
         dd300CFVYhNfMOgJtnG8z6Ut2QAsgRzes7e7as4tE1z15v4fT+MzvNncExnMabSMmqgW
         MnDoK6yPkMeS/LQ+p5SuPBSvYq+kZPPvbb9Gy8E/QdUFabTUX4cXVHANJcF5OaAWt7yG
         9iuA==
X-Forwarded-Encrypted: i=1; AJvYcCUTrKaQHwdl562BtPHUXkR/VH3mO4AtIZF/pm0yd1LhcSMU3k+sPaz9iSCX/z8kX4ppRstBLszfJe5Hnt6xjghQixCBBOML8iIJvP9YuRP+XJPg
X-Gm-Message-State: AOJu0YxdY0sVgtG71hdDw8HeJTV6CJ0S9ZCvZKfVYwcCjRob04JILSWO
	FCMHF+rxFfhW7gP5E2WLMHiNYChBeJ0lSbBdAN2DJXquCsftWx/dHpYmlwbr7w==
X-Google-Smtp-Source: AGHT+IFeX6wpUnZrmWE5aZV2NCgOET8WAh/Xbg6xnvw90WG92Ej9Zh6Sd8ao06GrQ3VZ/X84x6+vsw==
X-Received: by 2002:a05:6871:582a:b0:268:880c:9de3 with SMTP id 586e51a60fabf-26891a9aea9mr14453542fac.14.1722840662294;
        Sun, 04 Aug 2024 23:51:02 -0700 (PDT)
Received: from treapking.tpe.corp.google.com ([2401:fa00:1:10:b430:a369:61a6:ec2])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7106ecdffe4sm4779788b3a.128.2024.08.04.23.50.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 04 Aug 2024 23:51:01 -0700 (PDT)
From: Pin-yen Lin <treapking@chromium.org>
To: Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: Rob Herring <robh@kernel.org>,
	Kiwi Liu <kiwi.liu@mediatek.corp-partner.google.com>,
	Conor Dooley <conor+dt@kernel.org>,
	devicetree@vger.kernel.org,
	Enric Balletbo i Serra <eballetbo@kernel.org>,
	linux-mediatek@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Hsin-Te Yuan <yuanhsinte@chromium.org>,
	Chen-Yu Tsai <wenst@chromium.org>,
	Pin-yen Lin <treapking@chromium.org>
Subject: [PATCH] arm64: dts: mediatek: mt8183: Remove clock from mfg_async power domain
Date: Mon,  5 Aug 2024 14:50:23 +0800
Message-ID: <20240805065051.3129354-1-treapking@chromium.org>
X-Mailer: git-send-email 2.46.0.rc2.264.g509ed76dc8-goog
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240804_235104_109978_D8BEE28A 
X-CRM114-Status: UNSURE (   8.99  )
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

This clock dependency introduced a mutual dependency between mfg_async
power domain and mt8183-mfgcfg clock, and Mediatek has confirmed that
this dependency is not needed. Remove this to avoid potential deadlock.

Signed-off-by: Pin-yen Lin <treapking@chromium.org>
Fixes: 37fb78b9aeb7 ("arm64: dts: mediatek: Add mt8183 power domains controller")

---

 arch/arm64/boot/dts/mediatek/mt8183.dtsi | 2 --
 1 file changed, 2 deletions(-)

diff --git a/arch/arm64/boot/dts/mediatek/mt8183.dtsi b/arch/arm64/boot/dts/mediatek/mt8183.dtsi
index fbf145639b8c..267378fa46c0 100644
--- a/arch/arm64/boot/dts/mediatek/mt8183.dtsi
+++ b/arch/arm64/boot/dts/mediatek/mt8183.dtsi
@@ -872,8 +872,6 @@ power-domain@MT8183_POWER_DOMAIN_CONN {
 
 				mfg_async: power-domain@MT8183_POWER_DOMAIN_MFG_ASYNC {
 					reg = <MT8183_POWER_DOMAIN_MFG_ASYNC>;
-					clocks = <&topckgen CLK_TOP_MUX_MFG>;
-					clock-names = "mfg";
 					#address-cells = <1>;
 					#size-cells = <0>;
 					#power-domain-cells = <1>;
-- 
2.46.0.rc2.264.g509ed76dc8-goog


