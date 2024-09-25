Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F066AC369C7
	for <linux-mediatek@archiver.kernel.org>; Wed, 25 Sep 2024 11:01:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=x+wU+nQmthczOLIKmqdKHiC6ejraUTpzi9Y1GrEh5og=; b=DJ7ojDKkXGYZC0
	sEhmZgIGb9Eg9cuB6naqFQazQLR8RSoCDmxF/KnArCVakH6Pp0PQYOUJCPDH1ujgpuXmpwMmAl1ok
	acgYBMpTIa1J7m4tWJDaAqXKOl9fBHUPLuNcgwZQ1j2BFk6wqN9dqmvjvpQnUCfDflYWSRc4TfWB9
	ky6WfGU+swCD0DegPWiG8HHB5cAMbRyb81rTouEWbBFp+GlwsVwrsCszvpJ4VZDJU+jz2UwbEVGXv
	S4NJAq65iIm0U5T5u8XeUJ4g7AJWa9OdR7eaNGizvOx4vn78N0yUhCSul98w70kbvADQy7C7tWUY+
	y6s73OgtrDm2ntbcrFHQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1stPlu-00000004oLj-2FYW;
	Wed, 25 Sep 2024 11:01:26 +0000
Received: from mail-il1-x12b.google.com ([2607:f8b0:4864:20::12b])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1stPlq-00000004oKQ-3IR9
	for linux-mediatek@lists.infradead.org;
	Wed, 25 Sep 2024 11:01:24 +0000
Received: by mail-il1-x12b.google.com with SMTP id e9e14a558f8ab-3a1f1ef7550so5289465ab.1
        for <linux-mediatek@lists.infradead.org>; Wed, 25 Sep 2024 04:01:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1727262081; x=1727866881; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=x+wU+nQmthczOLIKmqdKHiC6ejraUTpzi9Y1GrEh5og=;
        b=J2+aM122IDXg0vjFTijylNEakAeOme/R7jh58O2w4f7VX0cKLu/lgNILl5ehfKSpG5
         S2rDntzgTtkXW0jm1Yo64GYeKy9B80aWM3JmR7mXKZ9UyoCW2rbt/4Cn3MxDN1+JT1Y+
         lliMwJ0T4f6kzl/U97jE6q72fbTDVgJu/+0Pk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1727262081; x=1727866881;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=x+wU+nQmthczOLIKmqdKHiC6ejraUTpzi9Y1GrEh5og=;
        b=wyv2rLz7TMafW4BVQk+J97Weo2IWNUk5hYj+FVho+LTmU9h/yDoBBQqcZtD3kEnOgS
         H4z1vHbdu3LR9StgJ8/aC98Oo+MyzyfqttyKUj4U30Ycy+rWLsH7A6t9ZjnUztg5LYby
         qL4kgHxosxl2xfSWWsip7oXoNLIOlBMKSCX4FRE8QRhWxHh9ZXQ9r7Iujm7zv0kLnYI4
         HD08ygBY0IfdMclOfq4ufdPciPFHMKh+gA9hUs8l/5NNiEgUQXqCZJYbyrfDEGlTeP7o
         Nypo/2S7pHM4BGx2ao1mQbn56BOh6fRqTh51EVzBVdB4A0iUPxcctxxN6yIA6BXlbdFt
         3uZg==
X-Forwarded-Encrypted: i=1; AJvYcCXBfm3UCruDlOJGe5ipiU+hC6yGhp0gJ4RDir8Go0LOyKh7oOuzkFnJOu/p1TJG0N2oJQlZ6H/xWZMFuBv1Ow==@lists.infradead.org
X-Gm-Message-State: AOJu0YzfcLphLYqovCc5TNhQ8rzt6mVIl8Bk4xAnpqcB/ZOHgiBb94TL
	0bByaEoTNogkb+dvzMjvzgjaq9SVR2N5qY2BbGobl3/JrUW++4zys5xh/yo8gUerJq0Pm2n1MGo
	=
X-Google-Smtp-Source: AGHT+IGjqwv6hyYB9WgLlo4cxUlTkRTFUHeo+Nb8obSIHI0syyubDfaR8EBimZS1brkQVkQGQfPnaQ==
X-Received: by 2002:a05:6e02:1566:b0:3a1:a179:bb54 with SMTP id e9e14a558f8ab-3a26d5e8bf2mr30993475ab.0.1727262081294;
        Wed, 25 Sep 2024 04:01:21 -0700 (PDT)
Received: from fshao-p620.tpe.corp.google.com ([2401:fa00:1:10:2b86:78b6:8ebc:e17a])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-7e6b7c73085sm2570298a12.59.2024.09.25.04.01.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Sep 2024 04:01:20 -0700 (PDT)
From: Fei Shao <fshao@chromium.org>
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Subject: [PATCH 0/6] MT8188 DT and binding fixes
Date: Wed, 25 Sep 2024 18:57:44 +0800
Message-ID: <20240925110044.3678055-1-fshao@chromium.org>
X-Mailer: git-send-email 2.46.0.792.g87dc391469-goog
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240925_040122_880499_E4CC4611 
X-CRM114-Status: UNSURE (   9.84  )
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
Cc: =?UTF-8?q?Krzysztof=20Wilczy=C5=84ski?= <kw@linux.com>, Conor Dooley <conor+dt@kernel.org>, Ryder Lee <ryder.lee@mediatek.com>, Alexandre Mergnat <amergnat@baylibre.com>, linux-pci@vger.kernel.org, Lorenzo Pieralisi <lpieralisi@kernel.org>, Ulf Hansson <ulf.hansson@linaro.org>, linux-kernel@vger.kernel.org, Jianjun Wang <jianjun.wang@mediatek.com>, Fabien Parent <fparent@baylibre.com>, devicetree@vger.kernel.org, MandyJH Liu <mandyjh.liu@mediatek.com>, Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>, Bjorn Helgaas <bhelgaas@google.com>, linux-mediatek@lists.infradead.org, Krzysztof Kozlowski <krzk+dt@kernel.org>, Lorenzo Bianconi <lorenzo@kernel.org>, Rob Herring <robh@kernel.org>, linux-arm-kernel@lists.infradead.org, Matthias Brugger <matthias.bgg@gmail.com>
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

Hi all,

This series is split from a previous series[1] to focus on few fixes and
improvements around MediaTek MT8188 device tree and bindings, and also
addressed comments and carried tags from the mentioned series.

[1]:
https://lore.kernel.org/all/20240909111535.528624-1-fshao@chromium.org/

Regards,
Fei


Fei Shao (6):
  dt-bindings: power: mediatek: Add another nested power-domain layer
  dt-bindings: PCI: mediatek-gen3: Allow exact number of clocks only
  arm64: dts: mediatek: mt8188: Define CPU big core cluster
  arm64: dts: mediatek: mt8188: Add missing dma-ranges to soc node
  arm64: dts: mediatek: mt8188: Move vdec1 power domain under vdec0
  arm64: dts: mediatek: mt8188: Update vppsys node names to syscon

 .../bindings/pci/mediatek-pcie-gen3.yaml      |  5 ++-
 .../power/mediatek,power-controller.yaml      |  4 ++
 arch/arm64/boot/dts/mediatek/mt8188.dtsi      | 37 +++++++++++--------
 3 files changed, 28 insertions(+), 18 deletions(-)

-- 
2.46.0.792.g87dc391469-goog


