Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E1E63D75E21
	for <linux-mediatek@archiver.kernel.org>; Fri, 22 Nov 2024 10:50:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=4VCCZYEFyPvvi9pJLrfTrBaqaVLRyI5f0XR9dqSok6s=; b=GnQ/oxNc8BW2L0RrMOPxUNNktD
	2ZAGWaRtn8Rdb1qk0NUyd8wsXmAxqYE+0jVyLucXQ4n9R4V6oEYNOoHwEtyf/Pz0pbC08nQq+UyaQ
	sq4Tz1M5vSDjJ+kXBUkp1RWcpKMTm+9CzxbWGUEiDVsMGR6L7W9hyAHOgOyf/2Wz3LUoc03ozqAvX
	sDp5FDDzOMPSZq16mcVJ7aTNH6hdSDudZsrXPgnOgum/ADuxhYNN6Z2Hy8pOmJqCr0+8Hvmjoc1RK
	s2fi4QtEIKM11mJZEO5gQwdLc9omyMQo6AitxRlHNtTMkRxzQGVWM0mrEU+qkDNRDIskK1Jr27yrS
	fhMv8w1Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tERFQ-00000002HLF-3Xon;
	Fri, 22 Nov 2024 10:50:48 +0000
Received: from mail-ed1-x52a.google.com ([2a00:1450:4864:20::52a])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tERET-00000002HAR-3mrs
	for linux-mediatek@lists.infradead.org;
	Fri, 22 Nov 2024 10:49:50 +0000
Received: by mail-ed1-x52a.google.com with SMTP id 4fb4d7f45d1cf-5cfcb7183deso5257185a12.0
        for <linux-mediatek@lists.infradead.org>; Fri, 22 Nov 2024 02:49:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1732272588; x=1732877388; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=4VCCZYEFyPvvi9pJLrfTrBaqaVLRyI5f0XR9dqSok6s=;
        b=ZBeUrwg/9LU7jtZtzXN4ewUQeVrB1cLrCPxv+8d3Ejuw1k5zl7MIpHrlCIDzS5IGDe
         bswR/Vm7COa3tIkNzbJF4ymE+cQe5Iwry3JeVnSrJDueXeKQtkx7qXmvIUjQwjMKxaQx
         edFRfal2jIlNTBecNixQa7ZxLLBTd4bATlRnk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1732272588; x=1732877388;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=4VCCZYEFyPvvi9pJLrfTrBaqaVLRyI5f0XR9dqSok6s=;
        b=jbqebJbdWkRG0qvZF8yjbdhGCjy32PKx6Hc41AyWYhT4ToJJEIhgEMS/oQySjF603h
         ab+HDwo234EwAV0viWThprSvIk9qF875wSjYka/BmU/dq6zljLPJ8vGEeF5ZIWEZCpxI
         5UQ84yAgPGoNUWv/dyTGAkgkox+85l+7bjeGt8yld81M6HsPVfO3Lf6Wt03f2gvB6wW7
         rPHUATgQinHDUodtwwbfUyFVP8OjfZJqLe1o1pORllZsNkRsSnYuskXtIHu++knAv88H
         bDo9nkwnz27ejlNrdumcLC/UuuMhNiqO5HAKf+inj7XDHqEFBpYy5vqs09K7saDXVL+i
         zZYg==
X-Forwarded-Encrypted: i=1; AJvYcCXH0k8yOUSKXAgKTIDY+tStWv62H104wgw1XOMUkRywD6rB//UygeQazqzPMp3Y9YsXbZX21Wybe92I3KPKaQ==@lists.infradead.org
X-Gm-Message-State: AOJu0Yw4g/cTa74dREUzLGEwqYzrt62e7/kLtaCvRvVRjMvedwa7Zdem
	6Nn5nI0OrZ9Gt2cnJsz6pAaq73TNWLiY/l5hXHVLbMd4QYw/CN/ARqP/heNVNw==
X-Gm-Gg: ASbGncsV3wj8DtVMul208EpNgRQAWsMBH4wnwztzTx6TnemP0gClPbb6fPqC8EXnCip
	2Lt11K785ZJBBvtKy9VP88j4XXrOPNik9p97nJy4n7p8j5I+ylLteZsERur1vjKLC2wl2WAg7FI
	ema2QribB95FxBBHW9ntTNHWMI546TsMFYlYHozmWPP5X/70dDoP3SN3QLutIoTYRMBReAKe9GJ
	eNibXyP1SSptf/xRSnntj1f70FGEUj/8+2Wp/nVcmUThSWcB58nRqJMWi/sGc+wyioAjX99KTRC
	POxNE9WS
X-Google-Smtp-Source: AGHT+IEtqFLgN4QldlEpfUVybXqSI/MRA5+30+n/3WXfgfU0sDT9bCvRjWg4moxr2vE/+F91ZGikZQ==
X-Received: by 2002:a17:907:762f:b0:aa4:de84:3a23 with SMTP id a640c23a62f3a-aa509d09bb8mr253938966b.26.1732272587279;
        Fri, 22 Nov 2024 02:49:47 -0800 (PST)
Received: from localhost (30.171.91.34.bc.googleusercontent.com. [34.91.171.30])
        by smtp.gmail.com with UTF8SMTPSA id a640c23a62f3a-aa5175972f5sm55606966b.63.2024.11.22.02.49.46
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 22 Nov 2024 02:49:46 -0800 (PST)
From: Wojciech Macek <wmacek@chromium.org>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Chen-Yu Tsai <wenst@chromium.org>,
	Rafal Milecki <rafal@milecki.pl>,
	Hsin-Yi Wang <hsinyi@chromium.org>,
	Sean Wang <sean.wang@mediatek.com>,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org
Cc: Wojciech Macek <wmacek@chromium.org>
Subject: [PATCH v1 0/2] Add Starmie Chromebooks 
Date: Fri, 22 Nov 2024 10:49:36 +0000
Message-ID: <20241122104938.1437925-1-wmacek@chromium.org>
X-Mailer: git-send-email 2.47.0.371.ga323438b13-goog
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241122_024949_935456_BB2D89C8 
X-CRM114-Status: UNSURE (   7.90  )
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

Add an entry for the MT8186 based Starmie Chromebooks, also
known as the ASUS Chromebook Enterprise CM30 Detachable (CM3001).
The device is a tablet style chromebook.

Wojciech Macek (2):
  dt-bindings: arm: mediatek: Add MT8186 Starmie Chromebooks
  arm64: dts: mediatek: mt8186: Add Starmie device

 .../devicetree/bindings/arm/mediatek.yaml     |   8 +
 arch/arm64/boot/dts/mediatek/Makefile         |   2 +
 .../mediatek/mt8186-corsola-starmie-sku0.dts  |  29 ++
 .../mediatek/mt8186-corsola-starmie-sku1.dts  |  46 ++
 .../dts/mediatek/mt8186-corsola-starmie.dtsi  | 480 ++++++++++++++++++
 5 files changed, 565 insertions(+)
 create mode 100644 arch/arm64/boot/dts/mediatek/
     mt8186-corsola-starmie-sku0.dts
 create mode 100644 arch/arm64/boot/dts/mediatek/
     mt8186-corsola-starmie-sku1.dts
 create mode 100644 arch/arm64/boot/dts/mediatek/
     mt8186-corsola-starmie.dtsi

-- 
2.47.0.371.ga323438b13-goog


