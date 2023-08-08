Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 690D6C001B0
	for <linux-mediatek@archiver.kernel.org>; Tue,  8 Aug 2023 07:34:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=HvqYw50hA3eg6fTEyMxs963EOcH3mDmkMLxwXE575wg=; b=DaBIRbWQ8eOVO5wzcwTMkAOQiR
	kSy5K1/vWdU1PaOh51K7pvv5mAWkQTq6zVDP5xHEDgSfhBKmXYtU70wPMeYcuvOv2j+EmjFq2RzRd
	HipjdQdj76MBI9iYV73DlHzQGH7qR76TXZh1nAl8aPu0KWoIi7gIgRd3lIAZMQkOSontC/Grsolg0
	Fkz5EU7dtMvEkUU1GWVBkD/oTQCMANAtNkX6VOGweQmkUioP6u/Tvkepx9+DKJNIuCszJ2XIWCRtj
	MBqrpQfauDVjOiJzAZ+DE9U9TMahzc1KTYReHs9can5HimncM+yfMkhy7yPH6O7+8XVereiUZWpHF
	lwxuYObQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qTHEB-001tk2-0R;
	Tue, 08 Aug 2023 07:34:03 +0000
Received: from mail-pf1-x42d.google.com ([2607:f8b0:4864:20::42d])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qTHE7-001tj5-1x
	for linux-mediatek@lists.infradead.org;
	Tue, 08 Aug 2023 07:34:00 +0000
Received: by mail-pf1-x42d.google.com with SMTP id d2e1a72fcca58-686be28e1a8so3725241b3a.0
        for <linux-mediatek@lists.infradead.org>; Tue, 08 Aug 2023 00:33:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1691480036; x=1692084836;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=HvqYw50hA3eg6fTEyMxs963EOcH3mDmkMLxwXE575wg=;
        b=fQkFQ68LWA16o7wOUkcW/9A9O3WwtbXd50qE3eIs3Mdz99U8bqk0rhMtOMrsqrNNaE
         SL838lzq6GW2D+nTDC9s1ify28Ycgk1gwW9rBFAUZ32TkiIPWWa+TzXfKRSwtQ7edBoy
         vTW0kKrP0MgcJn5A2z9RCpSmcLNooG9ud4Prk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1691480036; x=1692084836;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=HvqYw50hA3eg6fTEyMxs963EOcH3mDmkMLxwXE575wg=;
        b=kVit8IXvYrT+1Uqws6pNTD/3JZwzap3UCVa2RfPIjRngk26RWSVyPjivy8fGIOHvIc
         IB1CiKRubdxxsbhV75j+2vb4gUL+6m8TV2UOKCHY8zztVIYC2Ra8MN6SiK0tolKn4bc/
         yCJCRyNEQkk3sXJtsIUyK69wXA59ffZdSQbIOIS9JsNB17YYjWINUq2qqfupK9io5MJC
         AgjnVdCtGnv+gvshMLexMCmQoy9Pe++Sr0AzCM/3dIwaLwMGeVXgFkDI2JeYcsEAR7xT
         afu/g+1azBep7D4rOR4GFXluBuz9ygYFE9oRjrAfqj1OUGvmaXzRHzsX4qCOWZBRfGpd
         ag/g==
X-Gm-Message-State: AOJu0YyhoF00WwE+j2uS9qcOT2gJTmSRcBecdyq6UvhEhiMcIjSoBudO
	etGJCOmMeXMX9+BZGkipwOLoFA==
X-Google-Smtp-Source: AGHT+IEr4kRNf11XniaflwZ5G4MFT6CEIrEsTvEvbpcV/reJoBZs+xiAbEYbAhT6n5rT/1rjg8mLWA==
X-Received: by 2002:a05:6a20:6a10:b0:13d:ee19:7725 with SMTP id p16-20020a056a206a1000b0013dee197725mr12015955pzk.12.1691480036426;
        Tue, 08 Aug 2023 00:33:56 -0700 (PDT)
Received: from localhost (97.176.124.34.bc.googleusercontent.com. [34.124.176.97])
        by smtp.gmail.com with UTF8SMTPSA id i5-20020a170902eb4500b001b04c2023e3sm8161899pli.218.2023.08.08.00.33.53
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 08 Aug 2023 00:33:55 -0700 (PDT)
From: Hsin-Te Yuan <yuanhsinte@chromium.org>
X-Google-Original-From: Hsin-Te Yuan <yuanhsinte@google.com>
To: Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org,
	Hsin-Te Yuan <yuanhsinte@google.com>
Subject: [PATCH v2] arm64: dts: mt8195-cherry-tomato: change watchdog reset boot flow
Date: Tue,  8 Aug 2023 07:33:07 +0000
Message-ID: <20230808073342.1054762-1-yuanhsinte@google.com>
X-Mailer: git-send-email 2.41.0.640.ga95def55d0-goog
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230808_003359_696683_252CDC53 
X-CRM114-Status: GOOD (  10.10  )
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

The external output reset signal was originally disabled and sent from
firmware. However, an unfixed bug in the firmware on tomato prevents
the signal from being sent, causing the device to fail to boot. To fix
this, enable external output reset signal to allow the device to reboot
normally.

Signed-off-by: Hsin-Te Yuan <yuanhsinte@google.com>
---

Changes in v2:
- Limit the effect only on tomato.

 arch/arm64/boot/dts/mediatek/mt8195-cherry-tomato-r1.dts | 4 ++++
 arch/arm64/boot/dts/mediatek/mt8195-cherry-tomato-r2.dts | 4 ++++
 arch/arm64/boot/dts/mediatek/mt8195-cherry-tomato-r3.dts | 4 ++++
 3 files changed, 12 insertions(+)

diff --git a/arch/arm64/boot/dts/mediatek/mt8195-cherry-tomato-r1.dts b/arch/arm64/boot/dts/mediatek/mt8195-cherry-tomato-r1.dts
index 2d5e8f371b6de..a82d716f10d44 100644
--- a/arch/arm64/boot/dts/mediatek/mt8195-cherry-tomato-r1.dts
+++ b/arch/arm64/boot/dts/mediatek/mt8195-cherry-tomato-r1.dts
@@ -23,3 +23,7 @@ &sound {
 &ts_10 {
 	status = "okay";
 };
+
+&watchdog {
+	/delete-property/ mediatek,disable-extrst;
+};
diff --git a/arch/arm64/boot/dts/mediatek/mt8195-cherry-tomato-r2.dts b/arch/arm64/boot/dts/mediatek/mt8195-cherry-tomato-r2.dts
index 2586c32ce6e6f..2fe20e0dad836 100644
--- a/arch/arm64/boot/dts/mediatek/mt8195-cherry-tomato-r2.dts
+++ b/arch/arm64/boot/dts/mediatek/mt8195-cherry-tomato-r2.dts
@@ -43,3 +43,7 @@ &sound {
 &ts_10 {
 	status = "okay";
 };
+
+&watchdog {
+	/delete-property/ mediatek,disable-extrst;
+};
diff --git a/arch/arm64/boot/dts/mediatek/mt8195-cherry-tomato-r3.dts b/arch/arm64/boot/dts/mediatek/mt8195-cherry-tomato-r3.dts
index f54f9477b99da..dd294ca98194c 100644
--- a/arch/arm64/boot/dts/mediatek/mt8195-cherry-tomato-r3.dts
+++ b/arch/arm64/boot/dts/mediatek/mt8195-cherry-tomato-r3.dts
@@ -44,3 +44,7 @@ &sound {
 &ts_10 {
 	status = "okay";
 };
+
+&watchdog {
+	/delete-property/ mediatek,disable-extrst;
+};
-- 
2.41.0.640.ga95def55d0-goog


