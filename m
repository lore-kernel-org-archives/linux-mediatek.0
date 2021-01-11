Return-Path: <SRS0=02OB=GO=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.5 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8C0BEC433DB
	for <linux-mediatek@archiver.kernel.org>; Mon, 11 Jan 2021 13:55:41 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 39DEF2231F
	for <linux-mediatek@archiver.kernel.org>; Mon, 11 Jan 2021 13:55:41 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 39DEF2231F
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=armlinux.org.uk
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:Message-ID:
	Subject:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=+52awFYCkSFewrRibiJeGSlU4k++ax7PJDmZ032sWlM=; b=2bBcy8LhtTaNexnnLf7fvyg00
	JC421qcOVNu9AHvxJ+6K+tU22b1ctY/Qag6rzXplsVVryLcPE3ZMJ26fh0r4z/FKtI9tEjpvqKBuF
	1VBePgXSRAniFn2IGZTcCFBJHufCkAX3YJ7YZCrDo16jkmbfhiTadrRYLCVdxeJIAB7R9+IgvIQey
	sSe2pfoZ4N8V1G22kQ3GVyt/Xr3a5J7Q8FHlXn3q7i+lo7BZCwTQl+w9xsUqZBNxXp3sNTmQHG2C4
	uwpTm/uqm5nhItC0Tiq0VQ7Hh2b1B3u6N6ujrdTDcyWw5GoznP6pzaRso7ORcWKXgcuarqjItmjUT
	58Iw6D6Lg==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kyxfO-0004aF-6v; Mon, 11 Jan 2021 13:55:30 +0000
Received: from pandora.armlinux.org.uk ([2001:4d48:ad52:32c8:5054:ff:fe00:142])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kyxfH-0004YC-SH; Mon, 11 Jan 2021 13:55:25 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=armlinux.org.uk; s=pandora-2019; h=Sender:In-Reply-To:Content-Type:
 MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
 List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=4EFw0oAHCpZpwVi8T4aoUbYDN24+hywjYSLIVVld9J8=; b=1tDsVBAhI42EDyWVShCkITD09
 5gsmbTgQIYURjcVuc1Isfmu68ZdyDspCYKlGDC5fDQWsyGNE/gCiHjpJ5Dcant/EvaOMcKpu9DjRG
 2bAhhvy9q82+Of3Plq46F0ZUZMYK8aKjc/59aMgueg+FX4lc6QiBRUVZ5yvy725VQGQVwsI16OHtI
 rsusLQLXigiKXDEqIIwnK6pDhrwG06Uh7wSE47s6Dx1Ct5FE85TSq6EAX9JdiZ6AtN0gFPl2rKv3y
 zAk3/yZva5xb/yMSWWCMz+6g080Vc/w9dUq4vC6Fybu48pULyvHfEuEWqotb7JJCE+x1Wwm0qRBK9
 wsykURg5A==;
Received: from shell.armlinux.org.uk
 ([fd8f:7570:feb6:1:5054:ff:fe00:4ec]:46612)
 by pandora.armlinux.org.uk with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <linux@armlinux.org.uk>)
 id 1kyxf7-00076T-Or; Mon, 11 Jan 2021 13:55:13 +0000
Received: from linux by shell.armlinux.org.uk with local (Exim 4.92)
 (envelope-from <linux@shell.armlinux.org.uk>)
 id 1kyxf3-0005Hw-AD; Mon, 11 Jan 2021 13:55:09 +0000
Date: Mon, 11 Jan 2021 13:55:09 +0000
From: Russell King - ARM Linux admin <linux@armlinux.org.uk>
To: DENG Qingfang <dqfext@gmail.com>
Subject: Re: [PATCH net-next 2/2] drivers: net: dsa: mt7530: MT7530 optional
 GPIO support
Message-ID: <20210111135509.GT1551@shell.armlinux.org.uk>
References: <20210111054428.3273-1-dqfext@gmail.com>
 <20210111054428.3273-3-dqfext@gmail.com>
 <20210111110407.GR1551@shell.armlinux.org.uk>
 <CALW65jaqciOiRxJxzPiEADgpmKa7-q2QfQnBdaVMcOa5YDHjRA@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CALW65jaqciOiRxJxzPiEADgpmKa7-q2QfQnBdaVMcOa5YDHjRA@mail.gmail.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210111_085524_008312_00F8DC38 
X-CRM114-Status: GOOD (  15.53  )
X-BeenThere: linux-mediatek@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <linux-mediatek.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mediatek>, 
 <mailto:linux-mediatek-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mediatek/>
List-Post: <mailto:linux-mediatek@lists.infradead.org>
List-Help: <mailto:linux-mediatek-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mediatek>, 
 <mailto:linux-mediatek-request@lists.infradead.org?subject=subscribe>
Cc: Andrew Lunn <andrew@lunn.ch>, Landen Chao <Landen.Chao@mediatek.com>,
 Florian Fainelli <f.fainelli@gmail.com>, devicetree@vger.kernel.org,
 netdev <netdev@vger.kernel.org>, Sean Wang <sean.wang@mediatek.com>,
 linux-kernel@vger.kernel.org, "David S. Miller" <davem@davemloft.net>,
 Frank Wunderlich <frank-w@public-files.de>,
 =?iso-8859-1?Q?Ren=E9?= van Dorst <opensource@vdorst.com>,
 Rob Herring <robh+dt@kernel.org>,
 "moderated list:ARM/Mediatek SoC support" <linux-mediatek@lists.infradead.org>,
 Philipp Zabel <p.zabel@pengutronix.de>,
 Matthias Brugger <matthias.bgg@gmail.com>, Jakub Kicinski <kuba@kernel.org>,
 Vladimir Oltean <olteanv@gmail.com>, Vivien Didelot <vivien.didelot@gmail.com>,
 linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On Mon, Jan 11, 2021 at 09:40:00PM +0800, DENG Qingfang wrote:
> On Mon, Jan 11, 2021 at 7:04 PM Russell King - ARM Linux admin
> <linux@armlinux.org.uk> wrote:
> >
> > FYI, Documentation/driver-api/gpio/consumer.rst says:
> >
> >   For output GPIOs, the value provided becomes the initial output value.
> >   This helps avoid signal glitching during system startup.
> >
> > Setting the pin to be an output, and then setting its initial value
> > does not avoid the glitch. You may wish to investigate whether you
> > can set the value before setting the pin as an output to avoid this
> > issue.
> >
> 
> So, setting the Output Enable bit _after_ setting the direction and
> initial value should avoid this issue. Right?

It depends on the hardware. I don't know how your hardware works, so
I can't say whether doing anything will result in correct behaviour,
or even work.

-- 
RMK's Patch system: https://www.armlinux.org.uk/developer/patches/
FTTP is here! 40Mbps down 10Mbps up. Decent connectivity at last!

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
