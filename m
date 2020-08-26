Return-Path: <SRS0=weZ6=CE=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,
	USER_AGENT_SANE_2 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6729EC433E1
	for <linux-mediatek@archiver.kernel.org>; Wed, 26 Aug 2020 05:16:32 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 358DD2071E
	for <linux-mediatek@archiver.kernel.org>; Wed, 26 Aug 2020 05:16:32 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="2ObtC2L+";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b="Xj4+5wTQ"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 358DD2071E
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Date:To:From:
	Subject:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=6DG+jnfWnJzfFsP0uFIhG7txZLxwka3P3e7s165y/cA=; b=2ObtC2L+cMuHag6wvX2C0/cSk
	x4nM1FVPhIzwY4gAByhDr0ro9VetaWYNCp2i4gkJ7Lg3u8io9cvEsmdf1rMG8j6DhGlstCHNCHn7W
	+nqVt43vZFhQwT+kRoSa2fp9Sv6zI8g8bsD7H1Cbg9KM5t3ar7WEilf04cbcpCuvVEFhhscU0Onzs
	IbkWMLVyFaYSc/WlzNYUUrzWbNDBk39IhXkdJl0tINDd3ZxMf97zaatrQztMrJLcJKalx5zPg6xJJ
	bmBO9gOO1sLZ+0/fz5dlA+e8pU6/vBkLPq9gv9c5z1cOcS9CZdnVI256BnsHvr3v8phY5d9N7EHGZ
	TjWaQ35dg==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kAnnK-0004IB-2N; Wed, 26 Aug 2020 05:16:22 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kAnnG-0004Gs-NL; Wed, 26 Aug 2020 05:16:20 +0000
X-UUID: a0f61be7c248433795a97637eed1b710-20200825
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:MIME-Version:Content-Type:References:In-Reply-To:Date:CC:To:From:Subject:Message-ID;
 bh=k/lzlNQfUA+eaAvH30M5cVyH3/6TlNm4huvvLtGsZks=; 
 b=Xj4+5wTQUzeqvFk67KFuXVdmOX2liX2DYTo0uGNEsOkusr9G6B1x6TfDfd8C1iA31jIlntIuqjg9Po3FrPm4yPKkzRKbxT3PgQBFdfpUIyYmGOzQnZq6+rz+inxa+t/4sWY6GKKuBTvD5WdcXaMatfc6yGq3j479tnS1aMb5tHk=;
X-UUID: a0f61be7c248433795a97637eed1b710-20200825
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw01.mediatek.com
 (envelope-from <ck.hu@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLS)
 with ESMTP id 506551646; Tue, 25 Aug 2020 21:16:13 -0800
Received: from MTKMBS07N2.mediatek.inc (172.21.101.141) by
 MTKMBS62DR.mediatek.inc (172.29.94.18) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Tue, 25 Aug 2020 22:16:11 -0700
Received: from MTKCAS06.mediatek.inc (172.21.101.30) by
 mtkmbs07n2.mediatek.inc (172.21.101.141) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Wed, 26 Aug 2020 13:16:08 +0800
Received: from [172.21.77.4] (172.21.77.4) by MTKCAS06.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Wed, 26 Aug 2020 13:16:02 +0800
Message-ID: <1598418963.20150.2.camel@mtksdaap41>
Subject: Re: [PATCH] nvmem: mtk-efuse: Remove EFUSE register write support
From: CK Hu <ck.hu@mediatek.com>
To: Chih-En Hsu <chih-en.hsu@mediatek.com>
Date: Wed, 26 Aug 2020 13:16:03 +0800
In-Reply-To: <20200826050145.24655-1-chih-en.hsu@mediatek.com>
References: <20200826050145.24655-1-chih-en.hsu@mediatek.com>
X-Mailer: Evolution 3.10.4-0ubuntu2 
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200826_011619_001472_E64EB11D 
X-CRM114-Status: GOOD (  16.22  )
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

Hi, Chih-En:

On Wed, 2020-08-26 at 13:01 +0800, Chih-En Hsu wrote:
> This patch is to remove function "mtk_reg_write" since
> Mediatek EFUSE hardware only supports read functionality
> for NVMEM consumers.
> 

This is a bug-fix patch, so need a 'Fixes' tag. You could refer to [1].

[1]
https://www.kernel.org/doc/html/latest/process/submitting-patches.html#describe-changes

Regards,
CK.

> Signed-off-by: Chih-En Hsu <chih-en.hsu@mediatek.com>
> ---
>  drivers/nvmem/mtk-efuse.c | 14 --------------
>  1 file changed, 14 deletions(-)
> 
> diff --git a/drivers/nvmem/mtk-efuse.c b/drivers/nvmem/mtk-efuse.c
> index 856d9c3fc38e..6a537d959f14 100644
> --- a/drivers/nvmem/mtk-efuse.c
> +++ b/drivers/nvmem/mtk-efuse.c
> @@ -28,19 +28,6 @@ static int mtk_reg_read(void *context,
>  	return 0;
>  }
>  
> -static int mtk_reg_write(void *context,
> -			 unsigned int reg, void *_val, size_t bytes)
> -{
> -	struct mtk_efuse_priv *priv = context;
> -	u32 *val = _val;
> -	int i = 0, words = bytes / 4;
> -
> -	while (words--)
> -		writel(*val++, priv->base + reg + (i++ * 4));
> -
> -	return 0;
> -}
> -
>  static int mtk_efuse_probe(struct platform_device *pdev)
>  {
>  	struct device *dev = &pdev->dev;
> @@ -61,7 +48,6 @@ static int mtk_efuse_probe(struct platform_device *pdev)
>  	econfig.stride = 4;
>  	econfig.word_size = 4;
>  	econfig.reg_read = mtk_reg_read;
> -	econfig.reg_write = mtk_reg_write;
>  	econfig.size = resource_size(res);
>  	econfig.priv = priv;
>  	econfig.dev = dev;

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
