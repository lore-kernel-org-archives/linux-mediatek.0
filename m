Return-Path: <SRS0=w0xa=BA=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B034BC433E3
	for <linux-mediatek@archiver.kernel.org>; Tue, 21 Jul 2020 20:43:50 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 768FF20717
	for <linux-mediatek@archiver.kernel.org>; Tue, 21 Jul 2020 20:43:50 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="SaRCwOLJ";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="aplCMKmL"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 768FF20717
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=linaro.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:Message-ID:
	Subject:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=XQq2yebqWGGdsVa40zxT+Xg34pFtjSP/q94Zt2pag8w=; b=SaRCwOLJeE5L2iar2k46O7F9R
	XTt0QhDx9qqWFAPHEm70jHj7uDuoNKsWrzq22cChOTvBk+ehO/TvMYzt1ppobL1g4LFCSLE1bumIL
	inGHFlZFIp2mpzSHt7zJZD5zVEVWb7z0q6t+qfa4Pt9MmrLw+IzUmjf3T9hHB7SlDtFzGyvFhQKHy
	rRvLhRULtNjkuNO88ntwiMiQ2FXWuTHblVzWncVpbEKZ+48BbxxF1ubOxB+EHsl5PMXT3L492mOjm
	aX97JnNUWczQQWDdZW3L4grRG7EUhn83+BnRtL6kwyVyTn5JNhiV4Tm7PLOIUwakF/PZhag2EnGW5
	k52awzekw==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jxz6y-0006tt-8K; Tue, 21 Jul 2020 20:43:40 +0000
Received: from mail-pg1-x542.google.com ([2607:f8b0:4864:20::542])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jxz6v-0006sF-BA
 for linux-mediatek@lists.infradead.org; Tue, 21 Jul 2020 20:43:38 +0000
Received: by mail-pg1-x542.google.com with SMTP id e8so19207pgc.5
 for <linux-mediatek@lists.infradead.org>; Tue, 21 Jul 2020 13:43:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=6b3oA4UL1L2pl7xC9XCpGfPbFXbX6ZR3mQ/aH6nN3aM=;
 b=aplCMKmLtk1FND72f9eTw2pW0XV235w2d7abx0+nAqdK+5QHFUZUtqiXP3Y/5NfWwQ
 OP0koBCszYM3OjbRoWGb9J2n5jEHmqZ6iZvMjrdhubqs08gi7J2ZJm0AvaheIAChdgVe
 7MEKxT+pv82gNj/QbYrQIrC+ws3wQQ1yxdP7oGdDW+0Vgl/fKppwh3+V150QjFW7B0sR
 pfuiSebY5wKyIuGmulwut1717V7STCbyNn4pXsUhj1rO3Uw2IJGLCqE9RK2xBIl74F49
 isMNRqNjvPF38ITyYEMgKk4pMSMMY5Hw3R+VLWqG+e65UZgP/9R7FHaVotrNczHhVufX
 vhew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=6b3oA4UL1L2pl7xC9XCpGfPbFXbX6ZR3mQ/aH6nN3aM=;
 b=SqvJwWfMgfgYtjFumhQVSe47Kk0zI6EHRZhb08dMqogbVSQhU9c0HQQpoPEwrlTFKW
 SHqToE465xNpmoHX2FMPeT1/CitPjpbQhhs1rM/xbD5d2B7V6bBVVOJqXU02LCU6yPYh
 bIum4Oaty8fPkV2zI14N1s9vYmXSyYs6LcZSVyaowp6L5cv1FyV3WQJ2XBl/BiH/eNa7
 zi6fCWOvyZa2BLwjGDmSyKeQbpGDG6ZWxWy2vx1Z5gn/csrX+RMHcu2Uqth0fA6sDcce
 udKha3yiD5d/GUjHbDC0bgpca6N5LzHn0gfSwWIlO+M7T7h237RRbL0bAAX5vbPi0E+t
 O4bw==
X-Gm-Message-State: AOAM530ZonXp+abEwL9X1+py0nHTcmbOkzpMOL7sxq48qUDISamqMyoY
 +oaPjd50qJq2KIPdGmRZWEaY0Q==
X-Google-Smtp-Source: ABdhPJwuyrOyVT4KOawwJEajBAoNJgJsEKfBbYSabaXT83Sv4Y4Gqw+HTJiZ3dzR4rMofwR9hrMHZA==
X-Received: by 2002:aa7:9906:: with SMTP id z6mr26338877pff.60.1595364215284; 
 Tue, 21 Jul 2020 13:43:35 -0700 (PDT)
Received: from xps15 (S0106002369de4dac.cg.shawcable.net. [68.147.8.254])
 by smtp.gmail.com with ESMTPSA id z10sm21858949pfr.90.2020.07.21.13.43.34
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 21 Jul 2020 13:43:34 -0700 (PDT)
Date: Tue, 21 Jul 2020 14:43:32 -0600
From: Mathieu Poirier <mathieu.poirier@linaro.org>
To: Alexandre Bailon <abailon@baylibre.com>
Subject: Re: [PATCH 5/6] remoteproc: mtk_apu: Don't try to use the APU local
 RAM
Message-ID: <20200721204332.GC1227776@xps15>
References: <20200713132927.24925-1-abailon@baylibre.com>
 <20200713132927.24925-6-abailon@baylibre.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200713132927.24925-6-abailon@baylibre.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200721_164337_436455_8A67B4A0 
X-CRM114-Status: GOOD (  22.88  )
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

On Mon, Jul 13, 2020 at 03:29:26PM +0200, Alexandre Bailon wrote:
> Currently, this local RAM is not accessible from the CPU.
> If the CPU tries to access it, then the CPU will hang.
> 
> Remoteproc may try to use it when it load a firmware
> that has some sections in the local RAM.
> This workarounds the issue by skiping this section.
> 
> Signed-off-by: Alexandre Bailon <abailon@baylibre.com>
> ---
>  drivers/remoteproc/mtk_apu_rproc.c | 14 ++++++++++++++
>  1 file changed, 14 insertions(+)
> 
> diff --git a/drivers/remoteproc/mtk_apu_rproc.c b/drivers/remoteproc/mtk_apu_rproc.c
> index 565b3adca5de..e16d3258a785 100644
> --- a/drivers/remoteproc/mtk_apu_rproc.c
> +++ b/drivers/remoteproc/mtk_apu_rproc.c
> @@ -57,6 +57,9 @@
>  #define CORE_DEFAULT2_SPIDEN			BIT(0)
>  #define CORE_XTENSA_ALTRESETVEC			(0x000001F8)
>  
> +#define DRAM0_START				(0x7ff00000)
> +#define IRAM0_END				(0x7ff80000)
> +
>  struct mtk_vpu_rproc {
>  	struct device *dev;
>  	struct rproc *rproc;
> @@ -139,6 +142,7 @@ static void mtk_vpu_rproc_kick(struct rproc *rproc, int vqid)
>  
>  int mtk_vpu_elf_sanity_check(struct rproc *rproc, const struct firmware *fw)
>  {
> +	struct mtk_vpu_rproc *vpu_rproc = rproc->priv;
>  	const u8 *elf_data = fw->data;
>  	struct elf32_hdr *ehdr;
>  	struct elf32_phdr *phdr;
> @@ -156,6 +160,16 @@ int mtk_vpu_elf_sanity_check(struct rproc *rproc, const struct firmware *fw)
>  		/* Remove empty PT_LOAD section */
>  		if (phdr->p_type == PT_LOAD && !phdr->p_paddr)
>  			phdr->p_type = PT_NULL;
> +		/*
> +		 * Workaround: Currently, the CPU can't access to the APU
> +		 * local RAM. This removes the local RAM section from the
> +		 * firmware. Please note that may cause some issues.
> +		 */
> +		if (phdr->p_paddr >= DRAM0_START && phdr->p_paddr < IRAM0_END) {
> +			dev_warn_once(vpu_rproc->dev,
> +				      "Skipping the APU local RAM section\n");
> +			phdr->p_type = PT_NULL;

We can't selectively decide to not load sections of a program due to a platform
driver shortcoming.  Either a real solution is found or booting the remote
processor is interrupted, with a strong incline toward the former.

I guess you're dealing with tightly coupled memory or on-chip RAM areas -
both are accessed on other platform using ioremap_wc() or devm_ioremap_wc().
You might want to try doing what Suman has done in this patchset [1], with
specific attention to TCMs and SRAM.

Thanks,
Mathieu

[1]. https://patchwork.kernel.org/project/linux-remoteproc/list/?series=310325

> +		}
>  	}
>  
>  	return 0;
> -- 
> 2.26.2
> 

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
