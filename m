Return-Path: <SRS0=w0xa=BA=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A59B8C433DF
	for <linux-mediatek@archiver.kernel.org>; Tue, 21 Jul 2020 20:21:49 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 70B0B20720
	for <linux-mediatek@archiver.kernel.org>; Tue, 21 Jul 2020 20:21:49 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="SU+fsy/L";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="tCHfjNfY"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 70B0B20720
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=linaro.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:Message-ID:
	Subject:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=bMzl32JRN0B8KrmfbtH2siJZgpJAeb3SZdZcpWd0AFY=; b=SU+fsy/LXFokmBXnsYPsS/ZFc
	pqz5C5m2/5f/VoMvFA2oEuM5v6/TU6IXM8fM0MUDw6E86D4s7OnOzv5MwGOk8hu4UVYYAi5FuHo+r
	uplimg0ivmvf/gS/fvnqvLi/q1b51c2G2+EmJwbRKlbmh1g8qw1f9MKzHfn/cVOVHKGZ9axxcesFV
	3gMcQKdX6ZaBALdlxeDfTcxzvu7TWLlhrrpNdHtxewbGf1TjSszo5rODrIs0IIp1stnWZfbD4EDGP
	cLAJ9CJPYab1pdIAMEkfkXUFrSSHUgKpA45JI3CZ+QyauNzEazNM7Z7NXt0u48J+UzBuKQytyNQL1
	8bN9MzLRg==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jxylg-0005Er-RI; Tue, 21 Jul 2020 20:21:40 +0000
Received: from mail-pl1-x641.google.com ([2607:f8b0:4864:20::641])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jxyla-0005Db-5v
 for linux-mediatek@lists.infradead.org; Tue, 21 Jul 2020 20:21:34 +0000
Received: by mail-pl1-x641.google.com with SMTP id x8so10737217plm.10
 for <linux-mediatek@lists.infradead.org>; Tue, 21 Jul 2020 13:21:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=yz8Pn1+0L8o3BW9wpfpvX9tjdPGaAfKllQBX5CrlbQA=;
 b=tCHfjNfYorbKQEm370wu+jdtqr5TvIQgpuBB45Meg4+6fvhDoSy7tjjQ60WD2XSNa3
 VAGHh2UdTa2UOJPsZ69yp3xCXwzso7pk7mtlf6iVxZwd0UkCe8sc1QItaFmzwclayQy4
 /OP3wFrzmne7MneChKgBMj45sambaMnWKho/Tx3GUMzt2xp9UDVwYZIMR0bTlqDB/BhQ
 4htZmZDIpFHd9nayV/wqx0K84Mm+EHMrjWGnwrMmW3Kl5KnSagx7zOeNzuG96jpcKRRg
 gRcgYXztpjnImvOH+bttP99fbubzOEUGNg3OKwCh5wVDVwAE1TZyN3/TuzHsST3VtgdS
 3nbw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=yz8Pn1+0L8o3BW9wpfpvX9tjdPGaAfKllQBX5CrlbQA=;
 b=nt25scklWViGoVEviGVRlsjVjv0XE852PWgljTTXfL4/ySbuZ90nj9zNxUH1GGpPrg
 3onzBsSHZELc09KXuyOsrR1bKw3KaIWt8pZ8GRklsI9UxnbAr2nknKhaLmirUjX7sgaC
 b7cstY9RuhspNHlgtZTQso3WqDk0ohit+VPQJDvjlwK5yn+LuQbJmLtxU/kNQV6/4yLZ
 pJM7ErC/WQa9uHkrgP3lhAlCHiZyJwAf46ypbGx6vF2L0z8ZH2TS/wof11rfE0VsOaYv
 3aXIzzSltqPITP/zvxP5ULI1mgOZUSH84h2LUkD+UJ076puArt4++UqhgKf7zrlO/KnZ
 aUbg==
X-Gm-Message-State: AOAM5307WXgQnRTat0iSiYMFVV+6DcHJS6n+fUBdWjsc0Xfy1nxCekgj
 6ljR/jumNDjeuAEcWOW1UWGcoQ==
X-Google-Smtp-Source: ABdhPJytqLVViBfMVx0NR9p31f2ZvvL3YV4+D+msQxUeUSoE+b4kNfAIQ8/jDFn0Tw3ueffWJro/wA==
X-Received: by 2002:a17:90a:290e:: with SMTP id
 g14mr6723735pjd.85.1595362889850; 
 Tue, 21 Jul 2020 13:21:29 -0700 (PDT)
Received: from xps15 (S0106002369de4dac.cg.shawcable.net. [68.147.8.254])
 by smtp.gmail.com with ESMTPSA id t1sm19324221pgq.66.2020.07.21.13.21.28
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 21 Jul 2020 13:21:29 -0700 (PDT)
Date: Tue, 21 Jul 2020 14:21:27 -0600
From: Mathieu Poirier <mathieu.poirier@linaro.org>
To: Alexandre Bailon <abailon@baylibre.com>
Subject: Re: [PATCH 4/6] remoteproc: mtk_vpu_rproc: Don't try to load empty
 PT_LOAD segment
Message-ID: <20200721202127.GB1227776@xps15>
References: <20200713132927.24925-1-abailon@baylibre.com>
 <20200713132927.24925-5-abailon@baylibre.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200713132927.24925-5-abailon@baylibre.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200721_162134_320024_5F5A89C2 
X-CRM114-Status: GOOD (  20.09  )
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
Cc: ohad@wizery.com, devicetree@vger.kernel.org,
 linux-remoteproc@vger.kernel.org, linux-kernel@vger.kernel.org,
 bjorn.andersson@linaro.org, robh+dt@kernel.org,
 linux-mediatek@lists.infradead.org, matthias.bgg@gmail.com,
 linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On Mon, Jul 13, 2020 at 03:29:25PM +0200, Alexandre Bailon wrote:
> The firmware generated by our toolchain contains many empty PT_LOAD
> segments. The elf loader don't manage it and will raise an error:
> "bad phdr da 0x0 mem 0x0".
> To workaround it, implement the sanity_check callback to detect the
> empty PT_LOAD segment and change it to PT_NULL.
> In that way, the elf load won't try to load the segment.

This patch doesn't address the real problem, which are empty load segments.  In
my opinion that should be dealt with rather than having to patch things up.  On
the flip side I suspect that you don't control all the process and that systems
are out there with faulty fw images.  As such:

Reviewed-by: Mathieu Poirier <mathieu.poirier@linaro.org>

> 
> Signed-off-by: Alexandre Bailon <abailon@baylibre.com>
> ---
>  drivers/remoteproc/mtk_apu_rproc.c | 35 +++++++++++++++++++++++++++---
>  1 file changed, 32 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/remoteproc/mtk_apu_rproc.c b/drivers/remoteproc/mtk_apu_rproc.c
> index f2342b747a35..565b3adca5de 100644
> --- a/drivers/remoteproc/mtk_apu_rproc.c
> +++ b/drivers/remoteproc/mtk_apu_rproc.c
> @@ -137,10 +137,39 @@ static void mtk_vpu_rproc_kick(struct rproc *rproc, int vqid)
>  	vpu_write32(vpu_rproc, CORE_CTL_XTENSA_INT, 1 << vqid);
>  }
>  
> +int mtk_vpu_elf_sanity_check(struct rproc *rproc, const struct firmware *fw)
> +{
> +	const u8 *elf_data = fw->data;
> +	struct elf32_hdr *ehdr;
> +	struct elf32_phdr *phdr;
> +	int ret;
> +	int i;
> +
> +	ret = rproc_elf_sanity_check(rproc, fw);
> +	if (ret)
> +		return ret;
> +
> +	ehdr = (struct elf32_hdr *)elf_data;
> +	phdr = (struct elf32_phdr *)(elf_data + ehdr->e_phoff);
> +
> +	for (i = 0; i < ehdr->e_phnum; i++, phdr++) {
> +		/* Remove empty PT_LOAD section */
> +		if (phdr->p_type == PT_LOAD && !phdr->p_paddr)
> +			phdr->p_type = PT_NULL;
> +	}
> +
> +	return 0;
> +}
> +
>  static const struct rproc_ops mtk_vpu_rproc_ops = {
> -	.start		= mtk_vpu_rproc_start,
> -	.stop		= mtk_vpu_rproc_stop,
> -	.kick		= mtk_vpu_rproc_kick,
> +	.start			= mtk_vpu_rproc_start,
> +	.stop			= mtk_vpu_rproc_stop,
> +	.kick			= mtk_vpu_rproc_kick,
> +	.load			= rproc_elf_load_segments,
> +	.parse_fw		= rproc_elf_load_rsc_table,
> +	.find_loaded_rsc_table	= rproc_elf_find_loaded_rsc_table,
> +	.sanity_check		= mtk_vpu_elf_sanity_check,
> +	.get_boot_addr		= rproc_elf_get_boot_addr,
>  };
>  
>  static irqreturn_t mtk_vpu_rproc_callback(int irq, void *data)
> -- 
> 2.26.2
> 

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
