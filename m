Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AB6D9C678D5
	for <linux-mediatek@archiver.kernel.org>; Tue,  7 Mar 2023 14:01:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=SEf10B8VEiphcTb2B4uTjdUHx2WfwTpFd5+nhXo7zM8=; b=szxyumHU03t7VxW0L+bKsSvwfc
	lFuoSJUDWtPyKhTM7AK9jGHhKcbnu/RIfGUnq3RBpo0wPrjBRHr4psuMpVephYiR3N03gr1Cj8akx
	wdv6BHDpMC8cW1QPlDwbySlDj8B8oNhecBVOvZY2sRkslr4yOQfViY7FOB5TU57Spy47UJBUXHvin
	Ntdqv6dfG4xACcGC9vsKGAb7v3yacGLZVRWzjmhVyqrhqpcj6kchRqlzve750foIOggTs+xcrT0cG
	HT530clAJO6ERIo3hzrUvjrQZeY6O60k1vhDovOafZNi7S3KxBhhPn5vWOb7s36K21Y0gvYcDG8ka
	++SAHRrw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pZXsx-000bIL-GZ; Tue, 07 Mar 2023 14:01:47 +0000
Received: from mail-wr1-x42c.google.com ([2a00:1450:4864:20::42c])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pZXeK-000V3e-BW
	for linux-mediatek@lists.infradead.org; Tue, 07 Mar 2023 13:46:42 +0000
Received: by mail-wr1-x42c.google.com with SMTP id bx12so12146899wrb.11
        for <linux-mediatek@lists.infradead.org>; Tue, 07 Mar 2023 05:46:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20210112.gappssmtp.com; s=20210112; t=1678196798;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=SEf10B8VEiphcTb2B4uTjdUHx2WfwTpFd5+nhXo7zM8=;
        b=4sOznHYviOoLd6Zd8EYiOJist7t8fD5mJ+NBE7qVWJmSnPsvlosTA2cevluMpj197D
         40uGAHQCT3WlWo7+hpEtsQyqFii+aVMxXSnaN4McuYKRFQIPFUzdCot9KMUlGUU/CYL7
         P2S82Eqp14aXOn2DfVRIZLesyAuzLnCcXUef3xy/LhoOE7LNiQ0uSWqy1bpZLcZxO21b
         uLlbsGY3OMMeWQIxRXNCujtOh3iItegi9gz70HoUKtGEemGoEadtpxqUjshuRz5x1BB5
         QTwefKOx83KFVEIH1x5xe8NcP0iTuyVZxeYoibjrFdat6I2TzJwA3OG2pCJULhrD2Z7Y
         nK8w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678196798;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=SEf10B8VEiphcTb2B4uTjdUHx2WfwTpFd5+nhXo7zM8=;
        b=IZGBdOouS2vYeL3re+CyL4EGw1a4fVq2xr0uB2jlHycdfkPSJ05tbN6xvsx4+My7Nv
         93qHdVrr8eUXFGnkSswMKUSa8V/8XNRzM3sTS5hu7Uom5x3rd3QAvsZ29euIotHbGAv5
         RNbUCocXwtj+uPq9WOyf6sBWt388aAYm87eOd0FiCEKwIzFREUapd+c5k6ZH7VBsB95J
         jPWOrRZl8ibhxOSy2iGTf4UYdQ6WCVM/r3YfQ55LHhsj65bB4yBVeUXiqnkeeafNpXel
         BtUSBhFZ4XHjKe0iW6XgqNYS+Swsr9NxONMO6oD28UcSpQnKCW+IiZ/1nohYpzre8pxY
         nZAA==
X-Gm-Message-State: AO0yUKU2wNF4Q8JkViKHEbvXJTomG0+9w+7FeIdD1y0MipYTRiqgFW9U
	2Y39UEJgH56ecg8xsVmq+h6VoA==
X-Google-Smtp-Source: AK7set94hvOKIE8CibQ7R/8FK8dBtsN5U3aL2wjYc5zEKPs6aatdvCcFPZwezGFFtCpd4yZqHZdgrQ==
X-Received: by 2002:a05:6000:104b:b0:2c7:13e4:2094 with SMTP id c11-20020a056000104b00b002c713e42094mr8912781wrx.42.1678196798354;
        Tue, 07 Mar 2023 05:46:38 -0800 (PST)
Received: from [127.0.1.1] (laubervilliers-658-1-213-31.w90-63.abo.wanadoo.fr. [90.63.244.31])
        by smtp.googlemail.com with ESMTPSA id o13-20020a5d670d000000b002c8476dde7asm12657607wru.114.2023.03.07.05.46.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 07 Mar 2023 05:46:37 -0800 (PST)
From: Alexandre Mergnat <amergnat@baylibre.com>
Date: Tue, 07 Mar 2023 14:46:27 +0100
Subject: [PATCH 2/6] dt-bindings: memory-controllers: mediatek,smi-larb: add
 mt8365
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20230207-iommu-support-v1-2-4f0c81fd52c1@baylibre.com>
References: <20230207-iommu-support-v1-0-4f0c81fd52c1@baylibre.com>
In-Reply-To: <20230207-iommu-support-v1-0-4f0c81fd52c1@baylibre.com>
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>, Rob Herring <robh+dt@kernel.org>,
 Matthias Brugger <matthias.bgg@gmail.com>, Yong Wu <yong.wu@mediatek.com>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: linux-kernel@vger.kernel.org, linux-mediatek@lists.infradead.org, Alexandre Mergnat <amergnat@baylibre.com>,
 linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org
X-Mailer: b4 0.10.1
X-Developer-Signature: v=1; a=openpgp-sha256; l=898; i=amergnat@baylibre.com;
 h=from:subject:message-id; bh=o5INfZQdHMAzRwteTSUE4GnwTkm9SQeKy4Fu0Y5Tde8=;
 b=owEBbQKS/ZANAwAKAStGSZ1+MdRFAcsmYgBkB0A7aarELR02nYYjRryO3XRDB2eH+dFM6D6Rljrp
 qSQee5OJAjMEAAEKAB0WIQQjG17X8+qqcA5g/osrRkmdfjHURQUCZAdAOwAKCRArRkmdfjHURVuiEA
 C5eGs1STXqlKB+t00zv5k0ryooUVKloiajkvpVhlXiUWCv+ZRR3p4+P3iw3XgbA2R295UCLSDNqqFg
 vrM+kCLl0Xr/hntRdHqI1kGcC1dPt81L2OtwBKTM4J0MnI6cEJ8pEmTzgR0aLzAzhog/2wwMJAWa3b
 r8q2bkaQd23d+Gi0rToQh3D11H+5hcufvkxl/nBzgHx+ju/JrgVR4XGW/hbb3ICocBl38XUL8A1iBD
 rGpJp0mo3EsZCEF9iUOYkmBr2OCkfHzSPQ4BNRY1ukkYZNEaLb6q6H91QdvWoxNPAq79d2c7Te938c
 L0ZjFXcwC7/vPf9DVQxl5EYO0GhAV+dL3wjdcKo46JDSNRdF7FY4iYbAFzyc8C8sMBVyR7EkMTbNQL
 EKajjbZQHNtQE31O3JEjY6aN8a39ImMIfi90OKD2n8xXBCa3svml0DVu887VxN7ujdWLHVKJaKRAlW
 rFFVwKWimqbz6P8z/Y04AqEkJ30TAx7moKOhNC7CTefFo9iPGzTkoO3NlQUVr0MCZjzGzFzCAmdNq8
 fxI/TQ16f9uR8qoLQA4mWIRh3JPAZs3dTAfM8UmUkdSs4I3j9tXQs8BdgSu/f932KhU52OW5YFeFuf
 CL6gMd8ZUiZXDkpB6qboc61/wyYsL7Z5e4694VRm4jOog1FSiMor5i6SU5xg==
X-Developer-Key: i=amergnat@baylibre.com; a=openpgp;
 fpr=231B5ED7F3EAAA700E60FE8B2B46499D7E31D445
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230307_054640_434010_63AB71B6 
X-CRM114-Status: UNSURE (   7.77  )
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
b4 0.10.1

