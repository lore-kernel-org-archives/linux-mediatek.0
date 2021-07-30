Return-Path: <SRS0=u2zk=MW=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.7 required=3.0 tests=BAYES_00,DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E9AA1C4338F
	for <linux-mediatek@archiver.kernel.org>; Fri, 30 Jul 2021 17:42:50 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id B62906054F
	for <linux-mediatek@archiver.kernel.org>; Fri, 30 Jul 2021 17:42:50 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org B62906054F
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=/UK4SrJzvOJn34YPbgezITLSCTYgDjwCkAwg6OX8QGE=; b=FqHx9IqKT+S76G
	bOsB4qSgsVomMwbdtKf2iAG6H3Ckyc+ttQ+1IO7zgzgDb3d6C45feOC5xUYTN/zdQLa+EjI8XnsPs
	YyozEHHcWGzVWG+Ews9Tn3l5W4J/qUdPECpbSoBr2riO/5mBdAbnNs6sL1tnI4PJ/0wWe4wapOGYG
	xIvkpx1Kl4mud7jhEbixEryRf15kt2R/pXn1syZgPWSYlLI48n6m1RxORG4MEXgny/12b34vhuJMD
	tqn0qq6xU7vCuUkGpg7OO/tg4jiqz6fwBqVJqzfOBrsORorFoUgqZmL3wNFb3R5LgXvDNIxnMgv+6
	u0jsDkOaqJfdVOuJU2cQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1m9WWr-009k0K-W7; Fri, 30 Jul 2021 17:42:38 +0000
Received: from mail-ej1-x62d.google.com ([2a00:1450:4864:20::62d])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1m9WVu-009jU2-CZ; Fri, 30 Jul 2021 17:41:39 +0000
Received: by mail-ej1-x62d.google.com with SMTP id hs10so9507594ejc.0;
 Fri, 30 Jul 2021 10:41:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=fApfSt5TfcvkOvSkBi+6JejmfVBJe/9djRChVT09DVY=;
 b=GQ945PepXalaR/gubS94TrHtXyUfJQUj/J0wpi2xt/pQppLDUysXjv1kVO/m/lqou4
 teYX1WFF4rVpP1ICN7TdzeiN4qh2eUkGkccjS5Px1586ZLToF/ra2F/0rzExRQsYuOt9
 Z58P/w6kgoodFXRW2aGRsp++t70y99E0+yT8kRUbnWIqBfaMkJL/8YdReCWBFTAL70RY
 g0kso1r+V+UnBAOM3QR8pvCVZL6LtX+/9leIza9T6eTn79ZsUh1AqNhk3fvRkLJO6biH
 MmMIq4Clm6HSZCg8YVKJ1eNXjEk0fWhAds+4BKx+rXISnQjYZxJReIdt4SHpZPk4eUFf
 cVzw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=fApfSt5TfcvkOvSkBi+6JejmfVBJe/9djRChVT09DVY=;
 b=TQTv9uQr+2eTnef1NaNjC+JGW+UHm6pyJolAR6xVeGRtu/1CNdd2x5+LTRrurcYKST
 yQZsO+0L4TkJQChshLnY1ykxe6SU8A3NQzNWuIU3188BgHKLPSSupNe7Yf/O3VIM6kJe
 i7ii/s67XSI/WRUUaqIvmpg81CwEOcdABQN28j3k8Kkjo0RqD/NDow1ANwH5qlKKJJYe
 2bG4kX6xXAdxyztdQ2R+5TNPYDcTIED8e3/r+U56bEjNWobvKr1u5Yq1bqyvjEbrY/Pu
 QcXYYxLE+mKOsE2O3/8pf7xEWLglXRX1e6jznGoffykqEShyylKkiqVJ4dJrrmoCBnWY
 zWog==
X-Gm-Message-State: AOAM531RItxPLq8zRCYZa51rycNrzG6UuBxutUbgxVGEdfiSUO8lprgB
 Cmvo7mc8GMSDVJSl8Q+CbDU=
X-Google-Smtp-Source: ABdhPJzbx218edLWLX17ssNbvT6tAZmN03lSwZl+pNjm6ZHecME9cktLF2EhRTTM1pyYebccYGHQzg==
X-Received: by 2002:a17:906:cecc:: with SMTP id
 si12mr3704553ejb.335.1627666896775; 
 Fri, 30 Jul 2021 10:41:36 -0700 (PDT)
Received: from skbuf ([82.76.66.29])
 by smtp.gmail.com with ESMTPSA id n11sm820942ejg.111.2021.07.30.10.41.35
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 30 Jul 2021 10:41:36 -0700 (PDT)
Date: Fri, 30 Jul 2021 20:41:35 +0300
From: Vladimir Oltean <olteanv@gmail.com>
To: DENG Qingfang <dqfext@gmail.com>
Cc: Sean Wang <sean.wang@mediatek.com>, Landen Chao <Landen.Chao@mediatek.com>,
 Andrew Lunn <andrew@lunn.ch>, Vivien Didelot <vivien.didelot@gmail.com>,
 Florian Fainelli <f.fainelli@gmail.com>,
 "David S. Miller" <davem@davemloft.net>, Jakub Kicinski <kuba@kernel.org>,
 Matthias Brugger <matthias.bgg@gmail.com>, netdev@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [RFC net-next 1/2] net: dsa: tag_mtk: skip address learning on
 transmit to standalone ports
Message-ID: <20210730174135.ycsq3dhpr57roxsy@skbuf>
References: <20210728175327.1150120-1-dqfext@gmail.com>
 <20210728175327.1150120-2-dqfext@gmail.com>
 <20210728183705.4gea64qlbe64kkpl@skbuf>
 <20210730162403.p2dnwvwwgsxttomg@skbuf>
 <20210730173203.518307-1-dqfext@gmail.com>
 <20210730173902.vezop3n55bk63o6f@skbuf>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20210730173902.vezop3n55bk63o6f@skbuf>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210730_104138_513706_486FD271 
X-CRM114-Status: GOOD (  18.08  )
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

On Fri, Jul 30, 2021 at 08:39:02PM +0300, Vladimir Oltean wrote:
> On Sat, Jul 31, 2021 at 01:32:03AM +0800, DENG Qingfang wrote:
> > On Fri, Jul 30, 2021 at 07:24:03PM +0300, Vladimir Oltean wrote:
> > > Considering that you also have the option of setting
> > > ds->assisted_learning_on_cpu_port = true and this will have less false
> > > positives, what are the reasons why you did not choose that approach?
> > 
> > You're right. Hardware learning on CPU port does have some limitations.
> > 
> > I have been testing a multi CPU ports patch, and assisted learning has
> > to be used, because FDB entries should be installed like multicast
> > ones, which point to all CPU ports.
> 
> Ah, mt7530 is one of the switches which has multiple CPU ports, I had
> forgotten that. In that case, then static FDB entries are pretty much
> the only way to go indeed.

I forget which ones are the modes in which the multi-CPU feature on
mt7530 is supposed to be used: static assignment of user ports to CPU
ports, or LAG between the CPU ports, or a mix of both?

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
