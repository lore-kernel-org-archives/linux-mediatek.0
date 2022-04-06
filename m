Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7F7A8C433F5
	for <linux-mediatek@archiver.kernel.org>; Wed,  6 Apr 2022 18:53:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=HD2Ggl6In3Fhz/tYTaNgOR5BVFFt9mjMzmVgrjfej/4=; b=iPNJHR9TRaCEB+
	TbyltRAqu5WzmyFEk8HzO2vWhJekvNpYztPCkWGc4dsieRzJ5taYfaIL1GpmCjOcPFV1Kq/bqutw+
	AQ7n/l04VvuusGM1wn4qdl71EqXG+TAdRUFSL3yXrccJRmt9GgsJRTXhZwYJ/bYhfTHeyWMAlgVx0
	KUsyNghSp7MyQddif7HRw7SFQhtB0dZWKoA1iI3i0AuOfD8ckuFIVWaWqkrEFlO3MmKBDOUvbg/V2
	mSBBfEu3fVsoZWafVdT2CZbqvRTxxT6yxIIVyrS8S/nVW9RAZEq1xNkDXuVF87wquX76hnxqwjBis
	EVZKNZxfG1cuk2jgp0UQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ncAm8-007cau-Nw; Wed, 06 Apr 2022 18:53:04 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1ncAlx-007cYw-Pg; Wed, 06 Apr 2022 18:52:54 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 813FE61655;
 Wed,  6 Apr 2022 18:52:52 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4D6D2C385A5;
 Wed,  6 Apr 2022 18:52:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1649271171;
 bh=nrUs+OgbcF/TQelOzfe+pb1CAB4eIs6PKGZnjXJNeW0=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=sTqP7d7u46gWoHKsoDtLH6oUOKjFyXMNobx2YOZta7MBmWAk83Fzg2xZIjxlKCDqS
 YdJlxgfSqKwvj3UL40BRLWVMRl2aGJGLNhg82iqQcuEAj1BEN469pl/QsynugJX7Ee
 dIO+0fCETGGeaYCt/N2u16tJSzXdO2C+XSnPJDiAWzf9rjL2KtTZdQ8pfjAcY3e4UU
 j6Uy1SjxMhJuM0b5cSwLZS2s2uKpAgL+oOJ44gZnhQSpNsbwXBrnS8iPV14ohpKCGU
 zfhjIbmERwVvTeYgkcScq6WVIZYIawSennGQ0kACk5Iax8VcWd/k1xD+xjJT5iKqeA
 vI0L8CKmrsz4g==
Date: Wed, 6 Apr 2022 11:52:50 -0700
From: Jakub Kicinski <kuba@kernel.org>
To: "Russell King (Oracle)" <rmk+kernel@armlinux.org.uk>
Cc: Landen Chao <Landen.Chao@mediatek.com>, DENG Qingfang
 <dqfext@gmail.com>, Sean Wang <sean.wang@mediatek.com>, Marek Beh__n
 <kabel@kernel.org>, Andrew Lunn <andrew@lunn.ch>, Vivien Didelot
 <vivien.didelot@gmail.com>, Florian Fainelli <f.fainelli@gmail.com>,
 Vladimir Oltean <olteanv@gmail.com>, "David S. Miller"
 <davem@davemloft.net>, Paolo Abeni <pabeni@redhat.com>, Matthias Brugger
 <matthias.bgg@gmail.com>, netdev@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org
Subject: Re: [PATCH net-next 5/9] net: dsa: mt7530: only indicate linkmodes
 that can be supported
Message-ID: <20220406115250.047570c1@kernel.org>
In-Reply-To: <E1nc3Dd-004hq7-Co@rmk-PC.armlinux.org.uk>
References: <Yk1iHCy4fqvxsvu0@shell.armlinux.org.uk>
 <E1nc3Dd-004hq7-Co@rmk-PC.armlinux.org.uk>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220406_115253_919349_8A4606E1 
X-CRM114-Status: UNSURE (   8.67  )
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

On Wed, 06 Apr 2022 11:48:57 +0100 Russell King (Oracle) wrote:
> -	if (state->interface != PHY_INTERFACE_MODE_MII) {
> +	if (state->interface != PHY_INTERFACE_MODE_MII &&
> +	    state->interface != PHY_INTERFACE_MODE_2500BASEX)
>  		phylink_set(mask, 1000baseT_Full);
>  		phylink_set(mask, 1000baseX_Full);
>  	}

Missing { here. Dunno if kbuild bot told you already.

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
