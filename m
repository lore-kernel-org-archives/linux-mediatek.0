Return-Path: <SRS0=pZ6D=MU=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.5 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8B6DCC4338F
	for <linux-mediatek@archiver.kernel.org>; Wed, 28 Jul 2021 04:07:55 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 57CCE60F41
	for <linux-mediatek@archiver.kernel.org>; Wed, 28 Jul 2021 04:07:55 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 57CCE60F41
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=chromium.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=83k8eT0wlOf7mgvfJVoB0CnjIE7X9zb1PJjpn7vz184=; b=ecrs3AKgKX5Oun
	55rJ22Jb2VngvtIsRTlhkm5j8JAEyHHgLbVbAWUez1IairaAjRl/Az11uoMxnxZoJTQ4whDDNAW1k
	p0l9R9aQg60QGLwXX6Oh9ng/IlfeCzhGVG+YbWMiFjtxYwKd5cjGiXbskyNMJY7hO7sfBIZrivbrI
	z/SccfUI0BmW9tf3WYVl64hlSI2Uc4uTWwv/ZpujFlJI901uB1pGk1GNxoGbD0LnnlQQpaQQ3cATs
	bSRlK6pydWL7KWlOQ4r4niWT0fQBQOkZkjT0qv3f2ukZeLwQ+YYcpwrfmT7uGGI879nYTXV74PsI0
	a2zqk9uX56lO/62kk0mA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1m8arA-00H14h-TH; Wed, 28 Jul 2021 04:07:44 +0000
Received: from mail-pl1-x630.google.com ([2607:f8b0:4864:20::630])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1m8aqm-00H0zj-DN
 for linux-mediatek@lists.infradead.org; Wed, 28 Jul 2021 04:07:21 +0000
Received: by mail-pl1-x630.google.com with SMTP id c16so1115078plh.7
 for <linux-mediatek@lists.infradead.org>; Tue, 27 Jul 2021 21:07:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=+fqG4R+4qOt1ELoyg7PgFn0oDWuwuLmHhCt0oIoufOs=;
 b=leiQUpg97lA0cyhIJNpA37EZPKMHTpmtrVStYeFXvNCJ1xyRsmHlWPqKfdlCllPmjI
 mOyT4TnU4QLIXcO7Zxl1XD+VvxZAfjtgOk25vKX1d6v5xLIUJpdGVKPM86Qk//U5KjB2
 ebdk2A7Rj+dpo2AS5h/WGB4EOF4U/F72/Ppms=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=+fqG4R+4qOt1ELoyg7PgFn0oDWuwuLmHhCt0oIoufOs=;
 b=RZ30+3Z1d89gSgOyWLBeeAVHJLRHe7MQzCrEpLpUnHMmde4K4tV7eVLaNzwYPTkAyF
 MoXluv812oOaVUSY3Sfw5eVH14IfAjU443buaWQV55VapeOAU10sbOZHlbydBZ3634Pu
 EqejUTS3uf/43osPnLv0Cre25BEPV9x7ZZT9j9lxZpebFUW3c+ybWqOdiwg7+V7XU9vn
 m/+yLbohI/pzBXcpwc3o852TtLkaXzBuI5qz4Y6pvrneiq/P7O6bhKHSd6yjFPHZCk6w
 4D/kVoHba0w5wnP4kpANFKbZrnvbgSe3ffCVGaVAi7P2xt5rl9O38njWTCVIki9HKOtk
 sF4g==
X-Gm-Message-State: AOAM531NXMLu4MvLkqbuTYY7uF8pdjEPsJG9aqeDHnDKAiM/9hKq+JF2
 9SQCBWI7ZKmaxxTBXd1MaC5ILg==
X-Google-Smtp-Source: ABdhPJyDCFmwyf2fn2UI5FGK/JoEH7OH9IM47ZOeYNpro93++WTNtr6+NaqTR9oGAv3jyqKHNRGf9g==
X-Received: by 2002:a63:1614:: with SMTP id w20mr27210465pgl.198.1627445239405; 
 Tue, 27 Jul 2021 21:07:19 -0700 (PDT)
Received: from hsinyi-z840.tpe.corp.google.com
 ([2401:fa00:1:10:5176:76cc:2193:9b8f])
 by smtp.gmail.com with ESMTPSA id 6sm5536012pfg.108.2021.07.27.21.07.17
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 27 Jul 2021 21:07:19 -0700 (PDT)
From: Hsin-Yi Wang <hsinyi@chromium.org>
To: Matthias Brugger <matthias.bgg@gmail.com>
Cc: Rob Herring <robh+dt@kernel.org>,
 Enric Balletbo Serra <eballetbo@gmail.com>, eizan@chromium.org,
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: [PATCH v4 2/2] arm64: dts: mt8173: elm: Use aliases to mmc nodes
Date: Wed, 28 Jul 2021 12:07:10 +0800
Message-Id: <20210728040710.2891955-2-hsinyi@chromium.org>
X-Mailer: git-send-email 2.32.0.432.gabb21c7263-goog
In-Reply-To: <20210728040710.2891955-1-hsinyi@chromium.org>
References: <20210728040710.2891955-1-hsinyi@chromium.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210727_210720_497019_9D23BE9B 
X-CRM114-Status: GOOD (  11.73  )
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

With commit 1796164fac7e ("dt-bindings: mmc: document alias support"),
a way to specify fixed index numbers was provided. This patch use aliases
to mmc nodes so the partition name for eMMC and SD card will be consistent
across boots.

Signed-off-by: Hsin-Yi Wang <hsinyi@chromium.org>
Reviewed-by: Chen-Yu Tsai <wenst@chromium.org>
---
v3->v4: change commit message based on review in v3.
---
 arch/arm64/boot/dts/mediatek/mt8173-elm.dtsi | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/arch/arm64/boot/dts/mediatek/mt8173-elm.dtsi b/arch/arm64/boot/dts/mediatek/mt8173-elm.dtsi
index 21452c51a20a8..d5a2cad39c9c7 100644
--- a/arch/arm64/boot/dts/mediatek/mt8173-elm.dtsi
+++ b/arch/arm64/boot/dts/mediatek/mt8173-elm.dtsi
@@ -10,6 +10,12 @@
 #include "mt8173.dtsi"
 
 / {
+	aliases {
+		mmc0 = &mmc0;
+		mmc1 = &mmc1;
+		mmc2 = &mmc3;
+	};
+
 	memory@40000000 {
 		device_type = "memory";
 		reg = <0 0x40000000 0 0x80000000>;
-- 
2.32.0.432.gabb21c7263-goog


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
