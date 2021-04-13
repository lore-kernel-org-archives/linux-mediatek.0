Return-Path: <SRS0=dZqu=JK=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.7 required=3.0 tests=BAYES_00,DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_GIT autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CAAE4C433ED
	for <linux-mediatek@archiver.kernel.org>; Tue, 13 Apr 2021 03:59:51 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 463A26128A
	for <linux-mediatek@archiver.kernel.org>; Tue, 13 Apr 2021 03:59:51 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 463A26128A
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-Id:Date:
	Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=wLeW8Gbi3604hbVNjFBvupOdtSiyjKaLU9xvyrbPZho=; b=OgCaHYvBFTJfSYHIXrcX6/q67
	yJETecbIXIl6aTgeUZxPfHvn6GwCj9chv4v/Ik73mjvFGI+cXYqmbIKJVTTilISOGNdYgY2InlaWm
	YhTBvxvRBXYlex2EajlzBbf0ex9kObfV8TFQ01PHXXzFQBKqCLr1EzkB2A+Ac7qMM0VdRftOyP4MM
	6ZBYB1/rsXMm26Gu4cBb0LCaL1CG2YeWjId64Js9log99fNNZV3sMze2tDSzwACza0Wd7wf1KAXwt
	GjJSUVCF4GMyJ4VgM9s8v1yddZA3MPSfd/IGLO7QPrfXGpF84txmrooqlw/QSzPhjPwiEYR/ea7my
	PFzOdxhnQ==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lWADC-008Cnt-Hg; Tue, 13 Apr 2021 03:59:38 +0000
Received: from bombadil.infradead.org ([2607:7c80:54:e::133])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lWAD9-008Cnm-St
 for linux-mediatek@desiato.infradead.org; Tue, 13 Apr 2021 03:59:36 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
 Content-Type:MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:
 To:From:Sender:Reply-To:Content-ID:Content-Description;
 bh=MMUmn5mABVsgrfWlibL4nmwnAT3Kpef8pz6y5TktZjk=; b=H1Dw0FCjWNb71LpO7IiP6072Yq
 q1KwzXvCxiH1eM76qc8YH+wtuY6vyFzypJRnwcXAI5nuoxP1BD0aXwCtjT3qbf8mCNyc9YaFAkMpP
 7p85T6jzNLvqXBk0I/hlZjut/l3zoulJ5GEpohAKR99Y5K8h1LKOq77tbFZBlofjOn5jMYDc2Y6/F
 pONfQwJyNUaGQJ0b/halbdq5pIe/x0KX7Iv9B3olXwWlALzhV/w4T4GkrYU9Ff7RBz27Sxcs/k1is
 7f0JjnH/0obXCJj/HeBvwBbc1F7FyeZbAP167EuY7UlssMfN1NT2iQflTilBjtMy3Jfi8pOfVaGe3
 QVfGGuPA==;
Received: from mail-pj1-x1034.google.com ([2607:f8b0:4864:20::1034])
 by bombadil.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lWAD7-006hzn-Ad
 for linux-mediatek@lists.infradead.org; Tue, 13 Apr 2021 03:59:34 +0000
Received: by mail-pj1-x1034.google.com with SMTP id
 il9-20020a17090b1649b0290114bcb0d6c2so10035793pjb.0
 for <linux-mediatek@lists.infradead.org>; Mon, 12 Apr 2021 20:59:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-disposition:content-transfer-encoding;
 bh=MMUmn5mABVsgrfWlibL4nmwnAT3Kpef8pz6y5TktZjk=;
 b=Ys9jkndzAW5uBB7GfhA/tsOayE/UE2BtjjEmlkCxMxIaFyKY9MFSTgxpxWfdxDk5h6
 4GWMRa1At+rbawl7r+Z1ypxff05XvHVP6FJk0rUwuZvpu7oHxR+zRcgQTNvQ5c0zIaDl
 8zGjUvzQzTebIuUXkQQJtgi2n3hrI2nMtG7ol1GcxV4Yi5T7hMrrLyU/uTne4QGBGugO
 m3Y2Ytu/ygqr53ax/sTz7JOBmqyJGoeegcv3N/XzUsjXfVnMz7S+aEA98LgmOUO/mHrP
 LcQuUXLYbgSbQ+lkHAY2DGQLleHBdh18anpWTWfuYc2fxLb5YxO77/JoFn32/4foikjV
 4yJw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-disposition
 :content-transfer-encoding;
 bh=MMUmn5mABVsgrfWlibL4nmwnAT3Kpef8pz6y5TktZjk=;
 b=sso81lbqHBveuk9RN9UnJoe0C11wZvKeiQAnUcQqh4agF4j0VoYsrHxsKlp+kyI8n1
 xpnu3YHVjE4DLtUerCaQZ5+lvBQOzzQoRCmkn3p0KJaj5cSvourUtotsIufesnFfLpsB
 QBiCniWlior971D2lON2gMrAYo7iuNCpvHiB4o6rezd0EkoUZ8FUpt3gi3Q8pC2QTu/A
 ZzN7QtojrAtE69w9Jwtdfr2dwkw8TXRv7iwKNnuFBwDHgMxjQtI+DJPlwSOTHjRrAaJG
 4nFF4OiX+ykay94+1Vsz0TAA0uFNQMXDrYanRzbx5XsCYE8NVNhpbweZxo2KyVQ//vCa
 FH3Q==
X-Gm-Message-State: AOAM530tuCq2xbPBMgNsVFLM991lioKRNFNvB3RS5VtIaQz9GPtPfdD6
 fNXRdk2AL3sRhDgvK42ECji7eyY7lw3du104
X-Google-Smtp-Source: ABdhPJyMRWGljYt/4aZ19IQ3gt9VmDkMZt1nOhw1lL4WoWV67sNLFAuRj0SR3TADUx1CDcAdnktDiQ==
X-Received: by 2002:a17:90a:7bce:: with SMTP id
 d14mr2751340pjl.139.1618286371967; 
 Mon, 12 Apr 2021 20:59:31 -0700 (PDT)
Received: from localhost.localdomain ([138.197.212.246])
 by smtp.gmail.com with ESMTPSA id 67sm11110165pfy.140.2021.04.12.20.59.24
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 12 Apr 2021 20:59:31 -0700 (PDT)
From: DENG Qingfang <dqfext@gmail.com>
To: =?iso-8859-1?Q?Ren=E9?= van Dorst <opensource@vdorst.com>
Cc: "David S. Miller" <davem@davemloft.net>, Andrew Lunn <andrew@lunn.ch>,
 Florian Fainelli <f.fainelli@gmail.com>,
 Heiner Kallweit <hkallweit1@gmail.com>, Jakub Kicinski <kuba@kernel.org>,
 Landen Chao <Landen.Chao@mediatek.com>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 Russell King <linux@armlinux.org.uk>, Sean Wang <sean.wang@mediatek.com>,
 Vivien Didelot <vivien.didelot@gmail.com>,
 Vladimir Oltean <olteanv@gmail.com>, Rob Herring <robh+dt@kernel.org>,
 Linus Walleij <linus.walleij@linaro.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Sergio Paracuellos <sergio.paracuellos@gmail.com>,
 linux-kernel@vger.kernel.org, linux-mediatek@lists.infradead.org,
 linux-staging@lists.linux.dev, devicetree@vger.kernel.org,
 netdev@vger.kernel.org, Weijie Gao <weijie.gao@mediatek.com>,
 Chuanhong Guo <gch981213@gmail.com>,
 Frank Wunderlich <frank-w@public-files.de>,
 Thomas Gleixner <tglx@linutronix.de>, Marc Zyngier <maz@kernel.org>
Subject: Re: [RFC v4 net-next 1/4] net: phy: add MediaTek PHY driver
Date: Tue, 13 Apr 2021 11:59:20 +0800
Message-Id: <20210413035920.1422364-1-dqfext@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210412150836.929610-1-dqfext@gmail.com>
References: <20210412034237.2473017-1-dqfext@gmail.com>
 <20210412034237.2473017-2-dqfext@gmail.com>
 <20210412070449.Horde.wg9CWXW8V9o0P-heKYtQpVh@www.vdorst.com>
 <20210412150836.929610-1-dqfext@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210412_205933_391794_E86887B9 
X-CRM114-Status: GOOD (  19.99  )
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
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On Mon, Apr 12, 2021 at 11:08:36PM +0800, DENG Qingfang wrote:
> On Mon, Apr 12, 2021 at 07:04:49AM +0000, Ren=E9 van Dorst wrote:
> > Hi Qingfang,
> > > +static void mtk_phy_config_init(struct phy_device *phydev)
> > > +{
> > > +	/* Disable EEE */
> > > +	phy_write_mmd(phydev, MDIO_MMD_AN, MDIO_AN_EEE_ADV, 0);
> > =

> > For my EEE patch I changed this line to:
> > =

> > genphy_config_eee_advert(phydev);
> > =

> > So PHY EEE part is setup properly at boot, instead enable it manual via
> > ethtool.
> > This function also takes the DTS parameters "eee-broken-xxxx" in to acc=
ount
> > while
> > setting-up the PHY.
> =

> Thanks, I'm now testing with it.

Hi Rene,

Within 12 hours, I got some spontaneous link down/ups when EEE is enabled:

[16334.236233] mt7530 mdio-bus:1f wan: Link is Down
[16334.241340] br-lan: port 3(wan) entered disabled state
[16337.355988] mt7530 mdio-bus:1f wan: Link is Up - 1Gbps/Full - flow contr=
ol rx/tx
[16337.363468] br-lan: port 3(wan) entered blocking state
[16337.368638] br-lan: port 3(wan) entered forwarding state

The cable is a 30m Cat.6 and never has such issue when EEE is disabled.
Perhaps WAKEUP_TIME_1000/100 or some PHY registers need to be fine-tuned,
but for now I think it should be disabled by default.

> =

> > =

> > > +
> > > +	/* Enable HW auto downshift */
> > > +	phy_modify_paged(phydev, MTK_PHY_PAGE_EXTENDED, 0x14, 0, BIT(4));

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
