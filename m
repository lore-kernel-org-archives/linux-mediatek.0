Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BD213C77B7A
	for <linux-mediatek@archiver.kernel.org>; Sat,  3 Jun 2023 12:27:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ZcxFciO+FgadEz/OB9cY/SNSRDrKptPDDCbhwYKKivw=; b=IM+zlJ1gBTUm2iVMMuHIm55i3V
	k9dY3PVrDGmZ2hiWfiUx8Wd/AZD1smpTD1fbeTDh5KRgB6Ulm0ku0IJzMmkDs+KdT58gbg3B6iRRI
	1Pts3Qij3aXs3XIDZxFKIIY34YTg3xjUpucmkaekEDcv0C/P4htlyDErW78J+f3denpbYxaQmuVcJ
	G4zhbWevh0ZkqvmCLCE7v3TlaKzeNs4JZpWV4YHOjtjABenkbh54FwAw1G8ecEi2PVet6XD2yEisk
	sOfJRGbjzsjsxCyFUgG1hwk7PjVUHAmjmPyh1GvPNrQNn0mlcoLympg/qVuuKWACQMvnaI/MONCFF
	l9kmdeyA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1q5QM9-009jZB-0E;
	Sat, 03 Jun 2023 12:27:41 +0000
Received: from mail-ej1-x62d.google.com ([2a00:1450:4864:20::62d])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1q5QM5-009jXL-2G;
	Sat, 03 Jun 2023 12:27:39 +0000
Received: by mail-ej1-x62d.google.com with SMTP id a640c23a62f3a-969f90d71d4so445734166b.3;
        Sat, 03 Jun 2023 05:27:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1685795255; x=1688387255;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=ZcxFciO+FgadEz/OB9cY/SNSRDrKptPDDCbhwYKKivw=;
        b=WFctNZ81xWIx29VG0DK7rYmLHHpVtkUKtme5W4sXiOd+y5tiNx8DVwPlILjCR9MqGD
         1ZQXt+KjLQZjCdKWfIOC8SG18OvMxTMp4waGGA57Pk1Aq6aW0rL6usKrkKlpRQfg6hE/
         YAC3MpkGe83ek2+JtCNqJoTCcFaiUOtfDDn99vsG9ObgB41Gilfyqz0xlp0ol+c3UC9P
         ETn3m8nFzi61310h93OYSg9LmaisnjuaCT6S1NUK9hEVt58WyHtTD+9NjuWVAbw10NU9
         hw2TjpMFqPMhxBsHjcjxbD/CF64+Q2wNjnCNcd+GqzNOG3L0ruCTlK5+fHjP/k8MHoCm
         4Vsg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1685795255; x=1688387255;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=ZcxFciO+FgadEz/OB9cY/SNSRDrKptPDDCbhwYKKivw=;
        b=QMoSnXBQUGwCsscf1y0Be6da/IzwWc8JcyYGzkbNP9bvk9yE2wKjCVqCFrXDhD1jiH
         0vvLnoPSwaavFxgS6ZQUOUlIqYplY+4KjrDL1JFUXnzUM/zOlql6CSSQJCCXEMs1H88t
         dAJlW9UkQCZBjdsaZ+Op/475DR5J26WZEo87U9wZyFwuJXCK6ECQLYTHKkg67YKAakkS
         89xveW4feQMZCuvobvJmX/5eaYCzkDtub3S7oeVwUEWnHyHOfyP6mXaq20vcm+ZScmQi
         YKDvuebOqA5Ujan2M/xBxXZiSsO8WNW3ho91LYQuh73rZCA5QNg2hAQMy4gLRCoNuj69
         ma1w==
X-Gm-Message-State: AC+VfDwJrBkoLFfo/eL4XB/8o6ppAQdivJjoJJs1nRL0RdFHJfM+HYVW
	gVwvwTLUtk1a2WMn9mkrz5Y=
X-Google-Smtp-Source: ACHHUZ6WkA2BZcESwcxlAeOsw3PJj/CPtyUZi607dceyCN4ixJQWx8ZldbdWd1nJQZzDpfz6MQ+R9w==
X-Received: by 2002:a17:907:94d4:b0:975:bb0:5628 with SMTP id dn20-20020a17090794d400b009750bb05628mr1224998ejc.15.1685795254500;
        Sat, 03 Jun 2023 05:27:34 -0700 (PDT)
Received: from skbuf ([188.27.184.189])
        by smtp.gmail.com with ESMTPSA id lh20-20020a170906f8d400b0094f698073e0sm1872588ejb.123.2023.06.03.05.27.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 03 Jun 2023 05:27:34 -0700 (PDT)
Date: Sat, 3 Jun 2023 15:27:31 +0300
From: Vladimir Oltean <olteanv@gmail.com>
To: =?utf-8?B?QXLEsW7DpyDDnE5BTA==?= <arinc.unal@arinc9.com>
Subject: Re: [PATCH net-next 08/30] net: dsa: mt7530: change p{5,6}_interface
 to p{5,6}_configured
Message-ID: <20230603122731.bmo2r4jlwtwpcv3k@skbuf>
References: <20230522121532.86610-1-arinc.unal@arinc9.com>
 <20230522121532.86610-1-arinc.unal@arinc9.com>
 <20230522121532.86610-9-arinc.unal@arinc9.com>
 <20230522121532.86610-9-arinc.unal@arinc9.com>
 <20230524175107.hwzygo7p4l4rvawj@skbuf>
 <576f92b0-1900-f6ff-e92d-4b82e3436ea1@arinc9.com>
 <20230526130145.7wg75yoe6ut4na7g@skbuf>
 <7117531f-a9f2-63eb-f69d-23267e5745d0@arinc9.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <7117531f-a9f2-63eb-f69d-23267e5745d0@arinc9.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230603_052737_762336_A1316BE3 
X-CRM114-Status: GOOD (  13.15  )
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
Cc: Andrew Lunn <andrew@lunn.ch>, linux-kernel@vger.kernel.org, Eric Dumazet <edumazet@google.com>, mithat.guner@xeront.com, Florian Fainelli <f.fainelli@gmail.com>, erkin.bozoglu@xeront.com, Russell King <linux@armlinux.org.uk>, Richard van Schagen <richard@routerhints.com>, Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, Landen Chao <Landen.Chao@mediatek.com>, Richard van Schagen <vschagen@cs.com>, Sean Wang <sean.wang@mediatek.com>, DENG Qingfang <dqfext@gmail.com>, linux-mediatek@lists.infradead.org, Bartel Eerdekens <bartel.eerdekens@constell8.be>, Matthias Brugger <matthias.bgg@gmail.com>, linux-arm-kernel@lists.infradead.org, AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, netdev@vger.kernel.org, Daniel Golle <daniel@makrotopia.org>, "David S. Miller" <davem@davemloft.net>
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On Sat, Jun 03, 2023 at 03:15:52PM +0300, Arınç ÜNAL wrote:
> On 26.05.2023 16:01, Vladimir Oltean wrote:
> > Ok, but given the premise of this patch set, that phylink is always available,
> > does it make sense for mt7531_cpu_port_config() and mt7988_cpu_port_config()
> > to manually call phylink methods?
> 
> All I know is that that's how the implementation of phylink's PCS support in
> this driver works. It expects the MAC to be set up before calling
> mt753x_phylink_pcs_link_up() and mt753x_phylink_mac_link_up().

No, but I mean, won't phylink call mt7531_mac_config(), mt753x_phylink_pcs_link_up()
and mt753x_phylink_mac_link_up() automatically and in the expected order already,
and if not, what prevents that from happening? I just don't understand why the
cpu_port_config() methods of MT7531 and MT7988 call phylink methods manually
from the driver.

