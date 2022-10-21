Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E400AC433FE
	for <linux-mediatek@archiver.kernel.org>; Fri, 21 Oct 2022 00:11:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=f10ENVphcwWouQEs0OujPqDX06rCNgG50skXkRTxTXE=; b=ja5wMS3VXb2A92sYxfmavr/p/J
	fS3DyrCs+oKEWCbSxOmKxCcz7exAaBBCFGyhLQW25VtzgURCyn5VrqyhNpKEbYOaYmpnLGyYri0GO
	y1mmNQ8dX0nmEkqvkLQhTJpYefN4VfdrwykiWl/h/Y3Nse6pAKUOfKOCL4NQ80FOcLcSCNMV4gHXP
	ffk7gGzdaza5R0RUxpaf7+Ydo/jz0hzMlQAp6joBnBdS7lG70usJs/Q6q/AVI/xjKdRODhg4v1o2W
	hUgo7GAgjk66YodAoeW1bmKOmlhpQGrzfbtRxdp5ZyE51E3esRTlQpQerhebnTckE59PINNbPTi0E
	TUtcqjBA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1olfdG-002vEZ-6F; Fri, 21 Oct 2022 00:11:26 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1olfd5-002vAv-4C; Fri, 21 Oct 2022 00:11:16 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 6F88661CB4;
	Fri, 21 Oct 2022 00:11:14 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5FB68C433C1;
	Fri, 21 Oct 2022 00:11:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1666311073;
	bh=EDmrggTVBt4ZmieCGYNTkKBhUVVBHvuFF8t6Ohb5odY=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=hXy7QnVya8WFHGkF23bCrlzbszdMIq30gtS5sC/AzLAN0UyIikoDL+dGHWiX3sOJx
	 52Tra3Fs2j1AtumjbHs5IZaj1DXx+8kqp+MZQaFa5KMfEMRHjrqXtzFmcG3St3vajw
	 vn19PU1YUp6Z8HqgEtJjF4vExJm+FQJxfb5H2BNy5KAjVRyZ1IPZjxgspl3wecF+5W
	 Lz3nMgwm+OBkBF1XVr3XerHIv6ORrYZBTUuWXQFWkKBf8+yJ418REFRkxWPkPh00Zc
	 c0ekgpx1lIBlABhf9vH5VdHTkphiAxThbg/MHqo8+4NIpzHVSY1BDl8Ax/GpkOYPZV
	 gU9WNCggZUhaw==
Date: Thu, 20 Oct 2022 17:11:11 -0700
From: Jakub Kicinski <kuba@kernel.org>
To: netdev@kapio-technology.com
Cc: Ido Schimmel <idosch@nvidia.com>, davem@davemloft.net,
 netdev@vger.kernel.org, Florian Fainelli <f.fainelli@gmail.com>, Andrew
 Lunn <andrew@lunn.ch>, Vivien Didelot <vivien.didelot@gmail.com>, Vladimir
 Oltean <olteanv@gmail.com>, Eric Dumazet <edumazet@google.com>, Paolo Abeni
 <pabeni@redhat.com>, Kurt Kanzenbach <kurt@linutronix.de>, Hauke Mehrtens
 <hauke@hauke-m.de>, Woojung Huh <woojung.huh@microchip.com>,
 UNGLinuxDriver@microchip.com, Sean Wang <sean.wang@mediatek.com>, Landen
 Chao <Landen.Chao@mediatek.com>, DENG Qingfang <dqfext@gmail.com>, Matthias
 Brugger <matthias.bgg@gmail.com>, Claudiu Manoil <claudiu.manoil@nxp.com>,
 Alexandre Belloni <alexandre.belloni@bootlin.com>, Jiri Pirko
 <jiri@resnulli.us>, Ivan Vecera <ivecera@redhat.com>, Roopa Prabhu
 <roopa@nvidia.com>, Nikolay Aleksandrov <razor@blackwall.org>, Shuah Khan
 <shuah@kernel.org>, Russell King <linux@armlinux.org.uk>, Christian Marangi
 <ansuelsmth@gmail.com>, Daniel Borkmann <daniel@iogearbox.net>, Yuwei Wang
 <wangyuweihx@gmail.com>, Petr Machata <petrm@nvidia.com>, Florent Fourcot
 <florent.fourcot@wifirst.fr>, Hans Schultz <schultz.hans@gmail.com>,
 Joachim Wiberg <troglobit@gmail.com>, Amit Cohen <amcohen@nvidia.com>,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org, bridge@lists.linux-foundation.org,
 linux-kselftest@vger.kernel.org
Subject: Re: [PATCH v8 net-next 01/12] net: bridge: add locked entry fdb
 flag to extend locked port feature
Message-ID: <20221020171111.0cc66047@kernel.org>
In-Reply-To: <1c71e62ee5d6c0a7fc54d3e666aca619@kapio-technology.com>
References: <20221018165619.134535-1-netdev@kapio-technology.com>
	<20221018165619.134535-2-netdev@kapio-technology.com>
	<Y1FE6WFnsH8hcFY2@shredder>
	<1c71e62ee5d6c0a7fc54d3e666aca619@kapio-technology.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221020_171115_235496_E66753BB 
X-CRM114-Status: GOOD (  11.57  )
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

On Thu, 20 Oct 2022 21:37:17 +0200 netdev@kapio-technology.com wrote:
> Okay, since Jakub says that this patch set must be resent, the question 
> remains to me if I shall make these changes and resend the patch set
> as v8?

If I understand the question right - since you'd be making changes 
the new posting should be a v9. If you got only acks and no change
requests for this posting you could repost as "v8 RESEND", or also
as v9, when in doubt err on the side of bumping the version...

