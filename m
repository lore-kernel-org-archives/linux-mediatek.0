Return-Path: <SRS0=VOwE=NP=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.7 required=3.0 tests=BAYES_00,DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 34488C4320E
	for <linux-mediatek@archiver.kernel.org>; Tue, 24 Aug 2021 17:17:21 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 00A8A610FD
	for <linux-mediatek@archiver.kernel.org>; Tue, 24 Aug 2021 17:17:20 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 00A8A610FD
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=pkmNGAwJb5Dg3jQnq8lhzhvJ0YdyZWTEIwvHkF90DKw=; b=mAZiIWBEp0CDrc
	VB9vzYebDy8WyruQdiOSby8pWqXGghbOehHiZpHfQJFkNp7gcaP1RTnzjoIfC/+lY/dc9C3LsjWUQ
	nVyCfa2KB22NvCyZ9PQCH+DvxszYIAd24UIgTTsteFJSt7OG1hC7Xt7W2NbZZx/oJ3ZPRot/Und1E
	V9nzMk9xOMCJ9VwcYinXC7NsZ1C+3qgIwO11Ff9JjcBb7YEBWLTSfkZF3F7zeb1XiCrzVXCvAJag1
	CMIvFnaXlAyCgyQiZx5+Ey9z5g8CvqlQq9MTYe64NRhoWf9YUMV6C+UecbR8RfTMxV7arbZ0z+dP+
	sKukw/zv0VZ/N66pSf1A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mIa2r-0047RL-KB; Tue, 24 Aug 2021 17:17:05 +0000
Received: from mail-ej1-x630.google.com ([2a00:1450:4864:20::630])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mIa2e-0047P3-Vr; Tue, 24 Aug 2021 17:16:54 +0000
Received: by mail-ej1-x630.google.com with SMTP id bt14so45872244ejb.3;
 Tue, 24 Aug 2021 10:16:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=ZrICEbmTTI5X+hclm7WK+PbQzG8reRJWlDrlnWqe5QM=;
 b=V7GFYricmNupzBQJITddKiJ5ku1Lqevd9U9bxpSrk0jzLvBuYGDIYibumqRNN0x5vp
 pSb64XnQkxG4tDTrNORxvVC6r/yjy64p4Gcem3ESHcB5ZNYGrW9cl6YZfdTXqGRCiVe7
 eq1VENoEhmH7DmNn4kapGxS5qi7KlF/N9RlD8Lx/C+kZGtyG1RHWVREmLQsDYZbq6lYK
 tpn2eyaAgXC2EaIIEnLDW7kcIpM7qUcG94JDw+jLRXbvxpbKffMn3jD8swoBhVDcj8Ww
 Ac9UtFbl535gK/3LeP2yd3dSnBDXYhh61E8eFOiNrBs561D7YgygGR4UvbDe91vcLyzB
 8uUg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=ZrICEbmTTI5X+hclm7WK+PbQzG8reRJWlDrlnWqe5QM=;
 b=dFbK2Eq5hh6FLyueo2Lro0y9k11BZPN85jZMPZpEKxnlobfRQZhczte47ieG7gw3ob
 ES1x4Lon3Pe6u7cmVWDAH/4Tia8I0MQPRMbPgajBqQcy83FBMdWJqlMIjYVkaaM+1+jf
 9/qtGqQFt1lxINpwch6kFWhi1cahmw957Mia06EDEvXIbCS2tuCUdPWRSY6+aPr/3XTJ
 AqJnJZr47YiovRiT4HWzWdk7t85SasNO7+nzDvxEFFJJgCGCfAcZiofjSuPNRMA9j1zp
 zSEJtSfjniwqo8FkWY5AtU8f1wfEUKmKVtV2B0fx4iQiAJejHdXGkTrFKonSoJCBL29J
 8u8Q==
X-Gm-Message-State: AOAM530uOD3FTlYgQDonssc5V9xag8dqYzD5scvCJ5ddTvRI+gu/FuuU
 UaIYsCtBuB0BmnX7NYCDRsQ=
X-Google-Smtp-Source: ABdhPJwdGCzqk1Ny2qU9cmtS61qz1uXqMNjNnjfRHaaaWhcZMJ32Yp6OFCb0QywNgpvRbXpje3KbyQ==
X-Received: by 2002:a17:906:401:: with SMTP id
 d1mr1200691eja.242.1629825411500; 
 Tue, 24 Aug 2021 10:16:51 -0700 (PDT)
Received: from skbuf ([188.25.144.60])
 by smtp.gmail.com with ESMTPSA id v1sm9951266ejd.31.2021.08.24.10.16.50
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 24 Aug 2021 10:16:51 -0700 (PDT)
Date: Tue, 24 Aug 2021 20:16:49 +0300
From: Vladimir Oltean <olteanv@gmail.com>
To: DENG Qingfang <dqfext@gmail.com>
Cc: Sean Wang <sean.wang@mediatek.com>, Landen Chao <Landen.Chao@mediatek.com>,
 Andrew Lunn <andrew@lunn.ch>, Vivien Didelot <vivien.didelot@gmail.com>,
 Florian Fainelli <f.fainelli@gmail.com>,
 "David S. Miller" <davem@davemloft.net>, Jakub Kicinski <kuba@kernel.org>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 Philipp Zabel <p.zabel@pengutronix.de>,
 Russell King <linux@armlinux.org.uk>,
 "open list:MEDIATEK SWITCH DRIVER" <netdev@vger.kernel.org>,
 "moderated list:ARM/Mediatek SoC support"
 <linux-arm-kernel@lists.infradead.org>, 
 "moderated list:ARM/Mediatek SoC support" <linux-mediatek@lists.infradead.org>,
 open list <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH net-next] net: dsa: mt7530: manually set up VLAN ID 0
Message-ID: <20210824171649.ebcolsbsqczomiee@skbuf>
References: <20210824165253.1691315-1-dqfext@gmail.com>
 <20210824165742.xvkb3ke7boryfoj4@skbuf>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20210824165742.xvkb3ke7boryfoj4@skbuf>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210824_101653_092232_F7C8BD79 
X-CRM114-Status: GOOD (  11.77  )
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

On Tue, Aug 24, 2021 at 07:57:42PM +0300, Vladimir Oltean wrote:
> > +static int
> > +mt7530_setup_vlan0(struct mt7530_priv *priv)
> > +{
> > +	u32 val;
> > +
> > +	/* Validate the entry with independent learning, keep the original
> > +	 * ingress tag attribute.
> > +	 */
> > +	val = IVL_MAC | EG_CON | PORT_MEM(MT7530_ALL_MEMBERS) | FID(FID_BRIDGED) |
> 
> FID_BRIDGED?

yes, FID_BRIDGED.

Please confirm that the Fixes: tag is the one you intend. The patch appears fine otherwise.

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
