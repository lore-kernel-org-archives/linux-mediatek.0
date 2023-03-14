Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 245DFC7618A
	for <linux-mediatek@archiver.kernel.org>; Tue, 14 Mar 2023 12:48:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Type:MIME-Version:References:Message-ID:Subject:To:From:Date:Reply-To
	:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=O+apCs7qP7t/VIB29ccFVCLFKJAUAuodR42k+LynC6I=; b=NKVytAbbidW8wkCerqHuK2GFqQ
	OgYfY9k69ybMJOyKEnKO2cI9pJR9fKKkQevE26tidn89/DeGfD82gvvLoOknsol8xys+RfFzq7szJ
	FIvgjuRLDtEbESXbGbS3LgPMEBtHuFkN/yxfROVzsWdVQxNnAay17Q9vh2yd+1itP93INP+rf1ZLy
	taoto1NWT7CxUea6WrXqWC8s/sxVB9WyHY3c1xBCrJ/zZZAEF0gVS7O094a3sliBoms40RJAinW2G
	j1nNz1UF+nNKM9vccwQJHY7qimXkxqiK9QYf3hS0kiQJneu+WJDsiImgaLj3i5I2PcLw+dWt/G7qU
	HE+ui9kw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pc44i-00ACYB-21;
	Tue, 14 Mar 2023 12:48:20 +0000
Received: from fudo.makrotopia.org ([2a07:2ec0:3002::71])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pc44f-00ACWH-2y;
	Tue, 14 Mar 2023 12:48:19 +0000
Received: from local
	by fudo.makrotopia.org with esmtpsa (TLS1.3:TLS_AES_256_GCM_SHA384:256)
	 (Exim 4.96)
	(envelope-from <daniel@makrotopia.org>)
	id 1pc44R-0002yc-00;
	Tue, 14 Mar 2023 13:48:03 +0100
Date: Tue, 14 Mar 2023 12:47:59 +0000
From: Daniel Golle <daniel@makrotopia.org>
To: Felix Fietkau <nbd@nbd.name>
Subject: Re: [BUG] MTK SoC Ethernet throughput TX only ~620Mbit/s since
 6.2-rc1
Message-ID: <ZBBs/xE0+ULtJNIJ@makrotopia.org>
References: <trinity-92c3826f-c2c8-40af-8339-bc6d0d3ffea4-1678213958520@3c-app-gmx-bs16>
 <4a229d53-f058-115a-afc6-dd544a0dedf2@nbd.name>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <4a229d53-f058-115a-afc6-dd544a0dedf2@nbd.name>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230314_054817_982108_00FD2FF5 
X-CRM114-Status: GOOD (  19.71  )
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
Cc: netdev@vger.kernel.org, Sean Wang <sean.wang@mediatek.com>, Mark Lee <Mark-MC.Lee@mediatek.com>, Eric Dumazet <edumazet@google.com>, linux-mediatek@lists.infradead.org, John Crispin <john@phrozen.org>, Matthias Brugger <matthias.bgg@gmail.com>, Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, Lorenzo Bianconi <lorenzo@kernel.org>, "David S. Miller" <davem@davemloft.net>, linux-arm-kernel@lists.infradead.org, AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

Hi Felix,

On Tue, Mar 14, 2023 at 11:30:53AM +0100, Felix Fietkau wrote:
> On 07.03.23 19:32, Frank Wunderlich wrote:
> > Hi,
> > 
> > i've noticed that beginning on 6.2-rc1 the throughput on my Bananapi-R2 and Bananapi-R3 goes from 940Mbit/s down do 620Mbit/s since 6.2-rc1.
> > Only TX (from SBC PoV) is affected, RX is still 940Mbit/s.
> > 
> > i bisected this to this commit:
> > 
> > f63959c7eec3151c30a2ee0d351827b62e742dcb ("net: ethernet: mtk_eth_soc: implement multi-queue support for per-port queues")
> > 
> > Daniel reported me that this is known so far and they need assistance from MTK and i should report it officially.
> > 
> > As far as i understand it the commit should fix problems with clients using non-GBE speeds (10/100 Mbit/s) on the Gbit-capable dsa
> > interfaces (mt753x connected) behind the mac, but now the Gigabit speed is no more reached.
> > I see no CRC/dropped packets, retransmitts or similar.
> > 
> > after reverting the commit above i get 940Mbit like in rx direction, but this will introduce the problems mentioned above so this not a complete fix.
> I don't have a BPI-R2, but I tested on BPI-R3 and can't reproduce this
> issue. Do you see it on all ports, or only on specific ones?

I also can't reproduce this if unsing any of the gigE ports wired via
MT7531 on the R3. However, I can reproduce the issue if using a 1 GBit/s
SFP module in slot SFP1 of the R3 (connected directly to GMAC2/eth1).

Users have reported this also to be a problem also on MT7622 on devices
directly connecting a PHY (and not using MT7531).

In all cases, reverting the commit above fixes the issue.


Cheers


Daniel

