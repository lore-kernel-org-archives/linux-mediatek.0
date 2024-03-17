Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C8CB7C54E60
	for <linux-mediatek@archiver.kernel.org>; Sun, 17 Mar 2024 22:32:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=oKqhZPN7QFsjLPpu788l1fzAnbgMEFuSuh/7MopxlUQ=; b=BA2BT8/qMjKsOWTQv10r5oKeE5
	pVSWTDMcgg48ljY6gnSaQbbKq7v7muzdiN7hr//ch2kk7WNopz3VYrU+eCQ6fD3U8EUuftHG3QeT9
	txJQ2I0Wlvd3RkAXen9/fkTVIuqjojYwagWdXPZpkfeiD2Gq7xTYWXGYWKVOmXxqHlZMn42ARr7k2
	9KWe5lgytqD6Z6PnwPYS1H4Ug5x22lsah+qfSzO7r6xsU0WB3rt4DHSir8MlA6Hy18If2aHdVlPT/
	wDayXwh63vQXjSj0b47shpnFIGNS6PRaoE3kM/67kqi7GPJUNF+W5YCyqyLiUKJ3+G+WrwGOhmnX4
	t26yzCig==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rlz3G-00000006eUR-1Qjl;
	Sun, 17 Mar 2024 22:32:22 +0000
Received: from mail-lf1-x12e.google.com ([2a00:1450:4864:20::12e])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rlz3B-00000006eSe-2oWZ;
	Sun, 17 Mar 2024 22:32:19 +0000
Received: by mail-lf1-x12e.google.com with SMTP id 2adb3069b0e04-513e134f73aso978785e87.2;
        Sun, 17 Mar 2024 15:32:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1710714734; x=1711319534; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=oKqhZPN7QFsjLPpu788l1fzAnbgMEFuSuh/7MopxlUQ=;
        b=k4u2pkQiky4f7pqfwTttiMu9/z7b3CDDDOPPL804hg+u3jPpcwqLpmw4XYy+3vi+hj
         KPVSL/A5Tz9VLxEOlFQrMj1qFbQDMh9Kqg08ULPvT3mSLZPeCyzAGsimDqsSLtJlBiIy
         opkoKyEiFBlPAY/mwd95pQDdpHUX0tnb25vURmzOwWPPWANPrRF8m9VAMpEvw1M9pqWv
         FP0tsnfmvI//b5wtTl2yNzsnqXA98r1FIjZM+qlbaxk/XBsyLZj3t9SgRJlE8zMgoQ/e
         4aGRtZozWR8E5nGoF2LvP9MQAAqrV2Zc+JQGrIzW6eQIP9OaWG4lan9568QDvOBQE9MV
         iAOA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1710714734; x=1711319534;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=oKqhZPN7QFsjLPpu788l1fzAnbgMEFuSuh/7MopxlUQ=;
        b=cbfmsJH2uAibQXPLgfilvgpQfIfs+lpU0GZ/Qemk5HTwDgNH/d9HFs3BxAXACf/aMu
         vgR9ZwRojoX67X1Cecoctgpwb77NbPwawhIyNVB7yiv5sgQi69tAheaCQBXmrJ/5zQUY
         CAjijfDYiS8cZvCWa56q+QTibkVG2FdaBt47US46A16X1HygNGkh9ZeyOBjGfaLKB1DN
         kbI15in4K8ied2OX16beNt5YK5+Z3vf4x7V7PomkiVZEmsecxELqLb2DMnpAJeDEA865
         UMyWT2qEFdeNOuWyUYT9iL+Ebhv7/T2QEoCAR2NAfADsxEv/14Gad9uLDMFagVlOLGKQ
         MRJA==
X-Forwarded-Encrypted: i=1; AJvYcCUmWZhEGdx4eplT2bt4KZRoP6kcYWEG0YeScTP11rbVPWi+ixZ7b7QGfZ1vIUcJXgRYEFwpPTCNa4WGjS++hSm9NsrSK3JQ4pi6KtEJhqeMQGGPJX6MLFpivzrbMTxb2sQlqe+BOtD9eobhuJjpHvd/R1DeZY/30UQ=
X-Gm-Message-State: AOJu0Yx4nRy8wLXAf803a2z14HMCloFVYy9XJ48+jJxqjyEuJjQN4dUQ
	84SxBTV7ODRy6/Woeb7fo0+C3hLocDj1HSAgQq8Sxdf+yHUa1Ben
X-Google-Smtp-Source: AGHT+IGvZEXFQaZKOHgdv2XVxCJllpvk4dkQNQ0UD5UIfOjg4y1XaxXieT6UplycgUuKdWjVFnhkcA==
X-Received: by 2002:a19:3850:0:b0:513:c757:33d9 with SMTP id d16-20020a193850000000b00513c75733d9mr7114305lfj.53.1710714734438;
        Sun, 17 Mar 2024 15:32:14 -0700 (PDT)
Received: from localhost.lan (031011218106.poznan.vectranet.pl. [31.11.218.106])
        by smtp.gmail.com with ESMTPSA id x5-20020ac259c5000000b0051322c11100sm1366981lfn.221.2024.03.17.15.32.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 17 Mar 2024 15:32:13 -0700 (PDT)
From: =?UTF-8?q?Rafa=C5=82=20Mi=C5=82ecki?= <zajec5@gmail.com>
To: Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>
Cc: Chen-Yu Tsai <wenst@chromium.org>,
	Hsin-Yi Wang <hsinyi@chromium.org>,
	=?UTF-8?q?N=C3=ADcolas=20F=20=2E=20R=20=2E=20A=20=2E=20Prado?= <nfraprado@collabora.com>,
	Heiko Stuebner <heiko.stuebner@cherry.de>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Chris Morgan <macromorgan@hotmail.com>,
	Linus Walleij <linus.walleij@linaro.org>,
	Sean Wang <sean.wang@mediatek.com>,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	=?UTF-8?q?Rafa=C5=82=20Mi=C5=82ecki?= <rafal@milecki.pl>
Subject: [PATCH V3 0/4] dts: mediatek: add Cudy WR3000 V1 wireless router
Date: Sun, 17 Mar 2024 23:32:02 +0100
Message-Id: <20240317223206.22033-1-zajec5@gmail.com>
X-Mailer: git-send-email 2.35.3
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240317_153217_738546_F617E72C 
X-CRM114-Status: UNSURE (   9.35  )
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

From: Rafał Miłecki <rafal@milecki.pl>

Cudy WR3000 V1 is a MediaTek Filogic 820 based 802.11ax wireless router.

https://www.cudy.com/productinfo/1637722.html

Rafał Miłecki (4):
  dt-bindings: vendor-prefixes: add Cudy
  dt-bindings: arm64: dts: mediatek: Add Cudy WR3000 V1 router
  arm64: dts: mediatek: mt7981: add pinctrl
  arm64: dts: mediatek: Add Cudy WR3000 V1

 .../devicetree/bindings/arm/mediatek.yaml     |  1 +
 .../devicetree/bindings/vendor-prefixes.yaml  |  2 +
 arch/arm64/boot/dts/mediatek/Makefile         |  1 +
 .../dts/mediatek/mt7981b-cudy-wr3000-v1.dts   | 74 +++++++++++++++++++
 arch/arm64/boot/dts/mediatek/mt7981b.dtsi     | 22 ++++++
 5 files changed, 100 insertions(+)
 create mode 100644 arch/arm64/boot/dts/mediatek/mt7981b-cudy-wr3000-v1.dts

-- 
2.35.3


