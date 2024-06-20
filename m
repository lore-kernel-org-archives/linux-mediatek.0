Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1A912C2BA18
	for <linux-mediatek@archiver.kernel.org>; Thu, 20 Jun 2024 09:47:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=JbS6t0OdeyDit4R19wkIMr1rdbV1YFpFh7032Z/OFdw=; b=Nq1RCyFRlQq5gw9lkwQdu61V4Q
	2B+w6ho+AAWTPCNn+kCcyTe7D+opdi1xjZ/GaF5aPMMY9McnfsJ2sOab6UnlWK2gpXa1ZT9b+v8/Q
	amf+c+ewurbI5hBl1TwrUQOcwjJlHFz1witO4vN+y37TaA0CPoVSYxtfHaNa+1D3i1Lh9C2iAilMq
	WrlTTZnJhVXCH4uqRwdsdkvPtF0TCQINMOV2unOzFh5STkRVdknv7ZdwumEeipxQaeZYKPIz0PJOe
	XUr/ww/CW3Gxx3ZKR9XL1KjYwBh6ol9C6txRicsRm05Uyquct7MxrdC3koarqz1UR0Xq/oz2BS9mY
	oE9mVn/g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sKEOb-00000004RqX-3IJc;
	Thu, 20 Jun 2024 09:47:57 +0000
Received: from mail-oo1-xc2a.google.com ([2607:f8b0:4864:20::c2a])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sKEOY-00000004Rp6-2I4r
	for linux-mediatek@lists.infradead.org;
	Thu, 20 Jun 2024 09:47:56 +0000
Received: by mail-oo1-xc2a.google.com with SMTP id 006d021491bc7-5ba33b08550so275719eaf.2
        for <linux-mediatek@lists.infradead.org>; Thu, 20 Jun 2024 02:47:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1718876873; x=1719481673; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=JbS6t0OdeyDit4R19wkIMr1rdbV1YFpFh7032Z/OFdw=;
        b=f8bJWJx+ZGX8fZ05nLwsmmTQ486jHgUo7lz6qOu9xx1hAFIlmt5Pud2JJz052whBdg
         zdwpFHaaiXamvxpPND1YiwaT+aw/GdEICdiPT2J+ytvdx/0cnQemiTyxsHgUJXkRH0MD
         6nkBTxsOzYol4vWnzeaHn6lwrT8ovMrmZlM28=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718876873; x=1719481673;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=JbS6t0OdeyDit4R19wkIMr1rdbV1YFpFh7032Z/OFdw=;
        b=LzD7UmTLW9W8rAo7vfvxJl4jby2zNQoRA1UpjN8cQ1nGGwUFyck5AG47jF1dAMVbgR
         QRN/TI5ur6kVSBRk4F3Nj1DNAzjpAZCXEcF5v5+Ap/V4CHiUYGpTPGA1k3JYJS0mbsDP
         KjtwN7S9RrQamuYKUbl17ZPitRkCQINmhyruzXyu+1XB4TEe8l59zDhALbRRgUkDUdqv
         HVg99b9aY5pxOWrOHqtVYShSoTCI9uIcNSDFxs+drrK+tydYWJaLA7OlWPSNBaIM1D32
         sgJWnRcLV+yDzjKdTXg3cptuhXLWno3qQ5mzxpLU/DrWy8YwKbF0iV0iFbcVzcZ9kdRm
         QpLw==
X-Forwarded-Encrypted: i=1; AJvYcCWzAuqTus2WGxdnx6kxkRG2nGcmd3LMwrhP6rqdDmbbDmfrxX+Vkn0laILuJZcOONrvEuhXRXF3KQa09w+6JB6aHuEjliwFGzttiOZ8Mi0j/++a
X-Gm-Message-State: AOJu0YwrkMDy1ULIMskK1ONxAlCUcP8edH5znNATazgZc/IJyqC699G0
	ZCvOiPWt1G2KpHiYZrlBF6fOClh1rU89BHuD3UDSY7jclUSpdH1Du9yqCRpBog==
X-Google-Smtp-Source: AGHT+IFjs9uCv20/yMoZbU/Ftof/qYHTbGsf6GsGiZo5ajKpwKplyAlUwHWHGLe5nJe1VzJUareDMQ==
X-Received: by 2002:a05:6358:6f12:b0:19f:6172:54ce with SMTP id e5c5f4694b2df-1a1fd45a713mr577519155d.17.1718876873177;
        Thu, 20 Jun 2024 02:47:53 -0700 (PDT)
Received: from wenstp920.tpe.corp.google.com ([2401:fa00:1:10:c53a:5326:7f72:759f])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-70dbae52920sm4164469a12.42.2024.06.20.02.47.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 20 Jun 2024 02:47:52 -0700 (PDT)
From: Chen-Yu Tsai <wenst@chromium.org>
To: Mark Brown <broonie@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Hsin-Hsiung Wang <hsin-hsiung.wang@mediatek.com>
Cc: Chen-Yu Tsai <wenst@chromium.org>,
	devicetree@vger.kernel.org,
	linux-mediatek@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 0/3] arm64: dts: mediatek: Add MT8186 Voltorb Chromebooks
Date: Thu, 20 Jun 2024 17:47:35 +0800
Message-ID: <20240620094746.2404753-1-wenst@chromium.org>
X-Mailer: git-send-email 2.45.2.741.gdbec12cfda-goog
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240620_024754_655459_03B2504B 
X-CRM114-Status: GOOD (  15.01  )
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

Hi folks,

This series adds support for the MT8186 Voltorb Chromebooks. This is yet
another product based on the Corsola reference design. This particular
version features a higher end spec-ed SoC, necessitating a beefier
regulator for the big core cluster.

Patch 1 adds an entry for a new regulator IC. How this differs from
the previous iteration is not totally clear.

Patch 2 adds an entry for the Voltorb devices.

Patch 3 adds the device trees for the new devices.


Please have a look. I expect either all three patches to go through the
MediaTek tree; or the first can go through the regulator tree, and the
other two through the MediaTek tree.


Thanks
ChenYu


Chen-Yu Tsai (3):
  dt-bindings: regulator: mt6315: Document MT6319 PMIC
  dt-bindings: arm: mediatek: Add MT8186 Voltorb Chromebooks
  arm64: dts: mediatek: Add MT8186 Voltorb Chromebooks

 .../devicetree/bindings/arm/mediatek.yaml     |   7 ++
 .../bindings/regulator/mt6315-regulator.yaml  |   6 +-
 arch/arm64/boot/dts/mediatek/Makefile         |   2 +
 .../mt8186-corsola-voltorb-sku589824.dts      |  13 +++
 .../mt8186-corsola-voltorb-sku589825.dts      |  25 +++++
 .../dts/mediatek/mt8186-corsola-voltorb.dtsi  | 103 ++++++++++++++++++
 6 files changed, 155 insertions(+), 1 deletion(-)
 create mode 100644 arch/arm64/boot/dts/mediatek/mt8186-corsola-voltorb-sku589824.dts
 create mode 100644 arch/arm64/boot/dts/mediatek/mt8186-corsola-voltorb-sku589825.dts
 create mode 100644 arch/arm64/boot/dts/mediatek/mt8186-corsola-voltorb.dtsi

-- 
2.45.2.741.gdbec12cfda-goog


