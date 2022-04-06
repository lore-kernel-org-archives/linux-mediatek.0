Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9AB81C433EF
	for <linux-mediatek@archiver.kernel.org>; Wed,  6 Apr 2022 20:35:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=StFDVny8c31dR9rAOI1hp/MEX/Q30f2gFRYORpNpU0Y=; b=mNYNqGlTB8fp73
	mVsOwEGX6A8lDGtLu+xqsLe15quIr73t38z3xE1upmvO5lTa5hkOZvJOj2jmeIw+VOx21KrSfDEZ7
	FFlJpDOdX26IOuF3jNdouT5WU4yFaur3yIsQurI+Fk87Xl34AP2GAbav/iLcYSRhB9oVzPooLoXUY
	S85cgjbc6iEcq6yPtsPqF16GH/l63b4uB4ygnUPo3tmoMuzvTipyvVPQ1CUOmqpCucHADFpI7AG7d
	JEdcq7cQNkR1Zl8/1OUtXRYnkYHnDImhxArQ3A/4P4NVE6OAcn3SZvPT0mGa1+zJY7hYQfrTFqdJc
	an9lP2HUbNyoU0wLXCNA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ncCMo-007t2E-Tp; Wed, 06 Apr 2022 20:35:02 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1ncCMe-007szf-93; Wed, 06 Apr 2022 20:34:53 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 08C5E615A5;
 Wed,  6 Apr 2022 20:34:51 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1A03BC385A5;
 Wed,  6 Apr 2022 20:34:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1649277290;
 bh=KvFaj+XnKuYJmC5lFPjyLsdC9bEQxWUMv0+3r1bZOsI=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=TRM/dqbJu/wJwghwh+qRHKeSyYyFM1dzwQ6a4jR/cwA8gsaXWKoTGOI9S7PMllwdC
 U65Lor6VL7mnlhR6a2ngLzN1XyCJz1Us6f6Hit+umO/caouoUR7H+P1yagW9TM90jU
 9IqprWLTDNc219GON6WuUGaiUWwVr6Th1UmFkFDHtVy71WscclNnohvqvJmlw5btOR
 RRnr5f/doT3p23YWbIG5RSCK+TSuvw4DTbkZ5EIZLmU4Y0S2VgmKvKMKqnKrYq1Eyx
 goUMVUpRgTpc7ed2KtfpcAXAVZpOesBapXv0qxy6oTiLBEUAjqiQhznmOkU+fF7vX1
 aHrWFKyZqNcug==
Date: Wed, 6 Apr 2022 22:34:43 +0200
From: Marek =?UTF-8?B?QmVow7pu?= <kabel@kernel.org>
To: Jakub Kicinski <kuba@kernel.org>
Cc: "Russell King (Oracle)" <rmk+kernel@armlinux.org.uk>, Landen Chao
 <Landen.Chao@mediatek.com>, DENG Qingfang <dqfext@gmail.com>, Sean Wang
 <sean.wang@mediatek.com>, Andrew Lunn <andrew@lunn.ch>, Vivien Didelot
 <vivien.didelot@gmail.com>, Florian Fainelli <f.fainelli@gmail.com>,
 Vladimir Oltean <olteanv@gmail.com>, "David S. Miller"
 <davem@davemloft.net>, Paolo Abeni <pabeni@redhat.com>, Matthias Brugger
 <matthias.bgg@gmail.com>, netdev@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org
Subject: Re: [PATCH net-next 5/9] net: dsa: mt7530: only indicate linkmodes
 that can be supported
Message-ID: <20220406223443.193b0ce1@thinkpad>
In-Reply-To: <20220406115250.047570c1@kernel.org>
References: <Yk1iHCy4fqvxsvu0@shell.armlinux.org.uk>
 <E1nc3Dd-004hq7-Co@rmk-PC.armlinux.org.uk>
 <20220406115250.047570c1@kernel.org>
X-Mailer: Claws Mail 3.18.0 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220406_133452_404427_BD83C06E 
X-CRM114-Status: GOOD (  11.10  )
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

On Wed, 6 Apr 2022 11:52:50 -0700
Jakub Kicinski <kuba@kernel.org> wrote:

> On Wed, 06 Apr 2022 11:48:57 +0100 Russell King (Oracle) wrote:
> > -	if (state->interface != PHY_INTERFACE_MODE_MII) {
> > +	if (state->interface != PHY_INTERFACE_MODE_MII &&
> > +	    state->interface != PHY_INTERFACE_MODE_2500BASEX)
> >  		phylink_set(mask, 1000baseT_Full);
> >  		phylink_set(mask, 1000baseX_Full);
> >  	}  
> 
> Missing { here. Dunno if kbuild bot told you already.

Probably not, because next patch removes this code entirely :)

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
