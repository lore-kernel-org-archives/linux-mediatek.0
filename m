Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8496DC46467
	for <linux-mediatek@archiver.kernel.org>; Thu, 19 Jan 2023 17:10:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=fbD+DW6kRi8WktiZxNWXXSbOmEZ8Ih8ud6GlSgUdI9o=; b=1HBG5DliL+i03U7VJiPS3Yhkie
	74JvFRaz7CF45a17r5ip21wYncTs571SCKatmHufJ9MX5zmd5oExxfro6NgZt22hAzye+N3LWVybL
	JXsmk63lC3S024Ye0xZ7pO3PINUb0bYVcTcdF/klvhDEJ+XqtTrJLDZYqjAhsl/46Pni+Z6Bizb/H
	pSZ+au55VGifznz/UwMxj7XVyOeGl5lSOqdDF8juLENHYkx/HCHHJ4CFFhhS/Adccmr9bDCA4V2N8
	ifog6GW1IlEwftPVY4Ydj0fvbHWPFMrn1mb1QjNcwiN/YovnmlQLVFCc9kcv310pJPlw+GiDo5U3o
	i08dCjhA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pIYQR-006B0E-No; Thu, 19 Jan 2023 17:10:07 +0000
Received: from mail-wr1-x435.google.com ([2a00:1450:4864:20::435])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pIYPb-006AhH-H6
	for linux-mediatek@lists.infradead.org; Thu, 19 Jan 2023 17:09:20 +0000
Received: by mail-wr1-x435.google.com with SMTP id e3so2493099wru.13
        for <linux-mediatek@lists.infradead.org>; Thu, 19 Jan 2023 09:09:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20210112.gappssmtp.com; s=20210112;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=fbD+DW6kRi8WktiZxNWXXSbOmEZ8Ih8ud6GlSgUdI9o=;
        b=YZC0yjtCR5ZC5+IGqwbhSVZ3qM78zr2yGAKBM3gkATEvj7B5eHWppakAIJVGHQNWfC
         VtWA/Q8aoR0z7bK3ibou6zaFcO+ilBntnTCFXE/O0SjRw091X4Oz0rrlhoPSnfI9Qt6J
         Y2u1IrQv0Tn8kWLdKuVB6rbAge1FRCWZ304wZQPk68TPVfqO42i1y1iPyix0AU9NWFO6
         AcveKrquzrkzoflyNqv1iBaA+IpdwGsZ9b/gs0N4f9cOkfeMYlZRUr9yuQKT/ELTzNpA
         rvcmmXAWM0wByruRmEXyg87+a0QeUaGMQJ5ZYoWU2dGFtK+h0aI1oQuhp8+PjX/6NebX
         cGzw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=fbD+DW6kRi8WktiZxNWXXSbOmEZ8Ih8ud6GlSgUdI9o=;
        b=RC+dq5b9OsfHysastUvUh3eJd2EiKLdS7FYb6C/nNiuIl9m3lhDpxVcbVUlXbd5vzK
         tPAG0wV2QF6EysR9p4MwaYzGPTyzgaRMWs67DHWVpo7TuKFsGAMjroKCiPRbdSgp4Jrt
         09NJreQEkVqdysqlz43nFpEi9FqKsTrLkf4NlFOyEPbKQQUk0UkHgpXrjiLpOV0CMTJm
         Ch1Bh/7po1Ldl1G4NlMN+LplwZNY7hxxYUkgn2erLhD63PiCHbcG6XUiiXEpWS88Y0Ls
         rlwgofIbaG5vUPsrceBnXsStmTlWiRIfoO40rqmULxmjwbz9WE0kcB92aQJGTLIiq8u8
         538w==
X-Gm-Message-State: AFqh2ko30jse0AtfFIFZQwtG9lEXpgc6hhIXTmgzVGK7MOn8S9/nfqjW
	iG115y81GShwtL0oNQp7ZknntEkOuPzbADhO
X-Google-Smtp-Source: AMrXdXtZ45FHDMDTTs7pqeSXu1NIqrWu0Kr3eR7aTnJku39FmwWKGvDZX2rIf2nGojdlUiU+4QUC1w==
X-Received: by 2002:a5d:53d1:0:b0:24f:a289:b422 with SMTP id a17-20020a5d53d1000000b0024fa289b422mr9594458wrw.16.1674148152986;
        Thu, 19 Jan 2023 09:09:12 -0800 (PST)
Received: from [127.0.1.1] (158.22.5.93.rev.sfr.net. [93.5.22.158])
        by smtp.googlemail.com with ESMTPSA id bu9-20020a056000078900b002be1dcb6efbsm8738701wrb.9.2023.01.19.09.09.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 19 Jan 2023 09:09:12 -0800 (PST)
From: Alexandre Mergnat <amergnat@baylibre.com>
Date: Thu, 19 Jan 2023 18:08:52 +0100
Subject: [PATCH v2 1/3] dt-bindings: i2c: i2c-mt65xx: add binding for MT8365 SoC
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20221122-mt8365-i2c-support-v2-1-e4c7c514e781@baylibre.com>
References: <20221122-mt8365-i2c-support-v2-0-e4c7c514e781@baylibre.com>
In-Reply-To: <20221122-mt8365-i2c-support-v2-0-e4c7c514e781@baylibre.com>
To: Qii Wang <qii.wang@mediatek.com>, Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Matthias Brugger <matthias.bgg@gmail.com>
Cc: linux-mediatek@lists.infradead.org, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 Alexandre Mergnat <amergnat@baylibre.com>, Fabien Parent <fparent@baylibre.com>, Rob Herring <robh@kernel.org>,
 linux-i2c@vger.kernel.org, AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 devicetree@vger.kernel.org
X-Mailer: b4 0.10.1
X-Developer-Signature: v=1; a=openpgp-sha256; l=1047; i=amergnat@baylibre.com;
 h=from:subject:message-id; bh=w1ZiqWA2bE004ri1B4ESDbnqlp6EYjeGLKUKJD1Y6mw=;
 b=owEBbQKS/ZANAwAKAStGSZ1+MdRFAcsmYgBjyXk2vLWvBYdixkUMWWeiPBfDt/ZlB6QQzrHTyGvD
 AINYpuGJAjMEAAEKAB0WIQQjG17X8+qqcA5g/osrRkmdfjHURQUCY8l5NgAKCRArRkmdfjHURQFqD/
 43HvhF730JTqu82W+wSGG0WugG9LqdbtIwhRh2PApy/wnJ+OzO97fDQNuMkrOZ+IwOzQvHuvX7jSu9
 DXRdCth2gWERiv2PwRlS61FMpI4osgPOgDvC3z9Cx8ah8jdMDmppQ/M7Cb8RpoRVvY0u57YqHSFhAe
 xNyHoWSsT2ukmRZKPp1wcJ+JVLTbR9ibAzBWFWQ7C+DWYiFSGd26TtF/vgxfZObsZDcxMMW+78/UN+
 KAoIWpLvGGVNDoWcXOJ9XHuuoDUoZu2Dc4Tapihdw7DygQp4EJkO3aFRwq/H5+mEYM/MvvWopjy5Qj
 +a0J0Yd+OvjswSHMj0i1taF3IgfDUafy3s5ghKBCLOYAcR2lVeckVO1lGeh4JKlc55V61oFxzT/R3p
 q1ppDVrLURe+z+jO2JeVVNE6vJ5DHE9I+Etrt63grOeMRMGYLbNMaNKYfRyUN9ldyqAl0+w40LP4fq
 Jhp2uL+stooWYuizoIhKhSwINMUe7MhhEjPbnH52dP+6zP0tBvw5MXfDBP4zi8ky1yHS2rXDzW0kck
 ZFXY0JSkImSIkRiJoYrkOtBYB5h0jDqgqf6h5JWaMJ8Zv7aSc5X6tiT2Fbi4WdZ6t5nRtQzM5fsmHK
 P5yLnSvleMp06Hgn2KWq4SYUpce4cT+ZQYPvCHLDDd97ZoJFn9ux28LzDgMw==
X-Developer-Key: i=amergnat@baylibre.com; a=openpgp;
 fpr=231B5ED7F3EAAA700E60FE8B2B46499D7E31D445
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230119_090917_894598_C389DEE4 
X-CRM114-Status: UNSURE (   8.75  )
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

From: Fabien Parent <fparent@baylibre.com>

Add binding documentation for the MT8365 I2C controllers.

Signed-off-by: Fabien Parent <fparent@baylibre.com>
Acked-by: Rob Herring <robh@kernel.org>
Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Signed-off-by: Alexandre Mergnat <amergnat@baylibre.com>
---
 Documentation/devicetree/bindings/i2c/i2c-mt65xx.yaml | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/Documentation/devicetree/bindings/i2c/i2c-mt65xx.yaml b/Documentation/devicetree/bindings/i2c/i2c-mt65xx.yaml
index 421563bf576c..72ae2e01cf22 100644
--- a/Documentation/devicetree/bindings/i2c/i2c-mt65xx.yaml
+++ b/Documentation/devicetree/bindings/i2c/i2c-mt65xx.yaml
@@ -41,6 +41,10 @@ properties:
               - mediatek,mt6797-i2c
               - mediatek,mt7623-i2c
           - const: mediatek,mt6577-i2c
+      - items:
+          - enum:
+              - mediatek,mt8365-i2c
+          - const: mediatek,mt8168-i2c
       - items:
           - enum:
               - mediatek,mt8195-i2c

-- 
b4 0.10.1

