Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6DEA8C433EF
	for <linux-mediatek@archiver.kernel.org>; Fri, 22 Apr 2022 05:08:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Date:CC:To:From:Subject:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=m4MWbfTWdvHBHMmJhKecWlbf62b+pliaZoJYX10Zzlg=; b=YzJWxpLerNGA+W
	q8qWbFVLICcUa7eEHAfeOaseONDktheS9t4/r7G3aRfUEqT9oQawvRJLn9di37K/qIVLGFKcnxVpX
	9ad+l0Ma4tYoThbtJnK7NryMASY+M7q9CPfZq4FEEkmu/PMSxfgP6CslGbi2NNkWfw7++yFDfjQfI
	mZ7HX9Eww45bjmjZeV9Wk17r2kdO4zD/XL7i3BzHUbu9FaOyPqYuoc8gGqrvr7tnChxcIkyyk5Unp
	cAELBuOgSFqJHQYDgr4G4g0Td1MSKjGafrXl0GJMRVPUFGpYeEjIe3d2sZVsl3g3aZNAcckfMooW3
	zm7IEbs1tZCi4CemdtUg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nhlWl-00G9rl-F9; Fri, 22 Apr 2022 05:08:19 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nhlWO-00G9jP-Ud; Fri, 22 Apr 2022 05:07:58 +0000
X-UUID: 88c446e818e54c729e46d6cdaadf068f-20220421
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.4, REQID:8deada60-5779-422c-ac69-c963d0be31ba, OB:0,
 LO
 B:0,IP:0,URL:0,TC:0,Content:1,EDM:0,RT:0,SF:0,FILE:0,RULE:Release_Ham,ACTI
 ON:release,TS:1
X-CID-META: VersionHash:faefae9, CLOUDID:76c8baef-06b0-4305-bfbf-554bfc9d151a,
 C
 OID:IGNORED,Recheck:0,SF:nil,TC:nil,Content:4,EDM:-3,File:nil,QS:0,BEC:nil
X-UUID: 88c446e818e54c729e46d6cdaadf068f-20220421
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw02.mediatek.com
 (envelope-from <rex-bc.chen@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 1816059894; Thu, 21 Apr 2022 22:07:51 -0700
Received: from mtkmbs10n1.mediatek.inc (172.21.101.34) by
 MTKMBS62N2.mediatek.inc (172.29.193.42) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Thu, 21 Apr 2022 21:57:49 -0700
Received: from mtkcas10.mediatek.inc (172.21.101.39) by
 mtkmbs10n1.mediatek.inc (172.21.101.34) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.2.792.15; Fri, 22 Apr 2022 12:57:47 +0800
Received: from mtksdccf07 (172.21.84.99) by mtkcas10.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Fri, 22 Apr 2022 12:57:47 +0800
Message-ID: <f68239ac05bf119134b3203af9bd74d5af1bc6ba.camel@mediatek.com>
Subject: Re: [PATCH V2 02/12] clk: mediatek: reset: Use simple reset operations
From: Rex-BC Chen <rex-bc.chen@mediatek.com>
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 <mturquette@baylibre.com>, <sboyd@kernel.org>
CC: <matthias.bgg@gmail.com>, <p.zabel@pengutronix.de>,
 <chun-jie.chen@mediatek.com>, <wenst@chromium.org>,
 <runyang.chen@mediatek.com>, <linux-kernel@vger.kernel.org>,
 <allen-kh.cheng@mediatek.com>, <linux-clk@vger.kernel.org>,
 <linux-arm-kernel@lists.infradead.org>, <linux-mediatek@lists.infradead.org>, 
 <Project_Global_Chrome_Upstream_Group@mediatek.com>
Date: Fri, 22 Apr 2022 12:57:47 +0800
In-Reply-To: <da6fed21-f661-773d-307f-0c7085e3eb9b@collabora.com>
References: <20220420130527.23200-1-rex-bc.chen@mediatek.com>
 <20220420130527.23200-3-rex-bc.chen@mediatek.com>
 <da6fed21-f661-773d-307f-0c7085e3eb9b@collabora.com>
X-Mailer: Evolution 3.28.5-0ubuntu0.18.04.2 
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220421_220757_016248_DBB667C4 
X-CRM114-Status: GOOD (  17.27  )
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

On Thu, 2022-04-21 at 11:08 +0200, AngeloGioacchino Del Regno wrote:
> Il 20/04/22 15:05, Rex-BC Chen ha scritto:
> > There are two version for clock reset register control of MediaTek
> > SoCs.
> > The reset operations before MT8183 can use simple reset to cover.
> > Therefore, we replace mtk_reset_ops with reset_simple_ops.
> > In addition, we also rename mtk_register_reset_controller to
> > mtk_register_reset_controller_simple.
> > 
> > Signed-off-by: Rex-BC Chen <rex-bc.chen@mediatek.com>
> 
> Hello Rex,
> have you tested this? It won't work.
> 
> reset-simple is not using regmap, and it requires you to pass a
> struct
> reset_simple_data through drvdata.
> 
> Besides, I like that we are using regmap, while reset_simple simply
> uses
> readl/writel... so if you want to use that driver, which is good to
> reduce
> duplication, you should also implement support for regmap in the form
> of
> reset_simple_regmap_ops.
> 
> Regards,
> Angelo

Hello Angelo,

Yes, I also notice the error..
The data we used is not reset_simple_data.
I will drop using reset_simple_ops and remain original functions in
next version.

BRs,
Rex


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
