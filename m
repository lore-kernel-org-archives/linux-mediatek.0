Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0E479C43334
	for <linux-mediatek@archiver.kernel.org>; Thu,  9 Jun 2022 11:51:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=kUk5dOLPa2xdMhB8dsvQ2BlWovs+iAsfQ9zoTvqvQ0o=; b=UekbhL9WMZvdEG
	nXMafy8by+cmWkirMOQ5w2olf5i+7n1dSETPV33C4KPPlHJwjSi5oICdKuMhh/SdfB8Fti56l6Q7C
	jOMo5DWv78R8xp0Tzf51I/yMs9JVzUcLRZzxuD4JMQoEs9Sm+smjKql/p/D7pipsKiFOkRv9VKTtZ
	H5XVcrdqc7w+xMFenjlubcjYC+Gyxn6fOJphoeaQS/vidCHDLSdQovxRfimRybBN+oQTbILcew0y3
	qQMcOhlS5yhddhPmRJEAk0d7TN8EhpHZDNIiyfWKIApdhP37Xm5LHQBZKZXEv9dZG6N9Dacvqj1Qm
	MGzfcriR6NKl1Ze8KPgQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nzGhb-001UT6-Mb; Thu, 09 Jun 2022 11:51:51 +0000
Received: from mail-ej1-x634.google.com ([2a00:1450:4864:20::634])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nzGWM-001PA3-KL
	for linux-mediatek@lists.infradead.org; Thu, 09 Jun 2022 11:40:16 +0000
Received: by mail-ej1-x634.google.com with SMTP id h23so35836153ejj.12
        for <linux-mediatek@lists.infradead.org>; Thu, 09 Jun 2022 04:40:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=CNSMqPOWSXzw+Ck8M30e8l38LaeW0dc38daK1PaMf9A=;
        b=mNZv/vOTlgWw33oah/CqDorwmXalyTLA9BKQ25HQG6NfYltICakt5zZVVDjeF9AdIB
         lg9XtD34rEryysprD956jx1BJEB2y+b7QCbjgr/8W7zZ2bhq0YoFP5IKAOQRSyH/xW8q
         LBk8PH1/qkRnLxCU1Wm9sX4MoV2kxQFNYRgzjhaXSSHoI3q7JdZC+sXukltg5WmyM8Hc
         ydHE4Ro7TDaiavP+mZCZRdyS/TtWj1t3hs/5vssvk9Ii9ibpl0GYgI3YkMWAQeM0rlmf
         510h5UMxnN/ap47vWnT78ToH/45kN5npPdfVkwgxJIEWqGJGIEC1NQa9aL08XwH56BYt
         tJMQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=CNSMqPOWSXzw+Ck8M30e8l38LaeW0dc38daK1PaMf9A=;
        b=uxr9E3ycRY0teXvKkHTbEJXqIOpRSsL3y3e8a8gUxcc5fvBEOJIdOh/5YnUDsY58MF
         zizGH3FyVMHc695YdBOf/5XFGz4q7Q5+/jSG5ZGiD+kUOGBP4oRAGRrBNHkMGeqONSqw
         uqlX8twSNKb9rKffrMdCbpIfhGGtDI5/SeD8SDTG3wgjC4dTFGnfSvnPCQ/4RHJ6MKke
         4EX64TUZA4zh7jT3Gu1V8nWPWJMXTydKZ6KtxUnBSAjoR/AYXq2ZoPEypr96JuKzf6It
         N9Px8IEBSCqmY7CEIQ33TB4yB7kwecuOn+C5G7So2She5C1B/jwvh2Ccm2vAkmsaiBs0
         LpSA==
X-Gm-Message-State: AOAM531GVrLOO9IRKsB13W0Yam6sIJPLbIy7JVlF9bIbX0AOuEBKtruZ
	tSWsgT3ExfmPoFJaCHQWa5AdaA==
X-Google-Smtp-Source: ABdhPJxmAk2Y+XroE7iF0LDQjobmFkH/yU0gGNvbSEj5slHvWwdNDLIfiKGfqCCpS+4l9xnWfXsPTA==
X-Received: by 2002:a17:907:5010:b0:711:f093:3a93 with SMTP id fw16-20020a170907501000b00711f0933a93mr9061053ejc.620.1654774812751;
        Thu, 09 Jun 2022 04:40:12 -0700 (PDT)
Received: from localhost.localdomain (xdsl-188-155-176-92.adslplus.ch. [188.155.176.92])
        by smtp.gmail.com with ESMTPSA id q1-20020a170906360100b006ff59151e34sm10638441ejb.39.2022.06.09.04.40.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 09 Jun 2022 04:40:12 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To: Arnd Bergmann <arnd@arndb.de>,
	Olof Johansson <olof@lixom.net>,
	arm@kernel.org,
	soc@kernel.org,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	linux-kernel@vger.kernel.org
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: [PATCH v2 23/48] arm64: dts: mediatek: mt7622-rfb1: correct gpio-keys properties
Date: Thu,  9 Jun 2022 13:39:56 +0200
Message-Id: <20220609114002.380563-4-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220609113721.379932-1-krzysztof.kozlowski@linaro.org>
References: <20220609113721.379932-1-krzysztof.kozlowski@linaro.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220609_044014_707834_91C0E744 
X-CRM114-Status: GOOD (  10.12  )
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

gpio-keys children do not use unit addresses.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 arch/arm64/boot/dts/mediatek/mt7622-rfb1.dts | 1 -
 1 file changed, 1 deletion(-)

diff --git a/arch/arm64/boot/dts/mediatek/mt7622-rfb1.dts b/arch/arm64/boot/dts/mediatek/mt7622-rfb1.dts
index c28da9323a9c..1a86857c9027 100644
--- a/arch/arm64/boot/dts/mediatek/mt7622-rfb1.dts
+++ b/arch/arm64/boot/dts/mediatek/mt7622-rfb1.dts
@@ -40,7 +40,6 @@ cpu@1 {
 
 	gpio-keys {
 		compatible = "gpio-keys";
-		poll-interval = <100>;
 
 		key-factory {
 			label = "factory";
-- 
2.34.1


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
