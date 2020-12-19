Return-Path: <SRS0=cDU4=FX=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E2EA1C4361B
	for <linux-mediatek@archiver.kernel.org>; Sat, 19 Dec 2020 16:26:31 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 7794923A79
	for <linux-mediatek@archiver.kernel.org>; Sat, 19 Dec 2020 16:26:30 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 7794923A79
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=lunn.ch
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:Message-ID:
	Subject:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=4181j25cNyyYiF5KXZoYYwOLxh6pE2B8j1+ACOjE2yI=; b=FVOqjp2/m/dWsmAazQYy7FdAs
	hCtTDijlQVhjpM1T10goFi4u9Q5cTS9vfBCa9SebV4pKibaLc1dnyoJ4RgHA7tQs+RVvWXAngGfTT
	rxxft07d6BwebKH+tbVemYJ5Uwj1FoyhH0quNdc0AkffPUlzKlhBs9mEMANy9Q8omX6p5LV3uIi0c
	2ePDA46qkIIxQRBn+TVjFjkpTlIzAVnZbiKDGw4dU7NaayajF1jp3b0cizre/PE7mVq63eR6K6YCx
	2xzSWvvcGgSMcO1ru8dCt/ny/T2EnhBqhZYueLqhDNQTnxrzI+xqmOxTJvFxcfdRq6zFrcOoDasez
	CwrehxWqg==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kqf3d-0003zy-Nn; Sat, 19 Dec 2020 16:26:13 +0000
Received: from vps0.lunn.ch ([185.16.172.187])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kqf3Z-0003z8-VX
 for linux-mediatek@lists.infradead.org; Sat, 19 Dec 2020 16:26:12 +0000
Received: from andrew by vps0.lunn.ch with local (Exim 4.94)
 (envelope-from <andrew@lunn.ch>)
 id 1kqf3R-00CrP1-KC; Sat, 19 Dec 2020 17:26:01 +0100
Date: Sat, 19 Dec 2020 17:26:01 +0100
From: Andrew Lunn <andrew@lunn.ch>
To: DENG Qingfang <dqfext@gmail.com>
Subject: Re: [RFC PATCH net-next] net: dsa: mt7530: rename MT7621 compatible
Message-ID: <20201219162601.GE3008889@lunn.ch>
References: <20201219162153.23126-1-dqfext@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20201219162153.23126-1-dqfext@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201219_112610_036120_EF64554B 
X-CRM114-Status: GOOD (  10.25  )
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
Cc: Landen Chao <Landen.Chao@mediatek.com>,
 Florian Fainelli <f.fainelli@gmail.com>, netdev@vger.kernel.org,
 Sean Wang <sean.wang@mediatek.com>, Russell King <linux@armlinux.org.uk>,
 "David S . Miller" <davem@davemloft.net>,
 Rene van Dorst <opensource@vdorst.com>, Greg Ungerer <gerg@kernel.org>,
 linux-mediatek@lists.infradead.org, John Crispin <john@phrozen.org>,
 Matthias Brugger <matthias.bgg@gmail.com>, Jakub Kicinski <kuba@kernel.org>,
 Vladimir Oltean <olteanv@gmail.com>, Vivien Didelot <vivien.didelot@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

> --- a/drivers/net/dsa/mt7530.c
> +++ b/drivers/net/dsa/mt7530.c
> @@ -2688,7 +2688,7 @@ static const struct mt753x_info mt753x_table[] = {
>  };
>  
>  static const struct of_device_id mt7530_of_match[] = {
> -	{ .compatible = "mediatek,mt7621", .data = &mt753x_table[ID_MT7621], },
> +	{ .compatible = "mediatek,mt7621-gsw", .data = &mt753x_table[ID_MT7621], },
>  	{ .compatible = "mediatek,mt7530", .data = &mt753x_table[ID_MT7530], },
>  	{ .compatible = "mediatek,mt7531", .data = &mt753x_table[ID_MT7531], },
>  	{ /* sentinel */ },

This will break backwards compatibility with existing DT blobs. You
need to keep the old "mediatek,mt7621", but please add a comment that
it is deprecated.

   Andrew

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
