Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7BCC6C05027
	for <linux-mediatek@archiver.kernel.org>; Wed,  1 Feb 2023 18:58:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=wCfu6pa2GszeTfCc5RgYlhyJYQ9sWCYCud+ludrzzVc=; b=qDIDrwGcoJ51Zs
	U+3KhGc/SWimXKWJHnDhB8Eruu7T70xaZE3k30kz+eVs/QjjlBWpOADtN2/OsJOacnaGCNCmixO1m
	ecSm/HimsyF9+dj1Q0O6S1umEYxhbe9TNmpk5tR/fxqxQ5NFaAJmb7tFoSoki3j5LzFHqYlFOSTAB
	j/NOkinaHWUiMGBf7LaRFUzz7paPPpJosaVqygZpDEzxlHpo7KQhPMHJo4GgYfp/292MltURvHKnz
	YsBK5s4ivp1kyGym035tdydesAn/qSx8TsHYAY2a/g5ftsosl87vs0EzbZ0DrbeRCmV7JCHsvFcax
	3rRe6+jKzpjyia8RWX9Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pNIJd-00DIQl-Dm; Wed, 01 Feb 2023 18:58:41 +0000
Received: from mail-ej1-x629.google.com ([2a00:1450:4864:20::629])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pNIIF-00DHc3-Fm; Wed, 01 Feb 2023 18:57:16 +0000
Received: by mail-ej1-x629.google.com with SMTP id mc11so31765615ejb.10;
        Wed, 01 Feb 2023 10:57:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=wCfu6pa2GszeTfCc5RgYlhyJYQ9sWCYCud+ludrzzVc=;
        b=ZWH6Ar7ilBCAgENdaD2nDd5SFGMw9TpK1MYhGrmFx0FRswNziyBZezdAFW4G+XihTV
         DZTFZoQ6F6amvc+844+dV4hDBAQVK0rJpnLY6Zfd8w7t8Xpekbc4vRS5Cif/pnAOn12A
         9VMA2AxbsvzsP70NjJv+QHn2ullhmx3dZpQOyClVYEC80pWyE7jJjrYRV72G7q337qZ7
         hkqBviIq9wpmQfmH96wxi2bcAA0WU5gvEbosZ57vmUPm5pJN8/xOO67pb079zr2L3oHI
         TLBt1VCUNGGw/SzhWc3cVaj3c6dE8mKNRi6N9IliDhvbXzlYmAS5MT9iTDdNNaJYZhpQ
         vuvg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=wCfu6pa2GszeTfCc5RgYlhyJYQ9sWCYCud+ludrzzVc=;
        b=NOshmG7y16rJ0oTYiT98Ti6GDgEJLR9fNjoHGJjZUmdzKQUmQ/ZhPNX/mLDrRyvWJN
         2YnYXx7+T+8e4uLpWMLfq7pZvEfk0uXfjdGA7VzZEIHJQj36gcamjqkCwCVOraJJMSYd
         ccswUyzTZ64gElvpEKj4y4VTQj6HZoo5o/rjFDvhuKVdifuNNuZsiLGfNrVggqfaZ+KU
         rJC+Pjj1SLDA2PqXVKvLFZP16PYf7uEFBwWaJHfF/ldfJDA8qqidpKNAfC8ipLK9tkGN
         ixjt3SlPuGXA/2VXLZYGindCKL9JPHHDxaFjrx6Tv84iFF72uOXwAdZh8d0TQGOCt89N
         n2zA==
X-Gm-Message-State: AO0yUKUQCenMTOryT3/WwJG8ZvAwbciCUq1EVJR2ERQhFrq7FUlYjplp
	WByBTtjaLcBz2pX0emUrWYE=
X-Google-Smtp-Source: AK7set/SM3JG6I2M8EAecQOB0PUjU28U25qsAi1G9D05Ilp8bswF5flMqVIH6qRv0DQ3Sxo2vUYFlw==
X-Received: by 2002:a17:907:2d28:b0:88d:f759:15ae with SMTP id gs40-20020a1709072d2800b0088df75915aemr4150126ejc.42.1675277831685;
        Wed, 01 Feb 2023 10:57:11 -0800 (PST)
Received: from arinc9-PC.lan ([37.120.152.236])
        by smtp.gmail.com with ESMTPSA id dy25-20020a05640231f900b0049e210884dasm10100883edb.15.2023.02.01.10.57.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 01 Feb 2023 10:57:11 -0800 (PST)
From: arinc9.unal@gmail.com
X-Google-Original-From: arinc.unal@arinc9.com
To: Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Matthias Brugger <matthias.bgg@gmail.com>
Subject: [PATCH v2 5/5] arm: dts: mt7623: enable flow control on port@6
Date: Wed,  1 Feb 2023 21:56:56 +0300
Message-Id: <20230201185656.17164-6-arinc.unal@arinc9.com>
X-Mailer: git-send-email 2.37.2
In-Reply-To: <20230201185656.17164-1-arinc.unal@arinc9.com>
References: <20230201185656.17164-1-arinc.unal@arinc9.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230201_105715_554553_04649E33 
X-CRM114-Status: GOOD (  11.13  )
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
Cc: devicetree@vger.kernel.org, Sean Wang <sean.wang@mediatek.com>, =?UTF-8?q?Ar=C4=B1n=C3=A7=20=C3=9CNAL?= <arinc.unal@arinc9.com>, linux-kernel@vger.kernel.org, DENG Qingfang <dqfext@gmail.com>, linux-mediatek@lists.infradead.org, erkin.bozoglu@xeront.com, linux-arm-kernel@lists.infradead.org
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

From: Arınç ÜNAL <arinc.unal@arinc9.com>

Flow control needs to be enabled on both sides to work.
It is already enabled on gmac0, enable it on port@6 too.

Signed-off-by: Arınç ÜNAL <arinc.unal@arinc9.com>
---
 arch/arm/boot/dts/mt7623a.dtsi         | 1 +
 arch/arm/boot/dts/mt7623n-rfb-emmc.dts | 1 +
 2 files changed, 2 insertions(+)

diff --git a/arch/arm/boot/dts/mt7623a.dtsi b/arch/arm/boot/dts/mt7623a.dtsi
index dd522e508eb3..2a50b5c0c933 100644
--- a/arch/arm/boot/dts/mt7623a.dtsi
+++ b/arch/arm/boot/dts/mt7623a.dtsi
@@ -88,6 +88,7 @@ port@6 {
 					fixed-link {
 						speed = <1000>;
 						full-duplex;
+						pause;
 					};
 				};
 			};
diff --git a/arch/arm/boot/dts/mt7623n-rfb-emmc.dts b/arch/arm/boot/dts/mt7623n-rfb-emmc.dts
index 6b0c3d1006ab..34994f3f5a4b 100644
--- a/arch/arm/boot/dts/mt7623n-rfb-emmc.dts
+++ b/arch/arm/boot/dts/mt7623n-rfb-emmc.dts
@@ -230,6 +230,7 @@ port@6 {
 					fixed-link {
 						speed = <1000>;
 						full-duplex;
+						pause;
 					};
 				};
 			};
-- 
2.37.2


