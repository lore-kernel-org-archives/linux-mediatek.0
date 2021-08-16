Return-Path: <SRS0=ZvcN=NH=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,
	URIBL_BLOCKED,USER_AGENT_SANE_2 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E5360C4338F
	for <linux-mediatek@archiver.kernel.org>; Mon, 16 Aug 2021 06:49:48 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id B5E5461A6F
	for <linux-mediatek@archiver.kernel.org>; Mon, 16 Aug 2021 06:49:48 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org B5E5461A6F
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Date:CC:To:From:Subject:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=znpNmjgHx7FmOCLDgQpiuMUB7ub7fL+NsAGi/xiUWxs=; b=Wza48oOn9ZaY+M
	36GzWmclByNqjBQk9YV3YVtlcwUYjQ/+E5QImcdJ3NTpqkhBpZFPa3S9xF5BexuQN+82/Rbn3gCDN
	Fnmyu0HqMW/hI6d/F0Xau8CCiR0Vo/WeZSzh8ob3SRxMHnoSGyQZIsDKo8uLYkP9cz1wmde0lKp9o
	pUUjMZ+aHpWrb39XM9z5I0/U7XuvcnhvBSqbvi1fWmjXx8uTuqXbceHWgaQ4ALN6GNIVd8nn6Nm2S
	9kb1dw/l4arMZOKOuSaBuA07OpOS3GNOBeZvLnilg93X/HB9bpPKEzqPYif2KdMoAx+hxgvMR6bvV
	OMJDbu0fJRYHZQNMAmyQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mFWRD-00GHZo-NU; Mon, 16 Aug 2021 06:49:35 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mFWOg-00GGRT-HX
 for linux-mediatek@lists.infradead.org; Mon, 16 Aug 2021 06:47:02 +0000
X-UUID: 0827915710ad400a803d8c50781775c9-20210815
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:MIME-Version:Content-Type:References:In-Reply-To:Date:CC:To:From:Subject:Message-ID;
 bh=12//E0MrCca/AisDc97mnYI9peKrrOex0Lod2WXevtQ=; 
 b=ssV5h5u8EZW1zd9G1ePs3eVH5JNCm1zmIaRx0YE/J818wXBjfxdvaOggHc08CB3aWCOIdkUaGp+pnCJYlxFPq8Jc4jgVEAYSNJbQRAk35FDFeoIjVqeAlY5dfj4vd5rYQSR27o7mL6RvOPKuNqnkMP6ScxCBhLcvhq9TXE2KV64=;
X-UUID: 0827915710ad400a803d8c50781775c9-20210815
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw01.mediatek.com
 (envelope-from <houlong.wei@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 1286090953; Sun, 15 Aug 2021 23:46:53 -0700
Received: from MTKMBS33N2.mediatek.inc (172.27.4.76) by
 MTKMBS62N2.mediatek.inc (172.29.193.42) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Sun, 15 Aug 2021 23:38:13 -0700
Received: from MTKCAS36.mediatek.inc (172.27.4.186) by MTKMBS33N2.mediatek.inc
 (172.27.4.76) with Microsoft SMTP Server (TLS) id 15.0.1497.2;
 Mon, 16 Aug 2021 14:38:01 +0800
Received: from mhfsdcap04 (10.17.3.154) by MTKCAS36.mediatek.inc
 (172.27.4.170) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Mon, 16 Aug 2021 14:38:00 +0800
Message-ID: <76560e846d084f89e37cc8ccd7ca714e539c2803.camel@mediatek.com>
Subject: Re: [PATCH v2] media: mtk-vpu: Ensure alignment of 8 for DTCM buffer
From: houlong wei <houlong.wei@mediatek.com>
To: Dafna Hirschfeld <dafna.hirschfeld@collabora.com>,
 "linux-media@vger.kernel.org" <linux-media@vger.kernel.org>,
 "linux-mediatek@lists.infradead.org" <linux-mediatek@lists.infradead.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
CC: Alexandre Courbot <acourbot@chromium.org>, Enric Balletbo i Serra
 <enric.balletbo@collabora.com>, "hverkuil@xs4all.nl" <hverkuil@xs4all.nl>,
 "kernel@collabora.com" <kernel@collabora.com>, "dafna3@gmail.com"
 <dafna3@gmail.com>, "mchehab@kernel.org" <mchehab@kernel.org>,
 "tfiga@chromium.org" <tfiga@chromium.org>, Minghsiu Tsai
 =?UTF-8?Q?=28=E8=94=A1=E6=98=8E=E4=BF=AE=29?= <Minghsiu.Tsai@mediatek.com>,
 Andrew-CT Chen =?UTF-8?Q?=28=E9=99=B3=E6=99=BA=E8=BF=AA=29?=
 <Andrew-CT.Chen@mediatek.com>, Tiffany Lin
 =?UTF-8?Q?=28=E6=9E=97=E6=85=A7=E7=8F=8A=29?= <tiffany.lin@mediatek.com>,
 "matthias.bgg@gmail.com" <matthias.bgg@gmail.com>, "courbot@chromium.org"
 <courbot@chromium.org>, "hsinyi@chromium.org" <hsinyi@chromium.org>,
 "eizan@chromium.org" <eizan@chromium.org>, <houlong.wei@mediatek.com>
Date: Mon, 16 Aug 2021 14:38:01 +0800
In-Reply-To: <20210806082810.9378-1-dafna.hirschfeld@collabora.com>
References: <20210806082810.9378-1-dafna.hirschfeld@collabora.com>
X-Mailer: Evolution 3.28.5-0ubuntu0.18.04.2 
MIME-Version: 1.0
X-TM-SNTS-SMTP: 771D58D45B93244CED2E1141867E5E3129C614AEA2FA04CE8851AE9F5553180F2000:8
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210815_234658_655965_06193C46 
X-CRM114-Status: GOOD (  19.80  )
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

On Fri, 2021-08-06 at 16:28 +0800, Dafna Hirschfeld wrote:
> From: Alexandre Courbot <acourbot@chromium.org>
> 
> When running memcpy_toio:
> memcpy_toio(send_obj->share_buf, buf, len);
> it was found that errors appear if len is not a multiple of 8:
> 
> [58.350841] mtk-mdp 14001000.rdma: processing failed: -22
> 
> This patch ensure copy of a multile of 8 size by calling
> round_up(len, 8) when copying
> 
> Fixes: e6599adfad30 ("media: mtk-vpu: avoid unaligned access to DTCM
> buffer.")
> Signed-off-by: Alexandre Courbot <acourbot@chromium.org>
> Signed-off-by: Enric Balletbo i Serra <enric.balletbo@collabora.com>
> Signed-off-by: Dafna Hirschfeld <dafna.hirschfeld@collabora.com>
> ---
> changes since v1:
> 1. change sign-off-by tags
> 2. change values to memset
> 
>  drivers/media/platform/mtk-vpu/mtk_vpu.c | 5 ++++-
>  1 file changed, 4 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/media/platform/mtk-vpu/mtk_vpu.c
> b/drivers/media/platform/mtk-vpu/mtk_vpu.c
> index ec290dde59cf..66276c5a1bc3 100644
> --- a/drivers/media/platform/mtk-vpu/mtk_vpu.c
> +++ b/drivers/media/platform/mtk-vpu/mtk_vpu.c
> @@ -316,6 +316,7 @@ int vpu_ipi_send(struct platform_device *pdev,
>  {
>  	struct mtk_vpu *vpu = platform_get_drvdata(pdev);
>  	struct share_obj __iomem *send_obj = vpu->send_buf;
> +	unsigned char data[SHARE_BUF_SIZE];
>  	unsigned long timeout;
>  	int ret = 0;
>  
> @@ -349,7 +350,9 @@ int vpu_ipi_send(struct platform_device *pdev,
>  		}
>  	} while (vpu_cfg_readl(vpu, HOST_TO_VPU));
>  
> -	memcpy_toio(send_obj->share_buf, buf, len);
> +	memset(data + len, 0, sizeof(data) - len);
> +	memcpy(data, buf, len);
> +	memcpy_toio(send_obj->share_buf, data, round_up(len, 8));

Hi Dafna,

Thanks for your patch.
In this patch, the data is copied twice even if the 'len' is mulitple
of 8. Can we judge the alignment and decide to copy once or twice ? 
Like below, which may reduce the latency of this function a bit when
'len' is multiple of 8.
if (unlikely((len % 8) != 0)) {
	unsigned char data[SHARE_BUF_SIZE];
	
	memset(data + len, 0, sizeof(data) - len);
	memcpy(data, buf, len);
	memcpy_toio(send_obj->share_buf, data, round_up(len, 8));
} else {
	memcpy_toio(send_obj->share_buf, buf, len);
}


Regards,
Houlong

>  	writel(len, &send_obj->len);
>  	writel(id, &send_obj->id);
>  
> -- 
> 2.17.1

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
