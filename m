Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 35EE2CD98C5
	for <linux-mediatek@archiver.kernel.org>; Sat, 13 Jun 2026 16:09:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:To:From:Date:Reply-To:Cc:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=1tL+UQzB/EBDH7SXLAbslroKILaTbMAgSXqxd8/aVbE=; b=Ev7koPHmvpaNRAIUcf2sCgpvDs
	HU6EAxCxxaDQG71OW5iNj96JjmM44wZRh2cVYSK6cCu/jdjyNhezXeLWBhjnUzXlMKvHUj5oeiLDi
	vfsFmOcQ5Uqo22X7yb0UNAL+YqOtlj38s64AdSos6ZtDxGVlRWGVu8cEkqmN0OP6FIBrtq3sjJY9w
	+tWKj3Y8Mhe16XK56PeYFx9ULJS1KnL53ymnT0SqvA6c0qhcC06VwAZsFvlcsP2Mj1TU/GmwyBiwW
	WxSzBB5GX5mnYCyDDGxnsip8iHn98kJfVYehOH2fh7ASVq/nHAzjNejBnfuzdOUuJd4h1f1aMOKYF
	HhTGjTeA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wYQvk-0000000CPhK-0GDW;
	Sat, 13 Jun 2026 16:09:56 +0000
Received: from pidgin.makrotopia.org ([2a07:2ec0:3002::65])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wYQvg-0000000CPgl-3fvf;
	Sat, 13 Jun 2026 16:09:54 +0000
Received: from local
	by pidgin.makrotopia.org with esmtpsa (TLS1.3:TLS_AES_256_GCM_SHA384:256)
	 (Exim 4.99)
	(envelope-from <daniel@makrotopia.org>)
	id 1wYQvO-000000001t5-42FX;
	Sat, 13 Jun 2026 16:09:35 +0000
Date: Sat, 13 Jun 2026 17:09:31 +0100
From: Daniel Golle <daniel@makrotopia.org>
To: "Chester A. Unal" <chester.a.unal@arinc9.com>,
	Andrew Lunn <andrew@lunn.ch>, Vladimir Oltean <olteanv@gmail.com>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Russell King <linux@armlinux.org.uk>, netdev@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org
Subject: Re: [PATCH net-next v2 8/8] net: dsa: mt7530: implement
 port_change_conduit op
Message-ID: <ai2Au6DuxYcE-bH9@makrotopia.org>
References: <cover.1781312667.git.daniel@makrotopia.org>
 <8dd8cfe32bc8e38b92c49e30a6255090fb0998fb.1781312667.git.daniel@makrotopia.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <8dd8cfe32bc8e38b92c49e30a6255090fb0998fb.1781312667.git.daniel@makrotopia.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260613_090952_916779_F8C59D8D 
X-CRM114-Status: GOOD (  17.40  )
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

On Sat, Jun 13, 2026 at 02:11:45AM +0100, Daniel Golle wrote:
> Allow changing the CPU port affinity of user ports at runtime via the
> IFLA_DSA_CONDUIT netlink attribute. This updates the port matrix to
> forward to the new CPU port instead of the old one.
> 
> Limit the operation to MT7531. There, trapped link-local frames follow
> the per-port affinity, as the MT7531_CPU_PMAP destination mask is
> further restricted by the port matrix. A conduit change is hence fully
> honoured by the hardware, for regular traffic as well as for trapped
> frames.
> 
> The MT7530 switch, including the variant embedded in the MT7621 SoC,
> instead traps frames to the single CPU port set in the CPU_PORT field
> of the MFC register, regardless of the affinity of the inbound user
> port. With user ports affine to different CPU ports there is no
> correct value for that field, so per-port CPU affinity cannot be fully
> implemented for trapped frames. Routing a WAN port via the second SoC
> GMAC is conventionally covered by the PHY muxing feature on these
> switches, which bypasses the switch fabric and does not involve a CPU
> port at all.
> 
> The switches on the MT7988, EN7581 and AN7583 SoCs only have a
> single CPU port, leaving no other conduit to change to.
> 
> Signed-off-by: Daniel Golle <daniel@makrotopia.org>

I forgot to include the previously received

Acked-by: Chester A. Unal <chester.a.unal@arinc9.com>

See also:

https://patchwork.kernel.org/comment/27003848/

https://lore.kernel.org/all/02ad5de0-ea6a-4267-8686-72e3f98fce4e@arinc9.com/

