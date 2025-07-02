Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F391AC7EE30
	for <linux-mediatek@archiver.kernel.org>; Wed,  2 Jul 2025 07:49:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Type:MIME-Version:References:Message-ID:Subject:To:From:Date:Reply-To
	:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=OFEn8Mwx7iZb4bcLt1+4BA8J7VwQHTbrRClWAd6OzhU=; b=gxkPNSHfR1fNcg8HmaqWXPqNQK
	Xevd/eO6D2CG1AW8aP5YEyYu6o70uaJ1yaztGjKlGDIPKxHzXa282Ler2Fn4Zo5P4+Okj973NqgsK
	ZdFaPJmW67y4ghgU0GZDSpA8GgIYa8upZEbBUGhYI/gEiUxCDN3MIAjpyMaFV/2E+W7A2mIHV5cLJ
	tcp6H9o8AP+nc4/RuPNEcWxBJMF62SbGQqX0x7zf8Mk1surEBVzatCZ1wDt4hpf1Q3z3XQxa4+wQh
	02KxfiMkLdD8NgdiVr2LPcUafMkc1SjxYvdsoQ/3u3zIBTpSQR/wWskKIPsQ35+tTDhQok6+3DF0p
	iEmr9/pA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uWsDP-00000007XOe-2YFa;
	Wed, 02 Jul 2025 07:49:11 +0000
Received: from vps0.lunn.ch ([156.67.10.101])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uWsB4-00000007X3E-09nV;
	Wed, 02 Jul 2025 07:46:47 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
	s=20171124; h=In-Reply-To:Content-Disposition:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:From:Sender:Reply-To:Subject:
	Date:Message-ID:To:Cc:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Content-Disposition:In-Reply-To:References;
	bh=OFEn8Mwx7iZb4bcLt1+4BA8J7VwQHTbrRClWAd6OzhU=; b=TY+5wL4gDFSoFVqQeDom46pQ3Z
	DslEO6a82orDnsC9xr7tvmwE9LkDnW1GS1RQeYPD4PSM3xE0VsV6qjCsxtVrRIs7Dt8+xW9DKeK/g
	jEkUCwbXdJFtMPrHOp4p8hlz5likS8jO47le2YGqEcIhCcgzZhZ+Wze7mORKVH0L7ijQ=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.94.2)
	(envelope-from <andrew@lunn.ch>)
	id 1uWsAk-00HYRS-Hx; Wed, 02 Jul 2025 09:46:26 +0200
Date: Wed, 2 Jul 2025 09:46:26 +0200
From: Andrew Lunn <andrew@lunn.ch>
To: Daniel Golle <daniel@makrotopia.org>
Subject: Re: [PATCH net-next v4 3/3] net: ethernet: mtk_eth_soc: use generic
 allocator for SRAM
Message-ID: <e5d6ac18-4d38-4a01-abd5-8bd4d6c3b05b@lunn.ch>
References: <cover.1751421358.git.daniel@makrotopia.org>
 <88ae2a765ef809d36e153430bf60aac6ce81d6f1.1751421358.git.daniel@makrotopia.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <88ae2a765ef809d36e153430bf60aac6ce81d6f1.1751421358.git.daniel@makrotopia.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250702_004646_072619_284CB3EF 
X-CRM114-Status: GOOD (  10.85  )
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
Cc: Sky Huang <skylake.huang@mediatek.com>, netdev@vger.kernel.org, Sean Wang <sean.wang@mediatek.com>, linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org, Andrew Lunn <andrew+netdev@lunn.ch>, Eric Dumazet <edumazet@google.com>, Matthias Brugger <matthias.bgg@gmail.com>, linux-arm-kernel@lists.infradead.org, Bo-Cun Chen <bc-bocun.chen@mediatek.com>, Eric Woudstra <ericwouds@gmail.com>, Elad Yifee <eladwf@gmail.com>, Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, Lorenzo Bianconi <lorenzo@kernel.org>, "David S. Miller" <davem@davemloft.net>, AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, Felix Fietkau <nbd@nbd.name>
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On Wed, Jul 02, 2025 at 03:38:15AM +0100, Daniel Golle wrote:
> Use a dedicated "mmio-sram" node and the generic allocator
> instead of open-coding SRAM allocation for DMA rings.
> Keep support for legacy device trees but notify the user via a
> warning to update, and let the ethernet driver create the
> gen_pool in this case.
> 
> Co-developed-by: Frank Wunderlich <frank-w@public-files.de>
> Signed-off-by: Frank Wunderlich <frank-w@public-files.de>
> Signed-off-by: Daniel Golle <daniel@makrotopia.org>

Reviewed-by: Andrew Lunn <andrew@lunn.ch>

    Andrew

