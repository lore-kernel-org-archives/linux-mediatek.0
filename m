Return-Path: <SRS0=vvwr=KC=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.7 required=3.0 tests=BAYES_00,DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A9AD2C433ED
	for <linux-mediatek@archiver.kernel.org>; Fri,  7 May 2021 07:56:02 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id F1AE161430
	for <linux-mediatek@archiver.kernel.org>; Fri,  7 May 2021 07:56:01 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org F1AE161430
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:
	References:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=IHfrqLX/r6p+kFXLDIGhZijKWLdrgyNox6+dDbgeARI=; b=qBEFAB6f6Ac90GANGxrNq/UG3
	1OzQzPbArPZn0fzTJryiDjw4u5ZLSSlD+4pDAtdJTruNg32sipCn3ew1/Zd7Ajr2toXUlJJvp0uEl
	iEhkoUFX3dFJtWnYGl6Z9sdEZD+/TV+e9UdGT/ietJ9vv0bjU/OLT0xLsEwyREmTYGbkr+sWKuftg
	Ccpwv6iomQOihro3E4sh1TjvKKIGnyegmsEXfZZfvlDZxMSdIIUYjNEj4O8GuktcK2QktljOptJ1q
	zxpZv5542jB+M/q/H96rA2i0O/iNoMbBFXQOhJARmRthGkIgTT8H1Jossj15glPJ2d83X7Z9u4ux5
	RBUGBVkgw==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1levKw-006S6N-4s; Fri, 07 May 2021 07:55:50 +0000
Received: from bombadil.infradead.org ([2607:7c80:54:e::133])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1levKu-006S5p-DH
 for linux-mediatek@desiato.infradead.org; Fri, 07 May 2021 07:55:48 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=Content-Type:Cc:To:Subject:Message-ID
 :Date:From:In-Reply-To:References:MIME-Version:Sender:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description;
 bh=d1FrNuovi6qchn9VoSrH/ZZcEV9n4ZW2UXgmvYmjE+g=; b=V7t703iPtKM9eQhNvEt9nDvb+a
 knZf6gkyg+fFYe1WuFcB0twNcU8AGVniXDZVJedpkUWTmbxyPahqx7DakPJ1Tljn2BzCp2YYybLay
 h92fbe9TIj2g8D1P8q7FW7JwmFLthNesyu4Y500JS+YZp3jyKk3WUtwYdK8jwdtPzlYdquOlzoicq
 eJ3Lf5LXA2V6xbOO2KeoL8riJNo+qg8MbknJmN7kzhWPVaKeoF/6fTuJmDMwQGEfN/bLa0oWF1KF7
 NT2PVO/GwCKQNyAkjkAWVVMxjxiA+3+/ie04KCiBo1dkj3r+M+8p9MnT5to0dDicvnvEL64MzhEKm
 MlWwiU2A==;
Received: from mail-lf1-x132.google.com ([2a00:1450:4864:20::132])
 by bombadil.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1levKr-006ffp-Ow
 for linux-mediatek@lists.infradead.org; Fri, 07 May 2021 07:55:46 +0000
Received: by mail-lf1-x132.google.com with SMTP id 2so11548440lft.4
 for <linux-mediatek@lists.infradead.org>; Fri, 07 May 2021 00:55:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=d1FrNuovi6qchn9VoSrH/ZZcEV9n4ZW2UXgmvYmjE+g=;
 b=u/fBwS9p8+ZJ1uzUyj9xWfncK+l0n+O3W0A4tJwhN9+RVhbt/VxvDgu1xrwj2TQchS
 T/WPQv24Xe7/GAMWEocVZZ+VeKuAueYMPejrAQ4dHHkQAaQ0f9lWCavmcbn4ZeuMHtyd
 G0q3a5q2xnS7zV2HZgTnSwnhjlmYBHQujJe9LsIZ5vndhGoSOKiL7mXJZ78Qr6SDkgkk
 I2yUR6lRzrz7o/PcVSpNT+6WPcHUdg3M6VcLyoKjuCE8zy3empFn+fAyPxxgJbGbFFzG
 gedCmZnjFIIrU9ayPlv9omPusy40prB3L31vMgUr0/mQKWtGrPNBiYiQJ67pkAMJZj0h
 Oj5g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=d1FrNuovi6qchn9VoSrH/ZZcEV9n4ZW2UXgmvYmjE+g=;
 b=kcI/ZCHP2vnwJkJDwaad5T1pIVcOHf5xKuHR+I1fOdOIA/ild9G2QJ4LMUd4goKZKF
 4ZtNmf9Goh4AXmoKrc8qndMNIDQI91cS0ymAAklHIrLPoIp/o0PTa9Fy7eDg7MVTX6Hv
 a3kZ86lGWM5EW9ysZr1ZITsULSex1InRKEoxffVa7Bl85cxy9HEAY+dyNpuGpXyF+Vbi
 B6OLTqmq5Fa6qK0zFEt+QVr45U/gWOX4ISBzACqNxfXkAPjOgdtqcNNyhgcxh/M5UjmX
 U5o3ecbjE06HtvKhKG5Snpb8HFMud+CN8mFCkLmCw8Ke2clRAm0sK7YrnhSSkKZ7gBK5
 lN/Q==
X-Gm-Message-State: AOAM530RKnbPNqfU70Zpfe2vOcJIGiExywMo7Sl/t1TI9rTLu9L2WFtW
 DxImPTaXdfgyuCgMgUkVeRka5VHAKbGjoRLE3AI=
X-Google-Smtp-Source: ABdhPJxmOfmHUfXXyaTbU88iBMHRGJL5QKoxgPRItgy6u662XlJ1CgzE8LYRu4JF7W41BVjOUogeB1Zoj1BFMzNjYeM=
X-Received: by 2002:a05:6512:3f27:: with SMTP id
 y39mr5490221lfa.166.1620374142511; 
 Fri, 07 May 2021 00:55:42 -0700 (PDT)
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
 <CALW65ja5mRPoNM2EZsONMh8Kda5OgQg79R=Xp71CaQcp4cprnQ@mail.gmail.com>
 <f3f5167f60b7897b952f5fff7bcaef976c3c6531.camel@mediatek.com>
In-Reply-To: <f3f5167f60b7897b952f5fff7bcaef976c3c6531.camel@mediatek.com>
From: DENG Qingfang <dqfext@gmail.com>
Date: Fri, 7 May 2021 15:55:31 +0800
Message-ID: <CALW65jaPO52vX02KGqEooE2LRUMNMgFoHYMfyXUtOa7SPS-jqg@mail.gmail.com>
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
X-CRM114-CacheID: sfid-20210507_005545_829057_9F13F7BE 
X-CRM114-Status: UNSURE (   9.29  )
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

On Thu, May 6, 2021 at 8:54 PM Landen Chao <landen.chao@mediatek.com> wrote:
> MT7620's FE PHY HW is different from MT753x's GE PHY. Vendor registers
> of these two PHY are totally different.

Okay. So if the FE PHY is added later, it can be named mediatek-fe.c.

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
