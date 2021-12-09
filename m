Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 49DFCC433EF
	for <linux-mediatek@archiver.kernel.org>; Thu,  9 Dec 2021 01:56:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Date:CC:To:From:Subject:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=TDl6IuYlxnjHqyFVkszKQDtGynaoMp72y49B8CTj2c8=; b=pqk0jXGYREpqZX
	1SYbWbHftVPDyVPooq3ioVoK7NYY+L6vT+HCKdEp/UGoPy1sPhgPNLPglMF0N5g+SjrMXZeCB5zFC
	oZ05O8O0TZ2/oZxqkmzCya9IvbqM4002QGQAm6Pdj2Th+EK8HW9e8Ps/oWXznt7Lx0pcZqBDFNDo7
	CyIsrz2F+h63LkcHaQpsey35d9s60QWoWAs3gWiHokeAEnS/jMIulzhV4kaRe+pORZtzjhJ9veijI
	P5hVLZ3wTEab7gMwRsr6f4WlQyCAg1PesLUnkDczqKg8Y+ZBW978iAB8EheE0xVmTPEvbBvspAP6u
	MobvI8uf0rag3WwF0Ipw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mv8fB-00EiH5-6s; Thu, 09 Dec 2021 01:56:01 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mv8f9-00EiGV-Ce; Thu, 09 Dec 2021 01:56:00 +0000
X-UUID: 0159836246fd41de8db75a77bed1d166-20211208
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:MIME-Version:Content-Type:References:In-Reply-To:Date:CC:To:From:Subject:Message-ID;
 bh=WIV75YWZapc7GJoPTfjsaqgrja4fRL9eKNuW62oS71w=; 
 b=ZZ8ZvMmlCr8vWKjA5sifCtDeR/aJWGNcK5jWlU6ckU3/NGwlMmbeHzY9eT47F4NFiTmU361PmD19Fqv2qw7OgI37PfyXrLAlVyuCs1gK+udEnCHS7k3ZcWcaRrw5Vk0ziU9xwDYiowBbNW8d7JUScFJb98dYtFyNp7dCnKZvOI8=;
X-UUID: 0159836246fd41de8db75a77bed1d166-20211208
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw02.mediatek.com
 (envelope-from <biao.huang@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 1800183189; Wed, 08 Dec 2021 18:55:56 -0700
Received: from mtkmbs10n1.mediatek.inc (172.21.101.34) by
 MTKMBS62N1.mediatek.inc (172.29.193.41) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Wed, 8 Dec 2021 17:54:56 -0800
Received: from mtkcas11.mediatek.inc (172.21.101.40) by
 mtkmbs10n1.mediatek.inc (172.21.101.34) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.2.792.15; Thu, 9 Dec 2021 09:54:54 +0800
Received: from mhfsdcap04 (10.17.3.154) by mtkcas11.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Thu, 9 Dec 2021 09:54:53 +0800
Message-ID: <6deeba8396a72d3d0bb3cb6630bc0c36f652de80.camel@mediatek.com>
Subject: Re: [PATCH net-next v7 5/6] stmmac: dwmac-mediatek: add support for
 mt8195
From: Biao Huang <biao.huang@mediatek.com>
To: Jakub Kicinski <kuba@kernel.org>
CC: <davem@davemloft.net>, Rob Herring <robh+dt@kernel.org>, Matthias Brugger
 <matthias.bgg@gmail.com>, Giuseppe Cavallaro <peppe.cavallaro@st.com>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>, Jose Abreu
 <joabreu@synopsys.com>, Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 <netdev@vger.kernel.org>, <devicetree@vger.kernel.org>,
 <linux-kernel@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
 <linux-mediatek@lists.infradead.org>,
 <linux-stm32@st-md-mailman.stormreply.com>, <srv_heupstream@mediatek.com>,
 <macpaul.lin@mediatek.com>, <angelogioacchino.delregno@collabora.com>,
 <dkirjanov@suse.de>
Date: Thu, 9 Dec 2021 09:54:53 +0800
In-Reply-To: <20211208175142.1b63afea@kicinski-fedora-pc1c0hjn.dhcp.thefacebook.com>
References: <20211208054716.603-1-biao.huang@mediatek.com>
 <20211208054716.603-6-biao.huang@mediatek.com>
 <20211208063820.264df62d@kicinski-fedora-pc1c0hjn.dhcp.thefacebook.com>
 <39aa23e1a48bc36a631b3074af2abfd5d1e2256d.camel@mediatek.com>
 <20211208175142.1b63afea@kicinski-fedora-pc1c0hjn.dhcp.thefacebook.com>
X-Mailer: Evolution 3.28.5-0ubuntu0.18.04.2 
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211208_175559_460424_BFE023AC 
X-CRM114-Status: GOOD (  15.83  )
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

On Wed, 2021-12-08 at 17:51 -0800, Jakub Kicinski wrote:
> On Thu, 9 Dec 2021 09:48:25 +0800 Biao Huang wrote:
> > Sorry for some typo in previous reply, fix it here.
> > 
> > All these warning lines share a similar semantics:
> > delay_val |= FIELD_PREP(xxx, !!val);
> > 
> > and, should come from the expansion of FIELD_PREP in
> > include/linux/bitfiled.h:
> > 
> >   FIELD _PREP --> __BF_FILED_CHECK --> "~((_mask) >>
> > __bf_shf(_mask)) &
> > (_val) : 0,"
> > 
> > ===============================================================
> > __BF_FILED_CHECK {
> > ...
> >   BUILD_BUG_ON_MSG(__builtin_constant_p(_val) ?           \
> >                    ~((_mask) >> __bf_shf(_mask)) & (_val) : 0, \
> >                    _pfx "value too large for the field"); \ ...
> > ===============================================================
> > 
> > Should I fix it by converting
> >   delay_val |= FIELD_PREP(ETH_DLY_TXC_ENABLE, !!mac_delay-
> > >tx_delay);
> > to
> >   en_val = !!mac_delay->tx_delay;
> >   delay_val |= FIELD_PREP(ETH_DLY_TXC_ENABLE, en_val);
> > 
> > or other suggestions for these warnings?
> 
> I see, thanks for explaining. The code is fine, we can simply ignore
> this warning IMHO.
OK, thanks for your comments~
_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
