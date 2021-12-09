Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EFC65C433F5
	for <linux-mediatek@archiver.kernel.org>; Thu,  9 Dec 2021 01:52:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=rP1g2eAvyx/GUJeh5Wli5AEQWAP8OK09aY1rFV488fY=; b=jXGWwl4CnoJhOa
	uOhFrt/zBzRiPAnBE/fHjatxvsi1fi4M3Xx6aUC780prHKgNYTvas9k4/w4yelrovvJL92Y3fwnA1
	AVSeXCma6ub4oTt/wNtQx9W0hBlA67yLSuyxintxG1jxGOxfxXWF1o7o9aZUYPG+pATeUAit1+b+h
	pPqDTXdyRN8I27q1T3s7qxCD0xBrATyhrCn3RneZ7B4kptpBPGKHgKz634pmIPTo+z8Ru0nYe3Ycp
	6M39JYN8GahUASeaMkvX39/EGGh6SwglwzFQsL0Ro4I1F6uhl0UTbX0ZGwgs36/2EdSxxyz00S6zU
	lGmMRxtLUHsfj7Q0Hy4Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mv8bL-00EhZ8-7q; Thu, 09 Dec 2021 01:52:03 +0000
Received: from sin.source.kernel.org ([145.40.73.55])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mv8b6-00EhUB-Ax; Thu, 09 Dec 2021 01:51:49 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by sin.source.kernel.org (Postfix) with ESMTPS id F2421CE2331;
 Thu,  9 Dec 2021 01:51:45 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 75921C00446;
 Thu,  9 Dec 2021 01:51:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1639014704;
 bh=5T0ucDpr39HCf8PypsCLt5HtRmXScmsEPR83rW4e950=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=RYzHYbDzTs3jYNk+W5eTmiXbOhiozCA41/Erv8HRyDqrnhFPKC9OEd4iZWnpYJUNO
 pS5lFHtiuHzaxlMwk/1CQfsb6etPcxjqmpqZWs1VXWXxSFncbYzNqaMAiTj+oyVo2k
 i/Ou7QVxMlbBC7bhxogc21fbJr/e8QJcuoS30iz/+wD0XbJwo9LL6EnGVtd2p0GEzj
 6hLKL27k+MshR0bsUZjU8orNwQ3rmfrqqw4DFSSBW+Ies3IKq4aIW5qBPf+kVKiGTW
 W2Jj5UjhNGScILNtxukzyKWA0mBs4OUvTPkNzYK+nTD5R8Sg8yaCnEJcGccy1ECuC9
 j+uHFjmarYwHA==
Date: Wed, 8 Dec 2021 17:51:42 -0800
From: Jakub Kicinski <kuba@kernel.org>
To: Biao Huang <biao.huang@mediatek.com>
Cc: <davem@davemloft.net>, Rob Herring <robh+dt@kernel.org>, Matthias
 Brugger <matthias.bgg@gmail.com>, Giuseppe Cavallaro
 <peppe.cavallaro@st.com>, Alexandre Torgue <alexandre.torgue@foss.st.com>,
 Jose Abreu <joabreu@synopsys.com>, Maxime Coquelin
 <mcoquelin.stm32@gmail.com>, <netdev@vger.kernel.org>,
 <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
 <linux-arm-kernel@lists.infradead.org>,
 <linux-mediatek@lists.infradead.org>,
 <linux-stm32@st-md-mailman.stormreply.com>, <srv_heupstream@mediatek.com>,
 <macpaul.lin@mediatek.com>, <angelogioacchino.delregno@collabora.com>,
 <dkirjanov@suse.de>
Subject: Re: [PATCH net-next v7 5/6] stmmac: dwmac-mediatek: add support for
 mt8195
Message-ID: <20211208175142.1b63afea@kicinski-fedora-pc1c0hjn.dhcp.thefacebook.com>
In-Reply-To: <39aa23e1a48bc36a631b3074af2abfd5d1e2256d.camel@mediatek.com>
References: <20211208054716.603-1-biao.huang@mediatek.com>
 <20211208054716.603-6-biao.huang@mediatek.com>
 <20211208063820.264df62d@kicinski-fedora-pc1c0hjn.dhcp.thefacebook.com>
 <39aa23e1a48bc36a631b3074af2abfd5d1e2256d.camel@mediatek.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211208_175148_618858_9DE8B57E 
X-CRM114-Status: GOOD (  13.82  )
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

On Thu, 9 Dec 2021 09:48:25 +0800 Biao Huang wrote:
> Sorry for some typo in previous reply, fix it here.
> 
> All these warning lines share a similar semantics:
> delay_val |= FIELD_PREP(xxx, !!val);
> 
> and, should come from the expansion of FIELD_PREP in
> include/linux/bitfiled.h:
> 
>   FIELD _PREP --> __BF_FILED_CHECK --> "~((_mask) >> __bf_shf(_mask)) &
> (_val) : 0,"
> 
> ===============================================================
> __BF_FILED_CHECK {
> ...
>   BUILD_BUG_ON_MSG(__builtin_constant_p(_val) ?           \
>                    ~((_mask) >> __bf_shf(_mask)) & (_val) : 0, \
>                    _pfx "value too large for the field"); \ ...
> ===============================================================
> 
> Should I fix it by converting
>   delay_val |= FIELD_PREP(ETH_DLY_TXC_ENABLE, !!mac_delay->tx_delay);
> to
>   en_val = !!mac_delay->tx_delay;
>   delay_val |= FIELD_PREP(ETH_DLY_TXC_ENABLE, en_val);
> 
> or other suggestions for these warnings?

I see, thanks for explaining. The code is fine, we can simply ignore
this warning IMHO.

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
