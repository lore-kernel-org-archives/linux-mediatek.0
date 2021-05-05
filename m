Return-Path: <SRS0=WaF/=KA=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.7 required=3.0 tests=BAYES_00,DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A2169C433B4
	for <linux-mediatek@archiver.kernel.org>; Wed,  5 May 2021 09:47:31 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id EC02F61008
	for <linux-mediatek@archiver.kernel.org>; Wed,  5 May 2021 09:47:30 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org EC02F61008
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:
	References:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=mpB8I5JADfZR6uu6SyJ9RKx0KiLakXZTRvPIo2MLtKA=; b=m2CvzyUC7udOqPjx0OF4zb3Az
	MuJHgtJwTdXyiRNGsgCBPDccYHjCq6FAHrvjzTwabEDF+hcuMgT7hj/iudaG26WI+p6giJA2EQXAR
	KDDHwgwAXhEVWrEpnHdVc90x5EwUZXHKaScjh5X/EZfojHqAx5ZC0OuBpe9bsJuemcccyJIma8c/4
	SqUZR0cwwbkXbOkYRKw6s4MCL9gN9ufEL/d+r76usLhkOHMYxGjTTSuOQUwcTjhCxFqewr1EjWLBb
	1zjiLjdF4aYCvq2hKcsy5q0RAd0lp+NimVN9CNPSFy1VIRPTaWU2ZV8KK/kfx6ahKOGx8dye+dGgK
	EcryQCpUg==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1leE7Z-000myG-Kd; Wed, 05 May 2021 09:47:09 +0000
Received: from bombadil.infradead.org ([2607:7c80:54:e::133])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1leE4A-000lYs-BK
 for linux-mediatek@desiato.infradead.org; Wed, 05 May 2021 09:43:40 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=Content-Type:Cc:To:Subject:Message-ID
 :Date:From:In-Reply-To:References:MIME-Version:Sender:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description;
 bh=6c3Xgmn5T37TIiY6YlqNonCt6qbYnwH+SLVXsWNUIl0=; b=Q6ZLMYub8QcJQEN02D9Ulps98r
 PKMZuTAXbtK0YNjB/e0Hg0SWgbxzY3ZZSyUsl/d5qBJd0rnjEJV9vELF1ST13oDDs2woDY8+7OBwf
 1yMir6sJ7f19ISgB8j6a26hpDMVKulWquFhqLLNwWa1w94SlxgkESTPw0Vl1Vzr01wuH3VizNIjgs
 bJ9ZnbxJ+7e28PNCCUM2pHlIYttFKPEm2tcECZkDeFmbp9hW1M8fTuFRCLYPglwJnF+/LLaWsvJMI
 WlxuaL9MeSL6CEszizLsBQHWNu28xGDBNWWEiieSY3Q2xSp0pnSl+OQcun+PXa+uavLSwdRWk3cku
 y6W306LQ==;
Received: from mail-lf1-x134.google.com ([2a00:1450:4864:20::134])
 by bombadil.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1leE47-004d23-Op
 for linux-mediatek@lists.infradead.org; Wed, 05 May 2021 09:43:37 +0000
Received: by mail-lf1-x134.google.com with SMTP id z9so1654467lfu.8
 for <linux-mediatek@lists.infradead.org>; Wed, 05 May 2021 02:43:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=6c3Xgmn5T37TIiY6YlqNonCt6qbYnwH+SLVXsWNUIl0=;
 b=tlTyUi3kNACJZhVQLNA0q8gUswN+/IMa21mbaLzlaLXmWzl7Wu/8y3gc7AI4RJ7gp5
 hkz1WvvJr4s16xg4aIGzXIiaFq++4fidadR9bsQtZVGviOdXVS5+sCckZ/S8tZB7OF7i
 mN+OyC3oW7V0DgYb7z4XiON9PrXOB6FqDvFbeZVyOpSGqydB78TCyIk1nYnrCmMy4YCr
 Tpu3gWJsG36gx1d3SQi6bArBRjmJQBi16tJQ0dBTJOjxi+dR/7zn/s30V9BovD0g2HbN
 13nAhm0Wmx65jEDp0PeKMWOU+RWpsh834jaNzxv91k/ORKN5U0m/BcIlQfSqyPOYO4FQ
 kg8g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=6c3Xgmn5T37TIiY6YlqNonCt6qbYnwH+SLVXsWNUIl0=;
 b=Q4XZwcFK6kdJWcSt2QqUQfw+64xZvdIOeSvMxSWUX7PLf/tbGuqXvsMOXlj9/cVt+X
 UjJXRO7TBtVypbSLisDQ2O0DT46plfDHOCMwUrGURwq4NTJgPzJ8VScgwf1iSWkzpyW4
 0SKKDH2C1dQsgw1NRBPcHB1S+DkBafrOGd0g4JLvIYo9SNlyLtE8ygGTSr/W/h53hbSC
 0GAqdo6GpiLhAOnqfNyfyplS5wOcM4h95vGUb3E+6IBQ33MAGIKKsR55DVxxWYEcIhTW
 OsKbOh3jma8z60Zk/ByhQ53ofsju+voqmsZY4F51w0w42GHgT0k1ZOrAWtRDaKfBUTK6
 9RZA==
X-Gm-Message-State: AOAM530wLJ2bzL5K98XhptiMRbGMELp1gqP2ZJq/wqv28imFX4TNJUJs
 m+Ndu1PJytMbMNpowX8d+QsWblzBXInP4KbHeHU=
X-Google-Smtp-Source: ABdhPJw6OWZKpcheUIXN4U6xqnJjupiMHWXCfxCTfUuc3HFjNvUcQ9YcgrDewl5kohtJyeEZNwEigc4i9Z3u2NQfWlY=
X-Received: by 2002:ac2:44b1:: with SMTP id c17mr1737771lfm.527.1620207812971; 
 Wed, 05 May 2021 02:43:32 -0700 (PDT)
MIME-Version: 1.0
References: <20210429062130.29403-1-dqfext@gmail.com>
 <20210429.170815.956010543291313915.davem@davemloft.net>
 <20210430023839.246447-1-dqfext@gmail.com> <YIv28APpOP9tnuO+@lunn.ch>
 <trinity-843c99ce-952a-434e-95e4-4ece3ba6b9bd-1619786236765@3c-app-gmx-bap03>
 <YIv7w8Wy81fmU5A+@lunn.ch>
 <trinity-611ff023-c337-4148-a215-98fd5604eac2-1619787382934@3c-app-gmx-bap03>
 <YIwCliT5NZT713WD@lunn.ch>
 <trinity-c45bbeec-5b7c-43a2-8e86-7cb22ad61558-1619794787680@3c-app-gmx-bap03>
 <YIwxpYD1jnFMPQz+@lunn.ch>
 <fc962daf8b7babc22b043b2b0878a206780b55f3.camel@mediatek.com>
In-Reply-To: <fc962daf8b7babc22b043b2b0878a206780b55f3.camel@mediatek.com>
From: DENG Qingfang <dqfext@gmail.com>
Date: Wed, 5 May 2021 17:43:21 +0800
Message-ID: <CALW65ja5mRPoNM2EZsONMh8Kda5OgQg79R=Xp71CaQcp4cprnQ@mail.gmail.com>
Subject: Re: Re: Re: Re: [PATCH net-next 0/4] MT7530 interrupt support
To: Landen Chao <landen.chao@mediatek.com>
Cc: Andrew Lunn <andrew@lunn.ch>, Frank Wunderlich <frank-w@public-files.de>, 
 David Miller <davem@davemloft.net>, Florian Fainelli <f.fainelli@gmail.com>,
 Heiner Kallweit <hkallweit1@gmail.com>, Jakub Kicinski <kuba@kernel.org>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 Russell King - ARM Linux admin <linux@armlinux.org.uk>,
 Sean Wang <sean.wang@mediatek.com>, 
 Vivien Didelot <vivien.didelot@gmail.com>, Vladimir Oltean <olteanv@gmail.com>,
 Rob Herring <robh+dt@kernel.org>, Linus Walleij <linus.walleij@linaro.org>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 Sergio Paracuellos <sergio.paracuellos@gmail.com>,
 linux-kernel <linux-kernel@vger.kernel.org>, 
 "moderated list:ARM/Mediatek SoC support" <linux-mediatek@lists.infradead.org>,
 linux-staging@lists.linux.dev, 
 "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS"
 <devicetree@vger.kernel.org>, netdev <netdev@vger.kernel.org>, 
 Weijie Gao <weijie.gao@mediatek.com>, Chuanhong Guo <gch981213@gmail.com>, 
 =?UTF-8?Q?Ren=C3=A9_van_Dorst?= <opensource@vdorst.com>, 
 Thomas Gleixner <tglx@linutronix.de>, Marc Zyngier <maz@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210505_024335_823839_D52CA906 
X-CRM114-Status: UNSURE (   9.82  )
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

On Wed, May 5, 2021 at 5:31 PM Landen Chao <landen.chao@mediatek.com> wrote:
> How about using mediatek-ge.ko. 'ge' is the abbreviation of gigabit
> Ethernet. Most mediatek products use the same gigabit Ethernet phy.

Well, MT7620's PHY is FE..

>
> Landen

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
