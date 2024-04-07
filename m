Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1F6AACD128A
	for <linux-mediatek@archiver.kernel.org>; Sun,  7 Apr 2024 16:23:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=8lYudh1XGipLZp45Ed9irT2kjTBzp7nX6WUMRhG9/PM=; b=RUjPl6I7YnD76FAcI/3olFZAk8
	T6UbjCIwn4FJb86xyXPdSm8sVm8w80fueKJU/fZa23penJspVpcdNE2NZ1xM/L7xYY6tFthJZkpxN
	I8YQgcX0dRZi75neRi99DaxlKw6t3Otg8kYXiFZ30nw5C0JE9Xplnog48yUKDifCXDhKvl7pEOE3b
	hTv3Fek/ACaJ3AJZ5JepHGEeNh7IIF9lRSk8OWS77dRWu7kh42hM2v/3Od16UQX81TdE4frXwOhyL
	+exe209IgQMfaivNqjNd9N021IVTaRPqewxn6mpVP0L/vsbRUHHYbcNn9dyFkttlCnEkAphbPt5IE
	xB+MXw9A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rtVJC-0000000CzSU-0c69;
	Sun, 07 Apr 2024 16:23:54 +0000
Received: from mail-ed1-x52b.google.com ([2a00:1450:4864:20::52b])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rtVJ3-0000000CzLK-3e3d
	for linux-mediatek@lists.infradead.org;
	Sun, 07 Apr 2024 16:23:47 +0000
Received: by mail-ed1-x52b.google.com with SMTP id 4fb4d7f45d1cf-565c6cf4819so8157113a12.1
        for <linux-mediatek@lists.infradead.org>; Sun, 07 Apr 2024 09:23:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1712507024; x=1713111824; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=8lYudh1XGipLZp45Ed9irT2kjTBzp7nX6WUMRhG9/PM=;
        b=yv4sPMGvFLq+CirK6fSsxXrhaI0Xqo+UhdF5ORITrff9C0beBeHxKS+LRJrKuL8bkX
         /Uhkyqw8xAJMD3I4roZS/cD3227UZvgFu4wdzfX2sKr+4gRh8P9Sq8/+RweAoNUVnAHk
         wbfouY+9Qhe75Qkm6opFIYIoQgeQ8PSGW+QUF6VY+kJWhmfSETzoc0FHrpkbGQjELBT1
         0Ht1E2MqSeoOc9MU/IYwo0hF83+rJBCJnm38P8MsrgfSNOvOkV1HuXdasuXE97IGTaDH
         /L4Zty9vx7KR2kDN0FivyxmPZRfnVyZMvWevy6uGsieRTolntH3Xu/uAubPHYxHUvE07
         GCpQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1712507024; x=1713111824;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=8lYudh1XGipLZp45Ed9irT2kjTBzp7nX6WUMRhG9/PM=;
        b=drMIWAbZSTqOPnUM2r+29P2whH0LrkiDS0Ekkj6/QaH7ck3uzhPnNmwaGfsptzicr/
         vELIUNCVzniTbMAC9hn6/Rq/6O0bNECrD2h1oJIjOxWh+kmJKm156kEdj4UneU4p6nF5
         rdnctJxG4s1WkfAeQYD3IC5HplDdxLvCnlN6h8IYfad0w8XdkLHOEBUiBuhq/hsU3jSK
         uKGGU7jnQKtcRpnPlnol6ji48B35XSjJS4hp8k93AC0KMbm/MFSp72yO3xsnwxAdXg2Q
         RlYikugjyar//WM5k+VY0ARCbvJJdoxA7YHBu1xS//iXlKsJwRsVHYQwKQ4JWdDHVv/5
         FvjQ==
X-Forwarded-Encrypted: i=1; AJvYcCV5ioMJTaCjuKLm87pZNRzXjT4A9RKk/3CD29kRgX5+3sgIUbgV84VR9DOBSLjkKL/XelbPVDJdR3AiZztIcbfY9W7mtPwQrf2j1L1eZ8cmsEhV
X-Gm-Message-State: AOJu0YyL2IaJgBHHT39XsCntFdsh7lZMm6L9DLkTy+TmfCIimgXw9dj5
	5ITrvJu8EiC6QcLJSmsahHZ6Po34ebkxT7BqEEDjKkENqUgu0pX5W+N1VJH40ZY=
X-Google-Smtp-Source: AGHT+IG0AkCZSMmS2Shl9d8nSs/2eGpGUav3paUeGvD+v9WFbHkTskXsEsX11+oPqTjTyn4PFFndIw==
X-Received: by 2002:a17:907:72cc:b0:a51:c311:8199 with SMTP id du12-20020a17090772cc00b00a51c3118199mr3500827ejc.31.1712507023717;
        Sun, 07 Apr 2024 09:23:43 -0700 (PDT)
Received: from [127.0.1.1] ([79.114.172.194])
        by smtp.gmail.com with ESMTPSA id qs28-20020a170906459c00b00a51bed388a4sm1811626ejc.139.2024.04.07.09.23.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 07 Apr 2024 09:23:43 -0700 (PDT)
From: Abel Vesa <abel.vesa@linaro.org>
Date: Sun, 07 Apr 2024 19:23:22 +0300
Subject: [PATCH v9 2/7] dt-bindings: spmi: Deprecate qcom,bus-id
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240407-spmi-multi-master-support-v9-2-fa151c1391f3@linaro.org>
References: <20240407-spmi-multi-master-support-v9-0-fa151c1391f3@linaro.org>
In-Reply-To: <20240407-spmi-multi-master-support-v9-0-fa151c1391f3@linaro.org>
To: Stephen Boyd <sboyd@kernel.org>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konrad.dybcio@linaro.org>, 
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, 
 Neil Armstrong <neil.armstrong@linaro.org>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: Srini Kandagatla <srinivas.kandagatla@linaro.org>, 
 Johan Hovold <johan@kernel.org>, David Collins <quic_collinsd@quicinc.com>, 
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-arm-msm@vger.kernel.org, linux-mediatek@lists.infradead.org, 
 devicetree@vger.kernel.org, Abel Vesa <abel.vesa@linaro.org>, 
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1023; i=abel.vesa@linaro.org;
 h=from:subject:message-id; bh=f1k2/XtnKKT0QabjDTtzy+0Tu+D0+1BkiYHMuQzuNWI=;
 b=owEBbQKS/ZANAwAKARtfRMkAlRVWAcsmYgBmEsiDgoBJu10bDGjkOQlKiFUR111JqKL1uRRLf
 +Orxj0NzwSJAjMEAAEKAB0WIQRO8+4RTnqPKsqn0bgbX0TJAJUVVgUCZhLIgwAKCRAbX0TJAJUV
 VpuFD/9xdy5gdxKjuK6+FBvj7w9TUiK3bvGSdZfyhJYT4IETt5y9sQWDAPeewM/RVFWmv0a+3gs
 5e67bCsLjPLbGIoqsEvwDhvPazDDlY10RZ4vGjiY3W5TRNA5eETaj44FeY+HlLOpX/Bvqia63UU
 w9oJsDq+eFDj1HVl3lekceaddpU0OewBWyXlzubTBQQpYk/xd4N4jdy1GDclQeRhN6Nfa/VeTMR
 vyhra4UDl6mXlPa5BHT9qvTXP7pVF0zB5dyobZizK9YjRsPigYS+LX3OmOjV2m7ti5gC8iwq8wn
 KIZi86jwYArLO0U5wjbHn6zaxddpd1lveGBk2IPRt2E0o5P+5jnYJuSjoICp7AGISqiBAG7AxLR
 p7Jdz4hNRH340QueE3OD/1VrnG4vYNBy83kcFkTdBipe3j3nUsBSZoTaOgs9gDhAlf/qn7K1PrF
 ccNgxTWKq5byQofdhdkCQH2QIFXLQ6/Fl18fQndw3cSjCmkoPcZkqKdinfJIPLIeaB4+LDPIiuW
 ewtzleOdG1yjZ9m3OlJkdHE1nTSeyMENyZSr0ZuhenAVfLebsoOakxnENYyAUxLscr8UVAo6aQF
 BXemxECrdwsZOoWJJlq+yUz/oO3s0bSt1tLivZ2mOImaxLHVatvOR6djmJENISR0BGLQiIdmx1o
 7ZtdFW9QbkbTqiA==
X-Developer-Key: i=abel.vesa@linaro.org; a=openpgp;
 fpr=6AFF162D57F4223A8770EF5AF7BF214136F41FAE
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240407_092345_962832_6CA6445F 
X-CRM114-Status: UNSURE (   7.79  )
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

As it is optional and no platform is actually using the secondary bus,
deprecate the qcom,bus-id property. For newer platforms that implement
SPMI PMIC ARB v7 in HW, the X1E80100 approach should be used.

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Signed-off-by: Abel Vesa <abel.vesa@linaro.org>
---
 Documentation/devicetree/bindings/spmi/qcom,spmi-pmic-arb.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/spmi/qcom,spmi-pmic-arb.yaml b/Documentation/devicetree/bindings/spmi/qcom,spmi-pmic-arb.yaml
index f983b4af6db9..51daf1b847a9 100644
--- a/Documentation/devicetree/bindings/spmi/qcom,spmi-pmic-arb.yaml
+++ b/Documentation/devicetree/bindings/spmi/qcom,spmi-pmic-arb.yaml
@@ -92,6 +92,7 @@ properties:
     description: >
       SPMI bus instance. only applicable to PMIC arbiter version 7 and beyond.
       Supported values, 0 = primary bus, 1 = secondary bus
+    deprecated: true
 
 required:
   - compatible

-- 
2.34.1


