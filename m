Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C77C5D70DE3
	for <linux-mediatek@archiver.kernel.org>; Fri, 29 Nov 2024 05:58:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=w9WF3O3Q9CqJ+jQNAGLBDdeZMuKGc8yveqCJFxa21hM=; b=h5WdvEDZ0tbkZCpiMNNg2TE70N
	C48YNUYOZg54AJHVgY9jofuyq+qvVwQZ05XZGuGPUjNcoovyT37mhnzx8PAGIt7AFUaJhXv4K+aWP
	8iNJKSWkXkdTM8K6y6OVRJ0tfRJHmYhpm1uCjcoVme7gW3xWxmSsKOf6xC/Bkmp098dXy39yRP77a
	3DUnRbQ5Cll0e1PcjVdxxOHLzm+jekcdf3gYIFdPMR/SVPp0fYN77DOiX+BTr2fNNw8PyEhPvVPMC
	KHYJPCHfmNZQD0xNTYdk129JWkCnSnvDlEyPvCZ07Ev6uTym333K1fQxKPw/P5BvBaGufCpFa09E1
	saBW/5Yw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tGu1M-0000000GxoN-3w04;
	Fri, 29 Nov 2024 05:58:28 +0000
Received: from mail-lf1-x133.google.com ([2a00:1450:4864:20::133])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tGu0M-0000000GxZN-45g2
	for linux-mediatek@lists.infradead.org;
	Fri, 29 Nov 2024 05:57:28 +0000
Received: by mail-lf1-x133.google.com with SMTP id 2adb3069b0e04-53ded167ae3so1819524e87.0
        for <linux-mediatek@lists.infradead.org>; Thu, 28 Nov 2024 21:57:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1732859845; x=1733464645; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=w9WF3O3Q9CqJ+jQNAGLBDdeZMuKGc8yveqCJFxa21hM=;
        b=mU13xBX4s+lPy/zXbFEU3Lr9xz/jEJaZjXEfbvKl+WIBJvNKE+1U287pxoGavutgEt
         Ibj6FRV4u5MIH3dvmlTLmQIPfxmVc5XYTbaNchHWhvrHnUbrFpN5In6qjt8EG228PFdf
         8i+ro47knNb01/QfI28wRAVvvsH0NQQQx5P+E=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1732859845; x=1733464645;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=w9WF3O3Q9CqJ+jQNAGLBDdeZMuKGc8yveqCJFxa21hM=;
        b=Sqyh9Uiwl88q9olf6qOsRCBYlMWkv4nj3jbKKK9B4a5Cznt8inzMIj1oCrArL3Qn6p
         L4dGJLOq31M4VFfVafIGcCyNlv941xJMfAsBEzrlgnx3U97miiDOu+I8/Mb3SlNstF+V
         0Uu5XHoR2dEkT2vgBWDe8/8yZ8NONAsJbxDW4wOrJwod5b8B2sVvy38WhTVDwjNM8d9/
         piVwCGipQfOG9e+XcgxEREBuwRLgCHChcTknCb2TGzAX/B4BqcGtNql+dz05Wnx3ladw
         gyOI/TyPr3ZnRMtd/P0PkslSTvTOo2Siw1drpB3/N09/qjogo205WDIPxIhyqUpVfLx/
         FhEQ==
X-Forwarded-Encrypted: i=1; AJvYcCUGY7m7rX05eyTHThoPO3qFIdPhUgyrPSdqpzNubTM5Iy3AEc7Xs61YrdhUP1K/1XPOdcqgDkOEpCjuIMyZ6A==@lists.infradead.org
X-Gm-Message-State: AOJu0YydHZ3orZ/69sprRSOy8nnpmCNklm1hdZMxDc5i8rFFib04E6MZ
	R/KY2/UwfD9w0mLmxuRsURZ27Uh/QVdskYvNi2qGkFCbUTL+Sd8r+sTn5Mb0hQ==
X-Gm-Gg: ASbGncvOl3+M9UVPdyhpGVoMNjZq+0SjdXaztC0hri9q5fC9DIJ8ZFeLkd5JZkme6Aa
	+9mPe3X1JIbyjnZhweeowBFwb9f5dFUYRpUXywGm5x2yKhU6TkEQx8Ra1DlWZ0QMoP8GDbf2z/e
	F72j2kA7bGKKziOyB5i+oR9SN3TMdOkba5xSRcCMiLeiydvWRz7oro9FqYcEkiXf+luqJQ5z24m
	Fh+/R10CRrBWoePaGDV7FZhFn+iYy7ueNx4UuVcWZJ+J48ucLGOEZAJxiY8pc95mDQvqq9cCPzO
	l614f7xJ
X-Google-Smtp-Source: AGHT+IE65JzRNArxxc+ToexNBzoPm9HjhpdDJXXa/EKqSE7i98HFux8rxp92UCOg27WO0Cy7mDBO/w==
X-Received: by 2002:a05:6512:2355:b0:53d:e41a:c182 with SMTP id 2adb3069b0e04-53df00dc9afmr5377517e87.31.1732859844507;
        Thu, 28 Nov 2024 21:57:24 -0800 (PST)
Received: from localhost (30.171.91.34.bc.googleusercontent.com. [34.91.171.30])
        by smtp.gmail.com with UTF8SMTPSA id a640c23a62f3a-aa599955662sm136615766b.190.2024.11.28.21.57.22
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 28 Nov 2024 21:57:23 -0800 (PST)
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
Subject: [PATCH v4 0/2] Add support for Starmie Chromebooks
Date: Fri, 29 Nov 2024 05:57:18 +0000
Message-ID: <20241129055720.3328681-1-wmacek@chromium.org>
X-Mailer: git-send-email 2.47.0.338.g60cca15819-goog
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241128_215727_044257_13B3095F 
X-CRM114-Status: UNSURE (   9.60  )
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

Add an entry for the MT8186 based Starmie Chromebooks, also known as the
ASUS Chromebook Enterprise CM30 Detachable (CM3001). The device is
a tablet style chromebook.

Wojciech Macek (2):
  dt-bindings: arm: mediatek: Add MT8186 Starmie Chromebooks
  arm64: dts: mediatek: mt8186: Add Starmie device

 .../devicetree/bindings/arm/mediatek.yaml     |  13 +
 arch/arm64/boot/dts/mediatek/Makefile         |   2 +
 .../mediatek/mt8186-corsola-starmie-sku0.dts  |  31 ++
 .../mediatek/mt8186-corsola-starmie-sku1.dts  |  31 ++
 .../dts/mediatek/mt8186-corsola-starmie.dtsi  | 465 ++++++++++++++++++
 5 files changed, 542 insertions(+)
 create mode 100644 arch/arm64/boot/dts/mediatek/mt8186-corsola-starmie-sku0.dts
 create mode 100644 arch/arm64/boot/dts/mediatek/mt8186-corsola-starmie-sku1.dts
 create mode 100644 arch/arm64/boot/dts/mediatek/mt8186-corsola-starmie.dtsi

-- 
2.47.0.338.g60cca15819-goog


