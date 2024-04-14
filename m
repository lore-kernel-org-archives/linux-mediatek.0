Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DBD93C4345F
	for <linux-mediatek@archiver.kernel.org>; Sun, 14 Apr 2024 03:41:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=2VlaakD6hC/Yq07AzsgcVk7dQUyYpGcWfseDM5cfpeg=; b=zaloXjAonl+hRO6HRyerQ3p8ZM
	1W8Wceas4Yu5/UyjD4UEVmLYn8AXqQOPuw6JBRLFk1nF1EV13DcI+DzUmnlcagn2JEmZvRqP34E9A
	a4OLzQki/CIBFi8nsw7DUZWdLDMtIRnn1LD5B+NaXNFODwB+etL3Idh/BxwDJ+6Lv/UsdE4j81MF9
	7O9lSaAXpznS47lLuLYqsE5ff2zOEq9aRxKWNbp5YKOwacRtkUEk1yAH1j1KMlrw9pSizvBNEaM4S
	+vuylF+f1d1rXjooYHbF0g+a3SmkLXP/PKtdVBK1yM+LNwuj0z199Z9F+J3hY+1rhdM21ru3Wd5No
	SHtT/1iA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rvqkM-00000004VS8-12tL;
	Sun, 14 Apr 2024 03:41:38 +0000
Received: from pidgin.makrotopia.org ([185.142.180.65])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rvqkI-00000004VRM-1lOf;
	Sun, 14 Apr 2024 03:41:35 +0000
Received: from local
	by pidgin.makrotopia.org with esmtpsa (TLS1.3:TLS_AES_256_GCM_SHA384:256)
	 (Exim 4.96.2)
	(envelope-from <daniel@makrotopia.org>)
	id 1rvqk3-0001Ep-2T;
	Sun, 14 Apr 2024 03:41:19 +0000
Date: Sun, 14 Apr 2024 04:41:16 +0100
From: Daniel Golle <daniel@makrotopia.org>
To: arinc.unal@arinc9.com
Cc: DENG Qingfang <dqfext@gmail.com>, Sean Wang <sean.wang@mediatek.com>,
	Andrew Lunn <andrew@lunn.ch>,
	Florian Fainelli <f.fainelli@gmail.com>,
	Vladimir Oltean <olteanv@gmail.com>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Holger Stadali <hs@giax.de>,
	Bartel Eerdekens <bartel.eerdekens@constell8.be>,
	mithat.guner@xeront.com, erkin.bozoglu@xeront.com,
	netdev@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org
Subject: Re: [PATCH net 2/2] net: dsa: mt7530: fix port mirroring for MT7988
 SoC switch
Message-ID: <ZhtQXFsqS_y6_LHC@makrotopia.org>
References: <20240413-b4-for-net-mt7530-fix-mirroring-to-local-port-and-mt7988-v1-0-476deff8cc06@arinc9.com>
 <20240413-b4-for-net-mt7530-fix-mirroring-to-local-port-and-mt7988-v1-2-476deff8cc06@arinc9.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20240413-b4-for-net-mt7530-fix-mirroring-to-local-port-and-mt7988-v1-2-476deff8cc06@arinc9.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240413_204134_485968_770D6367 
X-CRM114-Status: GOOD (  15.90  )
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

On Sat, Apr 13, 2024 at 04:01:40PM +0300, Arınç ÜNAL via B4 Relay wrote:
> From: Arınç ÜNAL <arinc.unal@arinc9.com>
> 
> The "MT7988A Wi-Fi 7 Generation Router Platform: Datasheet (Open Version)
> v0.1" document shows bits 16 to 18 as the MIRROR_PORT field of the CPU
> forward control register. Currently, the MT7530 DSA subdriver configures
> bits 0 to 2 of the CPU forward control register which breaks the port
> mirroring feature for the MT7988 SoC switch.
> 
> Fix this by using the MT7531_MIRROR_PORT_GET() and MT7531_MIRROR_PORT_SET()
> macros which utilise the correct bits.
> 
> Fixes: 110c18bfed41 ("net: dsa: mt7530: introduce driver for MT7988 built-in switch")
> Signed-off-by: Arınç ÜNAL <arinc.unal@arinc9.com>

Acked-by: Daniel Golle <daniel@makrotopia.org>

> ---
>  drivers/net/dsa/mt7530.c | 10 ++++++----
>  1 file changed, 6 insertions(+), 4 deletions(-)
> 
> diff --git a/drivers/net/dsa/mt7530.c b/drivers/net/dsa/mt7530.c
> index b84e1845fa02..8090390edaf9 100644
> --- a/drivers/net/dsa/mt7530.c
> +++ b/drivers/net/dsa/mt7530.c
> @@ -1883,14 +1883,16 @@ mt7530_port_vlan_del(struct dsa_switch *ds, int port,
>  
>  static int mt753x_mirror_port_get(unsigned int id, u32 val)
>  {
> -	return (id == ID_MT7531) ? MT7531_MIRROR_PORT_GET(val) :
> -				   MIRROR_PORT(val);
> +	return (id == ID_MT7531 || id == ID_MT7988) ?
> +		       MT7531_MIRROR_PORT_GET(val) :
> +		       MIRROR_PORT(val);
>  }
>  
>  static int mt753x_mirror_port_set(unsigned int id, u32 val)
>  {
> -	return (id == ID_MT7531) ? MT7531_MIRROR_PORT_SET(val) :
> -				   MIRROR_PORT(val);
> +	return (id == ID_MT7531 || id == ID_MT7988) ?
> +		       MT7531_MIRROR_PORT_SET(val) :
> +		       MIRROR_PORT(val);
>  }
>  
>  static int mt753x_port_mirror_add(struct dsa_switch *ds, int port,
> 
> -- 
> 2.40.1
> 
> 

