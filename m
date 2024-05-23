Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BA818C25B75
	for <linux-mediatek@archiver.kernel.org>; Thu, 23 May 2024 12:50:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=xenplDX50PgsFz2Mhp85GrWLaCXcLNdChHM7TGUmR30=; b=amannpKSJPPpzB2x+BAAL/B/4C
	EhX657xqdTqTQ+JJJKf6aanWO0T4XIzfbgE0xzdsjVjIi/uuPgnLTYbZXPaYZ/yvNSyGrrGRV18pD
	6hNnt1DZd55f1rXnNFLjOzaGFuYfD53HL4aXPAd28SHMGcPmCK1fBFCS542XTkOK+VXZyaZe62STE
	zaDb2iJVM6g5TG4N4BTXZkc4f4jmb7KmbvZo+CAofYPAK0jMGVwJ+EzWKRjqF/cA9RvWgxbNNc80z
	3dxiAtNzXsitexf2F6f19iLWPSDbvf5Ws5id3end7eKIYEHqVsyvMrN/ZTjGo8HWbolCMd7tfutwH
	ptyy2Q3Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sA7tc-00000006FTe-0dIU;
	Thu, 23 May 2024 12:50:12 +0000
Received: from mail-wr1-x433.google.com ([2a00:1450:4864:20::433])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sA7t2-00000006Ex9-3FRb
	for linux-mediatek@lists.infradead.org;
	Thu, 23 May 2024 12:49:39 +0000
Received: by mail-wr1-x433.google.com with SMTP id ffacd0b85a97d-354be94c874so1501601f8f.3
        for <linux-mediatek@lists.infradead.org>; Thu, 23 May 2024 05:49:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1716468574; x=1717073374; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=xenplDX50PgsFz2Mhp85GrWLaCXcLNdChHM7TGUmR30=;
        b=D86zkMWebdotPROpAt1LdhhjUTdYe1iWJrxHtPhttZI7151e99VSwXf7rJ6ep/34gW
         gSULKRql3sJRtcwZFvwFuu7spZ8NnXr/PkQx68oxrVD8kNjaqQ+0WYTzW/pu+XN9yTNk
         8TVVHDz+Dx/EZRw9d/cNP/wGrGc0yWA0OICTF4K3NwrsBnxgpu/3lOsUgBvnEpRy+Xdh
         s5N3YBF96BSp4purdonvscDICQWMpjANKgX+iR0CxbqDrYhxyrRQBNNVqFuFGHLAh8zJ
         wUkjXYGKAHmJJJErBB0316c508fPLiLC7l7DoaOxVFV+BOJUVJwLNSTARGKHhTEKkE47
         OgvQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1716468574; x=1717073374;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=xenplDX50PgsFz2Mhp85GrWLaCXcLNdChHM7TGUmR30=;
        b=wXB9fkgjtxLQMEZtKpICXt9n2Zj2n8d1cl+6gIIve+iSOSQyMDwLbOp6cyAp0WfP96
         /RjeL3cxQ/TTQr2Twn5VUY7WuKMgnDbNCyMSweHAOgiwGl8tL9Gqmuvpx/QKcdOyx3E4
         bPXI5AGVuDrW4dYeIf8iM9AyIfYL8W/nxY9rnvhPi4EdHdOd4a7FhyydJDh5HR2vsu58
         kSCvWvukLGtkNd/DCQKG+nPoPHjjcuInZh4Tp5GU/46AqsYQG0p2+Q0GXfB4oOe5B3Lr
         1P5XFe7PuYHO9rVMpZwMlDfPsVdihAMZoOdPiiAl8oq8+QNIxTIW6qm5yCqnFGgHlDDO
         MNiQ==
X-Forwarded-Encrypted: i=1; AJvYcCWWJ81Ma7A5qJh0MwFtJW+oJPBXGF/A+xnJflZRet+EenkDuwQGHPFv8oFdjMb48RMg0WhvACP7lVrexlld+yDwbSs+d/un1qI3AMSJUx9UlzbJ
X-Gm-Message-State: AOJu0YxVrQ+asyktPZI/P63TvMH+4XdwnNHc28b9mvWXQC3UspI2QhOe
	tAtUoGhDxmBZSVbgBaTFY9SGcvV1flUNkbQ6+/4XXcLbWcNgxLokEX1klO9pyWs=
X-Google-Smtp-Source: AGHT+IHKcCo5SkmMzoymqkjybudh+EkK1WbZuK5jxJV/cF01Mbd4x198B5LKwj085upJo1QzzuY8WQ==
X-Received: by 2002:adf:f192:0:b0:355:21f:be25 with SMTP id ffacd0b85a97d-355021fc4ecmr507776f8f.7.1716468574168;
        Thu, 23 May 2024 05:49:34 -0700 (PDT)
Received: from [127.0.1.1] ([93.5.22.158])
        by smtp.googlemail.com with ESMTPSA id ffacd0b85a97d-354faf3fa68sm1259611f8f.116.2024.05.23.05.49.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 23 May 2024 05:49:33 -0700 (PDT)
From: amergnat@baylibre.com
Date: Thu, 23 May 2024 14:49:19 +0200
Subject: [PATCH v4 06/15] dt-bindings: display: mediatek: dpi: add
 power-domains property
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20231023-display-support-v4-6-ed82eb168fb1@baylibre.com>
References: <20231023-display-support-v4-0-ed82eb168fb1@baylibre.com>
In-Reply-To: <20231023-display-support-v4-0-ed82eb168fb1@baylibre.com>
To: Chun-Kuang Hu <chunkuang.hu@kernel.org>, 
 Philipp Zabel <p.zabel@pengutronix.de>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 Jitao Shi <jitao.shi@mediatek.com>, CK Hu <ck.hu@mediatek.com>, 
 Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>
Cc: dri-devel@lists.freedesktop.org, linux-mediatek@lists.infradead.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, 
 Alexandre Mergnat <amergnat@baylibre.com>, 
 Fabien Parent <fparent@baylibre.com>
X-Mailer: b4 0.12.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1726; i=amergnat@baylibre.com;
 h=from:subject:message-id; bh=XahM8CveSVHt1oE74u7zHenJKYAxVWcUJtTL9lMvR8E=;
 b=owEBbQKS/ZANAwAKAStGSZ1+MdRFAcsmYgBmTztTZLC6mHLbIv5Vn+HyPUhla4L7qCjuTNx0/N51
 3iYjrqaJAjMEAAEKAB0WIQQjG17X8+qqcA5g/osrRkmdfjHURQUCZk87UwAKCRArRkmdfjHURSOqD/
 9tudSYcwhpHYqdJVEwSxMTGCUhcD7VJyYs89HVB8ojqKBOzu1ofAiFlw30gn/v/yupim6rnrAZ1qhB
 98esztDXhRsMRf6axAX+D5VrcV3RLdtk68I0mNujM8nTlgUptXYAdc6AcZDmrqpcWbjF5tf4YwOAuQ
 OciVXFTCK+HbpFXvw+aYmy6C1spxfUDh5GiKP/rQG6mM6JRCV+o75CXmCIbeb3eJ5JVfPMWeufW5LE
 VTEw2tslXtD/PmkQ5OmH/YWGjyz/+UZxEzvZtAemr/5YJqh+xcS0D6V154dM0NXNWb5KJPX9BdjDdm
 uw9IkambKs2Kh3FJBZzT4XtELKZ6ssLtKDm2oy18rqr8nw8QnlMZW5QtgCO/KZfFezYgQP4FcX46Oh
 vl9+BXSXq/e7FCQXF52hMvvUC4h7Xa9ACilPVf2rGVFrIKoSNEUc3C0zumDnkJ7fJlYFDcfyyUrQDR
 eJ1dwwFmpCGA8llnZaK8YXDp165TWVmW7YIKvsXhWySIL8cz5rXLzr6vsatBOkAsGNx8Fd2gRssmoG
 tXSVmult4N9W2IdAbmVFxlt2HFoyQVX1uOcF+yYy/pON2sypo79Fttge5+qTDdXWatTZQ2cFlNYCkN
 sM8LFjNajmruxjPmgQIRYaAwvOM2GuGhnaZPX2NSc6xF9jb08HTnAH62ajuA==
X-Developer-Key: i=amergnat@baylibre.com; a=openpgp;
 fpr=231B5ED7F3EAAA700E60FE8B2B46499D7E31D445
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240523_054937_079375_2EBADD90 
X-CRM114-Status: UNSURE (   9.83  )
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

DPI is part of the display / multimedia block in MediaTek SoCs, and
always have a power-domain (at least in the upstream device-trees).
Add the power-domains property to the binding documentation.

Fixes: 9273cf7d3942 ("dt-bindings: display: mediatek: convert the dpi bindings to yaml")
Signed-off-by: Fabien Parent <fparent@baylibre.com>
Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Acked-by: Rob Herring (Arm) <robh@kernel.org>
Signed-off-by: Alexandre Mergnat <amergnat@baylibre.com>
---
 Documentation/devicetree/bindings/display/mediatek/mediatek,dpi.yaml | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/Documentation/devicetree/bindings/display/mediatek/mediatek,dpi.yaml b/Documentation/devicetree/bindings/display/mediatek/mediatek,dpi.yaml
index 6607cb1c6e0a..169d054d81ff 100644
--- a/Documentation/devicetree/bindings/display/mediatek/mediatek,dpi.yaml
+++ b/Documentation/devicetree/bindings/display/mediatek/mediatek,dpi.yaml
@@ -80,6 +80,9 @@ properties:
       - port@0
       - port@1
 
+  power-domains:
+    maxItems: 1
+
 required:
   - compatible
   - reg
@@ -99,11 +102,13 @@ examples:
   - |
     #include <dt-bindings/interrupt-controller/arm-gic.h>
     #include <dt-bindings/clock/mt8173-clk.h>
+    #include <dt-bindings/power/mt8173-power.h>
 
     dpi: dpi@1401d000 {
         compatible = "mediatek,mt8173-dpi";
         reg = <0x1401d000 0x1000>;
         interrupts = <GIC_SPI 194 IRQ_TYPE_LEVEL_LOW>;
+        power-domains = <&spm MT8173_POWER_DOMAIN_MM>;
         clocks = <&mmsys CLK_MM_DPI_PIXEL>,
              <&mmsys CLK_MM_DPI_ENGINE>,
              <&apmixedsys CLK_APMIXED_TVDPLL>;

-- 
2.25.1


