Return-Path: <SRS0=Q+Xe=MZ=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.7 required=3.0 tests=BAYES_00,DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1F0BAC4338F
	for <linux-mediatek@archiver.kernel.org>; Mon,  2 Aug 2021 15:42:56 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id D6110610FB
	for <linux-mediatek@archiver.kernel.org>; Mon,  2 Aug 2021 15:42:55 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org D6110610FB
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=9mlAiPUrW442t98oO4wlf7TFB+v8bBYHZ/oNPbocyNw=; b=RqKOZeXJQXG3x+
	4EztoztvYU/eirLBtGkztrJbmMmXXh6ysb3Mstcx94DvKKmZX4M/DUkYza8twgYh/O0Sx4ziZesL+
	FpR3JX3s6/IVFh0bTgm+9E2ajyedBfgJEUXiFd0qLNkBPJ21PDiZ7gaKvlhoX6d+y6q4nAFJKrD9A
	qEnnE48Reit5LCerGoTLr2Hs3/GgzkxY0ci1ChbQp/dZO2k/EVLC+zyiGHfk9CsWp4A6ixXNW3uyW
	0OwyXcKqrm4GEXy/Ld5r/zG4z5UwYxOu3csZy34T+6hsNy44jYNBj7KnjuwVLfyUqKcAwpwITH4y6
	+b+DsSYck0XTeP8/+oKQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mAa5U-00H0rW-IN; Mon, 02 Aug 2021 15:42:44 +0000
Received: from mail-ej1-x633.google.com ([2a00:1450:4864:20::633])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mAa5G-00H0nj-CM; Mon, 02 Aug 2021 15:42:31 +0000
Received: by mail-ej1-x633.google.com with SMTP id e19so31579132ejs.9;
 Mon, 02 Aug 2021 08:42:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=zs34S0ZCtslSiHpvRfcfD5NqWXVNRsl0rvFFEe/DzVE=;
 b=MIGbOfeJDOB+6qL0tTWTM19ysoYssZnpbVpku3bSQvbeBHlscK2bSzV8i0sCUwPxEQ
 wzTDYG7b3rtlECbq9g76QGuJHOKBlt2gVbv+mra0DCHa3RfOEzfL+S4kszyH6RUbRieo
 DVAwLrNFlLUPev+NCkX5i98ozIrECRCPCmBu5uulTqvqtnu4vDcV9AbY3LZyT+j+V0jN
 RXxJ0QOhznDzY3t2y5krvZWlbpmq5xOu3KOlWEzpQnYSp/jo9evJG++tyGjfSqW2yek1
 GHg28xXfHoQ3CTL2HeupdvWSA1uobTY2MhfSa23kWcm+D/3xBDBxmhzv7+cP6TesE6nr
 DnfA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=zs34S0ZCtslSiHpvRfcfD5NqWXVNRsl0rvFFEe/DzVE=;
 b=AZvXvvNEDrcYJsEk4qlbdNZwLjN5Qt/VxCSG3r0+qjGNE/zgH896WV1SimcIbJDcfk
 wwx+V29/wmz6FHzyqt/Au5DkRQJcUh+9C3kdK0mm7hrB8ImxH4cDhAQStNgHM7qDHc/m
 G6+17DjTO+9bDSHW1UB1LgYmQBJj3rJTatqiFIWA2f8Rc7exSB86GfaGXaQGVAQ+2YMn
 qsMUX1POgnlevi3NLXmCJOl3rDmuYu+stlwBBPt7f/ynaSnbKyI7ZSGVtPs5WrP71GQN
 acHkvnKxBKX9b6aTDjzakjyPM8YbxEuMO1itytWSPHWTh68xs+sAIzeoUJ12tHp9G0N4
 Ip6g==
X-Gm-Message-State: AOAM532rXxI2bRMSRZ8Wc4wCjvtvZ9x7URIU+i87GvhRAU4hXiWkqoUf
 879+LXtdlMJcg9ppF7+MSsg=
X-Google-Smtp-Source: ABdhPJyEjvOm7wA4orU4/gnMjfU4LJ5+DLlqavn510nlHLKRnEWzKyJUmKtNZg/IFP3CcCrMiOe41Q==
X-Received: by 2002:a17:907:766c:: with SMTP id
 kk12mr15603022ejc.525.1627918948585; 
 Mon, 02 Aug 2021 08:42:28 -0700 (PDT)
Received: from skbuf ([188.25.144.60])
 by smtp.gmail.com with ESMTPSA id d22sm4864989ejj.47.2021.08.02.08.42.27
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 02 Aug 2021 08:42:28 -0700 (PDT)
Date: Mon, 2 Aug 2021 18:42:26 +0300
From: Vladimir Oltean <olteanv@gmail.com>
To: DENG Qingfang <dqfext@gmail.com>
Cc: Sean Wang <sean.wang@mediatek.com>, Landen Chao <Landen.Chao@mediatek.com>,
 Andrew Lunn <andrew@lunn.ch>, Vivien Didelot <vivien.didelot@gmail.com>,
 Florian Fainelli <f.fainelli@gmail.com>,
 "David S. Miller" <davem@davemloft.net>, Jakub Kicinski <kuba@kernel.org>,
 Matthias Brugger <matthias.bgg@gmail.com>, netdev@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org,
 Eric Woudstra <ericwouds@gmail.com>,
 =?utf-8?B?UmVuw6k=?= van Dorst <opensource@vdorst.com>,
 Frank Wunderlich <frank-w@public-files.de>
Subject: Re: [RFC net-next v2 3/4] net: dsa: mt7530: set STP state also on
 filter ID 1
Message-ID: <20210802154226.qggqzkxe6urkx3yf@skbuf>
References: <20210731191023.1329446-1-dqfext@gmail.com>
 <20210731191023.1329446-4-dqfext@gmail.com>
 <20210802134336.gv66le6u2z52kfkh@skbuf>
 <20210802153129.1817825-1-dqfext@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20210802153129.1817825-1-dqfext@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210802_084230_503494_B0D18CF7 
X-CRM114-Status: GOOD (  20.30  )
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

On Mon, Aug 02, 2021 at 11:31:29PM +0800, DENG Qingfang wrote:
> On Mon, Aug 02, 2021 at 04:43:36PM +0300, Vladimir Oltean wrote:
> > On Sun, Aug 01, 2021 at 03:10:21AM +0800, DENG Qingfang wrote:
> > > --- a/drivers/net/dsa/mt7530.h
> > > +++ b/drivers/net/dsa/mt7530.h
> > > @@ -181,7 +181,7 @@ enum mt7530_vlan_egress_attr {
> > >
> > >  /* Register for port STP state control */
> > >  #define MT7530_SSP_P(x)			(0x2000 + ((x) * 0x100))
> > > -#define  FID_PST(x)			((x) & 0x3)
> >
> > Shouldn't these macros have _two_ arguments, the FID and the port state?
> >
> > > +#define  FID_PST(x)			(((x) & 0x3) * 0x5)
> >
> > "* 5": explanation?
> >
> > >  #define  FID_PST_MASK			FID_PST(0x3)
> > >
> > >  enum mt7530_stp_state {
> > > --
> > > 2.25.1
> > >
> >
> > I don't exactly understand how this patch works, sorry.
> > Are you altering port state only on bridged ports, or also on standalone
> > ports after this patch? Are standalone ports in the proper STP state
> > (FORWARDING)?
>
> The current code only sets FID 0's STP state. This patch sets both 0's and
> 1's states.
>
> The *5 part is binary magic. [1:0] is FID 0's state, [3:2] is FID 1's state
> and so on. Since 5 == 4'b0101, the value in [1:0] is copied to [3:2] after
> the multiplication.
>
> Perhaps I should only change FID 1's state.

Keep the patches dumb for us mortals please.
If you only change FID 1's state, I am concerned that the driver no
longer initializes FID 0's port state, and might leave that to the
default set by other pre-kernel initialization stage (bootloader?).
So even if you might assume that standalone ports are FORWARDING, they
might not be.

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
