Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 712E2C678D5
	for <linux-mediatek@archiver.kernel.org>; Tue,  7 Mar 2023 14:01:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=6cg9HCDND3GEgH3vKCid4qUViJxuJk258AZzVEc7UK0=; b=ocuEXCNKYBAUspbXS3Q6aR6pXV
	Ij/qCRGy3lSo+85W419niw4t9aNe+BSxSdbRrbhnWwoSTR/XpXUb/yHa7mNVOwDZtfkMwizkObTOT
	g1tt97Ir2djXTZmOfju9h6V0qO6DM87O5w5a8JIHEcc/BimWaUZJck+E0qOP1USBnB2te3mI9ARqq
	qkAtT3+bt28/JlfzHd4VInxmtZBdeSUi5DEX9nI+sR8ncG1toQO9iOKjHe27cKibBUp49PqDMKH/t
	xoQgs4nREOkcGGDoX1yFSScLMshkP8DPgeLbbbf7veOlc+wOC7obWynaIbItxQ4tzN2VC5TXsb8JM
	pZWwsjOA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pZXsD-000awk-7f; Tue, 07 Mar 2023 14:01:01 +0000
Received: from mail-wr1-x432.google.com ([2a00:1450:4864:20::432])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pZXeJ-000V3H-V5
	for linux-mediatek@lists.infradead.org; Tue, 07 Mar 2023 13:46:41 +0000
Received: by mail-wr1-x432.google.com with SMTP id l25so12192449wrb.3
        for <linux-mediatek@lists.infradead.org>; Tue, 07 Mar 2023 05:46:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20210112.gappssmtp.com; s=20210112; t=1678196797;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=6cg9HCDND3GEgH3vKCid4qUViJxuJk258AZzVEc7UK0=;
        b=nZulM4LiZhCrWN5dGGfsaTtcvuOcFva+Mf/NyFyqPZ+Gx+ab5MgsgvBD+zUgRtwW7Q
         fmoScdgNja8tD43YAoyDJ+wIil6AZzk2fBFQw/7TzBDgnvKYojxVIJZYlAfAwaEVmnRd
         REMvRPG0fbxMtuCOk78751qpC9vSwX3vpboGBeXc7ttbEg6RyyZqXGj33xdScP7+ZHiY
         4I/BCo1NqREKIPl9Z0zlBRGEKPKIXFpgiwH7FXCe+kS2JhZO8ECWxK0RI2dSiKW/onbY
         Gxd1di+TDP/dYWSwZ7BcGkcl256FfD2fUrBAjog4aceLV1nhvjOGmmeFnKZeFGCIs5M/
         nQGg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678196797;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=6cg9HCDND3GEgH3vKCid4qUViJxuJk258AZzVEc7UK0=;
        b=Yt5InnvfZtLT75xtM9HspjO+oP+iBsIjaU2Okmo/VaRsk7NR07PLvjrR+4Kk4oUWhg
         /gVBsFh/T4HozbPmaImS7hNvo7fHIPq+2AOsBr363Q3kHkkO9Qe1Y8T4HadMConybSi+
         GMrgjlVl/65d+G+3Y2vUxN6dstZmH1AEwWD7mr8vZoQKK5vIpL9G4a52XgXgXovZaKZt
         Tsgg3+W7+bagwHw6pv+y1nrc9MkLxXonfSierMEYI9EVSTjRTvsP2RbYB9aSg0C2mh9D
         dqYZE9GU+MUyrU/10F4AQ18mtHmzMtn8eO8NcjtOM3RPgZnXvwVTKIYC2tHA0xpDa9we
         UhQA==
X-Gm-Message-State: AO0yUKWi3JdOHXT51mHXN7knT6J6ipOfgvkGEdW9jbVrtPnLKvOmszz6
	fQSoT7AKIu3HdZVPRl2MkILeEg==
X-Google-Smtp-Source: AK7set/dC5yOlFU9rcWuAmivcfyv+LVau0QJ8iSiJD3wGphV4LPmgMYwQYC/Fb8yO+ZLrrDTR3Hk9Q==
X-Received: by 2002:a05:6000:1817:b0:2ce:50a9:6d8a with SMTP id m23-20020a056000181700b002ce50a96d8amr7861387wrh.32.1678196797352;
        Tue, 07 Mar 2023 05:46:37 -0800 (PST)
Received: from [127.0.1.1] (laubervilliers-658-1-213-31.w90-63.abo.wanadoo.fr. [90.63.244.31])
        by smtp.googlemail.com with ESMTPSA id o13-20020a5d670d000000b002c8476dde7asm12657607wru.114.2023.03.07.05.46.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 07 Mar 2023 05:46:36 -0800 (PST)
From: Alexandre Mergnat <amergnat@baylibre.com>
Date: Tue, 07 Mar 2023 14:46:26 +0100
Subject: [PATCH 1/6] dt-bindings: memory-controllers: mediatek,smi-common: add
 mt8365
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20230207-iommu-support-v1-1-4f0c81fd52c1@baylibre.com>
References: <20230207-iommu-support-v1-0-4f0c81fd52c1@baylibre.com>
In-Reply-To: <20230207-iommu-support-v1-0-4f0c81fd52c1@baylibre.com>
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>, Rob Herring <robh+dt@kernel.org>,
 Matthias Brugger <matthias.bgg@gmail.com>, Yong Wu <yong.wu@mediatek.com>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: linux-kernel@vger.kernel.org, linux-mediatek@lists.infradead.org, Alexandre Mergnat <amergnat@baylibre.com>,
 linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org
X-Mailer: b4 0.10.1
X-Developer-Signature: v=1; a=openpgp-sha256; l=916; i=amergnat@baylibre.com;
 h=from:subject:message-id; bh=DtGGRXbyTxce1ZCliJaQcicHc6O5LZx7VMpDiib11T8=;
 b=owEBbQKS/ZANAwAKAStGSZ1+MdRFAcsmYgBkB0A76McPWNiyzuoBC2/uH6vyhEJ5wZicabx41LHK
 rOI+CNqJAjMEAAEKAB0WIQQjG17X8+qqcA5g/osrRkmdfjHURQUCZAdAOwAKCRArRkmdfjHURcEdD/
 9CYfOxJr4rB0ORoZN2tOKczuo9Ya0nmSJsbJWmZIXFhFrj9HIHgkF3L9D7ijqPVTtG4FuW6Tj5XFQI
 yx1coIxJjjYTeWy17sW9ZiBCyJufWv7CHomn8BDrcSkBq7r1QBMk14XYCYeWcMVdFkhxWKDY4b1uMj
 Gp1cA6SrTR0ahbqlmSRYpcdr7pASa2C2xPTKfYG0UCVXrzkBsoAfFbeX66DRn9fhCLghCx40klphm9
 RFZg81Fz9vgymC9JyQ9+QIjjFSCYvRKcManlU9006mFiWp0OSXZSxTNxWZ07A3hWhGm0RNmUaGPLYf
 XMM/6GYLOZCdLam1FLSYxMThwI3kHQiWFOyz7Uf4db0q6MdETjbf1Ghxyyd+VIgAXAo1eZwQifeYU9
 cqTF5RNPAfZoHFANsn1W67Yx4ea+vOLD2uVqO5DcBMjn+MhXm+WDUsQCj67+iN2enU+2Q3JQC5XLpT
 3aPw6+kPZ+hWlvMxzKdmOylgcAa3fAEP9BC7pK2go706dYV28QPJvNuwmKI/m2DHw9puylUDezQ+RF
 MSruJX8UH9AlaMb6Uuf63XH6HIsH+YXgiPAWX2lZDV9itMJ+S/WLc+Ms+vOTKbWSogrSRBEMjQJklf
 aPU/Ziiq8VEWnfashNYuj5AMoTAsCBK9mukJXt7ddd/c2ZQF0C1Y7iGYsWsA==
X-Developer-Key: i=amergnat@baylibre.com; a=openpgp;
 fpr=231B5ED7F3EAAA700E60FE8B2B46499D7E31D445
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230307_054640_058013_7727835E 
X-CRM114-Status: UNSURE (   7.96  )
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
b4 0.10.1

