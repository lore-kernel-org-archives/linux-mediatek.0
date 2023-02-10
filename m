Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 567BDC636CD
	for <linux-mediatek@archiver.kernel.org>; Fri, 10 Feb 2023 18:27:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=wCfu6pa2GszeTfCc5RgYlhyJYQ9sWCYCud+ludrzzVc=; b=mpv4kEQkLq05hn
	GZQXClgOnkZAXi5Rjei764JV2SbJwcseAL8zWw3mAqgLmmCYtnMGLFVjNThKzaR+4mYIprFJ32Wfd
	6/1WUfzE7MVkEue78BT6hxYQtqnMBPOr3isE1v3G93LZeTX8DTWY67KzGUSOdoGAm4k3B9vUYDlPe
	X5t83QIxCon/qSDPmkbmkOcrfXKt21evDvyexxdtx9nsTxt9K+xFg5VhGy+/wapvxLy8cd6CcFEg0
	4wu3cA1jPKYs6R6P839k6463o8UvtXrWaqUb22xeMrNTFeyncofR2ik0JHqoYQayK7hJrV4/6v+m2
	JFRC222qJpXyBzMxzFfw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pQY6w-006vQz-8b; Fri, 10 Feb 2023 18:27:02 +0000
Received: from mail-ej1-x634.google.com ([2a00:1450:4864:20::634])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pQY5P-006ue9-6O; Fri, 10 Feb 2023 18:25:28 +0000
Received: by mail-ej1-x634.google.com with SMTP id m2so18148447ejb.8;
        Fri, 10 Feb 2023 10:25:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=wCfu6pa2GszeTfCc5RgYlhyJYQ9sWCYCud+ludrzzVc=;
        b=X1mzrKM6r4a/0Ka+GQ11R1XnzzfmSUJuDFwVEfOo08zbxrh5eGXfBhrUVXrxpmR27K
         ESz9/uL0HnKtFzina5m6Z/BAMKvsH//osXITxksKCao5PYUe81/i4FNUpsNaq0UNc/PC
         sBb0gDowBHGWnBpF7V/c4nkq7j40Nmicx5jHub30Rs2HvL/20ueoWqNGyLxrhzR9gquG
         826SR+3RHVHmHYFSzb7ph64Zb1JTQAt/bY3PvS5UDWsELvxxCFKWAScuC0V7fiaIDGml
         QIIHpo8kH6nJjpVnewHuAtl5NiRziv0Y1G5kSKrw6gsdZHQnBA0HwctVpuziyEOOa0cy
         Isng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=wCfu6pa2GszeTfCc5RgYlhyJYQ9sWCYCud+ludrzzVc=;
        b=be+U/z2aCbrMcdzXq4zKgnQoTaTOOZ/CDvW0+8F7qBnt/BsjMW2bLYhKuXbXaP17Ar
         eTs6PoRZXpvxPqJ02mWTBjuz0NAB2dWfq/HkhSyWTi7b9O1/n4V7B77wH0Dku3lieq+R
         df8fZZRFJRsFCyH92jm1GWCmNckvff1ajvyqMpH7ZcqzgEgEIXNPk34Nttps9k+1XPct
         KM+kAp/lMJs8EvcpNHMjH/E2JTJwhxbJjxMR3++0sRmJIBLDVQMmTwVO+tKUchUxu3fj
         Zh3O+aoxxtTyZOs1N9J68YlqvRR1sW3LUnlmCx2qveBbgjpa3v4vaWMXSVYKKcwo84HN
         whNA==
X-Gm-Message-State: AO0yUKV09c+7bQH+Jl9tMrN6NB5Rvdoo2hf+C6f51X22Y+HxeRenfhQg
	L0odY/7c+Q/rGafE5tRppgs=
X-Google-Smtp-Source: AK7set8fq7wwpEhi5yAiF/pDQhfmzPRJ9oTHjWGWSPgYj3lO24PrEML/3qWsS/pdXPlcmVkz3lsgfg==
X-Received: by 2002:a17:907:2495:b0:888:787d:2064 with SMTP id zg21-20020a170907249500b00888787d2064mr16908779ejb.75.1676053522615;
        Fri, 10 Feb 2023 10:25:22 -0800 (PST)
Received: from arinc9-PC.lan ([37.120.152.236])
        by smtp.gmail.com with ESMTPSA id 4-20020a170906024400b008aef19f678asm2708966ejl.165.2023.02.10.10.25.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 10 Feb 2023 10:25:22 -0800 (PST)
From: arinc9.unal@gmail.com
X-Google-Original-From: arinc.unal@arinc9.com
To: Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Subject: [PATCH v3 4/5] arm: dts: mt7623: enable flow control on port@6
Date: Fri, 10 Feb 2023 21:25:04 +0300
Message-Id: <20230210182505.24597-5-arinc.unal@arinc9.com>
X-Mailer: git-send-email 2.37.2
In-Reply-To: <20230210182505.24597-1-arinc.unal@arinc9.com>
References: <20230210182505.24597-1-arinc.unal@arinc9.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230210_102527_253468_34B91CF1 
X-CRM114-Status: GOOD (  10.97  )
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
Cc: devicetree@vger.kernel.org, =?UTF-8?q?Ar=C4=B1n=C3=A7=20=C3=9CNAL?= <arinc.unal@arinc9.com>, linux-kernel@vger.kernel.org, linux-mediatek@lists.infradead.org, erkin.bozoglu@xeront.com, linux-arm-kernel@lists.infradead.org
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


