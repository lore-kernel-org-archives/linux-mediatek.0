Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8DE83C7619A
	for <linux-mediatek@archiver.kernel.org>; Mon, 27 Mar 2023 08:28:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-Id:Date:Subject:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=GAGQSh525G5QsNivU8boPxjITx0FQ4aR6d82jdyyf+Q=; b=wP7M8qwlE28GRo
	MV+nYKTzxm2ATDz0B3UQzblEuoROFrtRqwvdBTacEG62umA6ERoYdcvyJvXWDAcxj0ypoTaFkDX48
	IjyrsBFrjtGbgTh45FhYsR8uKy5nCerX2rH7ouWi8K8CED+VnPL4Ouc3xOWqnIPv0VVbmmQVLo291
	PgCL9KxmEg8FiLtgxIFhPHiMyJPB+mkqO9fKUkSc7rbxzi17+dQh7ALVMvIef/V1AW1OZBUvuaRyN
	17yD6xmDXZ3Gt8kUXIlosiQA4U4ewaOg1WRhbtVQGlRmI047lpuq/Rhodx8TXVszP38teof3wfnRV
	V1zW1acr3gXidgS+v0yw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pgiD8-00AFP9-2R;
	Mon, 27 Mar 2023 08:28:14 +0000
Received: from mail-wr1-x430.google.com ([2a00:1450:4864:20::430])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pgiD3-00AFLz-07
	for linux-mediatek@lists.infradead.org;
	Mon, 27 Mar 2023 08:28:11 +0000
Received: by mail-wr1-x430.google.com with SMTP id y14so7762081wrq.4
        for <linux-mediatek@lists.infradead.org>; Mon, 27 Mar 2023 01:28:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20210112.gappssmtp.com; s=20210112; t=1679905687;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=GAGQSh525G5QsNivU8boPxjITx0FQ4aR6d82jdyyf+Q=;
        b=17dBLZmdmgy6TbXfdavbHMMRM5zAHw+Zdoln68KFqbhYg4UdCySmKr5IBeSDeYayjm
         pOwecv/GHB5wjg54zXPmmK49Ki+Zsdc60cz2zF9ronhFLOz9jw7+M+jej5vCqIxLi71v
         24gB3DFsBleiwK/WpRKrQ9bmtORrrbVGuDFiVHIn+mbg+RnOP6lAJnmmlli2lRR2dpDq
         UP46rBOYV6Dwkkwwd/+4ziGStNEj9q/HLKqzUrC10wVAcIBWSpf/OxUnlB6QR00n34X7
         5YYKB/h1jruExlzpJ9ySIGkcUVvj6gMxt0G6s8MrsZzVe3alxVtw1LgkcpILhUfUNlsB
         X4tg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1679905687;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=GAGQSh525G5QsNivU8boPxjITx0FQ4aR6d82jdyyf+Q=;
        b=lkbzIMS0OxVv9PVLXUf9dWCFOBSCQRIaDo2+mgI5hk9qXX/pNQehEnjoRacZI0VAie
         LY4i3/P0i0ho4d5b2eIpq5APSd4AA5Ulk6zwCfAE+LMivYODxVoJa5h7Nvun0mm0XNhF
         4AY0BVJKY2vKkmmsjzXg+iAevzWuJg3+fKtxUR0RCWwqR3Wo4jMWm8rsuhAgjALiOwsh
         GBwbZQnx/qga1+yXDjdxFRYrLzOHqbToPAWkaI3B/i8i2hRt7baNX/Yd4SvWjqx/StnB
         Oi7r40D4w9IWwPziKyznmshMFDwDgLReJ2vo8WZoSCzEJSnM+FJtwMwvlHQJTogd/Vcs
         WxrA==
X-Gm-Message-State: AAQBX9dzrM82IhOAr/8vZ6KxZHcCT/amja+n+dzrfsZ6k/NHftv9xZGQ
	2VtZJjUMVVUmwwW4exGQ4j0pjQ==
X-Google-Smtp-Source: AKy350ZiWynu63zWZTjihRtHZa5diapakFf34xk8Kw84gZt8VcyHIjhXIq/m0lGrMLR2M+1+9w8TuQ==
X-Received: by 2002:adf:f582:0:b0:2cf:ebaa:31a0 with SMTP id f2-20020adff582000000b002cfebaa31a0mr9023916wro.54.1679905686704;
        Mon, 27 Mar 2023 01:28:06 -0700 (PDT)
Received: from [127.0.1.1] (158.22.5.93.rev.sfr.net. [93.5.22.158])
        by smtp.googlemail.com with ESMTPSA id p5-20020adfce05000000b002d64fcb362dsm19192398wrn.111.2023.03.27.01.28.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 27 Mar 2023 01:28:06 -0700 (PDT)
From: Alexandre Mergnat <amergnat@baylibre.com>
Subject: [PATCH v5 0/2] Add MediaTek MT8365 I2C support
Date: Mon, 27 Mar 2023 10:27:56 +0200
Message-Id: <20221122-mt8365-i2c-support-v5-0-6e4f3b54937f@baylibre.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAIxTIWQC/4XNQWrDMBAF0KsErauiGUmW2lXvUboYSZNa4NhBc
 gwh+O4duiyhXg3/w3/zUJ1b5a7eTw/VeKu9LrME/3JSeaT5m3UtkhUaRABEfVmjHbyumHW/Xa9
 LW/U5GxcL4QBMSoaJOuvUaM6jTOfbNEk51r4u7f77aAM5n/+aG2ijHXEK2bs8hPSR6D7V1Pg1L
 xf1JeKGxwqKwi4LAo5DhCeKPVasKFTeUgIThhLOTxR3rDhRYvRUrDVQPP1R9n3/AYK7/rqOAQA
 A
To: Qii Wang <qii.wang@mediatek.com>, Rob Herring <robh+dt@kernel.org>, 
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, 
 Matthias Brugger <matthias.bgg@gmail.com>
Cc: linux-i2c@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, 
 linux-kernel@vger.kernel.org, Fabien Parent <fparent@baylibre.com>, 
 Rob Herring <robh@kernel.org>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 Alexandre Mergnat <amergnat@baylibre.com>
X-Mailer: b4 0.12.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=2081; i=amergnat@baylibre.com;
 h=from:subject:message-id; bh=nSXv0el9Q8eoEvhrwybYSeDmgS2My2V0mCaELMNPWdg=;
 b=owEBbQKS/ZANAwAKAStGSZ1+MdRFAcsmYgBkIVOVGTG8xJzvYqFA8imHTuPGZ8rE/HDlHms8uoEl
 3j7NhP2JAjMEAAEKAB0WIQQjG17X8+qqcA5g/osrRkmdfjHURQUCZCFTlQAKCRArRkmdfjHURczaD/
 sEi6Ep1k07eUJsUradvYUXA1V9p1fPlrqwqj6K0ndkmHBaBoMybGY2w5BkIHbU1eOpifrH2TeXjrqf
 WC6jhSGEW+P6OEtROWTGnL3PBdtT7UeF2BBeFtKyl44vw9MLhaks69GfuBsCvqVXgUMBnZxUKksu/6
 KX0LAlE1Mjy38sX0T7m9H46UN4fMvSyjn3FLiKdFD8pdsB94JZx/oLgZBJecIpIZJwj0ai1NdDhGa8
 jNMaqbAzwg/33Dv8w/YVWfDxyGHYT1FnXRuTsnrFRbqEbMZQGs32V+JzoEy28tHvr9QFuuPge6oszP
 ZIr660+hZHEqNDRWH4AD/iBJzdFx2YcPcthZ3Wl6k7LxZj6GzbXBF4oVHxaucnY7fDHPpUP9zeLjqY
 4h34++BNsS5YciBHvHZHXSFCPrPkftwhD5LVYBg9ffuq+4/BtN6nVZoySkEOhGwUdbfoPPCYsqZ0Tk
 8S9Ueae2dX3Nqw7S8NQY7zddsqkKdBOYRZ3Y3hpwlghfouSz4wGDetrG16/t5OoQnVY1JXhzdwSPLy
 +H1MeB5Xu2gOmjhtuedevEy60yDzda3+SqCD23wxT75Dz0KI6RMAY/NkcBtF4zfzVVB1L+7z5y8n0T
 3PFrZXO2tF2FaxTl0vyeJCAOC4z7gIs1qyssJDKmJUaBKjlub77LG/+DoXkQ==
X-Developer-Key: i=amergnat@baylibre.com; a=openpgp;
 fpr=231B5ED7F3EAAA700E60FE8B2B46499D7E31D445
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230327_012809_167079_6B9A98DD 
X-CRM114-Status: GOOD (  12.00  )
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

Hi,
This patch series adds I2C support for MT8365-EVK board.
The I2C-0 is enabled, it can be used through the board pin header,
as described directly on the PCB.

This series depends to another one which add support for
MT8365 SoC and EVK board. Link [1]
This dependancy has been applied by Matthias Brugger [3]

One patch has been cherry-picked from [2], so I've addressed the comment
and kept the trailer.

Regards,
Alex

[1]: https://lore.kernel.org/linux-mediatek/20230101220149.3035048-1-bero@baylibre.com/
[2]: https://lore.kernel.org/all/20220531135026.238475-2-fparent@baylibre.com/
[3]: https://lore.kernel.org/all/ed1f9faf-cb4f-9ff1-ab6b-813035a051bd@gmail.com/

Signed-off-by: Alexandre Mergnat <amergnat@baylibre.com>
---
Changes in v5:
- Remove mediatek,drive-strength-adv which is a deprecated pin-control property.
- Link to v4: https://lore.kernel.org/r/20221122-mt8365-i2c-support-v4-0-885ad3301d5a@baylibre.com

Changes in v4:
- Fix some properties order.
- Remove the useless properties.
- Link to v3: https://lore.kernel.org/r/20221122-mt8365-i2c-support-v3-0-ad9bb1076d7f@baylibre.com

Changes in v3:
- Rebased to v6.3-rc1.
- Move i2c3 node to be consistent with the SoC address order.
- Link to v2: https://lore.kernel.org/r/20221122-mt8365-i2c-support-v2-0-e4c7c514e781@baylibre.com

Changes in v2:
- Drop the patch which do useless change in i2c-mt65xx.c driver.
- Change 2 lines compatible/reg in oneline.
- Link to v1: https://lore.kernel.org/r/20221122-mt8365-i2c-support-v1-0-4aeb7c54c67b@baylibre.com

---
Alexandre Mergnat (2):
      arm64: dts: mediatek: add i2c support for mt8365 SoC
      arm64: dts: mediatek: enable i2c0 for mt8365-evk board

 arch/arm64/boot/dts/mediatek/mt8365-evk.dts | 16 ++++++++++
 arch/arm64/boot/dts/mediatek/mt8365.dtsi    | 48 +++++++++++++++++++++++++++++
 2 files changed, 64 insertions(+)
---
base-commit: 5c6b974d24c21a6aa5d8b524067d7d9bc7fcc4f2
change-id: 20221122-mt8365-i2c-support-fc048da261ea

Best regards,
-- 
Alexandre Mergnat <amergnat@baylibre.com>


