Return-Path: <SRS0=weZ6=CE=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,
	USER_AGENT_SANE_2 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 43DDBC433DF
	for <linux-mediatek@archiver.kernel.org>; Wed, 26 Aug 2020 08:48:29 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 0808F2071E
	for <linux-mediatek@archiver.kernel.org>; Wed, 26 Aug 2020 08:48:29 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="pwL6lsTs";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b="hJsl+gk7"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 0808F2071E
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Date:To:From:
	Subject:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=qrH1Grrs0leGesoLVqETtuJVwQWCsReoVBGPS/bVklo=; b=pwL6lsTsBAckwIxM0uRCqHXc/
	Ds6UbUzXJe6zFKs73KN3HHGLIMMv2Y694qdU4Nqmby6UGcsmnQ1FmDvJijuZYH3sZZoN+x8ClcRSI
	AIs5iOoiQ2CD7baf0vCGuLuG+iNP3wyXf99xuqConbjRYK+ORT51xqX6j1KfHuxUwXOkbFT4r/2qt
	Ai7ViB7OMwqFe/uWm74A3/L08uKFiAVB4/ivBR/srnU6+dpxQ81uSaBzpg1M6yP0aAxEsEP9hXXrQ
	gci51Lrcwy/QR6i7RC1/yb3u/kAZwJqpQeXgney5eCEnFF6bMOGJ/v3bHEfVugZHKwn2I44xBaMvO
	uy89TPigA==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kAr6O-0008M8-Kd; Wed, 26 Aug 2020 08:48:16 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kAr6M-0008LY-Ic; Wed, 26 Aug 2020 08:48:15 +0000
X-UUID: 62551e921b984ca8afd58b1d056f3c7d-20200826
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:MIME-Version:Content-Type:References:In-Reply-To:Date:CC:To:From:Subject:Message-ID;
 bh=SeM0LuWXoTr2HkSqQ9VoSRaNEjqOckocCFsNhXZ3E4A=; 
 b=hJsl+gk7EdBxoFdn7FxoKEbwNwk7TouXzPjauS9KphbaSLSkercWd8fN9ONODQO+OkflL8/i4C3zWN8exIL2o6ERCLmNK3ZFeDTF4ocolXwZd4G5jPHzfS2CMga29of1JVdEyP8xyK1auSCHBohxTY9fYCX5boQuFSzVelL0CMg=;
X-UUID: 62551e921b984ca8afd58b1d056f3c7d-20200826
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw02.mediatek.com
 (envelope-from <chih-en.hsu@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLS)
 with ESMTP id 1035369174; Wed, 26 Aug 2020 00:48:09 -0800
Received: from MTKMBS06N2.mediatek.inc (172.21.101.130) by
 MTKMBS62N2.mediatek.inc (172.29.193.42) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Wed, 26 Aug 2020 01:38:06 -0700
Received: from MTKCAS06.mediatek.inc (172.21.101.30) by
 mtkmbs06n2.mediatek.inc (172.21.101.130) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Wed, 26 Aug 2020 16:38:05 +0800
Received: from [172.21.84.99] (172.21.84.99) by MTKCAS06.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Wed, 26 Aug 2020 16:38:03 +0800
Message-ID: <1598431085.604.0.camel@mtksdccf07>
Subject: Re: [PATCH v2] nvmem: mtk-efuse: Remove EFUSE register write support
From: Chih-En Hsu <chih-en.hsu@mediatek.com>
To: andrew-ct chen <andrew-ct.chen@mediatek.com>
Date: Wed, 26 Aug 2020 16:38:05 +0800
In-Reply-To: <1598430653.18394.5.camel@mtksdaap41>
References: <20200826062148.27293-1-chih-en.hsu@mediatek.com>
 <1598430653.18394.5.camel@mtksdaap41>
X-Mailer: Evolution 3.2.3-0ubuntu6 
MIME-Version: 1.0
X-TM-SNTS-SMTP: 230897339FD2DDD8A52EDA204395388F61ABE40773C273A37E540230021FF5F42000:8
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200826_044814_839339_DDCE86D3 
X-CRM114-Status: GOOD (  20.12  )
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
Cc: srv_heupstream@mediatek.com, linux-kernel@vger.kernel.org,
 linux-mediatek@lists.infradead.org, Matthias Brugger <matthias.bgg@gmail.com>,
 Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
 linux-arm-kernel@lists.infradead.org, Michael.Mei@mediatek.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

Hi Andrew:

OK, I will fix it.

Thanks a lot.

Alex

On Wed, 2020-08-26 at 16:30 +0800, andrew-ct chen wrote:
> Hi Chih-En,
> 
> On Wed, 2020-08-26 at 14:21 +0800, Chih-En Hsu wrote:
> > This patch is to remove function "mtk_reg_write" since
> > Mediatek EFUSE hardware only supports read functionality
> > for NVMEM consumers.
> 
> The fixed patch should be ba360fd040e34 ("nvmem: mtk-efuse: remove nvmem
> regmap dependency")
> 
> > Fixes: 4c7e4fe37766 ("nvmem: mediatek: Add Mediatek EFUSE driver")
> > Signed-off-by: Chih-En Hsu <chih-en.hsu@mediatek.com>
> > ---
> >  drivers/nvmem/mtk-efuse.c | 14 --------------
> >  1 file changed, 14 deletions(-)
> > 
> > diff --git a/drivers/nvmem/mtk-efuse.c b/drivers/nvmem/mtk-efuse.c
> > index 856d9c3fc38e..6a537d959f14 100644
> > --- a/drivers/nvmem/mtk-efuse.c
> > +++ b/drivers/nvmem/mtk-efuse.c
> > @@ -28,19 +28,6 @@ static int mtk_reg_read(void *context,
> >  	return 0;
> >  }
> >  
> > -static int mtk_reg_write(void *context,
> > -			 unsigned int reg, void *_val, size_t bytes)
> > -{
> > -	struct mtk_efuse_priv *priv = context;
> > -	u32 *val = _val;
> > -	int i = 0, words = bytes / 4;
> > -
> > -	while (words--)
> > -		writel(*val++, priv->base + reg + (i++ * 4));
> > -
> > -	return 0;
> > -}
> > -
> >  static int mtk_efuse_probe(struct platform_device *pdev)
> >  {
> >  	struct device *dev = &pdev->dev;
> > @@ -61,7 +48,6 @@ static int mtk_efuse_probe(struct platform_device *pdev)
> >  	econfig.stride = 4;
> >  	econfig.word_size = 4;
> >  	econfig.reg_read = mtk_reg_read;
> > -	econfig.reg_write = mtk_reg_write;
> >  	econfig.size = resource_size(res);
> >  	econfig.priv = priv;
> >  	econfig.dev = dev;
> 
> 

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
