Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 07D0EC636D4
	for <linux-mediatek@archiver.kernel.org>; Wed,  1 Feb 2023 18:58:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=yR+4t71uvOrNwbzfT6rMlJz6ZARDL9nMPAtxzDTp2O8=; b=dTP4/I3bcYBydF
	6kiCt5bk1CqHaaCpN6G6gcpolez9d+73Z6S+92R7s7fNuAhcAeCOEYjsJ/KINqV7W5iJacndAi07l
	hGk+tTN7OBV82G3dAFbZzP7WpsqDVV6q+FVMCzgOPU6IKIBOyD7gSR0lxBzp3gRI84JuihrKkKrHO
	eiV0LTRdgQ/FsuDIvNLadrcGZrxlW1yI1nEeDNQORdJydN/rywjpkUEFlNL1gkf05GWEFnnKS57Fb
	rMhOsFUw+pejHY8H+mo+wSk5PmQwumV5fI+FAKDKcfzT8iOD9qZOGk3Jk4uAUdr0Wrk648jGY75D0
	tHpI5/qKL9mFlUXlBm0Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pNIJB-00DI8t-Ba; Wed, 01 Feb 2023 18:58:13 +0000
Received: from mail-ej1-x62b.google.com ([2a00:1450:4864:20::62b])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pNIIE-00DHbM-Nd; Wed, 01 Feb 2023 18:57:15 +0000
Received: by mail-ej1-x62b.google.com with SMTP id k4so48808029eje.1;
        Wed, 01 Feb 2023 10:57:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=yR+4t71uvOrNwbzfT6rMlJz6ZARDL9nMPAtxzDTp2O8=;
        b=hAE9xFTNI1lnwpIuE40P7XM3zdPBSWs6oC1K4LIIIi3QjXVHNPzxV0kaKrVltoyw1a
         nr3pcOkDNFrPu6kunubdEh0/jBS5AkgdI0jnU/1TadEQm4SFGN5nsqT9v90fjBmd/mU+
         jK2DrE/mUYa5oJaoSnXXmTh3BpKMu3qRl2gegfK/I51wfNok4JCz0nijSTBHqkQJ1KMr
         QC9X1Oj0ZBCu6aglye0rahH1MWdFaacyXZQOVt9GC7g0mGMOfYoxEJL/UtylpGx9nfA9
         /0hqC4xxAMVvUIuY4PDD1KDCzYcgI1jUPwxHYRWBC/zfce2oh62xKctLUcE0wYrVyY2A
         94Rw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=yR+4t71uvOrNwbzfT6rMlJz6ZARDL9nMPAtxzDTp2O8=;
        b=sn7ksIhqwMw7qRKau6coYyQQwbLt+HlSDOy/1JA5jSaynCl3ApUhe1pHBFWY6kZSxo
         P1c59vT2L/Zn8IBuaLieB0TMH7kLRwiYYlCtvNyLMQZr85kMisErHHweeI2YC2d3rpGq
         7DXR+Xuz5gUbtpoYYZZUqKTpoBoKW1n2mhJjrJzD9/f8LtSPvUDl+F8ZNKla4YDPrwl+
         5usTLfbEsHrFnXmKPK+EVB+R627CkjfxVAMdhEH3mk0mEjYdPuXMcgY+ghsg8LFXjgjx
         v+ir+fB+2jzFIFTk3HboIm5zc1An+BCvcJnFnpxmMK4KFQb56uYampRBmCiHboUjzZHr
         At0w==
X-Gm-Message-State: AO0yUKUlH4qgzd/PukiM8z2mOaDD/ao1lXn6EGJYy84Je5pAMhPXe3Mm
	GnEWBCKfuJziqfj0jup6swc=
X-Google-Smtp-Source: AK7set8Vhjr4qyafeIDSZSc3Eb1qSQaqtTm5MaSmxLU9rQXRso14GgRsj8YWD3pwarp3ZDG7RMCdYw==
X-Received: by 2002:a17:906:34d3:b0:82e:a57b:cc9b with SMTP id h19-20020a17090634d300b0082ea57bcc9bmr7270754ejb.24.1675277830106;
        Wed, 01 Feb 2023 10:57:10 -0800 (PST)
Received: from arinc9-PC.lan ([37.120.152.236])
        by smtp.gmail.com with ESMTPSA id dy25-20020a05640231f900b0049e210884dasm10100883edb.15.2023.02.01.10.57.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 01 Feb 2023 10:57:09 -0800 (PST)
From: arinc9.unal@gmail.com
X-Google-Original-From: arinc.unal@arinc9.com
To: Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Matthias Brugger <matthias.bgg@gmail.com>
Subject: [PATCH v2 4/5] arm: dts: mt7623: mux phy0 on Bananapi BPI-R2
Date: Wed,  1 Feb 2023 21:56:55 +0300
Message-Id: <20230201185656.17164-5-arinc.unal@arinc9.com>
X-Mailer: git-send-email 2.37.2
In-Reply-To: <20230201185656.17164-1-arinc.unal@arinc9.com>
References: <20230201185656.17164-1-arinc.unal@arinc9.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230201_105714_795080_8619D571 
X-CRM114-Status: GOOD (  12.03  )
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

Mux the MT7530 switch's phy0 to gmac5 which is wired to the SoC's gmac1.
This achieves 2 Gbps total bandwidth to the CPU using the second RGMII.

With this, the interface name to access phy0 changes from wan to eth1.

Signed-off-by: Arınç ÜNAL <arinc.unal@arinc9.com>
---
 arch/arm/boot/dts/mt7623n-bananapi-bpi-r2.dts | 15 ++++++++++-----
 1 file changed, 10 insertions(+), 5 deletions(-)

diff --git a/arch/arm/boot/dts/mt7623n-bananapi-bpi-r2.dts b/arch/arm/boot/dts/mt7623n-bananapi-bpi-r2.dts
index dc9b4f99eb8b..64700253fd35 100644
--- a/arch/arm/boot/dts/mt7623n-bananapi-bpi-r2.dts
+++ b/arch/arm/boot/dts/mt7623n-bananapi-bpi-r2.dts
@@ -182,6 +182,12 @@ fixed-link {
 	};
 };
 
+&gmac1 {
+	status = "okay";
+	phy-mode = "rgmii";
+	phy-handle = <&ethphy0>;
+};
+
 &eth {
 	status = "okay";
 
@@ -189,6 +195,10 @@ mdio-bus {
 		#address-cells = <1>;
 		#size-cells = <0>;
 
+		ethphy0: ethernet-phy@0 {
+			reg = <0>;
+		};
+
 		switch@1f {
 			compatible = "mediatek,mt7530";
 			reg = <0x1f>;
@@ -200,11 +210,6 @@ ports {
 				#address-cells = <1>;
 				#size-cells = <0>;
 
-				port@0 {
-					reg = <0>;
-					label = "wan";
-				};
-
 				port@1 {
 					reg = <1>;
 					label = "lan0";
-- 
2.37.2


