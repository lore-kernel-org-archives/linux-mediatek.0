Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 31A9FC25B6B
	for <linux-mediatek@archiver.kernel.org>; Wed, 25 Oct 2023 21:55:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=79jtSdDl24cfVMtRgsa8bqnoadvLE5wlo58xyGE1d9Q=; b=PeOHOaxBBR2bgtdrl/f+BXaD13
	hGFnKT3cQr0fYD+CrlVKmr5sZT59vB/vyzbPN1T2TRkdYzhjtn8Y31jJ8dyaxrt9NNqu+2HgpjmOb
	gN8cnb++nSLdNLwlCc8DVHSRstq1ngsMEftXWK05DW4aDN7+Tma/0jB/j0QrX+WiYc/DJJnDdHFQM
	B2aK+qj2yL4Hkts51od6/Q/VAWToTf5CQ0wFGItCnkxhQEhYG5qh+cqbmooLyb4Wm7WTrEQIlm/Xc
	gKhQxw9PCta4CBHA1YI+gvEHfmH9X2WxcDp5ZGUDwvnYUhKHdGUUuQo7CabQz/0fHlsom9ayL2A0T
	/r/yNueQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qvlr1-00DCze-13;
	Wed, 25 Oct 2023 21:55:55 +0000
Received: from mail-pf1-x431.google.com ([2607:f8b0:4864:20::431])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qvlqe-00DCjk-1f
	for linux-mediatek@lists.infradead.org;
	Wed, 25 Oct 2023 21:55:36 +0000
Received: by mail-pf1-x431.google.com with SMTP id d2e1a72fcca58-68fb85afef4so213489b3a.1
        for <linux-mediatek@lists.infradead.org>; Wed, 25 Oct 2023 14:55:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1698270929; x=1698875729; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=79jtSdDl24cfVMtRgsa8bqnoadvLE5wlo58xyGE1d9Q=;
        b=Yxj4gxuSO9vz7wQPZC3LPXNpUOh93kJ5Woitx7Duj6/UU0zkD0xnO4C+PIIKunrCRB
         rpVeOd/O+xlyu/5txJiVzTlhkZU1ARsZvg/3IkxQG0h3QzQYNzCu1vYYNXX3xwJT4ImU
         ZTJrgIfd+S99KdAfFbZf1W7aE6R5offrQzNPc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1698270929; x=1698875729;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=79jtSdDl24cfVMtRgsa8bqnoadvLE5wlo58xyGE1d9Q=;
        b=h5rznss4m+pLkZT5dqb9jc9KNJcRTEKY+5KO0oIwBhnhjdJ3mnI5ZYUv5l2xf84yvT
         aSSCXTxueT3oxOb7OHQAK8qh1njC7WOK5fzkhIVXGhwPhSjjFgWxW9Kv8bP262XOjlU9
         qSsoJiIKUzAJc1kymEukarxilo4RNmqDaQHvXy/xPuMRKGE5XYOG5NsiaiZLLvWqMr+r
         1qUPe2tHJHrM3mC7Brw61IN0H/RvXghW3gIBoQAt6f0BMm8YP7cP1guWhLQQgmnnzC7p
         A9I/tcR6Mbu0sb/IMNQiHIcQa1yn+bAbWM0XlsYjVD/Qyhy7i0x5mu16MQlBQz3NTTRz
         7gGw==
X-Gm-Message-State: AOJu0YyEHbOmrsyYtYItjyCDYDsphWEIddqjic1jHLkrOkS/jhgDRiCf
	5qXSzsV+ASUtEk5LNFGk3SNBLQ==
X-Google-Smtp-Source: AGHT+IFuGCQXgqHOERVCnmynQHpCmt3yHZRhhoyZFj7fm++vY0NnVC5T3ML6yQACdGrMP7uHxm1ntg==
X-Received: by 2002:a05:6a20:7fa4:b0:15e:b8a1:57b9 with SMTP id d36-20020a056a207fa400b0015eb8a157b9mr7855392pzj.24.1698270928820;
        Wed, 25 Oct 2023 14:55:28 -0700 (PDT)
Received: from hsinyi.sjc.corp.google.com ([2620:15c:9d:2:f0fe:5c3b:1d70:d0bb])
        by smtp.gmail.com with ESMTPSA id w14-20020a63160e000000b005b8ebef9fa0sm2994943pgl.83.2023.10.25.14.55.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Oct 2023 14:55:28 -0700 (PDT)
From: Hsin-Yi Wang <hsinyi@chromium.org>
To: Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
Cc: Rob Herring <robh+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	=?UTF-8?q?N=C3=ADcolas=20F=20=2E=20R=20=2E=20A=20=2E=20Prado?= <nfraprado@collabora.com>,
	=?UTF-8?q?Bernhard=20Rosenkr=C3=A4nzer?= <bero@baylibre.com>,
	Macpaul Lin <macpaul.lin@mediatek.com>,
	Sean Wang <sean.wang@mediatek.com>,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org
Subject: [PATCH v3 4/7] dt-bindings: arm64: dts: mediatek: Add mt8183-kukui-jacuzzi-makomo
Date: Wed, 25 Oct 2023 14:48:46 -0700
Message-ID: <20231025215517.1388735-5-hsinyi@chromium.org>
X-Mailer: git-send-email 2.42.0.758.gaed0368e0e-goog
In-Reply-To: <20231025215517.1388735-1-hsinyi@chromium.org>
References: <20231025215517.1388735-1-hsinyi@chromium.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231025_145532_608382_EFE02631 
X-CRM114-Status: UNSURE (   9.47  )
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

Add makomo sku0 and sku1 which uses different audio codec.

Signed-off-by: Hsin-Yi Wang <hsinyi@chromium.org>
---
v2->v3: remove rev since match on sku is sufficient.
---
 Documentation/devicetree/bindings/arm/mediatek.yaml | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/Documentation/devicetree/bindings/arm/mediatek.yaml b/Documentation/devicetree/bindings/arm/mediatek.yaml
index 4fe58cfe6f1b..54141b9bb714 100644
--- a/Documentation/devicetree/bindings/arm/mediatek.yaml
+++ b/Documentation/devicetree/bindings/arm/mediatek.yaml
@@ -251,6 +251,13 @@ properties:
               - google,kodama-sku32
           - const: google,kodama
           - const: mediatek,mt8183
+      - description: Google Makomo (Lenovo 100e Chromebook 2nd Gen MTK 2)
+        items:
+          - enum:
+              - const: google,makomo-sku0
+              - const: google,makomo-sku1
+          - const: google,makomo
+          - const: mediatek,mt8183
       - description: Google Willow (Acer Chromebook 311 C722/C722T)
         items:
           - enum:
-- 
2.42.0.758.gaed0368e0e-goog


