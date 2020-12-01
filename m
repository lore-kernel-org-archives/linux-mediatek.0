Return-Path: <SRS0=+qQs=FF=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 880B2C64E7B
	for <linux-mediatek@archiver.kernel.org>; Tue,  1 Dec 2020 19:03:31 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id DD28220643
	for <linux-mediatek@archiver.kernel.org>; Tue,  1 Dec 2020 19:03:30 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="c4Yjnwzw";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="O0OwCKEK"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org DD28220643
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=linaro.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:Message-ID:
	Subject:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=Ie/TX7tCs4PSDeBHf72kv4OUUeWzGQ/dGofMNbngzKw=; b=c4YjnwzwtHEzrCm/97uT3jRGT
	VqC8QB6wQZyS7vsft5juxmGDQx4NK++q6f7g/EJV1L7i/oUIjf3k1/e0GtiM9muUuZUV+pE6/VAMG
	htHcsEnp4RhEKNn+XoM2cZ7e3lhwvqwbgXBDSJXQaHGrH6kdq6vdVoLTUoS8kpVvE8xnn5BD3hsrM
	YKscPzwU/jo9oxaZOmLyWpObG35/JXagzls86eli4Z+PPt5CWLyalmHjorfeZZBZXFInuJWZxyyEW
	dJiiyGeigyKK40OCamOXJKqBQvrKJb0QAXi0QvSVmLEeH23QEJKDaKy5wUcObeYyGikE9GJ8jwV5S
	LveHN4GOg==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kkAvq-0001Vz-F9; Tue, 01 Dec 2020 19:03:22 +0000
Received: from mail-pf1-x442.google.com ([2607:f8b0:4864:20::442])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kkAvn-0001V7-D6
 for linux-mediatek@lists.infradead.org; Tue, 01 Dec 2020 19:03:21 +0000
Received: by mail-pf1-x442.google.com with SMTP id q10so1742355pfn.0
 for <linux-mediatek@lists.infradead.org>; Tue, 01 Dec 2020 11:03:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=dtf455/t34x5CwfMQp7oSe523N3AnWbHqI9Sms1Ad9Q=;
 b=O0OwCKEKjtUDkcYZoew6BD4OTP1hfydMfTg2SBCmKALnrBevpHRMdC38nkQXP2VC8d
 u/0sRcHD/7yR0gd8MvcDqgBfIt9fI6Hv09KxXv8N5v59LmuLVudIfnRYs4yeeZhS9YCi
 MpacYUSmCmHQT9FJT/VVd7VUwbzJ0/0lzQSx7XlT4zoZKbhNecXaX+ntT0x+d6WKmI2S
 E1CIaHlZuYOuMVp9qfUEufbNZiWTwQ6+2A5yVd+Txz6QzFMY5uYcHUTp5m3/7+Ub+Uud
 4d2zUbiEukAQkoWFnk3VNy4lbSFjPaHu79yVnSw0GtrxKINViGKzj03V1asywKCBsuIZ
 CvUQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=dtf455/t34x5CwfMQp7oSe523N3AnWbHqI9Sms1Ad9Q=;
 b=KjQAOLhRCA+rY992l67h63Y6yjcuwqgi2eVqpuG1TLhKDkfaElZpBU9OCTKk7mYi4j
 JwwJ/sin2mxKNBzUBVXUFzKwuQ1wxI0KwibhHVwxtznxv6Hv+kk5YJgmnIjflEWPoWbD
 X0W8DOLweD/2BsIssGaqKBXpdzTDw/giSsiqpa4JyAlRbJxzxWIW5wK5Vo/y35p/K8Xe
 TkWyhFNwPcVKsZoXizjdBstzXaNIoveMBhmCbCdYuhzTvI5GJAJYWaX5/8USh0tPBeKB
 CR/wDgn1QX0g7iKljhZs1mj3mmmhQQy3/cWbe7hgJhJ6OgLSs1Qo2j25uQ5MLLX9Iqde
 2+MQ==
X-Gm-Message-State: AOAM530oADUBo7kgYjqHDZTr3+aLI2GC/bhMarY66h2AbZcbeuCe7L54
 iSHWgXsMS1dhw1JXm34mpYL1ww==
X-Google-Smtp-Source: ABdhPJy800xS/+1S4z3Avm+17m3LdNjcXDQ5fBEZDpXz/zVxlLXrh+xOAa1k1exkMU2sOx5IHDmpPg==
X-Received: by 2002:a62:fb01:0:b029:19a:f68a:49bf with SMTP id
 x1-20020a62fb010000b029019af68a49bfmr4090989pfm.64.1606849394874; 
 Tue, 01 Dec 2020 11:03:14 -0800 (PST)
Received: from xps15 (S0106889e681aac74.cg.shawcable.net. [68.147.0.187])
 by smtp.gmail.com with ESMTPSA id 5sm335634pgm.57.2020.12.01.11.03.13
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 01 Dec 2020 11:03:14 -0800 (PST)
Date: Tue, 1 Dec 2020 12:03:12 -0700
From: Mathieu Poirier <mathieu.poirier@linaro.org>
To: Tzung-Bi Shih <tzungbi@google.com>
Subject: Re: [PATCH v3] remoteproc/mediatek: read IPI buffer offset from FW
Message-ID: <20201201190312.GA1240310@xps15>
References: <20201130034025.3232229-1-tzungbi@google.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20201130034025.3232229-1-tzungbi@google.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201201_140319_767100_453F6A97 
X-CRM114-Status: GOOD (  28.40  )
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
Cc: ohad@wizery.com, erin.lo@mediatek.com, linux-remoteproc@vger.kernel.org,
 bjorn.andersson@linaro.org, linux-mediatek@lists.infradead.org,
 pihsun@chromium.org, matthias.bgg@gmail.com,
 linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On Mon, Nov 30, 2020 at 11:40:25AM +0800, Tzung-Bi Shih wrote:
> Reads the IPI buffer offset from the FW binary.  The information resides
> in addr of .ipi_buffer section.
> 
> Moves scp_ipi_init() to scp_load() phase.  The IPI buffer can be
> initialized only if the offset is clear.
> 
> To backward compatible to MT8183 SCP, specify the offset in the board
> specific mtk_scp_of_data.  Reads the default offset if the firmware
> doesn't have it.
> 
> Signed-off-by: Tzung-Bi Shih <tzungbi@google.com>
> ---
> Previous discussion:
> https://patchwork.kernel.org/project/linux-remoteproc/patch/20201127092941.1646260-1-tzungbi@google.com/
> 
> Changes from v2:
> - to backward-compatible, reads the default offset if the firmware doesn't
>   have it
> 
>  drivers/remoteproc/mtk_common.h |  2 +
>  drivers/remoteproc/mtk_scp.c    | 79 +++++++++++++++++++++++----------
>  2 files changed, 57 insertions(+), 24 deletions(-)
> 
> diff --git a/drivers/remoteproc/mtk_common.h b/drivers/remoteproc/mtk_common.h
> index b3397d327786..5169ddce2dc7 100644
> --- a/drivers/remoteproc/mtk_common.h
> +++ b/drivers/remoteproc/mtk_common.h
> @@ -78,6 +78,8 @@ struct mtk_scp_of_data {
>  
>  	u32 host_to_scp_reg;
>  	u32 host_to_scp_int_bit;
> +
> +	size_t ipi_buf_offset;
>  };
>  
>  struct mtk_scp {
> diff --git a/drivers/remoteproc/mtk_scp.c b/drivers/remoteproc/mtk_scp.c
> index 5f42b9ce7185..5392c2fff682 100644
> --- a/drivers/remoteproc/mtk_scp.c
> +++ b/drivers/remoteproc/mtk_scp.c
> @@ -21,7 +21,7 @@
>  #include "remoteproc_internal.h"
>  
>  #define MAX_CODE_SIZE 0x500000
> -#define SCP_FW_END 0x7C000
> +#define SECTION_NAME_IPI_BUFFER ".ipi_buffer"
>  
>  /**
>   * scp_get() - get a reference to SCP.
> @@ -119,16 +119,29 @@ static void scp_ipi_handler(struct mtk_scp *scp)
>  	wake_up(&scp->ack_wq);
>  }
>  
> -static int scp_ipi_init(struct mtk_scp *scp)
> +static int scp_elf_read_ipi_buf_addr(struct mtk_scp *scp,
> +				     const struct firmware *fw,
> +				     size_t *offset);
> +
> +static int scp_ipi_init(struct mtk_scp *scp, const struct firmware *fw)
>  {
> -	size_t send_offset = SCP_FW_END - sizeof(struct mtk_share_obj);
> -	size_t recv_offset = send_offset - sizeof(struct mtk_share_obj);
> +	int ret;
> +	size_t offset;
> +
> +	/* read the ipi buf addr from FW itself first */
> +	ret = scp_elf_read_ipi_buf_addr(scp, fw, &offset);
> +	if (ret) {
> +		/* use default ipi buf addr if the FW doesn't have it */
> +		offset = scp->data->ipi_buf_offset;
> +		if (!offset)
> +			return ret;
> +	}
> +	dev_info(scp->dev, "IPI buf addr %#010zx\n", offset);
>  
> -	/* shared buffer initialization */
> -	scp->recv_buf =
> -		(struct mtk_share_obj __iomem *)(scp->sram_base + recv_offset);
> -	scp->send_buf =
> -		(struct mtk_share_obj __iomem *)(scp->sram_base + send_offset);
> +	scp->recv_buf = (struct mtk_share_obj __iomem *)
> +			(scp->sram_base + offset);
> +	scp->send_buf = (struct mtk_share_obj __iomem *)
> +			(scp->sram_base + offset + sizeof(*scp->recv_buf));
>  	memset_io(scp->recv_buf, 0, sizeof(*scp->recv_buf));
>  	memset_io(scp->send_buf, 0, sizeof(*scp->send_buf));
>  
> @@ -271,6 +284,32 @@ static int scp_elf_load_segments(struct rproc *rproc, const struct firmware *fw)
>  	return ret;
>  }
>  
> +static int scp_elf_read_ipi_buf_addr(struct mtk_scp *scp,
> +				     const struct firmware *fw,
> +				     size_t *offset)
> +{
> +	struct elf32_hdr *ehdr;
> +	struct elf32_shdr *shdr, *shdr_strtab;
> +	int i;
> +	const u8 *elf_data = fw->data;
> +	const char *strtab;
> +
> +	ehdr = (struct elf32_hdr *)elf_data;
> +	shdr = (struct elf32_shdr *)(elf_data + ehdr->e_shoff);
> +	shdr_strtab = shdr + ehdr->e_shstrndx;
> +	strtab = (const char *)(elf_data + shdr_strtab->sh_offset);
> +
> +	for (i = 0; i < ehdr->e_shnum; i++, shdr++) {
> +		if (strcmp(strtab + shdr->sh_name,
> +			   SECTION_NAME_IPI_BUFFER) == 0) {
> +			*offset = shdr->sh_addr;
> +			return 0;
> +		}
> +	}
> +
> +	return -ENOENT;
> +}
> +
>  static int mt8183_scp_before_load(struct mtk_scp *scp)
>  {
>  	/* Clear SCP to host interrupt */
> @@ -350,11 +389,15 @@ static int scp_load(struct rproc *rproc, const struct firmware *fw)
>  
>  	ret = scp->data->scp_before_load(scp);
>  	if (ret < 0)
> -		return ret;
> +		goto leave;
>  
>  	ret = scp_elf_load_segments(rproc, fw);
> -	clk_disable_unprepare(scp->clk);
> +	if (ret)
> +		goto leave;
>  
> +	ret = scp_ipi_init(scp, fw);

This version is much better.  Since this is effectively what is going on,
please put this (along with clock related requirements) in rproc_ops::parse_fw.

Thanks,
Mathieu

> +leave:
> +	clk_disable_unprepare(scp->clk);
>  	return ret;
>  }
>  
> @@ -680,19 +723,6 @@ static int scp_probe(struct platform_device *pdev)
>  		goto release_dev_mem;
>  	}
>  
> -	ret = clk_prepare_enable(scp->clk);
> -	if (ret) {
> -		dev_err(dev, "failed to enable clocks\n");
> -		goto release_dev_mem;
> -	}
> -
> -	ret = scp_ipi_init(scp);
> -	clk_disable_unprepare(scp->clk);
> -	if (ret) {
> -		dev_err(dev, "Failed to init ipi\n");
> -		goto release_dev_mem;
> -	}
> -
>  	/* register SCP initialization IPI */
>  	ret = scp_ipi_register(scp, SCP_IPI_INIT, scp_init_ipi_handler, scp);
>  	if (ret) {
> @@ -760,6 +790,7 @@ static const struct mtk_scp_of_data mt8183_of_data = {
>  	.scp_stop = mt8183_scp_stop,
>  	.host_to_scp_reg = MT8183_HOST_TO_SCP,
>  	.host_to_scp_int_bit = MT8183_HOST_IPC_INT_BIT,
> +	.ipi_buf_offset = 0x7bdb0,
>  };
>  
>  static const struct mtk_scp_of_data mt8192_of_data = {
> -- 
> 2.29.2.454.gaff20da3a2-goog
> 

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
