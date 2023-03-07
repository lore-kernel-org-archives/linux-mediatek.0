Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3621FC678D4
	for <linux-mediatek@archiver.kernel.org>; Tue,  7 Mar 2023 10:07:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:Message-Id:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=a99hADv24Oq3ePO/xWvEGujHuLCx8t+cyBnnFpp72io=; b=CJwg1uCvT3K27EkFoyElO9Olz3
	1U10BGit2BKFxlZ/STaCe5tVwmbVEJWuw3kg8zXQhtl83LkP/3YPRZECpnqQNE+A8Lc/Fzv6491rn
	xSGnd2OOo7ui12gGyV1KaATN7BXqtNAivP9xuKsbkVAecmzb/5ySuN4tese/NE+c6BWFIpvWLLGB9
	lCoPEFMD6k706gWN1mz9ohzKXgK7PX1UaeqpI74Ozf9vD5biepu7pXsfcnOuURNxdo2mkoonzOMEl
	glScntLG5ZPjHOlIhfLDEGT4QzvS+DHbXRfgYjRRigzzMmF8igMxBkGUSk+3DGaYhpGANW0dllVmm
	yenZ7vDA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pZUEN-00H9hd-9S; Tue, 07 Mar 2023 10:07:39 +0000
Received: from mail-wm1-x32f.google.com ([2a00:1450:4864:20::32f])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pZUEB-00H9bB-Ft
	for linux-mediatek@lists.infradead.org; Tue, 07 Mar 2023 10:07:30 +0000
Received: by mail-wm1-x32f.google.com with SMTP id j19-20020a05600c1c1300b003e9b564fae9so10032496wms.2
        for <linux-mediatek@lists.infradead.org>; Tue, 07 Mar 2023 02:07:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20210112.gappssmtp.com; s=20210112; t=1678183643;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:from:to:cc:subject:date:message-id:reply-to;
        bh=a99hADv24Oq3ePO/xWvEGujHuLCx8t+cyBnnFpp72io=;
        b=YSCUIcYocqMFAD+dkwuethgWjxG3R4uzFSWinK5RLr140QsCU9/Oe0rM5ZuaIhjjlZ
         vLkeaHOAcmuKVZ4jiUMD6z4xU/D3k31VgNAqaDG+ftVlNyRfytFVYE88oMwdz55UYkBc
         dPHaWmbI2+Hci/kGAvHYh+JEYcRcAsKBFMw9R3Q6xBp344epu5ycicCpYVNC11FzxRkg
         p+jb84OS2IF1+c1CY4XRBPNlCfoRoKIRoG9g2Km1pCYxgJDzkCVrjTIY1tKh404zn5mH
         mK7095HXFummUmioTMTIU0ZAMdx8D10VtV94aJ4rOQ1hih7MrXGvayUUYd6vLKQXjpgV
         mqKw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678183643;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=a99hADv24Oq3ePO/xWvEGujHuLCx8t+cyBnnFpp72io=;
        b=AMPTWEl2Ywbf5gYum0r8VfATz7fuo6z148zwK9RDOzd9D38eJEa3jdo2VTgLJ0F2qu
         8ZgwjeyHhjcMxcE1nSt+ti/h6WNdbr0KhWQnUYG3y42IXP1ccV1hcfM81aV306K5Ppuq
         pSBHJqIAt+gmV2M6uIYQDgKWrt6Ze6viH78BqcO4aQJNKrcjnMiV9dxCm5rDxvI7qmtQ
         2FyFHfPM9a7HNERx2+p39NEO3WUhRi81NxYI1GR6C90azJ7+PKWZhmCrMh5lGebiQSjV
         ssOcvoHiC7fdAGIxN1OsQUbbP8hdVXHYW4cou61HC7jZhxiEVbRRxHTytjDdK5Dmwm8W
         maVg==
X-Gm-Message-State: AO0yUKXIcdz5yhNiPGUwz0q+4XANCRJUaxVhuZnsRE/Urs+hwOto6x7k
	g0vMNy3BLPI6XG/FMb/kAYa/wQ==
X-Google-Smtp-Source: AK7set9LisboRMIbelSbZwB9/xid+f7oLBqZmrU5e7MBZwglzYbYVjzgLLCrOA+yg2thby9TmUO7ZQ==
X-Received: by 2002:a05:600c:4448:b0:3dc:18de:b20d with SMTP id v8-20020a05600c444800b003dc18deb20dmr12895539wmn.33.1678183643561;
        Tue, 07 Mar 2023 02:07:23 -0800 (PST)
Received: from [127.0.1.1] (laubervilliers-658-1-213-31.w90-63.abo.wanadoo.fr. [90.63.244.31])
        by smtp.googlemail.com with ESMTPSA id i16-20020a05600c355000b003dc4480df80sm18026288wmq.34.2023.03.07.02.07.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 07 Mar 2023 02:07:23 -0800 (PST)
From: Alexandre Mergnat <amergnat@baylibre.com>
Date: Tue, 07 Mar 2023 11:07:14 +0100
Subject: [PATCH v4] dt-bindings: display: mediatek: clean unnecessary item
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20230306-ccorr-binding-fix-v4-0-117daea88efb@baylibre.com>
To: Chun-Kuang Hu <chunkuang.hu@kernel.org>, Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Daniel Vetter <daniel@ffwll.ch>, Matthias Brugger <matthias.bgg@gmail.com>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, Allen-KH Cheng <allen-kh.cheng@mediatek.com>,
 Philipp Zabel <p.zabel@pengutronix.de>, Rob Herring <robh+dt@kernel.org>, David Airlie <airlied@gmail.com>
Cc: Alexandre Mergnat <amergnat@baylibre.com>, Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
 Rob Herring <robh@kernel.org>, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org, devicetree@vger.kernel.org, dri-devel@lists.freedesktop.org
X-Mailer: b4 0.10.1
X-Developer-Signature: v=1; a=openpgp-sha256; l=2628; i=amergnat@baylibre.com;
 h=from:subject:message-id; bh=G42YvKxkrZJb/teIAV/+HSCiQBvvc6k4e2mWKdkwM3Y=;
 b=owEBbQKS/ZANAwAKAStGSZ1+MdRFAcsmYgBkBwzaI++vi8o18d0x4WW7CSZlcGaJz7zBjybAHxbD
 0V0R9veJAjMEAAEKAB0WIQQjG17X8+qqcA5g/osrRkmdfjHURQUCZAcM2gAKCRArRkmdfjHUReLqD/
 4pmKEEHsKgsyphpRf2jTAS+qD61DtVytoGOcCZ4giSLMXJY928D5l57zSrlei1a8RnOoIlg1DGp5r4
 iPALGAhEz2FBWrvEb83xeukIb+2xHJiYXEmrNjh92YYVp4RuvlMBecTQHkElypf9zdRIOaerymRzgA
 98zV6VxYjO3A5Gqxm/G8YQVSvCFHBtWktRpco3h505EFQ40A6UilfZ14lqK+GhmZj07ueoaU8Mmo8D
 vn0yK59187hXXJqO2RdZ2P7zUtuJlq1we1SxMueoI+7EAOoQneokgl3UtJ722DUsYXpKzkcDeB5/lb
 /d6i1Cud3Xm2+RrpV2lKkbD3Yn8y/ycGJ5cOQGHFoApUCFhaxBiuOcfSscyoWvx+o8MN+9sCndHWin
 IqS5fZjGZ8Fez0VV4HicvFI/IXwsieGUAnV+LEJ06FVHTjN005Y8sDnbqqJlYCZcPa2VKv7ijuWaCy
 CzXs2P0a5mG0AOvR0mVFvn4DkW27zkRa6B0lcbe/rOPF0ELOTwHKyhUVWeqftAcmubptyOn+LJGxGh
 qNLzvBb3pZoNxVNp/K4Izf97hQ4+VFHgrOnyojV9D70keC/+sIdcXuB+u4XYEgBz9PQTx01SjvA8ny
 aAYYnop6rMjZIaoqrfxd2Zo2YfFPwqQAOrP3T7kJxtnPJloGNVPirysHrzHQ==
X-Developer-Key: i=amergnat@baylibre.com; a=openpgp;
 fpr=231B5ED7F3EAAA700E60FE8B2B46499D7E31D445
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230307_020727_536836_FE8B8486 
X-CRM114-Status: GOOD (  11.45  )
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

The item which have the mediatek,mt8192-disp-ccorr as const compatible
already exist above. Merge all compatibles which have the same fallback
under the same item.

Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Signed-off-by: Alexandre Mergnat <amergnat@baylibre.com>
---
Fix MTK color correction binding

The fallback compatible has been duplicated in the 137272ef1b0f commit.

To: Chun-Kuang Hu <chunkuang.hu@kernel.org>
To: Philipp Zabel <p.zabel@pengutronix.de>
To: David Airlie <airlied@gmail.com>
To: Daniel Vetter <daniel@ffwll.ch>
To: Rob Herring <robh+dt@kernel.org>
To: Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
To: Matthias Brugger <matthias.bgg@gmail.com>
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
To: Allen-KH Cheng <allen-kh.cheng@mediatek.com>
Cc: Rob Herring <robh@kernel.org>
Cc: dri-devel@lists.freedesktop.org
Cc: linux-mediatek@lists.infradead.org
Cc: devicetree@vger.kernel.org
Cc: linux-kernel@vger.kernel.org
Cc: linux-arm-kernel@lists.infradead.org
---
Changes in v4:
- Reword commit title and message.
- Link to v3: https://lore.kernel.org/r/20230306-ccorr-binding-fix-v3-0-7877613a35cb@baylibre.com

Changes in v3:
- Re-order compatible.
- Link to v2: https://lore.kernel.org/r/20230306-ccorr-binding-fix-v2-0-4822939a837d@baylibre.com

Changes in v2:
- Fix commit title.
- Link to v1: https://lore.kernel.org/r/20230306-ccorr-binding-fix-v1-0-177d81d60c69@baylibre.com
---
 .../devicetree/bindings/display/mediatek/mediatek,ccorr.yaml         | 5 +----
 1 file changed, 1 insertion(+), 4 deletions(-)

diff --git a/Documentation/devicetree/bindings/display/mediatek/mediatek,ccorr.yaml b/Documentation/devicetree/bindings/display/mediatek/mediatek,ccorr.yaml
index b04820c95b22..bda86e6857f5 100644
--- a/Documentation/devicetree/bindings/display/mediatek/mediatek,ccorr.yaml
+++ b/Documentation/devicetree/bindings/display/mediatek/mediatek,ccorr.yaml
@@ -27,13 +27,10 @@ properties:
           - const: mediatek,mt8192-disp-ccorr
       - items:
           - enum:
+              - mediatek,mt8186-disp-ccorr
               - mediatek,mt8188-disp-ccorr
               - mediatek,mt8195-disp-ccorr
           - const: mediatek,mt8192-disp-ccorr
-      - items:
-          - enum:
-              - mediatek,mt8186-disp-ccorr
-          - const: mediatek,mt8192-disp-ccorr
 
   reg:
     maxItems: 1

---
base-commit: add072536971d7ce891fde3cdbf68c55e7cfa95a
change-id: 20230306-ccorr-binding-fix-718c6d725088

Best regards,
-- 
Alexandre Mergnat <amergnat@baylibre.com>

