Return-Path: <SRS0=hb3V=3I=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.3 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,USER_AGENT_SANE_2
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 01DB8C32771
	for <linux-mediatek@archiver.kernel.org>; Sun, 19 Jan 2020 03:22:36 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id B51392083E
	for <linux-mediatek@archiver.kernel.org>; Sun, 19 Jan 2020 03:22:35 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="uJ1AUsMH";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b="GDKHRbGq"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org B51392083E
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Date:To:From:Subject:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=GO2+j7/qRSue/axFGSuu8TmkUQGSY+DfXIJ8NEDWbnc=; b=uJ1AUsMHLz6+oF
	Yan2q6L3QfeUFz7EfxwzC+LF5JRGCffhzexQw/ahXSZKaxCetr+lXryBOo0aSOY6bb39gYHNjEgn8
	kyhjZNjsysOfj3FTjGEDA7y5JasQ6SsBg6GzJFmCDST6eiLtViX+cx/AmVEXCOgqZFEVhxoKp7Noz
	uPpWDJ1wSZapJF7qPh+J712ppyxn+sqDzlt0G/M8/dG6R4Lwo3tf0QS/rIemj2MZdSknk7dD3E78g
	n/qCWnmXuFVDG/FTi+B33I4vXU+u1JgNsiWBds4w5vX6bOsP/z1tE+PJD21iPLShsY7vOysiqHumL
	bzvJ2VjcJbIHCsMPfkyQ==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1it1AP-0004Ne-Qx; Sun, 19 Jan 2020 03:22:25 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1it1AB-0004Ds-Sh; Sun, 19 Jan 2020 03:22:15 +0000
X-UUID: c93873cc43a542d88870a6039ee01cd8-20200118
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:MIME-Version:Content-Type:References:In-Reply-To:Date:CC:To:From:Subject:Message-ID;
 bh=N4m9R+HOEDebYFK3h+Sc6tDJ4qpxShm9ZEefTev3gRc=; 
 b=GDKHRbGqMIa1Fbjl67s5M9EaXA3KXyexPY5V6kV+EhVh/DmDufg6TvQ9JOTuZkUff0nCUoDogkrgVZ+P+8l5jpwmbkib/S3vKmK0dAFDf7ZOz/7PZJC0XPPZvG9F08PD46+C1EG0qyBpoIX9GgZbDJ8eYRgjfaPqDtQyYEWqqSw=;
X-UUID: c93873cc43a542d88870a6039ee01cd8-20200118
Received: from mtkcas68.mediatek.inc [(172.29.94.19)] by mailgw01.mediatek.com
 (envelope-from <yong.liang@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLS)
 with ESMTP id 1700877670; Sat, 18 Jan 2020 19:22:05 -0800
Received: from MTKMBS31DR.mediatek.inc (172.27.6.102) by
 MTKMBS62N2.mediatek.inc (172.29.193.42) with Microsoft SMTP Server (TLS) id
 15.0.1395.4; Sat, 18 Jan 2020 19:22:58 -0800
Received: from MTKCAS32.mediatek.inc (172.27.4.184) by MTKMBS31DR.mediatek.inc
 (172.27.6.102) with Microsoft SMTP Server (TLS) id 15.0.1395.4;
 Sun, 19 Jan 2020 11:20:20 +0800
Received: from [10.17.3.153] (10.17.3.153) by MTKCAS32.mediatek.inc
 (172.27.4.170) with Microsoft SMTP Server id 15.0.1395.4 via Frontend
 Transport; Sun, 19 Jan 2020 11:22:07 +0800
Message-ID: <1579404112.27500.0.camel@mhfsdcap03>
Subject: Re: [PATCH v12 4/4] watchdog: mtk_wdt: mt2712: Add reset controller
From: Yong Liang <yong.liang@mediatek.com>
To: Matthias Brugger <matthias.bgg@gmail.com>
Date: Sun, 19 Jan 2020 11:21:52 +0800
In-Reply-To: <987a7ccf-3d1b-9d4b-d766-63925268c21e@gmail.com>
References: <20200115085828.27791-1-yong.liang@mediatek.com>
 <20200115085828.27791-5-yong.liang@mediatek.com>
 <987a7ccf-3d1b-9d4b-d766-63925268c21e@gmail.com>
X-Mailer: Evolution 3.10.4-0ubuntu2 
MIME-Version: 1.0
X-TM-SNTS-SMTP: 0375DB0187E35C7A60A71975C79E48344130A27F5AE250EF19AE1BE1763111EC2000:8
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200118_192211_940379_DA130FEF 
X-CRM114-Status: GOOD (  15.70  )
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
Cc: "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
 Freddy Hsin =?UTF-8?Q?=28=E8=BE=9B=E6=81=92=E8=B1=90=29?=
 <Freddy.Hsin@mediatek.com>,
 "linux-watchdog@vger.kernel.org" <linux-watchdog@vger.kernel.org>,
 "sboyd@kernel.org" <sboyd@kernel.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 Jiaxin Yu =?UTF-8?Q?=28=E4=BF=9E=E5=AE=B6=E9=91=AB=29?=
 <Jiaxin.Yu@mediatek.com>,
 "linux-mediatek@lists.infradead.org" <linux-mediatek@lists.infradead.org>,
 "linux@roeck-us.net" <linux@roeck-us.net>,
 "p.zabel@pengutronix.de" <p.zabel@pengutronix.de>,
 Yingjoe Chen =?UTF-8?Q?=28=E9=99=B3=E8=8B=B1=E6=B4=B2=29?=
 <Yingjoe.Chen@mediatek.com>,
 Chang-An Chen =?UTF-8?Q?=28=E9=99=B3=E6=98=B6=E5=AE=89=29?=
 <Chang-An.Chen@mediatek.com>,
 "wim@linux-watchdog.org" <wim@linux-watchdog.org>,
 "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On Thu, 2020-01-16 at 00:18 +0800, Matthias Brugger wrote:
> 
> On 15/01/2020 09:58, Yong Liang wrote:
> > From: "yong.liang" <yong.liang@mediatek.com>
> > 
> > Add reset controller for 2712.
> > Besides watchdog, MTK toprgu module alsa provide sub-system (eg, audio,
> > camera, codec and connectivity) software reset functionality.
> > 
> > Signed-off-by: yong.liang <yong.liang@mediatek.com>
> > Signed-off-by: Jiaxin Yu <jiaxin.yu@mediatek.com>
> > Reviewed-by: Yingjoe Chen <yingjoe.chen@mediatek.com>
> > Reviewed-by: Philipp Zabel <p.zabel@pengutronix.de>
> 
> Acked-by: Matthias Brugger <matthias.bgg@gmail.com>

Hi Mattias:
  May I need send a new patch whith this tag?
> 
> > ---
> >  drivers/watchdog/mtk_wdt.c | 6 ++++++
> >  1 file changed, 6 insertions(+)
> > 
> > diff --git a/drivers/watchdog/mtk_wdt.c b/drivers/watchdog/mtk_wdt.c
> > index e88aacb0404d..d6a6393f609d 100644
> > --- a/drivers/watchdog/mtk_wdt.c
> > +++ b/drivers/watchdog/mtk_wdt.c
> > @@ -9,6 +9,7 @@
> >   * Based on sunxi_wdt.c
> >   */
> >  
> > +#include <dt-bindings/reset-controller/mt2712-resets.h>
> >  #include <dt-bindings/reset-controller/mt8183-resets.h>
> >  #include <linux/delay.h>
> >  #include <linux/err.h>
> > @@ -67,6 +68,10 @@ struct mtk_wdt_data {
> >  	int toprgu_sw_rst_num;
> >  };
> >  
> > +static const struct mtk_wdt_data mt2712_data = {
> > +	.toprgu_sw_rst_num = MT2712_TOPRGU_SW_RST_NUM,
> > +};
> > +
> >  static const struct mtk_wdt_data mt8183_data = {
> >  	.toprgu_sw_rst_num = MT8183_TOPRGU_SW_RST_NUM,
> >  };
> > @@ -314,6 +319,7 @@ static int mtk_wdt_resume(struct device *dev)
> >  #endif
> >  
> >  static const struct of_device_id mtk_wdt_dt_ids[] = {
> > +	{ .compatible = "mediatek,mt2712-wdt", .data = &mt2712_data },
> >  	{ .compatible = "mediatek,mt6589-wdt" },
> >  	{ .compatible = "mediatek,mt8183-wdt", .data = &mt8183_data },
> >  	{ /* sentinel */ }
> > 
> 
> _______________________________________________
> Linux-mediatek mailing list
> Linux-mediatek@lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/linux-mediatek

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
