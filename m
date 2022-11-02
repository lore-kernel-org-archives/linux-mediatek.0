Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6F9B4C433FE
	for <linux-mediatek@archiver.kernel.org>; Wed,  2 Nov 2022 01:03:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Kdp42P57KUhdwUVNB13rc2UgHFANca4GpKsmrNXSS3E=; b=yAxNTni8y6aadk2SWJC3bsYpCH
	xlgQszGD4NCBnUFcE+F5bHxfrXqxw3Kh95k/Xt3gptVin5j4Pb6Pi9B8sbmQ6NATOm1dQiFlLFMoN
	UCcQnDxnJfaf8yUU7MBEqsuFePSjJ/mQjQSJb7cKm0Izw1nf94XD6k2mY+LCkez/i3VTgKwwwWkUR
	93VFk9uvldC/G2COrCz575DZJvW72iRbZCQFdMrXePv2nAPfQfbF9FcsMBCk1x7grwcXHknovJcPg
	mEtbbVzA9w+j+o+UJAuAuNPtpz1DGCduFDhLdxDRfCTz1giMyTPsRfaaXg3F5YYiRcbGKwN0aNCQX
	APGzu+Mg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oq2AM-007qOv-Uv; Wed, 02 Nov 2022 01:03:38 +0000
Received: from fudo.makrotopia.org ([2a07:2ec0:3002::71])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oq2AC-007qMr-DP; Wed, 02 Nov 2022 01:03:29 +0000
Received: from local
	by fudo.makrotopia.org with esmtpsa (TLS1.3:TLS_AES_256_GCM_SHA384:256)
	 (Exim 4.94.2)
	(envelope-from <daniel@makrotopia.org>)
	id 1oq29v-0007z2-7c; Wed, 02 Nov 2022 02:03:11 +0100
Date: Wed, 2 Nov 2022 01:03:08 +0000
From: Daniel Golle <daniel@makrotopia.org>
To: Andrew Lunn <andrew@lunn.ch>
Cc: Felix Fietkau <nbd@nbd.name>, John Crispin <john@phrozen.org>,
	Sean Wang <sean.wang@mediatek.com>,
	Mark Lee <Mark-MC.Lee@mediatek.com>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	Matthias Brugger <matthias.bgg@gmail.com>, netdev@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3] net: ethernet: mediatek: ppe: add support for flow
 accounting
Message-ID: <Y2HBzEdmiKK9IPFK@makrotopia.org>
References: <Y2G9ANkdaaENNnOd@makrotopia.org>
 <Y2G/CaPrTVsYeGWB@lunn.ch>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <Y2G/CaPrTVsYeGWB@lunn.ch>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221101_180328_468736_4A0D4E20 
X-CRM114-Status: GOOD (  15.30  )
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

Hi Andrew,

On Wed, Nov 02, 2022 at 01:51:21AM +0100, Andrew Lunn wrote:
> On Wed, Nov 02, 2022 at 12:42:40AM +0000, Daniel Golle wrote:
> > The PPE units found in MT7622 and newer support packet and byte
> > accounting of hw-offloaded flows. Add support for reading those
> > counters as found in MediaTek's SDK[1].
> > 
> > [1]: https://git01.mediatek.com/plugins/gitiles/openwrt/feeds/mtk-openwrt-feeds/+/bc6a6a375c800dc2b80e1a325a2c732d1737df92
> > Signed-off-by: Daniel Golle <daniel@makrotopia.org>
> 
> Sorry, but NACK.
> 
> You have not explained why doing this correctly via ethtool -S cannot
> be done. debugfs is a vendor crap way of doing this.

The debugfs interface is pre-existing and **in addition** to the
standard Linux interfaces which are also provided. It is true that
the debugfs interface in this case doesn't provide much additional
value apart from having the counter listed next to the hardware-
specific hashtable keys. As the debugfs interface for now aims to
be as complete as possible, naturally there is some redundance of
things which can also be accessed using other (standard) interfaces.

Anyway. See function mtk_flow_offload_stats which now also reports
counters.


Cheers


Daniel

