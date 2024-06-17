Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C8B12C2BA18
	for <linux-mediatek@archiver.kernel.org>; Mon, 17 Jun 2024 09:47:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=pYR8nPowvx0FVmVRxf+D8yDNGq/8/7xaLOVhmi9JDr8=; b=g/mI6gIMG0AyHOc0yVJjMeEGcG
	CJ/7DvITRTrSrylHd75GVMkuFmUGIAQdrr3Q9xciqKb5J+x1HmGQ1gonhURPhmB3MzUKVHpdlOEAX
	V9tGDOWi7fVTosSVRKZRkbn1nySRLON8jfPEaAdbVRw5TkWO5rPtZ3AVj+b8bjHQWLmfV2qJVu6WB
	Zg9OJGuuxg1k/z2VEV+Yad9oUcCWgx0RWZNzK2+NVj9xHpUXF7qZy0TKQ9L+uJN3fFefholBPV/NR
	sbtTZyN4aLyh3RQMx9MS6w48EN/ZUaoedfLkfNcdabot+lJ9btRHv2lbS9rZK1exgu3uw47EAxx5V
	G8FBdUSQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sJ8x5-0000000A7Yt-1YMy;
	Mon, 17 Jun 2024 09:47:03 +0000
Received: from mail-ed1-x536.google.com ([2a00:1450:4864:20::536])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sJ8ww-0000000A7Ue-1aRI;
	Mon, 17 Jun 2024 09:46:56 +0000
Received: by mail-ed1-x536.google.com with SMTP id 4fb4d7f45d1cf-57a30dbdb7fso7088415a12.3;
        Mon, 17 Jun 2024 02:46:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1718617611; x=1719222411; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=pYR8nPowvx0FVmVRxf+D8yDNGq/8/7xaLOVhmi9JDr8=;
        b=nL/GiFJvQ52Pz365cSYWp9m/El1RUCDizisGVlf4CszeNY1ajwpKVWrSiW2klGPhRF
         ukjA2aSKTjKCW+8SR+1Bnbk29J3wOVoxSqlUh11tzsFLAr/NNW8V87XOPKGYjI0AOy1g
         DTjrH9ka6K7MYUQ6ieIhkIP6ORfxwD63oWlLpgKtUvRcMdYD/w+hne/WlxR0zqGqTbdO
         snXDvUGf6koEBOo6R51H/npNrTnq5p04jQ5r9HufvMaxewq5dZAbeG4ydRfNY6boRocR
         GW8fSdSa+xnRwPMwkfyz/BB0bLBdRKUAS+lendJK1f4FPKDa89kJIEJljY/Db78rGFRp
         t1zg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718617611; x=1719222411;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=pYR8nPowvx0FVmVRxf+D8yDNGq/8/7xaLOVhmi9JDr8=;
        b=Iy/vpuXxYrlgLjnBSDdKwUmuzY7nByODo19qssIhJgeIrREFJ9VlbGNXQY5wL7jkCc
         Qn+UqiEbVS9b/Jchw13NH70vbNDqUyNwmm0/688t9zyL4eGeD6DTE6l2HOGGNdV/x7EL
         mD78FsH0jdIi1BHGM50AV5jUGkf4N4mMMNy9rgoQdYNOTVuKq7crAEZsfTOf53uMWsP0
         kI2LyoZC2OMTmlEmmISPOGYUR7AbzfIEEf6u+6GZpdgOq/12q89ypSl/lgokGp42vvac
         CEA/3jkjh05ZzXEpIXVpTRPa7S+bVOsjoq8RyxvnkophgEt8vNoLTy8BDfFhll11Pf3c
         9mzQ==
X-Forwarded-Encrypted: i=1; AJvYcCUEl3U/GuQp1M2meah0y7YPY9TQB994huXepj5FKBZJqmUHTjMEs4VOMVCTRYoCR4NkKzasfB3CEENqhd9Q+Tw3H8+PPnBBvHDAw0qiq1k6jZNr6R7GLjb0Jev4sCQnyjEtIUgs4rYv+yKONB77/Ii5DYqB7WWDAnE=
X-Gm-Message-State: AOJu0Yx/+WuQPdul/F08hD90Tnz7E1q1h7RL18rthP1GTzBSGfz+0SzW
	hg02ONg1l9Yi8ypo9OeP/WSXxVTDrkxDAGRvqU48pSJ6uCYHjIiU8D16Eg==
X-Google-Smtp-Source: AGHT+IGNBqfbEy7gtwzJveWmAq6LUwMFqf1e5/wf22AKAgwzgLy8euB9aKLPKh5PbgSi9eNou4NOZw==
X-Received: by 2002:a50:8a97:0:b0:572:7bda:1709 with SMTP id 4fb4d7f45d1cf-57cbd649655mr6027283a12.9.1718617610447;
        Mon, 17 Jun 2024 02:46:50 -0700 (PDT)
Received: from localhost.lan (031011218106.poznan.vectranet.pl. [31.11.218.106])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-57cb72da790sm6141318a12.35.2024.06.17.02.46.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 17 Jun 2024 02:46:50 -0700 (PDT)
From: =?UTF-8?q?Rafa=C5=82=20Mi=C5=82ecki?= <zajec5@gmail.com>
To: Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>
Cc: Sean Wang <sean.wang@mediatek.com>,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	=?UTF-8?q?Rafa=C5=82=20Mi=C5=82ecki?= <rafal@milecki.pl>
Subject: [PATCH 2/2] ARM: dts: mediatek: mt7623: fix efuse fallback compatible
Date: Mon, 17 Jun 2024 11:46:34 +0200
Message-Id: <20240617094634.23173-2-zajec5@gmail.com>
X-Mailer: git-send-email 2.35.3
In-Reply-To: <20240617094634.23173-1-zajec5@gmail.com>
References: <20240617094634.23173-1-zajec5@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240617_024654_472745_8FE1652C 
X-CRM114-Status: GOOD (  12.25  )
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

Fix following validation error:
arch/arm/boot/dts/mediatek/mt7623a-rfb-emmc.dtb: efuse@10206000: compatible: 'oneOf' conditional failed, one must be fixed:
        ['mediatek,mt7623-efuse', 'mediatek,mt8173-efuse'] is too long
        'mediatek,mt8173-efuse' was expected
        'mediatek,efuse' was expected
        from schema $id: http://devicetree.org/schemas/nvmem/mediatek,efuse.yaml#
arch/arm/boot/dts/mediatek/mt7623a-rfb-emmc.dtb: efuse@10206000: Unevaluated properties are not allowed ('compatible' was unexpected)
        from schema $id: http://devicetree.org/schemas/nvmem/mediatek,efuse.yaml#

Fixes: 43c7a91b4b3a ("arm: dts: mt7623: add efuse nodes to the mt7623.dtsi file")
Signed-off-by: Rafał Miłecki <rafal@milecki.pl>
---
 arch/arm/boot/dts/mediatek/mt7623.dtsi | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm/boot/dts/mediatek/mt7623.dtsi b/arch/arm/boot/dts/mediatek/mt7623.dtsi
index 9c5a52ce9351..748f9b366897 100644
--- a/arch/arm/boot/dts/mediatek/mt7623.dtsi
+++ b/arch/arm/boot/dts/mediatek/mt7623.dtsi
@@ -328,7 +328,7 @@ sysirq: interrupt-controller@10200100 {
 
 	efuse: efuse@10206000 {
 		compatible = "mediatek,mt7623-efuse",
-			     "mediatek,mt8173-efuse";
+			     "mediatek,efuse";
 		reg = <0 0x10206000 0 0x1000>;
 		#address-cells = <1>;
 		#size-cells = <1>;
-- 
2.35.3


