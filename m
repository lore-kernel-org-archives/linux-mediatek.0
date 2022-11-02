Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4D355C4332F
	for <linux-mediatek@archiver.kernel.org>; Wed,  2 Nov 2022 11:40:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=+weQtxfgoNBES+U0BFPfLStOe9TACD1kLz8vTrv2O+E=; b=SUm5FfHQcg1gMxXwvhOsGtN200
	FLXh29o+9CiYSlvguFXaNr9m0J65tou8s9GB5R7AJqih+48McFyB+dXYyay5N9B1nvjCujsDi4ikw
	/jis6t7lWtCerKc/JRY4G4RThjH+wHnyat12IbOGNxYjrto3ysyLspBYA8DpF+ZZxqtUn6pdXqTDL
	tltQ4fXlO4ifrhlYsWYAoE4VNRSfSX0yHB5B5QcxYP68B4k7a3gpUUQNlYtyNkqy0zQFhBGYrlqVq
	E3JWUiF4uJuqLRF547GezxxPooV+Db60UoZWAsmU/82XCyeaGNzKqg0tMAAQ7p6mJJEvbOFwiBf1I
	KvSSLLNw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oqC6t-00AnOl-QD; Wed, 02 Nov 2022 11:40:43 +0000
Received: from fudo.makrotopia.org ([2a07:2ec0:3002::71])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oqC6j-00AnLQ-1n; Wed, 02 Nov 2022 11:40:34 +0000
Received: from local
	by fudo.makrotopia.org with esmtpsa (TLS1.3:TLS_AES_256_GCM_SHA384:256)
	 (Exim 4.94.2)
	(envelope-from <daniel@makrotopia.org>)
	id 1oqC6I-0002qz-Nw; Wed, 02 Nov 2022 12:40:06 +0100
Date: Wed, 2 Nov 2022 11:40:01 +0000
From: Daniel Golle <daniel@makrotopia.org>
To: Jakub Kicinski <kuba@kernel.org>
Cc: Felix Fietkau <nbd@nbd.name>, John Crispin <john@phrozen.org>,
	Sean Wang <sean.wang@mediatek.com>,
	Mark Lee <Mark-MC.Lee@mediatek.com>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>, Paolo Abeni <pabeni@redhat.com>,
	Matthias Brugger <matthias.bgg@gmail.com>, netdev@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v4] net: ethernet: mediatek: ppe: add support for flow
 accounting
Message-ID: <Y2JXEfRDZO2oPoMT@makrotopia.org>
References: <Y2HAmYYPd77dz+K5@makrotopia.org>
 <20221101204945.35edb8e6@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20221101204945.35edb8e6@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221102_044033_134422_DC9FCCE0 
X-CRM114-Status: GOOD (  17.49  )
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

Hi Jakub,

On Tue, Nov 01, 2022 at 08:49:45PM -0700, Jakub Kicinski wrote:
> On Wed, 2 Nov 2022 00:58:01 +0000 Daniel Golle wrote:
> > The PPE units found in MT7622 and newer support packet and byte
> > accounting of hw-offloaded flows. Add support for reading those
> > counters as found in MediaTek's SDK[1].
> > 
> > [1]: https://git01.mediatek.com/plugins/gitiles/openwrt/feeds/mtk-openwrt-feeds/+/bc6a6a375c800dc2b80e1a325a2c732d1737df92
> > Signed-off-by: Daniel Golle <daniel@makrotopia.org>
> > ---
> > v4: declare function mtk_mib_entry_read as static
> > v3: don't bother to set 'false' values in any zero-initialized struct
> >     use mtk_foe_entry_ib2
> >     both changes were requested by Felix Fietkau
> > 
> > v2: fix wrong variable name in return value check spotted by Denis Kirjanov
> 
> Please read the FAQ:
> 
> https://www.kernel.org/doc/html/next/process/maintainer-netdev.html#tl-dr

I'm sorry for re-submitting the fixes to frequently. I'll give it more
time in future.

> 
> https://www.kernel.org/doc/html/next/process/maintainer-netdev.html#running-all-the-builds-and-checks-locally-is-a-pain-can-i-post-my-patches-and-have-the-patchwork-bot-validate-them
> 

It wasn't my intention to out-source testing to the patchwork bot.
I do run checks as recommended locally, which includes checkpatch.pl,
build and run-time testing. And though in this case an unneeded export
of a function was also indicated by my local compiler, I must have
missed it in the output of the kernel build. I will try to improve my
workflow in such a way that it will be less likely to miss new compiler
warnings.

