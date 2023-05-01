Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DBC69C77B73
	for <linux-mediatek@archiver.kernel.org>; Mon,  1 May 2023 12:30:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-Id:Date:Subject:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=qI1N6Zt1ichZ6d+bawiKp7X6Hia786Ixe1XzJA/8a1M=; b=LzvC4I1l3yAVJx
	ya8QLmMy3SGBod6JWDmGG0VLgwdfBkBIDR/judgl9v84y+DfySWeLCPZY4nQkdGfg/B+FbgMPc189
	tf0F3qIYQd31jjN9vD1CgcxMnTSHHF6PU6URK4hsUfcsVpIsl1ufzbXtQdBfnrfnbaiwO4KD0E5ST
	WZJgi8sRyjg1hObiMOuB3QmGHWZJOe9lXdSEPRyVeBbPFHjKeJdViyDLUVoaGtgxdw1q5xTaZwcNl
	ugPTDIyQFUUJZNVDb+tydNF6zRbGj8S2TrWYZftdDTYufHEklstAGGG+/MnigWyQsgHHU7ErGOeMT
	fAgcZRcspjCcRLyObhWg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1ptSg3-00Fy57-1J;
	Mon, 01 May 2023 12:30:47 +0000
Received: from mail-ej1-x62c.google.com ([2a00:1450:4864:20::62c])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1ptSRw-00FsRi-1b;
	Mon, 01 May 2023 12:16:13 +0000
Received: by mail-ej1-x62c.google.com with SMTP id a640c23a62f3a-957dbae98b4so370430166b.1;
        Mon, 01 May 2023 05:16:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1682943370; x=1685535370;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=qI1N6Zt1ichZ6d+bawiKp7X6Hia786Ixe1XzJA/8a1M=;
        b=YOy1OVoDmGMAcGUMIcWF2hdmky++kfkclWbsQbcd5HvhRPG2ka/PUqk4aTMOWZOStm
         drsyktoUYykaTyW+2h57sj2Nz+oD9IlI0nxg9/vfkbbMZOVHc+at5L6clRiJj/bW8vzk
         66jIrEwk6Ad1lV1ZTNKDJNrTDh3yXazf45BvOmHXJcjo5gbs5hb7qZyYQjTd9Uq5qE11
         c6DgLBrGeVDzA1TjfJdsW6hTIzx7gjomxyB4M3Tu02EXXJVU8yLki8FQJ7TwhXo7g1ni
         UTJvnpyKo65OMy2ObU5qG7AbT78WhRXm9MSrq4ahp1xYY1X/PPEpiVjEAE5boULh7QuP
         cImQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1682943370; x=1685535370;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=qI1N6Zt1ichZ6d+bawiKp7X6Hia786Ixe1XzJA/8a1M=;
        b=jR4XrmA1AWtXo2OlD/5HFi8VP4GD7IjOqJ8ZdJPUgtI3KIT1GYBjh+ByndLl8VHfjr
         VSbVm+qP5PmP72pmS5O7e8n5L/m464A11vaT3Hl6jsa2nldvgSd1fPA+ohDWYktWePBa
         Dl30Sv5LbEVqI48d/UtEKIwbedvLZLTn/9VhxjRGN5yoJi2lDkRwlEY0WgzxBA0hPWxz
         i8wq5/AtjO5HJQQP6q33hIG6WWvd9xf7Zfh96Bw3BwSCkrOhZp/elAJC656HKr6MjB8V
         eca1NdLanVRS3mziV70q8oOdnMaZdtQePS8UjMQPUFLY/VQQcKsIRvtuGepO7Q88S2Mg
         HC4g==
X-Gm-Message-State: AC+VfDzlTezYlTgHAUMybN2qTs/s1iwbrA8+MebXc1aSTR3RzEUKd2br
	Nn+klGuXoStIO/BPG4synwM=
X-Google-Smtp-Source: ACHHUZ42ywzxk8pSiGJuLh3/VyXM5Zdh+LbpwLjowrvTTdDKs9Df+mVQSoXHbYgYmFWBv8z/Nanrtw==
X-Received: by 2002:a17:906:58c5:b0:94e:626e:c108 with SMTP id e5-20020a17090658c500b0094e626ec108mr12965230ejs.50.1682943369686;
        Mon, 01 May 2023 05:16:09 -0700 (PDT)
Received: from arinc9-PC.lan ([149.91.1.15])
        by smtp.gmail.com with ESMTPSA id t20-20020a1709060c5400b0094ebc041e20sm14597000ejf.46.2023.05.01.05.16.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 01 May 2023 05:16:09 -0700 (PDT)
From: arinc9.unal@gmail.com
X-Google-Original-From: arinc.unal@arinc9.com
To: Sean Wang <sean.wang@mediatek.com>,
	Landen Chao <Landen.Chao@mediatek.com>,
	DENG Qingfang <dqfext@gmail.com>,
	Daniel Golle <daniel@makrotopia.org>,
	Andrew Lunn <andrew@lunn.ch>,
	Florian Fainelli <f.fainelli@gmail.com>,
	Vladimir Oltean <olteanv@gmail.com>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	=?UTF-8?q?Ren=C3=A9=20van=20Dorst?= <opensource@vdorst.com>
Subject: [PATCH net 1/2] net: dsa: mt7530: fix corrupt frames using trgmii on 40 MHz XTAL MT7621
Date: Mon,  1 May 2023 15:15:37 +0300
Message-Id: <20230501121538.57968-1-arinc.unal@arinc9.com>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230501_051612_535473_9AECBC82 
X-CRM114-Status: GOOD (  14.22  )
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
Cc: erkin.bozoglu@xeront.com, Richard van Schagen <vschagen@cs.com>, linux-kernel@vger.kernel.org, Richard van Schagen <richard@routerhints.com>, =?UTF-8?q?Ar=C4=B1n=C3=A7=20=C3=9CNAL?= <arinc.unal@arinc9.com>, linux-mediatek@lists.infradead.org, Bartel Eerdekens <bartel.eerdekens@constell8.be>, netdev@vger.kernel.org, mithat.guner@xeront.com, linux-arm-kernel@lists.infradead.org
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

From: Arınç ÜNAL <arinc.unal@arinc9.com>

The multi-chip module MT7530 switch with a 40 MHz oscillator on the
MT7621AT, MT7621DAT, and MT7621ST SoCs forwards corrupt frames using
trgmii.

This is caused by the assumption that MT7621 SoCs have got 150 MHz PLL,
hence using the ncpo1 value, 0x0780.

My testing shows this value works on Unielec U7621-06, Bartel's testing
shows it won't work on Hi-Link HLK-MT7621A and Netgear WAC104. All devices
tested have got 40 MHz oscillators.

Using the value for 125 MHz PLL, 0x0640, works on all boards at hand. The
definitions for 125 MHz PLL exist on the Banana Pi BPI-R2 BSP source code
whilst 150 MHz PLL don't.

Forwarding frames using trgmii on the MCM MT7530 switch with a 25 MHz
oscillator on the said MT7621 SoCs works fine because the ncpo1 value
defined for it is for 125 MHz PLL.

Change the 150 MHz PLL comment to 125 MHz PLL, and use the 125 MHz PLL
ncpo1 values for both oscillator frequencies.

Link: https://github.com/BPI-SINOVOIP/BPI-R2-bsp/blob/81d24bbce7d99524d0771a8bdb2d6663e4eb4faa/u-boot-mt/drivers/net/rt2880_eth.c#L2195
Fixes: 7ef6f6f8d237 ("net: dsa: mt7530: Add MT7621 TRGMII mode support")
Tested-by: Bartel Eerdekens <bartel.eerdekens@constell8.be>
Tested-by: Arınç ÜNAL <arinc.unal@arinc9.com>
Signed-off-by: Arınç ÜNAL <arinc.unal@arinc9.com>
---
 drivers/net/dsa/mt7530.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/net/dsa/mt7530.c b/drivers/net/dsa/mt7530.c
index c680873819b0..7d9f9563dbda 100644
--- a/drivers/net/dsa/mt7530.c
+++ b/drivers/net/dsa/mt7530.c
@@ -426,9 +426,9 @@ mt7530_pad_clk_setup(struct dsa_switch *ds, phy_interface_t interface)
 		else
 			ssc_delta = 0x87;
 		if (priv->id == ID_MT7621) {
-			/* PLL frequency: 150MHz: 1.2GBit */
+			/* PLL frequency: 125MHz: 1.0GBit */
 			if (xtal == HWTRAP_XTAL_40MHZ)
-				ncpo1 = 0x0780;
+				ncpo1 = 0x0640;
 			if (xtal == HWTRAP_XTAL_25MHZ)
 				ncpo1 = 0x0a00;
 		} else { /* PLL frequency: 250MHz: 2.0Gbit */
-- 
2.39.2


