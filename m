Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6DA1DC54E67
	for <linux-mediatek@archiver.kernel.org>; Tue, 26 Mar 2024 16:29:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=EW/GWJggK7nU0fxkPt2O7/667iB2+8Bxf2l4HJ5fEwE=; b=TML7zncPYtAy77YqIYvZwamHHr
	0Lh3pwlWxjyjeMlJyvLHgS7QXyKIv0jM6wj0P8ZXM1DpDzuKQt74+4AW73NoV5BrVVZawhgQIqBHR
	midRRPamgGIom7H5ADiHZfoxsir11rBtcG54cWvH/a5iSSnzQfnC4b5d256VBPD0yrwq3PExysLf5
	O6G/xc9Eod9g2EndeM6PZU4kf7VUfO18qUczz4c14wAxfgbVGYLpz2llZu93j2BW5hqe3hlMcnr5u
	1st3Pgf+PCcQBkFCbRoR+hh9SOLih+1UsiqAVGU4m+WJVVlmkcEl88K2+RJgk6Wy+ECaSFttysmsp
	7p88nfJA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rp9gM-00000005T3C-2UeV;
	Tue, 26 Mar 2024 16:29:55 +0000
Received: from mail-ej1-x630.google.com ([2a00:1450:4864:20::630])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rp9fG-00000005Scm-2bJl
	for linux-mediatek@lists.infradead.org;
	Tue, 26 Mar 2024 16:28:46 +0000
Received: by mail-ej1-x630.google.com with SMTP id a640c23a62f3a-a474c4faf5eso321136466b.2
        for <linux-mediatek@lists.infradead.org>; Tue, 26 Mar 2024 09:28:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1711470521; x=1712075321; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=EW/GWJggK7nU0fxkPt2O7/667iB2+8Bxf2l4HJ5fEwE=;
        b=Azic1l44gspI9ZzO0taZ0kPFdQmfaq2Z36LMf6UudXUMbKuG4WkUzxptn620py9ChZ
         2Kozj/tnzoOCmI3moAfDX1pDZpl5peIEaJ1NGeifvmxbzDwleP4jcbA8IeP2ZQXTLFZv
         oO+bENDQRrfBNe4YFb5rlSkAGHUJHcZbNhBsozn4AqcY0j+RBsKJexjLEEk0t+fCUJYd
         DtBsz2JJTMxkzsz9FnUK8eK6i5F75jyF6jaWr6/N/8v6s2R8SCOM/jyKPnK+TM9m9B8f
         hrbVLTyvyeWkLfCghh8V1dmZKDQ2JbwLh+IKWl5kU/zGAhRwnIQam7p7aaB2P5VyXQZa
         xAsg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1711470521; x=1712075321;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=EW/GWJggK7nU0fxkPt2O7/667iB2+8Bxf2l4HJ5fEwE=;
        b=ezj1x4KX2WesUGksfRLJuSOrT1mfZ9URVbgDVqizuIdRSA2zNaTGMi3SBgH2xMsKT8
         KrxyLzfP1AloSMzjidIslWnFHVgbAWrGbkcQUKlKl+9H/TGpsZeBxoDWf3jpHifTg5VF
         SvyOcgvCtpyDYZnNSu2EY9J/lJpb9LvX64JtrYIA4zIwIyz98jPnmDecFYZyWJOSpgp+
         RWHfhu/yW8w1vODRXrvACUuJqdfDGLcmABaPxq8ZItGvPpmQLbSLh3I3LzMU6udo/Hdb
         F0W1vZvhcQNkgnBfaoVAS+rXgTt2f5O/na5Wq8srOKvjSbqb0iuc3p8qyOBbIyaOlVSu
         ZfRA==
X-Forwarded-Encrypted: i=1; AJvYcCVmC6Etl8oHUoUGCBh1US3AkAhFUx2uSBnNDHERz9VhoiK6P4c8qARepH+B5tv2ixKaPbKDa7+zTEnjb6j686vpYeCZGV1nvGX91/G5opkT3uDa
X-Gm-Message-State: AOJu0YxEL7kRGdwNuZo6F4T/hCyk0XM/81dCWrkslmeVDHuuVwyf/TPk
	Hxe3+ANGCQneRo6CvRjAtXzv/ij7fdyAJU65xDcYeiyG0p1tjRpM1xcgXhRbVTc=
X-Google-Smtp-Source: AGHT+IHOSQfLEwojv/KKHmJUm24E3wz6dX9AroqG31OnfqQjS4iLKz6hOTG6ZStXu55DBb3wOeEYGA==
X-Received: by 2002:a17:907:9727:b0:a47:46d7:a89f with SMTP id jg39-20020a170907972700b00a4746d7a89fmr7402855ejc.30.1711470520629;
        Tue, 26 Mar 2024 09:28:40 -0700 (PDT)
Received: from [127.0.1.1] ([79.114.172.194])
        by smtp.gmail.com with ESMTPSA id x20-20020a170906b09400b00a469e55767dsm4375051ejy.214.2024.03.26.09.28.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 26 Mar 2024 09:28:40 -0700 (PDT)
From: Abel Vesa <abel.vesa@linaro.org>
Date: Tue, 26 Mar 2024 18:28:17 +0200
Subject: [PATCH RESEND v6 2/5] dt-bindings: spmi: Deprecate qcom,bus-id
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240326-spmi-multi-master-support-v6-2-1c87d8306c5b@linaro.org>
References: <20240326-spmi-multi-master-support-v6-0-1c87d8306c5b@linaro.org>
In-Reply-To: <20240326-spmi-multi-master-support-v6-0-1c87d8306c5b@linaro.org>
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
 Johan Hovold <johan@kernel.org>, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-arm-msm@vger.kernel.org, 
 linux-mediatek@lists.infradead.org, devicetree@vger.kernel.org, 
 Abel Vesa <abel.vesa@linaro.org>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=956; i=abel.vesa@linaro.org;
 h=from:subject:message-id; bh=QJBBmiezhVqZHMCXX6MWNM2zXfZMz1EwtNGa1/Y4Z4A=;
 b=owEBbQKS/ZANAwAKARtfRMkAlRVWAcsmYgBmAvevL0jG5eKJuWruBjANklXgLEfVuGtbxiNM+
 xhKhNcKQKWJAjMEAAEKAB0WIQRO8+4RTnqPKsqn0bgbX0TJAJUVVgUCZgL3rwAKCRAbX0TJAJUV
 VnwmEADJ4iN67j8rHWvs2HWvetWv3gougrJB2YgOUuSSA6APHfnzmwJaFYowcvPY+3sRjfpUrn9
 4SiaDrtpyJ2U3vyOc0y6YL6ZaL2GnvOTlmNtNIjbYufuXG/KXurf9e7kzE5YPtgmiUgK4nLzLsH
 enBVB59bERrULzYIptkGyLJqbLo+Bw4ApykWGQ4qZ2brT9ux2bv4W31jL67nPZblgdWLgzvEK7I
 xKsUEiabJ3fDYud5jdlkG3BLFvSynWGMmQNB8se2tdXkVncPxS48fVClWAZyJWQkIdodlorFu2p
 gYeqOa4y/alUT0BPGf1WTlJG2OTdnRyEhqCPUSMSeCmfpLzQn5OV64l/IZHEBIyCcDR4gQRXqpA
 w+esb/7jNhQo8tTZZtbFIDCN8WKv5feSAYfQ4tc4dV6KcS4+sXYlzpKc54ux2e5etQDuuUDIvK4
 ESYzpnNNatu2bWfYuBDN0ZPeXiF1UTEA0Z3Ou+5WQHk38kv8xa33NFAKmF2dfjAbkIN6R946lAH
 kT5SBiYAZl1fuolCGg3S6zRkfjkNk7Ew5WRiAzlbf5o7tj8YgYFsJgMIbjh0llyIHA+rxOUj6Jo
 eWc9vvP/lPJW5Q95BD6KjcnH0VoJviqtIE1SMx0uzh8GpewPOM6FwrTXwNQRL234uaxoe4lp4E8
 5jNaArqzx4r5ylA==
X-Developer-Key: i=abel.vesa@linaro.org; a=openpgp;
 fpr=6AFF162D57F4223A8770EF5AF7BF214136F41FAE
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240326_092842_941987_5379E00D 
X-CRM114-Status: UNSURE (   8.40  )
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


