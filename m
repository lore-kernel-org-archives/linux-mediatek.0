Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 031A7C6FD18
	for <linux-mediatek@archiver.kernel.org>; Wed, 29 Mar 2023 09:52:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=j5WwEAxGItsIpKUuUB3hcC/UquIk1bCmeeOB6uO9lrU=; b=mM1cuiHnj51qGbtn5TeGzFCvdt
	MpaILin+YCYmHnaby7CYtS+26i6xY+Ig/So4CaD0KxmOuJ14fXeQyMiJs7eIcjPxmGFyuRGMOsNyo
	VN36ud9J30YnniRaFvpeB2OoV/R6OMC+V9TWshB+D9nyLlVfBdOu0fMzH0QEpIcVhPdS/B1qtgRSK
	PvLov2+V+wH47jzPf91VZY1VKuIJz+R5NY6ErxVJMqZJve7XrtUq0BQ1m4HVZeBqbMG8UB5p+5GDs
	lK5NRBXyg1x4MqIBtWFGYTrn84cTKRfOVZN7yOiJJ9aTb8T8WpHQ8biIt8+WNNjmfYBx5IuTOKj3R
	a+VcR9GQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1phSU9-00HNBm-2y;
	Wed, 29 Mar 2023 09:52:53 +0000
Received: from mail-wr1-x436.google.com ([2a00:1450:4864:20::436])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1phSTr-00HN3s-18
	for linux-mediatek@lists.infradead.org;
	Wed, 29 Mar 2023 09:52:38 +0000
Received: by mail-wr1-x436.google.com with SMTP id q19so11939886wrc.5
        for <linux-mediatek@lists.infradead.org>; Wed, 29 Mar 2023 02:52:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20210112.gappssmtp.com; s=20210112; t=1680083554;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=j5WwEAxGItsIpKUuUB3hcC/UquIk1bCmeeOB6uO9lrU=;
        b=tkneNf34o5trlHedcbEJBG1C/G/seUDMlCP15KhCrgv2UFRQTD0plONLuU+K4ZOqXK
         dc3Efji/EyVqO+RjidCTgeM8nSmo98t9eZ9sk79vZr7LFgbaFeE3H67pzOlmos4qNmY7
         OrcZVPc4E+NXKqwod5EMLGPw6zX2ihgjC6KPZtkuR72lVzrGk9AyfqzkDBuUz6phdaji
         Er7A//QzcZfxj3Dnp5n9XNVRekELt3dVu0gpAYO4odWpZ5zwpWRppRNZ9lMyadQJ0r60
         1XP5mx2utIcO0dn6/63TFIew2Ycs5HtcrW1o+v2g+rMXga6jZ4es039/szYRIVs9GijG
         gf8g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1680083554;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=j5WwEAxGItsIpKUuUB3hcC/UquIk1bCmeeOB6uO9lrU=;
        b=L088uF+ySIvJS/gP/hpIUU152Mt6f6cLeDGjxG9z6hqyZyD+2g3F6twz7Qi6dtil+t
         9p8860h2sX1hMFvn5kyamYE4p0VtQsSi1qfmqjYPRpGPZEHsmC0EQJBhMkMCYogYlQYA
         jPg/E3OOqEkGF6bzeT56c+6SjoGaOIP1Tf1GtuIPbh3HVbeALyTrP8bh5YmEKsaFwrmt
         gb+B/eTYazEdM+gTWV5ISMJ/9Zj5ix7Awuu5ft2aP2gtGy3rPGDl+rjaa4M6jDm5BaNH
         7S3yvV4laN43DvJjgOqBzBI0854GCnP12G+PpXGoyLT+XkwDeOvwzC5LtjDZl57xVAC1
         ALrQ==
X-Gm-Message-State: AAQBX9dSu43Ozum+skP0kCh0Qd43JbbqHQnqm4Zf9KF3xuYsuPuGFn4d
	2Wr1R6VUrZCEWitEPZOkD1tgxA==
X-Google-Smtp-Source: AKy350byewSo7u029DsdGaH9KBuORmJdnk4e7uKUa4N0kYNWx8PgX4NtzFGwssEsCdZFFLDX+1+mcg==
X-Received: by 2002:a5d:414e:0:b0:2d7:531f:b15 with SMTP id c14-20020a5d414e000000b002d7531f0b15mr13224681wrq.42.1680083554206;
        Wed, 29 Mar 2023 02:52:34 -0700 (PDT)
Received: from [127.0.1.1] (158.22.5.93.rev.sfr.net. [93.5.22.158])
        by smtp.googlemail.com with ESMTPSA id a18-20020a5d4d52000000b002d1e49cff35sm29667158wru.40.2023.03.29.02.52.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 29 Mar 2023 02:52:33 -0700 (PDT)
From: Alexandre Mergnat <amergnat@baylibre.com>
Date: Wed, 29 Mar 2023 11:52:21 +0200
Subject: [PATCH RESEND 2/6] dt-bindings: memory-controllers:
 mediatek,smi-larb: add mt8365
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20230207-iommu-support-v1-2-4a902f9aa412@baylibre.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=895; i=amergnat@baylibre.com;
 h=from:subject:message-id; bh=NVbTKEoEUh603XA7uYARxuPDAu5UoEtf9xrwI1znpgE=;
 b=owEBbQKS/ZANAwAKAStGSZ1+MdRFAcsmYgBkJApffBpaxAKuc7aTZi+s2URLQXTX+8hl3dvRDFh+
 5WJNvVGJAjMEAAEKAB0WIQQjG17X8+qqcA5g/osrRkmdfjHURQUCZCQKXwAKCRArRkmdfjHURZSPEA
 CNaXGxjj4cgfKrhuxRg6JRYJVaqabu/st50LIHZ+IM8roj+B8U3RpyI6Tg5kYXr+xSZAabcCB6g/S5
 tCWz8XkHw77IHJRhDU8cv3L372cVCL4i8mO4rbHHpLnQccQl5GlU+qdS1aiCgEHHRQSyx9L9uhUL+r
 8hGrhoM9JCx33yQAcjZvuUYNsSS07Vf5p/IV3v7J7NXwhEdjnqGjPfb2mura9Ja7hZV/Mj/yjNbz5Y
 fzEyFl0XLl1efv+n43Xp+cBMJ+bG/uLaRW5Py6MuS0P1TLEKvtWq92LTD0JX61P0jaUmu2U+OXfbFA
 SwcqrL4noGm1WBO5NWl4/FdWvK34W2dFZ9Z/em2OSCNlEYmMIZc5JJAroJujDuobm7VROwuEw9mAby
 L7iVjb8N/sify3HVbuV/H2LXa5vXBpoBc+dAWzqD6jZ7VVeP74Zl/sc7dz3NG4WJK9WdJOPz1VrNP0
 Ii6ohnjnZ3rUeCcYBrPE7YvGMBl/2LXh6ALtf1uGkl8fkIk8/hGWOWtqSi5K3Fm3Wy9bb3y6D55QIG
 gV0p0NQ7NY44zfNy60uxoTdBW8NQcvtIFGrH6ZTHj9NABvr9NzUkafxzv1e6eqVxgiX2B0XFVXqGvc
 ApAIJii3ESgbaJT5D/8Vn13UfSrbHvdE0Hkm0FerG6q0X5nRAdsyFM9xMduw==
X-Developer-Key: i=amergnat@baylibre.com; a=openpgp;
 fpr=231B5ED7F3EAAA700E60FE8B2B46499D7E31D445
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230329_025235_394391_44157543 
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

Add binding description for mediatek,mt8365-smi-larb

Signed-off-by: Alexandre Mergnat <amergnat@baylibre.com>
---
 .../devicetree/bindings/memory-controllers/mediatek,smi-larb.yaml     | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/Documentation/devicetree/bindings/memory-controllers/mediatek,smi-larb.yaml b/Documentation/devicetree/bindings/memory-controllers/mediatek,smi-larb.yaml
index 5f4ac3609887..aee7f6cf1300 100644
--- a/Documentation/devicetree/bindings/memory-controllers/mediatek,smi-larb.yaml
+++ b/Documentation/devicetree/bindings/memory-controllers/mediatek,smi-larb.yaml
@@ -34,6 +34,10 @@ properties:
           - const: mediatek,mt7623-smi-larb
           - const: mediatek,mt2701-smi-larb
 
+      - items:
+          - const: mediatek,mt8365-smi-larb
+          - const: mediatek,mt8186-smi-larb
+
   reg:
     maxItems: 1
 

-- 
2.25.1


