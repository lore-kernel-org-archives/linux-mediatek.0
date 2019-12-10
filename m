Return-Path: <SRS0=F6Lp=2A=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.3 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_SANE_1 autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9E41BC43603
	for <linux-mediatek@archiver.kernel.org>; Tue, 10 Dec 2019 22:02:57 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 6C2AD20637
	for <linux-mediatek@archiver.kernel.org>; Tue, 10 Dec 2019 22:02:57 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="ATLwRUjy";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=lunn.ch header.i=@lunn.ch header.b="xZWRhz+C"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 6C2AD20637
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=lunn.ch
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=m4DKd3/HszSIqsTYgyi83cPMFs3/0l5LiuagdTf13+4=; b=ATLwRUjyg8cRY+
	oo+hKtqirgyHSKFKTJB6S4wmlrVK0AHYAjgQJ8yQbItFcEvc/8YWTEjUFlbQKoaJ7tRm4DFZ7LwJz
	AM1/KbLOJ4UdUo2MM87m7LkK7DUj6iA62ktFbf2J7OqS0M9ah8VSm2c94yAYnHg+/dyr0tVEYTUrL
	zTYKVs3XQU2iUv9eflOMbO0BVBvU+M4B6lHpdwlAO2SUbkikLIoARg7ZEqFRI5NbObi3ZueBWLzYI
	6KTwvyMRmc6VFXwxc/HBvQhoXzNq93KxY5aYDyCiE8J2MgaYjQmwBtttDSBx29DfP06kHXPmjf9wM
	tCSP5Wvbf5BwDpKBiMRw==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1ienai-0008P4-1m; Tue, 10 Dec 2019 22:02:48 +0000
Received: from vps0.lunn.ch ([185.16.172.187])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1ienaf-0008Ny-Ek
 for linux-mediatek@lists.infradead.org; Tue, 10 Dec 2019 22:02:46 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
 s=20171124; h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:
 Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=oNrhFWA1lMqgOP0XHTa3xdZ+GV9N7jCyBqMVj23yRHs=; b=xZWRhz+CFM5NfZoAhdE/Gf5Ate
 jwkCAm8gpKDWE3b5P9ajfLkTLdVB6mq5zla3yoyBXTl7B6q88/vbXgqargSm/6APZB/TKAoXevZv4
 oTGN3doiai+QIEhx1FqEk3Fa7u7QZwAndwta5kY3sotOnTY49pV6t4NxXfpKEYe8xkuI=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.92.2)
 (envelope-from <andrew@lunn.ch>)
 id 1ienaR-0007qA-JO; Tue, 10 Dec 2019 23:02:31 +0100
Date: Tue, 10 Dec 2019 23:02:31 +0100
From: Andrew Lunn <andrew@lunn.ch>
To: Marek Behun <marek.behun@nic.cz>
Subject: Re: [PATCH net-next 4/6] net: dsa: mt7530: Add the support of MT7531
 switch
Message-ID: <20191210220231.GA30053@lunn.ch>
References: <cover.1575914275.git.landen.chao@mediatek.com>
 <6d608dd024edc90b09ba4fe35417b693847f973c.1575914275.git.landen.chao@mediatek.com>
 <20191210163557.GC27714@lunn.ch> <20191210213351.2df6acbf@nic.cz>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20191210213351.2df6acbf@nic.cz>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20191210_140245_496571_2018A794 
X-CRM114-Status: GOOD (  10.55  )
X-BeenThere: linux-mediatek@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <linux-mediatek.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mediatek>, 
 <mailto:linux-mediatek-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mediatek/>
List-Post: <mailto:linux-mediatek@lists.infradead.org>
List-Help: <mailto:linux-mediatek-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mediatek>, 
 <mailto:linux-mediatek-request@lists.infradead.org?subject=subscribe>
Cc: mark.rutland@arm.com, devicetree@vger.kernel.org,
 Landen Chao <landen.chao@mediatek.com>, f.fainelli@gmail.com,
 vivien.didelot@savoirfairelinux.com, netdev@vger.kernel.org,
 sean.wang@mediatek.com, linux-kernel@vger.kernel.org, frank-w@public-files.de,
 opensource@vdorst.com, robh+dt@kernel.org, linux-mediatek@lists.infradead.org,
 matthias.bgg@gmail.com, davem@davemloft.net
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On Tue, Dec 10, 2019 at 09:33:51PM +0100, Marek Behun wrote:
> On Tue, 10 Dec 2019 17:35:57 +0100
> Andrew Lunn <andrew@lunn.ch> wrote:
> 
> > On Tue, Dec 10, 2019 at 04:14:40PM +0800, Landen Chao wrote:
> > > Add new support for MT7531:
> > > 
> > > MT7531 is the next generation of MT7530. It is also a 7-ports switch with
> > > 5 giga embedded phys, 2 cpu ports, and the same MAC logic of MT7530. Cpu
> > > port 6 only supports HSGMII interface. Cpu port 5 supports either RGMII
> > > or HSGMII in different HW sku.  
> > 
> > Hi Landen
> > 
> > Looking at the code, you seem to treat HSGMII as 2500Base-X. Is this
> > correct? Or is it SGMII over clocked to 2.5Gbps?
> > 
> > 	 Andrew
> 
> How would that work? Would 10 and 100 be overclocked to 25 and 250?

No. SGMII clocked up to 2.5G does not support any of the lower
speeds. And inband signalling does not make much sense, the control
word is all wrong.

     Andrew

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
