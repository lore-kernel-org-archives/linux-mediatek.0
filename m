Return-Path: <SRS0=r4MK=J3=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 643C3C433B4
	for <linux-mediatek@archiver.kernel.org>; Fri, 30 Apr 2021 15:00:49 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id A9AE46143A
	for <linux-mediatek@archiver.kernel.org>; Fri, 30 Apr 2021 15:00:48 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org A9AE46143A
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=public-files.de
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:References:In-Reply-To:Date:Subject:Cc:To:From:
	Message-ID:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=9hgK97svQH4wgz45gEJpreL4vv1dBk+m/S8ngaHEWqM=; b=NXc5eg6xMLxyupsqEZYM43yh0
	NKBcxxjGIrljsj1wlwGfztdYhLvvbwIDx/K6usm107gnzAJcfzhW04RKcsqSAM2YUddnPj7x7JfHl
	gBxYQj9vZQItK2o4KUFliAItNAQ2Tu2IqEZTENuHPnUQGPGisFSjF1nmO5H4qgxpnjzthFaQfwBoZ
	Z4BQwTlP+i5t7XDAY54BamUgVtTaGxheSpNxWkcJP8SGy59VHf8cN71xLbxkkHJuurfdFFgW4PBq7
	sgPE/1f+iW9Mnh1E2pa1J5cBj8ME0TwExba1ujGhgjdMySZ9f9r+ZqZqm6PbjjEwH6yvICMB7ptOy
	ZmgK9XCSQ==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lcUcz-0080Tl-PB; Fri, 30 Apr 2021 15:00:25 +0000
Received: from bombadil.infradead.org ([2607:7c80:54:e::133])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lcUcy-0080TX-1g
 for linux-mediatek@desiato.infradead.org; Fri, 30 Apr 2021 15:00:24 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:References:
 In-Reply-To:Date:Content-Type:Subject:Cc:To:From:Message-ID:MIME-Version:
 Sender:Reply-To:Content-ID:Content-Description;
 bh=qjlBXZHE04sQy7D1Xhx0X5DzOE6ZA7NOBM8me5C/R/Q=; b=K8a73pcqKbSB0ialzc3Nfu4IEk
 jLChLSRL7QRai+eka+T1j+/XA+QYLILgqVn+BE3RTaIP6i3eSXHojcQc4rfOsid9nZ+pWP/+D938+
 OfbpUkDNlFp7WH4Zgn5O5LVLO4NGtfu0mZ6KJktRuB8cUBcF4aahu6w7W/fUfSTCFRGpyJxW+qg0/
 8ReBWybpjCBob8vSG4HZyeVqQ1Rkul/4OqFV33zlAxcDdAfMTNRastEr/5DRZada/D/elO7LBsgY/
 SxshO1Bp9prBi5RHVEVyIfuld5pEDSW1iDPTfDw1M4hlU+DVVCZptv7Uu05ZTAq+Dnua5W4ZENAP3
 se7imlvw==;
Received: from mout.gmx.net ([212.227.17.22])
 by bombadil.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lcUcv-001Syv-4n
 for linux-mediatek@lists.infradead.org; Fri, 30 Apr 2021 15:00:22 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.net;
 s=badeba3b8450; t=1619794787;
 bh=qjlBXZHE04sQy7D1Xhx0X5DzOE6ZA7NOBM8me5C/R/Q=;
 h=X-UI-Sender-Class:From:To:Cc:Subject:Date:In-Reply-To:References;
 b=YuibwIj8NQPoSbvYknLciWwyHkkOVtMPD/vRJBolyeRU1akGioJNzyOYWWBxiKQGZ
 rNuw5G8UzMcp/wh7KNWKzuBcA4QJ5FH7/u1I7EUHsUK9U8sDJG5G8qEbB0TCy1Bf1A
 9FzYABsuAAAAC0RnjHXZRMic4Y2Nv2fAm31O3zFM=
X-UI-Sender-Class: 01bb95c1-4bf8-414a-932a-4f6e2808ef9c
Received: from [157.180.225.50] ([157.180.225.50]) by web-mail.gmx.net
 (3c-app-gmx-bap03.server.lan [172.19.172.73]) (via HTTP); Fri, 30 Apr 2021
 16:59:47 +0200
MIME-Version: 1.0
Message-ID: <trinity-c45bbeec-5b7c-43a2-8e86-7cb22ad61558-1619794787680@3c-app-gmx-bap03>
From: Frank Wunderlich <frank-w@public-files.de>
To: Andrew Lunn <andrew@lunn.ch>
Cc: DENG Qingfang <dqfext@gmail.com>, David Miller <davem@davemloft.net>,
 f.fainelli@gmail.com, hkallweit1@gmail.com, kuba@kernel.org,
 Landen.Chao@mediatek.com, matthias.bgg@gmail.com, linux@armlinux.org.uk,
 sean.wang@mediatek.com, vivien.didelot@gmail.com, olteanv@gmail.com,
 robh+dt@kernel.org, linus.walleij@linaro.org, gregkh@linuxfoundation.org,
 sergio.paracuellos@gmail.com, linux-kernel@vger.kernel.org,
 linux-mediatek@lists.infradead.org, linux-staging@lists.linux.dev,
 devicetree@vger.kernel.org, netdev@vger.kernel.org,
 weijie.gao@mediatek.com, gch981213@gmail.com, opensource@vdorst.com,
 tglx@linutronix.de, maz@kernel.org
Subject: Aw: Re: Re: Re: [PATCH net-next 0/4] MT7530 interrupt support
Date: Fri, 30 Apr 2021 16:59:47 +0200
Importance: normal
Sensitivity: Normal
In-Reply-To: <YIwCliT5NZT713WD@lunn.ch>
References: <20210429062130.29403-1-dqfext@gmail.com>
 <20210429.170815.956010543291313915.davem@davemloft.net>
 <20210430023839.246447-1-dqfext@gmail.com> <YIv28APpOP9tnuO+@lunn.ch>
 <trinity-843c99ce-952a-434e-95e4-4ece3ba6b9bd-1619786236765@3c-app-gmx-bap03>
 <YIv7w8Wy81fmU5A+@lunn.ch>
 <trinity-611ff023-c337-4148-a215-98fd5604eac2-1619787382934@3c-app-gmx-bap03>
 <YIwCliT5NZT713WD@lunn.ch>
X-UI-Message-Type: mail
X-Priority: 3
X-Provags-ID: V03:K1:3W+2QeaDTZFi/muqkfARvOhkLYrfVFz6/YVDrpYyaSJgd2OdhBIyrcphMnEtviWnmP/1u
 s5AYUR9c0SH+PgDXagUi7Kao7l2UahPWHQbZpqfmebwjqN7gBDm7smwdJMvVmwtsQDwVqzhpvxTn
 pgiYQ5gpZ6rJEZ6/CBeBMEgcbvITDsVKT5Hz8hEFm9VGnEHhavg18a/ZMOJawUMyp+6BXvIbHqV2
 aAnC+GPjuUd+7or8EEqNWjVoSXvrcoCxKX5xFYeSSry1Pksv7GmiuuLSy63A75FrJRe62XHOUhIr
 Ys=
X-UI-Out-Filterresults: notjunk:1;V03:K0:EvyB3StFiq8=:LPmpx5r97csHQm8hjDY+5O
 xlx8rs4bLm4jaxPAppd2FQ2Dmv5INaOH2Lwi75dJJWMJbrS+Rr6HKRJkM1MtNhjLSnyt1Foc6
 AyMN3t+sTZumrhxx3iXvmUHMB9yJwT3l9gqPePgXd6Sl348MmbcqOorf0LNYFAryc+kdVP7Sj
 GnN3XwC6sA0wTWZ9SvaExv/YplOSzc+YZiQvVaGZ8fVlA7ImHLMJQRw9IahRH+tUGEYFVtD06
 iEDU4oKEQ64dFZU4+ZXH165pHBEvGGtJWeqm9cZO6p0xL+CtGwWC7/XCbJ9xZBt9BihRGAsel
 yNU/INVnTExmhKdiYwO00HpBlahz+CvzpSGr9AaUcpmMQ11Ts9a7vpc1TCi72KIwxGw6GFGMJ
 0X8+T/pZhiEY90ay/mG2E/cl2iLjgqiFqr/EUU3nS7AVKSYv+wJSqq0cnzkWTKaIMY6ywTL+q
 xerays+V32MfIXUQDUDjWinbEB6MVFrRKLKPbKNhvpgFqaXQ0dNeUwbWWy4toFQxOm0C8BZtS
 pFU5kA7oWHXDuXmjSADoPnzG7EZ+mZ+tV4gqTw9YlWBQVYp9fBdYcwzGzznGzEL2yP//uqeAz
 LjZx/GTrKZZZiuc87jmeENrlca2Fx9/vZMed7cwDmFT729gNzJnLJUUM3hFUvGSQmDRigVdq6
 5mmWcJ26KwHmlsU/Sz9st5wO4PCFO1EblJ/lWZfL0ouPbotApgKE71fiDXz571/eaJeVdJElY
 oUaOqlBZSV3myH/urs5LrbdIfUjZiiYh2hbRQQ3DjXODMKOx6/ymjT4LN6lkp2NjQQPaYOBOT
 nlEMbbekVVESdqR5hYb1gt6reVN2JlWuWK1rRyBfqzU+Nb5J3Dww+NQpPwK03qmveEVo7Dqcj
 0WrCd0JYpmH3oShRDqlgBa1FtQq5Rf+AyX0W1SJxJsKi7EFo01n0/WEEwWGzxvuo0ay3EvS7D
 mbX+f5dKa8w==
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210430_080021_502839_51765DB6 
X-CRM114-Status: GOOD (  10.04  )
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

> Gesendet: Freitag, 30. April 2021 um 15:13 Uhr
> Von: "Andrew Lunn" <andrew@lunn.ch>
> > which ethernet-phy drivers do you mean?
>
> drivers/net/phy.

ok, sorry :)

> These are all examples of generic PHY drivers, not PHY drivers.

> There is a lot of confusion between PHY drivers and generic PHY
> drivers :-(

right, there is (at least by me) a confusion about generic phy and phy (here net-only phy) drivers.

mhm, maybe the naming should differ if generic phy and net-phy are that different. i guess there is no way to merge the net phys to the generic phys (due to linking to the net device drivers) to have only 1 phy section, right?

but if phy- prefix is used by generic phys, maybe eth- or net- can be used here (maybe with "phy" added)

something like

eth-phy-mt753x.ko

else i have no idea now...my patch renaming the musb-module seems not to be accepted due to possible breakage

regards Frank

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
