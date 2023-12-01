Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 133CFC07E97
	for <linux-mediatek@archiver.kernel.org>; Fri,  1 Dec 2023 07:08:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=kf9Ef3ZU7ACSrQpFfV8EW4u1UjhYZlyDTx04rSBoN3o=; b=5AqHDZ8HdY6HO+SjJPEPHFtQTX
	pDgeGURf5PbZL03Zh394FFBnM3uidk7/H+3HesNXfYhJOLr0lzLYN6kYzEpakpQMOThjxdgy74h3U
	Ue0ZDf4/joiDZZ/WLRC0UHvtCTbcZzflEauV5Wzap+WSNPDCAi0BEWqQXBS1cthFBEYl0r0FsKjop
	hPVT/M/FWqJf1iH6QkaUd6YOmBsYKehVu6cdjxJRgsjlouJZ03UFqFzV2xDODXfO36c++zj0jprmE
	7PueAYiAxy1IjQUWWL5SsUGN8Mvob4uWB063yvVo9JcykhzObBxfPfjmXidVaxLpRbpL8zrGF3mxU
	ysj+QB4Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1r8xd4-00CqeL-39;
	Fri, 01 Dec 2023 07:08:02 +0000
Received: from mail-pl1-x629.google.com ([2607:f8b0:4864:20::629])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1r8xco-00CqTG-1c
	for linux-mediatek@lists.infradead.org;
	Fri, 01 Dec 2023 07:07:48 +0000
Received: by mail-pl1-x629.google.com with SMTP id d9443c01a7336-1cfafe3d46bso2116885ad.0
        for <linux-mediatek@lists.infradead.org>; Thu, 30 Nov 2023 23:07:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1701414465; x=1702019265; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=kf9Ef3ZU7ACSrQpFfV8EW4u1UjhYZlyDTx04rSBoN3o=;
        b=aYbmEIwBoV+bAUyNddt/ZAm24QaC43ca5NamlawTMhhm7zgEJUdyro6CM4ChA25Rp4
         L44FB/MSxMSjmj4BWiFu0vX0hp5zFaYgYKW4nDuF4Bmt4b4QwDUvyXqook+NqXiawEnW
         2GUuyyIeTi4uCcLcRubLr40VMuN0j8MfNtfIE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701414465; x=1702019265;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=kf9Ef3ZU7ACSrQpFfV8EW4u1UjhYZlyDTx04rSBoN3o=;
        b=D77WvE+3NpbtlrYflmxAk4LLGsL5PAzcvVR9aFKh9dDNe5Z9hQI50XrGqCcnMDuqdh
         el6J4L7k9tPWtMEnuIUr4zGSPsvrJaueQ96YxFDETtL9DyxhjhW85oh7/dJRHxKipUyy
         Tjt04NtSd1DUnhbDrhyzcxHED3oxbguMjLY9xdAjRvKs6OaeIxo2tT8ZztihhBMdYUy9
         mWTKnJB6Z0q2qORefDDQiJ5xgNmlHwgXVEkNMF1zeru4gbwhMFL6J3fCcnsXitoSBBx2
         mBYnWlH1BHF1ASbASitiZfvxpW1cT2rvYEG/w+6nV5NKkOUBai4LgqMlMzuzrh9goH9i
         aUKA==
X-Gm-Message-State: AOJu0Yz7SO8Jt9wQe9Q9u6DGOlAYZx7ArecljWR9r499pfxjKjEsJRLY
	1dYzh2+uBxm2bdfAMTzuNbJCtw==
X-Google-Smtp-Source: AGHT+IGIbCzmIDzJDSQxwRuPwXzrNiFhKYnu2L4N6gFeW0Zicdwpq2ZPNo4PD/Ikn7kumZbw+IRFag==
X-Received: by 2002:a17:902:ea84:b0:1cc:68c1:cab5 with SMTP id x4-20020a170902ea8400b001cc68c1cab5mr25292928plb.14.1701414465113;
        Thu, 30 Nov 2023 23:07:45 -0800 (PST)
Received: from wenstp920.tpe.corp.google.com ([2401:fa00:1:10:720a:d435:c253:2402])
        by smtp.gmail.com with ESMTPSA id y10-20020a1709027c8a00b001cfa0c04553sm2558684pll.116.2023.11.30.23.07.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 30 Nov 2023 23:07:44 -0800 (PST)
From: Chen-Yu Tsai <wenst@chromium.org>
To: Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>
Cc: Chen-Yu Tsai <wenst@chromium.org>,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2 4/9] dt-bindings: arm: mediatek: Add MT8186 Rusty Chromebook
Date: Fri,  1 Dec 2023 15:07:08 +0800
Message-ID: <20231201070719.1229447-5-wenst@chromium.org>
X-Mailer: git-send-email 2.43.0.rc2.451.g8631bc7472-goog
In-Reply-To: <20231201070719.1229447-1-wenst@chromium.org>
References: <20231201070719.1229447-1-wenst@chromium.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231130_230746_536882_9892018C 
X-CRM114-Status: UNSURE (   8.84  )
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

Add an entry for the MT8186 based Rusty Chromebook, also known as the
Lenovo 100e Chromebook Gen 4.

Signed-off-by: Chen-Yu Tsai <wenst@chromium.org>
---
Changes since v1:
- Reorder SKU numbers in descending order.

 Documentation/devicetree/bindings/arm/mediatek.yaml | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/Documentation/devicetree/bindings/arm/mediatek.yaml b/Documentation/devicetree/bindings/arm/mediatek.yaml
index 95d2b430ab17..85d394e390f0 100644
--- a/Documentation/devicetree/bindings/arm/mediatek.yaml
+++ b/Documentation/devicetree/bindings/arm/mediatek.yaml
@@ -206,6 +206,12 @@ properties:
           - enum:
               - mediatek,mt8183-pumpkin
           - const: mediatek,mt8183
+      - description: Google Rusty (Lenovo 100e Chromebook Gen 4)
+        items:
+          - const: google,steelix-sku196609
+          - const: google,steelix-sku196608
+          - const: google,steelix
+          - const: mediatek,mt8186
       - description: Google Steelix (Lenovo 300e Yoga Chromebook Gen 4)
         items:
           - enum:
-- 
2.43.0.rc2.451.g8631bc7472-goog


