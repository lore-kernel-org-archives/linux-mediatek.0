Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0C7A5C6FD1F
	for <linux-mediatek@archiver.kernel.org>; Tue,  2 Apr 2024 12:08:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=8lYudh1XGipLZp45Ed9irT2kjTBzp7nX6WUMRhG9/PM=; b=TNIhKaNfmo0d1G7YwLjjD0oAoy
	WyW01PH40O3Hzt7w2GdfGmWqliqd9u2MqDSzAYt7E8C2FqjXD6SgGb+RX5HbOyw5EecU34ltIPgjX
	KtybWTwEymXAk/nqqJWEgjGmV3/OdIbtDjXOuqRZhfNpfne1Vuppp+8RWSUcBDGgFnINQpIvoQ6Vf
	KZFU8mFI7cWRNF2bhrc7LSLLuMXd4msKOJ1O2+bICa/4sjDBKAhgT+vU1fojkpSF3vwEl9ZQa2JN+
	Gt0drL7r37sLk+rDDQLVu0v8zMMjE/Yr1mK9PcWaQDRPjZY/3q8r5n+AFRh1UBlI3X0lYL1a95GPq
	Gcje5LRg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rrcw2-0000000Aya4-07hO;
	Tue, 02 Apr 2024 12:08:14 +0000
Received: from mail-ej1-x630.google.com ([2a00:1450:4864:20::630])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rrcvs-0000000AyRP-4B4w
	for linux-mediatek@lists.infradead.org;
	Tue, 02 Apr 2024 12:08:08 +0000
Received: by mail-ej1-x630.google.com with SMTP id a640c23a62f3a-a466fc8fcccso641385366b.1
        for <linux-mediatek@lists.infradead.org>; Tue, 02 Apr 2024 05:08:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1712059680; x=1712664480; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=8lYudh1XGipLZp45Ed9irT2kjTBzp7nX6WUMRhG9/PM=;
        b=dm1PiLt0CCwT+LJDlTNAT+VcxP9eF/LZPDAIJKeLiif5vPVQ1YDQeEdeWBqyLLPQNp
         gK5hIsO70k/Dhpk7UQ1f4e8VM+TMT8LUAvJgPZ/oXipv8BaWHzYKG7Fva7qmljUfxCc5
         mwwft5oLGwQB+sUO/7rj0rsDHDhJuzrmNSPNpvdDWu/rRqJ4764txS/tbBPrncscS4oQ
         St8bpLyhP7BlHEvKH3hZGI4H60/V9so3gVVqrZc4cFnf1KIkK6TavEFOOPR8QxFTMo/0
         P+qDKMmt6oyM64xlLNfS2SoM6ro4axy7N2vzu0MAqCsOWVQfoVw0iempsVdRL5RnQypP
         LWcw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1712059680; x=1712664480;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=8lYudh1XGipLZp45Ed9irT2kjTBzp7nX6WUMRhG9/PM=;
        b=inHAnoGqCU//31vFh/vBNUTRUA5VtmYAfNiiGtkc+EVllw/8zeNJ/2mFtl5M8gjSth
         BGyLo5l7WY4MQaQDbFcFtTIMtYpJy3AcIPYE3tLf9UtfgQ3gSbE46P8mm7T7zAnPhPV2
         W7z7nAyl5/15VagY8DyXOJO/ffvYJIIuwzLubnNmmFT1mUkt/CVzkXqxYZzrP01XQbn7
         vnylSEYryEJthzU64OkKm6SawdMyjBwFl3IhbrVx/FqltGAw35W6KhyMLitSNTFMLuhy
         sfnwYAZK06tifAa7DgadWbkN+YwEh0jN+xiykZIGm51HNgq1tBCi+QgWc7Li/cle5agO
         YxPw==
X-Forwarded-Encrypted: i=1; AJvYcCWhb5x4ah36PRhJRpRpmUkoTfCXRL9g+wGJxG5QiYEcFQZ+cAG5rez3BfVjC+5bAps4EWdtBm7iBDGTx+j8aooCXjc41kSbmDXteZwWwhXeWmBr
X-Gm-Message-State: AOJu0YzFEwwdviay2IqNMHF5GixGpCill80G4Je/3gHeyDXEC9p7kwNi
	HIre/eK05F43jEJQrgke8CSCROz6PvzhUyux2ENtPKrT9cdB1BGVCOPVTRdOMOg=
X-Google-Smtp-Source: AGHT+IFic8oTxMWwbq/opl+R/WMY4B81eIyhGlcF04iuyhaO02RdXMJ+iUNSsBYJ7n5NMVSgBWknQA==
X-Received: by 2002:a17:906:1809:b0:a4e:1449:511d with SMTP id v9-20020a170906180900b00a4e1449511dmr8612893eje.46.1712059679543;
        Tue, 02 Apr 2024 05:07:59 -0700 (PDT)
Received: from [127.0.1.1] ([79.114.172.194])
        by smtp.gmail.com with ESMTPSA id l13-20020a1709065a8d00b00a4df251a601sm6519384ejq.77.2024.04.02.05.07.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 02 Apr 2024 05:07:59 -0700 (PDT)
From: Abel Vesa <abel.vesa@linaro.org>
Date: Tue, 02 Apr 2024 15:07:31 +0300
Subject: [PATCH v8 2/7] dt-bindings: spmi: Deprecate qcom,bus-id
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240402-spmi-multi-master-support-v8-2-ce6f2d14a058@linaro.org>
References: <20240402-spmi-multi-master-support-v8-0-ce6f2d14a058@linaro.org>
In-Reply-To: <20240402-spmi-multi-master-support-v8-0-ce6f2d14a058@linaro.org>
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
 Abel Vesa <abel.vesa@linaro.org>, 
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1023; i=abel.vesa@linaro.org;
 h=from:subject:message-id; bh=f1k2/XtnKKT0QabjDTtzy+0Tu+D0+1BkiYHMuQzuNWI=;
 b=owEBbQKS/ZANAwAKARtfRMkAlRVWAcsmYgBmC/URJbnokK1pOxrlYzamDCfFKUmEZT+B4Is74
 Ejx10d2ideJAjMEAAEKAB0WIQRO8+4RTnqPKsqn0bgbX0TJAJUVVgUCZgv1EQAKCRAbX0TJAJUV
 VucqD/40449kY2bmDx8dRfmVCXUNV2maAgBuk+qFdisysi/c5g25GTKPHDPEkoHQK5092FeSdFM
 mSQ4TUiu1MKT7Q6FQTT1lzU6utya7fHEwJsSr2811MozIiGezifkL8lhOQ4YBCqZuGom23Cw+dC
 beZ3C/BT2JioCtDx1exH7gNkul1SHK4sunrpYPHHRV7PI34dIXTRsLH4J1fE+w7F0fUARv1KZ2v
 8iQKMQnTH0eaSkXP7NQ/og20GOccJYfu7FXQgPtmYWb6JQEv3SeQrM2dXr4mQ2IGEkgYJ29oSyl
 p4GUue5hL2exrGFO4bKaWRr0hrzwa9J3hxaQ94XcvjMjBvhAWhhHW00NsWR0QTpBmRHO2aaRkke
 R7OYMVvFqb7hIryD506O/5ZCC6KUPlwLBQFenTabd8JhLDAbJ51RgFV7zYaHEOR6s+YWv+86Xts
 zjJrJo41C/+44LEsgr1K6vnJQwyrQpukM/khxcKJDHwpHhrCSUAwfN4gZ4VetsDSoxouJuyoAhF
 bCCs/F42Ih4p6ish3ReuX8gviUfx65ATl7+7WjB/nUk0U5Pzz4qN6dqNndDAVSmdPG2t+Gw4VTi
 FJu+e7D/MQOxH3IERM0IcFP5s78WGoxzWXWYNYK1SSZyxE9yfABpDHNPBI/aEe19vqV5SBDtbKC
 H8HKQO+70CsB6CQ==
X-Developer-Key: i=abel.vesa@linaro.org; a=openpgp;
 fpr=6AFF162D57F4223A8770EF5AF7BF214136F41FAE
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240402_050805_287433_0242518C 
X-CRM114-Status: UNSURE (   8.30  )
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


