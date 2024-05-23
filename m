Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 49AAFC25B75
	for <linux-mediatek@archiver.kernel.org>; Thu, 23 May 2024 14:01:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=NDc5dZ2G0NhI2V2Vx4EMLzhVv0NLoW/2hnjkjc8WSGo=; b=3BC1h+h3rue7YnMC5xfpWFfQqf
	LOMbHgUgwQG463PlY74beiVTVNGOtiFjHvdCps6juYhAtylD6djvdCKXPSbOXUOvlkVQNs/32hClv
	hk4LCLu7roLP5e6SZWMTN620rTFsL1XdayHpUi83ni2iD+GdLE0ZlThFksQV4d2PD0/G4wbfJBaMN
	EYj4tegw8VTIWHfPssqxIMtlriRJwBWHxF26+qX0jq+INYRQb+ej2chFrjA1MgoBFwkfCeQ0fvnWS
	BOqxJ3daL/rqvJjp3VeaWaOXatKv3J3UmwkmnwLkqis+JnoVRpQKwa2hO9nkFaXcpQNQp3wAoN3Xa
	IxBRLB0w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sA90s-00000006R8g-3cSh;
	Thu, 23 May 2024 14:01:47 +0000
Received: from mail-wr1-x42a.google.com ([2a00:1450:4864:20::42a])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sA7su-00000006Es3-04bU
	for linux-mediatek@lists.infradead.org;
	Thu, 23 May 2024 12:49:31 +0000
Received: by mail-wr1-x42a.google.com with SMTP id ffacd0b85a97d-351ae94323aso1748199f8f.0
        for <linux-mediatek@lists.infradead.org>; Thu, 23 May 2024 05:49:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1716468566; x=1717073366; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=NDc5dZ2G0NhI2V2Vx4EMLzhVv0NLoW/2hnjkjc8WSGo=;
        b=2UFFiS5bKIQzz+JQE+M0OA/+4qO3N5EVdhAwiQTNftiyI9p7hnlqvfrcToEcPHNeWr
         +elZbYQEuKBfqTV6rJSmZt5Iwxbai/TXJyyxXOClWymrcIeo7mF7Wzgv4w+A43PoxFYK
         QWSjZ2yBXfvDlxDRFBunSUYZ4931AW0DzU80BwXo4GtH0ANU7DgGAGkP85zft9XFg9Q0
         RjOt1kkPFhAVu/pNdA1I/6gNwSRoYTXU0WqKT1dIPcnKITqFDVF9zVPaM6wq5PryBJ+U
         FqIvxlFXDJGx5i6xZVGlIAnwUULAhQxH5r2PIJr6xLY9WcfTJELvdEK/dWUArKoZ6IWG
         p8Dw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1716468566; x=1717073366;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=NDc5dZ2G0NhI2V2Vx4EMLzhVv0NLoW/2hnjkjc8WSGo=;
        b=GLuaKRWkwcbyhwsu4aACeZmMa6S+1lCeISOCNmom12ZvEzmq/YzoWituSsPx94Zm0w
         DLj3iFvJJbLZ2bWZllAofv+bLXP+G4yxQRUgRwaGQgTG/2NWitABQIXECSJeHcdT6k43
         wSsqXXzNoTP79eWh1eRH88DRbOrN0aLQ5xQVkVjs/QV0dMUh69Xc/XLrWyTCq5cGT2Uv
         O3DAO4oOri8PKOkU3Enwa5eNNtOcKPiuEOY6dgTrlh9VrR1Y91JZcnMRWqpGKXKcV4iJ
         xwjsZfuLUo4VJ5dwEtC5Ltvi29IBCkSP1cK7L/u3kKPYe/9TJ8F/E/jpoBiGAe8mj3lJ
         Qvlw==
X-Forwarded-Encrypted: i=1; AJvYcCWbMAurGszve6MioyE5UQmwYVM4eLtCGXJARlcZYog3/WQQ8z8TR8CCOQ/Ip/1qJChsSUf9IX2jbX7G2qmZhQ83hBbRhj+A9WhBRRJPOvYrQTWj
X-Gm-Message-State: AOJu0Yw3WJe2hAlwGPo/EAZFnpF6V6ncHicIVOWl3OFcqLnysGFGpSvk
	W1DGO6dCPOoSJoPDaASItVHy+GN5oK6aqcy1TCIwn5HhZK9eXjIiwPg2d8lUZss=
X-Google-Smtp-Source: AGHT+IH8/w/D/ym66Jp2uFgYUse59/CTDw+EvixC5vITkP0BBwv3oWzuRnk1t8GSb3ZKNNdCd/k3Bg==
X-Received: by 2002:adf:efca:0:b0:354:f500:51c4 with SMTP id ffacd0b85a97d-354f5005628mr2531090f8f.23.1716468566458;
        Thu, 23 May 2024 05:49:26 -0700 (PDT)
Received: from [127.0.1.1] ([93.5.22.158])
        by smtp.googlemail.com with ESMTPSA id ffacd0b85a97d-354faf3fa68sm1259611f8f.116.2024.05.23.05.49.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 23 May 2024 05:49:26 -0700 (PDT)
From: Alexandre Mergnat <amergnat@baylibre.com>
Date: Thu, 23 May 2024 14:49:14 +0200
Subject: [PATCH v4 01/15] dt-bindings: display: mediatek: aal: add
 compatible for MT8365 SoC
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20231023-display-support-v4-1-ed82eb168fb1@baylibre.com>
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
 Alexandre Mergnat <amergnat@baylibre.com>
X-Mailer: b4 0.12.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1032; i=amergnat@baylibre.com;
 h=from:subject:message-id; bh=rYGWQnXPl7e+8ZR2q/kPCuviQpIOkOcbGurCO7CSNDc=;
 b=owEBbQKS/ZANAwAKAStGSZ1+MdRFAcsmYgBmTztTHJzX/pP0aymwYIu7QjbfH/1r3N3y2tzTEGvp
 Qh+njumJAjMEAAEKAB0WIQQjG17X8+qqcA5g/osrRkmdfjHURQUCZk87UwAKCRArRkmdfjHURW/LD/
 0ZN8rHNVNvvNKuViGWaqPBEkwuwXd1VhlMXVPSXv1j7GbVtwNjsJbNXSXZenNBqXVnAUqKwSbFl1km
 7jYjqzscujGwOt05W3nhbgW2S8onp1G8X+JZkbkyjju/doC/uymiO1LuVXSeY22VGZFkcZwAVXEklV
 CIsGYSmmcg187TLVBBIFf/XagsIYbphmgzMdlNTVf7f/BP7qHMWQHdWfxCwm3IYTx2PqFa/jjHZD22
 ZQDg2MW7Xcx/pmsOxNr9esxW37O8eg6Ckh86y32Sn5KfsNfQeKMWNud9NEsDhdHirwWLFUBCm6p5XE
 aI+DSCwoCFKtBnJy9DeiRLun2nFtszXfTgfP518hMF7h36vCQCMPbZDDZp2HCfJ/B0BLStYwzgn1X+
 6hyzyDJgTHatE6cXE3V3Ut17QmZryJrFkgHs5/WkinIyT8SURQXURvewEv8v95T3LZrbOo9tnwb+Zq
 QYXKlf1k0GgpNGt6DWLMGbQrvsXb6qQN/IVVmUc7Q8W950Q1mPs1iktinGiS8AccGGOUaNSviWP458
 xJph6E9/jrH7ObFUK4BA+Pl429CwQnFjd0g5tVL4MrN+/tvmGOxEBb9M03ekQKA9XcfuCm0Oh0kv5z
 Fr1Qrt/7xTf8hqiexLhXY+5v3Y/ZKqgQgvHPsW9VsDt2wf8uiXTfG8+PqYuQ==
X-Developer-Key: i=amergnat@baylibre.com; a=openpgp;
 fpr=231B5ED7F3EAAA700E60FE8B2B46499D7E31D445
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240523_054928_214624_779E902B 
X-CRM114-Status: UNSURE (   9.26  )
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

Document the display Adaptive Ambient Light on MT8365, which is compatible
with that of the MT8183.

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Acked-by: Rob Herring (Arm) <robh@kernel.org>
Signed-off-by: Alexandre Mergnat <amergnat@baylibre.com>
---
 Documentation/devicetree/bindings/display/mediatek/mediatek,aal.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/display/mediatek/mediatek,aal.yaml b/Documentation/devicetree/bindings/display/mediatek/mediatek,aal.yaml
index 623cf7e37fe3..47ddba5c41af 100644
--- a/Documentation/devicetree/bindings/display/mediatek/mediatek,aal.yaml
+++ b/Documentation/devicetree/bindings/display/mediatek/mediatek,aal.yaml
@@ -36,6 +36,7 @@ properties:
               - mediatek,mt8188-disp-aal
               - mediatek,mt8192-disp-aal
               - mediatek,mt8195-disp-aal
+              - mediatek,mt8365-disp-aal
           - const: mediatek,mt8183-disp-aal
 
   reg:

-- 
2.25.1


