Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 05C7CC433EF
	for <linux-mediatek@archiver.kernel.org>; Wed, 18 May 2022 01:41:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=0tRprfz68fiO/4kFALLIC/cPC1Y75L3NeoiX0Pi0P54=; b=IoPt4SflOjtXAu
	QSouR2mtcXMZHSDRQkeFmmw2NnAgSzyTE2M4Rzq3VKXUC+tjdu9KdUHrTWaSmwBDr2jD2Kvr7UfJp
	nVVFcb7gqX+GI+L3F0jzND4O6xXmcbLFkBwIxQrzLzg0ZHWD2Vu/BhhSvCU7xUWfipVvhoY9iNMzY
	QubKQwRWtKwAysOXwGQlA2q55ppb6fN0DsKv9aUCoMi7A+PDZpCrcrT5fU+UcxdYJo61tNcp40XOu
	cZGdVo1pEVeYDmbH4KiKKBc1SbpoXPPpIbaEA9CMgLTWCDYcdQoC12Cf72nB0LU+31vqvJYo+eNsD
	mhy5GLAkWZaNHSBKRMZg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nr8gp-00Gbu3-H6; Wed, 18 May 2022 01:41:27 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nr8gn-00Gbtb-6S
 for linux-mediatek@lists.infradead.org; Wed, 18 May 2022 01:41:26 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 8D41F61620;
 Wed, 18 May 2022 01:41:24 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 74F34C34116;
 Wed, 18 May 2022 01:41:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1652838084;
 bh=rB1qtfEoe/0j2qEt3MLBrL8NpZIg7aZNCzRuOninDXk=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=kNazYk02Pz7xkmTef8YxMujGrh3rwSMmr6O7Eee2Q5tvpupO8dSHvJLhYMfFfH95y
 HVZBXQEXdvQmusH02l+IeFM8qw1Tshh9PaR1N8t6h7UjG+HzBUEoQqKZfbVVXnSt2c
 3POlSJAFojvg01ImeVwgaIcsLDMQz+Lmz6WMLlxnXwjFd+SXMetCbULukVKzgmRDjA
 k9M0Os3EnfklZImmRY/DxzhqBNEEKfNpRSYFaia7yYIbCyaAMADBLXTCCcazFZvYkp
 ilkLs667fraIxrR/u3L+MK3jFxJ4bRcC/bi+/ylFt3gMsQxsl1P/A8VyiukSjjcaj1
 G0OnBsRMFzd5w==
Date: Tue, 17 May 2022 18:41:22 -0700
From: Jakub Kicinski <kuba@kernel.org>
To: Lorenzo Bianconi <lorenzo@kernel.org>
Cc: netdev@vger.kernel.org, nbd@nbd.name, john@phrozen.org,
 sean.wang@mediatek.com, Mark-MC.Lee@mediatek.com, davem@davemloft.net,
 edumazet@google.com, pabeni@redhat.com, Sam.Shih@mediatek.com,
 linux-mediatek@lists.infradead.org, devicetree@vger.kernel.org,
 robh@kernel.org, lorenzo.bianconi@redhat.com
Subject: Re: [PATCH v2 net-next 11/15] net: ethernet: mtk_eth_soc: introduce
 device register map
Message-ID: <20220517184122.522ed708@kernel.org>
In-Reply-To: <78e8c6ed230130b75aae77e6d05a9b35e298860a.1652716741.git.lorenzo@kernel.org>
References: <cover.1652716741.git.lorenzo@kernel.org>
 <78e8c6ed230130b75aae77e6d05a9b35e298860a.1652716741.git.lorenzo@kernel.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220517_184125_318601_91B2028E 
X-CRM114-Status: UNSURE (   7.91  )
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On Mon, 16 May 2022 18:06:38 +0200 Lorenzo Bianconi wrote:
>  /* PDMA RX Base Pointer Register */
> -#define MTK_PRX_BASE_PTR0	0x900
> +#define MTK_PRX_BASE_PTR0	(eth->soc->reg_map[MTK_PDMA_BASE] + 0x100)
>  #define MTK_PRX_BASE_PTR_CFG(x)	(MTK_PRX_BASE_PTR0 + (x * 0x10))

Implicit macro arguments are really unpleasant for people doing
tree-wide changes or otherwise unfamiliar with the driver.

Nothing we can do to avoid this?

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
