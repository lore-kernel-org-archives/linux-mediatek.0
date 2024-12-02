Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 96378D49798
	for <linux-mediatek@archiver.kernel.org>; Mon,  2 Dec 2024 03:27:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Message-Id:Date:Subject:Cc:
	To:From:Reply-To:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=TuzgFIU7lhnnYJgWPAsmz9SQkyrksNZjuekvv2lFkOo=; b=Hrz4g6xII/wpHQIb1wSyR7Oz/i
	JtEs1nwugHuQMVN6JcaO2RELfH0ZDJ3n7RYIts/Gp0kbjG3qValfFapBaiuqL7n5WkVVs9Jmfsdrc
	hZ/BSW8IeYH3r/DVy8Iu4HPEmyl5j7F3vkmdnf+YyJNdEWNbzskAGRCYNaqyBI3wMuwLX6fRVGnCD
	CFATp3eQS8UDluXMXscappBKyS6ZC5y28br2/q8m3KS43rTqBvf/LkvQdmmmP6EB84bQcBekKu6ab
	oZ8Ea7FKHU9tLaoYWwQZVBVnkEwvbOYPO9rRfbeEm0Xw8kuSgwE9V7Guc4rpXKheG7Gv2B2t7AqwM
	RbtdfBUQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tHx5u-00000004wO4-3oIX;
	Mon, 02 Dec 2024 03:27:30 +0000
Received: from mail-pl1-x62e.google.com ([2607:f8b0:4864:20::62e])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tHwzL-00000004v0v-1efF
	for linux-mediatek@lists.infradead.org;
	Mon, 02 Dec 2024 03:20:45 +0000
Received: by mail-pl1-x62e.google.com with SMTP id d9443c01a7336-21589aa7913so189235ad.0
        for <linux-mediatek@lists.infradead.org>; Sun, 01 Dec 2024 19:20:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=huaqin-corp-partner-google-com.20230601.gappssmtp.com; s=20230601; t=1733109642; x=1733714442; darn=lists.infradead.org;
        h=message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=TuzgFIU7lhnnYJgWPAsmz9SQkyrksNZjuekvv2lFkOo=;
        b=0qc5kVm+ptKJQLTJxim8zv1/+KKjyTybb/hLq1tQM0qmHSVdNO9slh/f8pqaspWfeC
         J/QcHLsdaLmDuQSZjs8X6prYOCb7dhoKT0nHLUp7aMySZNNoEbYsJ8FxRHrOMrE1gHBy
         QkB6vHYPrK4Vu8C4rjugpaEwKOdBriDeb90seMjKjbnCN9qMZU1v8XXsRJ3naLNGpo6B
         S64ehjXwtWbVBCcQoROtzRkwimmBfnxX7QUV0oAhsMX95MbVbh0tmxrbhBuxWhvRNA9u
         6MvYo4nlu6bP5+8Y/HycxzB3eBAiy9A65SkP/WXg9zf8T2FSjLZ3xt9DsFqGI57Bdbsg
         I/EQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733109642; x=1733714442;
        h=message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=TuzgFIU7lhnnYJgWPAsmz9SQkyrksNZjuekvv2lFkOo=;
        b=rbkb8/x3yTtk4O16bZb7UESQncBGCm3Kbx5mEhqLL7kNcEqyr8+v2xur+YjkZ0d2gS
         8TVYnW/K3Yq1O8rKfqr5lEF39n5wct+8Ul/3gW/DFi49T4VOA9V86rbGT21QOh8Azkov
         0ULPqMKn0mu3mwSJMGH8CwpV0UYVERC7VjW1MeshYESpq5J5csju6CQKp7fndPJIAPik
         AN/IPLViOU2e7RsFn0wCqTscmhdVWFwp8+wpY8a6UPWKKgMNXTAj3fTYQxmpFO/xM1Ib
         rgs7hx3TxMlTnu4NkfLsAG6wQoJjcq392585OsnEnwtXQOoMHE6T4Y1yn7eUpcfUnA4E
         jR4Q==
X-Forwarded-Encrypted: i=1; AJvYcCWpPChiaOSarwVe0q0bj4hc74ojVydciUTVRejDGipJHuImrqplVnOAjD0/uhWXvbhqssCTRVp8oPzyWP5Ciw==@lists.infradead.org
X-Gm-Message-State: AOJu0YxRn3brPZFgLBu8lJNUMyj+m5g7kIdSZD1Fl97whpEefnYQoCVO
	oUgotI/hpp+adQsP9ogFUxBf1jVuzV9hpryE3O8pXEwP4v4meqSxH8mFhIvXcyw=
X-Gm-Gg: ASbGncv/IjEnO3YwHFLGK1o+NJz/UDq1nk1fWke+qUw4AGhYmiJPrB4Xeyeqj5Q+XEV
	nFa+XnxYkBSIOY/xF6VC+34S9u2ERMOcUvRus0qKqlTxH3df/bFQXvTGmIR+lrAeZIOFhGBAjLt
	Zm/V565VfqDzJ1Efil/IpGaplKBNMkomRDW4jUIunBOY6FB+4nUVAEOB5rNN1mO18RhDRMF5EKu
	QnxN/NhznfXnPxm3FL73u3TyS/5s1pYWCnStPeDlnMjXswvjJ/kCfEQ8+z3ZjsGNWipBuWyIRJF
	+wZztMVWw4f+kA==
X-Google-Smtp-Source: AGHT+IHb5nlT9jqYI8Y70WEvhybXjTpRvcrYnffGEZaJUPmJv4bqJ8BX7U0rAdMIvmdlW2JubFsgoA==
X-Received: by 2002:a17:902:d4c7:b0:215:4e57:178d with SMTP id d9443c01a7336-2154e5719e5mr55828885ad.11.1733109641988;
        Sun, 01 Dec 2024 19:20:41 -0800 (PST)
Received: from ubuntu.huaqin.com ([116.66.212.162])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-21521986004sm66305725ad.184.2024.12.01.19.20.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 01 Dec 2024 19:20:41 -0800 (PST)
From: Zhengqiao Xia <xiazhengqiao@huaqin.corp-partner.google.com>
To: robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	matthias.bgg@gmail.com,
	angelogioacchino.delregno@collabora.com,
	wenst@chromium.org,
	hsinyi@chromium.org,
	sean.wang@mediatek.com,
	dianders@google.com
Cc: devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	Zhengqiao Xia <xiazhengqiao@huaqin.corp-partner.google.com>
Subject: [PATCH v4 0/4] arm64: dts: mediatek: Add MT8186 Chinchou
Date: Mon,  2 Dec 2024 11:20:31 +0800
Message-Id: <20241202032035.29045-1-xiazhengqiao@huaqin.corp-partner.google.com>
X-Mailer: git-send-email 2.17.1
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241201_192043_703575_945491FE 
X-CRM114-Status: GOOD (  11.14  )
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

This is v4 of the MT8186 Chromebook device tree series to support
MT8186 chinchou platform. It is based on the "corsola" design.
It includes chinchou and chinchou360, including LTE, stylus,
touchscreen combinations.

Changes in v4:
- modify 'rt1019p_pins_default' to 'speaker_codec_pins_default'
- Move usbc_extcon out of typec
- Link to v3: https://patchwork.kernel.org/project/linux-arm-kernel/cover/20241021072626.15102-1-xiazhengqiao@huaqin.corp-partner.google.com/

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


