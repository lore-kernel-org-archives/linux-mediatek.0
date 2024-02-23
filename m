Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F1EFAC5478C
	for <linux-mediatek@archiver.kernel.org>; Fri, 23 Feb 2024 09:12:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=DXXgc5ooBuiJ0rd83JBNXgx7wSQOERYhBcUIH8zsNHg=; b=cFFVa7GZLT4+beiEPd4aRrHmud
	bq5aTQ50XLrg61xpZ0AIrfEvmr804cPIUvEuylG0wqQW2J5MGwJC5k2KM0lt1VBPtrG8ct+ur+Rqi
	sXo0I5Jjv01y9PPlBAhLErZRrFz2NZz3pL6w+a/NGzHuK2YxjDGXRzBKC4mBDdwzJH9zyMAaRS4AY
	dboJvzPj4f8xWeZh9As+52X8NAzj4WTwNhBZtKnvZR/KAohUzkeNCKgA5Mttn9nUmhl5F3ouo8Yos
	bCDUZoolgpJDtaBB+i/EfporSybPemfr7htKssOgSZ9T6aNkv6polqAfiI0Yk/bQa+YePeWSYEAwY
	GltYO/IQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rdRay-00000008cYF-2kOJ;
	Fri, 23 Feb 2024 09:11:59 +0000
Received: from mail-pg1-x529.google.com ([2607:f8b0:4864:20::529])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rdRaf-00000008cTJ-27rl
	for linux-mediatek@lists.infradead.org;
	Fri, 23 Feb 2024 09:11:38 +0000
Received: by mail-pg1-x529.google.com with SMTP id 41be03b00d2f7-53fbf2c42bfso534931a12.3
        for <linux-mediatek@lists.infradead.org>; Fri, 23 Feb 2024 01:11:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1708679486; x=1709284286; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=DXXgc5ooBuiJ0rd83JBNXgx7wSQOERYhBcUIH8zsNHg=;
        b=mJWj/eZ/ot8Vm5wDBhQwwFnd6w4RgzqL8HB8piGqSrSl6kDM5bOMi29QHABVtA+sn2
         FNRGGd8/F0w8127hogQ7t7uklboIXuctGljyEDKYGOW668fNd9IwEMgO0PrV63Kje1b2
         QrhPUg3gaIubAG+d6hAfzVcwI1jvyConpM01A=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1708679486; x=1709284286;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=DXXgc5ooBuiJ0rd83JBNXgx7wSQOERYhBcUIH8zsNHg=;
        b=vksS4ZjLTvpH+QSufsz4E4PNCmCfW53Klq+VQ/DPtWuqaXVMSoa0D1ZGJw/9mY4Dcw
         ZbNjOFPToEO983zsfNc+VQ3kUc6zUon4Tnps0ahrYEDf6sSktwRHkWsID8XuaSoMqZGJ
         0lFS3HynWgzyhOvpUXerr0Y/uakK0sevlQHZsDdx54efHQMoMqT6+YYAWYQo7PeAOaXC
         b39ntuFqu04mamOAL43HdUGxU3NaQLyUkQIruaa2GsZbK5ylnAmsPqolOhTLgyaVhdcx
         maCpLhXSiuDrRNl/XLKJPzaM68JG2Srdy0CJgzy7MQGzVcSyVaFT3c0DWCf9vogdT0/+
         l6sA==
X-Forwarded-Encrypted: i=1; AJvYcCU7Mb1UGtu7iXQogKL9K8+f09yEXEt530i/ZbAUsOLqWscfZzAQHy6SjNzDhmwsDzqEAHdCDMDEmNfFZnsualId1YkH/dd/+PBxsfVNq/LD6qDV
X-Gm-Message-State: AOJu0YzT1URYfxm8BgEHK9YZOMdvltY3sLvH8uhC7/DFdZlA9RJKtkyc
	hqgr5pixFymWIDMXlhAGbWzO2qQQmFHMysOliv3xedV8BqKVcS5D9Zw72UF+tA==
X-Google-Smtp-Source: AGHT+IFM39/h0EdoH38mYvLsCTE5nkHkOj5XRH9crL4wqF6Cl8jNvanWO7s0CrDHOhySEbflpAoyvQ==
X-Received: by 2002:a05:6a20:244e:b0:19b:673d:824d with SMTP id t14-20020a056a20244e00b0019b673d824dmr1490319pzc.46.1708679486692;
        Fri, 23 Feb 2024 01:11:26 -0800 (PST)
Received: from wenstp920.tpe.corp.google.com ([2401:fa00:1:10:e0c9:81eb:a87f:e8e7])
        by smtp.gmail.com with ESMTPSA id y15-20020a170902b48f00b001dc05535632sm7800365plr.170.2024.02.23.01.11.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 23 Feb 2024 01:11:26 -0800 (PST)
From: Chen-Yu Tsai <wenst@chromium.org>
To: Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: Ikjoon Jang <ikjn@chromium.org>,
	devicetree@vger.kernel.org,
	linux-mediatek@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Weiyi Lu <weiyi.lu@mediatek.com>,
	Enric Balletbo i Serra <enric.balletbo@collabora.com>,
	Chen-Yu Tsai <wenst@chromium.org>
Subject: [PATCH] arm64: dts: mediatek: mt8183: Add power-domains properity to mfgcfg
Date: Fri, 23 Feb 2024 17:11:21 +0800
Message-ID: <20240223091122.2430037-1-wenst@chromium.org>
X-Mailer: git-send-email 2.44.0.rc0.258.g7320e95886-goog
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240223_011134_319613_9CD5681C 
X-CRM114-Status: UNSURE (   9.45  )
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

From: Ikjoon Jang <ikjn@chromium.org>

mfgcfg clock is under MFG_ASYNC power domain.

Fixes: e526c9bc11f8 ("arm64: dts: Add Mediatek SoC MT8183 and evaluation board dts and Makefile")
Fixes: 37fb78b9aeb7 ("arm64: dts: mediatek: Add mt8183 power domains controller")
Signed-off-by: Weiyi Lu <weiyi.lu@mediatek.com>
Signed-off-by: Ikjoon Jang <ikjn@chromium.org>
Reviewed-by: Enric Balletbo i Serra <enric.balletbo@collabora.com>
Signed-off-by: Chen-Yu Tsai <wenst@chromium.org>
---
This patch is long overdue. Could we merge it for fixes for this or the
next release?

Changes since v2:
- Rebased onto current tree
- Added Fixes tags
- Fix up subject prefix

 arch/arm64/boot/dts/mediatek/mt8183.dtsi | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm64/boot/dts/mediatek/mt8183.dtsi b/arch/arm64/boot/dts/mediatek/mt8183.dtsi
index 93dfbf130231..774ae5d9143f 100644
--- a/arch/arm64/boot/dts/mediatek/mt8183.dtsi
+++ b/arch/arm64/boot/dts/mediatek/mt8183.dtsi
@@ -1637,6 +1637,7 @@ mfgcfg: syscon@13000000 {
 			compatible = "mediatek,mt8183-mfgcfg", "syscon";
 			reg = <0 0x13000000 0 0x1000>;
 			#clock-cells = <1>;
+			power-domains = <&spm MT8183_POWER_DOMAIN_MFG_ASYNC>;
 		};
 
 		gpu: gpu@13040000 {
-- 
2.44.0.rc0.258.g7320e95886-goog


