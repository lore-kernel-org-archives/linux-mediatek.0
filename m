Return-Path: <SRS0=VOwE=NP=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.7 required=3.0 tests=BAYES_00,DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4C142C432BE
	for <linux-mediatek@archiver.kernel.org>; Tue, 24 Aug 2021 17:37:47 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 06880610D1
	for <linux-mediatek@archiver.kernel.org>; Tue, 24 Aug 2021 17:37:46 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 06880610D1
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=6eC9LN1EGAVZdcp9GM//s6tBSF19/0wIop7NOi70FD0=; b=KFUvSS5MT3YPWO
	25kGDMbefBON6nBeGumlu/Nu2/UZCcMhq2Wo2qtFviKADQXji1vwSr00o4oi9uKhPZWcmuHedtA90
	Jyl59Vg4+oS8d0WoDx7UHWSNoXLSQCNHvkEGki5XfLSsRVLoHx0k6J2RUV1HNDohNFMz4oe0vdXop
	TIlk1okE4Fca0NUYgGoT4Y1cVxf2vEuQzZSGsfZvos6qNiePJZx4ZaTRrauYrx91qzBWeNiN2/+sA
	1spuiwb4LoFWmWFdBc+SLwKsnPzQluNEI+4ljENx7kntzlGGj82Uan6F75UtaVV7Flk+fdZoXnO9m
	fxx10JaszqkIoG+UaS6w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mIaMg-004Cbb-0E; Tue, 24 Aug 2021 17:37:34 +0000
Received: from mail-ed1-x52d.google.com ([2a00:1450:4864:20::52d])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mIaMQ-004CWe-2P; Tue, 24 Aug 2021 17:37:19 +0000
Received: by mail-ed1-x52d.google.com with SMTP id cn28so32867455edb.6;
 Tue, 24 Aug 2021 10:37:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=96yzP4yz3JLzphy1QSUobmPAufme29yUUfQ0C0CWToI=;
 b=NG9DD7VYMrDSJ8MYlV0FkIB2v8q1mKFjZfj05Nnk5ESWT8HhHTyUVAsYFevs9IkNyL
 JXo9XP59AbbNqAIxp//KozFSIgv51nkiWoumTWAAW6RPwtS07R6ZZSyAgoKNQJCDQT8Y
 j4esFUzW0qFGXQOFh0Lk5hsP/Hw03KRWV9bgSUve1FL44AQXGAWJaHecZ7XLI1lv6DdL
 qpoECFR709R1Gcr6tsSeFWDqZ27mJOnxSKYf6jSJ2QYoWQ+E5Aa20lb1wU8hk/GU0XFV
 Wo7TjZpNxBx/5kFTSkZtLF66PTUz9W80O5SXRZg3HeXw6mEQXXe1deskGa2qb6/gz5+J
 Mh0w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=96yzP4yz3JLzphy1QSUobmPAufme29yUUfQ0C0CWToI=;
 b=bxRVX+nS3H33Z2gIe5zdgga9YIgk8u++edN+E0vpbQm6zhYaaNJ9VOTwTCC5bmGEKa
 NjXHzF+gNA5mfRx8vxgzoP1NQ/eik88tS5ENWhXYHuXyei7FyRSios/H+2RJXZfCk33h
 GCnWX6z6meYnW8v6heex3sMxq2chFAyFvm9pMGqWx57Tmkwpbdf7D7psIdBOlDXPgF8j
 TkuuYDoVgSSRfc8f2+w+t4yY7wRJ+8v9iBM2UbiEBfIMHRBoqRcv8oWO4PO+/Lh19/FE
 x5vOfXi2OxydoQBycKTNdzcWq9GGaqRS1zz+f4juevG1WSkPkOOn9qRikbk8ok61s4Hi
 492g==
X-Gm-Message-State: AOAM5329kn5RO1Oloxy8cwtRC5L6dlWL/W7+Lz24Ze9jY/43meDscm9F
 LbnyHcbAxnPEQgKEwBlFCw0=
X-Google-Smtp-Source: ABdhPJzA9v8OaCPg4dfXbckH5OLHW+S0cfVd3W/bRRrUZfgwkih0AjV5JuTsER9E1AEn0bGG9WU7dg==
X-Received: by 2002:aa7:c94c:: with SMTP id h12mr25211234edt.378.1629826636863; 
 Tue, 24 Aug 2021 10:37:16 -0700 (PDT)
Received: from skbuf ([188.25.144.60])
 by smtp.gmail.com with ESMTPSA id p5sm9549629ejl.73.2021.08.24.10.37.15
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 24 Aug 2021 10:37:16 -0700 (PDT)
Date: Tue, 24 Aug 2021 20:37:14 +0300
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
Message-ID: <20210824173714.cgpt2addxyjzlbyy@skbuf>
References: <20210824165253.1691315-1-dqfext@gmail.com>
 <20210824165742.xvkb3ke7boryfoj4@skbuf>
 <20210824173237.1691654-1-dqfext@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20210824173237.1691654-1-dqfext@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210824_103718_157850_0821FDFF 
X-CRM114-Status: GOOD (  20.44  )
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

On Wed, Aug 25, 2021 at 01:32:37AM +0800, DENG Qingfang wrote:
> On Tue, Aug 24, 2021 at 07:57:42PM +0300, Vladimir Oltean wrote:
> > I understand that this is how you noticed the issue, but please remember
> > that one can always compile a kernel with CONFIG_VLAN_8021Q=n. So the
> > issue predates my patch by much longer. You might reconsider the Fixes:
> > tag in light of this, maybe the patch needs to be sent to stable.
>
> Okay. So the Fixes tag should be 6087175b7991, which initially adds the
> software fallback support for mt7530.

Ok. Did the old code not need VLAN 0 for VLAN-unaware ports, or are you
saying that since the VLAN table lookup was bypassed completely in the
old code, 'no VLAN 0' was an inconsequential error?

I think it's the latter. Just wanted to make sure. So that means, either
this Fixes: tag or the other, the patch still belongs to net-next. From
my side you shouldn't need to resend.

Reviewed-by: Vladimir Oltean <olteanv@gmail.com>

> > > +static int
> > > +mt7530_setup_vlan0(struct mt7530_priv *priv)
> > > +{
> > > +	u32 val;
> > > +
> > > +	/* Validate the entry with independent learning, keep the original
> > > +	 * ingress tag attribute.
> > > +	 */
> > > +	val = IVL_MAC | EG_CON | PORT_MEM(MT7530_ALL_MEMBERS) | FID(FID_BRIDGED) |
> >
> > FID_BRIDGED?
>
> What's wrong with that?

Nothing, I had a senior moment and I forgot how mt7530 sets up things.

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
