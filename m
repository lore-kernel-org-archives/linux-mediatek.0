Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BEC2FD0C5FE
	for <linux-mediatek@archiver.kernel.org>; Fri, 25 Oct 2024 10:56:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=7qYdMoYNHEEjU8R4jRwxYNDvg+V+aPZxty5Pm7LhAwc=; b=nY2mxYs3Pq8O0V
	+4cVVM8HMheCKfodSWTWDslqtctFP9+dq2QPMmKhj+6lJtU286IkYMOxc9EbkeVUl2sI0Ahmip0zX
	S+oRMJyUX9OJxL19gcukLMoOaPMUMuYHImEkMkalPRAbeWxMpr+srMiIq45xWzrGdq5GMNYaXHbsu
	ZdnN5PKmu8Iixcq6yW8jWYOWAXOlXfR+2SCHeLA4RfMSAbdSBSkMQwl+mQnE8V63+tOpJZRWRgbdQ
	QqeBW8Aoy0ul17cOpxvq+excpzKkLlaklExYFeUp9euf4L+Hz+MaFjkjQMJcC9VgR6XjPGYCOhO8k
	r6Mk3HLMXfElkCVuSNlg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t4Hze-00000003Qra-1hWr;
	Fri, 25 Oct 2024 10:56:34 +0000
Received: from mail-pg1-x532.google.com ([2607:f8b0:4864:20::532])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t4HpP-00000003Ojb-3vtG
	for linux-mediatek@lists.infradead.org;
	Fri, 25 Oct 2024 10:46:01 +0000
Received: by mail-pg1-x532.google.com with SMTP id 41be03b00d2f7-7ea8c4ce232so1433108a12.0
        for <linux-mediatek@lists.infradead.org>; Fri, 25 Oct 2024 03:45:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1729853159; x=1730457959; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=7qYdMoYNHEEjU8R4jRwxYNDvg+V+aPZxty5Pm7LhAwc=;
        b=hWP4fZABZPMnngcd4oC36gkXj4W8G5EwX7nqfwrsTVSYFAKj96HHUkpt5J/CB2egUh
         T4YszFnGvzpvYMhIUGsT+o5nGGd6U+Ma+Xe5PTJEsIKQOmG+CUJ+qjJI4DSfTEINgrB3
         9bgr4crOCbOWetndJXG5WJKpiDZaHG0ynjPt4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729853159; x=1730457959;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=7qYdMoYNHEEjU8R4jRwxYNDvg+V+aPZxty5Pm7LhAwc=;
        b=ebsnER2y0SDwSJkpUrD1CcxSDy4N2OZyfpSrMEm+beGlkMnouLZLEWoOl7vGwkl8Sd
         Xzsc3IZcd34jVAk05woba4egtye8tCKHuZMdCx08IxtlLV58LNtDqMjfcScP3i5yUhzD
         8iLH5sOzI6tYgS5tkD7H0cQg8Cl4lBZSU+I6FD1w09O9P7oV4+7BTV8nMWtJA6J7AEHX
         OkAdYQ6Vp3enNJQjGwlVrarP1Bx7V//4Z5CrvfDB5u9xSWZxpEsi+vI0l4cfV4qVywgI
         b693PiWzNJwdiznsth4lrKjZQhdc/aAUNS0ll5xA7yts0qD7FBvU3dkSPZhKye4t3nBt
         Z3Bw==
X-Forwarded-Encrypted: i=1; AJvYcCXISq3qTxEBFYQVoo/t6Xms2NtAX3V5sMImiDaV6hRo/w9S5qVTw2zAcsiMsM0GTwuNoVmrQo1ifQzuHQATYw==@lists.infradead.org
X-Gm-Message-State: AOJu0YwTyyNXekadgG0wzcSZ9JABtbZ1MxZHe048BAXpb78eT6fU5Sae
	Jo1jVSJ2D25HUAgPsCciueM31RQ3StI5spF8RxlnHefcbLkEk31l4DuuKy4ODw==
X-Google-Smtp-Source: AGHT+IE/jF3qeEh2sSM6HPYBIUpFWAzndUsngpMsqXOHaVXBbGKPEsKfMjMtDshVaZr1AnM6b0wOrw==
X-Received: by 2002:a05:6a21:31c8:b0:1d8:b962:6087 with SMTP id adf61e73a8af0-1d978ad70efmr11190210637.10.1729853158931;
        Fri, 25 Oct 2024 03:45:58 -0700 (PDT)
Received: from fshao-p620.tpe.corp.google.com ([2401:fa00:1:10:ebe1:dd63:343d:8a4c])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-72057a0d089sm829548b3a.99.2024.10.25.03.45.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 25 Oct 2024 03:45:58 -0700 (PDT)
From: Fei Shao <fshao@chromium.org>
To: Mark Brown <broonie@kernel.org>
Subject: [PATCH 0/4] Update properties in two ASoC DT bindings
Date: Fri, 25 Oct 2024 18:44:40 +0800
Message-ID: <20241025104548.1220076-1-fshao@chromium.org>
X-Mailer: git-send-email 2.47.0.163.g1226f6d8fa-goog
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241025_034559_998387_E81882D7 
X-CRM114-Status: GOOD (  10.72  )
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
Cc: Rob Herring <robh@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Steve Lee <steves.lee@maximintegrated.com>, Liam Girdwood <lgirdwood@gmail.com>, linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, linux-mediatek@lists.infradead.org, Trevor Wu <trevor.wu@mediatek.com>, Matthias Brugger <matthias.bgg@gmail.com>, Krzysztof Kozlowski <krzk+dt@kernel.org>, linux-arm-kernel@lists.infradead.org, AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

Hi maintainers,

This series includes four patches to update two ASoC DT bindings. The
goal is to fix dtbs_check warnings found with DAI links and audio
routing configuration on some MediaTek SoCs (MT8195 and MT8188).

This series doesn't introduce new properties - all are either commonly
described in existing bindings or are available but undocumented.

Patches 1 and 2 focus on mediatek,mt8188-mt6359.yaml, adding two
vendor-specific properties and updating the DAI link pattern to be more
generic.

Patches 3 and 4 focus on maxim,max98390.yaml, referencing
dai-common.yaml and documenting a hidden vendor-specific property.

Regards,
Fei


Fei Shao (4):
  ASoC: dt-bindings: mediatek,mt8188-mt6359: Add adsp and dai-link
    properties
  ASoC: dt-bindings: mediatek,mt8188-mt6359: Update DAI link node
    pattern
  ASoC: dt-bindings: maxim,max98390: Refernce common DAI properties
  ASoC: dt-bindings: maxim,max98390: Document maxim,dsm_param_name
    property

 .../devicetree/bindings/sound/maxim,max98390.yaml  |  9 ++++++++-
 .../bindings/sound/mediatek,mt8188-mt6359.yaml     | 14 ++++++++++++--
 2 files changed, 20 insertions(+), 3 deletions(-)

-- 
2.47.0.163.g1226f6d8fa-goog


