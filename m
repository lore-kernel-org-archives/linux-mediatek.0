Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 94D5CC25B45
	for <linux-mediatek@archiver.kernel.org>; Mon, 23 Oct 2023 14:41:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=btxrc1J+7nlpNBhaaQIbXhy+BRoKrBh7Tei2ReYceTw=; b=LC5tXb27e+MTO/mjdp8gYdIKn5
	Felt8wU/CkQ6PRm8HakHclUlUyvkrp2y/EH+KRxWcAjX0tNUGWaM/113JVPffRavOEjjOqmItGsBy
	/X/EnMOd2r29bpDApVDrMNAhfcU1qMjt7EC11mMcVywizL0CQmKIatk3uvU/Rorja9rjsw+Jn95pk
	8HwOD2KmchxnAHEpNTglX7VJ3qA6uUkLid1yrGNkEkglDZCJZb9GrnUNGOE8u1jV2yzpk31lgbz1O
	wbfAA2AnThQckcZG7ZTp1rs6Y2z4KJuSo0Q7EO7W/pIWm/NDOfCYQH35uGVlJv5eoZDyrqNvaMpZe
	nkFnn9uQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1quw7Z-007aE0-0W;
	Mon, 23 Oct 2023 14:41:33 +0000
Received: from mail-vs1-xe36.google.com ([2607:f8b0:4864:20::e36])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1quw6t-007ZeM-1W
	for linux-mediatek@lists.infradead.org;
	Mon, 23 Oct 2023 14:40:52 +0000
Received: by mail-vs1-xe36.google.com with SMTP id ada2fe7eead31-45895225422so826555137.3
        for <linux-mediatek@lists.infradead.org>; Mon, 23 Oct 2023 07:40:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1698072050; x=1698676850; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=btxrc1J+7nlpNBhaaQIbXhy+BRoKrBh7Tei2ReYceTw=;
        b=ccSIihA3yi+qCu8WFCLfGXRMpYkO9W9XjifwGpeUyZCDawkZFHmCqLKGxqJI2s3O/W
         F3vvyE4sy73knZbQ0swkwTGsDJdo8aU3F6kjLptobD4YG71kbFuI8/WPakib7cWnDMGX
         dgRD+PsLcGMsuISpIU89ozLKhaCcrVT/Ehqq1v8bB91Er+kDTMVnBPxbjn0s1BmRHBkv
         rLmIybHFa7ArmnCH7g3DPmgXwebOhpWggHva8vzR9Io1kU41Bmxibv3BIPmDcx16Om3o
         7DKu/UoHmkfEHMlka2pJMKH+OT52hRBS+7diktjghsA4pVZgASx8bEkkFhbwDBBjfJ5O
         LGdg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1698072050; x=1698676850;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=btxrc1J+7nlpNBhaaQIbXhy+BRoKrBh7Tei2ReYceTw=;
        b=AGwSoip832LQBaJgF2RuU5E7nCXObTpEfCOhzR/YCyckMxZImtdQN14VPrAeWSQAn9
         JnBB7+1J0U9zCOPdiqimU4+TfdVlA2y7otpIp6MNYXc4dCEXNhktheLVL5w56XNuTjR9
         bNQoBVbio7g4T1u+BKjsICnCF7wN9ytRdJDDnU+Sk5XPwe6F1MtRrGuQsrP0sx6k14Fp
         mdJTmpdkBGvjVKOPHa1+wqn0/u/GSsh71s6tF8I0VWYanM8Dl6jQTyrTuUxVXZ1dZIre
         sEHN5MUWE0sW/4mCyXWy7bER5Db3s/ksYwHMWUXuyGsJlVdlZSd4xpnibRXnqH9n8Sab
         iYdg==
X-Gm-Message-State: AOJu0Yw9TwD2XtMS3nJlUpq2AQwuqxX2FPPnLgMOP29ffv6Qaq/iDQNL
	NAKNbezCzegpizUrDcyLYrEtEg==
X-Google-Smtp-Source: AGHT+IEHtN0BO7u7QDArNCPWdW4jkZH4U2Tgzur52L0BG1r41rfx44EWTcGQl9iPYctJnK5hBurJEQ==
X-Received: by 2002:a05:6102:4741:b0:457:c025:4c7b with SMTP id ej1-20020a056102474100b00457c0254c7bmr5878640vsb.19.1698072050079;
        Mon, 23 Oct 2023 07:40:50 -0700 (PDT)
Received: from [127.0.1.1] ([93.5.22.158])
        by smtp.googlemail.com with ESMTPSA id f1-20020a05620a408100b007789a3499casm2725020qko.115.2023.10.23.07.40.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Oct 2023 07:40:49 -0700 (PDT)
From: Alexandre Mergnat <amergnat@baylibre.com>
Date: Mon, 23 Oct 2023 16:40:09 +0200
Subject: [PATCH 09/18] dt-bindings: display: mediatek: ovl: add binding for
 MT8365 SoC
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20231023-display-support-v1-9-5c860ed5c33b@baylibre.com>
References: <20231023-display-support-v1-0-5c860ed5c33b@baylibre.com>
In-Reply-To: <20231023-display-support-v1-0-5c860ed5c33b@baylibre.com>
To: Chun-Kuang Hu <chunkuang.hu@kernel.org>, 
 Philipp Zabel <p.zabel@pengutronix.de>, David Airlie <airlied@gmail.com>, 
 Daniel Vetter <daniel@ffwll.ch>, Rob Herring <robh+dt@kernel.org>, 
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 Jitao Shi <jitao.shi@mediatek.com>, Xinlei Lee <xinlei.lee@mediatek.com>, 
 CK Hu <ck.hu@mediatek.com>, Thierry Reding <thierry.reding@gmail.com>, 
 =?utf-8?q?Uwe_Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>, 
 Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>
Cc: dri-devel@lists.freedesktop.org, linux-mediatek@lists.infradead.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-pwm@vger.kernel.org, 
 Alexandre Mergnat <amergnat@baylibre.com>
X-Mailer: b4 0.12.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=860; i=amergnat@baylibre.com;
 h=from:subject:message-id; bh=M4WYL+KrM0LAMGbIVVc2NhXvV7PADZ7FKnKax4OIhj4=;
 b=owEBbQKS/ZANAwAKAStGSZ1+MdRFAcsmYgBlNoXP+76mL8HcY0aJG5HTEVTd79bVZFTl7La+u6T2
 JtLgOyaJAjMEAAEKAB0WIQQjG17X8+qqcA5g/osrRkmdfjHURQUCZTaFzwAKCRArRkmdfjHURW52EA
 CWVgb591a/Qg88wnSQZ4uFhh17HaC4VEqoWqnc5n29xLfeW4uwo4iuJ1oVMC+IgR5Sa4OZv57VWYUz
 1jpU9G55weccJHI8BBTZEpR52MScVpl88+GfNRQhBDdRXI2GiN1yBFQlSJM9b0L8s4xlrZKDvDX4Z7
 gP5EZEa20WZkJN/ZIwRqeU6NaN50M0VhcX/skUqfrivEaeM7hkBhqBD/O9Vs/0Iw6+VolwYEFlr1wy
 Khn/iFY3FUx5JS5iMwAlV0CDUo9gDfbFhVV31rxhCRnK4KbTSnl9Dz+kEoJD0dUfIjNGJHxGm6Cn4U
 0bz6kYLJId4zAYyUeKK8PoJTCEeV7kgjI27B9yxPGCzK6KITdroOYCTMt6QP9DqY7KMexqo6SAyR6B
 knw3j9zrIxxYNWVptIoES4cPRcD5nYKrwvJ8DcCRx9TOKqpXnzkWifEGFWAQqnOGNTKk2o+MurGpkk
 KXaBkkZXiMWmHPYO9GpgdrI2M7VZwq/IQVIKc7aEe8pZjpPX868/ZSdgszL1nRULbhHUrzJaLLKMsS
 WNe7bfxjPFr+NqgEf0vr8ZypN2tC1fqKSXgB4MWxMb0n6Uwy2+Tx/6bfn9UwPfbwLkfoaUOlULrghE
 wJoHb2K2NMlrEE8w5A0+VvaMQcUD64/D5uzOy3Z5Ilnx4VcaTFuadcOxuUjw==
X-Developer-Key: i=amergnat@baylibre.com; a=openpgp;
 fpr=231B5ED7F3EAAA700E60FE8B2B46499D7E31D445
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231023_074051_507093_4909D6AB 
X-CRM114-Status: UNSURE (   9.18  )
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

Display Overlay for MT8365 is compatible with another SoC.
Then, add MT8365 binding along with MT8192 SoC.

Signed-off-by: Alexandre Mergnat <amergnat@baylibre.com>
---
 Documentation/devicetree/bindings/display/mediatek/mediatek,ovl.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/display/mediatek/mediatek,ovl.yaml b/Documentation/devicetree/bindings/display/mediatek/mediatek,ovl.yaml
index 3e1069b00b56..2873bbdf3979 100644
--- a/Documentation/devicetree/bindings/display/mediatek/mediatek,ovl.yaml
+++ b/Documentation/devicetree/bindings/display/mediatek/mediatek,ovl.yaml
@@ -43,6 +43,7 @@ properties:
       - items:
           - enum:
               - mediatek,mt8186-disp-ovl
+              - mediatek,mt8365-disp-ovl
           - const: mediatek,mt8192-disp-ovl
 
   reg:

-- 
2.25.1


