Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E3681CD1283
	for <linux-mediatek@archiver.kernel.org>; Fri, 29 Mar 2024 18:55:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=8lYudh1XGipLZp45Ed9irT2kjTBzp7nX6WUMRhG9/PM=; b=TTH26Xs2Tl0KP2RgRNVaVHBkYy
	2x87jDlUKM/rf14wHhfQWGH2RaA/9qrWDvzSgKxXTdAM+H0G839fA/+PJYtbF4ZdmxyxWyO3b1V8J
	EVpRU0avgFmFXkKYe67oT2hliBW/gnTOxoQ5dtN4w5B7hvwbu4Ex4V3VGHcopFNlYSkmEcYrvJY2o
	jih3GNAHdD69tMPkmurr31zAQrK+8KoTcaeEgznzqyf86rP7Bn1DZ3Bkk13PiWK09PR05xwYxovXq
	yCOw7V9vdPoMoG9NtmOguqvGrrjMxLDkEzPv4E/PneHGVdgxbBdEx7IoYWkpeT9OnKHTymtgkeQvI
	Nznee08g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rqHNf-00000001fDO-1yIw;
	Fri, 29 Mar 2024 18:55:11 +0000
Received: from mail-lj1-x230.google.com ([2a00:1450:4864:20::230])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rqHNJ-00000001ewp-1bH5
	for linux-mediatek@lists.infradead.org;
	Fri, 29 Mar 2024 18:54:50 +0000
Received: by mail-lj1-x230.google.com with SMTP id 38308e7fff4ca-2d6fd3cfaceso28333721fa.3
        for <linux-mediatek@lists.infradead.org>; Fri, 29 Mar 2024 11:54:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1711738486; x=1712343286; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=8lYudh1XGipLZp45Ed9irT2kjTBzp7nX6WUMRhG9/PM=;
        b=j6KpiYvLXErtpDNrlq+Fm3W8nr809B5P7XPkSnAdi00AWeRE6knwfMbJdZOTyjc+m8
         QObcgBP8mhkTB+/fJNWOzeZxfrxL8qG1zqrYUm63zoYd4XJIC2aaoh3pr/zHRpUEAFjU
         KrSqGx4BLlvGDL9fCzEEkKN+cwD7Pkz0j2BPmFAWwNaZPX2ZyHj+rvGwOwjUBshS6IpM
         x97vq/ijBH2KLYR+XDttrGBWnzJu+w0zS9JCbSoKP/ZBSEkhtep8h/cbso73nm5zl9aq
         pqS0nTXaZz0tO146FXvzfzSQJ3zQTvXON4B/IChXcwAiDU6DsqEbwPDxpFJOv22diQCV
         Kk3g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1711738486; x=1712343286;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=8lYudh1XGipLZp45Ed9irT2kjTBzp7nX6WUMRhG9/PM=;
        b=VOEBxcsaQa16ZJZKnCJ92PLiBmxR/Kln3bfUULbtYysqquFmqa2hgzmZpD1Sgf+Fj8
         lsc/1tzzLE899b7I3bnHj17+rW0vTaabyXcGBTIvFeUuuB5CTCmBbMUejKUpsyi/VuQj
         +1Ni2eUl0inaW8ruRUyFbPl0Ic834MHHE5N2b1Ep4nfh0Pf/5nYsF+XeBh/DQs38m+Fl
         yrEJnd0E6QnzG/JRizPeBpa5jntJvNLFB52HJgY0+01LAjzRp6Hf1U0WRrri+JcbU+c5
         4TV7KdSFW5BOvoq9fbFdfUtevMghylUldt8uqNTwfhCyV6T4j2La3HOBLnY/kYpHD1ub
         FHJg==
X-Forwarded-Encrypted: i=1; AJvYcCVRuS9BN30wdMtN008Li4i7Nwlhj+AL3a0wQp26ttYEBCk7GoZIf5SEcQibAUyr1NajywjfL8d6FHqaaJxnmp104M9sj9603Pj/qhK21kUo9268
X-Gm-Message-State: AOJu0Yzl8CRtHNEri1iZDXx/AbMF2pPRDfW0bYLwf4nZOtKJ1fE3Sl95
	yDaw4Ws49ZrcvVMWQrU3CRntTMh+ZnARfAqxzxpYlH9sINR/rhLcTzCll4KyNNQ=
X-Google-Smtp-Source: AGHT+IFLq2zPNZAQWIXV2oGHh7AXsnxXyYm+kF2F9Y8m5wIc8iL/MpNSFstxnipVIzw2JZJ8+OEiLQ==
X-Received: by 2002:a05:6512:3f2:b0:513:cc18:d4c6 with SMTP id n18-20020a05651203f200b00513cc18d4c6mr2423772lfq.41.1711738485916;
        Fri, 29 Mar 2024 11:54:45 -0700 (PDT)
Received: from [127.0.1.1] ([79.114.172.194])
        by smtp.gmail.com with ESMTPSA id gl20-20020a170906e0d400b00a46c39e6a47sm2235618ejb.148.2024.03.29.11.54.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 29 Mar 2024 11:54:45 -0700 (PDT)
From: Abel Vesa <abel.vesa@linaro.org>
Date: Fri, 29 Mar 2024 20:54:19 +0200
Subject: [PATCH v7 2/6] dt-bindings: spmi: Deprecate qcom,bus-id
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240329-spmi-multi-master-support-v7-2-7b902824246c@linaro.org>
References: <20240329-spmi-multi-master-support-v7-0-7b902824246c@linaro.org>
In-Reply-To: <20240329-spmi-multi-master-support-v7-0-7b902824246c@linaro.org>
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
 b=owEBbQKS/ZANAwAKARtfRMkAlRVWAcsmYgBmBw5rmBF1a6Kayn0McPPhO9Vili8LVVjwUHVTA
 Ms6jQpU9aiJAjMEAAEKAB0WIQRO8+4RTnqPKsqn0bgbX0TJAJUVVgUCZgcOawAKCRAbX0TJAJUV
 VjcfD/9TlUMe8f+3fPhLYasDGg8g/v36up5C2ABrJX8El4US2PozU/+1trcDJU52ZXplM4CiawA
 ebRTCjQ+vB4Ca8MN2XWbaCeeUu/0ecjmS/48HSrnRhphCoIXCTe8AWUKwO+R8VBRnRKPGdJg7u1
 kUTzgSclc9W0ThCgx8xXEUV4sR8Tk0Q4sOc7GPORWd55rBjAN8r5L3LhO8USw5A2TUc6wWI0iDX
 X9RxsdMBXyS7Ej4+jQcZlxhEru5zKQtjEVyagVLEh6WhnSB07uU6hY6+zG/yREFm4fEeu5JDQgO
 Cn/rgajjrkX7d2sF4aCY3gLZqWaF0shIGI1IgUPGsvLLRCTfvkM8ZXgfGeGQWhA6BW0fcMGbHe9
 BjU8rqrXvV9N91vAhN+3AyijyFcQQ4n3Ge2RUtdhQ1OcmfsBK3Bp3mjdStQqUm8+RGtuVTCqTaD
 8eN6QIaPVMZ4ZRoI1o9pQI+5RiLBIBQF24jf/BVM6cWEEQM5mMB9L69QErcsdy42FgybYoMsVXq
 Ujoxjut03zTyn+h5XZvGSUyYHuHl8EFH440/peAFjMmc0wT41HSBd+64w5OSoTq9c02w7skXyfP
 p+hVjyJFiBh/zpj9kAC8WqX62nGSxOfM6JXauUagiuw+tN/XDGXda/Zl2jmRQEgRjSXuV4xCmXf
 nDUfN/EHg2aDOaw==
X-Developer-Key: i=abel.vesa@linaro.org; a=openpgp;
 fpr=6AFF162D57F4223A8770EF5AF7BF214136F41FAE
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240329_115449_537566_BC8272BE 
X-CRM114-Status: UNSURE (   8.43  )
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


