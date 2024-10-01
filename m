Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8F678CE7D0D
	for <linux-mediatek@archiver.kernel.org>; Tue,  1 Oct 2024 11:33:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=Dkw5ZjTULYmnDhqzTqOvsBoCEBWuQcvkFtFk7rwLDX0=; b=VJjwKt1pWqfXHC
	87HIevdaGMqQlRRnQGhN/1azQ+D97t+wNdRVGOiYmZUrX+1MOu6jVxC8yqXtpwJoAL3cp0RCi/eQH
	QvVndP6tB3vi38uJPNCzIdL5BGYlvMhi6Oxr9rC6tbZPm7yblJDO1fjO1jGQM8Y+JuOP3MRNyeSpd
	B8R+/SvY8JYJGOpEeE1hVqq3c3v8rryhkALrWWK9d4LO0owsJlpU6X5dw8lpETO47qfZFA5G8w73O
	v/p1dleDv6qSu7KWQt3j+hKqLaStZVYsb67t6fFoJXyY0sevJsx6BoEeqyq6CqUdP4KS+njEH7kWp
	Zedg8VSN3CrRIOIXMU4g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1svb8W-00000002Wz7-1FTd;
	Tue, 01 Oct 2024 11:33:48 +0000
Received: from mail-pf1-x42e.google.com ([2607:f8b0:4864:20::42e])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1svb66-00000002WFW-0diB
	for linux-mediatek@lists.infradead.org;
	Tue, 01 Oct 2024 11:31:19 +0000
Received: by mail-pf1-x42e.google.com with SMTP id d2e1a72fcca58-717934728adso4158503b3a.2
        for <linux-mediatek@lists.infradead.org>; Tue, 01 Oct 2024 04:31:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1727782276; x=1728387076; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=Dkw5ZjTULYmnDhqzTqOvsBoCEBWuQcvkFtFk7rwLDX0=;
        b=frPzpLMsa+v1QjJ+UA3tytWrecqbqWkzYIAr6B+Vr9XyvIOAhTZZhv+ZK57C0bbeQB
         SvQaZ8VMr1VdoL+KuWx7hf8aPjb+Ltl2oab+lBXzrncqVzEmbKRKCQSCGOD2VqdJHJ6I
         0WPtaXDD2JkHFTL+CyCyjZyl79As/w1jVsqRk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1727782276; x=1728387076;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Dkw5ZjTULYmnDhqzTqOvsBoCEBWuQcvkFtFk7rwLDX0=;
        b=NT4UYdGez+o3IIEGaN2CPk4ST54bkhF6TJAKJHYYSmX+k20fP8xiuclmnh6mLiic1N
         l1nwZZSgrAV+YpMvG+Su7LFeVecUY/R7ffKo1JriQsdDpvWceC/R9vx0hIYWFDcwdBIF
         8LWZ5toqubUoZnD3RnIHcIgBCKhwHZRiWXNixEmg2P5wLqJbnk9aXhiT07lNY61Cvl3R
         7Yg1rbVxFfhqw5vNLbEOcnDtUPaFiPrDGAA4UnozJEjThSKZO+hav5ULf5rER9GjnBYR
         sNACs+/MTgbFUe7ikQkSH1As1cq2G/wrz+Dsm2nTRsM5o3xvVmqzxpvM6BqnomEpC2vQ
         Al4A==
X-Forwarded-Encrypted: i=1; AJvYcCXAHrLgvgFmy5etp5EFOCeMT9LT1OGY0D6LF/vX790RLnIhdu22qVkuugl1B51nQfSJWFswa9mElyfrQwub8g==@lists.infradead.org
X-Gm-Message-State: AOJu0YzLxvZ1J2liyQSbpv/6AVDZv/abBWSjiRDnhw1KEBquDH1izpAV
	sD6sEwsI+kiBzPjvgyHleCiD1ydox+Xaywl9IGDhck2IQ9/uxEf5UPjm4OD9AQ==
X-Google-Smtp-Source: AGHT+IEFyHAzeCxiNj5YqUp1sXh7ztXqQKl/I/N9BtpUPW8sRSj4zlFPq+dVnC9EwBiPLWiMyOrcxA==
X-Received: by 2002:a05:6a21:3305:b0:1cf:2513:8a01 with SMTP id adf61e73a8af0-1d4fa6cfb88mr19356853637.26.1727782276389;
        Tue, 01 Oct 2024 04:31:16 -0700 (PDT)
Received: from fshao-p620.tpe.corp.google.com ([2401:fa00:1:10:e044:f156:126b:d5c6])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-71b264b63d9sm7810646b3a.52.2024.10.01.04.31.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 01 Oct 2024 04:31:15 -0700 (PDT)
From: Fei Shao <fshao@chromium.org>
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Subject: [PATCH v2 0/8] MT8188 DT and binding fixes
Date: Tue,  1 Oct 2024 19:27:18 +0800
Message-ID: <20241001113052.3124869-1-fshao@chromium.org>
X-Mailer: git-send-email 2.46.1.824.gd892dcdcdd-goog
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241001_043118_253561_E7681BF0 
X-CRM114-Status: GOOD (  10.43  )
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
Cc: Xia Jiang <xia.jiang@mediatek.com>, Andrew-CT Chen <andrew-ct.chen@mediatek.com>, Ulf Hansson <ulf.hansson@linaro.org>, Yunfei Dong <yunfei.dong@mediatek.com>, Lorenzo Pieralisi <lpieralisi@kernel.org>, Fabien Parent <fparent@baylibre.com>, Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>, =?UTF-8?q?Krzysztof=20Wilczy=C5=84ski?= <kw@linux.com>, Rob Herring <robh@kernel.org>, Ryder Lee <ryder.lee@mediatek.com>, Jianjun Wang <jianjun.wang@mediatek.com>, Matthias Brugger <matthias.bgg@gmail.com>, linux-pci@vger.kernel.org, Lorenzo Bianconi <lorenzo@kernel.org>, linux-media@vger.kernel.org, Bin Liu <bin.liu@mediatek.com>, devicetree@vger.kernel.org, Conor Dooley <conor+dt@kernel.org>, Mauro Carvalho Chehab <mchehab@kernel.org>, MandyJH Liu <mandyjh.liu@mediatek.com>, Bjorn Helgaas <bhelgaas@google.com>, Tiffany Lin <tiffany.lin@mediatek.com>, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, linux-mediatek@lists.infradead.org, Krzysztof Kozlowski <krzk+dt@kernel.org>
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

Hi,

This series is split from a previous series[*] to focus on few fixes and
improvements around MediaTek MT8188 device tree and associated bindings,
and addressed comments and carried tags from the previous series.

[*]: https://lore.kernel.org/all/20240909111535.528624-1-fshao@chromium.org/
[v1]: https://lore.kernel.org/all/20240925110044.3678055-1-fshao@chromium.org/

Regards,
Fei

Changes in v2:
- new patch to MediaTek jpeg and vcodec bindings
- new patch to move MT8188 SPI NOR cell properties
- revise commit message of vdec power domain changes

Fei Shao (8):
  dt-bindings: power: mediatek: Add another nested power-domain layer
  dt-bindings: PCI: mediatek-gen3: Allow exact number of clocks only
  dt-bindings: media: mediatek,jpeg: Relax IOMMU max item count
  dt-bindings: media: mediatek,vcodec: Revise description
  arm64: dts: mediatek: mt8188: Add missing dma-ranges to soc node
  arm64: dts: mediatek: mt8188: Update vppsys node names to syscon
  arm64: dts: mediatek: mt8188: Move vdec1 power domain under vdec0
  arm64: dts: mediatek: mt8188: Move SPI NOR *-cells properties

 .../media/mediatek,vcodec-subdev-decoder.yaml | 100 +++++++++++-------
 .../bindings/media/mediatek-jpeg-decoder.yaml |   3 +-
 .../bindings/media/mediatek-jpeg-encoder.yaml |   2 +-
 .../bindings/pci/mediatek-pcie-gen3.yaml      |   5 +-
 .../power/mediatek,power-controller.yaml      |   4 +
 arch/arm64/boot/dts/mediatek/mt8188-evb.dts   |   2 -
 arch/arm64/boot/dts/mediatek/mt8188.dtsi      |  33 +++---
 7 files changed, 88 insertions(+), 61 deletions(-)

-- 
2.46.1.824.gd892dcdcdd-goog


