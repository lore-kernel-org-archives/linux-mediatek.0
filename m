Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ABC85CEDD90
	for <linux-mediatek@archiver.kernel.org>; Wed,  9 Oct 2024 13:04:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=js/q0aMZJ/W9aal9lmaG5rYHSuSq8O8kz+/ae21f1/g=; b=IhVbMhOsDyynCIi3YwuTCjzWeR
	et/FYvhovPe/+J/+yzqlEI4wKWvP6la33FkcpaDTrHWes9rkKaC2cHcSHGzTHNBJ7v7LEzu0PpdK2
	N7N8rW/SJL6rk33rl3HROZ1R9qDpRkUywMghc8jAbVrq2wiPHyEZOHOcrqb1TcU9b2OEkF5UVA46G
	Z8NirAUH5M8uuy3LSjwvLaRsa/Fu9I+tfu/UhYww6yHUpWKkieQmOVDkx6+AIE1xiAlkgaWdZDh2E
	VgKey2QLcyfo44iK2uM+iGQe3bXidS6HQjZqsFH8VIu6n7FF1ZlxF2rJfl9I5HZlOgXiGEfybLUtm
	tlpzMrRA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1syWMD-00000009KgY-0rYH;
	Wed, 09 Oct 2024 13:04:01 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1syWIQ-00000009K9r-2OrU
	for linux-mediatek@bombadil.infradead.org;
	Wed, 09 Oct 2024 13:00:06 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Cc:To:In-Reply-To:References:
	Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Sender:Reply-To:Content-ID:Content-Description;
	bh=js/q0aMZJ/W9aal9lmaG5rYHSuSq8O8kz+/ae21f1/g=; b=cLWu7g3R2EuG0igHCeLITd+d//
	PSkku8ECyLD781wxV3KO2rrXTILT/MU6VRx7fpWRxUeY4dESp60Z8k+bVJrcr39kOOAFvziSW2c37
	FabDY8QTcoi1+4/nb5KBaTIh8/UfNlaxGxAdDbZMO6YNBT7/DMEHNvI/Zenr04oLoSp063ZrPRmg/
	H2zvAYh/tg8VyzUa8gdUgFawOB3PcCov8A0X8655NMlTZXukSeycAibfATD0kKynJpXecYNqotxKP
	c3NPCBzp6EG/VFJ9ui4VUeZxh1/IfGMbIN0SL2RqHq9wohKfcsVmH2YDxzSJLVv0e75LBMV9dMRi6
	BnjeFmlA==;
Received: from mail-pl1-x62f.google.com ([2607:f8b0:4864:20::62f])
	by desiato.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1syWIN-00000004xCy-0uXl
	for linux-mediatek@lists.infradead.org;
	Wed, 09 Oct 2024 13:00:05 +0000
Received: by mail-pl1-x62f.google.com with SMTP id d9443c01a7336-20b64584fd4so66282065ad.1
        for <linux-mediatek@lists.infradead.org>; Wed, 09 Oct 2024 06:00:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1728478802; x=1729083602; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=js/q0aMZJ/W9aal9lmaG5rYHSuSq8O8kz+/ae21f1/g=;
        b=ASh6Qow/CiLYgVF+xUvH0Jd6ZNV+xvriEJwFziYSkPt5mFKhDbYegcR2RzEz9aZw7V
         gQhUFXGHBeMfy+0NNSo/BqbyyHC6tAEw0nr1Q8m2YXIO6RZTN8MD3LMSyJv2cwuFhgeX
         mqk7Y9nvaoNG2IjDMZPZts1nPchJO/v9nhnJ4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728478802; x=1729083602;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=js/q0aMZJ/W9aal9lmaG5rYHSuSq8O8kz+/ae21f1/g=;
        b=UpONrcf/bZQdrkk3wxHIJjI0lkBEnEtmTzNwgAx9vIUvFPkWiqXKfzUrG1ElAujqWD
         cTBic/qmitZUaNedNnT5umxsRX7F3XabgAdVgIh9W462DJQOMnPhr4i71ejxQ7d6VShG
         6XG9qwj1+cS1fAQxiQytoCIJuwjsS60W6G0WG754PJJ0wbA2wcjCl/lxhANR9sd7Phii
         J5eIvw2xj3NxWZkilnv+USA4gD4J+eoM2gWXVTeLyQzszBFA5lq17ZOmFTHMbqFCrb6q
         5rx4ro5gq/1VhuS1F3gfRNJCVRkTtpfl7lMD5LI7EHayR/PPumY04Tg2nLQSh6FS48k1
         X6aA==
X-Forwarded-Encrypted: i=1; AJvYcCVreKN/2B+dABVJPRNhvFx2k9OcZluqQnKZL5pJh8rO9wOpsHBGPQGy0FVl0/IwZTSPonINcTD0T3Rhw4Sp9g==@lists.infradead.org
X-Gm-Message-State: AOJu0Yya73OIXzDDCvzM+GUpAeCZOPdOdq4ppfqFWvDJJaPbX0/sJ9oj
	s4jEothMAnWAR8H/vLKfTshX9JVzVGLoU7XqT8Mzc2V9Hbb1PfU02PizKlAWLg==
X-Google-Smtp-Source: AGHT+IG05w2ruhr4EpNBfNHW27ALASG593EK70I5OBAeuwiAb+tAae1qnUFDYWL9wAM6qMI+9fiI/A==
X-Received: by 2002:a17:902:c952:b0:20b:6e74:b712 with SMTP id d9443c01a7336-20c637d29dfmr28747685ad.45.1728478801792;
        Wed, 09 Oct 2024 06:00:01 -0700 (PDT)
Received: from yuanhsinte-p620-1.tpe.corp.google.com ([2401:fa00:1:10:bfd7:eb4:8571:b3f4])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-20c51c21535sm27434005ad.216.2024.10.09.05.59.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 09 Oct 2024 06:00:01 -0700 (PDT)
From: Hsin-Te Yuan <yuanhsinte@chromium.org>
Date: Wed, 09 Oct 2024 20:59:47 +0800
Subject: [PATCH 4/4] arm64: dts: mt8183: Damu: add i2c2's
 i2c-scl-internal-delay-ns
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241009-i2c-delay-v1-4-6cf59721c1d1@chromium.org>
References: <20241009-i2c-delay-v1-0-6cf59721c1d1@chromium.org>
In-Reply-To: <20241009-i2c-delay-v1-0-6cf59721c1d1@chromium.org>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 Hsin-Yi Wang <hsinyi@chromium.org>, 
 Enric Balletbo i Serra <eballetbo@kernel.org>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, 
 Hsin-Te Yuan <yuanhsinte@chromium.org>, 
 Daolong Zhu <jg_daolongzhu@mediatek.corp-partner.google.com>
X-Mailer: b4 0.15-dev-2a633
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241009_140003_442670_E3BD56E2 
X-CRM114-Status: UNSURE (   9.22  )
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

From: Daolong Zhu <jg_daolongzhu@mediatek.corp-partner.google.com>

Add i2c2's i2c-scl-internal-delay-ns.

Fixes: cabc71b08eb5 ("arm64: dts: mt8183: Add kukui-jacuzzi-damu board")
Reviewed-by: Matthias Brugger <matthias.bgg@gmail.com>
Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Signed-off-by: Daolong Zhu <jg_daolongzhu@mediatek.corp-partner.google.com>
Signed-off-by: Hsin-Te Yuan <yuanhsinte@chromium.org>
---
 arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-damu.dts | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-damu.dts b/arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-damu.dts
index 0b45aee2e29953b6117b462034a00dff2596b9ff..65860b33c01fe832f3a4b2e21d24ea6b4f0cba2b 100644
--- a/arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-damu.dts
+++ b/arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-damu.dts
@@ -30,3 +30,6 @@ &qca_wifi {
 	qcom,ath10k-calibration-variant = "GO_DAMU";
 };
 
+&i2c2 {
+	i2c-scl-internal-delay-ns = <20000>;
+};

-- 
2.47.0.rc0.187.ge670bccf7e-goog


