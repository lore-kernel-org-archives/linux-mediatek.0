Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6149CC001B0
	for <linux-mediatek@archiver.kernel.org>; Tue, 15 Aug 2023 15:44:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=X+b40dDlDBakx8+hTHp2ebRkg2RA++lkqQVSTeac6zA=; b=iMpZ1jhduwSpvU9mF5wsf0Rzi0
	gpwJi/16DLlQPyL/gJYTa9OSj8aFV6LDSD5AoznZPDrSlKSeAJ+1JSGy0JF//ca964Mlr/R+PEK0m
	eO1qrJ2/xQlY0zok+anAr+lAsAx32PU6f+bw4/lpelWS0WqT4sXHEjdZE5zvJTOu2FELNE3bw9obo
	Bwp4WK4GbD56F7cHuZUM3SYRF3DIWeppJNAPH+89RUjybvu39i8nIcwoJbJSQdVzwvPfeIdezl6Ku
	DVd5s3lQMdt9kLH5ZUHFIoSMpNLseS6a9J5l39vDvye4SVzQ7x1PW2GnglY6ofZkt6Hsgwc5SXzF1
	xZrxiK4A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qVwE3-001tBt-2Q;
	Tue, 15 Aug 2023 15:44:55 +0000
Received: from mail-pf1-x42f.google.com ([2607:f8b0:4864:20::42f])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qVwDz-001t8w-1P
	for linux-mediatek@lists.infradead.org;
	Tue, 15 Aug 2023 15:44:54 +0000
Received: by mail-pf1-x42f.google.com with SMTP id d2e1a72fcca58-686efb9ee0cso5269551b3a.3
        for <linux-mediatek@lists.infradead.org>; Tue, 15 Aug 2023 08:44:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1692114288; x=1692719088;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=X+b40dDlDBakx8+hTHp2ebRkg2RA++lkqQVSTeac6zA=;
        b=BtS41tzhfK7XY6exlpjzQzgARG+Ehge1+0PRdLnYhdOW6v1Bo7SJIi4QfUUoIKcI9x
         pbi2VdZOgXud1DEl9BDa7AbCo5HKvn/XKF10E4aOV81o3c7y81bD4TpDN0gxIjiW+o34
         PdoWIJpg8d/x3+RQWmBeMDtnW3My6yZM1rnx0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1692114288; x=1692719088;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=X+b40dDlDBakx8+hTHp2ebRkg2RA++lkqQVSTeac6zA=;
        b=MsbwBSIFxhOpXF+XfcCH+6Iy/dbo/lpi1YocaME/4mn8ZPFeD4FegfZrLZljabuE67
         tYjYCO1HbA+hYoRmuiMf1IWsDuF4ECsH0QMDGEb81B/8zFIqBDqCdxm4cDdQOGiSS45a
         JKgSBIcZr3g8reOIHWK+B2gh+0999jfWJC3xJ6W+i1EaBlqGP9XmH2uIgu7DpZgTDrqy
         PrLHCmFYx01rrzXQJjT2VyzMIRNApYGEAhxsmvnCxriU9aQdVXqmXmheUTOMTQwk281Z
         dGIw9QMTNwZS02Uv1mm4fPBDckzEtAS98nYgtmX+54wBEIhpfPRKnQ1Tie9SpQ8T6JBF
         JsVg==
X-Gm-Message-State: AOJu0YwjZD33CWPeHbitpfoL3/n1rm4TUobsCT9dc0TBQE4sRpNWTe/v
	g1mwdiJFHubRlDlVUko23q0XYQ==
X-Google-Smtp-Source: AGHT+IGzSeQ7P7d6hIuKp8jX5Kc6bcArFd2OV1P4lsTdQ+wIT/RytQKLIYbcjxTcDvbMf4xA8ee6oA==
X-Received: by 2002:a05:6a20:3d28:b0:134:1011:8582 with SMTP id y40-20020a056a203d2800b0013410118582mr17945878pzi.47.1692114288344;
        Tue, 15 Aug 2023 08:44:48 -0700 (PDT)
Received: from hsinyi-z840.tpe.corp.google.com ([2401:fa00:1:10:40cf:3807:f8c8:2d76])
        by smtp.gmail.com with ESMTPSA id n13-20020aa78a4d000000b0065e154bac6dsm9431247pfa.133.2023.08.15.08.44.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 15 Aug 2023 08:44:47 -0700 (PDT)
From: Hsin-Yi Wang <hsinyi@chromium.org>
To: Tudor Ambarus <tudor.ambarus@linaro.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	Bjorn Andersson <andersson@kernel.org>
Cc: Pratyush Yadav <pratyush@kernel.org>,
	Michael Walle <michael@walle.cc>,
	"Miquel Raynal )" <miquel.raynal@bootlin.com>,
	"Richard Weinberger )" <richard@nod.at>,
	"Vignesh Raghavendra )" <vigneshr@ti.com>,
	Rob Herring <robh+dt@kernel.org>,
	linux-mtd@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	cros-qcom-dts-watchers@chromium.org,
	Andy Gross <agross@kernel.org>,
	Konrad Dybcio <konrad.dybcio@linaro.org>
Subject: [PATCH 0/4] Add a property to override the quad mode
Date: Tue, 15 Aug 2023 23:31:51 +0800
Message-ID: <20230815154412.713846-1-hsinyi@chromium.org>
X-Mailer: git-send-email 2.41.0.694.ge786442a9b-goog
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230815_084451_473860_39C784FE 
X-CRM114-Status: GOOD (  10.83  )
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

On gigadevice gd25lq64c, the quad mode is enabled after BFPT is parsed.
According to datasheet[1], Quad enable (QE) bit needs to be set to 0 to
use write protection (WP) pin. It also recommends setting default value of
QE to 0 to avoid a potential short issue.

Add a disable-quad-mode property in devicetree that platform can use it to
override the quad mode status parsed from BFPT to use write protection.

[1]
https://www.elm-tech.com/ja/products/spi-flash-memory/gd25lq64/gd25lq64.pdf
page 13

Hsin-Yi Wang (4):
  dt-bindings: mtd: jedec,spi-nor: Add disable-quad-mode property
  mtd: spi-nor: sfdp: read disable-quad-mode property
  arm64: dts: mediatek: mt8183: disable quad mode for spi nor
  arm64: dts: qcom: sc7180: disable quad mode for spi nor

 Documentation/devicetree/bindings/mtd/jedec,spi-nor.yaml | 7 +++++++
 arch/arm64/boot/dts/mediatek/mt8183-kukui.dtsi           | 1 +
 arch/arm64/boot/dts/qcom/sc7180-trogdor.dtsi             | 1 +
 drivers/mtd/spi-nor/core.c                               | 5 +++++
 drivers/mtd/spi-nor/core.h                               | 1 +
 drivers/mtd/spi-nor/debugfs.c                            | 1 +
 6 files changed, 16 insertions(+)

-- 
2.41.0.694.ge786442a9b-goog


