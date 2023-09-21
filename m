Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 36F7AE71090
	for <linux-mediatek@archiver.kernel.org>; Thu, 21 Sep 2023 15:46:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-Id:Date:Subject:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=X8I/sU/MGzlvBp47z9yaYHIpn2F7NMoI5l+3Ycr8W4M=; b=twbRWjjSJOO0yq
	hsbmHs/MJe3lftKuvTTUNBHWR44gmhq/bV0ZeNy4fcS6jX3YK2A/9LaamBRHuzKz7cayO85p5AzcJ
	GvjzTJfauF2U3uvhlL9ZiphiTGA2Pm02fPLBjPtnt76tLKyICKblvhEf78kLisU3r3/BxW7QtlORO
	GaLnbHQGVPvx7fXQZF0CV0ewjC7JlA0yvJcoGYq/IjEYR1/aU9o/TDhXRfKagftsrnjAk9hoOdhTu
	J2nAchSNlJZ45kx9MBliOk5dOlM+BJ1JOH99aWnatV+WaOrfRyKAG8XZ0WMdIr0q43fCTkXRFFFQu
	y8dx1vbsLCmUgWl2Mfcg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qjLsV-006RLJ-2X;
	Thu, 21 Sep 2023 15:46:08 +0000
Received: from mail-ej1-x634.google.com ([2a00:1450:4864:20::634])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qjKjb-006Hqd-38
	for linux-mediatek@lists.infradead.org;
	Thu, 21 Sep 2023 14:32:54 +0000
Received: by mail-ej1-x634.google.com with SMTP id a640c23a62f3a-98377c5d53eso124403966b.0
        for <linux-mediatek@lists.infradead.org>; Thu, 21 Sep 2023 07:32:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1695306769; x=1695911569; darn=lists.infradead.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=X8I/sU/MGzlvBp47z9yaYHIpn2F7NMoI5l+3Ycr8W4M=;
        b=wwFa52/jtRymyqCrNOV6BadC9cVtBZTFKo/HRJTHi/5EIY+Zfzv/QbqYIR8O9ZtYdP
         amFbTWo5zFAvJ4alLHpFjd7T73MqBUNArnSETsq4l1dIg5O1YmZZ8H4LRW7ANNYTfAbI
         cOgesdUxX7/uONlcurNo4Sl+3SIa7laOJVO36Gc+3Cq3g4rge2MN5DFLH9mKukZhYaxu
         IGqmlPmhU9yhSLPfSi0Sy+UfCmAvEVYAungbYZWnXGK+N2WjvRc1524VwozDlf3SNbBJ
         h8AyK98PpHV0rR4MDOaBNzoifB0t1qaIs2pQcnbym+Wy/j4Sn/9D5QLG6egMcjrm+SxV
         O5Ig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1695306769; x=1695911569;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=X8I/sU/MGzlvBp47z9yaYHIpn2F7NMoI5l+3Ycr8W4M=;
        b=n/JrbGfGnS4trcoI16lDsg1X36ayDC/RslXCosmCRlKLrUBZOsgqA3V+I7YfJQ3KFs
         hfsV79DJx80wdzl12P8RpfpfOWxiIoeG4hq6p9KZhANyRB15uGnLTVeJzbRNMUnC7UG1
         Lx57TfobFXYyBWEYgVRttotU2Zn2xvJFsf1m/a8fmslMUO9GQfuH3Q3EKydGAEf6nwUA
         px7nPI5RbmfPpb+waBq+n0+sj5IoDQNdTFYOpI2o4BZHNPq0nua0uKiGoQOxrxiIybMJ
         UbjMiAbySIGsBWNE84+17Ee4KvBHvPzh2uPhX51IK7AjE3HbOUNRIFRJtzCusXQJ3fBF
         K3Ew==
X-Gm-Message-State: AOJu0YwQ02zAz24oGGnozd/S0xMUhzSW4EG6pTfJRvU/182rAPnlYP54
	ylggV5N0NU5L/CjdFrkkfEeufA==
X-Google-Smtp-Source: AGHT+IGBqi1U8/tm1kNfARUekhYiWvOvpVhOyz/gfrwkUcN1gBpPMHANIWhYIHaICP4eucLNwKwOQA==
X-Received: by 2002:a17:907:1ddb:b0:9ae:443b:988e with SMTP id og27-20020a1709071ddb00b009ae443b988emr4993019ejc.15.1695306769137;
        Thu, 21 Sep 2023 07:32:49 -0700 (PDT)
Received: from [127.0.1.1] ([93.5.22.158])
        by smtp.googlemail.com with ESMTPSA id lt12-20020a170906fa8c00b009a219ecbaf1sm1153327ejb.85.2023.09.21.07.32.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 21 Sep 2023 07:32:48 -0700 (PDT)
From: Alexandre Mergnat <amergnat@baylibre.com>
Subject: [PATCH v5 0/7] Add IOMMU support to MT8365 SoC
Date: Thu, 21 Sep 2023 16:32:39 +0200
Message-Id: <20230207-iommu-support-v5-0-fa6f03680832@baylibre.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAAdUDGUC/33NTQrCMBAF4KtI1kYm06Q/rryHuEiTqQ20TUlsQ
 aR3d3Ap2tXwHrxvXiJTCpTF+fASidaQQ5w4mONBuN5Od5LBcxYIWABCJUMcx0XmZZ5jekhDJUK
 DJWkkwZvWZpJtspPreTUtw8BlH/Ijpufnx6r4XP9xq5IgdQeuVp036NSltc8htIlOLo7ixtiKu
 wAyUII3nQUgTeYHUOwCBQNNRaqxXlNt/A9A7wKagVpXTV2aymkFX8C2bW+R/HtodQEAAA==
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=2364; i=amergnat@baylibre.com;
 h=from:subject:message-id; bh=+lERs6sTfuno7YX0TSz2xcB2J6IO4eaDpmY1nCNJJWA=;
 b=owEBbQKS/ZANAwAKAStGSZ1+MdRFAcsmYgBlDFQP7HxueRl+iHWVkWR/QMe3SUlmP72T+aCVUvIm
 Gl/k1UWJAjMEAAEKAB0WIQQjG17X8+qqcA5g/osrRkmdfjHURQUCZQxUDwAKCRArRkmdfjHURc8kD/
 9t5WdY3d4LNtyInO8sKmj+NiC13C0C3D85Ol1QtzIjqt1/MoQaJolscUp7OrRiAUI4PhPJUSOAklmO
 1dA0Upj/p72H8fu6zmEKDQ4MTv6vFCSBTNaVM4iPNcjIopItOjC3gS1aIwW+2CYdaC+yplPHAeJr4l
 NbZ0zjypqlFw76PfAlTVGq/iXNiI3XKMxsbZiKdYmoOGbvIt6XFodwpqSWXodOmHIY2dsbLxH3U+sh
 nNaNh1dnS/EiuZjpTf2qQrVkvgcXdv4A+y95fghxJkx3lf3MTKGkGCjrAgrcz0F31askkJ62SCmVrY
 /tM0iMYVneqV0oPHQnEprei2u1qvQp37Oz9/oPrNImI1yUaPk03GV2dFXl6cpgcFRMpH7VCqpTrb6V
 XjjvlJug5KthFYf/k0KIt8q/DIsH++6l5wABg48Q/j8umJ09qsa9GKCZnGnl2wDNxW4yRKcU00XW75
 L8pXTw/1GuJrVJeHbXl4FfcRoN/unhvbP5PQpAdThDGca9A+dmM2WmMleYLQIjJc5auBiBUfTxOrMc
 nWcC5vL/2vg6hDYDHt1qo13tXoSwmOqiOnLE40SNlwyUgyJrB1GOlVckJsJT1QEOV5nxMysMC03UTB
 S4vNCQuQKM7v0nlllOQc4mfPVgcC2n0e+FSZMs3Nju7gVbOmlVYjqbNvBPuA==
X-Developer-Key: i=amergnat@baylibre.com; a=openpgp;
 fpr=231B5ED7F3EAAA700E60FE8B2B46499D7E31D445
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230921_073252_227550_08F77081 
X-CRM114-Status: GOOD (  11.90  )
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

[1]: https://lore.kernel.org/linux-arm-kernel/20230918093751.1188668-1-msp@baylibre.com/

Signed-off-by: Alexandre Mergnat <amergnat@baylibre.com>
---
Changes in v5:
- Rebase to v6.6-rc2.
- Link to v4: https://lore.kernel.org/r/20230207-iommu-support-v4-0-84798657c410@baylibre.com

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
base-commit: 2b4f840a1de65d77644236c72b3f252aa2725a42
change-id: 20230207-iommu-support-5e620926e42e

Best regards,
-- 
Alexandre Mergnat <amergnat@baylibre.com>


