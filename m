Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 15B9CC678D4
	for <linux-mediatek@archiver.kernel.org>; Tue,  7 Mar 2023 14:01:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:Message-Id:Date:From:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=3QcLxqc/EMQ7vTX+ppb3WUMx4kSFKtn1M+ctQl6WKSw=; b=UhtVz8at6XWztW7EOIvYfiMpCb
	LdSkERZw6ilX3uj9UJCEa/nMgPSbvGn6b/vA22KhAIm2E3yaAVdePDh+qRHmEZD3jX1oxigVAsfLs
	YITJp7c0qDQ5g4sGHc4mo87JBMbWFkUVosDIszCVNCFXHwAMRdQJxY06SMog8N8Zol88wWzMSBU0K
	nmHD+eBAeSiBZ857CNwFdfAzusfd+IniPftRxr+WfWmin5LKNrQAOxQfam7m6+yl/4d8v/g/N9/vb
	YP6OJCqeS170GzaZJEYb8PtA9we0udiDYCHpEFlPWkhCBWsIMkYKfeNp74jHvOM32h4Nd8MsIIxKk
	UyzMmhlA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pZXt0-000bJl-5o; Tue, 07 Mar 2023 14:01:50 +0000
Received: from mail-wr1-x42d.google.com ([2a00:1450:4864:20::42d])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pZXeK-000V2m-GE
	for linux-mediatek@lists.infradead.org; Tue, 07 Mar 2023 13:46:43 +0000
Received: by mail-wr1-x42d.google.com with SMTP id bw19so12144113wrb.13
        for <linux-mediatek@lists.infradead.org>; Tue, 07 Mar 2023 05:46:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20210112.gappssmtp.com; s=20210112; t=1678196796;
        h=cc:to:message-id:date:from:content-transfer-encoding:mime-version
         :subject:from:to:cc:subject:date:message-id:reply-to;
        bh=3QcLxqc/EMQ7vTX+ppb3WUMx4kSFKtn1M+ctQl6WKSw=;
        b=pF6YzMiqMpo7uXvApBRAXO5v+ieRxCELpvGFAUsC5/07FkJiFomXVJ6LCm2+em1pjb
         4+3o2BEa/cS2Tr0BdwFG9oKJpGFDFk12BVz9jghe7Y0IYw0lP3Z8kakSzqw0O4tk8UNW
         VWe2oEx4MKHkf45LgXriHP0cILJTN6eS8Yegi/0E9hRfIxsjcAz+tpUCAd7LTnxC3FAQ
         zINJyCZdtFUAKvSL6dwF5yC59j0ZMbW5VhGw5kl7quwCuvEcF5s7WCbm6Klh6CUEmFxu
         wfXvDf6aps3IJgsK3gFJPVYTc+4enVYn+WFN9Bl84WOncaP9eqnV9CtYUjccE+KiQfzE
         Q7ow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678196796;
        h=cc:to:message-id:date:from:content-transfer-encoding:mime-version
         :subject:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=3QcLxqc/EMQ7vTX+ppb3WUMx4kSFKtn1M+ctQl6WKSw=;
        b=d1PAd8Fa7Cm3dfJgtKD4cau/9/Fv/h0lQPIEKI6r5CG4BI6TQlZzbt8HHlt2hp3LhN
         9/1ka+c5OecUvdKFLPdGHglQQtN41iQUHaqV1/AM4+Lm0oNiSxWp4aTuToHaH1K2jdZR
         R5eAOd6oVulQ4qQluJTZVq0w0rMKfKiaQ/zS5bexeuEwBM0xX/XF8zDfGIUY8h1axM0g
         4RDRraWteq6Gk18kQAUtGufEJohOX7y2LUatBe1bygF+wjVaujkvYSO319O2UZi3KbnB
         wWuGA+9KuPpE5B6+7W4GPH6Wu9IFH7QxsHhbI8YboZnsH7tj3nsdgj28aGaUBmc7wmHQ
         xu6Q==
X-Gm-Message-State: AO0yUKXAC9NIdGnRmEPUfA3KnqKmnI6VW4foIyM6lojJy+JZBvXh2sIX
	nld1YRfiz6vbaRscfBuALmmHCw==
X-Google-Smtp-Source: AK7set+JSjliJoe7MHdfV/BnLWtWTYS3B+zFrCxJjvW7M8NLA/sGpGyEPk2L4vIJN6ZF9G0DkQWnJw==
X-Received: by 2002:a5d:5544:0:b0:242:1809:7e17 with SMTP id g4-20020a5d5544000000b0024218097e17mr9700189wrw.6.1678196796365;
        Tue, 07 Mar 2023 05:46:36 -0800 (PST)
Received: from [127.0.1.1] (laubervilliers-658-1-213-31.w90-63.abo.wanadoo.fr. [90.63.244.31])
        by smtp.googlemail.com with ESMTPSA id o13-20020a5d670d000000b002c8476dde7asm12657607wru.114.2023.03.07.05.46.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 07 Mar 2023 05:46:36 -0800 (PST)
Subject: [PATCH 0/6] Add IOMMU support to MT8365 SoC
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-b4-tracking: H4sIADFAB2QC/w3LwQ5AMAwA0F+RnjWZYsLfbDQ0mU1WcxH/bsd3eC8oZ2GFpXkh8yMqKVZ0bQPr4e
 LOKFs1kKHekJlQ0nkW1HJdKd84siUzk+WBGOrxThl9dnE96oolhO/7AejW71RkAAAA
From: Alexandre Mergnat <amergnat@baylibre.com>
Date: Tue, 07 Mar 2023 14:46:25 +0100
Message-Id: <20230207-iommu-support-v1-0-4f0c81fd52c1@baylibre.com>
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>, Rob Herring <robh+dt@kernel.org>,
 Matthias Brugger <matthias.bgg@gmail.com>, Yong Wu <yong.wu@mediatek.com>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: linux-kernel@vger.kernel.org, linux-mediatek@lists.infradead.org, Alexandre Mergnat <amergnat@baylibre.com>,
 linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org
X-Mailer: b4 0.10.1
X-Developer-Signature: v=1; a=openpgp-sha256; l=1947; i=amergnat@baylibre.com;
 h=from:subject:message-id; bh=03Ugo53d84FTdWBX9oQiR9MrVn5qSFZ7/cxlmIhFGCU=;
 b=owEBbQKS/ZANAwAKAStGSZ1+MdRFAcsmYgBkB0A753nOSUCwQYV1X9uTdM+tzoOEkDcA/gdDvICW
 lcKaa7GJAjMEAAEKAB0WIQQjG17X8+qqcA5g/osrRkmdfjHURQUCZAdAOwAKCRArRkmdfjHURRUpD/
 9vIk78xkY/EbZ1WxCn9ZnY/y6I1ZFt5oiGvLUkOo4ktMG3kjm9yuROircgRYKM912Quzno3NMh/jQq
 5offIoGO8XPmsAzKfQS/1xlRkMtHWDId9dkcLssvqTpvLH5hXmcLuITNL1FKGHfwBIgxvf+hr+a828
 g0BB9Ift5CCrAt2T36U0etElG52NiRB7bIZWl2eOCpreFuuieo2SyrsZ5kHHNo7p35Fps5ewZ/J9Ne
 QXUB1VUib1EciOTXoH81frDx5+CqBuKjv0zYZd201gaT/Q3A22cIkFLnElMs5shDApecNrGbgLaIdm
 0+JgAbM417F6JfkGEO4CLY4hRhO2tRcqX9D1ABHp7oL8K6nefslJJe6AzOwslB1CgPrXAeF9aiOujQ
 ud+KLqiHLgvntnRyYed5wmyeO2auHXjQwjAzL/2eHrsD7K5CeoD6WIgZwfS+C+otfwSUSPXY2OLKyR
 35xnfQLla7SjzGs/iZzvhN123QdhM/rPmPx8E7CBsn41fh+bZNqzXMWJEHXyDSzKbHEZluACcYO5Bb
 rmBn7lAKxQ52WSIYfCG/e0jo2uyp9NCe9VTTOqKTGvqLVo6cInPDu+80L1rdQ+gB08cv3g3F6HOCUj
 SVd5TYnXDbTgOnLJMH/H22rDJLUwbztiSS/f18FN1+DqzADJ9tcVA7HtS0TQ==
X-Developer-Key: i=amergnat@baylibre.com; a=openpgp;
 fpr=231B5ED7F3EAAA700E60FE8B2B46499D7E31D445
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230307_054640_620306_D4A6A98A 
X-CRM114-Status: UNSURE (   9.76  )
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

This commits are based on the Fabien Parent <fparent@baylibre.com> work.

The purpose of this series is to add the following HWs / IPs support for
the MT8365 SoC:
- System Power Manager
- MultiMedia Memory Management Unit "M4U" (IOMMU)
  - Smart Multimedia Interface "SMI"
    - Local arbiter "LARB"

This series depends to two others which add power support for MT8365 SoC
[1] [2].

Regards,
Alex

[1]: https://lore.kernel.org/all/20230203-evk-board-support-v2-0-6ec7cdb10ccf@baylibre.com/
[2]: https://lore.kernel.org/lkml/20230105170735.1637416-1-msp@baylibre.com/

To: Yong Wu <yong.wu@mediatek.com>
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To: Rob Herring <robh+dt@kernel.org>
To: Matthias Brugger <matthias.bgg@gmail.com>
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
To: Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
Cc: linux-mediatek@lists.infradead.org
Cc: linux-kernel@vger.kernel.org
Cc: devicetree@vger.kernel.org
Cc: linux-arm-kernel@lists.infradead.org
Signed-off-by: Alexandre Mergnat <amergnat@baylibre.com>

---
Alexandre Mergnat (6):
      dt-bindings: memory-controllers: mediatek,smi-common: add mt8365
      dt-bindings: memory-controllers: mediatek,smi-larb: add mt8365
      arm64: dts: mediatek: add power domain support for mt8365 SoC
      arm64: dts: mediatek: add smi support for mt8365 SoC
      arm64: dts: mediatek: add larb support for mt8365 SoC
      arm64: dts: mediatek: add iommu support for mt8365 SoC

 .../memory-controllers/mediatek,smi-common.yaml    |   4 +
 .../memory-controllers/mediatek,smi-larb.yaml      |   4 +
 arch/arm64/boot/dts/mediatek/mt8365.dtsi           | 211 +++++++++++++++++++++
 3 files changed, 219 insertions(+)
---
base-commit: 1db7fc94e6e116f43f7bf3adb33407f21bc29fd9
change-id: 20230207-iommu-support-5e620926e42e

Best regards,
-- 
Alexandre Mergnat <amergnat@baylibre.com>

