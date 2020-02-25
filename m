Return-Path: <SRS0=J0Vt=4N=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.3 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 90B3AC35DE1
	for <linux-mediatek@archiver.kernel.org>; Tue, 25 Feb 2020 12:35:25 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 63A8820CC7
	for <linux-mediatek@archiver.kernel.org>; Tue, 25 Feb 2020 12:35:25 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="RaFQ6cEH";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=xs4all.nl header.i=@xs4all.nl header.b="DWYpM6Sc"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 63A8820CC7
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=xs4all.nl
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:
	Message-ID:From:References:To:Subject:Reply-To:Content-ID:Content-Description
	:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=aOQ0UKu+Zy+kw+PNYeM2fInUzByZe2nPH0qF5qWOZbA=; b=RaFQ6cEHLu+U+O
	j3oO2EyKiBhhA+7SNVXLXAODu4jhSCkM+ab/rzkVBtkJW0ykVtQzj6hM3PmpuDeR8mQW44UKXnjCO
	d32X08sWhOR4Y6EEgIYaGz/9XkP8jrDAobft2O8AINIsXEZDi5sGGIeyUDGpUlxktbVmTxELrQk4h
	PPmbuOOwmOmMJDNWDG+HoFQV6I1vFlS4EjSvZ559skzS/S1Ktn4w2/E2fzdzl07a3jv5IyaimbB7p
	0mRqVidH9YAwerqsABsCo/BqFwOVjak14E3/GgVM8ntm5tQ/b+eCNHGirDWq9RnRarXEVw1HxIymF
	qTrIf1Fct1wz7crNfMdA==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1j6ZQj-0001ii-IZ; Tue, 25 Feb 2020 12:35:17 +0000
Received: from lb2-smtp-cloud7.xs4all.net ([194.109.24.28])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1j6ZQR-0000Af-Ck; Tue, 25 Feb 2020 12:35:03 +0000
Received: from [IPv6:2001:420:44c1:2577:a473:ad6c:dd91:35d2]
 ([IPv6:2001:420:44c1:2577:a473:ad6c:dd91:35d2])
 by smtp-cloud7.xs4all.net with ESMTPA
 id 6ZQAjylQGjmHT6ZQDjWz1M; Tue, 25 Feb 2020 13:34:52 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=xs4all.nl; s=s1;
 t=1582634092; bh=CU5LnbxximNUnjWck66zq1CCdc9Wngm+ubQMrVPDvmg=;
 h=Subject:To:From:Message-ID:Date:MIME-Version:Content-Type:From:
 Subject;
 b=DWYpM6Scbd3BF7ijSg1uDfgcyhvJIZR3tZBwdPu0xIbVfjfUH/qT2YMAzBwofd3Z9
 Cs2cNy8fewHyYZHbuULL/vF7Rn/RnmSpe6XKJuboNCNN/LcWCDZF9TdWcmgjtE/0US
 B8XIum/n4ONfcBkUE8pdcdzMvHPEnlNwWVFjJ8pun3C/R2Ms3cg6gtUiPVLRkOcYxZ
 QYFCrZgIxA6UG8mymcMGIMwkcUb9oPXWs/z31KRaVCY0HE5tKWOJSF0hXeJoMz7DKx
 MCBvpsu3RQ6HUNXwaM30VfFBLEUGG6N7pFkcaBlZ6Y00wgee6bigwbqEX0wrzHqyxx
 EzqUBBCFweawA==
Subject: Re: [PATCH v2] media: mtk-vpu: avoid unaligned access to DTCM buffer.
To: Hsin-Yi Wang <hsinyi@chromium.org>, linux-arm-kernel@lists.infradead.org
References: <20200214120142.50529-1-hsinyi@chromium.org>
From: Hans Verkuil <hverkuil-cisco@xs4all.nl>
Message-ID: <2d5e3b57-cfac-de3a-e331-6ac9245e6640@xs4all.nl>
Date: Tue, 25 Feb 2020 13:34:42 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.5.0
MIME-Version: 1.0
In-Reply-To: <20200214120142.50529-1-hsinyi@chromium.org>
Content-Language: en-US
X-CMAE-Envelope: MS4wfCalW01R6rcPoKeE87B47crmHsfGvlZLqjnZu4sF2ZrGoDjqiAQm1z1qm/rcxWfkRMR7lQH/YcIHkrUNtHGuwzk092zH6bx7P4fY6qFbQIKyfFQr0NMU
 2C/Xmluza+HGflOXXJMYr5iAuldL4pW4fh4pmyQ51eGMuBE2B583nE67YaDb74odAXRr9tSW7zznZOYEgEsAQT3D+ei9zur7YPxj/QRhPBWnaubbMi46Kxu1
 dBrKkAolS+X2jMMdzaFtNyyzuVhfOHV8YKVjA9mCaAfgHqFZ+bI81jyBdO8mtiWiHmsxjpQiyEjcC0BwTsmtd0hGXAYtRCZHFp9GDGGcEBzv8mwrtJcAeQYS
 Qh1cmy7OkIRVde9+94QGNICkpjPh1PTJH6iKzjbv8Bg1UvxsDJBSHLDROF8wxjeQ7OAmA8BN5urIORqGc4+MJke0LvvxhLijzJJZXxEDReVx3oJm2EZPOmN5
 ivUSqchqQUiApMfLZDLF8Yp10p5i7PtG9rxGEPEk9DzgAK91efwuA9Lp3UrLq4WGU8jCEN3gauXTUmM+r634DUD/4nH3HHeuNO/tVUraP7muUnp9XLlMX1AC
 nvHOp50YlQ4m9g6M9VkwwqG1KCp/bv/XFs+Tkqd/ujo18QXVNWDcG6iPecO1g1+k/nbIPeT2ct7sfq99+PsGYkkQPl01XIKw0mvxaUAB8glGK1394VvfCqkp
 V80w4y0ZtMN+W2Tsyx7shWMgVB2gUBhn
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200225_043459_592261_60A8A715 
X-CRM114-Status: GOOD (  16.50  )
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
Cc: Andrew-CT Chen <andrew-ct.chen@mediatek.com>,
 Minghsiu Tsai <minghsiu.tsai@mediatek.com>,
 Enric Balletbo i Serra <enric.balletbo@collabora.com>,
 linux-kernel@vger.kernel.org, Houlong Wei <houlong.wei@mediatek.com>,
 Matthias Brugger <matthias.bgg@gmail.com>, linux-mediatek@lists.infradead.org,
 Mauro Carvalho Chehab <mchehab+samsung@kernel.org>,
 Tiffany Lin <tiffany.lin@mediatek.com>, linux-media@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On 2/14/20 1:01 PM, Hsin-Yi Wang wrote:
> struct vpu_run *run in vpu_init_ipi_handler() is an ioremapped DTCM (Data
> Tightly Coupled Memory) buffer shared with AP.  It's not able to do
> unaligned access. Otherwise kernel would crash due to unable to handle
> kernel paging request.
> 
> struct vpu_run {
> 	u32 signaled;
> 	char fw_ver[VPU_FW_VER_LEN];
> 	unsigned int	dec_capability;
> 	unsigned int	enc_capability;
> 	wait_queue_head_t wq;
> };
> 
> fw_ver starts at 4 byte boundary. If system enables
> CONFIG_HAVE_EFFICIENT_UNALIGNED_ACCESS, strscpy() will do
> read_word_at_a_time(), which tries to read 8-byte: *(unsigned long *)addr
> 
> Copy the string by memcpy_fromio() for this buffer to avoid unaligned
> access.
> 
> Fixes: 85709cbf1524 ("media: replace strncpy() by strscpy()")
> Signed-off-by: Hsin-Yi Wang <hsinyi@chromium.org>
> ---
> Change in v2:
> - fix sparse warnings.

I still get sparse warnings:

drivers/media/platform/mtk-vpu/mtk_vpu.c:710:47:  warning: incorrect type in argument 1 (different address spaces)
drivers/media/platform/mtk-mdp/mtk_mdp_vpu.c:66:32:  warning: incorrect type in argument 3 (incompatible argument 1 (different address spaces))
drivers/media/platform/mtk-vcodec/vdec_vpu_if.c:111:22:  warning: incorrect type in assignment (incompatible argument 1 (different address spaces))
drivers/media/platform/mtk-vcodec/venc_vpu_if.c:96:54:  warning: incorrect type in argument 3 (incompatible argument 1 (different address spaces))

Regards,

	Hans

> ---
>  drivers/media/platform/mtk-vpu/mtk_vpu.c | 17 ++++++++++-------
>  drivers/media/platform/mtk-vpu/mtk_vpu.h |  2 +-
>  2 files changed, 11 insertions(+), 8 deletions(-)
> 
> diff --git a/drivers/media/platform/mtk-vpu/mtk_vpu.c b/drivers/media/platform/mtk-vpu/mtk_vpu.c
> index a768707abb94..c59373e84a33 100644
> --- a/drivers/media/platform/mtk-vpu/mtk_vpu.c
> +++ b/drivers/media/platform/mtk-vpu/mtk_vpu.c
> @@ -600,15 +600,18 @@ int vpu_load_firmware(struct platform_device *pdev)
>  }
>  EXPORT_SYMBOL_GPL(vpu_load_firmware);
>  
> -static void vpu_init_ipi_handler(void *data, unsigned int len, void *priv)
> +static void vpu_init_ipi_handler(void __iomem *data, unsigned int len,
> +				 void *priv)
>  {
>  	struct mtk_vpu *vpu = (struct mtk_vpu *)priv;
> -	struct vpu_run *run = (struct vpu_run *)data;
> -
> -	vpu->run.signaled = run->signaled;
> -	strscpy(vpu->run.fw_ver, run->fw_ver, sizeof(vpu->run.fw_ver));
> -	vpu->run.dec_capability = run->dec_capability;
> -	vpu->run.enc_capability = run->enc_capability;
> +	struct vpu_run __iomem *run = data;
> +
> +	vpu->run.signaled = readl(&run->signaled);
> +	memcpy_fromio(vpu->run.fw_ver, run->fw_ver, sizeof(vpu->run.fw_ver));
> +	/* Make sure the string is NUL-terminated */
> +	vpu->run.fw_ver[sizeof(vpu->run.fw_ver) - 1] = '\0';
> +	vpu->run.dec_capability = readl(&run->dec_capability);
> +	vpu->run.enc_capability = readl(&run->enc_capability);
>  	wake_up_interruptible(&vpu->run.wq);
>  }
>  
> diff --git a/drivers/media/platform/mtk-vpu/mtk_vpu.h b/drivers/media/platform/mtk-vpu/mtk_vpu.h
> index d4453b4bcee9..a7ac351b19c1 100644
> --- a/drivers/media/platform/mtk-vpu/mtk_vpu.h
> +++ b/drivers/media/platform/mtk-vpu/mtk_vpu.h
> @@ -15,7 +15,7 @@
>   * VPU interfaces with other blocks by share memory and interrupt.
>   **/
>  
> -typedef void (*ipi_handler_t) (void *data,
> +typedef void (*ipi_handler_t) (void __iomem *data,
>  			       unsigned int len,
>  			       void *priv);
>  
> 


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
