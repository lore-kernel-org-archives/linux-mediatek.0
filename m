Return-Path: <SRS0=FJ4T=K2=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.6 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,
	URIBL_BLOCKED,USER_AGENT_SANE_2 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7E88FC47082
	for <linux-mediatek@archiver.kernel.org>; Mon, 31 May 2021 09:14:15 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 9B900611EE
	for <linux-mediatek@archiver.kernel.org>; Mon, 31 May 2021 09:14:14 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 9B900611EE
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Date:CC:To:From:Subject:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=2jcqvSNTrF0W8CNdpmU54PdemZCvpiC4ITp+K0dVKWw=; b=2n7NpKdavaVJpv
	lAS2gkggNb20hlvwFWQHHrQ2UpQHNYx0VvWcXvAFtWs8GyHn8RBrpL4qXzqq7hW22uPbfM3eM75mx
	9Gw+fQ7kk4+CE4hqHtS6QAUuhNlUzytkTDrMAhK7Tkqoqi85PmZB10g2Cbt2UoA2Kjo44KQ3HEVyw
	FQK2O5ly+IWpV9b8275cNH/nvBTgnQsVPHVbZ3ONkuMQagdyY0UfG2P2yqFBzg2+R+UAqCbF48twP
	5BaR3skWYQ5BHdQiUdhgmiPYEmmUzpG2o6AODfPaO+B1U1NNB7PNnM3p3KkOlvK4YhD8p4KHMQTgD
	jlgbK4ar/iqYmfoWJ0EA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1lndzm-00Bfon-Lj; Mon, 31 May 2021 09:14:02 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1lndzk-00BfnZ-M5; Mon, 31 May 2021 09:14:02 +0000
X-UUID: f261ea7dcbb9470faba53dd94e4fbf4a-20210531
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:MIME-Version:Content-Type:References:In-Reply-To:Date:CC:To:From:Subject:Message-ID;
 bh=bS+/yrXs2fjTD4HJUy9q0nG4d3SEQmTaKJc1kPQr/lY=; 
 b=P2Y6uW/39UPevtRmui2W//ilgxzx3tSjua7XqutfffxKluzJ8b5putOPTmJMowkFsFsD6HLu6vhE/vAKQUYNr9uV+nF4idwvO1oxMA19KiJO9aFR2ZFvZ1VHOYkhHyZLjqS5WPsy3IYFZKhTSNGVVh/ntOMgU3loB3m0P1nrfbY=;
X-UUID: f261ea7dcbb9470faba53dd94e4fbf4a-20210531
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw01.mediatek.com
 (envelope-from <landen.chao@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 83558082; Mon, 31 May 2021 02:13:52 -0700
Received: from MTKMBS07N2.mediatek.inc (172.21.101.141) by
 MTKMBS62DR.mediatek.inc (172.29.94.18) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Mon, 31 May 2021 02:06:42 -0700
Received: from mtkcas07.mediatek.inc (172.21.101.84) by
 mtkmbs07n2.mediatek.inc (172.21.101.141) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Mon, 31 May 2021 17:06:40 +0800
Received: from mtksdccf07 (172.21.84.99) by mtkcas07.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Mon, 31 May 2021 17:06:40 +0800
Message-ID: <1903cbd39afb96a9f6ab72ac45d830918e3b5982.camel@mediatek.com>
Subject: Re: [PATCH net] net: Update MAINTAINERS for MediaTek switch driver
From: Landen Chao <landen.chao@mediatek.com>
To: Jisheng Zhang <Jisheng.Zhang@synaptics.com>
CC: Andrew Lunn <andrew@lunn.ch>, Vivien Didelot <vivien.didelot@gmail.com>,
 Florian Fainelli <f.fainelli@gmail.com>, "David S . Miller"
 <davem@davemloft.net>, Jakub Kicinski <kuba@kernel.org>, Matthias Brugger
 <matthias.bgg@gmail.com>, "dqfext@gmail.com" <dqfext@gmail.com>, Sean Wang
 <Sean.Wang@mediatek.com>, Philipp Zabel <p.zabel@pengutronix.de>,
 "netdev@vger.kernel.org" <netdev@vger.kernel.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "linux-arm-kernel@lists.infradead.org"
 <linux-arm-kernel@lists.infradead.org>, "linux-mediatek@lists.infradead.org"
 <linux-mediatek@lists.infradead.org>, "frank-w@public-files.de"
 <frank-w@public-files.de>, Steven Liu
 =?UTF-8?Q?=28=E5=8A=89=E4=BA=BA=E8=B1=AA=29?= <steven.liu@mediatek.com>
Date: Mon, 31 May 2021 17:06:40 +0800
In-Reply-To: <20210531162342.339635bb@xhacker.debian>
References: <49e67daeadace13a9fa3f4553f1ec14c6a93bdc8.1622445132.git.landen.chao@mediatek.com>
 <20210531162342.339635bb@xhacker.debian>
X-Mailer: Evolution 3.28.5-0ubuntu0.18.04.2 
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210531_021400_748192_19315456 
X-CRM114-Status: GOOD (  17.89  )
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

On Mon, 2021-05-31 at 16:23 +0800, Jisheng Zhang wrote:
> On Mon, 31 May 2021 15:59:39 +0800
> Landen Chao <landen.chao@mediatek.com> wrote:
> 
> 
> > 
> > 
> > Update maintainers for MediaTek switch driver with Deng Qingfang
> > who
> > contributes many useful patches (interrupt, VLAN, GPIO, and etc.)
> > to
> > enhance MediaTek switch driver and will help maintenance.
> > 
> > Change-Id: If372c1a0df6e3ba9f93b1699dbda81f1fd501a7c
> 
> do we need to remove this Change-Id tag?
Sorry, I will remove Change-Id in v2.

> 
> > Signed-off-by: Landen Chao <landen.chao@mediatek.com>
> > Signed-off-by: DENG Qingfang <dqfext@gmail.com>
> > ---
> >  MAINTAINERS | 1 +
> >  1 file changed, 1 insertion(+)
> > 
> > diff --git a/MAINTAINERS b/MAINTAINERS
> > index bd7aff0c120f..3315627ebb6b 100644
> > --- a/MAINTAINERS
> > +++ b/MAINTAINERS
> > @@ -11588,6 +11588,7 @@ F:      drivers/char/hw_random/mtk-rng.c
> >  MEDIATEK SWITCH DRIVER
> >  M:     Sean Wang <sean.wang@mediatek.com>
> >  M:     Landen Chao <landen.chao@mediatek.com>
> > +M:     DENG Qingfang <dqfext@gmail.com>
> >  L:     netdev@vger.kernel.org
> >  S:     Maintained
> >  F:     drivers/net/dsa/mt7530.*
> > --
> > 2.29.2
_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
