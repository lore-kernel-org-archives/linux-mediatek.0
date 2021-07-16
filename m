Return-Path: <SRS0=t3QX=MI=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,
	URIBL_BLOCKED,USER_AGENT_SANE_2 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E823AC07E95
	for <linux-mediatek@archiver.kernel.org>; Fri, 16 Jul 2021 08:18:29 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id BAD4A611C0
	for <linux-mediatek@archiver.kernel.org>; Fri, 16 Jul 2021 08:18:29 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org BAD4A611C0
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Date:CC:To:From:Subject:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=BGwuZ01wRCA6vrUgUZRPDH2jp/+HNyCr3fz9+PYt12M=; b=N67TzGPa5eV+G9
	z78HX1mATGpBpi7tepy5yXe2XwxADeVjarBMF4uviX/RfNkmhh/Fr56NA8WfE9Oqq0YB+i6ON5vY7
	REA72ZK0FfmqmV7A3yEXP6AU4Irfjux20FmHqbdfMAdnPAmnybtzaGiIWM+MMgw4qWZwD4FRU4NX+
	GlUjqE6VtQkTL1/FUOSYUi/kZEguLox4HfdhgBh5U/faDzqmmHVrCAxYLcsyugNJJd7D/8fUmVbOt
	IixEjdGZcyfBCmUc5CXuPWofH7dznqXd1e/dcTi4I2WA6f68EaHgpKF7UmWi9/cIl6MoDXzw8jUP4
	0wXK8lZfOGBCp2CCFd4A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1m4J32-003gHG-3m; Fri, 16 Jul 2021 08:18:16 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1m4J2z-003gGD-2Z; Fri, 16 Jul 2021 08:18:14 +0000
X-UUID: f72c2ef2ca26434b9ec0f469c29fcb7a-20210716
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:MIME-Version:Content-Type:References:In-Reply-To:Date:CC:To:From:Subject:Message-ID;
 bh=cOMT0QkkYS50n2Xq8pXQFdg7rscBM7BLCXTqX/dF0E4=; 
 b=lfWzP5XL6R54FjwtnbyoBGotvRRsbJnGOhzySmsSK1ok/rXviS5T5LFApNJ3uj3EqKBTdTls6F5/HIf6BMtP0j6N0j1A5Ta02EV/+NUhUJP9ffqoFUbka8wfYvBkdx9Pga7xAla4syUZ3/IVBWngSVXfiBj+nhwVFsC0FiA3qf4=;
X-UUID: f72c2ef2ca26434b9ec0f469c29fcb7a-20210716
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw01.mediatek.com
 (envelope-from <jason-jh.lin@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 474158869; Fri, 16 Jul 2021 01:18:09 -0700
Received: from MTKMBS02N1.mediatek.inc (172.21.101.77) by
 MTKMBS62N1.mediatek.inc (172.29.193.41) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Fri, 16 Jul 2021 01:12:36 -0700
Received: from mtkcas07.mediatek.inc (172.21.101.84) by
 mtkmbs02n1.mediatek.inc (172.21.101.77) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Fri, 16 Jul 2021 16:12:28 +0800
Received: from mtksdccf07 (172.21.84.99) by mtkcas07.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Fri, 16 Jul 2021 16:12:28 +0800
Message-ID: <9497bf928f49b28f6cbd925a1997c3ac08025cdf.camel@mediatek.com>
Subject: Re: [PATCH v2 6/9] soc: mediatek: add mtk-mutex support for mt8195
 vdosys0
From: Jason-JH Lin <jason-jh.lin@mediatek.com>
To: Matthias Brugger <matthias.bgg@gmail.com>, <chunkuang.hu@kernel.org>
CC: <linux-arm-kernel@lists.infradead.org>,
 <linux-mediatek@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
 <Project_Global_Chrome_Upstream_Group@mediatek.com>, <fshao@google.com>,
 <nancy.lin@mediatek.com>, <singo.chang@mediatek.com>
Date: Fri, 16 Jul 2021 16:12:28 +0800
In-Reply-To: <5685a1f2-c76d-853f-085d-e4e26ce03182@gmail.com>
References: <20210710113819.5170-1-jason-jh.lin@mediatek.com>
 <20210710113819.5170-7-jason-jh.lin@mediatek.com>
 <5685a1f2-c76d-853f-085d-e4e26ce03182@gmail.com>
X-Mailer: Evolution 3.28.5-0ubuntu0.18.04.2 
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210716_011813_167381_7E28EBBB 
X-CRM114-Status: GOOD (  16.62  )
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

On Wed, 2021-07-14 at 18:06 +0200, Matthias Brugger wrote:
> 
> On 10/07/2021 13:38, jason-jh.lin wrote:
> > Add mtk-mutex support for mt8195 vdosys0.
> > 
> > Signed-off-by: jason-jh.lin <jason-jh.lin@mediatek.com>
> > ---
> >  drivers/soc/mediatek/mtk-mutex.c | 107
> > +++++++++++++++++++++++++++++--
> >  1 file changed, 102 insertions(+), 5 deletions(-)
> > 
> > diff --git a/drivers/soc/mediatek/mtk-mutex.c
> > b/drivers/soc/mediatek/mtk-mutex.c
> > index 2e4bcc300576..d74eb3f97f1d 100644
> > --- a/drivers/soc/mediatek/mtk-mutex.c
> > +++ b/drivers/soc/mediatek/mtk-mutex.c
> 
> [...]
> >  struct mtk_mutex *mtk_mutex_get(struct device *dev)
> >  {
> >  	struct mtk_mutex_ctx *mtx = dev_get_drvdata(dev);
> > @@ -507,6 +602,8 @@ static const struct of_device_id
> > mutex_driver_dt_match[] = {
> >  	  .data = &mt8173_mutex_driver_data},
> >  	{ .compatible = "mediatek,mt8183-disp-mutex",
> >  	  .data = &mt8183_mutex_driver_data},
> > +	{ .compatible = "mediatek,mt8195-disp-mutex",
> > +	  .data = &mt8195_mutex_driver_data},
> 
> Are we missing a binding description for that?
> 
> Regards,
> Matthias

Hi Matthias,

mutex is already defined in
Documentation/devicetree/bindings/display/mediatek/mediatek,disp.txt

I'll change it to mediatek,disp.yaml at the next version.

Regards,
Jason-JH.Lin
_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
