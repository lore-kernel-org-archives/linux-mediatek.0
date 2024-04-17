Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1EA0CC4345F
	for <linux-mediatek@archiver.kernel.org>; Wed, 17 Apr 2024 20:01:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=8lYudh1XGipLZp45Ed9irT2kjTBzp7nX6WUMRhG9/PM=; b=YTG+MnQ3X+t0amBt13Jx9d3OJb
	aOofh3U2olhnE5BDYX8Pj1DrhroG58uxGMtNnvtAXmD/93v8ezn/NNJ0NMzIB/pfg+8JZVzAUMNHC
	eAMzIc2VPpr26KlR7mPYlgsSTDP8pireqrT9NjdwZDN/kIWrsnA7O/+V1QbsLALL5DB1idrMvKEvZ
	+E9W0qTNvGBvj2KV2e7wuJQcxl20OCDnQLhWqbOmJNKLWJjOnIjP7Qn6s4DylJHNmEiPOh0RxFCfq
	CvJ/PiL8G0xrVsr9h5TqA0PLRfX5WhCZDqkznul/CQPkTm4IZXUUmNTS7vZoAzMml/GfEs+A9q/of
	4duxxQLw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rxBTO-0000000HQkB-0kPY;
	Wed, 17 Apr 2024 20:01:38 +0000
Received: from mail-lf1-x12c.google.com ([2a00:1450:4864:20::12c])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rxBTF-0000000HQdn-3JXU
	for linux-mediatek@lists.infradead.org;
	Wed, 17 Apr 2024 20:01:33 +0000
Received: by mail-lf1-x12c.google.com with SMTP id 2adb3069b0e04-516d0161e13so61811e87.3
        for <linux-mediatek@lists.infradead.org>; Wed, 17 Apr 2024 13:01:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1713384084; x=1713988884; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=8lYudh1XGipLZp45Ed9irT2kjTBzp7nX6WUMRhG9/PM=;
        b=Zen7GkB4CRdlhJGZjXIZzxfouj1fKv5r/l2dcTGtDa4ckU6+0QdHos5yfcMVVoirln
         oFG9ZaOTwBfiYSmgf41MO8W/lmvNjtCRV4cjMMmMTc/u4zYd4XBhR/Nvs52gsuXAtELa
         ohPov3jEvAs1DiJuznpG3hU+gWeLVp87eD5OjTBMfHAxHJ7VJarrsTeNHkQXynnAY8Ra
         WApLC7Ej0QlECK+kC45E5kaQCywiXn2L689ISGhbRC9cDmoeLX5FvW0YNgaEbtjviDJT
         /926bAOVv6osXVebcvnyiSFvyr+mn9Qi83bPbBpceSFJt0VgFdnc1kkZe3luTAcB/a71
         3tEA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1713384084; x=1713988884;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=8lYudh1XGipLZp45Ed9irT2kjTBzp7nX6WUMRhG9/PM=;
        b=jSD/mu0yG+AjmE9+Djrf3N/pUY6jUWkpimsadOIJaIH+G9c+5BxasVwCxhbus23TfL
         NVwfqDtDkT+brWgD69hvaY2dr5gtn+63T2qAU0HExTaQ5NdIMxIhYOi4ndFfFt/mcV7i
         X7NcI7BtxTOLvxB/ksHQY2bz1vP8u2D6t1od+5vWkPH1GWUCXB5Dl/2+F2FeysarRNK0
         KLb5sRhgvp06GkefQ1YNS3osfrt9KEfZSlg4xGiEWBabxNQlN/GiqBZ3pHmFqpkkwCld
         jAwgSUlyhBJml3+jS8X6gdH0eXvBzP7NP4jbsym6leTdkgUMOT+wYRk0UXoWvlw3YyWl
         CxsQ==
X-Forwarded-Encrypted: i=1; AJvYcCXpOGVxNDXgpE2rqezuEUTQ+WsRIGy/HBur64SAlC7Y5QU+8dEoGcghnhx4ZgvMjL8e8eJXNdpGnZ4wsx/a+D8xjm2g8XaZQj32Xh1jnOvLJpHA
X-Gm-Message-State: AOJu0Yw0hyIbzq5ewCNUrL+asc8isin63uMx9emHhhZ0/HNtmDEGLx2D
	U6k8qwpp7r2BeuqEcJZUssQAt7V1RWA9k9YL4EZZwEQI5CuTS3la1PZuz7rUK3E=
X-Google-Smtp-Source: AGHT+IGxbKfuE7tOKYWJaJSpGP1x/nWe/jbsF0dBAScwJnX0ukMTu47VDz749HA5eUzZvJ0MfqluBg==
X-Received: by 2002:a19:7506:0:b0:516:d0d5:6f60 with SMTP id y6-20020a197506000000b00516d0d56f60mr166215lfe.38.1713384083867;
        Wed, 17 Apr 2024 13:01:23 -0700 (PDT)
Received: from [127.0.1.1] ([79.114.172.194])
        by smtp.gmail.com with ESMTPSA id gs6-20020a170906f18600b00a555ef55ab5sm939981ejb.218.2024.04.17.13.01.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 17 Apr 2024 13:01:23 -0700 (PDT)
From: Abel Vesa <abel.vesa@linaro.org>
Date: Wed, 17 Apr 2024 23:00:54 +0300
Subject: [PATCH v10 2/7] dt-bindings: spmi: Deprecate qcom,bus-id
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240417-spmi-multi-master-support-v10-2-5bc6d322e266@linaro.org>
References: <20240417-spmi-multi-master-support-v10-0-5bc6d322e266@linaro.org>
In-Reply-To: <20240417-spmi-multi-master-support-v10-0-5bc6d322e266@linaro.org>
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
 b=owEBbQKS/ZANAwAKARtfRMkAlRVWAcsmYgBmICp/E095iDTa8F+bI7nMeF6DLZpKpnbK1WlsZ
 vC11586iXyJAjMEAAEKAB0WIQRO8+4RTnqPKsqn0bgbX0TJAJUVVgUCZiAqfwAKCRAbX0TJAJUV
 VmOID/4/QtTIUnPQg72FBvwzNTf7Qn8PSseRsPOVcd59hjYGzXVIKJUjALH2WyOJwQ5+j/l2lkY
 9Asqjwh8s2qg4m/ftcu9O4VpjDhopW7Pmx8s0d/qvFAPVDaKFGH/7YQpOSY9kFBWHRuHnbT7DXu
 788a89Yyuydvhf3atnI/JCVVfYoxC6IfPeq5jwpyihUKXGHDCZqM9cAiQrW5beQNOVcIAjQX6BK
 0uzpDRsttZ9Iuj95MkOx+0OYD3aQUInhuOKVml/vkbTZ3ZLSZMA6QcaSCd3hZVHut8JPOAOt1rb
 zyHRO3OS9B0jPQkhc+RI8d2n3wBH1WuXAQWMD3egHcqvD2al1RpRoceNJwrfyx7zW7SR03OfE6x
 NMkAzMLgiDJ1RyMPir15bsw7DszLyybjM2+kYahi/2LpBLyc4M3qxZd4lu3c7iD2Y4iQphaHzFj
 LHeOfa/ii2BXa5UKaU8qD4/7dWMSCuTXwOlez+OnFH7i/nb+Q+a8N8Y9wKOEPzlcKKsoJo9jo8/
 W+O3lLIXxKVa/QQhWpDqKxdSzSZ7IzBvejeZhyxC5muWlS1dkiU7y3do5WGW79SXV4raWtnLgl6
 H9BaXkJyOK2YyEJWd0z/dhxxDPXxC5o35zjyUgbgAaz+0pLdTvYVIOmr6YTukdWGO4ohoaeeNhv
 ie9OSctpsnQjJEQ==
X-Developer-Key: i=abel.vesa@linaro.org; a=openpgp;
 fpr=6AFF162D57F4223A8770EF5AF7BF214136F41FAE
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240417_130130_076262_45D6273C 
X-CRM114-Status: UNSURE (   7.81  )
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


