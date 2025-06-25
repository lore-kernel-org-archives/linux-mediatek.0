Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7D648C7115C
	for <linux-mediatek@archiver.kernel.org>; Wed, 25 Jun 2025 03:59:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=9o0KljyHVk+7sXYfHcEUOJPUxLqwYfEPoUFxmr/QpIE=; b=LKnDZ9jw97FgmMywZ3dHIluvd3
	8FzjvpnY/vkpeBuy5uCeoUUertTu68Y82lPOCU9DH2Vp4kk6WhGr0aFUt/XbpqFOxhvP2/pwfsE4Z
	RjAqK3k9hNb7cqVpxNjtK4nto6hPreR0AFMz8q1N14co0ETP350PCMEX3rsd1eGE4qgikqYdHckxt
	W8bubM+S7KZ4Ps2mCep8T0xbCkwTPsub5+kVJ0eVkkiBxOqrvKwGjaaR3pp5zQH6Ueut1HXpkIqxB
	26bFBjZcvQ41uiasfS3b0OihGsVUAWOLpyPXQhqr9Y3Pv69tZRahNHpyQBKtpPH2U7/NyQAPlgQ1S
	6lIC8gOQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uUHHx-00000007Rcg-3YTx;
	Wed, 25 Jun 2025 03:59:09 +0000
Received: from mail-pl1-x630.google.com ([2607:f8b0:4864:20::630])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uUHFc-00000007RUK-07p1
	for linux-mediatek@lists.infradead.org;
	Wed, 25 Jun 2025 03:56:45 +0000
Received: by mail-pl1-x630.google.com with SMTP id d9443c01a7336-234c5b57557so67351355ad.3
        for <linux-mediatek@lists.infradead.org>; Tue, 24 Jun 2025 20:56:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1750823803; x=1751428603; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=9o0KljyHVk+7sXYfHcEUOJPUxLqwYfEPoUFxmr/QpIE=;
        b=mN0E95gDo7hgGDRquZMz1ec8sVcnd5Oam0LgnzZ2vMRmJALtrrUYB+kMg0a+ET2DUY
         gDNhIsepGsV+zPhKZdH3usCUJWcXaNHFxCY43aUjhyWlyzu+m7zZWltj3F8P/tt3+OF3
         L0+Kre7PMDViVD5NCyTzBgFjOvO+64OGXzP/Y=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750823803; x=1751428603;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=9o0KljyHVk+7sXYfHcEUOJPUxLqwYfEPoUFxmr/QpIE=;
        b=wZaSkQ29tt+y7FE7GEPgVe9oFTdvpQjqdbJcRPqHExKin0tQEAHVuy1nTtd2izu/sw
         r5QeF+RF2MwIcDgXzl3lh/CQT/DbWzM80UKoFcO6rgNoJJnGgvUWnSRAaDog0CJDS3wC
         EUTA7FlwPH7GojlLJdfgHpx81TH+1+fNuFno5cuSml5SkiE6Gqa864rDYZknp1xLRdf9
         5Im47WDlRsmSTEd21u7gy+Hk8wa/FuTDoxc9LeO4CuXpzb9PSO+r2qM7+1pyzZR6VX2L
         2WS+JZJA2I0ZDAXBqbeANzZYIiNDyubeJC6oOIMKKMteJdaZ4L3VPciMnzLy4CirQWAT
         RLKg==
X-Forwarded-Encrypted: i=1; AJvYcCUSgD/yNHgIDjQD6CCXYQCwLMcsb0SxPSbIlrarbw0PoIZhHEtdbF2y+WMuML1DZhJD0UK0ku0q/2I3c402xQ==@lists.infradead.org
X-Gm-Message-State: AOJu0Yzbp9TAKx6SD1sIIkyCOcnN3tcNQuR1BPmSBQKgtVhvIrAz3FKw
	62ID+WyX7Fws3u3ulJEJX/HWVJ2PmTKP5DCyQr7kz6XUauv65RRI15ybrZAbkqPcug==
X-Gm-Gg: ASbGncsc2XVlJPu2MJo1HaNqcnzizlY85AWB5xNMW16rf0sBpboFsDsBSmJxkdz0Nl1
	9ToYl7ho60/fB4xNJq2jmfXEQOqH4wmJ6qF2krMf/itnGfDe+UloDKa8dthZZYfS+hMcyM3ysE8
	GksGW9Wk1zxZA5KtakqaoUe5G6OscS+MbbQxHZ8LQ7TcvEgBiTVAUSKL9a5LlPbKv9SGXY0cg/F
	8mNSkihy0QV0H7iKpXlu4RGofHm6rpQtRZbr+wspSZLChbwT7gDeSQoCt2P0hNXUqVGEIK3JxlJ
	3E6uvj+s2D/A9g00P9lMQBoPjQCx1jYLTY3pzN2D3+4C5ZWq07YsLynCyuvR9Z6t+A==
X-Google-Smtp-Source: AGHT+IG+CeEoTYFYhlYaB+yW8OoKCv/2xwINqlcoXHtLLRpl6uhTmRRfAU8psN49GXJz73OFHB26Yw==
X-Received: by 2002:a17:903:1b2f:b0:234:c5c1:9b7a with SMTP id d9443c01a7336-23823f65e32mr21155175ad.8.1750823802811;
        Tue, 24 Jun 2025 20:56:42 -0700 (PDT)
Received: from google.com ([2401:fa00:8f:203:301e:ee9a:3fb5:c761])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-237d875bc8asm118910865ad.258.2025.06.24.20.56.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Jun 2025 20:56:42 -0700 (PDT)
Date: Wed, 25 Jun 2025 12:56:37 +0900
From: Sergey Senozhatsky <senozhatsky@chromium.org>
To: "Masami Hiramatsu (Google)" <mhiramat@kernel.org>
Cc: Chaotian Jing <chaotian.jing@mediatek.com>, 
	Ulf Hansson <ulf.hansson@linaro.org>, Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, Tomasz Figa <tfiga@chromium.org>, 
	Sergey Senozhatsky <senozhatsky@chromium.org>, linux-mmc@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org
Subject: Re: [PATCH] mtk-sd: Prevent memory corruption from DMA map failure
Message-ID: <kgxqtfdrlc5m5kgprjajt4xtngken2u2locauzhsxm7kcowusa@44ncy4vhy5vx>
References: <174972756982.3337526.6755001617701603082.stgit@mhiramat.tok.corp.google.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <174972756982.3337526.6755001617701603082.stgit@mhiramat.tok.corp.google.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250624_205644_158579_AC34F54C 
X-CRM114-Status: GOOD (  13.94  )
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

On (25/06/12 20:26), Masami Hiramatsu (Google) wrote:
[..]
> +static bool msdc_data_prepared(struct mmc_data *data)
> +{
> +	return data->host_cookie & MSDC_PREPARE_FLAG;
> +}
> +
>  static void msdc_unprepare_data(struct msdc_host *host, struct mmc_data *data)
>  {
>  	if (data->host_cookie & MSDC_ASYNC_FLAG)
> @@ -1466,8 +1471,18 @@ static void msdc_ops_request(struct mmc_host *mmc, struct mmc_request *mrq)
>  	WARN_ON(!host->hsq_en && host->mrq);
>  	host->mrq = mrq;
>  
> -	if (mrq->data)
> +	if (mrq->data) {
>  		msdc_prepare_data(host, mrq->data);
> +		if (!msdc_data_prepared(mrq->data)) {
> +			/*
> +			 * Failed to prepare DMA area, fail fast before
> +			 * starting any commands.
> +			 */
> +			mrq->cmd->error = -ENOSPC;
> +			mmc_request_done(mmc_from_priv(host), mrq);

Do we end up having a stale/dangling host->mrq pointer here?

> +			return;
> +		}
> +	}
>  
>  	/* if SBC is required, we have HW option and SW option.
>  	 * if HW option is enabled, and SBC does not have "special" flags,
> 

