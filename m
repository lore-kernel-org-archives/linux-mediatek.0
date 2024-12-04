Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 82A4AE7716B
	for <linux-mediatek@archiver.kernel.org>; Wed,  4 Dec 2024 09:30:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=rSvjzybcpgZsvOT9TlMKPiZLpA7cHiGiwj+87vtqrQI=; b=vhPwWjcKTEu3D5
	Dtzhju9D+erUZ8riiVTR8Q89hXRZL2ZSbhlfDNZlUE/wUissq1jSrYC4cVNGsrkE0n7XimtA0eqC9
	S/I3A1SNoNQ5M1AmY1UXWpJ4oG8mz5DDQXs90lm86GNqq+pTiqLELWPq4WooHJg97SzEVImIio712
	jlo8NWmvePCJuYDR9ybbVe8+JarK+pLncEKy8DFcI4mZ/Y1ewQ//8XGQal8XTwG+8b4Ve/k1x/x4E
	Kugb+QqPjYUodIgrtVdhHuUUNryO7UfrFSEQGmEu8HnTt8w4YqF9RDx/GZWMTFo8Cknr9WozSc2YX
	LEWsAF5hAlrzvv/9rg+A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tIlhr-0000000C2qr-2HLP;
	Wed, 04 Dec 2024 09:30:03 +0000
Received: from mail-ot1-x333.google.com ([2607:f8b0:4864:20::333])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tIlgt-0000000C2de-0FHU
	for linux-mediatek@lists.infradead.org;
	Wed, 04 Dec 2024 09:29:04 +0000
Received: by mail-ot1-x333.google.com with SMTP id 46e09a7af769-71d5476ebb1so2992646a34.2
        for <linux-mediatek@lists.infradead.org>; Wed, 04 Dec 2024 01:29:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1733304541; x=1733909341; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=rSvjzybcpgZsvOT9TlMKPiZLpA7cHiGiwj+87vtqrQI=;
        b=W+SyDWrlK7L5yP+O+sN5zQ9x5WyiMElhapZuTq6qm9JQ2Rj8InF4Ea2EGkoVBIJGt/
         U5gYbKtiKHwgPhNeGPBl72kDvwUZFxAEYaDDciN2H94ZDSeMiiNiJ6ZGxCEjn2KS3KoQ
         5tPG011Vbb3Eaz3nCImFhQ9idNhT1fSdiWdEs=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733304541; x=1733909341;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=rSvjzybcpgZsvOT9TlMKPiZLpA7cHiGiwj+87vtqrQI=;
        b=lA5UAWIcR5terKrC/90wJ1Qnqy4J62S8n1zCOXQAggx5o+W65FzyOGMNQTFUq87Y4d
         stZiKo2/vvLiG0EK2HcfmF0faS5ihTKV3xoMYGpUSEdLEkwOXeTFXPLzWb4UTmBb0uIm
         UlslULhrXa/C+6r+XHNHF3RT9uXnK1vhWgdY25SPp0nDfWDv7C+7H2ouqzGOCDxq2dsr
         ie4kBLZX9bhXt7QNYBt4TLCCPUbaLuchm2E4XR67X6LdPFvWWOQ+tpyA39lwM1DHvVHQ
         GRUWm+OoahjQ2wl+phnUcby9EVfPpV1QNhRBNc/423+OxxYjdpqE0pzDFEukWSUc+c+a
         w6XA==
X-Forwarded-Encrypted: i=1; AJvYcCXx9KP0sV6QwgefrNkKOVnMXHdYT9R/1JtS+lEZRo9tZ5j3SEiPkF+nXGKXxCkpLMqzJ8fG0exC8zXdDpHZng==@lists.infradead.org
X-Gm-Message-State: AOJu0YwB19o5VQMgxZqk/DHAgisSK976TvArBhMZWNMUqLNyn7kgmx1X
	XT8PXtrI9q0NG5BHzhnc0cIDNb/k2Uo/I6dMlF9R4/DRQqMmH4tlzUKeydSXFA==
X-Gm-Gg: ASbGncuRTQkAD67I9fFf0kCqI3JXeQ8o/sr9ETFLwohN4xirycWcpHKJAnloEMRrkxy
	NMPSN5PHFRRmBIxyLB0xpVxvu13c4nBUfHpc94FfvKxmVR8aeqT0Qact82/pk+lkL0+JNCj9/xb
	nG+LhrvGk0THLBLVH360hRNnfWObsbDxV9xfyzXq4YGO6WWKPgy23jjkBz9Li67FOKVvXTJ3vuG
	nmFyIO3jZ3eyA7FRkxIgX2n0DUgvvFZ6/uXbd0GLy55TnqhubqhOK6MI5+BRKiFdr3Y
X-Google-Smtp-Source: AGHT+IEDEK2nhMPbAOsuMuh6j108aGwGF9PHLhxq9QdnWZtG1dV+KYKtrNgMaqBZ6YJiiA1s1lmFsw==
X-Received: by 2002:a05:6830:b93:b0:71d:5a8a:1a37 with SMTP id 46e09a7af769-71dad652b13mr7062531a34.15.1733304541404;
        Wed, 04 Dec 2024 01:29:01 -0800 (PST)
Received: from wenstp920.tpe.corp.google.com ([2401:fa00:1:10:2eb1:a68a:2625:b944])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-7fc9c2d38dbsm11049024a12.15.2024.12.04.01.28.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Dec 2024 01:29:00 -0800 (PST)
From: Chen-Yu Tsai <wenst@chromium.org>
To: Chaotian Jing <chaotian.jing@mediatek.com>,
	Ulf Hansson <ulf.hansson@linaro.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Wenbin Mei <wenbin.mei@mediatek.com>
Subject: [PATCH 0/2] mmc: mtk-sd: Limit second register range to SoCs requiring it
Date: Wed,  4 Dec 2024 17:28:51 +0800
Message-ID: <20241204092855.1365638-1-wenst@chromium.org>
X-Mailer: git-send-email 2.47.0.338.g60cca15819-goog
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241204_012903_127281_42B996EB 
X-CRM114-Status: GOOD (  10.35  )
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
Cc: devicetree@vger.kernel.org, Andy-ld Lu <andy-ld.lu@mediatek.com>, linux-mmc@vger.kernel.org, linux-kernel@vger.kernel.org, linux-mediatek@lists.infradead.org, Chen-Yu Tsai <wenst@chromium.org>, linux-arm-kernel@lists.infradead.org
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

Currently the usage of a second register range for MediaTek's MMC
controller is seen only on a few platforms. However the driver tries
to grab the register base regardless, and then ignores any errors.
This makes all the other platforms that don't need it produce confusing
error messages.

Instead, make the driver only grab the register range for platforms that
actually require it, and correctly handle the error. Also fix up the
binding so that validation of the "reg" property is as strict as
possible.

Please take a look.


Thanks
ChenYu

Chen-Yu Tsai (2):
  dt-bindings: mmc: mtk-sd: Document compatibles that need two register
    ranges
  mmc: mtk-sd: Limit getting top_base to SoCs that require it

 Documentation/devicetree/bindings/mmc/mtk-sd.yaml |  9 ++++++++-
 drivers/mmc/host/mtk-sd.c                         | 15 +++++++++++----
 2 files changed, 19 insertions(+), 5 deletions(-)

-- 
2.47.0.338.g60cca15819-goog


