Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A2F32FF8855
	for <linux-mediatek@archiver.kernel.org>; Tue,  5 May 2026 16:03:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=6hpDxpUfc5XAie7Di0S8Tb4d+7wqZtFI2aWrbn/wVb4=; b=BBH5ML5zYOI2g64clS+8GrjbnU
	OlUtDlXF+qsHfda+Ogdt5fwoHjX2cCeA2GdkDTne6uznzTTU6BIbuOfTcSwfIHOGuZaFVaznnCzps
	BqGMOCIw61Hr+PU5Nl2nNuEVvm3bH6xNyxm7I+bxos0mQziEmudPFt2wMK3nEkD73Ld0pUx89/p6s
	7W4VGYhbmN/3VeGr9sgHDMQz7XjeurX00pELdz+8LslrOdsIDxAuH42R/USLv5aXUhZUFryL2IX++
	v+WVplqKNppLscs4iMKVtg/zLSdiVp7BE1DJ2gYQXTmQO6QTKL8wzmvBCZjITjS4BihMlYt9ZnDpQ
	om5AaKhA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wKIF4-0000000GloQ-1NYs;
	Tue, 05 May 2026 16:03:26 +0000
Received: from pidgin.makrotopia.org ([2a07:2ec0:3002::65])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wKIF1-0000000GlnC-0pXq;
	Tue, 05 May 2026 16:03:24 +0000
Received: from local
	by pidgin.makrotopia.org with esmtpsa (TLS1.3:TLS_AES_256_GCM_SHA384:256)
	 (Exim 4.99)
	(envelope-from <daniel@makrotopia.org>)
	id 1wKIEm-000000000lR-04fy;
	Tue, 05 May 2026 16:03:08 +0000
Date: Tue, 5 May 2026 17:03:03 +0100
From: Daniel Golle <daniel@makrotopia.org>
To: "Chester A. Unal" <chester.a.unal@arinc9.com>
Cc: Andrew Lunn <andrew@lunn.ch>, Vladimir Oltean <olteanv@gmail.com>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	DENG Qingfang <dqfext@gmail.com>,
	Florian Fainelli <f.fainelli@gmail.com>,
	=?utf-8?B?QXLEsW7DpyDDnE5BTA==?= <arinc.unal@arinc9.com>,
	Sean Wang <sean.wang@mediatek.com>, netdev@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org
Subject: Re: [PATCH net 2/5] net: dsa: mt7530: preserve VLAN tags on trapped
 link-local frames
Message-ID: <afoUt46gGwAC33ZU@makrotopia.org>
References: <cover.1777986341.git.daniel@makrotopia.org>
 <3ad4b724d7ae6250b8429d50fe913d2dca07a3f9.1777986341.git.daniel@makrotopia.org>
 <46071c08-d85f-4157-9d61-6a0feef56747@arinc9.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <46071c08-d85f-4157-9d61-6a0feef56747@arinc9.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260505_090323_236901_61354479 
X-CRM114-Status: GOOD (  19.93  )
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

On Tue, May 05, 2026 at 03:37:29PM +0000, Chester A. Unal wrote:
> Hey Daniel.
> 
> On 05/05/2026 15:16, Daniel Golle wrote:
> > The BPC, RGAC1 and RGAC2 registers control the handling of link-local
> > frames with reserved MAC DAs (01:80:C2:00:00:0x). These frames are
> > correctly trapped to the CPU port, but the egress VLAN tag attribute was
> > set to MT7530_VLAN_EG_UNTAGGED which causes the switch to strip any
> > VLAN tags from trapped frames before they reach the CPU.
> > 
> > This causes VLAN-tagged link-local frames (STP BPDUs, LLDP, PTP Peer
> > Delay Requests) to arrive at the CPU without their VLAN tag, so they
> > are delivered to the base network interface instead of the VLAN
> > sub-interface. The DSA local_termination selftest confirms this: all
> > link-local protocol tests on VLAN upper interfaces fail.
> > 
> > Set the EG_TAG attribute to MT7530_VLAN_EG_DISABLED (system default)
> > so that the switch does not modify VLAN tags in trapped frames. This
> > way VLAN-tagged frames retain their original tag and are delivered to
> > the correct VLAN sub-interface, matching the behavior of non-trapped
> > frames which pass through without VLAN tag modification.
> > 
> > Fixes: 69ddba9d170b ("net: dsa: mt7530: fix handling of all link-local frames")
> > Signed-off-by: Daniel Golle <daniel@makrotopia.org>
> 
> Thank you for this patch. Could you please confirm that it conforms to the
> findings documented on this patch log?
> 
> https://git.kernel.org/pub/scm/linux/kernel/git/netdev/net-next.git/commit/?id=e8bf353577f382c7066c661fed41b2adc0fc7c40

Yes. Combining VLAN CTAG and DSA tag into single "mess" tag is what the
MT7530 hardware does, and also what tag_mtk.c expects, and mtk_eth_soc
"special tag" feature handles well.

I've found, addressed and verified all the issues in the series using
the DSA selftests in tools/testing/selftest/drivers/net/dsa, ie. running
bridge_vlan_aware.sh, bridge_vlan_unaware.sh and local_termination.sh
in a loop, and random order, on BPi-R3 (MT7531) and BPi-R4 (MT7988).

With the series applied many of the previously failing tests are now
passing.

