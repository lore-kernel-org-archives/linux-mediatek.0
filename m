Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8689BC3DA6E
	for <linux-mediatek@archiver.kernel.org>; Thu, 28 Dec 2023 10:57:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=snYrry9zLuh+jWtvPEimeAzwraocI1J6hz5mOunhcYM=; b=rhNwz3JXhtG9JOI8yba22N2u0E
	JUKLH0T69dGCCikELEdwVVgXtgNb4qxOfDyJtcUJxpbBBI+kBnYmPgamSCJs/KKQF/pVuinky8voB
	EPHfBZo8PyeYFg8Kl1N+4vWE8A09NCVhDU0YVK3AnjLQeFL18WRCXT/MyDwPKYSVKTCf8lD2/BNeg
	Y8PxOltURykB1UiE4d5kYMfwMkCREFFZEAkpEQcl/ZkwbMQvYc6eZRP/p0TppWE1HYs6BDt76RPZf
	XUUD9dBl+BV+D8SLAcQeUI0OCq0QuXulb7gqIkohK2UYtYTDLGH0iqimESfiZteWxPMzyFGHbu2WN
	r15ICjNg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rIo53-00GcNs-1w;
	Thu, 28 Dec 2023 10:57:37 +0000
Received: from mail-pg1-x536.google.com ([2607:f8b0:4864:20::536])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rIo50-00GcM2-1S
	for linux-mediatek@lists.infradead.org;
	Thu, 28 Dec 2023 10:57:35 +0000
Received: by mail-pg1-x536.google.com with SMTP id 41be03b00d2f7-5ce0efd60ddso900768a12.0
        for <linux-mediatek@lists.infradead.org>; Thu, 28 Dec 2023 02:57:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1703761049; x=1704365849; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=snYrry9zLuh+jWtvPEimeAzwraocI1J6hz5mOunhcYM=;
        b=ettUlGhbPZfN+ZMgaMeJoAlOy1UnWNWBTVcndT4WIlG6Hke3k+dqekMssNzewi/PAk
         sfl0cYRXe7v4nRfT59QkhIz0v47DM1k4Ao2ysXgSPJyo1bDt6XnsipFq5Ive3l7kGsUp
         IppGyshS6zmgYgb/EbtlrnXHCVVgh+W7ehw3g=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1703761049; x=1704365849;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=snYrry9zLuh+jWtvPEimeAzwraocI1J6hz5mOunhcYM=;
        b=IXHlLVdda7jeV0Suo0su3tueYd7G6dP0sWqIyvXW9/WxC5B4MPC9SwMS4X+8ufrc3s
         s8sH2J6InpzY6g2Od6EqlHL8qDDRDx5L8W03Ceg9At11hkMWCugJjkpI7ziYU/6eZDJ4
         3lt8DO0fHB6kFYA/U5Q8c1ksZWSNNMGr+tSgF/2GVTxTrV1Pv0SJ+IUcY+z3SxNnZ8OI
         VjJfhtn0P3wQrfqbigBfZJivPXtuYKCR0hAcnJ1GOIkoeG+Bx9EKSFD+GWvHNdml+ogT
         QLfain2WdZkQB8+14JsBnIdr4xYQtSspVH+XZRn+7XVkBDM74kxGXnw0iABBvcrVgufl
         UTFQ==
X-Gm-Message-State: AOJu0YxpZxYt71svbS6sBS4r8q63bAEAawdKEKUbioZ95VVdbmP+19RH
	2ktHtIuDvhEJVDuKZX4B3BgexMYA47sA
X-Google-Smtp-Source: AGHT+IFYsn9RDhTGSpo0c14KN3+HIjTHoXc3vMmiykGJJrVm4NBUKlRdW2Q19ABY3KG4K+gPwIsavg==
X-Received: by 2002:a17:902:b58b:b0:1d3:442e:f0a2 with SMTP id a11-20020a170902b58b00b001d3442ef0a2mr5009163pls.139.1703761049479;
        Thu, 28 Dec 2023 02:57:29 -0800 (PST)
Received: from yuanhsinte-p1g4.corp.google.com ([2401:fa00:1:14:497f:b57b:3927:7371])
        by smtp.gmail.com with ESMTPSA id d14-20020a170902aa8e00b001bf52834696sm13542193plr.207.2023.12.28.02.57.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 28 Dec 2023 02:57:29 -0800 (PST)
From: Hsin-Te Yuan <yuanhsinte@chromium.org>
To: Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: Hsin-Te Yuan <yuanhsinte@chromium.org>,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-mediatek@lists.infradead.org
Subject: [PATCH RESEND v2] arm64: dts: mt8195-cherry-tomato: change watchdog reset boot flow
Date: Thu, 28 Dec 2023 18:57:01 +0800
Message-ID: <20231228105717.719624-1-yuanhsinte@chromium.org>
X-Mailer: git-send-email 2.43.0.472.g3155946c3a-goog
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231228_025734_525103_3679E0F7 
X-CRM114-Status: UNSURE (   9.06  )
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

The external output reset signal was originally disabled and sent from
firmware. However, an unfixed bug in the firmware on tomato prevents
the signal from being sent, causing the device to fail to boot. To fix
this, enable external output reset signal to allow the device to reboot
normally.

Signed-off-by: Hsin-Te Yuan <yuanhsinte@chromium.org>

---

Changes in v2:
- Limit the effect only on tomato.

---
 arch/arm64/boot/dts/mediatek/mt8195-cherry-tomato-r1.dts | 4 ++++
 arch/arm64/boot/dts/mediatek/mt8195-cherry-tomato-r2.dts | 4 ++++
 arch/arm64/boot/dts/mediatek/mt8195-cherry-tomato-r3.dts | 4 ++++
 3 files changed, 12 insertions(+)

diff --git a/arch/arm64/boot/dts/mediatek/mt8195-cherry-tomato-r1.dts b/arch/arm64/boot/dts/mediatek/mt8195-cherry-tomato-r1.dts
index 2d5e8f371b6d..a82d716f10d4 100644
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
index 2586c32ce6e6..2fe20e0dad83 100644
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
index f54f9477b99d..dd294ca98194 100644
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
2.43.0.472.g3155946c3a-goog


