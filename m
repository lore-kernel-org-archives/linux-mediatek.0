Return-Path: <SRS0=jUzJ=FH=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B32C8C4361A
	for <linux-mediatek@archiver.kernel.org>; Thu,  3 Dec 2020 16:34:33 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 43FD5206EC
	for <linux-mediatek@archiver.kernel.org>; Thu,  3 Dec 2020 16:34:33 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 43FD5206EC
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=linaro.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:Message-ID:
	Subject:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=ZBuU0AbR76cKyjupP01YzULn5Rqv5EJ+qN3jLACGjNg=; b=eaR0LLuC13v6udxFfSUxQoU+z
	56vuwmvy878NARvugeuf6wB5RBxhr7xzzs5WwztSp9uM3lcagXHaMKBJfTCWocBvNbGdaFEiHipc6
	l02EgX8XD3HQPQK6Jq7LeK2n1iSSq2zsAgizwFLe78ZlQOSjVmfPGQjGlU2rCVXIAwlbCI04ibitY
	BGlOsKwfwK9YkTHmVkjFOu7r7otYdsqLdXCUa15D2dfKJWef9QfigZCmbphMFM0uh7tPr29xX3TxZ
	2klQM0pMASJBNdJX2CvBT6dwFnCBQcXnyCU3Zfg2e0N64GKFhR3PAQ60gqwOxj2Oh2ofNv6rN5eNE
	Ep1J7SE2g==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kkrYn-0007Z9-3F; Thu, 03 Dec 2020 16:34:25 +0000
Received: from mail-pf1-x444.google.com ([2607:f8b0:4864:20::444])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kkrYi-0007X2-2T
 for linux-mediatek@lists.infradead.org; Thu, 03 Dec 2020 16:34:21 +0000
Received: by mail-pf1-x444.google.com with SMTP id b26so1646725pfi.3
 for <linux-mediatek@lists.infradead.org>; Thu, 03 Dec 2020 08:34:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=5GGsUtx8kHaJos54ZjmeEjtitiEQD73mc4B0/G5JBTs=;
 b=Xk2JDXafI8RssLwd0OIM6fQ/apU2/sUaKYG+5ilkeqfhocCwh7w6hUUy0s+/u5/p9q
 3d07hVS5akYFA4wMO8kasD2sjLSnrGCXpfuBHse7Qtmq5E4N+xnLz1uMhzG0tar4t+eq
 xgmQDQefe4btupIMMs97Zq3vvnDL2gMVVi7jN6AoyD5GvUAJg+R2eEyIxfmN8iCxL2Px
 OrkNiy0AMmbflovC5Q6mFysrpCUyGyWSPTacbWY6LUWopmeW8PFiLzTthgRV3KQimHJt
 PSWBzDxQcmajcirSzzutFYEn0ndXdapvPucoH0WwOvuGi7gpR/NBqan0/8n+0FFWkxdx
 mweQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=5GGsUtx8kHaJos54ZjmeEjtitiEQD73mc4B0/G5JBTs=;
 b=uHHbEdhFTLUGjcAi0bCMnqoppy3TYoCCo50H3AQy+i4oaLiSA37GvF0kekQP9/YUFB
 Kh4uWrhwPl8+p2GqAy//lHSyPxhSsxccN/i50HQ1OBGzt2eAQjEi5ALbCkrAXQPfausx
 tTQBfEHcOLl23wqqAt6ahITm/tN715284YIwIuOttPVmiBlTtb446yVubT3g2CaoYqlp
 GVcAx0fhckvFxdfBDbyjrwik75/aioUT/Jq6i2rOgP4GxSpgSBRJs7+D9guC7Abj6IXp
 1AlHMGQVLU7zWJiKMKzTvl+XrSRHcTqO3q3M76F0W1xFvfX+OB+ainCKxpTrg2XgACle
 2Skg==
X-Gm-Message-State: AOAM533hMLgw4j2KvZPiuL2DrRCVHsIWqhxKJZ9Py8oG2vsnMabF3Nt/
 Oqv4Ijl+sFscggYi6vXTf8HhwQ==
X-Google-Smtp-Source: ABdhPJw09oMrlxwfaCkfjUuibwFibHjd/OnkQyeG4nTh9nQBNuMxGiiaZLZW2eehd9qVBSkwFu4dyA==
X-Received: by 2002:a62:88c3:0:b029:18c:3203:efb7 with SMTP id
 l186-20020a6288c30000b029018c3203efb7mr3972241pfd.33.1607013257460; 
 Thu, 03 Dec 2020 08:34:17 -0800 (PST)
Received: from xps15 (S0106889e681aac74.cg.shawcable.net. [68.147.0.187])
 by smtp.gmail.com with ESMTPSA id g16sm2222234pfb.201.2020.12.03.08.34.16
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 03 Dec 2020 08:34:16 -0800 (PST)
Date: Thu, 3 Dec 2020 09:34:15 -0700
From: Mathieu Poirier <mathieu.poirier@linaro.org>
To: Tzung-Bi Shih <tzungbi@google.com>
Subject: Re: [PATCH v3] remoteproc/mediatek: unprepare clk if scp_before_load
 fails
Message-ID: <20201203163415.GA1389853@xps15>
References: <20201203155914.3844426-1-tzungbi@google.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20201203155914.3844426-1-tzungbi@google.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201203_113420_161967_6133A7BB 
X-CRM114-Status: GOOD (  17.00  )
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
Cc: ohad@wizery.com, linux-remoteproc@vger.kernel.org,
 bjorn.andersson@linaro.org, linux-mediatek@lists.infradead.org,
 pihsun@chromium.org, matthias.bgg@gmail.com,
 linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On Thu, Dec 03, 2020 at 11:59:14PM +0800, Tzung-Bi Shih wrote:
> Fixes the error handling to unprepare clk if scp_before_load fails.
> 
> Fixes: fd0b6c1ff85a ("remoteproc/mediatek: Add support for mt8192 SCP")
> Signed-off-by: Tzung-Bi Shih <tzungbi@google.com>

Reviewed-by: Mathieu Poirier <mathieu.poirier@linaro.org>

> ---
> Changes from v2[2]:
> - fix the "Fixes" tag format
> 
> Changes from v1[1]:
> - add "Fixes" tag
> - remove an unneeded change
> 
> [1]: https://patchwork.kernel.org/project/linux-remoteproc/patch/20201202044537.2500497-1-tzungbi@google.com/
> [2]: https://patchwork.kernel.org/project/linux-remoteproc/patch/20201203030436.3583198-1-tzungbi@google.com/
> 
>  drivers/remoteproc/mtk_scp.c | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/remoteproc/mtk_scp.c b/drivers/remoteproc/mtk_scp.c
> index 5f42b9ce7185..5e5705fe35a8 100644
> --- a/drivers/remoteproc/mtk_scp.c
> +++ b/drivers/remoteproc/mtk_scp.c
> @@ -350,9 +350,10 @@ static int scp_load(struct rproc *rproc, const struct firmware *fw)
>  
>  	ret = scp->data->scp_before_load(scp);
>  	if (ret < 0)
> -		return ret;
> +		goto leave;
>  
>  	ret = scp_elf_load_segments(rproc, fw);
> +leave:
>  	clk_disable_unprepare(scp->clk);
>  
>  	return ret;
> -- 
> 2.29.2.454.gaff20da3a2-goog
> 

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
