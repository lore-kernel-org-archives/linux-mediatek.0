Return-Path: <SRS0=weZ6=CE=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,
	USER_AGENT_SANE_2 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 915A3C433E1
	for <linux-mediatek@archiver.kernel.org>; Wed, 26 Aug 2020 08:31:18 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 4B59820707
	for <linux-mediatek@archiver.kernel.org>; Wed, 26 Aug 2020 08:31:18 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="RT1fBAMx";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b="UYY8pk8R"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 4B59820707
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Date:To:From:
	Subject:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=5v6UFfpTKjOXYTotQRU9S/oBEXMmWlqIm+xEwSbRdXU=; b=RT1fBAMxII4XBS23PHh+CJ3/j
	pyay44vmF7jsEsbaWD9WNHTs01BjH0/tPH8NMBSHho0ePyGVHTBOwLJPbp8+zsRoPI3qIbYk7875f
	+dH1OETkoxQRVMM59b4isbTlZTaR98FSaJ9Wn+wCSza3QF6Fny2jGpDbjAY/X+xAiEef6FfWdWZJl
	KRndzH8yxIOTdA+F23Dwch/ffsUAsuagveZWxneM6w6F9lHAqc5qZCcpne2WpPkdIvIR9mzGvEypN
	wKL3jhFNoQtD0Gr3hMlgU7vy7erxl2PfZdIyDCGkdwuibWEPuWY8bjd/JPuHjhA4DLa9/isQCh97X
	DmCNOVNug==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kAqpn-0005u6-KF; Wed, 26 Aug 2020 08:31:07 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kAqpi-0005rE-UZ; Wed, 26 Aug 2020 08:31:05 +0000
X-UUID: b7f7910bdbda4b949a95a68387153cd1-20200826
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:MIME-Version:Content-Type:References:In-Reply-To:Date:CC:To:From:Subject:Message-ID;
 bh=nm4wPKgjzNpL+M+MH1P1YfFvO1+9lob2dGm1Je/jS9g=; 
 b=UYY8pk8RrFN5Ktsq4mYdkLCk+MG55jVXvkOYUj6iGpzSXBatS7p/oTN+UeevR2ouKpz5Oajh1vhOiwkP5oiMsIDshYQvmecKBdxDTbtMwsXhBlWL+0slwcBkrE6MXGmNnX0rTE3vywnD1Df7/7UDYj2gw2b4ToUJCD351KPbMgs=;
X-UUID: b7f7910bdbda4b949a95a68387153cd1-20200826
Received: from mtkcas68.mediatek.inc [(172.29.94.19)] by mailgw02.mediatek.com
 (envelope-from <andrew-ct.chen@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLS)
 with ESMTP id 58573602; Wed, 26 Aug 2020 00:30:56 -0800
Received: from mtkmbs08n1.mediatek.inc (172.21.101.55) by
 MTKMBS62N1.mediatek.inc (172.29.193.41) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Wed, 26 Aug 2020 01:30:54 -0700
Received: from mtkcas08.mediatek.inc (172.21.101.126) by
 mtkmbs08n1.mediatek.inc (172.21.101.55) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Wed, 26 Aug 2020 16:30:51 +0800
Received: from [172.21.77.4] (172.21.77.4) by mtkcas08.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Wed, 26 Aug 2020 16:30:51 +0800
Message-ID: <1598430653.18394.5.camel@mtksdaap41>
Subject: Re: [PATCH v2] nvmem: mtk-efuse: Remove EFUSE register write support
From: andrew-ct chen <andrew-ct.chen@mediatek.com>
To: Chih-En Hsu <chih-en.hsu@mediatek.com>
Date: Wed, 26 Aug 2020 16:30:53 +0800
In-Reply-To: <20200826062148.27293-1-chih-en.hsu@mediatek.com>
References: <20200826062148.27293-1-chih-en.hsu@mediatek.com>
X-Mailer: Evolution 3.10.4-0ubuntu2 
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200826_043103_195919_F6A393DC 
X-CRM114-Status: GOOD (  17.97  )
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

Hi Chih-En,

On Wed, 2020-08-26 at 14:21 +0800, Chih-En Hsu wrote:
> This patch is to remove function "mtk_reg_write" since
> Mediatek EFUSE hardware only supports read functionality
> for NVMEM consumers.

The fixed patch should be ba360fd040e34 ("nvmem: mtk-efuse: remove nvmem
regmap dependency")

> Fixes: 4c7e4fe37766 ("nvmem: mediatek: Add Mediatek EFUSE driver")
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
