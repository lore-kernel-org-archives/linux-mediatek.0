Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 927EEC54FB3
	for <linux-mediatek@archiver.kernel.org>; Mon,  2 Jun 2025 07:23:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:To:Subject
	:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=G4aZKGSQPz/8voWyJkorwYkhzOYNTkUjx/JN/k2FWQE=; b=w1PAEe4F6KU+96
	A9N9DXC2znB7pmRwBuBa3XjRrw0NAm9zfOFnH48syzJaQQ6493g/uksDIdChH7fJhRJePj5YFoUVI
	5wpqg9zHWPjv78uDeqhYweHOq9lGHsR2Zj9YfTpik47dOXo6/iOE++2pxbnYeRNHKRdN0RA3P0iYF
	W3gKljpFWRomh2NxLjhE9ypyKVo6fTByU/ekgmugGAU4gf1sA7pre1zOItw9pvn72aDiSh9m6kHGT
	WC29nSDdtVl8uRGu7CJrM8xAv4pcCxC2bGmWjXwsnOUUb9Q60D21735XLWYMbIP1zPJO5RccS2G/V
	UEnYoSyGQTmU97kDlsVA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uLzVw-00000006u5P-08Sg;
	Mon, 02 Jun 2025 07:23:20 +0000
Received: from forward502b.mail.yandex.net ([2a02:6b8:c02:900:1:45:d181:d502])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uLzSN-00000006tkP-1R79;
	Mon, 02 Jun 2025 07:19:41 +0000
Received: from mail-nwsmtp-smtp-production-main-76.iva.yp-c.yandex.net (mail-nwsmtp-smtp-production-main-76.iva.yp-c.yandex.net [IPv6:2a02:6b8:c0c:c122:0:640:3648:0])
	by forward502b.mail.yandex.net (Yandex) with ESMTPS id 2AF7B60D83;
	Mon,  2 Jun 2025 10:19:32 +0300 (MSK)
Received: by mail-nwsmtp-smtp-production-main-76.iva.yp-c.yandex.net (smtp/Yandex) with ESMTPSA id RJUpJHHLi8c0-hfsa8QqR;
	Mon, 02 Jun 2025 10:19:31 +0300
X-Yandex-Fwd: 1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=0upti.me; s=mail;
	t=1748848771; bh=G4aZKGSQPz/8voWyJkorwYkhzOYNTkUjx/JN/k2FWQE=;
	h=From:In-Reply-To:Cc:Date:References:To:Subject:Message-ID;
	b=GvrTeIBLtjaZsU746DJnnqDfouxT39Ss2JFa+ViS8lhkrNTHiyeIaEgPOCRJufifx
	 ypWBAlyqitB55eomIvIMRCoBB2IT01KecMEktzXuOc/CxPvYxducIqrT1ComqNutT7
	 yJ94HBeuNVi2/PzMTHPIuFbzOpMKw5Py+7TzBuNY=
Authentication-Results: mail-nwsmtp-smtp-production-main-76.iva.yp-c.yandex.net; dkim=pass header.i=@0upti.me
Message-ID: <9cc913d7-7e5b-4b6c-886c-ca9778c3f970@0upti.me>
Date: Mon, 2 Jun 2025 10:19:22 +0300
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH RFC net-next] net: phylink: always config mac for
 (delayed) phy
To: "Russell King (Oracle)" <linux@armlinux.org.uk>,
 Eric Woudstra <ericwouds@gmail.com>
References: <20250107123615.161095-1-ericwouds@gmail.com>
 <Z30iUj6DE9-fRp0n@shell.armlinux.org.uk>
 <4b9b2a9a-061b-43ad-b402-a49aee317f41@gmail.com>
 <Z31CJS1YUvPGiEXs@shell.armlinux.org.uk>
 <98234080-946e-4b36-832f-113b185e7bca@gmail.com>
 <Z3-Tz5WdLCat91vm@shell.armlinux.org.uk>
Content-Language: en-US
From: Ilya K <me@0upti.me>
In-Reply-To: <Z3-Tz5WdLCat91vm@shell.armlinux.org.uk>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250602_001939_602921_84A26FF8 
X-CRM114-Status: UNSURE (   9.41  )
X-CRM114-Notice: Please train this message.
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
Cc: Andrew Lunn <andrew@lunn.ch>, AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, netdev@vger.kernel.org, linux-mediatek@lists.infradead.org, Daniel Golle <daniel@makrotopia.org>, linux-kernel@vger.kernel.org, Eric Dumazet <edumazet@google.com>, coreteam@netfilter.org, netfilter-devel@vger.kernel.org, bridge@lists.linux.dev, Matthias Brugger <matthias.bgg@gmail.com>, Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, "David S. Miller" <davem@davemloft.net>, linux-arm-kernel@lists.infradead.org, Heiner Kallweit <hkallweit1@gmail.com>
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On 2025-01-09 12:15, Russell King (Oracle) wrote:
> On Thu, Jan 09, 2025 at 09:56:17AM +0100, Eric Woudstra wrote:
> I'll look at what we can do for this today.
Hey folks, don't really want to necrobump this, but the original hack patch is the only way I can get my weirdo Realtek (noticing a pattern here) GPON modem-on-a-stick to probe at 2500base-x on a BPi-R4. I've actually tracked down the issue myself and wrote basically the same patch first :( Is there anything I can do (with my extremely limited phylink understanding) to help move this forward so other people don't have to suffer like I did?

