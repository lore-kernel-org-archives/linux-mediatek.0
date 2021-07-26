Return-Path: <SRS0=WTSR=MS=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,
	URIBL_BLOCKED,USER_AGENT_SANE_2 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2D8B1C4338F
	for <linux-mediatek@archiver.kernel.org>; Mon, 26 Jul 2021 11:31:52 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id EB58860527
	for <linux-mediatek@archiver.kernel.org>; Mon, 26 Jul 2021 11:31:51 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org EB58860527
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Date:CC:To:From:Subject:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=kdWdzuQpTeqosbAoHtkIfRdhjIcAX6tXk8/+/FGDu3I=; b=M5Zgjv3tFuXAkt
	5Greg469SwZPgmA5PmG7rD+6wmuDJU6ZlqhWLFKXDNwO9uvVZDcYz/fwrod43iyMrW4Oei0tQuBu7
	ZnyMo3GyyEg5M5/0HBEpNxHo6vblMEYxzqP+WPSaZgldltLj7NGDCTI9UO0uCIuoAkbRTFPmCEHMB
	2B+AJhzELXfCOYdUO9mDaS+lTuggwrhWpNyMbsq9R9DB2NFKApGwdxaXZ+e9yu9JiYuMLl8qc+oG4
	JEyGeFqImmIHqpYRMCW28IUoj58Qy5YD9YhC//TySMPtHj4AZFRCOXacwdjqk2DB6Q/a8Obtr+4W4
	uAUJ2W6lKWvrYjeWHd4A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1m7ypc-00B0sH-MD; Mon, 26 Jul 2021 11:31:36 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1m7ypQ-00B0qU-2V; Mon, 26 Jul 2021 11:31:25 +0000
X-UUID: e388e0efdbd3417bb92a1a8edb76aeb8-20210726
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:MIME-Version:Content-Type:References:In-Reply-To:Date:CC:To:From:Subject:Message-ID;
 bh=SvbcylQIDwYvhf0Wwa/jBlMORZrzYSGu9JBqThQEr2E=; 
 b=rKFkTeqSNbEwCgCxyr/AB/tUYOp3cspJ++Td6m/QtSYorwPfY2/W0tnybKz+oM2ZRebOFOhIFrZ9dcpovkX1WnD2Upcgg0fuUosk6kvJKZ5wStKAt1YyJlfYeOInKw3jasX0AYe20c7DpU5+cqhnWK46oCGWC9/pBsdoBuSMSyc=;
X-UUID: e388e0efdbd3417bb92a1a8edb76aeb8-20210726
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw01.mediatek.com
 (envelope-from <chun-jie.chen@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 66268680; Mon, 26 Jul 2021 04:31:20 -0700
Received: from mtkmbs07n1.mediatek.inc (172.21.101.16) by
 MTKMBS62N2.mediatek.inc (172.29.193.42) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Mon, 26 Jul 2021 04:31:18 -0700
Received: from mtkcas07.mediatek.inc (172.21.101.84) by
 mtkmbs07n1.mediatek.inc (172.21.101.16) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Mon, 26 Jul 2021 19:31:17 +0800
Received: from mtksdccf07 (172.21.84.99) by mtkcas07.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Mon, 26 Jul 2021 19:31:16 +0800
Message-ID: <a8c0bd3cba8731fefac0678fe25d0482b8ed8b13.camel@mediatek.com>
Subject: Re: [v3 5/5] soc: mediatek: pm-domains: Remove unused macro
From: Chun-Jie Chen <chun-jie.chen@mediatek.com>
To: Chen-Yu Tsai <wenst@chromium.org>
CC: Enric Balletbo i Serra <enric.balletbo@collabora.com>, Matthias Brugger
 <matthias.bgg@gmail.com>, Nicolas Boichat <drinkcat@chromium.org>, "Rob
 Herring" <robh+dt@kernel.org>, <linux-arm-kernel@lists.infradead.org>, LKML
 <linux-kernel@vger.kernel.org>, <devicetree@vger.kernel.org>,
 <linux-mediatek@lists.infradead.org>, srv_heupstream
 <srv_heupstream@mediatek.com>, Project_Global_Chrome_Upstream_Group
 <Project_Global_Chrome_Upstream_Group@mediatek.com>
Date: Mon, 26 Jul 2021 19:31:16 +0800
In-Reply-To: <CAGXv+5ETE=qSPyKL6AjDtSHCDvu3Ua-rrLZWOECjZXrcNZ-9Tw@mail.gmail.com>
References: <20210705054111.4473-1-chun-jie.chen@mediatek.com>
 <20210705054111.4473-6-chun-jie.chen@mediatek.com>
 <CAGXv+5ETE=qSPyKL6AjDtSHCDvu3Ua-rrLZWOECjZXrcNZ-9Tw@mail.gmail.com>
X-Mailer: Evolution 3.28.5-0ubuntu0.18.04.2 
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210726_043124_159454_68B86378 
X-CRM114-Status: GOOD (  22.86  )
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

On Thu, 2021-07-15 at 14:40 +0800, Chen-Yu Tsai wrote:
> On Mon, Jul 5, 2021 at 1:48 PM Chun-Jie Chen <
> chun-jie.chen@mediatek.com> wrote:
> > 
> > Due to clk resource data will be allocated dynamically by
> > searching parent count of clk in power domain node, so remove
> > the unused marco MAX_SUBSYS_CLKS for static allocation.
> > 
> > Signed-off-by: Chun-Jie Chen <chun-jie.chen@mediatek.com>
> > Reviewed-by: Enric Balletbo i Serra <enric.balletbo@collabora.com>
> > ---
> >  drivers/soc/mediatek/mtk-pm-domains.h | 2 --
> >  1 file changed, 2 deletions(-)
> > 
> > diff --git a/drivers/soc/mediatek/mtk-pm-domains.h
> > b/drivers/soc/mediatek/mtk-pm-domains.h
> > index caaa38100093..1b8967b9829e 100644
> > --- a/drivers/soc/mediatek/mtk-pm-domains.h
> > +++ b/drivers/soc/mediatek/mtk-pm-domains.h
> > @@ -72,8 +72,6 @@ struct scpsys_bus_prot_data {
> >         bool ignore_clr_ack;
> >  };
> > 
> > -#define MAX_SUBSYS_CLKS 10
> > -
> 
> Future advice: cleanups like this and other fixes should be put in
> the
> front of the series, before any patches that introduce support for
> new
> features or hardware. That way if the new code still needs work,
> maintainers can optionally apply the fixes so you don't have to carry
> a large patch series forward.
> 
> ChenYu
> 
Ok, I will re-order the patches in next series.
Thanks for your comment.

Best Regards,
Chun-Jie

> >  /**
> >   * struct scpsys_domain_data - scp domain data for power on/off
> > flow
> >   * @name: The name of the power domain.
> > --
> > 2.18.0
> > _______________________________________________
> > Linux-mediatek mailing list
> > Linux-mediatek@lists.infradead.org
> > 
https://urldefense.com/v3/__http://lists.infradead.org/mailman/listinfo/linux-mediatek__;!!CTRNKA9wMg0ARbw!2l_6i-Mdrf270eVKoo59clCnOVZoi5wlBEuHFAfriTvaSsrv6Loc8HJbt7K8LexIJWuR$
> >  
_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
