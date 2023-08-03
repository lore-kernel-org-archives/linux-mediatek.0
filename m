Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E3D70C04A94
	for <linux-mediatek@archiver.kernel.org>; Thu,  3 Aug 2023 09:41:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-Id:Date:Subject:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=sseiNID2mFn2S7P2x+yMHTlRQJAUMSTuNVqWrP1bH80=; b=4v/JiaP1Hm981H
	35v4m42qw6OWqkoOjKYvvBjk6pDmtK3p47n/cISYuc27G4d+78HzoDFu5WIyGFjUra1KFNESDD078
	kMxYnzwYMPuEEeW2WppFhpvj996SszJRiV58UujiH8JFuKr4fp0dekrAkDkYiiunrkVYnVRsNvGDJ
	24g4q3JkRxuaXMDI6EWlPM16WhvElnz1IKrnCXr4W/3zopdkOK9qm3XoDzCqw4u8vWGGSwlCDdslD
	y8J/351fSDt8IqFzxQ45lrPln+DMkXUYItKHYn1gikgiKoFpEnZI/X4Q9j6zU1htFPCJ4ZNU8Fcwr
	iZf0HBRYbHSuA9SoyQvw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qRUpX-007ES1-2a;
	Thu, 03 Aug 2023 09:41:15 +0000
Received: from mail-lj1-x22c.google.com ([2a00:1450:4864:20::22c])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qRUpQ-007EKz-1E
	for linux-mediatek@lists.infradead.org;
	Thu, 03 Aug 2023 09:41:11 +0000
Received: by mail-lj1-x22c.google.com with SMTP id 38308e7fff4ca-2b9fa64db41so11143891fa.1
        for <linux-mediatek@lists.infradead.org>; Thu, 03 Aug 2023 02:41:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20221208.gappssmtp.com; s=20221208; t=1691055664; x=1691660464;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=sseiNID2mFn2S7P2x+yMHTlRQJAUMSTuNVqWrP1bH80=;
        b=vu2dzM6DiQJkpP7TSuy5CtCtYhr8cqJsopUQDuINQzY/BtLxodpyAblWUdxocBnNbZ
         eZ5CAc/Spj5Z1CBm22Gqd2rqPTmimDIN8juND2f9ZHm9rCE0pMLXplFxz0Jwma4FzHd8
         lo6Ox5pTA35/tyIQkQOptYC+wWLWAdi704h59bPTj3ZBzx55bBzmAN7VKWAzP0mdLq3q
         6eH2Sdge/oMKd5QS0cUVbUsjVQBH0dZMZtgs/Ybqnujawu9APNIPN+zzEKVsAExSorNz
         j842kfRtyDPmf2U04FriAdOfhjSbULV0dof6jKs/AY+/ryY4mh8J8Dn8rXsGeHX5E5F4
         LTGw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1691055664; x=1691660464;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=sseiNID2mFn2S7P2x+yMHTlRQJAUMSTuNVqWrP1bH80=;
        b=BQsdKiGRsjrVYXbF9HuTfFOStaMNwSORp23q7ryD7POTPrJpJXJ/yddOtlfQ+cMomx
         IpS3fpiy3lTJWEZuicigCLqxPgtU5Gw3a1of1HjTfpdMabosDyTknm+9k2+1FQ34sqqc
         Cr1xlGW6HTILlNjEqGz7UHXbX0nz+TvtAYnOHlCzUsn3wTkwePKi5JWcGzGe5RYxOgYo
         0VJhKTbX+4AwYmZbk5w6UTW6LbiVYZpoKbLzmSXa84YetSmF7O1XccAhmAk33ed0V5NE
         3Sws1V+eeLGMiDDmVzFQ3mxnH1d/c8BhOuWkVOudN9qC8XvACD2CQfHsxrevVhTWzZC/
         WDgw==
X-Gm-Message-State: ABy/qLY49h/L3kkE/SuBEXYXlKMWAEuDPvYDPexictpXJeXbETMFkUjn
	7M/nvlXTc3C+EmnA6oKLpONFHQ==
X-Google-Smtp-Source: APBJJlG694U7MVBWqItt1BfqfwN2V4ZDN+1R8uegeV/NwvF/B5ao6CpEvXJMe6JDeKXdCN1PKbL/EA==
X-Received: by 2002:a2e:904e:0:b0:2b9:f1ad:9503 with SMTP id n14-20020a2e904e000000b002b9f1ad9503mr7522055ljg.35.1691055664232;
        Thu, 03 Aug 2023 02:41:04 -0700 (PDT)
Received: from [127.0.1.1] ([93.5.22.158])
        by smtp.googlemail.com with ESMTPSA id n1-20020a05600c4f8100b003fe15ac0934sm13294994wmq.1.2023.08.03.02.41.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 03 Aug 2023 02:41:03 -0700 (PDT)
From: Alexandre Mergnat <amergnat@baylibre.com>
Subject: [PATCH v4 0/7] Add IOMMU support to MT8365 SoC
Date: Thu, 03 Aug 2023 11:40:52 +0200
Message-Id: <20230207-iommu-support-v4-0-84798657c410@baylibre.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIACR2y2QC/33NQQ6CMBAF0KuQrq2ZDi2CK+9hXJR2kCZASQskx
 nB3Jy6Nupr8n/w3T5EpBcriXDxFoi3kECcO+lAI19vpTjJ4zgIBS0A4yRDHcZV5neeYFmmoQmi
 wIo0keNPaTLJNdnI9r6Z1GLjsQ15ierx/bIrP9Re3KQlSd+Bq1XmDTl1a+xhCm+jo4ihujG34F
 0AGKvCmswCkyXwByr9AyUBzItVYr6k2/gPY9/0FRyquITQBAAA=
To: Yong Wu <yong.wu@mediatek.com>, 
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>, 
 Rob Herring <robh+dt@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 Alexandre Mergnat <amergnat@baylibre.com>
X-Mailer: b4 0.12.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=2227; i=amergnat@baylibre.com;
 h=from:subject:message-id; bh=yZFKpxEAgoFXK21BVC5n/b/uttfBdSKKotZf8NGdugk=;
 b=owEBbQKS/ZANAwAKAStGSZ1+MdRFAcsmYgBky3YuX+JjoVLFCsQWxXLGRHRjB61ZGtFVnHw77kgv
 HsW17yOJAjMEAAEKAB0WIQQjG17X8+qqcA5g/osrRkmdfjHURQUCZMt2LgAKCRArRkmdfjHURdCjEA
 C7y0S7+D71eFlqs75Fj6lKAJx/TOBotk4xhpBaSKuOosKp00Ze31oraeDnmobH5A1W67BMtR4ZuYuJ
 2+9NB0UGXXBu0uuQN7+dxlo9XkP4Tn05X1vGd6jhv4I8no8N9WEg6O48UZ5neScVkjzn4Gtm7rh3CR
 PlIOmL614oC5Dv0K01HNvtpw3qOMOinVKDEYJga6pKlfiM6+Lp2mzyvD/w/wwbO0lGjyYABiPE+yRv
 tSVBxRjFnrFhwel+Oq4sK+8xS7/BPyJT+wTpJRIqzj73Qrq0ALIPC6N3WNTdbMWhqyzOv7ySM4R6Xu
 9E3mDrdKJyEp6D3Gl8B29SXX+vQkhEWEFbxPQwA5aFPmGvmp5QGIUxxDy9zbB44OD04GM67PVpkh00
 5DYzJH0HoOFUUqNviZBA/IDN+mUfpiLYiopuz6MVBqpglBRX/EAcpvzQxLLhI5GePT+9N7GVf5taWo
 mRnInpx+/s/9PfTbZSeQgO7vARSMch6mY40O3z0WtCSZeNMM3Yarlvk0sY1yFtv+V5jAMDG9G48R9o
 Y7j3yMhKUGGJ+4JFPT62w51ogXBYnZUAK6DXEIWmdg9G2fmgXulvYp3Or+P5HwN+Kab1SaoqT3GlSn
 JKyMHH3XgVRV+gMB03fANT06F/QPubVsCpXkOe16Z85cfc8SuHawzrybECBQ==
X-Developer-Key: i=amergnat@baylibre.com; a=openpgp;
 fpr=231B5ED7F3EAAA700E60FE8B2B46499D7E31D445
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230803_024108_449110_26CE2C11 
X-CRM114-Status: GOOD (  12.14  )
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

This commits are based on the Fabien Parent <fparent@baylibre.com> work.

The purpose of this series is to add the following HWs / IPs support for
the MT8365 SoC:
- System Power Manager
- MultiMedia Memory Management Unit "M4U" (IOMMU)
  - Smart Multimedia Interface "SMI"
    - Local arbiter "LARB"

This serie depends to another one which add power support for MT8365
SoC [1].

Regards,
Alex

[1]: https://lore.kernel.org/linux-arm-kernel/20230713150414.891893-1-msp@baylibre.com/

Signed-off-by: Alexandre Mergnat <amergnat@baylibre.com>
---
Changes in v4:
- Rebase to v6.5-rc1.
- Link to v3: https://lore.kernel.org/r/20230207-iommu-support-v3-0-97e19ad4e85d@baylibre.com

Changes in v3:
- SMI driver support and bindings patches have been removed from
  this series and sent it in another one which should be merged before
  this one.
  - "dt-bindings: memory-controllers: mediatek,smi-larb: add mt8365"
  - "dt-bindings: memory-controllers: mediatek,smi-common: add mt8365"
  - "memory: mtk-smi: mt8365: Add SMI Support"
- Link to v2: https://lore.kernel.org/r/20230207-iommu-support-v2-0-60d5fa00e4e5@baylibre.com

Changes in v2:
- Split power domain patch (3) in 4 patches to explain in the commit
  messages the added subsystems.
- Add an independent "mediatek,mt8365-smi-common" compatible to have
  its own LARB bus select.
- Link to v1: https://lore.kernel.org/r/20230207-iommu-support-v1-0-4f0c81fd52c1@baylibre.com

---
Alexandre Mergnat (7):
      arm64: dts: mediatek: add mmsys support for mt8365 SoC
      arm64: dts: mediatek: add camsys support for mt8365 SoC
      arm64: dts: mediatek: add apu support for mt8365 SoC
      arm64: dts: mediatek: add power domain support for mt8365 SoC
      arm64: dts: mediatek: add smi support for mt8365 SoC
      arm64: dts: mediatek: add larb support for mt8365 SoC
      arm64: dts: mediatek: add iommu support for mt8365 SoC

 arch/arm64/boot/dts/mediatek/mt8365.dtsi | 210 +++++++++++++++++++++++++++++++
 1 file changed, 210 insertions(+)
---
base-commit: 29c81bf767230d53c3ca8c1ef19e4fde1b30c8bc
change-id: 20230207-iommu-support-5e620926e42e

Best regards,
-- 
Alexandre Mergnat <amergnat@baylibre.com>


