Return-Path: <SRS0=t3QX=MI=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-14.4 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CA618C12002
	for <linux-mediatek@archiver.kernel.org>; Fri, 16 Jul 2021 15:33:09 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 85688613F6
	for <linux-mediatek@archiver.kernel.org>; Fri, 16 Jul 2021 15:33:09 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 85688613F6
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=lunn.ch
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=YEHPzpQhfCj1dpD/KvJ6AxPoycae0IdiPVJW8Eym6iE=; b=QXxYPiqRmiNR0A
	JMtsvX3VD+rbPtbXDjS3Lh4W3cr8uDiw+o1elrgeqRCR904lJlSdJFm2/9mFWkFEyIaD9Jk5KMIRi
	FZrp+6FKhd05wj8vYO+uItWCYVYSBWnDaXSTE+vPtzlkZgUqHDdw29ZiuvL+jEHcq48SdjCAd7fJv
	suOABwLstyd7V5k1/eJsYJ/wFHnCANGkAFYDLhzWGZWMRUZRHS3gfsUSUZyLR/9KqHN9CE5XElF9h
	cWTly2KAtaZ4tPTJ+XZ+Rp13ZQEdI8xk5xE9LdDqnrr+iRAJOzhgmBYS5ePNfXw59GYZ6lWLbYv86
	a1GemxD06WO40ROkvg6Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1m4Ppi-004j0l-8d; Fri, 16 Jul 2021 15:32:58 +0000
Received: from vps0.lunn.ch ([185.16.172.187])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1m4PpV-004iwp-7K; Fri, 16 Jul 2021 15:32:46 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
 s=20171124; h=In-Reply-To:Content-Disposition:Content-Type:MIME-Version:
 References:Message-ID:Subject:Cc:To:From:Date:From:Sender:Reply-To:Subject:
 Date:Message-ID:To:Cc:MIME-Version:Content-Type:Content-Transfer-Encoding:
 Content-ID:Content-Description:Content-Disposition:In-Reply-To:References;
 bh=CGZsktWNeZSP9brVnhmnumOVvSpPdBAXCv4lSMGQFv4=; b=KDq8NTcR/64IPQfgHMHGx8OrHD
 PNyK6GiKo91ZMVNnntywFZG0QY/Lodr5w7nLMsFGrpQAnUZiyupr5iPpE183n16ThEiW298hbqzcC
 AJjNi30BG7gEfdXUxvVZfmc1aa8+DJB033ckQYU3xAI2dz05S/s0FNuoiDZXpVAVuVXI=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.94.2)
 (envelope-from <andrew@lunn.ch>)
 id 1m4PpF-00DdAs-N5; Fri, 16 Jul 2021 17:32:29 +0200
Date: Fri, 16 Jul 2021 17:32:29 +0200
From: Andrew Lunn <andrew@lunn.ch>
To: ericwouds@gmail.com
Cc: Sean Wang <sean.wang@mediatek.com>, Landen Chao <Landen.Chao@mediatek.com>,
 Vivien Didelot <vivien.didelot@gmail.com>,
 Florian Fainelli <f.fainelli@gmail.com>,
 Vladimir Oltean <olteanv@gmail.com>,
 "David S. Miller" <davem@davemloft.net>, Jakub Kicinski <kuba@kernel.org>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 Eric Woudstra <37153012+ericwoud@users.noreply.github.com>,
 netdev@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] mt7530 fix mt7530_fdb_write vid missing ivl bit
Message-ID: <YPGmjd1ODFQ+ZIE2@lunn.ch>
References: <20210716152213.4213-1-ericwouds@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20210716152213.4213-1-ericwouds@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210716_083245_312118_F05246DA 
X-CRM114-Status: GOOD (  16.84  )
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On Fri, Jul 16, 2021 at 05:22:11PM +0200, ericwouds@gmail.com wrote:
> From: Eric Woudstra <37153012+ericwoud@users.noreply.github.com>
> 
> According to reference guides mt7530 (mt7620) and mt7531:
> 
> NOTE: When IVL is reset, MAC[47:0] and FID[2:0] will be used to 
> read/write the address table. When IVL is set, MAC[47:0] and CVID[11:0] 
> will be used to read/write the address table.
> 
> Since the function only fills in CVID and no FID, we need to set the
> IVL bit. The existing code does not set it.
> 
> This is a fix for the issue I dropped here earlier:
> 
> http://lists.infradead.org/pipermail/linux-mediatek/2021-June/025697.html
> 
> With this patch, it is now possible to delete the 'self' fdb entry
> manually. However, wifi roaming still has the same issue, the entry
> does not get deleted automatically. Wifi roaming also needs a fix
> somewhere else to function correctly in combination with vlan.
> 
> Signed-off-by: Eric Woudstra <37153012+ericwoud@users.noreply.github.com>

Hi Eric

We need a real email address in the Signed-off-by, and the noreply bit
makes me think this will not work.

      Andrew

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
