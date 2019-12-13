Return-Path: <SRS0=P2Dl=2D=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.2 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EC40FC43603
	for <linux-mediatek@archiver.kernel.org>; Fri, 13 Dec 2019 22:24:02 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id C3B4E2077B
	for <linux-mediatek@archiver.kernel.org>; Fri, 13 Dec 2019 22:24:02 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="RHEtSf6M";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=lunn.ch header.i=@lunn.ch header.b="B022IG0f"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org C3B4E2077B
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=lunn.ch
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Jx/pTBTXB2Fig1EBm652LKNf+1b51AFx2phCdrKY6qw=; b=RHEtSf6MFsduRd
	SAPI02O5sN1SiHJbK7A+Imku281dGc7KTebSKTdUSmvt6zcPMpYBKyZo+UasL8YXXN4bKVl2Hs0g6
	fct/0WgNmwlHN82b6vj0OeS5grealyxoTPFsciIGwptGbEhy8qw8orJLkKLnPjP7wIXBAwUo4M3gs
	GuCXvEDqAyYH+1vFsy+m53duUZDFjAJLjPYxBj7EDr3QpDmXSKmM1BlpMzNq9VG2iR1Axpdp3gOUr
	obr1dBz+HZ3espDuFJa/ZGAgcODG0Ui+hAaOAWD43AFArHMVCZVdxqWZwbAKLOTLkX6cYzSLnq0Ub
	duyqi7TWDeErvIAu/hAA==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1iflIH-0006KV-Jv; Fri, 13 Dec 2019 13:47:45 +0000
Received: from vps0.lunn.ch ([185.16.172.187])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1iflI6-0006Br-P6; Fri, 13 Dec 2019 13:47:35 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
 s=20171124; h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:
 Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=awCXz0GwD1LDcWzOjDMp0h+d0sdlS80mO4Nbpi4KuV0=; b=B022IG0f4HXZeMBlMNrforMruq
 dFK7znmRa1CpiTRnP5y5JakiioHQ+FdeEMCHwk2Gj0/OgbKerI8jebCoeNmN1LuX1Yu+7UNmUTTXy
 MGKwep3ErD6V9+pLSXg9iuy7P0DRSQDYOfxGJpzrOZ0+YYKV7JvJNzXUQvMMLC7dJSiw=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.92.2)
 (envelope-from <andrew@lunn.ch>)
 id 1iflHg-00019i-1C; Fri, 13 Dec 2019 14:47:08 +0100
Date: Fri, 13 Dec 2019 14:47:08 +0100
From: Andrew Lunn <andrew@lunn.ch>
To: biao huang <biao.huang@mediatek.com>
Subject: Re: [PATCH 1/2] net-next: stmmac: mediatek: add more suuport for RMII
Message-ID: <20191213134708.GA4286@lunn.ch>
References: <20191212024145.21752-1-biao.huang@mediatek.com>
 <20191212024145.21752-2-biao.huang@mediatek.com>
 <20191212132520.GB9959@lunn.ch>
 <1576200981.29387.13.camel@mhfsdcap03>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <1576200981.29387.13.camel@mhfsdcap03>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20191213_054734_815056_381D1C6B 
X-CRM114-Status: UNSURE (   9.72  )
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
Cc: Mark Rutland <mark.rutland@arm.com>, Jose Abreu <joabreu@synopsys.com>,
 Alexandre Torgue <alexandre.torgue@st.com>, devicetree@vger.kernel.org,
 netdev@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com, Rob Herring <robh+dt@kernel.org>,
 linux-mediatek@lists.infradead.org,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 Giuseppe Cavallaro <peppe.cavallaro@st.com>, davem@davemloft.net,
 linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

> The clock labeled as "rmii_internal" is needed only in RMII(when MAC provides
> reference clock), and useless for RGMII/MII/RMII(when phy provides reference
> clock).
> 
> So, add a boolean flag to indicate where the RMII reference clock is from, MAC
> or PHY, if MAC, enable the "rmii_internal", or disable it.
> and this clock already documented in dt-binding in PATCH 2/2.
> 
> For power saving, it should not be enabled in default, so can't add it to the
> existing list of clocks directly.
> 
> Any advice for this special case?

O.K. Add the boolean, but also add the clock to the list of clocks in
DT. Don't hard code the clock name in the driver.

    Andrew

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
