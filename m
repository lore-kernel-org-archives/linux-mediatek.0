Return-Path: <SRS0=r4MK=J3=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D73F1C433ED
	for <linux-mediatek@archiver.kernel.org>; Fri, 30 Apr 2021 12:57:16 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 3289661139
	for <linux-mediatek@archiver.kernel.org>; Fri, 30 Apr 2021 12:57:16 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 3289661139
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=public-files.de
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:References:In-Reply-To:Date:Subject:Cc:To:From:
	Message-ID:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=goDI+Ocrs4bKKq/YHu61IulHZnAxyxEZvp5S0Y8G/0M=; b=R1sQ3I06wneL1o68LuS2YNaNN
	VNTAgk/d2bS2//gWC5VMeF2n3WiX27vYOAjZHP8zz8f1SA4kwJcU0BEH20E/NYX2KSvIX4uOxC/Ci
	/Ew3kYyz5HZX1IW02kXfm6DT3iV+3/YzDjd0VmJavGo+JJrhov+nUmiazosomO8Xlvx8zvMRD4jw/
	Wni/U6l5mVZAyzmGYtYN/y/6vFFWg3ZMBg+GLEemucdSQ3U1s1b6oZooHpL84wsevvXLyO5OAagp2
	NJpB3ltAnnqHOmoSamZzSRe3IqlVFvnzpRDdXlEEc/CXry6TtzhqfAnO4BiP8lddfhgsZbxiYfDKf
	HN5ySHPmg==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lcSha-007s7V-NS; Fri, 30 Apr 2021 12:57:02 +0000
Received: from bombadil.infradead.org ([2607:7c80:54:e::133])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lcShZ-007s7L-83
 for linux-mediatek@desiato.infradead.org; Fri, 30 Apr 2021 12:57:01 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=References:In-Reply-To:Date:
 Content-Type:Subject:Cc:To:From:Message-ID:MIME-Version:Sender:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description;
 bh=jiHjwD9KEK68VrKpFF0o4RmJfriOaSNHb7xO6qkSFnw=; b=jBsBjXQCLaC6/tzftqrYtl6w4A
 4pkME3yAPS2deNdVZ+POV1L1DLf3xuZGCf/tssCsW5c21MuEA2zgG2oO/YtX6lvDykoxhlG1syhhR
 G/Yr6az4M4HWhmvhVeMmxjMLgYBvWtCUO75rxRerBaLWAW+WmtvfDiXLUM66FKpeEHB0a83cd/AEU
 65qtC9HW8Dh/ttY8XuZ3dMV0fzrlE6joOHM29tr/pXCLw7BSVuup5MIAsddTNH42pZRvPau3Fqbhw
 glQPz0E7SYsSPzK7cqrZjC/vmv56RnoH/rSrVDCuo0SK8BvsBG0NQX/SdiMOtplWDj8kprg4LbQ2P
 fSqFnYeQ==;
Received: from mout.gmx.net ([212.227.17.20])
 by bombadil.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lcShW-001O2b-B9
 for linux-mediatek@lists.infradead.org; Fri, 30 Apr 2021 12:56:59 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.net;
 s=badeba3b8450; t=1619787383;
 bh=jiHjwD9KEK68VrKpFF0o4RmJfriOaSNHb7xO6qkSFnw=;
 h=X-UI-Sender-Class:From:To:Cc:Subject:Date:In-Reply-To:References;
 b=fNvA3jtJLAhb4p4k8QHUa5XTxtODZkgZLi+CDT8cehPUC2F8NhU3lQGFlQv4hKX4e
 FEgp2lEdJgucvZgPXrLeN4KSTeDbO9YSlgxf1Yo8MgBYkE81Ixw/PR92QHa0FXz2kb
 gkOFX23ZxM3uSWyqtLV8aBkgBTRy9g+GwVT52b64=
X-UI-Sender-Class: 01bb95c1-4bf8-414a-932a-4f6e2808ef9c
Received: from [157.180.225.50] ([157.180.225.50]) by web-mail.gmx.net
 (3c-app-gmx-bap03.server.lan [172.19.172.73]) (via HTTP); Fri, 30 Apr 2021
 14:56:22 +0200
MIME-Version: 1.0
Message-ID: <trinity-611ff023-c337-4148-a215-98fd5604eac2-1619787382934@3c-app-gmx-bap03>
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
Subject: Aw: Re: Re: [PATCH net-next 0/4] MT7530 interrupt support
Date: Fri, 30 Apr 2021 14:56:22 +0200
Importance: normal
Sensitivity: Normal
In-Reply-To: <YIv7w8Wy81fmU5A+@lunn.ch>
References: <20210429062130.29403-1-dqfext@gmail.com>
 <20210429.170815.956010543291313915.davem@davemloft.net>
 <20210430023839.246447-1-dqfext@gmail.com> <YIv28APpOP9tnuO+@lunn.ch>
 <trinity-843c99ce-952a-434e-95e4-4ece3ba6b9bd-1619786236765@3c-app-gmx-bap03>
 <YIv7w8Wy81fmU5A+@lunn.ch>
X-UI-Message-Type: mail
X-Priority: 3
X-Provags-ID: V03:K1:Sa3V4OjTrIKRONdn3NifAbsvIirQD+5771qAC7rFgWOh0xYUx6aMMmd1EPpXyU3LtLuE+
 h+UmC8NEa3TcUD/lHdaoZmwfN7f4GCbb3mr1miP22LyCn5m2ldenQOQWIQHsU3+/ULuE/bsEItTk
 zt/d8NQy//tQPxYO8A5LBKBhU2EcY8oS7JzYpdvHiTUyfdHTSbaWgcI8jfcWu6L7FUAw1q8fnzaD
 8Ndr6yQZ9yQ6GKsJF9/Aqli6MBf3zMg6QLtySxt4eypYDu1MuNVs2iVt69uMY3oRdXNFTuQlj5YR
 M4=
X-UI-Out-Filterresults: notjunk:1;V03:K0:dTgbeb7UncI=:6kflibcpYS25s72RSdJapR
 Wu/WqFhtfUSkIlEStl0DKFlLOFUx7wdKQ7sachIrjnkuodBpA/H719VqEOXsaRJdG+vY4+6MY
 4Lu76ppEkpq2/QsnzLuSSZy5UqJyyS0MQZv7QdOovU+FxmQa94gsEvGizp92j46v0mhnSMYsW
 CJxwlPI04e++8y+Fm1J8a9JsK51ZVP0sRb2qUMIN8Q/C+gb/CI9gS8uTtrExGiyKHxiLv8rna
 dXgJR1LHPMsKpqkav7LEuf4hZ0IjatTa3iTwkQTaXW0eCiwWhqR4DsJp/vYWp9p0CcFd8afGZ
 H4fwJWJ00QDVte7u8lDiT1lHLXPYZhcwjclYtzykFi8713N+DmwNFI7IrjssmDCNFJtR6DErJ
 WsEA8l8h7axQoDu49m62eP+4OnTVrNAbw6hYDzQEKwcfmDxftueC3ZDOo+BmrR7Ai3GmFjIN1
 /D1Kyfe1WPE19SCqUzjf17qbXBrN7EWBUrmfEHxgzmWhgL/dPRbrzrO5kYXOjVggTI3eIhkX4
 Jkha4aBIhzY9yyfU/F2KScfAqttwpFWCY6B8N8scWV9Rl+3+EjWciYE+NQ3+89H7ZhPCIZTXW
 m7VJUu9ZF3bQeTihlp/cVon9IL8xkuGQb9a2ADH/P/oVKe2kyEw4g4+HDLSVjUwWA4H+v1Ct6
 gWjQqFlIgmlCAxMTjSQAug5IgeZhycnfMP9c92vfbin69F62lA/oJ+MIGBi17xtxms+0PCCDf
 LVrHwculOwxAHzDnH8sKaqPR2Up1dtQPc0IOZPtimeE9VsAMJXl1fs1sXP5eVwzxQxXZxms+b
 17X3yKspSHTVlOQSEgUEC6RkBkak6Hx6Uq9W407R/mkLnzrCvNyj18wEyuew8wLtKUo300erB
 RYlBXREWtAfWEggWJvfIQQXMGIjoqlJKshkx49eaMLU7zkbTFHudFKg2ZUWs1XNV4zLZSQlie
 WJp3Eg6P+pKIIzopCjFYlSLT0KM4xpHYfkMhzpnYRVr2YuyitFZitxVNDQHOSzskbtiqOamQ1
 ZeYLvrexM0YYP2ip8e7R/9k=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210430_055658_701159_0F368B75 
X-CRM114-Status: UNSURE (   7.32  )
X-CRM114-Notice: Please train this message.
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

Hi

which ethernet-phy drivers do you mean?
i found only combined phy-drivers with ethernet-handling (marvell,xilinx,mscc,ti) having the "phy-" prefix too

as i see something like this in drivers/phy/intel/

phy-intel-keembay-emmc.c
phy-intel-keembay-usb.c

maybe this in drivers/phy/mediatek/

phy-mediatek-mt753x.c

? maybe with additional -eth, but this seems redundant, as mt753x is an ethernet-switch

or like the other mtk-phys

phy-mtk-eth-mt7531.c (like phy-mtk-mipi-dsi.c,phy-mtk-hdmi.c,phy-mtk-hdmi-mt8173.c)

regards Frank


> Gesendet: Freitag, 30. April 2021 um 14:44 Uhr
> Von: "Andrew Lunn" <andrew@lunn.ch>
> That name will cause confusion with generic PHY drivers. They all seem
> to use phy- as a file name prefix. At the moment, no Ethernet PHY
> driver has phy as filename prefix or suffix.


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
