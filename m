Return-Path: <SRS0=k4UB=JD=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.7 required=3.0 tests=BAYES_00,DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B67AFC43460
	for <linux-mediatek@archiver.kernel.org>; Tue,  6 Apr 2021 15:38:29 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 6962D6124B
	for <linux-mediatek@archiver.kernel.org>; Tue,  6 Apr 2021 15:38:29 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 6962D6124B
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:
	References:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=lCBYXKiZ0gGmOm0Tes6lqJzXONUHC+Cc2yIiRNp+f40=; b=KGYlGLc4YJPJaWxmfjNd0O3xW
	GSklxvOnGQqoyGQRHdTBrstKGk9jrOXligrUTycz0bj2y3W0DVIeoFyk9gyVNvKjbuu6/cEaOND5Y
	IYV9gG0331/Tfi4ea0JbXbA1DBUhOPmB71qG7lS29X9lZRTC2chFbYe4VnB+O0u5+GCxv4cIlDqpd
	dW0pFu9Mb4BwnDxuB32V/5reSDT/vbM+qYpHbakWrVDSxP9bSk/hVz7Ixmr5158p52KOyI7/A/FEB
	mpEoncaEkTiIc71qbszOeie3ZPhqN9YgbKXw2WyE3g/KNUtuM03Clr/pDh4jIwUrG864Q3YvF5SiN
	UmhZexH5Q==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lTnmN-002wMv-TW; Tue, 06 Apr 2021 15:38:12 +0000
Received: from mail-il1-x133.google.com ([2607:f8b0:4864:20::133])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lTnm9-002wIN-7n
 for linux-mediatek@lists.infradead.org; Tue, 06 Apr 2021 15:38:00 +0000
Received: by mail-il1-x133.google.com with SMTP id o15so9339505ilf.11
 for <linux-mediatek@lists.infradead.org>; Tue, 06 Apr 2021 08:37:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=kbb3/w5YJGsBeXToKy9zRKXFO7bV5Vr6+2zCWM3GMJs=;
 b=PX9wRzFR3GLxYS+v7WJWcQ8w6OA7XNBTFoiOUuDUWcScUAV1KX84PKIhp1MbImARj7
 zfDeUZS/HuyypOgx2s7g8xK+mZiK7QvljysRj8KrtAEqwzl+4q3KnN/sPnzx7utgVxAl
 jHa9z+z3tV7CBTnEwTXN7UQfBShvTFIlms9BxIs6YZZQUVYqHp/YauRctCOH94KI8Byv
 HZbF58xrNEp1QK9sQbUqKZTGxsz5QSUlE31cnd57TfRo+ep4RRsM+6Pl3fy28G5GztVU
 ysc3tAldc1zDgy6wn7bd+LAT3JZM3asHq4gcSdAKF2RzWOQrywSQ2ghQi27IxS3avXbx
 rqug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=kbb3/w5YJGsBeXToKy9zRKXFO7bV5Vr6+2zCWM3GMJs=;
 b=n67JsISWYadBZ3HltZw+SrDTKagW4KtVMsBBpT73ydXrSlTr36Tr+urc152zN+WiLL
 orE7RDZekqVf8pXvpYMM34tuI5h9erXFqyVqrzO4me+Nst89n0d138R0HW/g7BM2PO1D
 0EbSjNl0OAiZ+EObbwi7Qn8o5vX0qRIoU/IXz5wdLmv/F2Pf3P9iiqNTce/TELfYglx3
 9dyLfvCedAj9i35SLxzdPHKEUcAQfT5KFWSg5GhlcDAzdOZiVmNvM9FuE05MUljodjHr
 mHHsxFfrGNxQcnyqM8gB3+8FwaTANZzyxjZtF8rNRbjqk2ousx3c3aRZ4+5tmiZrOtSk
 gkqA==
X-Gm-Message-State: AOAM530hbn46edMI0L+VnD3CfftcyJNSRhRbJkD0vSjBt04DaS+gDfMf
 8x79842+koXkZc+0f1cdEIGAqEFzCfyKH7zEHfk=
X-Google-Smtp-Source: ABdhPJx0Q0y2VRt3hOxfDO1mtz1BBR0nzU1O4AzOcEj955FhecKBLwpJD1/qIY06hhsRlAjlNDN8j2jSd8GUczZS4mA=
X-Received: by 2002:a92:de0c:: with SMTP id x12mr1946080ilm.169.1617723474053; 
 Tue, 06 Apr 2021 08:37:54 -0700 (PDT)
MIME-Version: 1.0
References: <20210406141819.1025864-1-dqfext@gmail.com>
 <20210406141819.1025864-2-dqfext@gmail.com>
 <YGx8c5Jt2D7fB0cO@lunn.ch>
In-Reply-To: <YGx8c5Jt2D7fB0cO@lunn.ch>
From: DENG Qingfang <dqfext@gmail.com>
Date: Tue, 6 Apr 2021 23:37:51 +0800
Message-ID: <CALW65jYGpTs+30k7vxfLpQaK1sqHf4r7zosSOxp4W5U+Eh-Wvg@mail.gmail.com>
Subject: Re: [RFC net-next 1/4] net: phy: add MediaTek PHY driver
To: Andrew Lunn <andrew@lunn.ch>
Cc: "David S. Miller" <davem@davemloft.net>,
 Florian Fainelli <f.fainelli@gmail.com>, 
 Heiner Kallweit <hkallweit1@gmail.com>, Jakub Kicinski <kuba@kernel.org>, 
 Landen Chao <Landen.Chao@mediatek.com>,
 Matthias Brugger <matthias.bgg@gmail.com>, 
 Russell King <linux@armlinux.org.uk>, Sean Wang <sean.wang@mediatek.com>, 
 Vivien Didelot <vivien.didelot@gmail.com>, Vladimir Oltean <olteanv@gmail.com>,
 Rob Herring <robh+dt@kernel.org>, Linus Walleij <linus.walleij@linaro.org>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 Sergio Paracuellos <sergio.paracuellos@gmail.com>, linux-kernel@vger.kernel.org,
 "moderated list:ARM/Mediatek SoC support" <linux-mediatek@lists.infradead.org>,
 linux-staging@lists.linux.dev, 
 "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS"
 <devicetree@vger.kernel.org>, netdev <netdev@vger.kernel.org>, 
 Weijie Gao <weijie.gao@mediatek.com>, Chuanhong Guo <gch981213@gmail.com>, 
 =?UTF-8?Q?Ren=C3=A9_van_Dorst?= <opensource@vdorst.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210406_163758_296306_F168707C 
X-CRM114-Status: GOOD (  16.06  )
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On Tue, Apr 6, 2021 at 11:21 PM Andrew Lunn <andrew@lunn.ch> wrote:
>
> On Tue, Apr 06, 2021 at 10:18:16PM +0800, DENG Qingfang wrote:
> > Add support for MediaTek PHYs found in MT7530 and MT7531 switches.
>
> Do you know if this PHY is available standalone?

Not that I know of.

>
> > +static int mt7531_phy_config_init(struct phy_device *phydev)
> > +{
> > +     mtk_phy_config_init(phydev);
> > +
> > +     /* PHY link down power saving enable */
> > +     phy_set_bits(phydev, 0x17, BIT(4));
> > +     phy_clear_bits_mmd(phydev, MDIO_MMD_VEND1, 0xc6, 0x300);
> > +
> > +     /* Set TX Pair delay selection */
> > +     phy_write_mmd(phydev, MDIO_MMD_VEND1, 0x13, 0x404);
> > +     phy_write_mmd(phydev, MDIO_MMD_VEND1, 0x14, 0x404);
>
> This gets me worried about RGMII delays. We have had bad backwards
> compatibility problems with PHY drivers which get RGMII delays wrong.
>
> Since this is an internal PHY, i suggest you add a test to the
> beginning of mt7531_phy_config_init():
>
>         if (phydev->interface != PHY_INTERFACE_MODE_INTERNAL)
>                 return -EINVAL;

Okay. Will add it to v2.

>
> We can then solve RGMII problems when somebody actually needs RGMII.
>
>    Andrew

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
