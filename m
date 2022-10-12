Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C575FC433FE
	for <linux-mediatek@archiver.kernel.org>; Wed, 12 Oct 2022 07:10:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=a6aE/yeSlpqCwXOc17W/RYuPLvzETNRc+g+Ynkpn/I0=; b=OdBF7nK80QNoqF4fkBcNV9ylxJ
	/gcRjifHxd3gnzQ3BKT+pR7XQjG4gxgQGFjuHx8pjJNbMcEGbd3AxYRb0BjeNwUBrasMu0vU2XVXz
	buumG3fD3+VgDxoN/jutfI2iwxDMabS+3HK8NeBbW+irMxjE+bqeGO8IUXOW+vG9++4KsxQ3RTUWs
	x8XVgoX0CJJsOB8cmZfcmImWz+m8ebT08VeLXjx4InYeGFR4Y/ttMz1bTdW0AHPsZorujsTb00iso
	/ZNJRzFJzGEhBVhuTIwO3fopkAULWctrG7+vq6T78lvU1PP0ylyguO9/IEngJaPgOdfU5BFzbmHQx
	a2uZRJtQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oiVsF-00794t-4B; Wed, 12 Oct 2022 07:09:51 +0000
Received: from mail-pj1-x102d.google.com ([2607:f8b0:4864:20::102d])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oiVs4-00792n-9n; Wed, 12 Oct 2022 07:09:41 +0000
Received: by mail-pj1-x102d.google.com with SMTP id g8-20020a17090a128800b0020c79f987ceso1184060pja.5;
        Wed, 12 Oct 2022 00:09:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=a6aE/yeSlpqCwXOc17W/RYuPLvzETNRc+g+Ynkpn/I0=;
        b=Ry5AeookqtrVVx3rx+ac4anAVW83jmYImeAAMWIg4BjFTpOiZjA7VuC9w7RWYpOSm3
         MduhLk6qeEE0VfGdT/lwlAM36dNx2/TiTkLfi8ZzqdY96NAZvREZOUXAaDkqdSsHTLF6
         60EP+F/e11ZiwxmzffRA432q2MCjy8P/neVOUCd6O3O1GmRFHS9TmOhYA8cVTGrVPbo8
         ON2aUbmURvGvH83d7aNkpiwbuJPnJvWGyVyWiEEU2V4EbyeUKCUtUPzpub/SqT8CgRjm
         zsrTlLN3I2ku8b5uragm4/pNVLD/DEDte+8jOnj+UGTYuwxacEQAODhIRszHSxdeY21T
         iTiA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=a6aE/yeSlpqCwXOc17W/RYuPLvzETNRc+g+Ynkpn/I0=;
        b=zdX6vESo4x/5D3d8NxwzXL8H7vx9vjUmdYgzLcbUyjTQ9hxq5mqpo4eX793S78IWxq
         ben9zPiI44/aVWT2q0fb+UqheOAz4sZud5fP2a+lY++3Eihyt84yNV3pZsxrVE9BYFgG
         a+Yt3mSxfPAer4NP7XHQtOaTfbhoLEv21UimgWeNtwW7yF9yPl3HGc6xAMKMbVw9a9tr
         eW8IkE4xDD+93FmLjzdaBq9N0yYezkG0YEj084q/T3DGWOOCTZcGN4/C9c7j6/ofzrHs
         CQ0mHpCGGDAUgqNS0loFCP2CjiGq5P1NOvxQUgm6Ol9tLWxRwlqTy0qNuI/Zm8RR5Sl5
         CjOQ==
X-Gm-Message-State: ACrzQf2R0f4QWO2uxJTCc3QVfM46JkqhObDo7cEliTECHEnwvGcdjyRW
	OVFg8f24pahI0Wwnb6jSrb0IVY9BDDRsrQ==
X-Google-Smtp-Source: AMsMyM6bPrQwR4o8Tg5xTHuN+LnmoIfJo2PlT4D3Y7exSshUyvDBB8SzJKz/Bx+eYwbBiBicbC4BeQ==
X-Received: by 2002:a17:902:eb86:b0:17f:f884:a62b with SMTP id q6-20020a170902eb8600b0017ff884a62bmr25664464plg.153.1665558578328;
        Wed, 12 Oct 2022 00:09:38 -0700 (PDT)
Received: from RD-3580-24288.rt.l (114-137-44-170.emome-ip.hinet.net. [114.137.44.170])
        by smtp.gmail.com with ESMTPSA id z13-20020a170902cccd00b0017f5ad327casm9813496ple.103.2022.10.12.00.09.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 12 Oct 2022 00:09:38 -0700 (PDT)
From: ChiaEn Wu <peterwu.pub@gmail.com>
To: robh+dt@kernel.org,
	krzysztof.kozlowski+dt@linaro.org,
	lee@kernel.org,
	matthias.bgg@gmail.com
Cc: sre@kernel.org,
	chiaen_wu@richtek.com,
	cy_huang@richtek.com,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Subject: [PATCH v3] dt-bindings: mfd: mt6370: fix the interrupt order of the charger in the example
Date: Wed, 12 Oct 2022 15:08:14 +0800
Message-Id: <fcf4e7e7594070a8698dc0d4b96e031bcaa9b3a3.1665585952.git.chiaen_wu@richtek.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221012_000940_385757_16D1CF08 
X-CRM114-Status: GOOD (  11.67  )
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

From: ChiaEn Wu <chiaen_wu@richtek.com>

Fix the interrupt order of the charger in the binding example.

Fixes: 76f52f815f1a ("dt-bindings: mfd: Add MediaTek MT6370")
Signed-off-by: ChiaEn Wu <chiaen_wu@richtek.com>
Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
---
v3
- Add a 'Reviewed-by' tag.

v2
- Revise the commit syntax.

v1
- Due to this patch modifiacation
  (https://lore.kernel.org/all/20221001202918.me7z2qzm7cmrkzsg@mercury.elektranox.org/),
  there will get some warnings in linux-next when compiling the dts.
---
 Documentation/devicetree/bindings/mfd/mediatek,mt6370.yaml | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/Documentation/devicetree/bindings/mfd/mediatek,mt6370.yaml b/Documentation/devicetree/bindings/mfd/mediatek,mt6370.yaml
index 250484d..5644882 100644
--- a/Documentation/devicetree/bindings/mfd/mediatek,mt6370.yaml
+++ b/Documentation/devicetree/bindings/mfd/mediatek,mt6370.yaml
@@ -139,8 +139,8 @@ examples:
 
         charger {
           compatible = "mediatek,mt6370-charger";
-          interrupts = <48>, <68>, <6>;
-          interrupt-names = "attach_i", "uvp_d_evt", "mivr";
+          interrupts = <68>, <48>, <6>;
+          interrupt-names = "uvp_d_evt", "attach_i", "mivr";
           io-channels = <&mt6370_adc MT6370_CHAN_IBUS>;
 
           mt6370_otg_vbus: usb-otg-vbus-regulator {
-- 
2.7.4


