Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 41EECC3DA79
	for <linux-mediatek@archiver.kernel.org>; Mon, 15 Jan 2024 22:10:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=bYsqXLIJBdBHokEmUabMB2nxu52sqIxhbhgu7UC/2n0=; b=UdBy+cUSBc5L6FzRTapklaFZTz
	wOzDrDLEb7ZV0TK8cGdKYGppxeadiVkmVUe0I86fkXTRO0pUmwbTKwjMQDGkd5QUGiDG0EzdgE1Th
	Pu4Jf0Y3hat6syI/q1ZxNPfsaF26FbkL1eRM8EVh7KmfwqJExY2zMdx3QxYzAizeaXWV5cXcYLXDD
	H+/kX0CygAmIU6f/eUE/7DRH3l705irk+5NvdD+rTBdaAn8QleenYy02FJEfl00y0y66lsyBs7C/g
	2+6RNagniprOLTuwVPrnMJOlmo7wfFTbvlCASMXNTdtDTE2fRth04cAOBt+K8qKLI2dgn59Ocy89Y
	PUQZBULw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rPV9r-00AH3L-00;
	Mon, 15 Jan 2024 22:10:15 +0000
Received: from pidgin.makrotopia.org ([185.142.180.65])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rPV9n-00AH2j-1p;
	Mon, 15 Jan 2024 22:10:13 +0000
Received: from local
	by pidgin.makrotopia.org with esmtpsa (TLS1.3:TLS_AES_256_GCM_SHA384:256)
	 (Exim 4.96.2)
	(envelope-from <daniel@makrotopia.org>)
	id 1rPV9M-0001ug-11;
	Mon, 15 Jan 2024 22:09:45 +0000
Date: Mon, 15 Jan 2024 22:09:36 +0000
From: Daniel Golle <daniel@makrotopia.org>
To: Vladimir Oltean <olteanv@gmail.com>
Cc: =?utf-8?B?QXLEsW7DpyDDnE5BTA==?= <arinc.unal@arinc9.com>,
	Landen Chao <Landen.Chao@mediatek.com>,
	DENG Qingfang <dqfext@gmail.com>,
	Sean Wang <sean.wang@mediatek.com>, Andrew Lunn <andrew@lunn.ch>,
	Florian Fainelli <f.fainelli@gmail.com>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	mithat.guner@xeront.com, erkin.bozoglu@xeront.com,
	Luiz Angelo Daros de Luca <luizluca@gmail.com>,
	netdev@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org
Subject: Re: [RFC PATCH net-next 7/8] net: dsa: mt7530: correct port
 capabilities of MT7988
Message-ID: <ZaWtIMC9zqwjVewO@makrotopia.org>
References: <20240113102529.80371-1-arinc.unal@arinc9.com>
 <20240113102529.80371-8-arinc.unal@arinc9.com>
 <20240115214238.bnlvomatududng6l@skbuf>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20240115214238.bnlvomatududng6l@skbuf>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240115_141011_627569_07EACF27 
X-CRM114-Status: GOOD (  14.08  )
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

On Mon, Jan 15, 2024 at 11:42:38PM +0200, Vladimir Oltean wrote:
> On Sat, Jan 13, 2024 at 01:25:28PM +0300, Arınç ÜNAL wrote:
> > On the switch on the MT7988 SoC, there are only 4 PHYs. That's port 0 to 3.
> > Set the internal phy cases to '0 ... 3'.
> > 
> > Signed-off-by: Arınç ÜNAL <arinc.unal@arinc9.com>
> > Acked-by: Daniel Golle <daniel@makrotopia.org>
> > ---
> 
> For this patch to be obviously correct, please make a statement in the
> commit message about port 4. It doesn't exist at all?

Correct. As shown in Block Diagram 8.1.1.3 on page 125 of
MT7988A Wi-Fi 7 Generation Router Platform: Datasheet (Open Version)
Version: 0.1
Release Date: 2023-10-18
which is available publicly on BananaPi's Wiki[1].

Port 0~3 are TP user ports, Port 6 is internally linked to XGMII of MAC 0.
Port 4 and 5 are not used at all in this design.

[1]: https://wiki.banana-pi.org/Banana_Pi_BPI-R4#Documents

