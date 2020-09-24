Return-Path: <SRS0=tl/R=DB=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.4 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,URIBL_BLOCKED,USER_AGENT_SANE_2
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1EB8CC4363D
	for <linux-mediatek@archiver.kernel.org>; Thu, 24 Sep 2020 13:26:06 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 90EC32076D
	for <linux-mediatek@archiver.kernel.org>; Thu, 24 Sep 2020 13:26:05 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="GWsV7ha8";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b="uKdAiTCc"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 90EC32076D
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Date:To:From:
	Subject:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=kWJLboLACtR/+elG2sPYRIQxpZeU9vE+vn6lJhjNocY=; b=GWsV7ha8XhMaHalJ2LCxJjsGc
	vHPZEs9LyfSf3yFBwSULiAZzvBzVtYF2fw6gbGzAoXgWLkSvJLBK8Za8D1W3yZmnt4t2rbd1sF8gI
	XQ53UbyjzFl/AOG20B6SmIe/xf9U4C+C6U1Kk3QrRVzD6ON0/DOtaTDT1/fCUIY9C+UP1I5qXJS3b
	Cs5AoJyTzexgYGHNh98MAWPeAmVNSIzBswaW0aFlQLoCpE9oX/3y0gbitonaTAKWRW8nSDmpqY20L
	qJYFgqy9A4y8/a7FKBsVsAzWuDsinDJ07F9RaewjsC1wCx5c7VH1wnzRQT0Yv43M5suXYAwayWsCZ
	XpWUTH+zg==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kLRFy-0001rm-Vu; Thu, 24 Sep 2020 13:25:55 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kLRFs-0001qg-To; Thu, 24 Sep 2020 13:25:52 +0000
X-UUID: d240818615f9448c9b71ac178c1818ea-20200924
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:MIME-Version:Content-Type:References:In-Reply-To:Date:CC:To:From:Subject:Message-ID;
 bh=13CQbbbCVICRMofyq52vrwixbhSdHJNGZxZmv9+sfFk=; 
 b=uKdAiTCcp84WiecPLMb8VJ4qqgSK3b1CbHzaTPHk0YiSpmKIGNFrmX4OcU4sb+/ZcX0SOgBPTo0kaB0+v/DIeCLXJUQltLi9kDrzY2FEaiqj/yMdAE2Y2Tr/219fqF6b9R+x/NBpNNZELXZmqS5Xy5FDbZI9uljg0j0rSUcgsck=;
X-UUID: d240818615f9448c9b71ac178c1818ea-20200924
Received: from mtkcas67.mediatek.inc [(172.29.193.45)] by mailgw01.mediatek.com
 (envelope-from <landen.chao@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 450103710; Thu, 24 Sep 2020 05:25:44 -0800
Received: from MTKCAS06.mediatek.inc (172.21.101.30) by
 MTKMBS62N1.mediatek.inc (172.29.193.41) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Thu, 24 Sep 2020 06:25:41 -0700
Received: from [172.21.84.99] (172.21.84.99) by MTKCAS06.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Thu, 24 Sep 2020 21:25:32 +0800
Message-ID: <1600953934.19244.2.camel@mtksdccf07>
Subject: Re: [PATCH v2] net: dsa: mt7530: Add some return-value checks
From: Landen Chao <landen.chao@mediatek.com>
To: Alex Dewar <alex.dewar90@gmail.com>
Date: Thu, 24 Sep 2020 21:25:34 +0800
In-Reply-To: <9db38be8-9926-b74b-c860-018486b17f3a@gmail.com>
References: <1600327978.11746.22.camel@mtksdccf07>
 <20200919192809.29120-1-alex.dewar90@gmail.com>
 <1600949604.11746.27.camel@mtksdccf07>
 <9db38be8-9926-b74b-c860-018486b17f3a@gmail.com>
X-Mailer: Evolution 3.2.3-0ubuntu6 
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200924_092549_094732_6A07BABF 
X-CRM114-Status: GOOD (  17.51  )
X-BeenThere: linux-mediatek@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <linux-mediatek.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mediatek>, 
 <mailto:linux-mediatek-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mediatek/>
List-Post: <mailto:linux-mediatek@lists.infradead.org>
List-Help: <mailto:linux-mediatek-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mediatek>, 
 <mailto:linux-mediatek-request@lists.infradead.org?subject=subscribe>
Cc: Andrew Lunn <andrew@lunn.ch>, Florian Fainelli <f.fainelli@gmail.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "netdev@vger.kernel.org" <netdev@vger.kernel.org>,
 Sean Wang <Sean.Wang@mediatek.com>, Russell King <linux@armlinux.org.uk>,
 "David S. Miller" <davem@davemloft.net>,
 "linux-mediatek@lists.infradead.org" <linux-mediatek@lists.infradead.org>,
 Matthias Brugger <matthias.bgg@gmail.com>, Jakub Kicinski <kuba@kernel.org>,
 Vivien Didelot <vivien.didelot@gmail.com>,
 "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On Thu, 2020-09-24 at 14:11 +0100, Alex Dewar wrote:
> On 2020-09-24 13:13, Landen Chao wrote:
> > Hi Alex,
> >
> > Thanks for your patch. By linux/scripts/checkpatch.pl
> >
> > On Sun, 2020-09-20 at 03:28 +0800, Alex Dewar wrote:
> > [..]
> >> @@ -1631,9 +1635,11 @@ mt7530_setup(struct dsa_switch *ds)
> >>   		mt7530_rmw(priv, MT7530_PCR_P(i), PCR_MATRIX_MASK,
> >>   			   PCR_MATRIX_CLR);
> >>   
> >> -		if (dsa_is_cpu_port(ds, i))
> >> -			mt753x_cpu_port_enable(ds, i);
> >> -		else
> >> +		if (dsa_is_cpu_port(ds, i)) {
> >> +			ret = mt753x_cpu_port_enable(ds, i);
> >> +			if (ret)
> >> +				return ret;
> >> +		} else
> >>   			mt7530_port_disable(ds, i);
> > CHECK: braces {} should be used on all arms of this statement
> > CHECK: Unbalanced braces around else statement
> >>   
> >>   		/* Enable consistent egress tag */
> >> @@ -1785,9 +1791,11 @@ mt7531_setup(struct dsa_switch *ds)
> >>   
> >>   		mt7530_set(priv, MT7531_DBG_CNT(i), MT7531_DIS_CLR);
> >>   
> >> -		if (dsa_is_cpu_port(ds, i))
> >> -			mt753x_cpu_port_enable(ds, i);
> >> -		else
> >> +		if (dsa_is_cpu_port(ds, i)) {
> >> +			ret = mt753x_cpu_port_enable(ds, i);
> >> +			if (ret)
> >> +				return ret;
> >> +		} else
> >>   			mt7530_port_disable(ds, i);
> > CHECK: braces {} should be used on all arms of this statement
> > CHECK: Unbalanced braces around else statement
> >
> > [..]
> > regards landen
> Hi Landen,
> 
> Sorry about this... I usually run checkpatch over my patches. Would you 
> like me to send a separate fix or a v3?
> 
> Best,
> Alex
Hi Alex,

Because v2 has not been merged yet, could you help to fix it in v3?

regards landen

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
