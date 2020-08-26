Return-Path: <SRS0=weZ6=CE=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,
	USER_AGENT_SANE_2 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 24DC8C433DF
	for <linux-mediatek@archiver.kernel.org>; Wed, 26 Aug 2020 06:22:44 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id E37892076C
	for <linux-mediatek@archiver.kernel.org>; Wed, 26 Aug 2020 06:22:43 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="TZ1nCPNU";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b="Ar/nkxi6"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org E37892076C
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Date:To:From:
	Subject:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=TCgOez13PNemg2LPrXLjwnJUgh7tXAnMj+DoRlBWqLc=; b=TZ1nCPNUFtfoe1xTeLe++C5u7
	m11HR7pz15r/gbDo3e78ELGtoVthXd4+twZRH6ZV0Z1mFqdeOpreertOH0tYgd/JND+A3jkCnBlrg
	ODUFI8RjDrhzUsuydkrhTm87NCO4Qiwi4RWmax+jQZRHfs6OJagojijvh0c6zBU6ZiukEpReyxNf9
	gAsZZBmBeLQm80/m1mlZzZhzcM6OtBFiBhvvXbIENhh21rtuW9iYXzxLXHZ8HA9E7BhguXgEUb2hJ
	V5dJs7hMbgtrbyLrpAUAPtZMme1xUW2ecfB0g7uSbroQASneciQ+nFRjEMMnsshXKAGWTwmti0xcK
	H/xhB2Byw==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kAopN-0000j1-BB; Wed, 26 Aug 2020 06:22:33 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kAopG-0000gZ-0D; Wed, 26 Aug 2020 06:22:27 +0000
X-UUID: d3486a123e8d4c98b9d989d0ae1f42da-20200825
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:MIME-Version:Content-Type:References:In-Reply-To:Date:CC:To:From:Subject:Message-ID;
 bh=ylPSVH9BPictdHb8dQm8y8sP20WP8ufKl9IkALHg1BE=; 
 b=Ar/nkxi6+jNfNOSZ8XAQIhcPFao4E9qf1iF1APWfnnp0Ug0YwG+KoqYI2L3S7YWVmY8F09+Abhjqq+VEAPRY6SRPwnzWEBzelnGgH1xfwL5sW/udC2fZGjDrRsY3dpgslmMyiKZDxiznZfPeSPIzGgyckKq8Q/TfIeaK44No8uY=;
X-UUID: d3486a123e8d4c98b9d989d0ae1f42da-20200825
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw01.mediatek.com
 (envelope-from <chih-en.hsu@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLS)
 with ESMTP id 1108379966; Tue, 25 Aug 2020 22:22:16 -0800
Received: from MTKMBS06N2.mediatek.inc (172.21.101.130) by
 MTKMBS62DR.mediatek.inc (172.29.94.18) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Tue, 25 Aug 2020 23:12:14 -0700
Received: from mtkcas07.mediatek.inc (172.21.101.84) by
 mtkmbs06n2.mediatek.inc (172.21.101.130) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Wed, 26 Aug 2020 14:12:13 +0800
Received: from [172.21.84.99] (172.21.84.99) by mtkcas07.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Wed, 26 Aug 2020 14:12:12 +0800
Message-ID: <1598422333.15853.9.camel@mtksdccf07>
Subject: Re: [PATCH] nvmem: mtk-efuse: Remove EFUSE register write support
From: Chih-En Hsu <chih-en.hsu@mediatek.com>
To: CK Hu <ck.hu@mediatek.com>
Date: Wed, 26 Aug 2020 14:12:13 +0800
In-Reply-To: <1598418963.20150.2.camel@mtksdaap41>
References: <20200826050145.24655-1-chih-en.hsu@mediatek.com>
 <1598418963.20150.2.camel@mtksdaap41>
X-Mailer: Evolution 3.2.3-0ubuntu6 
MIME-Version: 1.0
X-TM-SNTS-SMTP: 9F567A1762FAF26BD80846770A7646E7628B363C3C179FDC61A5C52ED89CB1042000:8
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200826_022226_249590_48F3F842 
X-CRM114-Status: GOOD (  18.97  )
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
Cc: Andrew-CT.Chen@mediatek.com, srv_heupstream@mediatek.com,
 linux-kernel@vger.kernel.org, linux-mediatek@lists.infradead.org,
 Matthias Brugger <matthias.bgg@gmail.com>,
 Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
 linux-arm-kernel@lists.infradead.org, Michael.Mei@mediatek.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

Hi CK:

I see.

I will add the following fix tag into the next patch version.

Fixes: 4c7e4fe37766 ("nvmem: mediatek: Add Mediatek EFUSE driver")

Thanks a lot.

Alex


On Wed, 2020-08-26 at 13:16 +0800, CK Hu wrote:
> Hi, Chih-En:
> 
> On Wed, 2020-08-26 at 13:01 +0800, Chih-En Hsu wrote:
> > This patch is to remove function "mtk_reg_write" since
> > Mediatek EFUSE hardware only supports read functionality
> > for NVMEM consumers.
> > 
> 
> This is a bug-fix patch, so need a 'Fixes' tag. You could refer to [1].
> 
> [1]
> https://www.kernel.org/doc/html/latest/process/submitting-patches.html#describe-changes
> 
> Regards,
> CK.
> 
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
