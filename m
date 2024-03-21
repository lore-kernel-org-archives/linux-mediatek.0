Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 38935C54E68
	for <linux-mediatek@archiver.kernel.org>; Thu, 21 Mar 2024 15:25:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=82OI8Gh7oQu/9StlFoR10DICm6BhP8N6L+l5Ik+ILaw=; b=uEfsexeQQVtQFm4qJuIxZYgHXj
	M+hpkVtibS2nah9SY/OjEYDxF21qUrlfgHE+o1BTMWpe+J1p6R1j2rWbDO83h7qgCub5q1nR0bx8B
	Iz+rrLt5MD0Cb4A0dafnG5SDf4+ggIQknEsX4LBM1vEtvTrpxpfprv5snwRppcDHGn0ZFrVuV0pNU
	6y9/KU6pymCCTnaihrpGfTWQmzFyYWTTvwQiglEzCNTxqahVm5z725J2Op8YWWh6pE8R9+QA+NTir
	9Vo0PfIirwhAe0XveBF4da3OowE9QReIE0l5Z/9u4Jk9s6Q6pJZ1MdlfXarHqotw6PXGgP04N1s27
	bTPwi8Iw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rnKIQ-00000003Su3-3AZx;
	Thu, 21 Mar 2024 15:25:34 +0000
Received: from mail-pf1-x429.google.com ([2607:f8b0:4864:20::429])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rnKIK-00000003SqX-3rU9
	for linux-mediatek@lists.infradead.org;
	Thu, 21 Mar 2024 15:25:30 +0000
Received: by mail-pf1-x429.google.com with SMTP id d2e1a72fcca58-6e6f6d782e4so909350b3a.0
        for <linux-mediatek@lists.infradead.org>; Thu, 21 Mar 2024 08:25:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1711034726; x=1711639526; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=82OI8Gh7oQu/9StlFoR10DICm6BhP8N6L+l5Ik+ILaw=;
        b=PDAut2y444hByL2MuYF988Jbx2rscz3qN/WH99xeuuAQbCWktQ0LdLAyS080v+kdNl
         3cL1Z4FTO73yD9DzE9sbC87P4+DYOb6pw10lNmrOwKM501pu3ZnrWknIweZZvzrvPtUJ
         s6flO3x/SoCciCMOnDipq4JIqBEklOBxRG+WQbS8rcGJskkQlPrHwAMT0CXch6hIjPfx
         agYC3VTdbbON+kgKVq2CPKbGrZC50FarE/0jJ5AOcDvV2UgEyVqy7Mdgz5XMSkweWDhw
         NMltA/qzO19km7p5fxRKEHUdwdEIlBwdfV4r2YXmJcikiMPIM7Wvy+a8/4+NIM8Bg68Q
         s1Nw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1711034726; x=1711639526;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=82OI8Gh7oQu/9StlFoR10DICm6BhP8N6L+l5Ik+ILaw=;
        b=FG+nLxRw11pW94qNU6PqFHPtqH3tm/9poloHxduKtq00JVjZhPid0hsko5XnwtrI12
         1Ai7wS/eKUB0u4VzRF0KueCqZM+bhnPzVYycgA9cheEG43NdncHM1qHBsjVuBfmPpvxl
         L4ehU3Pc/AAHahigKAWnNQ6ziDhDDLvp3x4AktoT64jirwttsNHy1+b6BvGjtiNuByo5
         WS6kghhw1HuJF9TUCIFiVGexf8AncP2h2xqIdJlVPQiDHgE47A2hsAIOoebXG3ab+YpJ
         SYlXKKCVQYqO6tIG32RDnxPmJJoHMzX0v9npff2o6Wr0xfqVanDKE6/c+EDk28QX/34d
         w/tA==
X-Forwarded-Encrypted: i=1; AJvYcCXTPKIH2pIPwvsg6R+Ga/pg/7DVePS6LRWScQa15ScqGZY7B1iljqWCDeUSpjHpPJ43ucoQz+wLuGadskXabBDvPvt/2bblUHKkWUhUxeESqSwl
X-Gm-Message-State: AOJu0YzWEalDmgG7zrblgidWX/4/m8qEeslvI/8SuvqYs+ccfC722FG2
	YZDlBBjplu44+8HmxyMn6kCBwAr/5NEeQMHIEKnu/GsjV7pT93w6+dk/FhTn9Ro=
X-Google-Smtp-Source: AGHT+IEmFIp+48D2B1hUzpIyAXGeGOM1HqTNVM5BMRBIcH3HZOKodw1pu3F3fpANojgpouNGrD0GsQ==
X-Received: by 2002:a05:6a00:3d42:b0:6e6:a3b3:923c with SMTP id lp2-20020a056a003d4200b006e6a3b3923cmr2898786pfb.6.1711034726278;
        Thu, 21 Mar 2024 08:25:26 -0700 (PDT)
Received: from p14s ([2604:3d09:148c:c800:d9a2:e52:d93:c759])
        by smtp.gmail.com with ESMTPSA id fi37-20020a056a0039a500b006e69a142458sm13534453pfb.213.2024.03.21.08.25.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 21 Mar 2024 08:25:25 -0700 (PDT)
Date: Thu, 21 Mar 2024 09:25:23 -0600
From: Mathieu Poirier <mathieu.poirier@linaro.org>
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: andersson@kernel.org, matthias.bgg@gmail.com, tzungbi@kernel.org,
	tinghan.shen@mediatek.com, linux-remoteproc@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org, wenst@chromium.org,
	kernel@collabora.com
Subject: Re: [PATCH 1/2] remoteproc: mediatek: Make sure IPI buffer fits in
 L2TCM
Message-ID: <ZfxRY475SKaRYVTj@p14s>
References: <20240321084614.45253-1-angelogioacchino.delregno@collabora.com>
 <20240321084614.45253-2-angelogioacchino.delregno@collabora.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240321084614.45253-2-angelogioacchino.delregno@collabora.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240321_082528_969188_9A52D785 
X-CRM114-Status: GOOD (  24.12  )
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
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

Good day,

On Thu, Mar 21, 2024 at 09:46:13AM +0100, AngeloGioacchino Del Regno wrote:
> The IPI buffer location is read from the firmware that we load to the
> System Companion Processor, and it's not granted that both the SRAM
> (L2TCM) size that is defined in the devicetree node is large enough
> for that, and while this is especially true for multi-core SCP, it's
> still useful to check on single-core variants as well.
> 
> Failing to perform this check may make this driver perform R/W
> oeprations out of the L2TCM boundary, resulting (at best) in a

s/oeprations/operations

I will fix that when I apply the patch.

> kernel panic.
> 
> To fix that, check that the IPI buffer fits, otherwise return a
> failure and refuse to boot the relevant SCP core (or the SCP at
> all, if this is single core).
> 
> Fixes: 3efa0ea743b7 ("remoteproc/mediatek: read IPI buffer offset from FW")
> Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
> ---
>  drivers/remoteproc/mtk_scp.c | 10 +++++++++-
>  1 file changed, 9 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/remoteproc/mtk_scp.c b/drivers/remoteproc/mtk_scp.c
> index a35409eda0cf..67518291a8ad 100644
> --- a/drivers/remoteproc/mtk_scp.c
> +++ b/drivers/remoteproc/mtk_scp.c
> @@ -132,7 +132,7 @@ static int scp_elf_read_ipi_buf_addr(struct mtk_scp *scp,
>  static int scp_ipi_init(struct mtk_scp *scp, const struct firmware *fw)
>  {
>  	int ret;
> -	size_t offset;
> +	size_t buf_sz, offset;
>  
>  	/* read the ipi buf addr from FW itself first */
>  	ret = scp_elf_read_ipi_buf_addr(scp, fw, &offset);
> @@ -144,6 +144,14 @@ static int scp_ipi_init(struct mtk_scp *scp, const struct firmware *fw)
>  	}
>  	dev_info(scp->dev, "IPI buf addr %#010zx\n", offset);
>  
> +	/* Make sure IPI buffer fits in the L2TCM range assigned to this core */
> +	buf_sz = sizeof(*scp->recv_buf) + sizeof(*scp->send_buf);
> +
> +	if (scp->sram_size < buf_sz + offset) {
> +		dev_err(scp->dev, "IPI buffer does not fit in SRAM.\n");
> +		return -EOVERFLOW;
> +	}
> +
>  	scp->recv_buf = (struct mtk_share_obj __iomem *)
>  			(scp->sram_base + offset);
>  	scp->send_buf = (struct mtk_share_obj __iomem *)
> -- 
> 2.44.0
> 

