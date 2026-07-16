Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E07EBC44501
	for <linux-mediatek@archiver.kernel.org>; Thu, 16 Jul 2026 07:35:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:References:Content-Type:
	In-Reply-To:MIME-Version:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=M+e8FMjxlu8Cvc0CcQFMRL+Ex/ZuCg6jnE3zP0pwq4U=; b=fpFwkpFVe7vsGyBxojtND9QrU2
	xBYyM/FEFJxJJL0fDabGV37pqbf7lmimdGHJkfHyh6ilpxs9F9wYrNleZq5vF8Ab6VyH7EV/Osj1T
	2cjalSUlIMj4sdTvZn7IrJAp0279U+5OJkrt7Ez8TwilLbKx5fyIyyPcz4FrNJbHAK8vy/SUi1qqX
	ACTFXEYDf2K+PxR4/MxL4m6Q0NfwTWgkLgwSF/aiJFip3FvyuBVVafSOhczdW3XJsZH+WmGtexOkj
	QYYcyfgZeV5pmIzgsfPpaaoa6WSerTVSrRTpuhSTHqGZsBL3qy9x9p6bFdZdzPbo3n/9eZWZa9dtQ
	AOjiDE6A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wkGdL-0000000GfRV-2uMz;
	Thu, 16 Jul 2026 07:35:51 +0000
Received: from mailout2.w1.samsung.com ([210.118.77.12])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wkGdE-0000000GfPn-3QhO
	for linux-mediatek@lists.infradead.org;
	Thu, 16 Jul 2026 07:35:48 +0000
Received: from eucas1p1.samsung.com (unknown [182.198.249.206])
	by mailout2.w1.samsung.com (KnoxPortal) with ESMTP id 20260716073538euoutp02e293da41ae7f40fdf1f9d02e94a90e37~CtO5yX6CI3023730237euoutp02Z
	for <linux-mediatek@lists.infradead.org>; Thu, 16 Jul 2026 07:35:38 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout2.w1.samsung.com 20260716073538euoutp02e293da41ae7f40fdf1f9d02e94a90e37~CtO5yX6CI3023730237euoutp02Z
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
	s=mail20170921; t=1784187338;
	bh=M+e8FMjxlu8Cvc0CcQFMRL+Ex/ZuCg6jnE3zP0pwq4U=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=gpW2bGyQPkW2DQuND9WIVOPGBhWEhVs8s4iSAo6piFBydKSW/pGoysIKwRWhZCZIL
	 29o2QSF4xI2Ede9bQm8CnFzo3TZynFYuT12fcqvO4I4AZusZ2YGKUG06wTFI7n00sA
	 Mm/Q5KESOpgVg4EeQ05UmmzFfHItHV9HTMUV6/ng=
Received: from eusmtip1.samsung.com (unknown [203.254.199.221]) by
	eucas1p2.samsung.com (KnoxPortal) with ESMTPA id
	20260716073538eucas1p24a4107355cfa7017ab15cca1a61f7148~CtO5UFkJv2490924909eucas1p2p;
	Thu, 16 Jul 2026 07:35:38 +0000 (GMT)
Received: from AMDC4622.eu.corp.samsungelectronics.net (unknown
	[106.120.77.34]) by eusmtip1.samsung.com (KnoxPortal) with ESMTPA id
	20260716073536eusmtip13d05195b5fa03e5b16b777862996ec76~CtO4Qrw5B0331203312eusmtip1g;
	Thu, 16 Jul 2026 07:35:36 +0000 (GMT)
Date: Thu, 16 Jul 2026 09:35:33 +0200
From: Jakub Raczynski <j.raczynski@samsung.com>
To: Shiming Cheng =?utf-8?B?KOaIkOivl+aYjik=?= <Shiming.Cheng@mediatek.com>
Cc: "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	"dsahern@kernel.org" <dsahern@kernel.org>, "imv4bel@gmail.com"
	<imv4bel@gmail.com>, "linux-mediatek@lists.infradead.org"
	<linux-mediatek@lists.infradead.org>, "alice@isovalent.com"
	<alice@isovalent.com>, "daniel.zahka@gmail.com" <daniel.zahka@gmail.com>,
	"eilaimemedsnaimel@gmail.com" <eilaimemedsnaimel@gmail.com>, "nbd@nbd.name"
	<nbd@nbd.name>, "horms@kernel.org" <horms@kernel.org>, "kuba@kernel.org"
	<kuba@kernel.org>, "pabeni@redhat.com" <pabeni@redhat.com>,
	"edumazet@google.com" <edumazet@google.com>,
	"willemdebruijn.kernel@gmail.com" <willemdebruijn.kernel@gmail.com>,
	"willemb@google.com" <willemb@google.com>, "netdev@vger.kernel.org"
	<netdev@vger.kernel.org>, "linux-arm-kernel@lists.infradead.org"
	<linux-arm-kernel@lists.infradead.org>, "matthias.bgg@gmail.com"
	<matthias.bgg@gmail.com>, "davem@davemloft.net" <davem@davemloft.net>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	"sd@queasysnail.net" <sd@queasysnail.net>, "steffen.klassert@secunet.com"
	<steffen.klassert@secunet.com>, "stable@vger.kernel.org"
	<stable@vger.kernel.org>, Lena Wang =?utf-8?B?KOeOi+WonCk=?=
	<Lena.Wang@mediatek.com>
Subject: Re: [PATCH v7] net: gro: fix double aggregation of flush-marked
 skbs
Message-ID: <aliJuE/c+tNaSAU0@AMDC4622.eu.corp.samsungelectronics.net>
MIME-Version: 1.0
In-Reply-To: <99ce187af1495ffac592bfcf7ef97fc61a7f780b.camel@mediatek.com>
X-CMS-MailID: 20260716073538eucas1p24a4107355cfa7017ab15cca1a61f7148
X-Msg-Generator: CA
Content-Type: multipart/mixed;
	boundary="----KNnB4kTNYKyYcmQL5sxXd.jAMLTdcyVYkfyqBoax5Juj2j1a=_3e3ed_"
X-RootMTR: 20260716073538eucas1p24a4107355cfa7017ab15cca1a61f7148
X-EPHeader: CA
X-CMS-RootMailID: 20260716073538eucas1p24a4107355cfa7017ab15cca1a61f7148
References: <20260709014704.3625-1-shiming.cheng@mediatek.com>
	<willemdebruijn.kernel.2801a1401793d@gmail.com>
	<99ce187af1495ffac592bfcf7ef97fc61a7f780b.camel@mediatek.com>
	<CGME20260716073538eucas1p24a4107355cfa7017ab15cca1a61f7148@eucas1p2.samsung.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260716_003545_482928_CA341326 
X-CRM114-Status: GOOD (  10.93  )
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
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

------KNnB4kTNYKyYcmQL5sxXd.jAMLTdcyVYkfyqBoax5Juj2j1a=_3e3ed_
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Content-Disposition: inline

On Thu, Jul 16, 2026 at 01:41:12AM +0000, Shiming Cheng (成诗明) wrote:
> Hello everyone, 
> 
> it looks like this has been peeding for a while.
> Is there anything else I need to do or follow up on ?
> 
> Thanks
>

Hi,

There was an announcement
https://lore.kernel.org/netdev/c0cd72bd-6298-47a4-82a3-c43811c98063@redhat.com/
and currently there are over 1000 patches waiting for processing
https://patchwork.kernel.org/project/netdevbpf/list/

So need to be patient.

BR
Jakub Raczynski

------KNnB4kTNYKyYcmQL5sxXd.jAMLTdcyVYkfyqBoax5Juj2j1a=_3e3ed_
Content-Type: text/plain; charset="utf-8"


------KNnB4kTNYKyYcmQL5sxXd.jAMLTdcyVYkfyqBoax5Juj2j1a=_3e3ed_--

