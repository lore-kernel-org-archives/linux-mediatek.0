Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A6D18C54798
	for <linux-mediatek@archiver.kernel.org>; Thu, 22 Feb 2024 13:52:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=EW/GWJggK7nU0fxkPt2O7/667iB2+8Bxf2l4HJ5fEwE=; b=4HiM05OXHinaez5BMQCoP50h/t
	hx42YWPn0m/C493xFEgePjiGtUj1CFImZAeY+P2vauHmceVF1I4x0cI1alKqe93uSH/BcbZvubw2p
	+TkHiAjY55XjJFsAcm4lJJY7exqoGl4HWM7AEllqCNzsz1O9GDM4sJJBC9W01EWmeIEsIlpbrzePs
	QLnerv2jxqhdY/vjU8VlgjKSS/dmS+RLk/ncviN52DFc/7iZUfrHYAS6Uenc+G4OPAF3kXkrkpzl0
	lU0OpXBTOZhS/wdJa6kCrD7gXiS9+YpYXSzFIfzwHUWp7g1DDTRSGzwhofTNdTWJvpPpVlVJ0Gzik
	HavCYv/w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rd9VA-0000000570e-0qVj;
	Thu, 22 Feb 2024 13:52:40 +0000
Received: from mail-ej1-x62a.google.com ([2a00:1450:4864:20::62a])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rd9Uv-000000056qG-1WfF
	for linux-mediatek@lists.infradead.org;
	Thu, 22 Feb 2024 13:52:27 +0000
Received: by mail-ej1-x62a.google.com with SMTP id a640c23a62f3a-a3ee69976c9so507513066b.0
        for <linux-mediatek@lists.infradead.org>; Thu, 22 Feb 2024 05:52:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1708609943; x=1709214743; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=EW/GWJggK7nU0fxkPt2O7/667iB2+8Bxf2l4HJ5fEwE=;
        b=erwdiEwF90U1Kh4CU/bkVapojGpyl8qLB3+fdJ/X7eaHI+yyLa43YnCjk1ByA5bvs5
         /NvgR9UXfwEYGJH8BahjulPB7c2xLcF3l481GStIxI6pX8BwhXLEh/Cz3ruLE/Agtd5N
         KNBfxVqVh18kiTbfidFl/9DGA8Fj0qVaLxx23l92gjgvZMxLdLmiGKg9nJVgrPjcPP/E
         aZOakQs2+iNK/upFOo2SpNktmhoEPinFaMQ8nKdpvFB2FXBm3VQD0DznUenkF5H79mz4
         YXAjGt2HxrpJss/+PGWpoI7xT99S4hF/26AdCoJvkObb8bNT6GQJv6INrIpZ8sN2C8hc
         GPbA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1708609943; x=1709214743;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=EW/GWJggK7nU0fxkPt2O7/667iB2+8Bxf2l4HJ5fEwE=;
        b=nlFck8o9qvrSC+1A7BDj0AhrbhrV3bhRo5xeAj1aCqubHCfrx50cEETTqzpYdiCiLJ
         /A27U6jGBqD/AJkbt+0+FtevEXJp3PvEiqlMRCHs3hovrRxfiVsv2QUnf7HPnv3Bowyu
         a1iDvT1kL1p0qGgN6DICBB6D8yeOoktHAVqCfSPD2Q5eqd80xoi54NLo2DzFsJwEKAAb
         oLeDOdEv2VhfvV3SOquixrXjtHrpH7XlIO7JQjuP2gCV9hIdLJujwebILieqQBkHJveR
         QkfjK7DvC9Gq6tXoz8L5lIOop9cIsE6jSaNONu2W1Qia5J4ELTQoOWPc/uy85cvizUgB
         BhrQ==
X-Forwarded-Encrypted: i=1; AJvYcCWsY39RMdoKSOGq2Fw5eVxW44XduRYnvkLy6pE2xAnUm7f8i0A7CW5DHPCJW90MbbBc/q2tAqA+AtVUi9hKH374m6NGbi5NYpEeNMKtLaUbnxNW
X-Gm-Message-State: AOJu0Yw+rqAtc9tXhvGX+OHr9f0Z1CwQ/qAi4mNe0jJHLYB8ZiSKUuRX
	DdIOkAcfzPlkLSScvVQfy1GlZr1GjjFrVSVa9zfjg+NrTDPipXUhBg9ui/x/nCc=
X-Google-Smtp-Source: AGHT+IHK0vqpMbU/G/J8vsvIuEvJXxnR1fRVVGsW/TgJhL42N4wGD/vAmGlADtd3f45CwaZL5QQdfw==
X-Received: by 2002:a17:906:6dc1:b0:a3f:81e1:2dad with SMTP id j1-20020a1709066dc100b00a3f81e12dadmr1358466ejt.21.1708609943411;
        Thu, 22 Feb 2024 05:52:23 -0800 (PST)
Received: from [127.0.1.1] ([188.24.162.93])
        by smtp.gmail.com with ESMTPSA id ot18-20020a170906ccd200b00a3ecdd0ba23sm3382839ejb.52.2024.02.22.05.52.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 22 Feb 2024 05:52:23 -0800 (PST)
From: Abel Vesa <abel.vesa@linaro.org>
Date: Thu, 22 Feb 2024 15:52:03 +0200
Subject: [PATCH v6 2/5] dt-bindings: spmi: Deprecate qcom,bus-id
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240222-spmi-multi-master-support-v6-2-bc34ea9561da@linaro.org>
References: <20240222-spmi-multi-master-support-v6-0-bc34ea9561da@linaro.org>
In-Reply-To: <20240222-spmi-multi-master-support-v6-0-bc34ea9561da@linaro.org>
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
 b=owEBbQKS/ZANAwAKARtfRMkAlRVWAcsmYgBl11GONCtd9EYnK2zbyTod3FUCtBuGPT0Ra9wkz
 NzRHH9M7EqJAjMEAAEKAB0WIQRO8+4RTnqPKsqn0bgbX0TJAJUVVgUCZddRjgAKCRAbX0TJAJUV
 VpXRD/9VENVMm8i0qyXY3On8HzjaJps+BzYtDxTGMol4Sq1cz6NcQMPGKXnPdbiLbirOPysaQRt
 IDY4e6eMTgu+BC8U8WITB7OkrkZMsyS4Mt2RlfZ17Pp9VXZ286srB2skdW2UOJlUuDvKAm/ig7x
 vu7NAee/57WY/etBDqC69ZNxZh1wHMGR4AFiN2qPTZWSF74XBMZHgVimyCeVEg1DDDh2bjXqUCe
 ZQbEN7J94gSifxGGZZiypcdcx6kXR7gDYKshEZgZQ5CAZAp8pPaBQd3N0YDHEcwJ/4PJGS6HYXR
 MQj/ffolzEc+i0k5OYRoukZQSfarMYg0YmNgQdZUDYieK9Z+2fppH7lGR+yj6CtmraWCkOj2x+z
 W35r8DD24KZ+V0ktl1zhgAR1XgSh/Yqg+hRVgQeXFZixdWGYhXD3M9YfiNYC9E8x5lOgHOU0DV3
 CcuAVHC492dAHIRMH5XEsPZ01RJUAEzCxopIhLNQ2DYz9yqPO6gqIOiIcRBhjfqTp1iNA/Q8Dh2
 g3MzRJRMRzTCoM6tU/+FfoantseNxAmBSiuZaHADbRzcs3NUMuh9PfODFqKRrr4MRJwYgnN0jPC
 AYrFE08FHCya4fPn81xjXrTKM9HE8x8Zk7nzyxIFJmuxDWh2fkAdYx8JA3oEfB3Tb0AZbi/E3qj
 Bw530kEdYz2PYAA==
X-Developer-Key: i=abel.vesa@linaro.org; a=openpgp;
 fpr=6AFF162D57F4223A8770EF5AF7BF214136F41FAE
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240222_055225_547007_44C74BBA 
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


