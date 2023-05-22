Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 48682C77B75
	for <linux-mediatek@archiver.kernel.org>; Mon, 22 May 2023 12:16:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=C/Tw7LJKMFy4PfANJoXoLwPDs0oFT2xt0A4+ifBliZA=; b=TWkalRhvxmYCVn
	6LeJ996kz/ZTZKzekC3JLeYQvofrkh9ZYflKbG1bnNhj7fnyTKxnN0BmA8QDqztxPKpnpxxA73xrv
	Glo+//NVqSwH4trtmy5q5RvMolsXuf06h/rlIMel742So7G9Qg/bQdgu33qmSxkoMCio5sDSlfobC
	U8NzvNePuRqxq9kQAEU4k5Fyq+YhFA1AlULGBE219rQFsfX6DXTihY3oU8OyzX1NuOiIK0K1D2JUb
	k+6gZRQj7rgJc4Hyjaj7C/5yP4kygPhNAhNJGzDLBwKLxAWXeeO3Mtm0/5+04/KQJ/NXXiyzB9cOJ
	D73qPAloXCKsZbBGdodw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1q14T4-006PXu-1P;
	Mon, 22 May 2023 12:16:50 +0000
Received: from mail-ej1-x631.google.com ([2a00:1450:4864:20::631])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1q14SW-006P81-3A;
	Mon, 22 May 2023 12:16:18 +0000
Received: by mail-ej1-x631.google.com with SMTP id a640c23a62f3a-96652cb7673so945698166b.0;
        Mon, 22 May 2023 05:16:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1684757773; x=1687349773;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=C/Tw7LJKMFy4PfANJoXoLwPDs0oFT2xt0A4+ifBliZA=;
        b=L82IXudeI6mBhpOZyX+3epgT5s/qYbgTVZ0c15cgRmJ4B8Qcq8HfmX7W1zl50r19J2
         3lq5YNf54zk9Rhy5VQ2jXk1SZiK1DVOhDoVJPRpKL7VvefgV3GzaQuduX2g+Iu45J/10
         LqiQo3mqh6r4CiR0pAfjqmA38ppuHeQhsHly8rO81WYC3b1YB2V/z0NdxredZoBq8wOO
         Xx6fP0d9TqQPxJiKuOMzeTbZd/HZRKmABNQQhew4UGBZrmFyXTdfNzIY6/Hfbt0T7jOd
         40BlFvdlOP6edz+m2PY9udaqGODPJpXD1G1vd2f13sZl21xXDHYaRnW1BfvnrNJjjBdt
         /SFw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1684757773; x=1687349773;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=C/Tw7LJKMFy4PfANJoXoLwPDs0oFT2xt0A4+ifBliZA=;
        b=RqBLbhvvwp2E4YUFnr6IEc2moXfO5j8riDp/9r8ltO6oZd91xwxoIr+4RSfea35tX/
         vS3lFNFBLrfWxvDCBJFbtBaG3X382sD0W4+URVGTSfmIeQAuNizpbISHCiC0zOsegOZT
         DubMGfOlB6I13Bl/ur70z23+UQyvztPv5SboY3Q1/dyYy3kEQGjttnWr5hXYg6/Z+L27
         LGjvI/FdcagMQ0fAPexiyGTyafIJMwt8C0tuoc21/zhO4QYqGjVkA8i4grF7B5MPQqYj
         izazpOMjy+P6x7aboc6zFFgao1DJuX8bRQjsnB3Eq9ALG8gSWvooHaXtdAIyBJveng95
         s0dg==
X-Gm-Message-State: AC+VfDyhINqv2ypx3sxj4Q/l69V97CJC61BR24wDSziawbDpD8noGuxr
	NgxGwo++hHHhfZqVwGX8nsk=
X-Google-Smtp-Source: ACHHUZ5i6krWyAKq+V9C5ViAnF0f4cHYY7/Mvkb9MPaMzwFUcqw7iv+TmWOD1CiXzc8eLJq4avSdbQ==
X-Received: by 2002:a17:907:9629:b0:96f:8ea4:a72c with SMTP id gb41-20020a170907962900b0096f8ea4a72cmr9874454ejc.62.1684757773086;
        Mon, 22 May 2023 05:16:13 -0700 (PDT)
Received: from arinc9-PC.. ([149.91.1.15])
        by smtp.gmail.com with ESMTPSA id y26-20020a17090614da00b009659fed3612sm2999950ejc.24.2023.05.22.05.16.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 22 May 2023 05:16:12 -0700 (PDT)
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
	Russell King <linux@armlinux.org.uk>
Subject: [PATCH net-next 09/30] net: dsa: mt7530: empty default case on mt7530_setup_port5()
Date: Mon, 22 May 2023 15:15:11 +0300
Message-Id: <20230522121532.86610-10-arinc.unal@arinc9.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230522121532.86610-1-arinc.unal@arinc9.com>
References: <20230522121532.86610-1-arinc.unal@arinc9.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230522_051617_048645_A569EA9D 
X-CRM114-Status: GOOD (  11.41  )
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
Cc: mithat.guner@xeront.com, Richard van Schagen <vschagen@cs.com>, linux-kernel@vger.kernel.org, Richard van Schagen <richard@routerhints.com>, =?UTF-8?q?Ar=C4=B1n=C3=A7=20=C3=9CNAL?= <arinc.unal@arinc9.com>, linux-mediatek@lists.infradead.org, Bartel Eerdekens <bartel.eerdekens@constell8.be>, netdev@vger.kernel.org, erkin.bozoglu@xeront.com, linux-arm-kernel@lists.infradead.org
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

From: Arınç ÜNAL <arinc.unal@arinc9.com>

There're two code paths for setting up port 5:

mt7530_setup()
-> mt7530_setup_port5()

mt753x_phylink_mac_config()
-> mt753x_mac_config()
   -> mt7530_mac_config()
      -> mt7530_setup_port5()

On the first code path, priv->p5_intf_sel is either set to
P5_INTF_SEL_PHY_P0 or P5_INTF_SEL_PHY_P4 when mt7530_setup_port5() is run.

On the second code path, priv->p5_intf_sel is set to P5_INTF_SEL_GMAC5 when
mt7530_setup_port5() is run.

Empty the default case which will never run but is needed nonetheless to
handle all the remaining enumeration values.

Tested-by: Arınç ÜNAL <arinc.unal@arinc9.com>
Signed-off-by: Arınç ÜNAL <arinc.unal@arinc9.com>
---
 drivers/net/dsa/mt7530.c | 5 +----
 1 file changed, 1 insertion(+), 4 deletions(-)

diff --git a/drivers/net/dsa/mt7530.c b/drivers/net/dsa/mt7530.c
index d837aa20968c..50f150ff481a 100644
--- a/drivers/net/dsa/mt7530.c
+++ b/drivers/net/dsa/mt7530.c
@@ -930,9 +930,7 @@ static void mt7530_setup_port5(struct dsa_switch *ds, phy_interface_t interface)
 		val &= ~MHWTRAP_P5_DIS;
 		break;
 	default:
-		dev_err(ds->dev, "Unsupported p5_intf_sel %d\n",
-			priv->p5_intf_sel);
-		goto unlock_exit;
+		break;
 	}
 
 	/* Setup RGMII settings */
@@ -962,7 +960,6 @@ static void mt7530_setup_port5(struct dsa_switch *ds, phy_interface_t interface)
 	dev_dbg(ds->dev, "Setup P5, HWTRAP=0x%x, intf_sel=%s, phy-mode=%s\n",
 		val, p5_intf_modes(priv->p5_intf_sel), phy_modes(interface));
 
-unlock_exit:
 	mutex_unlock(&priv->reg_mutex);
 }
 
-- 
2.39.2


