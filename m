Return-Path: <SRS0=pvhC=NQ=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,
	USER_AGENT_SANE_2 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 158AAC4338F
	for <linux-mediatek@archiver.kernel.org>; Wed, 25 Aug 2021 10:42:46 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 7F156610A4
	for <linux-mediatek@archiver.kernel.org>; Wed, 25 Aug 2021 10:42:45 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 7F156610A4
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Date:CC:To:From:Subject:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=06HaqJNQWUeBj2sIXp+eQHQ3dQOz8snV7vKq+0Oo2Xk=; b=nTaXeMc7prgZ1z
	RghfFWctcmlHlHKkF8ltnvyaUu7S0d+kWk/mvm7oL8WGME3mp0cOYxwZo0t/i5jiVjAZrTyYVziVN
	cbjPyBbn5bwRtFoiffVLTbsmDI9uPtb4su9zoyKpSe5sS+2khZmzsKEObG4cUixE/3WEHUJyHAv2N
	z6km2R0GTXOmRLDym9bgTrT56f1EUKDVecIoCGMZahdkH7U4KaYsVxze+HBOw3v/RL67YHrtI/COa
	7l67AUs4ULbRuWp4K1hnrQXV1THQa/53et8x/+DqwJMdl0wE2SSYEPAGJzCYRw87sZ/QxdvcO3HFA
	DcUFiXYZ3wdY8oogqK3g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mIqMV-006awV-KW; Wed, 25 Aug 2021 10:42:27 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mIq8w-006UZm-64
 for linux-mediatek@lists.infradead.org; Wed, 25 Aug 2021 10:28:29 +0000
X-UUID: 686d25dd884e4204bde379ea56ffbce3-20210825
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:MIME-Version:Content-Type:References:In-Reply-To:Date:CC:To:From:Subject:Message-ID;
 bh=ljYjhZk7xODYifRKLlNuoAeWY2WaxL/PB579A6YFENM=; 
 b=bWqaWLmZ55cjGCFIOCVc4c8MHQaOnk+qyq/MJ4tQuzWkL4RB9P29PrpeU1A87iy7TdvQyRAizZQPTr93eW5ayRGrwVVG1W6jUQcpV6swy+FfKDGZq0As2I7CVJWfEFcAiMFuvMnTruVPDdD05wOFlFamgz6XFvF27sMoq02InYg=;
X-UUID: 686d25dd884e4204bde379ea56ffbce3-20210825
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw01.mediatek.com
 (envelope-from <houlong.wei@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 1487035527; Wed, 25 Aug 2021 03:28:24 -0700
Received: from MTKMBS33N2.mediatek.inc (172.27.4.76) by
 MTKMBS62DR.mediatek.inc (172.29.94.18) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Wed, 25 Aug 2021 03:28:22 -0700
Received: from MTKCAS36.mediatek.inc (172.27.4.186) by MTKMBS33N2.mediatek.inc
 (172.27.4.76) with Microsoft SMTP Server (TLS) id 15.0.1497.2;
 Wed, 25 Aug 2021 18:28:17 +0800
Received: from [10.17.3.153] (10.17.3.153) by MTKCAS36.mediatek.inc
 (172.27.4.170) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Wed, 25 Aug 2021 18:28:16 +0800
Message-ID: <1629887296.13994.1.camel@mhfsdcap03>
Subject: Re: [PATCH v3] media: mtk-vpu: Ensure alignment of 8 for DTCM buffer
From: houlong wei <houlong.wei@mediatek.com>
To: Dafna Hirschfeld <dafna.hirschfeld@collabora.com>
CC: "linux-media@vger.kernel.org" <linux-media@vger.kernel.org>,
 "linux-mediatek@lists.infradead.org" <linux-mediatek@lists.infradead.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "Alexandre
 Courbot" <acourbot@chromium.org>, "kernel@collabora.com"
 <kernel@collabora.com>, Enric Balletbo i Serra
 <enric.balletbo@collabora.com>, "hverkuil@xs4all.nl" <hverkuil@xs4all.nl>,
 "dafna3@gmail.com" <dafna3@gmail.com>, "mchehab@kernel.org"
 <mchehab@kernel.org>, "tfiga@chromium.org" <tfiga@chromium.org>, "Minghsiu
 Tsai =?UTF-8?Q?=28=E8=94=A1=E6=98=8E=E4=BF=AE=29?="
 <Minghsiu.Tsai@mediatek.com>, Andrew-CT Chen
 =?UTF-8?Q?=28=E9=99=B3=E6=99=BA=E8=BF=AA=29?= <Andrew-CT.Chen@mediatek.com>,
 Tiffany Lin =?UTF-8?Q?=28=E6=9E=97=E6=85=A7=E7=8F=8A=29?=
 <tiffany.lin@mediatek.com>, "matthias.bgg@gmail.com"
 <matthias.bgg@gmail.com>, "courbot@chromium.org" <courbot@chromium.org>,
 "hsinyi@chromium.org" <hsinyi@chromium.org>, "eizan@chromium.org"
 <eizan@chromium.org>, <houlong.wei@mediatek.com>
Date: Wed, 25 Aug 2021 18:28:16 +0800
In-Reply-To: <20210825101717.18075-1-dafna.hirschfeld@collabora.com>
References: <20210825101717.18075-1-dafna.hirschfeld@collabora.com>
X-Mailer: Evolution 3.10.4-0ubuntu2 
MIME-Version: 1.0
X-TM-SNTS-SMTP: 01E81F49704AFDF79AFC70AA7CA2ACF2B7B250A311999B359EA670EF2614D5452000:8
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210825_032826_296253_AEAFAC36 
X-CRM114-Status: GOOD (  18.35  )
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

On Wed, 2021-08-25 at 18:17 +0800, Dafna Hirschfeld wrote:
> From: Alexandre Courbot <acourbot@chromium.org>
> 
> When running memcpy_toio:
> memcpy_toio(send_obj->share_buf, buf, len);
> it was found that errors appear if len is not a multiple of 8:
> 
> [58.350841] mtk-mdp 14001000.rdma: processing failed: -22
> 
> This patch ensures the copy of a multile of 8 size by calling
> round_up(len, 8) when copying
> 
> Fixes: e6599adfad30 ("media: mtk-vpu: avoid unaligned access to DTCM buffer.")
> Signed-off-by: Alexandre Courbot <acourbot@chromium.org>
> Signed-off-by: Enric Balletbo i Serra <enric.balletbo@collabora.com>
> Signed-off-by: Dafna Hirschfeld <dafna.hirschfeld@collabora.com>
> ---

Reviewed-by: Houlong Wei <houlong.wei@mediatek.com>

> changes since v2:
> 1. do the extra copy only if len is not multiple of 8
> 
> changes since v1:
> 1. change sign-off-by tags
> 2. change values to memset
> 
>  drivers/media/platform/mtk-vpu/mtk_vpu.c | 11 ++++++++++-
>  1 file changed, 10 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/media/platform/mtk-vpu/mtk_vpu.c b/drivers/media/platform/mtk-vpu/mtk_vpu.c
> index ec290dde59cf..658161ee3e4e 100644
> --- a/drivers/media/platform/mtk-vpu/mtk_vpu.c
> +++ b/drivers/media/platform/mtk-vpu/mtk_vpu.c
> @@ -349,7 +349,16 @@ int vpu_ipi_send(struct platform_device *pdev,
>  		}
>  	} while (vpu_cfg_readl(vpu, HOST_TO_VPU));
>  
> -	memcpy_toio(send_obj->share_buf, buf, len);
> +	if (len % 8 != 0) {
> +		unsigned char data[SHARE_BUF_SIZE];
> +
> +		memset(data + len, 0, sizeof(data) - len);
> +		memcpy(data, buf, len);
> +		memcpy_toio(send_obj->share_buf, data, round_up(len, 8));
> +	} else {
> +		memcpy_toio(send_obj->share_buf, buf, len);
> +	}
> +
>  	writel(len, &send_obj->len);
>  	writel(id, &send_obj->id);
>  

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
