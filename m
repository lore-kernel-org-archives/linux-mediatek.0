Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DBEA6C27C54
	for <linux-mediatek@archiver.kernel.org>; Thu,  6 Jun 2024 15:26:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ly6BH2m3JoP+4FyQwUkwBE0M0aUYqYUYUqs4MtHE/7E=; b=1Y5+eXePBUWQ73rvWTdCEDQwRW
	Jw/cop/mLBwRNSmA23mNBt7pPjE2L7pU3SrxWcFjqfRG3w60KoyqTagjtS1L9owdLnQamOb9fWIty
	dS8g8mEqFxZ8GAI1tmHaFixBFw77jW8gYvyHtIIZH7Z8XM2JXGGkHVZW22oisS+Ih4hc0I1eYoK/d
	61r/UqFum3RbBwHCUbGXswXS6IUx4J612ocJOiJMWXhm8nnaDOGsRYvF20K/2ZD/e/MFgfADEsFJL
	2swHqBMrl79aunpp5xd1qEhgEfrU1HuWOIt7Rt/LYCjxu+oCxD4PTSetdJgWCfBKyB11wyrHXBaRs
	22Nrx5SA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sFF0t-0000000AInZ-1KvJ;
	Thu, 06 Jun 2024 15:26:51 +0000
Received: from sin.source.kernel.org ([2604:1380:40e1:4800::1])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sFF0o-0000000AIlY-4C6Y;
	Thu, 06 Jun 2024 15:26:49 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id 3CC95CE1A4A;
	Thu,  6 Jun 2024 15:26:45 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 876D4C32781;
	Thu,  6 Jun 2024 15:26:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1717687604;
	bh=g9DU+5xnLtEMAIzCRN/FCtyy6ez/NLtJEwNFQWO4WeU=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=n9YYwlQqi8SfeLRIhucMQqvCL6MADLMFzkhp4D8C64U83lkJpHMBY37hgmjOP8g2u
	 PbB1bOkRo7ATQhklm+X/pB4T1W5TrkY+UO/qEFmXSBLN0Zo4jqd0mC2sC0/JVpGOO0
	 /3PNRJ8Id42EncZ/nkr9/Ue9MLgd1Yx558CAvMQRrGSkv+GVhfIJGC82tdJjOfVDBw
	 TpxpgHNYaEB/Y2szEPhbaNeEgUOIKoDMVjg+Jcc7V8PhWKisjFiTvdqQY7Y1fqR1XR
	 A/ljObxNcUa6mEUqJ0AikEPWNu7IipRamnOIiM0qMzOlHowrF1r4emJGKJZKcuHfJY
	 tM9V/P3wHarxw==
Date: Thu, 6 Jun 2024 08:26:42 -0700
From: Jakub Kicinski <kuba@kernel.org>
To: Elad Yifee <eladwf@gmail.com>
Cc: Felix Fietkau <nbd@nbd.name>, Sean Wang <sean.wang@mediatek.com>, Mark
 Lee <Mark-MC.Lee@mediatek.com>, Lorenzo Bianconi <lorenzo@kernel.org>,
 "David S. Miller" <davem@davemloft.net>, Eric Dumazet
 <edumazet@google.com>, Paolo Abeni <pabeni@redhat.com>, Matthias Brugger
 <matthias.bgg@gmail.com>, AngeloGioacchino Del Regno
 <angelogioacchino.delregno@collabora.com>, Russell King
 <linux@armlinux.org.uk>, netdev@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org, Daniel Golle <daniel@makrotopia.org>
Subject: Re: [PATCH net-next v5] net: ethernet: mtk_eth_soc: ppe: add
 support for multiple PPEs
Message-ID: <20240606082642.397c0dc0@kernel.org>
In-Reply-To: <CA+SN3soxVEUUWZHMFX7OeMj56wEw7p9Q=eXXNJwiYz6Bh=pb7Q@mail.gmail.com>
References: <20240602173247.12651-1-eladwf@gmail.com>
	<20240605194305.194286d8@kernel.org>
	<CA+SN3soxVEUUWZHMFX7OeMj56wEw7p9Q=eXXNJwiYz6Bh=pb7Q@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240606_082647_255475_5B563950 
X-CRM114-Status: GOOD (  16.04  )
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

On Thu, 6 Jun 2024 08:56:49 +0300 Elad Yifee wrote:
> > I thought Daniel's suggestion was to remove this field.
> > I don't see your rebuke to that point or how it's addressed in the code.
> > Also it would be good if you CCed Daniel, always CC people who gave you
> > feedback.  
> I talked to Daniel in private, I should have done that publicly.
> Relying solely on ifindex%ppe_num could potentially lead to more than
> one GMAC assigned to the same PPE.
> Since the ingress device could be a non mtk type, I added that sanity check.
> I think the additional field is a small price to keep things clear and simple.

Got it, could you include the justification for sticking to the current
method in the commit message, maybe?

