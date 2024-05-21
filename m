Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CA6ECC25B74
	for <linux-mediatek@archiver.kernel.org>; Tue, 21 May 2024 16:47:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=PZAIDSZz5noc6if4QKqooN9MLNYkeL9UbakI+8iRBos=; b=KJZJJovb/xMMEb17UTFEI+jbw5
	gUdZWTy9PR4A1o/sQqmRD/BgJyoiLK2MjNXZ6Fhtb2ceDO5CHjYw2TpIAqxeAaEsspUgShIC7/e3a
	ChEoVxYOhfZx/XiW1ZRXOFCb6EVUcji+N9eYb1hZ15pHkwmfUOXLLqvwsoP/E5ockwI4QM9xj8Otr
	pQbYLq0id75pDmb+oivuEeFaIWMSMqHyDxYp9CQgUy/PVPmOsAMlWp01giNis1So3dd8fK3WBbeka
	xkogPk4NHs/OrJyNK5kKNeNRPEGRuzOg3JCQqDIsxcGrWlR7VP61AcILh5ew3tId72bJ8R667dIZi
	dJDcz5KQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s9SeN-00000000YOM-3b2n;
	Tue, 21 May 2024 16:47:43 +0000
Received: from mail-pf1-x431.google.com ([2607:f8b0:4864:20::431])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s9SeK-00000000YNb-47O3
	for linux-mediatek@lists.infradead.org;
	Tue, 21 May 2024 16:47:42 +0000
Received: by mail-pf1-x431.google.com with SMTP id d2e1a72fcca58-6f44881ad9eso525993b3a.3
        for <linux-mediatek@lists.infradead.org>; Tue, 21 May 2024 09:47:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1716310056; x=1716914856; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=PZAIDSZz5noc6if4QKqooN9MLNYkeL9UbakI+8iRBos=;
        b=s/cW5O6LM9ERWWMjmUhL78Gg3dA3MQ0RyOyz24HIQMSyf9YpXqc4FbS67ulnbx6h1x
         JM+D1F9/lG7pyKB6FcQYhzfRlUbHAjLkC730rEweyE4hVLWXHZmxQ6uSUIbB+/CIfjNE
         M9zrWQ/E/xcQMWHPPqrTwiDdu3liCCIgaGt4+E5I22puq975fPidH/0UuCo2LGaMEpP7
         8Gs8Vk5GivpgT28qpTKZkfGGieZ2b362OCt+l5BXgJetw7ZNOutF7zZyGfZkDyvlxWBN
         NqsNvQ+kahVj7u7LQKsaUUk5jf3hNh+0gtwdMWjXFpJb0aKzbj8BVpEz7MUTqbm4Gdcc
         uFqw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1716310056; x=1716914856;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=PZAIDSZz5noc6if4QKqooN9MLNYkeL9UbakI+8iRBos=;
        b=sCVXcDPYgoJBqi6xQKbiagb9lxDG9WnmBYnj1Bzqmp9Hp5D7uOclNrDzawlegqjYhy
         lUILc7HOkp+M+7LYmPuYUhn1rfSh2w+UbbjtkbSU5y4YkyV51qzQ0TLFgzkrLv9E6hbR
         ISnLSHa3BFg0DJW36KPwFEoNAWivbQWSYYUcsUNcfQjcFlHB5Yk29kKYCH51uxizU9OG
         wxIPblYy3bqRs5HiOegPD9Gx0o3/FCl43LWLp7/hBo0obZPD58wwCstm/g5Kg/NUONWr
         ZNw3CQFp45G1rKAqor/K0CtNGVn/Qfs7QciepUZjQ+foV+1JmXY+fHKnrcjkTzA7ul34
         6m4Q==
X-Forwarded-Encrypted: i=1; AJvYcCVqj6ic8C55uT+YPVlHDqcZ/vF0l0eEXBInrJS/w6eRXfSCXwIa7Hyp3hEkAVBA3FYxONWA9XivFGfg2w6nRGulFByWp4h9G/Yz5CGF24kEV07F
X-Gm-Message-State: AOJu0Yx6Um/+N6IrGI+76R0goiucIMVc9s972hkMP+wsIxlYHEBs3OqW
	mrKste17VLEpPAaiTxW37LzfFOj3kx4Y6IID9YkmohyIXEX7kxy/MNcpzvXAWNM=
X-Google-Smtp-Source: AGHT+IEM61ROSOw0CzG0X8FSdmCEEg6WGFlarYhclikyQ2fR7QmVIqgP4xaOcvcYDgnr0vf49H+LBA==
X-Received: by 2002:a05:6a00:2284:b0:6ee:1d68:d33 with SMTP id d2e1a72fcca58-6f4e02ca2abmr35478343b3a.15.1716310056526;
        Tue, 21 May 2024 09:47:36 -0700 (PDT)
Received: from p14s ([2604:3d09:148c:c800:df1a:22de:40b2:f110])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-6584e7897bdsm9707304a12.21.2024.05.21.09.47.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 21 May 2024 09:47:36 -0700 (PDT)
Date: Tue, 21 May 2024 10:47:33 -0600
From: Mathieu Poirier <mathieu.poirier@linaro.org>
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: andersson@kernel.org, matthias.bgg@gmail.com,
	linux-remoteproc@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org, kernel@collabora.com
Subject: Re: [PATCH] remoteproc: mediatek: Zero out only remaining bytes of
 IPI buffer
Message-ID: <ZkzQJepyjPz4Su+k@p14s>
References: <20240520112724.139945-1-angelogioacchino.delregno@collabora.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240520112724.139945-1-angelogioacchino.delregno@collabora.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240521_094741_048494_55138366 
X-CRM114-Status: GOOD (  14.32  )
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

On Mon, May 20, 2024 at 01:27:24PM +0200, AngeloGioacchino Del Regno wrote:
> In scp_ipi_handler(), instead of zeroing out the entire shared
> buffer, which may be as large as 600 bytes, overwrite it with the
> received data, then zero out only the remaining bytes.
> 
> Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
> ---
>  drivers/remoteproc/mtk_scp.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/remoteproc/mtk_scp.c b/drivers/remoteproc/mtk_scp.c
> index e5214d43181e..dc70cf7db44d 100644
> --- a/drivers/remoteproc/mtk_scp.c
> +++ b/drivers/remoteproc/mtk_scp.c
> @@ -117,8 +117,8 @@ static void scp_ipi_handler(struct mtk_scp *scp)
>  		return;
>  	}
>  
> -	memset(scp->share_buf, 0, scp_sizes->ipi_share_buffer_size);
>  	memcpy_fromio(scp->share_buf, &rcv_obj->share_buf, len);
> +	memset(&scp->share_buf[len], 0, scp_sizes->ipi_share_buffer_size - len);

I will apply this patch when rc1 comes out next week.

Thanks,
Mathieu

>  	handler(scp->share_buf, len, ipi_desc[id].priv);
>  	scp_ipi_unlock(scp, id);
>  
> -- 
> 2.45.1
> 

