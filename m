Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E0988C74A5B
	for <linux-mediatek@archiver.kernel.org>; Wed, 29 Mar 2023 11:00:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=lRWy59m9AcnRjc2fmHsxRpHlVgHZhVLnEx85hZ46BJw=; b=XMYQmYV1slhAo2RWD7XWvimVzF
	9ysm04ji8QWxmUqSeV/KUSgkMyNLB8pkak7I7I9b958gIL0ojsKgzchnhKCrpOuDtjnYPDDUrsxsB
	IRWjRnadUpbk8fdYFVADhO3s6IxkWa12io5sbDA5hB7/gyqSJSghJqyAGNV0gT0gP5Rfe53oNKu5G
	Z1zeSD2bAT7FoJ2TQY0joBjhQpamr5kJ4XiZL7YSU1918HYXabCUWt2P88RnxkrtH8vaqkaVYm86T
	RRuRO6ThHRjst7rp5qpNR/o2152KZdTXEElrokYGBNxb4dyPevPH0W57bYckE9PtIGrNAHxy5MVxp
	e4yPc1GQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1phTXg-00HXre-03;
	Wed, 29 Mar 2023 11:00:36 +0000
Received: from mail-wr1-x436.google.com ([2a00:1450:4864:20::436])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1phSTq-00HN3M-2k
	for linux-mediatek@lists.infradead.org;
	Wed, 29 Mar 2023 09:52:38 +0000
Received: by mail-wr1-x436.google.com with SMTP id j24so15047270wrd.0
        for <linux-mediatek@lists.infradead.org>; Wed, 29 Mar 2023 02:52:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20210112.gappssmtp.com; s=20210112; t=1680083553;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=lRWy59m9AcnRjc2fmHsxRpHlVgHZhVLnEx85hZ46BJw=;
        b=HGsZcS3nbA0Q7VTarfFbDHUm3xAerDi9I5AK/zBHDyjPM1VZSCpsS2OHluTIknkQKc
         ZXX7P5O7JjlIZA0RDfKKT4ij4yziAhuxfAB73x9+yjznWX+iD4tmWNSpghKrxTgL+9y4
         45Zz92JHQgjA9WC8DCDYSkhhBkGKV8P+UbJ+T7S7rfZayxtS7CCZx8PC50pQHwWB01j2
         K9VJbuyqqtkhCGYmkFRI+UzdnZ1KDIryBrwSw9+I2wjrF5ydUqbnue6SbEhm2K/1Mmfi
         dv/CcCABRFtr+ZVbVP2cXEHtNoDF0B1OVI+1X0Ml7pThYTD8ApgrPpCbB3a02tsqb7Tc
         brng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1680083553;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=lRWy59m9AcnRjc2fmHsxRpHlVgHZhVLnEx85hZ46BJw=;
        b=Fd7VuTJyRGhVMetuK/Ln/4za3iL03rKlI38V6xQcuUaPezVZgpqpj9tNC/aQsqVjf1
         Asha8ThZIjWxz1oDjZRA1AWrpOhb2mR5/k+ks/8qwbivCsBcQBsxlml3mB+eLKC8LmDx
         GLbrnMBfz8LLZKE7jBzQz3XWl79czMAvPd4E9jsrZ7+QngGtN3aZKD3MOO3UnHNwfado
         KegyFc4XL1RWQgq0iYvKbp0H0eYcq2AjsPnUMXepo+h+9dHHHRXjyLeLVVQjT0aqVcf6
         ftxyIe+3XVAosDeXUXaHQIYbMNr0T+LYcHcTycQ6lB3h6/fl2FJihL9xOVUJkmGBf2sG
         KQrw==
X-Gm-Message-State: AAQBX9emNlD/JhUO2Tbrs6E+m7oB0cm/bP9DvmEpzHPnJL8AZCjsXuG4
	UNR6/ZqtSoyyoTsv8FdIv94kcw==
X-Google-Smtp-Source: AKy350b0g044+MfIMYFBIarz3KOgjOGcfcYYACpoeHBupriobhjpp8ueHWz/AvH4sKT3Vf7PUgpPAg==
X-Received: by 2002:adf:ef91:0:b0:2ce:a697:75c7 with SMTP id d17-20020adfef91000000b002cea69775c7mr15074416wro.33.1680083553394;
        Wed, 29 Mar 2023 02:52:33 -0700 (PDT)
Received: from [127.0.1.1] (158.22.5.93.rev.sfr.net. [93.5.22.158])
        by smtp.googlemail.com with ESMTPSA id a18-20020a5d4d52000000b002d1e49cff35sm29667158wru.40.2023.03.29.02.52.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 29 Mar 2023 02:52:33 -0700 (PDT)
From: Alexandre Mergnat <amergnat@baylibre.com>
Date: Wed, 29 Mar 2023 11:52:20 +0200
Subject: [PATCH RESEND 1/6] dt-bindings: memory-controllers:
 mediatek,smi-common: add mt8365
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20230207-iommu-support-v1-1-4a902f9aa412@baylibre.com>
References: <20230207-iommu-support-v1-0-4a902f9aa412@baylibre.com>
In-Reply-To: <20230207-iommu-support-v1-0-4a902f9aa412@baylibre.com>
To: Yong Wu <yong.wu@mediatek.com>, 
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>, 
 Rob Herring <robh+dt@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
Cc: linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 Alexandre Mergnat <amergnat@baylibre.com>
X-Mailer: b4 0.12.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=913; i=amergnat@baylibre.com;
 h=from:subject:message-id; bh=2lmQpBSfKmkj53baZh+RDOWdyXIwY8mMHHkJ6yWng4A=;
 b=owEBbQKS/ZANAwAKAStGSZ1+MdRFAcsmYgBkJApf/J4/8wpCXgD5rDw3NQgdD8grhM9Af9YbqxIy
 yEBp/raJAjMEAAEKAB0WIQQjG17X8+qqcA5g/osrRkmdfjHURQUCZCQKXwAKCRArRkmdfjHURVC8EA
 CI4QEuomNhbASJLZdi5d/r5EegnsYbWHR8rkXNntq59Qwx/6Twleypy6HYlGUsG3WBFPio9aLGR8d5
 qMIChp6WqHEhdHWALqAILvjPM1Zi9FsvlEJCrzbqrkVcOE8L1MGpWwnGGJ8nV9fh6gGLJYdMzKFVOR
 bL0I6eaA54G3qtVqefcr7FnZHypqktPUkbw6F5e5u7a+zFne1k7SF+wJ9Ytu32qTcld4lpZ0OBxOdj
 EFVrFNQOLNsnIXT0b/ZsHtZVdyYDMJwLJBuHKvIoc/75hZEZN1i4fRSolP5KUCbsk66cvYUD5V4t/+
 i9GwcjvDR/LCi31daJLpX9watDEQuK22QfgOfh0X8lXekA2GL8FX5DAalJK0ArIXp+Vs9lQ8UNpLmJ
 8fQdTiUKkK0lf+d4a8zlzIGn0iHT881mGYd/TyWbddIxGIrEezUsZ5Dy3j39OGvR7DWllONgmfeR7H
 9QCIFZTfye7OXr8EmL8oZOkO9/cQC3lFpKdsH8zQ0bsPYjBvFyZFXL+5dSe4leNcc7QzlTMrHVOaYW
 CqN0xEsw2eY7vXsrNnCsp59zKI+o6g8vS1AXJAoYGnp1EvMiICLb8e8qp/zCKqla1PFG3Y1aWckrOU
 H7rUOpBDVsekJIG7DwOhuxiWb83tJQGD4iuhirFOwx9UnTpyEcW58f/amJkA==
X-Developer-Key: i=amergnat@baylibre.com; a=openpgp;
 fpr=231B5ED7F3EAAA700E60FE8B2B46499D7E31D445
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230329_025234_893160_1764E742 
X-CRM114-Status: UNSURE (   8.55  )
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

Add binding description for mediatek,mt8365-smi-common

Signed-off-by: Alexandre Mergnat <amergnat@baylibre.com>
---
 .../devicetree/bindings/memory-controllers/mediatek,smi-common.yaml   | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/Documentation/devicetree/bindings/memory-controllers/mediatek,smi-common.yaml b/Documentation/devicetree/bindings/memory-controllers/mediatek,smi-common.yaml
index a8fda30cccbb..d599a190952f 100644
--- a/Documentation/devicetree/bindings/memory-controllers/mediatek,smi-common.yaml
+++ b/Documentation/devicetree/bindings/memory-controllers/mediatek,smi-common.yaml
@@ -49,6 +49,10 @@ properties:
           - const: mediatek,mt7623-smi-common
           - const: mediatek,mt2701-smi-common
 
+      - items:
+          - const: mediatek,mt8365-smi-common
+          - const: mediatek,mt8186-smi-common
+
   reg:
     maxItems: 1
 

-- 
2.25.1


