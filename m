Return-Path: <SRS0=F6Lp=2A=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.3 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_SANE_1 autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CD5E1C2D0BF
	for <linux-mediatek@archiver.kernel.org>; Tue, 10 Dec 2019 16:36:15 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 9DAA02073B
	for <linux-mediatek@archiver.kernel.org>; Tue, 10 Dec 2019 16:36:15 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="l5Z7ZzxU";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=lunn.ch header.i=@lunn.ch header.b="SFM7xI1R"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 9DAA02073B
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=lunn.ch
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Ph7nzYtffoZXIwS4XbDtTfbUg+SeWcOQGpgePu5k480=; b=l5Z7ZzxUxfWI6u
	FasTxl1hJ0TRv+w1KSfNyAybF+I00dHXjtGlkhrj3hq5CD56Jh5e+Pobj/E/VptGICqzSbAwKgWHk
	aoeflmIeNEtUPbLRaGfVIA4tr9zMf0sJ8smAMP//dbUr8fYMaF1L/KzJhXEyowQMbWhJ+MoLBVOPq
	3c51J6r+Cfd1ZJ6+OW63D+kkDyTpf7/41j0X0sSK5qVstIp2qA6PE5VQmUN+b9ctA3CA/aOe6gWmm
	4r3FbLBKQl1el241pp5ywIQ2S2nBpL4sIknWjRLCNnaWe560bw9zemkSxKm5cjqzM4XC7UAcNn0On
	+PwpycmPIMKRybZRDduw==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1ieiUZ-0001j6-LT; Tue, 10 Dec 2019 16:36:07 +0000
Received: from vps0.lunn.ch ([185.16.172.187])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1ieiUX-0001iN-4G
 for linux-mediatek@lists.infradead.org; Tue, 10 Dec 2019 16:36:06 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
 s=20171124; h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:
 Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=DzFAbvMnFDJrtj129D8qEMUGAMQFKhsLP+2fDTyYMQo=; b=SFM7xI1RQ7aCYT8cx44YVcesCV
 jfhQuKv3tUystlLupj4IQV7r3NzRxTvRu7e9w6YMa2iS5WYkDGuM5VbNZNQJ/bnr/WGcGQ32hJj63
 kQbNnqScPTiGh1evXqlQYe6fYO3PHLTlaegwGSF5iwZh+dQBH/qWThDtodmY/oSNWaN8=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.92.2)
 (envelope-from <andrew@lunn.ch>)
 id 1ieiUP-0005Jr-IM; Tue, 10 Dec 2019 17:35:57 +0100
Date: Tue, 10 Dec 2019 17:35:57 +0100
From: Andrew Lunn <andrew@lunn.ch>
To: Landen Chao <landen.chao@mediatek.com>
Subject: Re: [PATCH net-next 4/6] net: dsa: mt7530: Add the support of MT7531
 switch
Message-ID: <20191210163557.GC27714@lunn.ch>
References: <cover.1575914275.git.landen.chao@mediatek.com>
 <6d608dd024edc90b09ba4fe35417b693847f973c.1575914275.git.landen.chao@mediatek.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <6d608dd024edc90b09ba4fe35417b693847f973c.1575914275.git.landen.chao@mediatek.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20191210_083605_165772_66B914ED 
X-CRM114-Status: UNSURE (   6.11  )
X-CRM114-Notice: Please train this message.
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
Cc: mark.rutland@arm.com, devicetree@vger.kernel.org, frank-w@public-files.de,
 f.fainelli@gmail.com, vivien.didelot@savoirfairelinux.com,
 netdev@vger.kernel.org, sean.wang@mediatek.com, linux-kernel@vger.kernel.org,
 opensource@vdorst.com, robh+dt@kernel.org, linux-mediatek@lists.infradead.org,
 matthias.bgg@gmail.com, davem@davemloft.net
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On Tue, Dec 10, 2019 at 04:14:40PM +0800, Landen Chao wrote:
> Add new support for MT7531:
> 
> MT7531 is the next generation of MT7530. It is also a 7-ports switch with
> 5 giga embedded phys, 2 cpu ports, and the same MAC logic of MT7530. Cpu
> port 6 only supports HSGMII interface. Cpu port 5 supports either RGMII
> or HSGMII in different HW sku.

Hi Landen

Looking at the code, you seem to treat HSGMII as 2500Base-X. Is this
correct? Or is it SGMII over clocked to 2.5Gbps?

	 Andrew

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
