Return-Path: <SRS0=YaGT=LN=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.7 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9B19EC2B9F4
	for <linux-mediatek@archiver.kernel.org>; Sat, 19 Jun 2021 12:20:10 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 61C136120A
	for <linux-mediatek@archiver.kernel.org>; Sat, 19 Jun 2021 12:20:10 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 61C136120A
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=UnEU/cgKeRhVhnDAencvwwgIBmpXRNPi9P8+eF9yItE=; b=guaGFPJvKmplOI
	6E1IupBsXDDbOShRYI+OlqD7vsGBMzExE63ffHP6Fc6oE51fJstcNAntqpg3SBAhPYPPlUCRlC72v
	NRyfKkBXZhhjpPhQbJG2dvKgHsoIHNqrH4wniGhtisivFUDrKxIabSTZZ+Yy3yXC/QvdtS0hQjnAv
	f+i7DXSXz7S1oz6+ifWbsbZXjKJag0Jl0ZtwYaUMpaeh+QQRbzy5Q4mjW14tqkG/OT5CIFOkS1ihr
	fGbOvr/IACERP0WUb7En61u6GQGTT96JiFhS8mXTH/QWKOGkUukPv8o+wQ9F1QoWB2ILt7LRMt520
	j7rr/q/DUmEHncHPL+PQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1luZx5-00Gwq7-BF; Sat, 19 Jun 2021 12:19:55 +0000
Received: from mail-ej1-x629.google.com ([2a00:1450:4864:20::629])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1luZwr-00Gwn8-KZ; Sat, 19 Jun 2021 12:19:43 +0000
Received: by mail-ej1-x629.google.com with SMTP id he7so20324534ejc.13;
 Sat, 19 Jun 2021 05:19:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=iqaKCJ/vNidDzmWvE8Ei4HGIsfolJuD4g50roz5brLo=;
 b=p6DFUjdh9W+9ZOuXEgrAJzqvw4HlQfCSoE5KjuaOhEiqgIKfbquadYu91Z6lYGSwsU
 Pg1uV2sBaAzDDIIYwmXosaQwqRYvFEhmhH6av1PPy4NMijcSJVT+a9s+bt+yUweK79mH
 cuYjufd64+ARD7R08LaxvW0SIUNBUj2EqslfXO5XLDWyzYYCCulefa1lxGL3VGsURur9
 w+tmDFSmTXjs666V6TARTvMCSxAlWKSlpYq9l/qdJNq7OQfXqCX5mcjSZ1g/f2GtFAbP
 uK+9jnidGTeFmYoJYKVV6hwKPwm1Ju8j2LXsWaDLY5TfFQTMMvqAnvcmscC0S39Bim/B
 OH6g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=iqaKCJ/vNidDzmWvE8Ei4HGIsfolJuD4g50roz5brLo=;
 b=MNCfFCrI4ndQQyrWDl/JvnOkuFiCFjL1nWyoz3BuNgG7Ngs81ehgBHt5Fvm50s4VWv
 nTjfE4ACEnfbqyO1qX0Cu+63K+5O5mcme+vP+1A3ak2PmlGL4A5a9O6VsHr5yJUZnC2l
 DdP49pnrcWKrBrDVF/fIZLFCgLvI+TPD5Ss5MVjEXAI7V9HU4xlAX6oTEYgMnM1uNc/H
 yRi6clchUVMsZbUTaivNXeSG+c3KfdUT3dBryn39HP0UOhP7iaL25YLrHARlY21/Sx2D
 GfKzNCknctp/kdP+/sYiJgd5VYjWGQeAKclnd/XLAyJj+br0Vb17J04Iu7MdvFPev7Ri
 EPyQ==
X-Gm-Message-State: AOAM53149CEr+nTfpCNkDZ9Wm7TKs+PcaCDJ4o+RXlzLZ9L0KbqWxCfm
 OkMmOuHV33QHKzU3ZwnDLw0=
X-Google-Smtp-Source: ABdhPJwsOi2XYm8L1rzaXqA1OPOhf+cK6DVMTj8QYRFL3OnvtqeS5oJ1CV+q+F0i+1jUniYnzLzcyA==
X-Received: by 2002:a17:907:10d8:: with SMTP id
 rv24mr15243159ejb.542.1624105179476; 
 Sat, 19 Jun 2021 05:19:39 -0700 (PDT)
Received: from BLUE.mydomain.example (83-87-52-217.cable.dynamic.v4.ziggo.nl.
 [83.87.52.217])
 by smtp.googlemail.com with ESMTPSA id w17sm2299405ejk.112.2021.06.19.05.19.38
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 19 Jun 2021 05:19:39 -0700 (PDT)
From: ericwouds@gmail.com
To: Rob Herring <robh+dt@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>
Cc: Eric Woudstra <ericwouds@gmail.com>, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org,
 linux-kernel@vger.kernel.org
Subject: [PATCH] Fix mt7622.dtsi thermal cpu
Date: Sat, 19 Jun 2021 14:19:26 +0200
Message-Id: <20210619121927.32699-1-ericwouds@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210619_051941_752946_A4BCB1BE 
X-CRM114-Status: GOOD (  13.01  )
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

From: Eric Woudstra <ericwouds@gmail.com>

Cpu-thermal is set to use all frequencies already at 47 degrees. 
Using the CPU at 50 for a minute, the CPU has reached 48 degrees, is 
throttled back to lowest setting, making the mt7622 terrribly slow. 
Even at this low speed, the CPU does not cool down lower then 47 so
the CPU is stuck at lowest possible frequency until it shut down and
stays off for 15 minutes.

cooling-device = <&cpu0 THERMAL_NO_LIMIT THERMAL_NO_LIMIT>,
                 <&cpu1 THERMAL_NO_LIMIT THERMAL_NO_LIMIT>;

This should not be set al every cooling map. It should only be set at
the highest cooling map. Same as in the example:

https://www.kernel.org/doc/Documentation/devicetree/bindings/
thermal/thermal.txt  line 272

But then without the fan and added a third map.

Now temperature will be regulated at 87 degrees celcius. At temperatures
lower then 87, all frequencies can be used.

Also see the post:

http://forum.banana-pi.org/t/bpi-r64-only-10-cpu-speed-at-already-48-
degrees-celcius-speed-not-increasing-anymore/12262

Signed-off-by: Eric Woudstra <ericwouds@gmail.com>
---
 arch/arm64/boot/dts/mediatek/mt7622.dtsi | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/arch/arm64/boot/dts/mediatek/mt7622.dtsi b/arch/arm64/boot/dts/mediatek/mt7622.dtsi
index 890a942ec..b779c7aa6 100644
--- a/arch/arm64/boot/dts/mediatek/mt7622.dtsi
+++ b/arch/arm64/boot/dts/mediatek/mt7622.dtsi
@@ -170,14 +170,14 @@ cpu-crit {
 			cooling-maps {
 				map0 {
 					trip = <&cpu_passive>;
-					cooling-device = <&cpu0 THERMAL_NO_LIMIT THERMAL_NO_LIMIT>,
-							 <&cpu1 THERMAL_NO_LIMIT THERMAL_NO_LIMIT>;
+					cooling-device = <&cpu0 0 0>,
+							 <&cpu1 0 0>;
 				};
 
 				map1 {
 					trip = <&cpu_active>;
-					cooling-device = <&cpu0 THERMAL_NO_LIMIT THERMAL_NO_LIMIT>,
-							 <&cpu1 THERMAL_NO_LIMIT THERMAL_NO_LIMIT>;
+					cooling-device = <&cpu0 0 0>,
+							 <&cpu1 0 0>;
 				};
 
 				map2 {
-- 
2.25.1


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
