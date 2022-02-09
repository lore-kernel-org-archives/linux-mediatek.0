Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 54474C433EF
	for <linux-mediatek@archiver.kernel.org>; Wed,  9 Feb 2022 19:16:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Date:CC:To:From:Subject:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=fWrMmLcmHpfJ7mdtW0HJa/hrZ279ptjJdxhXCfAF0xY=; b=jwHcMaJh/SFJ41
	1dZ5o9DoaNv8Hk88Hvo4Gz4xL4C0ISah5TzCb2CLUAO1/orEzys3a0tKVAtg0CnPYSBCmZ4sXiwAY
	6kIDZAqf+ffrO6Q7s66TK5CVPmTmcB7G6dL7hsBhnFh1hBU3n83MBEFdldOeT/S5mn0WLmO/S5blD
	JrwNJqV1Qm+lBMXHgtsxouwEez4vFHlpC/BPm2PGI+Ob8gkbWSkzsYeGt20NmQWWG/jjYetu2m/2p
	xN78AMVl4FMxW7jNVJ+1oDzRgyOynC356OgOqAIOPv5qCX3amO58tOnn3pldTNxlADxNdF645fGoi
	AZAaT2LlKtnRYlkMLkQA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nHsRZ-001MtD-Im; Wed, 09 Feb 2022 19:15:57 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nHsRO-001Mq4-Kv; Wed, 09 Feb 2022 19:15:48 +0000
X-UUID: 1e35cb870c17472197a649df61ff5954-20220209
X-UUID: 1e35cb870c17472197a649df61ff5954-20220209
Received: from mtkcas67.mediatek.inc [(172.29.193.45)] by mailgw01.mediatek.com
 (envelope-from <landen.chao@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 2046359760; Wed, 09 Feb 2022 12:15:43 -0700
Received: from mtkexhb01.mediatek.inc (172.21.101.102) by
 MTKMBS62N2.mediatek.inc (172.29.193.42) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Wed, 9 Feb 2022 11:15:42 -0800
Received: from mtkcas10.mediatek.inc (172.21.101.39) by mtkexhb01.mediatek.inc
 (172.21.101.102) with Microsoft SMTP Server (TLS) id 15.0.1497.2;
 Thu, 10 Feb 2022 03:15:28 +0800
Received: from mtksdccf07 (172.21.84.99) by mtkcas10.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Thu, 10 Feb 2022 03:15:28 +0800
Message-ID: <dab7f18b3f86d598702f9697347c86bfe5cae7f9.camel@mediatek.com>
Subject: Re: [PATCH RFC net-next 0/7] net: dsa: mt7530: updates for phylink
 changes
From: Landen Chao <landen.chao@mediatek.com>
To: "Russell King (Oracle)" <linux@armlinux.org.uk>
CC: DENG Qingfang <dqfext@gmail.com>, Sean Wang <Sean.Wang@mediatek.com>,
 Andrew Lunn <andrew@lunn.ch>, Vivien Didelot <vivien.didelot@gmail.com>,
 Florian Fainelli <f.fainelli@gmail.com>, Vladimir Oltean <olteanv@gmail.com>, 
 "David S. Miller" <davem@davemloft.net>, Jakub Kicinski <kuba@kernel.org>,
 Matthias Brugger <matthias.bgg@gmail.com>, "netdev@vger.kernel.org"
 <netdev@vger.kernel.org>, "linux-arm-kernel@lists.infradead.org"
 <linux-arm-kernel@lists.infradead.org>, "linux-mediatek@lists.infradead.org"
 <linux-mediatek@lists.infradead.org>
Date: Thu, 10 Feb 2022 03:15:28 +0800
In-Reply-To: <YgP+NBeGL4MzRcYR@shell.armlinux.org.uk>
References: <YfwRN2ObqFbrw/fF@shell.armlinux.org.uk>
 <YgO8WMjc77BsOLtD@shell.armlinux.org.uk>
 <48d2d967a625c65308bff7bad03ae49779986549.camel@mediatek.com>
 <YgP+NBeGL4MzRcYR@shell.armlinux.org.uk>
X-Mailer: Evolution 3.28.5-0ubuntu0.18.04.2 
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220209_111546_738275_32F78879 
X-CRM114-Status: GOOD (  33.96  )
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

On Thu, 2022-02-10 at 01:47 +0800, Russell King (Oracle) wrote:
> On Thu, Feb 10, 2022 at 01:33:34AM +0800, Landen Chao wrote:
> > On Wed, 2022-02-09 at 21:06 +0800, Russell King (Oracle) wrote:
> > > On Thu, Feb 03, 2022 at 05:30:31PM +0000, Russell King (Oracle)
> > > wrote:
> > > > Hi,
> > > > 
> > > > This series is a partial conversion of the mt7530 DSA driver to
> > > > the
> > > > modern phylink infrastructure. This driver has some exceptional
> > > > cases
> > > > which prevent - at the moment - its full conversion
> > > > (particularly
> > > > with
> > > > the Autoneg bit) to using phylink_generic_validate().
> > > > 
> > > > What stands in the way is this if() condition in
> > > > mt753x_phylink_validate():
> > > > 
> > > > 	if (state->interface != PHY_INTERFACE_MODE_TRGMII ||
> > > > 	    !phy_interface_mode_is_8023z(state->interface)) {
> > > > 
> > > > reduces to being always true. I highlight this here for the
> > > > attention
> > > > of the driver maintainers.
> > 
> > Hi Russel,
> > 
> > The above behaviour is really a bug. "&&" should be used to prevent
> > setting MAC_10, MAC_100 and Antoneg capability in particular
> > interface
> > mode in original code. However, these capability depend on the link
> > partner of the MAC, such as Ethernet phy. It's okay to keep setting
> > them.
> 
> Hi Landen,
> 
> Thanks for the response. I think you have a slight misunderstanding
> about these capabilities, both in the old code and the new code.
> 
> You shouldn't care about e.g. the ethernet PHY's capabilities in the
> validate() callback at all - phylink will look at the capabilities
> reported by phylib, and mask out anything that the MAC says shouldn't
> be supported, which has the effect of restricting what the ethernet
> PHY will advertise.
> 
> In the old code, the validate() callback should only be concerned
> with
> what the MAC and PCS can support - e.g. if the MAC isn't capable of
> supportig 1G half-duplex, then the 1G HD capabilities should be
> masked
> out.
> 
> With the new code, PCS gain their own validation function, which
> means
> that the validate() callback then becomes very much just about the
> MAC,
> and with phylink_generic_validate(), we can get away with just
> specifying a bitmap of the supported interface types for the MAC/PCS
> end of the system, and the MAC speeds that are supported.
> 
> Given your feedback, I will re-jig the series to take account of your
> comments - thanks.
> 
Hi Russell,

Thanks for your guidance.

I've been stuck with an unnecessary problem, "should I export
MAC_1000/MAC_100/MAC_10 capability of MAC when PCS is connected with an
Ethernet PHY supports both 2500base-X and SGMII mode?" Now I know the
answer, just export all capability that MAC and PCS can support in the
validate(). phylink will help to find out the final configuration by
coworking with phylib.



_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
