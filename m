Return-Path: <SRS0=ROsh=CB=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.7 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4C681C433E1
	for <linux-mediatek@archiver.kernel.org>; Sun, 23 Aug 2020 19:13:39 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 18F7F206C0
	for <linux-mediatek@archiver.kernel.org>; Sun, 23 Aug 2020 19:13:38 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="ZXMkLrd6"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 18F7F206C0
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=lunn.ch
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:Message-ID:
	Subject:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=IcMn+tJyYSORVlUhHJEMMpmSSjUzq5cx9oFk40UAFgc=; b=ZXMkLrd68tPDlpilscRQwpNxM
	kqtt2//5N1lhxvzF6R+lFEKD5r3NtY/NQPCeThIoz0VeRydz3bHb+zSCyfydIEztL71Qfi0A5u1gg
	+wU8Z5p3dcY9MFuYTxLOA09tHLHE+3IARx0ZGNsOOLzW5p3CBMlkx1zRvbte9mdn9m30z7wf8pWr8
	oMzt0ep+0Wpo4hfp/oYklB7Qtxd4gU0RI+/AaWlwu/jt660tzXp2jwrnw4mIP/PNq2F/v/uvTDuF6
	v7i/mlHb/SdxO93U1dZ/8iWVV5EGxDY/qg6rNek5PqLekBgPBr0ZZJh0KZDhFJ0vjQumW/YvBcQVn
	U7uHHsstA==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1k9vQk-0001oD-Iu; Sun, 23 Aug 2020 19:13:26 +0000
Received: from vps0.lunn.ch ([185.16.172.187])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1k9vQf-0001nQ-GH; Sun, 23 Aug 2020 19:13:22 +0000
Received: from andrew by vps0.lunn.ch with local (Exim 4.94)
 (envelope-from <andrew@lunn.ch>)
 id 1k9vQS-00BQBj-Id; Sun, 23 Aug 2020 21:13:08 +0200
Date: Sun, 23 Aug 2020 21:13:08 +0200
From: Andrew Lunn <andrew@lunn.ch>
To: Sumera Priyadarsini <sylphrenadin@gmail.com>
Subject: Re: [PATCH V2] net: dsa: Add of_node_put() before break statement
Message-ID: <20200823191308.GG2588906@lunn.ch>
References: <20200823185056.16641-1-sylphrenadin@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200823185056.16641-1-sylphrenadin@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200823_151321_587782_E903148F 
X-CRM114-Status: UNSURE (   9.04  )
X-CRM114-Notice: Please train this message.
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
Cc: f.fainelli@gmail.com, netdev@vger.kernel.org, sean.wang@mediatek.com,
 linux-kernel@vger.kernel.org, vivien.didelot@gmail.com, Julia.Lawall@lip6.fr,
 linux-mediatek@lists.infradead.org, matthias.bgg@gmail.com, kuba@kernel.org,
 davem@davemloft.net, linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

> diff --git a/drivers/net/dsa/mt7530.c b/drivers/net/dsa/mt7530.c
> index 8dcb8a49ab67..e81198a65c26 100644
> --- a/drivers/net/dsa/mt7530.c
> +++ b/drivers/net/dsa/mt7530.c
> @@ -1327,6 +1327,7 @@ mt7530_setup(struct dsa_switch *ds)
>  			if (phy_node->parent == priv->dev->of_node->parent) {
>  				ret = of_get_phy_mode(mac_np, &interface);
>  				if (ret && ret != -ENODEV)
> +					of_node_put(mac_np)
>  					return ret;
>  				id = of_mdio_parse_addr(ds->dev, phy_node);
>  				if (id == 0)

You are missing some { }. And a ; . I'm surprised gcc did not warn
you!

    Andrew

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
