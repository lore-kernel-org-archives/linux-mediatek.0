Return-Path: <SRS0=F/ID=6V=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-11.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D6FB8C47257
	for <linux-mediatek@archiver.kernel.org>; Thu,  7 May 2020 06:47:48 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id ADCE6207DD
	for <linux-mediatek@archiver.kernel.org>; Thu,  7 May 2020 06:47:48 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="BIfmzDO5";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=kernel.org header.i=@kernel.org header.b="dCZ6mLUc"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org ADCE6207DD
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=linuxfoundation.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=QlOQnVZIdGzqiTtS5HtBM55sPRxMRbD8k1m+/Dh/C1M=; b=BIfmzDO5gspbXt
	QVX7lVFb7Ir/WIftftETmk1Ft8xu161P2b6xtyXEgHQlrZs54dxzygjwOVl8HRQrYKcHQg8pxQu5N
	qIndoemg48G2a8yH1a2CyGtlmLdOmRbjFJUA+tF48CSoAMePpacHm+h+YA8Zj1pgfJnVrwW2uoefj
	u9z+NVIc108a+tuwetiiSd7CYJwAbFpbdmOWWUBYVeMMGfxethfG+GlkT85iYwVkjYc/MsTfQTQg/
	lz9S2VicbgK5IA4Wniy/4+m/pJOpGH3IMqjJBQ5579gkbo/cpLmQNWfyVFxEN03YD8DTMQ4V5XzNu
	tvCvKPUUvI/tGef5mWsA==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jWaJo-0000sl-Vf; Thu, 07 May 2020 06:47:40 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jWaJl-0000ry-Co
 for linux-mediatek@lists.infradead.org; Thu, 07 May 2020 06:47:38 +0000
Received: from localhost (83-86-89-107.cable.dynamic.v4.ziggo.nl
 [83.86.89.107])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id D794F2078C;
 Thu,  7 May 2020 06:47:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1588834056;
 bh=hUD5exA4dNKvCcKV83BYNh5VFO685TqU5GU5ToDg3us=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=dCZ6mLUcN1lIcruUpjFnEcOhlyrmSgxjeyHHlnFw/4co12Hwb9W/Qsgzq6nZ+HnJp
 DibKlr9P4RQGxGYL3/8X8BfHpXRz53ezegCOp/1lVZvRByJvVXChNS4+D1DL4tpB3T
 fOVh6T5cCACfVwnSp8ZDtkKBDaj/Y7C6rRFAF5rg=
Date: Thu, 7 May 2020 08:47:34 +0200
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: Johan Hovold <johan@kernel.org>
Subject: Re: [PATCH net 11/16] net: ethernet: marvell: mvneta: fix fixed-link
 phydev leaks
Message-ID: <20200507064734.GA798308@kroah.com>
References: <1480357509-28074-1-git-send-email-johan@kernel.org>
 <1480357509-28074-12-git-send-email-johan@kernel.org>
 <CA+G9fYvBjUVkVhtRHVm6xXcKe2+tZN4rGdB9FzmpcfpaLhY1+g@mail.gmail.com>
 <20200507064412.GL2042@localhost>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200507064412.GL2042@localhost>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200506_234737_475538_142F3EB2 
X-CRM114-Status: GOOD (  17.36  )
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
Cc: Andrew Lunn <andrew@lunn.ch>,
 "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS"
 <devicetree@vger.kernel.org>, lkft-triage@lists.linaro.org,
 Pantelis Antoniou <pantelis.antoniou@gmail.com>,
 Frank Rowand <frowand.list@gmail.com>, Sasha Levin <sashal@kernel.org>,
 Felix Fietkau <nbd@openwrt.org>, Florian Fainelli <f.fainelli@gmail.com>,
 Naresh Kamboju <naresh.kamboju@linaro.org>,
 Claudiu Manoil <claudiu.manoil@freescale.com>, Li Yang <leoli@freescale.com>,
 Mugunthan V N <mugunthanvnm@ti.com>,
 Grygorii Strashko <grygorii.strashko@ti.com>, linuxppc-dev@lists.ozlabs.org,
 Rob Herring <robh+dt@kernel.org>, linux-mediatek@lists.infradead.org,
 Lars Persson <lars.persson@axis.com>,
 Matthias Brugger <matthias.bgg@gmail.com>, linux-omap@vger.kernel.org,
 John Crispin <blogic@openwrt.org>,
 Thomas Petazzoni <thomas.petazzoni@free-electrons.com>,
 Fugang Duan <fugang.duan@nxp.com>,
 Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>,
 Vivien Didelot <vivien.didelot@savoirfairelinux.com>,
 Netdev <netdev@vger.kernel.org>, open list <linux-kernel@vger.kernel.org>,
 linux- stable <stable@vger.kernel.org>, linux-renesas-soc@vger.kernel.org,
 Vitaly Bordug <vbordug@ru.mvista.com>, nios2-dev@lists.rocketboards.org,
 Vince Bridgers <vbridger@opensource.altera.com>,
 "David S. Miller" <davem@davemloft.net>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On Thu, May 07, 2020 at 08:44:12AM +0200, Johan Hovold wrote:
> On Thu, May 07, 2020 at 12:27:53AM +0530, Naresh Kamboju wrote:
> > On Tue, 29 Nov 2016 at 00:00, Johan Hovold <johan@kernel.org> wrote:
> > >
> > > Make sure to deregister and free any fixed-link PHY registered using
> > > of_phy_register_fixed_link() on probe errors and on driver unbind.
> > >
> > > Fixes: 83895bedeee6 ("net: mvneta: add support for fixed links")
> > > Signed-off-by: Johan Hovold <johan@kernel.org>
> > > ---
> > >  drivers/net/ethernet/marvell/mvneta.c | 5 +++++
> > >  1 file changed, 5 insertions(+)
> > >
> > > diff --git a/drivers/net/ethernet/marvell/mvneta.c b/drivers/net/ethernet/marvell/mvneta.c
> > > index 0c0a45af950f..707bc4680b9b 100644
> > > --- a/drivers/net/ethernet/marvell/mvneta.c
> > > +++ b/drivers/net/ethernet/marvell/mvneta.c
> > > @@ -4191,6 +4191,8 @@ static int mvneta_probe(struct platform_device *pdev)
> > >         clk_disable_unprepare(pp->clk);
> > >  err_put_phy_node:
> > >         of_node_put(phy_node);
> > > +       if (of_phy_is_fixed_link(dn))
> > > +               of_phy_deregister_fixed_link(dn);
> > 
> > While building kernel Image for arm architecture on stable-rc 4.4 branch
> > the following build error found.
> > 
> > drivers/net/ethernet/marvell/mvneta.c:3442:3: error: implicit
> > declaration of function 'of_phy_deregister_fixed_link'; did you mean
> > 'of_phy_register_fixed_link'? [-Werror=implicit-function-declaration]
> > |    of_phy_deregister_fixed_link(dn);
> > |    ^~~~~~~~~~~~~~~~~~~~~~~~~~~~
> > |    of_phy_register_fixed_link
> > 
> > ref:
> > https://gitlab.com/Linaro/lkft/kernel-runs/-/jobs/541374729
> 
> Greg, 3f65047c853a ("of_mdio: add helper to deregister fixed-link
> PHYs") needs to be backported as well for these.
> 
> Original series can be found here:
> 
> 	https://lkml.kernel.org/r/1480357509-28074-1-git-send-email-johan@kernel.org

Ah, thanks for that, I thought I dropped all of the ones that caused
build errors, but missed the above one.  I'll go take the whole series
instead.

greg k-h

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
