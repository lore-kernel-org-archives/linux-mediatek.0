Return-Path: <SRS0=cyKo=BC=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-11.5 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,
	URIBL_BLOCKED,USER_AGENT_SANE_2 autolearn=unavailable autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 28C32C433E0
	for <linux-mediatek@archiver.kernel.org>; Thu, 23 Jul 2020 08:08:37 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id E9B722086A
	for <linux-mediatek@archiver.kernel.org>; Thu, 23 Jul 2020 08:08:36 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="OQykmFsI";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b="n6mdgpCq"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org E9B722086A
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Date:To:From:
	Subject:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=nbQH5kTU7j4tpy+UsFE1L5PUtlzQF1kW5yPh4M1lvOA=; b=OQykmFsIOKIfHKJDhBeZQU3wB
	IPZq9HJu82etT6EakV3JOY9wlDnjOnhFITYBouTfJ9x8D0fiWHpKbZV2ajiXfRhftpcHwrlBIYCEO
	jtaKAJ2cWGgsiDY7+aZ5+o2Ep1bdR6+DjqYOmZUrhLx/aqk8NsOF7ZKUOZpEqqJLiFGzXwxauSdl+
	NaFT4u8YXF8fJAVO9ed8NxfVJUsCRzG4NOdkwN+ZTRgFoIpxb2UmeJbXKgYMdI+XWZq16Oe/CLDh9
	f4pJ805yCJav8qlqU2fKHOb8oFLyrM+ONBxEuF7wfSXi0wblGhgz+9joX4e5lFWOKwPTW0Nn+Y3j8
	Eb7/NCUdQ==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jyWHB-0000Nn-MU; Thu, 23 Jul 2020 08:08:25 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jyWH9-0000N2-F5; Thu, 23 Jul 2020 08:08:24 +0000
X-UUID: e10716b2af234dcca9f4f48e6912f557-20200723
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:MIME-Version:Content-Type:References:In-Reply-To:Date:CC:To:From:Subject:Message-ID;
 bh=iHKeR/AeryDDzrZa62FayPp2h6VezjXi9BL3bT7aMkY=; 
 b=n6mdgpCqbBYSubyISsSRKuf03LEc0qWHqYL8X2b1Thwkz461JsFtxLy1ZYbx09xlC1GByxTXT9TmVXsC9PkG6aErS7QvMIeku+6/1SY5YT98x55ep9EdSKwRoDwzj4zmwPflbfn4S2p9xh2ePHflu5uF0r5eB1sg3MICWDgYRgk=;
X-UUID: e10716b2af234dcca9f4f48e6912f557-20200723
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw01.mediatek.com
 (envelope-from <wendell.lin@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLS)
 with ESMTP id 821667457; Thu, 23 Jul 2020 00:08:15 -0800
Received: from MTKMBS07N2.mediatek.inc (172.21.101.141) by
 MTKMBS62N1.mediatek.inc (172.29.193.41) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Thu, 23 Jul 2020 01:08:14 -0700
Received: from mtkcas08.mediatek.inc (172.21.101.126) by
 mtkmbs07n2.mediatek.inc (172.21.101.141) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Thu, 23 Jul 2020 16:08:13 +0800
Received: from [172.21.77.33] (172.21.77.33) by mtkcas08.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Thu, 23 Jul 2020 16:08:13 +0800
Message-ID: <1595491694.17583.3.camel@mtkswgap22>
Subject: Re: [PATCH 1/2] clk: Export clk_register_composite
From: Wendell Lin <wendell.lin@mediatek.com>
To: Stephen Boyd <sboyd@kernel.org>
Date: Thu, 23 Jul 2020 16:08:14 +0800
In-Reply-To: <159442720733.1987609.12625915294903304595@swboyd.mtv.corp.google.com>
References: <1593588382-19049-1-git-send-email-wendell.lin@mediatek.com>
 <1593588382-19049-2-git-send-email-wendell.lin@mediatek.com>
 <159442720733.1987609.12625915294903304595@swboyd.mtv.corp.google.com>
X-Mailer: Evolution 3.2.3-0ubuntu6 
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200723_040823_643876_39B38FE4 
X-CRM114-Status: GOOD (  14.26  )
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
Cc: wsd_upstream@mediatek.com, Weiyi Lu <weiyi.lu@mediatek.com>,
 Michael Turquette <mturquette@baylibre.com>, linux-kernel@vger.kernel.org,
 linux-mediatek@lists.infradead.org, Matthias Brugger <matthias.bgg@gmail.com>,
 linux-clk@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On Fri, 2020-07-10 at 17:26 -0700, Stephen Boyd wrote:
> Quoting Wendell Lin (2020-07-01 00:26:21)
> > clk_register_composite() will be used in mediatek's
> > clock kernel module, so export it to GPL modules.
> > 
> > Signed-off-by: Wendell Lin <wendell.lin@mediatek.com>
> > ---
> >  drivers/clk/clk-composite.c |    1 +
> >  1 file changed, 1 insertion(+)
> > 
> > diff --git a/drivers/clk/clk-composite.c b/drivers/clk/clk-composite.c
> > index 7376f57..fb5cb4a 100644
> > --- a/drivers/clk/clk-composite.c
> > +++ b/drivers/clk/clk-composite.c
> > @@ -360,6 +360,7 @@ struct clk *clk_register_composite(struct device *dev, const char *name,
> >                 return ERR_CAST(hw);
> >         return hw->clk;
> >  }
> > +EXPORT_SYMBOL(clk_register_composite);
> 
> Should be EXPORT_SYMBOL_GPL()

Got it, I'll fix it.

Regards,
Wendell

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
