Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 596C9C531EA
	for <linux-mediatek@archiver.kernel.org>; Thu, 19 Feb 2026 22:56:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-Id:Date:Subject:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=WfGnMtYSvSKtoJnZqrv9UGQYGmLqGwp6t5dpvCm2nwQ=; b=Wkw2WB40g89jK4
	piBt0OiTNbxSGXGuiR86Ec8h7dEnCMkK7d88n9D0GtCxB8okTjrtEhP9hJXBn9ODNL9v1fb8d6Dg0
	rUyRYR0UMqkVfIGagjwM797/uCjd5ya+qK4yFxlvnlTb9S7yu7gFLNdvA4wK7XgMrTAI8pci+egsz
	/szze9CgfxYh8GKFdDL5wtiM3I99lPGUpMvfTIlHm6ixw/AWRwRPfQKL0X68aZbov0vvUwn+iUhz7
	it38SEvP7YGE45xCtvfAxbuE/7c0emy2fKyTXBgwFh+oVhtSCUrT/D1dI9wWw4SA26I4p7jyj37wi
	dUFqroyz89K2mclMyt/g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vtCwC-0000000CEQn-2Kgq;
	Thu, 19 Feb 2026 22:56:00 +0000
Received: from mail-ot1-x332.google.com ([2607:f8b0:4864:20::332])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vtCw7-0000000CEHI-284t
	for linux-mediatek@lists.infradead.org;
	Thu, 19 Feb 2026 22:55:58 +0000
Received: by mail-ot1-x332.google.com with SMTP id 46e09a7af769-7d18d0e6d71so990351a34.1
        for <linux-mediatek@lists.infradead.org>; Thu, 19 Feb 2026 14:55:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1771541754; x=1772146554; darn=lists.infradead.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=WfGnMtYSvSKtoJnZqrv9UGQYGmLqGwp6t5dpvCm2nwQ=;
        b=P+irXaP+sFF9ev5+IDdHI/cqcOzlRWAk4LhHYrLfQ3dOSNvXRDUDVxOzEWaC+i446G
         htDDP3Tf+JZEXITGx7zXqUZ46NmTrYHdKNVgF8y8lR44znzGVh4mPZMFxOhxOFX7qoxW
         rBW6/B3KHCt5t/J2HZ+CmObkH+qMPKBp5gGxDmA5xRgCdmnvQxnti1yeqKayO0jW+x+s
         FUKM2lljACEM92eXMPf5Bk4w2RgUkbm4s9FiZ0d1BtopIGE7gBGLWFqYb2+tkZz0PQ7E
         8mM78+hEa4k7RWGFG3BdUr+IgajdLfxkTr3B85MsvlE9yLFHcFotn39h+vb0mwPLpsjI
         OsDg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771541754; x=1772146554;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=WfGnMtYSvSKtoJnZqrv9UGQYGmLqGwp6t5dpvCm2nwQ=;
        b=d85SKAeOxbpMG6D6n0OtxLbK1bTEYZPxlxj+LqLTPtfuAErJiHByanTLMKfm6uGwmS
         KMyL6FZJWjyMwtOtPBzXIcBoA58c7q162mvw7a/z4j5iEWiUSvgdfd0xvsBbBibTOq/7
         g9yVTBh9SnQmN+or3Dmg7gsLFrzEA+pZexkEINKXy8VkFmspy9xN81/3ten2nRVwQ9zz
         5EefQF1rJEMe7QGqYlBcOUQ4sOSR4QPxFEMX2LgsrPfNVZZ/ZCihIC9mjDRwfaA1Xeaq
         Z7JQ4W5FKoirvkgxjWllEDpvDv8H46JvaYGgw9qs7evMaZ/zpzdaKbf1OerCAa7BfPNX
         2V9Q==
X-Forwarded-Encrypted: i=1; AJvYcCWomS62GpNBKZA5p8s6uO1Uwz75atd1xtXQwsVYWZuIyNG8QCELgVt7AKbc3PfKNzplbsEziLer6Y6XhmHTAg==@lists.infradead.org
X-Gm-Message-State: AOJu0Yxua+Cy+7dav4+8E5d0T8xw9rULmSuQUM8HpQQxIN4Jk2uP3HtQ
	7P2LZWtXC1zvb6+VnSSp/FV+ehWXQgZf/3fUYhtlcv5U1nVgU1uZHaolAJQTnVJdn24=
X-Gm-Gg: AZuq6aJ3uz3/62aZWPonKpJPbIsFraa/xYC3vNC85oYB01hrCsymEDJXATQHQllur95
	+Eb1GuNiUUVMOcIsZlG6nWpJgkfXMUGK6S7gzXzfXDC7ZsVyLblCdF/31IWhG2iPlJgmIBxFA+D
	G/G3NPCIiC7HTibYy3pg3+1iovraELbUIGSiD0HEucMOmMW1/FEFmNGawR14ccBiv2F3tmCEK/t
	mpvuBOLLwfnbaVa9rFdOO77sxDR8m9foqoU7Qjer14xgUEP0+MD5M4CPqwjg1vdE6pH6r9Sb3cs
	1fkfVEJ+sOoqOfOqnSIh6ydQXgMHw9jnSDVvOxHLbrZLCQ4FxIQagSvp6ugRGwJPQrlMrpiFJR5
	PuX3CqX44Sn1QrDYbjLSbaWKglS//vIpOs6+L0KGOBFqEdA9A4vJt54jqPyZaWjl/i0dp8juD9O
	K6ZXixyrGKLb5y8jWhYeiHmlmMDw==
X-Received: by 2002:a05:6830:67f3:b0:7cf:f7c1:d9ac with SMTP id 46e09a7af769-7d4d0acc297mr12600516a34.9.1771541754355;
        Thu, 19 Feb 2026 14:55:54 -0800 (PST)
Received: from [127.0.1.1] ([2600:8803:e7e4:500:d4c1:bce:26a1:c903])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-7d4a7720a95sm20565585a34.29.2026.02.19.14.55.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 19 Feb 2026 14:55:53 -0800 (PST)
From: David Lechner <dlechner@baylibre.com>
Subject: [PATCH 0/2] arm64: dts: mediatek: mt6359: give regulators unique
 names
Date: Thu, 19 Feb 2026 16:55:28 -0600
Message-Id: <20260219-mtk-mt6359-fix-regulator-names-v1-0-ee0fcebfe1d9@baylibre.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/x2NQQqDMBBFryKzdkAjpsSrFBchmaRDNZaJloJ4d
 4cu3uLB4/8TKglThak5QejLlbei0rcNhJcvmZCjOpjO2M70Dtf9rdhhdJj4h0L5WPy+CRa/UsV
 A3sQYrHukAXTkI6TZ/+A5X9cNZXdb9XAAAAA=
X-Change-ID: 20260219-mtk-mt6359-fix-regulator-names-cea2ddc697f3
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, 
 Hsin-Hsiung Wang <hsin-hsiung.wang@mediatek.com>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, 
 David Lechner <dlechner@baylibre.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=1054; i=dlechner@baylibre.com;
 h=from:subject:message-id; bh=hJfG4u45vdCvSUtHigkyFONhukFUc6nMEAYruquPqJg=;
 b=owEBbQGS/pANAwAKAcLMIAH/AY/AAcsmYgBpl5TlJcv80s/C/Okoq3TlYmeApRt7FhXmVQch/
 AycgWxpsYeJATMEAAEKAB0WIQTsGNmeYg6D1pzYaJjCzCAB/wGPwAUCaZeU5QAKCRDCzCAB/wGP
 wHH1B/9qHLMxyOde09UGuNhGJ6MzrXJAsPOna4RlNdG4C50Su876Rz/GwXwUTF0CJuuDACjekAV
 rhgitrHiyMuaC2PWeIZIsG5XCwzAdy9iOzpV3Yl2DnpQtoP9APz8vCc64YeSl5zgs9ljCEtKGVw
 w5l56Prt46rL8oLShOp5diD+BNQlQPvSKe+JwwT7MaZ9Zl2rspSDzvPTVst4pWw28ysshT4xvL+
 rgCn6SMFnn8L7/a1gumT2tbdPVgCod8Q1zWgiBg063uQwi8UQitgQM0AE8siYN+kE0BABZn8AFU
 nKPHGoyxCym8Bikoh9aePjwcvL+qTiicPPNYKwLWFTqCHibP
X-Developer-Key: i=dlechner@baylibre.com; a=openpgp;
 fpr=8A73D82A6A1F509907F373881F8AF88C82F77C03
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260219_145555_803647_72F521AE 
X-CRM114-Status: GOOD (  10.73  )
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

While working on this regulator in U-Boot, I noticed that the regulator
names were not unique. This is considered an error in U-Boot and we get
the following error messages:

mt6359_regulator ldo_vrfck_1: 'regulator-name' has nonunique value: 'vrfck
mt6359_regulator ldo_vemc_1: 'regulator-name' has nonunique value: 'vemc

To fix, we add the _1 suffix regulator-name devicetree property to match
the same pattern seen in the node names.

Signed-off-by: David Lechner <dlechner@baylibre.com>
---
David Lechner (2):
      arm64: dts: mediatek: mt6359: give regulators unique names
      dt-bindings: regulator: mt6359: make regulator names unique

 Documentation/devicetree/bindings/regulator/mt6359-regulator.yaml | 4 ++--
 arch/arm64/boot/dts/mediatek/mt6359.dtsi                          | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)
---
base-commit: 44982d352c33767cd8d19f8044e7e1161a587ff7
change-id: 20260219-mtk-mt6359-fix-regulator-names-cea2ddc697f3

Best regards,
-- 
David Lechner <dlechner@baylibre.com>


