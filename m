Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 55D64C77B6E
	for <linux-mediatek@archiver.kernel.org>; Fri,  7 Apr 2023 09:34:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-Id:Date:Subject:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=2Ln9BxAKEXuVoxH2HckKeGNcJ9/KjvIORXclz6cNl4Y=; b=lqZy8BPuvmAfKo
	GIKKhxbpnOtBE+XVfx6Jk8EN7SMImu8bavlYfqALgyHopqdQD4LAPdp4Odsj4puXD8GZ+clrmbdmC
	8t6JCN5yldS//6fcfNQtjUCd0Mg/TnxlZ//rYxX5qTYaCafIqosfIT5MmJQRDKtG81ayHJTqaNGel
	TZ4eaUVTBYCWJRdtXsMGeN2H+EKFRIRvCUNHaAnhX8wp2N1y3o/+R5ZQR9y5sZ+do+OprO0gILNM9
	HhAl6Pdn6ij/n7ec68q5RhwEHs0pOWMf2p0ZnpxMUpX6NMr/acGVjB3JzYjd+5Cq3z+CsvuNkYUQV
	cmIOlRrMfru37hTZsZ1g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pkiUQ-009g57-29;
	Fri, 07 Apr 2023 09:34:38 +0000
Received: from mail-wr1-x434.google.com ([2a00:1450:4864:20::434])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pkiUJ-009fzx-0k
	for linux-mediatek@lists.infradead.org;
	Fri, 07 Apr 2023 09:34:33 +0000
Received: by mail-wr1-x434.google.com with SMTP id g5so1907043wrb.5
        for <linux-mediatek@lists.infradead.org>; Fri, 07 Apr 2023 02:34:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20210112.gappssmtp.com; s=20210112; t=1680860066; x=1683452066;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=2Ln9BxAKEXuVoxH2HckKeGNcJ9/KjvIORXclz6cNl4Y=;
        b=LckGPPw6zvn3CmEhSJQqKRDWWrLv5eaxjLYpLQeiryoblq8s8m1FqdFmby2xzyqoTl
         fnMBK+x6RTrmsC7c4sn/hbEtja3j671nsxuOwEF+fvSB9R5GiUL6zT4/M04jIrXHxI+R
         OQuziRZ1jTehx+MnPlp9Z+H9ofaBOtZcZXLaclcXCP6s6BrrQB1WscW9eVKOkvow9AHv
         a06+vpWP5nm5M5NqvCzVkNT1DcSHsizx4lY4Ou8SMdpY+QT6zwnQtnxaQMoMq1ugV0/n
         JZz/dykQ1sv8OiBjoNBHS3V1ZL3OlWgRkVAdFZLURrbiCCq61Cnt7Z0hg2S4W2UiKpjt
         +OQA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1680860066; x=1683452066;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=2Ln9BxAKEXuVoxH2HckKeGNcJ9/KjvIORXclz6cNl4Y=;
        b=oEEQvKrG75d3q47vz4bcDq0TKrGcWBt6h4O1ckdpWLvsKvdcVEOiluQkRRNaZx8g1S
         Vg/dAWsSfa7ppVO+m8oKg/o83NLbc2beM/gA77s2q+iGInYmK35Qvk/nxrnWGsF1Oiem
         K3w9VgmCcqltxxs0vShIYU1GhQymkGdp/NEncs/X7TqZA+ldAs8ByCFsgEb2Bk5Tzmj9
         lkRFUayPyGtsvZm7B9uuM10hYNM45ek1qlQrO2BV61EZ6Y37h1kEMDXx3P6GvLtSGlGA
         MLQnS8V+869xYSBpr5fmWPB0Sxnr9+k3uqmHayAbFEOstd9F7zLcl91zIQwB4bVgi8XK
         hhQA==
X-Gm-Message-State: AAQBX9f6sqZjiXjPVufIBzBlh7C7Fcji7f0uVa+w40KIvBNEA+LlX4nf
	lfF2WrzHg8fW2mnEniaT8uNzxA==
X-Google-Smtp-Source: AKy350Y3h2qLQtdWkoPbwePzNWCOBj9MkKF6rfng+ssZtYLPWDL4Db22EB1jYP2LIyu0SrYXaXhzZA==
X-Received: by 2002:a5d:6050:0:b0:2ce:9f35:59b9 with SMTP id j16-20020a5d6050000000b002ce9f3559b9mr861315wrt.17.1680860066707;
        Fri, 07 Apr 2023 02:34:26 -0700 (PDT)
Received: from [127.0.1.1] (158.22.5.93.rev.sfr.net. [93.5.22.158])
        by smtp.googlemail.com with ESMTPSA id s13-20020a5d510d000000b002d64fcb362dsm4020432wrt.111.2023.04.07.02.34.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 07 Apr 2023 02:34:26 -0700 (PDT)
From: Alexandre Mergnat <amergnat@baylibre.com>
Subject: [PATCH v3 0/7] Add IOMMU support to MT8365 SoC
Date: Fri, 07 Apr 2023 11:34:11 +0200
Message-Id: <20230207-iommu-support-v3-0-97e19ad4e85d@baylibre.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAJTjL2QC/33NTQqDMBAF4KuUrJsyGY39WfUepYskjjWgiSQaE
 PHuHbostKvhPXjfbCJT8pTF7bCJRMVnHwOH6ngQrjfhRdK3nAUCVoBwlj6O4yLzMk0xzVJTg3D
 FhmokwRtrMkmbTHA9r8IyDFz2Ps8xrZ8fRfF5/OKKkiDrDtxFda1Gp+7WrIO3iU4ujuLJWMG/A
 DLQQKs7A0A16S9g3/c3ol/h3/MAAAA=
To: Yong Wu <yong.wu@mediatek.com>, 
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>, 
 Rob Herring <robh+dt@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
Cc: linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 Alexandre Mergnat <amergnat@baylibre.com>
X-Mailer: b4 0.12.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=2347; i=amergnat@baylibre.com;
 h=from:subject:message-id; bh=4UXsmr49uDjmMpGfehKlAgZZ1i56DNjep473+yVwvr8=;
 b=owEBbQKS/ZANAwAKAStGSZ1+MdRFAcsmYgBkL+Oh0rMZN18zMym9uiPGi4aTLMTfbNFxh/WXPNAI
 K/YRvkCJAjMEAAEKAB0WIQQjG17X8+qqcA5g/osrRkmdfjHURQUCZC/joQAKCRArRkmdfjHURYPuD/
 9lF7yggmKSNUWetM76yvDbf8JXt4dtpIIAETmZ87Tgf7zEceoiQjLZYAMlwjvrkpCGSo85t46/wFzN
 oYiKIDEqrC0jeXXwicYfkzf+LeKu+eETh2fua910naMxV1KU87oWawSVqzCNxMyjZ4MhRZAkPgN1ZD
 Q3anM65eQXMBAbAY5OvB/LIx3+NKnHpMaeKOeWfMLGiwX4aI8fWM56eP/54jdCMdOz+/3AH358iVrv
 OKu+HOWfYhnhptIK0PAzw5fPbRJ+ECgen+44Qd3Voq3PODQKKoNcMeI9luuzeP6YMkVYc7TLPay67R
 Z1Yw2oZHkY2mDYkdQsADZga0XQAjRTv24NQLkvB/0BEa36xrphnUnYwsntbQJOMTO/b1SYBLc8fY9S
 D3jQTO7opN9hZ9qY5SKojBoS4RpFwcqCz7DLq+Kr66jSQMo0XK5enfF+lBYWEgXwqMGvcyeTGrMJYR
 YGT8otyhOdDlHChGULBFx5gijwxics4RAgvF/bARnp5TIxfiCb8oQnaSRQABTJSr9huircwetoGHmd
 HbzY5FZ51tNeB9s/fudgnoPg/ow+cW0KB/Hcza/0KIqtdPUkZIDC/43De39GBQwnAJLHkDaHEuLPuj
 Shainm8GRtqIOcHPIu3EUFBDPFAXQ2DYtZsUUV0KORnm37Byj5DnuSw8BYlQ==
X-Developer-Key: i=amergnat@baylibre.com; a=openpgp;
 fpr=231B5ED7F3EAAA700E60FE8B2B46499D7E31D445
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230407_023431_307177_C96E75C5 
X-CRM114-Status: GOOD (  11.97  )
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

This series depends to 3 others which:
- improve mt8365 support [1]
- add power support for MT8365 SoC [2]
- add smi driver support and bindings for MT8365 SoC [3]

Regards,
Alex

[1]: https://lore.kernel.org/all/20230203-evk-board-support-v2-0-6ec7cdb10ccf@baylibre.com/
[2]: https://lore.kernel.org/lkml/20230105170735.1637416-1-msp@baylibre.com/
[3]: https://lore.kernel.org/all/20230407-smi-driver-v2-0-8da6683cdb5c@baylibre.com/

Signed-off-by: Alexandre Mergnat <amergnat@baylibre.com>
---
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
base-commit: 1db7fc94e6e116f43f7bf3adb33407f21bc29fd9
change-id: 20230207-iommu-support-5e620926e42e

Best regards,
-- 
Alexandre Mergnat <amergnat@baylibre.com>


