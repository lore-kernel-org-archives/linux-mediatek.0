Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6DACFC64EC4
	for <linux-mediatek@archiver.kernel.org>; Sat,  4 Mar 2023 12:33:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=kwTzw4guUx/lmKZKp9FZAIf2Iof4nlld7Lfmrz0x5hU=; b=dhZPHjBl6l8JnlmMatz8BJ9va5
	LgkAycbp4sgqsY5TJmanlxfnfhL0U9DYwQiCfQlOzONBjMSQIHbpcu8uQmYoQe52cxu62hQjF7eYD
	/fHfnuECn558JmgW7dQKNwwwNdjmfzU7g9Zwu/grsHfACXmZSqsKaTNQPs6L0hYn3TTfsIWqydrgC
	ta9qF991c/5PGi4OJ9t4Cs0N6bh4b1NaSXYEqscR59K0Ek9cIR613kwOO7JOllFOIloLGHcbTj2Qu
	nBKYAbsvo5EJu+ft1nMh2pogyKFLBZ3ONLfdWLBbvhLAlEFq+OhQN+TGs5EgTs8jlZhoNCdh6LA7b
	avmY773g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pYR4y-008wUn-NB; Sat, 04 Mar 2023 12:33:36 +0000
Received: from mail-ed1-x531.google.com ([2a00:1450:4864:20::531])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pYR4v-008wTa-UI
	for linux-mediatek@lists.infradead.org; Sat, 04 Mar 2023 12:33:35 +0000
Received: by mail-ed1-x531.google.com with SMTP id j11so996529edq.4
        for <linux-mediatek@lists.infradead.org>; Sat, 04 Mar 2023 04:33:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1677933209;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=kwTzw4guUx/lmKZKp9FZAIf2Iof4nlld7Lfmrz0x5hU=;
        b=g0M5abk9yetoeCh1MvLSCStFIhC2kotpRDtZm9RXd1GT8H0qbqE93GWruGz3ez+ik3
         DrSlthpwkgcCzfWFZ2LYun5SrfHRF/9eV2absC1CGIliOIVl/Mlcj+bQRrxsNsSTwG4V
         zSd/H8e6iJ1si5OfympFT8LvfTIID+L0RhGMlSmVQsVXnZiLjiSVQGASaSv+PCJ/2F5X
         wrUCguBT4WC1AMpTWRIDDZbxni66gnFBXz9G3lqMe38jsFN/zGr46KCpCgA/cQJQP1gI
         5MAL2xEytqf/ejRMeDaKhW5vl6M3BI/3vLmTyVbn212a9rq/W222/hQY8zlvnWoCtmp7
         yDhQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1677933209;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=kwTzw4guUx/lmKZKp9FZAIf2Iof4nlld7Lfmrz0x5hU=;
        b=uhrQOAxyO+CiVRVqPlW3lDPzO6rOewtYyC9bQ/Xn1DtqHyOM6yey9TZsIrPfnXrjp5
         1YS4BRfwOIaVP4zwJcLDy6aOwSx7/JD1QWB+7jo8sbjMp+OL3VBIKU8PS1c7Ljnr2Wrl
         tgbFajGrnKSy8fy8T7aSnar4x8wfIS6FaopMxn21/CFJsvZb9mhoFcBIHEuT3VajZrRn
         IOiJZswBzs1klIYjv7SVnUsVFoouWMfgP7ON9Vn9RzCSBWEO6cudRdzOK/ojVCZtwim1
         /3olHR/VFtXlq8ay5/UsX58zpr4AkJRRR5obH9zP0Hzx9ynthOsjdF06E42+KZlmZQiJ
         W+7Q==
X-Gm-Message-State: AO0yUKV5nuq7jky9xMFAbCncAdQfRZoaJREShu3EgWiHkpCi60dkx8z2
	pjM9OsbtjMShghCL8bWi/HsR9Q==
X-Google-Smtp-Source: AK7set8fNgHrOb48YLQc+6jt7WeWZgjA4V1pBu4H5fd3OnTyex77l70mE02EF96wpTJcyjLTMPKYtg==
X-Received: by 2002:a17:906:3a48:b0:8b1:2f0e:e3a4 with SMTP id a8-20020a1709063a4800b008b12f0ee3a4mr4557869ejf.26.1677933209401;
        Sat, 04 Mar 2023 04:33:29 -0800 (PST)
Received: from krzk-bin.. ([2a02:810d:15c0:828:b758:6326:1292:e2aa])
        by smtp.gmail.com with ESMTPSA id e22-20020a170906081600b008d1693c212csm2021300ejd.8.2023.03.04.04.33.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 04 Mar 2023 04:33:28 -0800 (PST)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To: Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: [PATCH] arm64: dts: mediatek: mt8173: correct GPIO keys wakeup
Date: Sat,  4 Mar 2023 13:33:01 +0100
Message-Id: <20230304123301.33952-1-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230304_043333_980664_44DFDCDB 
X-CRM114-Status: UNSURE (   9.27  )
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

gpio-keys,wakeup is a deprecated property.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 arch/arm64/boot/dts/mediatek/mt8173-elm.dtsi | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/arch/arm64/boot/dts/mediatek/mt8173-elm.dtsi b/arch/arm64/boot/dts/mediatek/mt8173-elm.dtsi
index d452cab28c67..d77f6af19065 100644
--- a/arch/arm64/boot/dts/mediatek/mt8173-elm.dtsi
+++ b/arch/arm64/boot/dts/mediatek/mt8173-elm.dtsi
@@ -58,7 +58,7 @@ switch-lid {
 			gpios = <&pio 69 GPIO_ACTIVE_LOW>;
 			linux,code = <SW_LID>;
 			linux,input-type = <EV_SW>;
-			gpio-key,wakeup;
+			wakeup-source;
 		};
 
 		switch-power {
@@ -66,7 +66,7 @@ switch-power {
 			gpios = <&pio 14 GPIO_ACTIVE_HIGH>;
 			linux,code = <KEY_POWER>;
 			debounce-interval = <30>;
-			gpio-key,wakeup;
+			wakeup-source;
 		};
 
 		switch-tablet-mode {
@@ -74,7 +74,7 @@ switch-tablet-mode {
 			gpios = <&pio 121 GPIO_ACTIVE_HIGH>;
 			linux,code = <SW_TABLET_MODE>;
 			linux,input-type = <EV_SW>;
-			gpio-key,wakeup;
+			wakeup-source;
 		};
 
 		switch-volume-down {
-- 
2.34.1


