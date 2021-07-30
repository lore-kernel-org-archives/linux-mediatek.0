Return-Path: <SRS0=u2zk=MW=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.7 required=3.0 tests=BAYES_00,DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4D3DFC4338F
	for <linux-mediatek@archiver.kernel.org>; Fri, 30 Jul 2021 19:07:36 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 16FDF60F00
	for <linux-mediatek@archiver.kernel.org>; Fri, 30 Jul 2021 19:07:36 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 16FDF60F00
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=7/e8QZwmvKQmTbXHGItQol9VBCeD/JPeIYsJZCe3dJU=; b=ToTbqw9jkeup3g
	4wZm9w4APcTiEnfP2w6FgRi26m0qsR/pbmGlGkmeaZ2+LSCz2KKe1t2pd7t97KR2ZbgUf5tDTpVKc
	/uYoObYq7ifV6rnaoF5QPwqh49nB0ggrpkXupk4Be3dQ2AZhkUf0SFWaaPJHOjl65qqnnKsY+lnl2
	Ji5BsiQ7dUixt3MRCFtGEXd1KfA7Uieo/K6AYyzng48HagRWZ54bXsg3M2yQCVWZeN4/PUvQbov50
	VDRWOT/ZPDBeNEaDcCHXgzhZ2HBF1tEvkji9JChRmK8AmeBLhGAij71YMLOSctha59M/IcIKBtKft
	uxQiVMqov1ESrNDome8g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1m9Xqu-00A1z4-Jt; Fri, 30 Jul 2021 19:07:24 +0000
Received: from mail-ej1-x633.google.com ([2a00:1450:4864:20::633])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1m9Xqf-00A1vH-Mv; Fri, 30 Jul 2021 19:07:10 +0000
Received: by mail-ej1-x633.google.com with SMTP id v21so18635112ejg.1;
 Fri, 30 Jul 2021 12:07:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=e8f4lcsPiJ3HGD4KPSWDS3ppWYq9M+P3wkpoyc+VO8w=;
 b=VzNCpodjTbGJ1h3RWJ4m7xZ0UvZI+Qk7PN1WqC8uE1LMFt1elPjP2OFe3tLRuyNdnE
 3z2j1nfPaTGY2n6tTyZn2MhgpX6B2Gx4WPV3is5QXHCOUOAYHA0pfSjW1aSKmwvFX0cD
 GZmKWnkVxtaj40+n51S8Edx7eFmJBYNYV4NPqfI+R3tFa2sNrFtoZ606NZk4E58U42cM
 //03VjkkcXuMg7ipYDa7kkp7i7z1QPeeySFPn5BAGBicX0bCVM1Wb+ZXzbmeL8gCnn2A
 CtmIcNJkXWWeKEqi7cWRxvlRH4k4a1TTLG/3CP6QqGkQGKQjPQ59P3uqzu3wWji00cQw
 ZqsQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=e8f4lcsPiJ3HGD4KPSWDS3ppWYq9M+P3wkpoyc+VO8w=;
 b=uiO6r5fAFJ9R6P2dyrbBu16tj2Eien6GEeQXEjOoGio6xyrP64a+n9XVBCsCXkYQYy
 kYIF7swIjT7QhJHdAr9QG76N9UehuBIfwcDsEp5XDedUuBkBmt/lsyuSoY/bWz6DjQ+f
 lcvGtmmOhhWWStxTdsBGHHepMZ4Rv/7wV57yyB+qk1gMSPK8A5eQnCHsEvj9uRDMQ/Vy
 CjYusoH/0DBtw74qwy0/Nsw2lYghKszG7QtePQGH0c2ZPd4oWvG7Kpfhz9TI4uC+HSFZ
 CoDNBtYX3K9fEmtuRhMjvUp1hsXZ/5WlQ0w8CAf4EERSbb2hrh1gBzaLY6B6K6tKE/wf
 gMYQ==
X-Gm-Message-State: AOAM533drVicDY51/W7lRVeJ3t2O7WR7ELgQfh7FQqmjVNLizs84oK0y
 QNN1E9D/l4LMlBJtJ3S7FQs=
X-Google-Smtp-Source: ABdhPJw7sKiaK516UBNTL6irnVQE7OfE7dl0ZV5DJI/pu6FmwyKwV5ypwy5U+LfXesW1jZecq43tkg==
X-Received: by 2002:a17:907:1b02:: with SMTP id
 mp2mr4139238ejc.196.1627672028400; 
 Fri, 30 Jul 2021 12:07:08 -0700 (PDT)
Received: from skbuf ([82.76.66.29])
 by smtp.gmail.com with ESMTPSA id br3sm858993ejb.103.2021.07.30.12.07.07
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 30 Jul 2021 12:07:08 -0700 (PDT)
Date: Fri, 30 Jul 2021 22:07:06 +0300
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
Message-ID: <20210730190706.jm7uizyqltmle2bi@skbuf>
References: <20210728175327.1150120-1-dqfext@gmail.com>
 <20210728175327.1150120-2-dqfext@gmail.com>
 <20210728183705.4gea64qlbe64kkpl@skbuf>
 <20210730162403.p2dnwvwwgsxttomg@skbuf>
 <20210730190020.638409-1-dqfext@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20210730190020.638409-1-dqfext@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210730_120709_793723_0733C675 
X-CRM114-Status: GOOD (  14.00  )
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

On Sat, Jul 31, 2021 at 03:00:20AM +0800, DENG Qingfang wrote:
> On Fri, Jul 30, 2021 at 07:24:03PM +0300, Vladimir Oltean wrote:
> > Considering that you also have the option of setting
> > ds->assisted_learning_on_cpu_port = true and this will have less false
> > positives, what are the reasons why you did not choose that approach?
> 
> After enabling it, I noticed .port_fdb_{add,del} are called with VID=0
> (which it does not use now) unless I turn on VLAN filtering. Is that
> normal?

They are called with the VID from the learned packet.
If the bridge is VLAN-unaware, the MAC SA is learned with VID 0.
Generally, VID 0 is always used for VLAN-unaware bridging. You can
privately translate VID 0 to whatever VLAN ID you use in VLAN-unaware
mode.

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
