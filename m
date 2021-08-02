Return-Path: <SRS0=Q+Xe=MZ=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.7 required=3.0 tests=BAYES_00,DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 86875C4338F
	for <linux-mediatek@archiver.kernel.org>; Mon,  2 Aug 2021 15:32:08 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 43908610FC
	for <linux-mediatek@archiver.kernel.org>; Mon,  2 Aug 2021 15:32:08 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 43908610FC
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=v8RPF9GllSaZbalKL6OLm00fE0lAFwM/AhsPYnEvids=; b=uUdcDe6UFvwFwG
	mjoZiudbBgAMvZu9XQR7JbWd0mROvp1ngHVm9Tfvog6JlWO3bXGC/ExZi26ahZzw8eY9arXxWEiR0
	2YhpoFf78cvEZgaetArJYWkDK1nhWRsHwg9LLyKjSA298u3Xqg/qKyGMi4BdIPAFxKcGZecvZ0CtF
	zOazKM1cfwQK1I5p1Rey74r9rSbIQjCVu6Fo3NdhlVuzcE26cjJpU5rpgskZ4KoZkKgET0kmHVt40
	MYtc66ZShliBAVSEZRZ4tL5DKjatQA5ysT6Vm/Y8xKMPedkCfCCuZoIBWginpiy+Ss81+kEJKVSaZ
	Q/ByEpz6d/YbjkSXnhEw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mAZv0-00GyAn-P6; Mon, 02 Aug 2021 15:31:54 +0000
Received: from mail-pl1-x62b.google.com ([2607:f8b0:4864:20::62b])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mAZum-00Gy4m-AI; Mon, 02 Aug 2021 15:31:41 +0000
Received: by mail-pl1-x62b.google.com with SMTP id i10so20057007pla.3;
 Mon, 02 Aug 2021 08:31:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-disposition:content-transfer-encoding;
 bh=C5OMswoswv+jB7pgeCuURms//5qLAEczlfx8fB13L08=;
 b=unv2eUIShdKKvqz+C9284ywgySqqiR+tOum9IzVOEsLofRriNzUvN3A7HBu7FbhmsM
 iPzvDdVMDwThWoXP2MSGoBjT60lrGsFimqHMoQA+9bs8tI9npfXl7lIseiLXbNTYHI+g
 FQ8PIw2ePExWM+xXcczRLdZmQkgKq7rNTLyF764+Jl93soMJt+t2JdOHsiYeT+yC+bVj
 kOKZnR5krlpGvm9YkyuTUdfYXD8KskslTEoifv+Kb2FGoypdb63IqNdLPWpzHdrNH4pX
 3Dn5+XK2RisTlkZxuXTVa8vO44pFeVxXCOMgkM8QlIoMmzFRLy+hBNRZbAvZWycSHYHS
 UQXQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-disposition
 :content-transfer-encoding;
 bh=C5OMswoswv+jB7pgeCuURms//5qLAEczlfx8fB13L08=;
 b=d3lSwNiwDo7xHvCT3zGaroo0oVaBJIbyKMPZmcngIgIiNgAxMO/kNhqZsEczyfaa83
 VTFUJF88BD9Wm0qxYweT+4XvXgjVkUlWb5BKbjkyrH70ItNdOqcsHCMaVV0XZU+mNWwD
 lKPoAj1r/Ml4Qjqvl7vMfWGXEHw6eBkAkbEM4Z16h1Nv6iC4P6wOLy1Y5PT/TnStmo1q
 OPsYjWumLJemf60If3VYja6s6qwI6WG8CDCFZm8zJ4cQdzCvdlUOZg12OZv3BC3NQwBN
 O3YevAd0DJH7JKh1XjTjjx+awSBsrKLiqlgBOXfytv2iSrK+wyY+aWwshnphk2QbkpRn
 WGxg==
X-Gm-Message-State: AOAM531HBgPmiZDn5In2/V6RpqoCKltRxxmL8Z5bhxJg1wbb38ALZCxP
 HVEOSs0X5fy8Can1oUYm0Go=
X-Google-Smtp-Source: ABdhPJz/8Y4cKIXHJVY6ScTVMCLUzj4aFcyHt+HnBAF2k/MyhE1W2QVgMUm5dqGt1LhAXE4LEHk9Zg==
X-Received: by 2002:a63:4e51:: with SMTP id o17mr2314187pgl.126.1627918298584; 
 Mon, 02 Aug 2021 08:31:38 -0700 (PDT)
Received: from haswell-ubuntu20.lan ([138.197.212.246])
 by smtp.gmail.com with ESMTPSA id d22sm6784080pgi.73.2021.08.02.08.31.33
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 02 Aug 2021 08:31:37 -0700 (PDT)
From: DENG Qingfang <dqfext@gmail.com>
To: Vladimir Oltean <olteanv@gmail.com>
Cc: Sean Wang <sean.wang@mediatek.com>, Landen Chao <Landen.Chao@mediatek.com>,
 Andrew Lunn <andrew@lunn.ch>, Vivien Didelot <vivien.didelot@gmail.com>,
 Florian Fainelli <f.fainelli@gmail.com>,
 "David S. Miller" <davem@davemloft.net>, Jakub Kicinski <kuba@kernel.org>,
 Matthias Brugger <matthias.bgg@gmail.com>, netdev@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org,
 linux-kernel@vger.kernel.org, Eric Woudstra <ericwouds@gmail.com>,
 =?iso-8859-1?Q?Ren=E9?= van Dorst <opensource@vdorst.com>,
 Frank Wunderlich <frank-w@public-files.de>
Subject: Re: [RFC net-next v2 3/4] net: dsa: mt7530: set STP state also on
 filter ID 1
Date: Mon,  2 Aug 2021 23:31:29 +0800
Message-Id: <20210802153129.1817825-1-dqfext@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210802134336.gv66le6u2z52kfkh@skbuf>
References: <20210731191023.1329446-1-dqfext@gmail.com>
 <20210731191023.1329446-4-dqfext@gmail.com>
 <20210802134336.gv66le6u2z52kfkh@skbuf>
MIME-Version: 1.0
Content-Disposition: inline
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210802_083140_426609_AFA28F74 
X-CRM114-Status: GOOD (  16.17  )
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

On Mon, Aug 02, 2021 at 04:43:36PM +0300, Vladimir Oltean wrote:
> On Sun, Aug 01, 2021 at 03:10:21AM +0800, DENG Qingfang wrote:
> > --- a/drivers/net/dsa/mt7530.h
> > +++ b/drivers/net/dsa/mt7530.h
> > @@ -181,7 +181,7 @@ enum mt7530_vlan_egress_attr {
> >  
> >  /* Register for port STP state control */
> >  #define MT7530_SSP_P(x)			(0x2000 + ((x) * 0x100))
> > -#define  FID_PST(x)			((x) & 0x3)
> 
> Shouldn't these macros have _two_ arguments, the FID and the port state?
> 
> > +#define  FID_PST(x)			(((x) & 0x3) * 0x5)
> 
> "* 5": explanation?
> 
> >  #define  FID_PST_MASK			FID_PST(0x3)
> >  
> >  enum mt7530_stp_state {
> > -- 
> > 2.25.1
> > 
> 
> I don't exactly understand how this patch works, sorry.
> Are you altering port state only on bridged ports, or also on standalone
> ports after this patch? Are standalone ports in the proper STP state
> (FORWARDING)?

The current code only sets FID 0's STP state. This patch sets both 0's and
1's states.

The *5 part is binary magic. [1:0] is FID 0's state, [3:2] is FID 1's state
and so on. Since 5 == 4'b0101, the value in [1:0] is copied to [3:2] after
the multiplication.

Perhaps I should only change FID 1's state.


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
