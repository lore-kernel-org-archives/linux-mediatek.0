Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5541CD0E6CF
	for <linux-mediatek@archiver.kernel.org>; Mon, 21 Oct 2024 08:45:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Message-Id:Date:Subject:Cc:
	To:From:Reply-To:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=4RuLV+gJE30OXtNyG+M95n2ScV6KSGMzKjcPSGYqH7I=; b=D3FmSXlx5VGteZfBgDYMWQm6qI
	+nJGsPX+p1TUW3ykKNGcNCwdLuB2NA5vB4Fd/HZMk3dYPobM+vWQa3rANnpoEyp28rWxRsFo3CGyo
	wh1RyGzFjuay7v89aCaE5DSc8aEC2Wx/0B54nNHkSUzz1cD1OI7CbCsENgVdRadpfBJMnNcBsal3/
	8zdsHklxgiCLr+tpYFCeXBgHryFZv7CGvlYjo8OWD6B54ZA/FNKLtgo6MHo+/h+h8+wukse7zQIq3
	NdomERcfySQYEmAUqgxJqRWAvkBq7xdVo81aAyBaSl1niEtJET4i8pN5q807rrOSbig3+90zZay+y
	2ljvIhEg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t2o2X-00000006bGG-3abh;
	Mon, 21 Oct 2024 08:45:26 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t2mp4-00000006NEo-1LL4
	for linux-mediatek@bombadil.infradead.org;
	Mon, 21 Oct 2024 07:27:26 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Message-Id:Date:Subject:Cc:To:From:
	Sender:Reply-To:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:In-Reply-To:References;
	bh=4RuLV+gJE30OXtNyG+M95n2ScV6KSGMzKjcPSGYqH7I=; b=bRR/cQWLXgmwxAsysozN/Qd20I
	4wTuiL+8lbmsfmTmAreRUBEQY0+X/bOskq+B9qd+VIL8PDKgO87l3Eh7y1S/87HbAO7ZYhLI9aTcL
	0hC6Xky2lnRoZLvYyCKmYKFmw7Ifm8hvAoqJ55gw6VSg6Zd9iz26/r6VP6xnmykf5we/T9RkcSDbn
	4bupEj9Bx1fK4ErxvA7GHaKl0WBzbR6HZYE0NP3rbQn4VaGqlV5nEciaDOvQ67d5KQ0+YECZyMc4K
	06+8MIP/+6jF98LLDQCr5X7gGg3IHuDP5D5mdu/upP08EwHoRShEVktY3pymcAbLEF8FUS0KkbPk+
	hbVIZTqw==;
Received: from mail-pj1-x102a.google.com ([2607:f8b0:4864:20::102a])
	by desiato.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t2moz-00000007qdD-3rMI
	for linux-mediatek@lists.infradead.org;
	Mon, 21 Oct 2024 07:27:25 +0000
Received: by mail-pj1-x102a.google.com with SMTP id 98e67ed59e1d1-2e2e31aacbbso647126a91.2
        for <linux-mediatek@lists.infradead.org>; Mon, 21 Oct 2024 00:27:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=huaqin-corp-partner-google-com.20230601.gappssmtp.com; s=20230601; t=1729495638; x=1730100438; darn=lists.infradead.org;
        h=message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=4RuLV+gJE30OXtNyG+M95n2ScV6KSGMzKjcPSGYqH7I=;
        b=jruwE1KpLeECeXqsr+O/fuL0WcRiM3c0wJMRTwwvZBGNOOgcYKq2i+YnB5fkZtcczf
         tHOIa5h8m+cVCDMnnqPHaOABi2xqABGY4R4ub3yOtQpMEHpsbQxM+QUpoa1LtsZmFnj3
         er2zh/9IbT4kO6Fs0ZaYDRRBI64qFVy5w6Eh1oktUi4XzCKQVcGGw0PbODW0ixqcfjFA
         nMGcCwrRLPUomN3W3yA5H0DvZRnDAalNL/mDN60NVGL0h9jPL6O2SbyJdXO5LPqukejp
         nOmRbbbtJIq/ELWPFNFmnVIkUAuuQpq7P8A/ARNTwdcOzivChYRzeQwn4cmqZ5HCLNE9
         CPvA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729495638; x=1730100438;
        h=message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=4RuLV+gJE30OXtNyG+M95n2ScV6KSGMzKjcPSGYqH7I=;
        b=Xte8QIJVJgmJS90qo8SnyluhIlpuViY6OSzqt6LBc9S3JHjK0qd/uwWEHAf3HZw9oq
         bz3+fyt8cVGmMexbukiRZr1WGhUtW/l/iZ9H57VxmFuxqXntXd2PCmjHFhN6U9FGltKc
         Nler7qdqA5hWy3zNabqa1/NLBBloxD6TCix65CG1GUEjJfdTJWwKKY3kYxuHdHWxCWsy
         MUcOauZr4Yg5I492OKLNB1yo/jnFn8XlVn+jJuLbpUEQaTeKSPgSBCiIcwJ6lW/V1JDM
         p4xzMVTo+ITTQVE7XSQi+/+4LKwoKInQWgsD1HsLJl2vr+/SSuLhkPf6GqXMe+a+cDgK
         YXOQ==
X-Forwarded-Encrypted: i=1; AJvYcCWOxFUU1UOMiEyI34i59VyiOyCb2ktfAHwkq2w/5slRCo6pG6LhIRNYZ3hQ7hamqm+glKo4bo5nuziD/08Jlw==@lists.infradead.org
X-Gm-Message-State: AOJu0YwtpJGsMXg9OYVFGWbUcNKBHegQzshPfjVAw0GXl6RYGgvH8dne
	KieC1pVlAh03LzRhCUY6klUvk1RtN1vcnpmF+Do5txF0mPWSlpimzAjkWvKuwHY=
X-Google-Smtp-Source: AGHT+IFpx0iTKEAwT3WlvkO5e1PC1FRTIM+OU/OYf9CVrGfExwAKk4Zt8qzMrBocxp4f1FZgpGEoUQ==
X-Received: by 2002:a17:902:da8f:b0:20c:9285:e951 with SMTP id d9443c01a7336-20e5a71b46dmr62711105ad.3.1729495637905;
        Mon, 21 Oct 2024 00:27:17 -0700 (PDT)
Received: from ubuntu.huaqin.com ([116.66.212.162])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-20e7f0db2desm19749595ad.203.2024.10.21.00.27.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 21 Oct 2024 00:27:17 -0700 (PDT)
From: Zhengqiao Xia <xiazhengqiao@huaqin.corp-partner.google.com>
To: robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	matthias.bgg@gmail.com,
	angelogioacchino.delregno@collabora.com,
	wenst@chromium.org,
	hsinyi@chromium.org,
	sean.wang@mediatek.com
Cc: devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	Zhengqiao Xia <xiazhengqiao@huaqin.corp-partner.google.com>
Subject: [PATCH v3 RESEND 0/4] arm64: dts: mediatek: Add MT8186 Chinchou
Date: Mon, 21 Oct 2024 15:26:22 +0800
Message-Id: <20241021072626.15102-1-xiazhengqiao@huaqin.corp-partner.google.com>
X-Mailer: git-send-email 2.17.1
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241021_082722_190047_465C37D1 
X-CRM114-Status: GOOD (  11.61  )
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

This is v3 of the MT8186 Chromebook device tree series to support
MT8186 chinchou platform. It is based on the "corsola" design.
It includes chinchou and chinchou360, including LTE, stylus,
touchscreen combinations.

Changes in v3:
- Add a patch to change codec in pmic (in mt8186-corsola.dtsi) to audio-codec
- Link to v2: https://lore.kernel.org/all/20241018091135.17075-1-xiazhengqiao@huaqin.corp-partner.google.com/

Changes in v2:
- Modify location of "const: google,chinchou-sku17" in mediatek.yaml
- rename "pin-report" to "pin-report-pins"
- add "vcc33-supply" and "vcc33-supply" 
- rename "cbj-sleeve-gpio" to "cbj-sleeve-gpios"
- modify subnode of sound 
- Link to v1: https://lore.kernel.org/all/172900161180.733089.8963543745385219831.robh@kernel.org/

Zhengqiao Xia (4):
  dt-bindings: arm: mediatek: Add MT8186 Chinchou Chromebook
  arm64: dts: mediatek: Add MT8186 Chinchou Chromebooks
  arm64: dts: mediatek: Add exton node for DP bridge
  arm64: dts: mediatek: Modify audio codec name for pmic

 .../devicetree/bindings/arm/mediatek.yaml     |  28 ++
 arch/arm64/boot/dts/mediatek/Makefile         |   3 +
 .../mediatek/mt8186-corsola-chinchou-sku0.dts |  18 +
 .../mediatek/mt8186-corsola-chinchou-sku1.dts |  35 ++
 .../mt8186-corsola-chinchou-sku16.dts         |  29 ++
 .../dts/mediatek/mt8186-corsola-chinchou.dtsi | 321 ++++++++++++++++++
 .../boot/dts/mediatek/mt8186-corsola.dtsi     |   8 +-
 7 files changed, 441 insertions(+), 1 deletion(-)
 create mode 100644 arch/arm64/boot/dts/mediatek/mt8186-corsola-chinchou-sku0.dts
 create mode 100644 arch/arm64/boot/dts/mediatek/mt8186-corsola-chinchou-sku1.dts
 create mode 100644 arch/arm64/boot/dts/mediatek/mt8186-corsola-chinchou-sku16.dts
 create mode 100644 arch/arm64/boot/dts/mediatek/mt8186-corsola-chinchou.dtsi

-- 
2.17.1


