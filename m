Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7015DD41C13
	for <linux-mediatek@archiver.kernel.org>; Wed, 13 Nov 2024 08:18:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:Message-Id:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=L/uGdh4k87UdLsVlqrkIfn4gIIwnutqsKO4ayJkibeU=; b=uHDEOE0to4/i29ICEdJAtGItba
	PU4l5OwrcEYMMNauFm74Nafuv6V/Np/JQALHM1ycTot1vBNaVa+aQNHZxnsELsaimUTHPZfmieoCA
	48cS+dHSNExuPHOQ4YbJEPXCTucou1ZlG58B6vBKXgXEmLdy3qSn7VhqOfTn8Zu2QMfIuymohHlyx
	FZ9ZYT48CaFb3RAXeccH3N7qYX5mUAt2U+NKSc3e/5w/RmghvFJDcPOmiab1kYGa44pqu3nOh961m
	YzKRr3q+c/+5BwGVeeCliCqEorjdmEXrWzswnyhYVNV2qWrS7VYQ8QjPOmI3WPWcaLRQOvUtoWlNw
	sfl0c5yw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tB8aQ-0000000659r-1aPk;
	Wed, 13 Nov 2024 08:18:50 +0000
Received: from mail-pl1-x62d.google.com ([2607:f8b0:4864:20::62d])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tB8Yc-000000064rj-0InP
	for linux-mediatek@lists.infradead.org;
	Wed, 13 Nov 2024 08:17:00 +0000
Received: by mail-pl1-x62d.google.com with SMTP id d9443c01a7336-20c693b68f5so68927955ad.1
        for <linux-mediatek@lists.infradead.org>; Wed, 13 Nov 2024 00:16:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1731485817; x=1732090617; darn=lists.infradead.org;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:from:to:cc:subject:date:message-id:reply-to;
        bh=L/uGdh4k87UdLsVlqrkIfn4gIIwnutqsKO4ayJkibeU=;
        b=RJnfox0SVt+DoLswb56Z17ScNI0Mt6LMhotSPNn1fo+o44M0XTMEzxgpwK6O4V+ttx
         iaGhtzSOrgMjwZ+UFTMq2Qq6uL79BjBv6o0xAb/8FglHC+k1N6Ix1yjpitC5tWvJxoSg
         2+0mR5dm6c3rpKudH/1zIIyHHgCIcqIwWrfUA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1731485817; x=1732090617;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=L/uGdh4k87UdLsVlqrkIfn4gIIwnutqsKO4ayJkibeU=;
        b=q+8bH8rQYPGxVwYlHRu+uAaiUsb0ksBLOWhHL3EIvJ5MfXGCaewols/cvfQCEis59s
         vTzZSGFEruMM0g5SVIEzGEgdVa+xEBhbvAhZsme8y1Hl5GwofBB0kEUalBkybX9lLuwq
         keDRfHmFq4+tzzCu4IAMgzPPkvTiLCdaq0F5dxFpOZ3OwHm1RBuAZV3b5/FhAjqYIUjB
         0WwaeWeP9B26WFo6ECU481fSl/ZUt65UKZJGsMZJ+qaypqxNINOBPvWkjivd+hyZalkn
         RrKMYf3OvPUxaoBZUQGFwfoYIELryekZxpzfIiJ9WL+FuRNmfqfFZC/+wvD7HYsYUkxB
         cRBA==
X-Forwarded-Encrypted: i=1; AJvYcCXXnAE/wyhFd9A4djJ124m/uD2WH7T1A37L24CQeDZOkoSNWKM6zD4NBNUAKOPiJhsPYPReFOIw7g5F82StzQ==@lists.infradead.org
X-Gm-Message-State: AOJu0Yy/C2OaK3kTHYKll5yBtidmW8ec7KVFwdyqK7hds8HckTzCCybd
	TNkNOTDa3zc+p5zclIMYRfrC3Qfz6+6nnELeGSBM90MUWEdkO0LMNBMaYB5V2w==
X-Google-Smtp-Source: AGHT+IHPhYwkzPsxjo/RCUL5hnCpKp45auPZIIYVaYgX0w4KzvUg5iggyNngj3Fzi9Z6NWyiw/1UDw==
X-Received: by 2002:a17:903:1ca:b0:20c:ce1f:13bd with SMTP id d9443c01a7336-211b5c3f07cmr20960895ad.18.1731485816613;
        Wed, 13 Nov 2024 00:16:56 -0800 (PST)
Received: from yuanhsinte-p620-1.tpe.corp.google.com ([2401:fa00:1:10:a280:b47c:f4f6:1c31])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-21177e69029sm105462645ad.230.2024.11.13.00.16.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 13 Nov 2024 00:16:56 -0800 (PST)
From: Hsin-Te Yuan <yuanhsinte@chromium.org>
Date: Wed, 13 Nov 2024 16:16:53 +0800
Subject: [PATCH RESEND v4] arm64: dts: mt8183: set DMIC one-wire mode on
 Damu
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241113-damu-v4-1-6911b69610dd@chromium.org>
X-B4-Tracking: v=1; b=H4sIAHRgNGcC/7WOuw7CMBAEfwW55pBfSWwqCmgpoEQUTnImLhIjB
 wwI5d8xKZAQNBSUe7qdnTvpMTjsyXxyJwGj653vUpDTCaka0x0QXJ0y4ZRLRqmG2rRnMMJyK2S
 hJNUkvR4DWncdMTuyWW1X6yXZp7sNvoVTE9C8IFQzCr5DuLiAEDkw4GUpaZ0ZUVm1qJrUced25
 sPhiW5cf/LhNgpGMQ68u0SREIxrWSlkueL6HfHUiPJbT6ZeoXRZsLLOM55/TP/1f/TKfvfaD8P
 wAFpDMEK2AQAA
X-Change-ID: 20241009-damu-a3f2f3478409
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 Hsin-Yi Wang <hsinyi@chromium.org>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, 
 Hsin-Te Yuan <yuanhsinte@chromium.org>
X-Mailer: b4 0.15-dev-2a633
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241113_001658_181483_ED97B8F1 
X-CRM114-Status: GOOD (  10.13  )
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

From: Hsin-Yi Wang <hsinyi@chromium.org>

Sets DMIC one-wire mode on Damu.

Fixes: cabc71b08eb5 ("arm64: dts: mt8183: Add kukui-jacuzzi-damu board")
Signed-off-by: Hsin-Yi Wang <hsinyi@chromium.org>
Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Signed-off-by: Hsin-Te Yuan <yuanhsinte@chromium.org>
---
Changes in v4:
- Add Reviewed-by tag back, which is dropped in v3
- Link to v3: https://lore.kernel.org/r/20241009-damu-v3-1-1294c8e16829@chromium.org

Changes in v3:
- Add missing Sign-off-by tag
- Link to v2: https://lore.kernel.org/r/20240910-one-wire-v2-1-2bb40d5a3cf8@chromium.org

Changes in v2:
- Add fixes tag 
- Link to v1: https://lore.kernel.org/r/20240910-one-wire-v1-1-d25486a6ba6d@chromium.org
---
 arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-damu.dts | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-damu.dts b/arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-damu.dts
index 0b45aee2e29953b6117b462034a00dff2596b9ff..06a689feff52945d141d196d439cba034f25fdf6 100644
--- a/arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-damu.dts
+++ b/arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-damu.dts
@@ -26,6 +26,10 @@ &touchscreen {
 	hid-descr-addr = <0x0001>;
 };
 
+&mt6358codec {
+	mediatek,dmic-mode = <1>; /* one-wire */
+};
+
 &qca_wifi {
 	qcom,ath10k-calibration-variant = "GO_DAMU";
 };

---
base-commit: 75b607fab38d149f232f01eae5e6392b394dd659
change-id: 20241009-damu-a3f2f3478409

Best regards,
-- 
Hsin-Te Yuan <yuanhsinte@chromium.org>


