Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 81414C46CD2
	for <linux-mediatek@archiver.kernel.org>; Wed, 24 Jan 2024 07:52:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:Message-Id:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=1PwaNNHoovr1XsO2ShyI+BpkXh2zlE7frt/xlHXVHJM=; b=EPRqj9B+06WFlpsqQiy33Zr9Ff
	vyHfS3cEtROIBRLLzDPbF8xYagwDvLYGOCFPiILIVzk0YzRyKYHl9MBeHUCE3dLsVivr4MIigSirS
	Ro96wgVlg082fwC3clEXr7vXKHyN1U9Ua7zaCD344+jZM/GA6yF6KLmlsxo36Lef6VxcKqU7CNcr/
	H7YMJm1pT+xQArhOn6gqwKchhSLGRJWXFvv1jbif3s8mBThvrz41szolOHZdAfDuK+GaqZolmnNvs
	ZHdNqc/8XXU0pRpuWgldsyA2QlUqYUk3BoKTfPST5rIKsD7CtqlsIGRn7yTmkLc3E7F9ahfaWPxD1
	lkhbrldw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rSY3O-001vUZ-2u;
	Wed, 24 Jan 2024 07:52:10 +0000
Received: from mail-oa1-x32.google.com ([2001:4860:4864:20::32])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rSY3K-001vPl-0i
	for linux-mediatek@lists.infradead.org;
	Wed, 24 Jan 2024 07:52:09 +0000
Received: by mail-oa1-x32.google.com with SMTP id 586e51a60fabf-210e5a5fa70so2546721fac.0
        for <linux-mediatek@lists.infradead.org>; Tue, 23 Jan 2024 23:52:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1706082722; x=1706687522; darn=lists.infradead.org;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:from:to:cc:subject:date:message-id:reply-to;
        bh=1PwaNNHoovr1XsO2ShyI+BpkXh2zlE7frt/xlHXVHJM=;
        b=RjS4DWmVQ7wTR0dYoyeFycGwpsSZWRKAysOXWBm+JYN7dFdgQvCkglSRNk+q58sfq9
         Ykben9+e27PDz6ur2vslBj24Phiua0jW48zS8lpAcxfr4xLosuiq8qisVvmMVqIsnugL
         kn0KsD4TURjW8UbaJqTpHNF0COOrmjGvZ5Z3I=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1706082722; x=1706687522;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=1PwaNNHoovr1XsO2ShyI+BpkXh2zlE7frt/xlHXVHJM=;
        b=o+iHkjenwsQPvm6pjwUIlUlxsGMR+xJiK7r7QXfYzbNQSfLdEdU8zocbcNAjdX5dFC
         KWxnfTuPyHcW2uL9PGhcrBGBl2TRv8/QasTDuiLgHHWvbmQTt90xKASwcCwC0511ngAv
         fkVhDJoL2p+QYMEIXoXqhhvZs+PDH++ay6j4noM97DRI1pHkVWOwBpD2HJ2FYFaV448c
         3Ch91ZOU2yzVtFtHoeu4i4HJBrKLiLnhk8g8ke2nlD59PgpzadqzBsuPZNaJ6GEhPZLu
         oe7FyI5bPU8/2hJsieybZ1pgTPtjTYVabOYlA7MI4dTTeuBRGt1eAQWTj8WsCKmuJ0We
         eiaw==
X-Gm-Message-State: AOJu0YwIZG8dOBS53OHhTiMBH3xwupeoizQJqMbmpmXRJ83J82EcF3j+
	k6ToJjUD/eau7xZEkjbEKgCn3YP0V5caY95Rm5OI81uPwrnCOiJ8w0Z7wf/PUNJA6jJUkcpLf7g
	=
X-Google-Smtp-Source: AGHT+IG51W3Vw6LcYiGmpG5C4lnBiPbggs+k9JuCPpd6ZqebtU/7ymkKXYOcNSQBcqXN1xFPTlfzEA==
X-Received: by 2002:a05:6870:e40d:b0:214:807e:8a05 with SMTP id n13-20020a056870e40d00b00214807e8a05mr2978568oag.2.1706082721789;
        Tue, 23 Jan 2024 23:52:01 -0800 (PST)
Received: from yuanhsinte1.c.googlers.com (2.210.143.34.bc.googleusercontent.com. [34.143.210.2])
        by smtp.gmail.com with ESMTPSA id r21-20020a635155000000b005c1ce3c960bsm10941238pgl.50.2024.01.23.23.51.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 23 Jan 2024 23:52:01 -0800 (PST)
From: Hsin-Te Yuan <yuanhsinte@chromium.org>
Date: Wed, 24 Jan 2024 07:51:57 +0000
Subject: [PATCH v3] arm64: dts: mt8195-cherry-tomato: change watchdog reset
 boot flow
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240124-send-upstream-v3-1-5097c9862a73@chromium.org>
X-B4-Tracking: v=1; b=H4sIAJzBsGUC/x2NQQrCQAwAv1JyNtDtomz9inhIt9EGaixJK0Lp3
 w0eZ2CYHZxN2OHa7GD8EZe3BuRTA3UifTLKGAxd2+W2pILOOuK2+GpML+Q+8SWdqfS5QjQDOeN
 gpHWKSrd5DrkYP+T7n9zux/EDW1ZYVnQAAAA=
To: Rob Herring <robh+dt@kernel.org>, 
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, 
 Hsin-Te Yuan <yuanhsinte@google.com>, 
 Hsin-Te Yuan <yuanhsinte@chromium.org>
X-Mailer: b4 0.12.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240123_235206_273571_D0A81659 
X-CRM114-Status: GOOD (  10.67  )
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

From: Hsin-Te Yuan <yuanhsinte@google.com>

The external output reset signal was originally disabled and sent from
firmware. However, an unfixed bug in the firmware on tomato prevents
the signal from being sent, causing the device to fail to boot. To fix
this, enable external output reset signal to allow the device to reboot
normally.

Fixes: 5eb2e303ec6b ("arm64: dts: mediatek: Introduce MT8195 Cherry platform's Tomato")
Signed-off-by: Hsin-Te Yuan <yuanhsinte@chromium.org>
---
Changes in v3:
- Add Fixes tag

Changes in v2:
- Limit the effect only on tomato.
---
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

---
base-commit: 64b50fcb03649ca7f0d762a50e7a3484cfc1d586
change-id: 20230818-send-upstream-e91e615a893c

Best regards,
-- 
Hsin-Te Yuan <yuanhsinte@chromium.org>


