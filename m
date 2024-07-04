Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 97134C30653
	for <linux-mediatek@archiver.kernel.org>; Thu,  4 Jul 2024 15:17:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=9ZZUxRSZ8MIDCImD6A36KsNDoTXs8NRfDoTGjvgzqWE=; b=rpa5GFRmNZfIF6m+T8vLfIHZ7l
	zOXtl5A8472G9X9B+z9pf7TlHx/WjTgGAKya6LGb8R8QQwrzrrt5j8blAWsVYLcumuz+mHifZTdRo
	7WN3tgRTNy89r3vPp2dU9S5tdkFQzfYeLQ1dAt1wDZXaQojvGqHmevy08GehN5OjeFQDghgHqic/q
	8ZMZ/Y9x/hYAOyX53cfRdZZYs202gDhM3s+aukyvLq7U9dhskS0GVDYbkmeuvTg6xdiewUv1TxTNm
	lx5xFjCvt80G7xe4XlSbj8ZDDaFM0oxSRcQJiM+HeGEYHahToRqTeglwkSrf6SqW15TPKn3F0TcOm
	L/31HU5g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sPOCp-0000000DevS-0ICV;
	Thu, 04 Jul 2024 15:17:07 +0000
Received: from pidgin.makrotopia.org ([2a07:2ec0:3002::65])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sPOBD-0000000DeRI-1KVM;
	Thu, 04 Jul 2024 15:15:28 +0000
Received: from local
	by pidgin.makrotopia.org with esmtpsa (TLS1.3:TLS_AES_256_GCM_SHA384:256)
	 (Exim 4.97.1)
	(envelope-from <daniel@makrotopia.org>)
	id 1sPOB5-000000000xJ-1mHR;
	Thu, 04 Jul 2024 15:15:19 +0000
Date: Thu, 4 Jul 2024 16:15:15 +0100
From: Daniel Golle <daniel@makrotopia.org>
To: Florian Fainelli <f.fainelli@gmail.com>
Cc: =?utf-8?B?QXLEsW7DpyDDnE5BTA==?= <arinc.unal@arinc9.com>,
	DENG Qingfang <dqfext@gmail.com>,
	Sean Wang <sean.wang@mediatek.com>, Andrew Lunn <andrew@lunn.ch>,
	Vladimir Oltean <olteanv@gmail.com>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Landen Chao <Landen.Chao@mediatek.com>,
	Frank Wunderlich <linux@fw-web.de>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>, netdev@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org, regressions@lists.linux.dev
Subject: Re: [PATCH net v3] net: dsa: mt7530: fix impossible MDIO address and
 issue warning
Message-ID: <Zoa8gyhHZ41ByNll@makrotopia.org>
References: <7e3fed489c0bbca84a386b1077c61589030ff4ab.1719963228.git.daniel@makrotopia.org>
 <5c92dcae-ec10-4652-a5e4-3f050774fc8b@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <5c92dcae-ec10-4652-a5e4-3f050774fc8b@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240704_081527_379923_5B89DFF0 
X-CRM114-Status: GOOD (  19.87  )
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

On Thu, Jul 04, 2024 at 04:46:29PM +0200, Florian Fainelli wrote:
> On 7/3/2024 12:44 AM, Daniel Golle wrote:
> > [...]
> > This is imporant also to not break compatibility with older Device Trees
> > as with commit 868ff5f4944a ("net: dsa: mt7530-mdio: read PHY address of
> > switch from device tree") the address in device tree will be taken into
> > account, while before it was hard-coded to 0x1f.
> > 
> > Fixes: b8f126a8d543 ("net-next: dsa: add dsa support for Mediatek MT7530 switch")
> > Signed-off-by: Daniel Golle <daniel@makrotopia.org>
> > ---
> > Only tested on BPi-R3 (with various deliberately broken DT) for now!
> 
> This seems like a whole lot of code just to auto-magically fix an issue that
> could be caught with a warning. I appreciate that most of these devices
> might be headless, and therefore having some attempt at getting functional
> networking goes a long way into allowing users to correct their mistakes.

My initial motivation was to preserve compatibility with existing broken
device trees.

I then had given up on it because nobody seemed to care, but have
resumed and completed the patch now that reverting the change taking the
address in DT into account became the only alternative.

In OpenWrt all device trees with broken switch MDIO address have been
fixed long ago... (and we always ship the DT along with the kernel, so
DT backward-compatibility doesn't play a role there)

