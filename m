Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 07A95C433EF
	for <linux-mediatek@archiver.kernel.org>; Fri, 15 Jul 2022 23:25:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Gf5f/pASL77DMkhyMKtHW+RXEs+yAqHofLOai+DH07s=; b=RzjqFK0eBrGdGZoeQ7F5xcX50a
	hIMGfu8SjTaU/uHhe6Yb7mrK/YSecwSKuKEsxJLKBg2zZMv/04XaDs/kAYR1Le6JOIty77Hu87wbZ
	x2b7ql8aLRTyS5++B4d6EpGPlW1jIrktCF/5s9d8Qfz5746Qj4+QcAiVdlAYf7q/J9voYftiGhbdf
	MYJwpAWiDyrAlZPlLqapgM3t4Bigh6TxF/Gpx8QUZ1vNpCk8OuKl0lxv2RKOLGo3JlSYtsegZ4Tgi
	MtVlXSJE5rPQLeJ1MjsA/ObDYTbIECgs+l+U7+oOnWHeoaktOkpcgDUQyAfAtaFpvU3hs8n/ruYbh
	3+LiFt2A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oCUgM-00B7o6-LU; Fri, 15 Jul 2022 23:25:14 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oCULq-00Ay32-VV; Fri, 15 Jul 2022 23:04:04 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id CD46061E16;
	Fri, 15 Jul 2022 23:04:01 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2C86AC3411E;
	Fri, 15 Jul 2022 23:04:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1657926241;
	bh=d5MdTIonHKWdt36P0nVxTI+b57TowJdCD+NWNZoxFjY=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=NRGAL6F9qARXkFTmXPKo6vvIUI1rkoJKmL3xGFujpMcLr6eZUq8WPs/tyvHX72U9v
	 FCFUyRqEgosieEN+wSJJj0N/BwjZg2oUVm6WWq0ZqewAGOBN+JRg+xDbWDeclL456q
	 Bxq4Ht84JmYDsDf+01/glb0/6+CnbnvozOA1tGdCVwm558XnCge2GF2bagOxZkZJFy
	 6zy6cx6ou3oP4NvPOII0LZaXw9fv0N0aya2A7bLNIdWqLkKCiNvzblkdqt17j5+GBk
	 9OmrkHEWeSAuiMV8yLQU6jqX2j7SxDUhXW02GL3LrIHJoJpxDi+k2KQo9vmKZ3lQSJ
	 sxq0MQRa0dwjA==
Date: Fri, 15 Jul 2022 16:03:59 -0700
From: Jakub Kicinski <kuba@kernel.org>
To: "Russell King (Oracle)" <linux@armlinux.org.uk>
Cc: Vladimir Oltean <olteanv@gmail.com>, Andrew Lunn <andrew@lunn.ch>,
 Heiner Kallweit <hkallweit1@gmail.com>, Alexandre Belloni
 <alexandre.belloni@bootlin.com>, Alvin =?UTF-8?B?xaBpcHJhZ2E=?=
 <alsi@bang-olufsen.dk>, Andy Shevchenko
 <andriy.shevchenko@linux.intel.com>, Claudiu Manoil
 <claudiu.manoil@nxp.com>, Daniel Scally <djrscally@gmail.com>, "David S.
 Miller" <davem@davemloft.net>, DENG Qingfang <dqfext@gmail.com>, Eric
 Dumazet <edumazet@google.com>, Florian Fainelli <f.fainelli@gmail.com>,
 George McCollister <george.mccollister@gmail.com>, Greg Kroah-Hartman
 <gregkh@linuxfoundation.org>, Hauke Mehrtens <hauke@hauke-m.de>, Heikki
 Krogerus <heikki.krogerus@linux.intel.com>, Kurt Kanzenbach
 <kurt@linutronix.de>, Landen Chao <Landen.Chao@mediatek.com>, Linus Walleij
 <linus.walleij@linaro.org>, linux-acpi@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org,
 Marek =?iso-8859-1?Q?Beh=FAn?= <kabel@kernel.org>, Matthias Brugger
 <matthias.bgg@gmail.com>, netdev@vger.kernel.org, Paolo Abeni
 <pabeni@redhat.com>, "Rafael J. Wysocki" <rafael@kernel.org>, Sakari Ailus
 <sakari.ailus@linux.intel.com>, Sean Wang <sean.wang@mediatek.com>,
 UNGLinuxDriver@microchip.com, Vivien Didelot <vivien.didelot@gmail.com>,
 Woojung Huh <woojung.huh@microchip.com>
Subject: Re: [PATCH net-next 0/6] net: dsa: always use phylink
Message-ID: <20220715160359.2e9dabfe@kernel.org>
In-Reply-To: <YtHVLGR0RQ6dWuBS@shell.armlinux.org.uk>
References: <YtGPO5SkMZfN8b/s@shell.armlinux.org.uk>
	<20220715171719.niqcrklpk4ittfvl@skbuf>
	<YtHVLGR0RQ6dWuBS@shell.armlinux.org.uk>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220715_160403_115218_CE855CAE 
X-CRM114-Status: GOOD (  13.80  )
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

On Fri, 15 Jul 2022 21:59:24 +0100 Russell King (Oracle) wrote:
> The only thing that delayed them was your eventual comments about
> re-working how it was being done. Yet again, posting the RFC series
> created very little in the way of feedback. I'm getting to the point
> of thinking its a waste of time posting RFC patches - it's counter
> productive. RFC means "request for comments" but it seems that many
> interpret it as "I can ignore it".

I'm afraid you are correct. Dave used to occasionally apply RFC patches
which kept reviewers on their toes a little bit (it kept me for sure).
These days patchwork automatically marks patches as RFC based on
the subject, tossing them out of "Action required" queue. So they are
extremely easy to ignore.

Perhaps an alternative way of posting would be to write "RFC only,
please don't apply" at the end of the cover letter. Maybe folks will 
at least get thru reading the cover letter then :S

