Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E377DC636D3
	for <linux-mediatek@archiver.kernel.org>; Sun, 12 Feb 2023 20:24:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=HWFilNanFTJVAlWw1g+V6egLGtcyns2owNf2QnUOtlw=; b=O1Hn1McsDFIl+5x0iIWcYqOhP2
	VAF7rKq+0CaunsxGKJ0w/JjH9KwIUkdlks4t+eRYWYi/QAwAIyLin4YEvARWL/TG3rQf1iEi4HxfO
	mO5/InOSxJP2AE9yJy5kNux6dKH79A7U+m4PJapTie+8fDn4sAzwtri4pcUKUmQRiVxD/qaWVNKcn
	3Suuksqh6LWvCXSYk33m5m8s5yLnC72R/wHUqNwHstxeaLSmbzrAlzX3bI/kN4+ZV+Sciot9juQBQ
	xOw4qugqnvgaPLD9waFaTXnLm2zLXu6qiKpV7lgiuOQbsqZ5+rf/1AibkrTuk2rxyftEx1zncYK/1
	X9LwuXYQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pRItS-00CGZg-S8; Sun, 12 Feb 2023 20:24:15 +0000
Received: from mail-pj1-x1036.google.com ([2607:f8b0:4864:20::1036])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pRItQ-00CGYn-2I
	for linux-mediatek@lists.infradead.org; Sun, 12 Feb 2023 20:24:13 +0000
Received: by mail-pj1-x1036.google.com with SMTP id f16-20020a17090a9b1000b0023058bbd7b2so10359845pjp.0
        for <linux-mediatek@lists.infradead.org>; Sun, 12 Feb 2023 12:24:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=HWFilNanFTJVAlWw1g+V6egLGtcyns2owNf2QnUOtlw=;
        b=xIoeiysSVuOwzvHR2WqylR52/VFPJD8QO7aSMzAG3vsUdQ6ku/KCjEFhbvyOi7gp+F
         ehZP+1uD9OGRznzjLNGSNa8MFEGCMwr+AKeEDDDDTslECNoGkaVzzYqYD4AHo0Y/T17K
         3sRYUcwc0rvCF7OAwrk26/m9l87ytWMQoYaVv5PqPmW0VAiP3KqNg9kj4OJTFWKffF/k
         uMVXczGpvPNo7ev/VDa5mc2NXgrO3LUNogegQacTyz0nXFCNdpeDkDqidwZPS9KmUNGi
         mXVdRSnshsnkHqv56iV0s+RL1fYO6+v3AzKQapq0R4kSA+rGTU4iL23+zXFEtrLPe98a
         SDZg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=HWFilNanFTJVAlWw1g+V6egLGtcyns2owNf2QnUOtlw=;
        b=vm4sqx8RQzKn1fRH26dtLrtb5IAF+7MmE0l355CDmWMGgs1PC+Tlpra9Hv3mu6kxli
         cPwJ2fqXkdv+ekyhtb6BLAhXq3t0QpiWRPNFCgqR0dBH45tJwjZ0Yy4vYpSfLfeO73bw
         mCJt4L+fIKkj3/ILqkx0KYQ4p/oHDpRr+7vhHYBy0xUwKDVEiuOfKSZn0bPlbxBV5vUc
         /hpyFHjvvpFimTFgRLFVRzJa3bs9woFMn2pWuICFUvtWpqL7M7zEPViKhdUnx+V1QyB+
         Gc+WRwFjyLfCeY3h2kQKqh0w5wQUA6hmGIR6hv7Vs+5zGOf9PBMYHothvdGHvAx33W0R
         hwVg==
X-Gm-Message-State: AO0yUKXAaZcOZ1yWwyqLPafyd24gGlZgP2vanId7GD2OqoHp1x+S3ziD
	sBPK+7n/nk7uLxG8s6xq60le5w==
X-Google-Smtp-Source: AK7set8zTR5ia6k+GSss5gMoHr+xULpIqmDtvcfml6k8ThLqQ/yaeMPpmag80oG2dnErsUif+Th3vQ==
X-Received: by 2002:a05:6a20:1453:b0:c2:4766:2b59 with SMTP id a19-20020a056a20145300b000c247662b59mr25045910pzi.21.1676233449184;
        Sun, 12 Feb 2023 12:24:09 -0800 (PST)
Received: from p14s ([2604:3d09:148c:c800:ee79:a5b1:b638:330c])
        by smtp.gmail.com with ESMTPSA id j14-20020aa7928e000000b0058d8db0e4adsm6705528pfa.171.2023.02.12.12.24.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 12 Feb 2023 12:24:08 -0800 (PST)
Date: Sun, 12 Feb 2023 13:24:06 -0700
From: Mathieu Poirier <mathieu.poirier@linaro.org>
To: Tinghan Shen <tinghan.shen@mediatek.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	linux-remoteproc@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	Project_Global_Chrome_Upstream_Group@mediatek.com
Subject: Re: [PATCH v1] remoteproc: mediatek: Check the SCP image format
Message-ID: <20230212202406.GA236598@p14s>
References: <20230210031354.1335-1-tinghan.shen@mediatek.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230210031354.1335-1-tinghan.shen@mediatek.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230212_122412_165761_B88763A9 
X-CRM114-Status: GOOD (  14.72  )
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

On Fri, Feb 10, 2023 at 11:13:54AM +0800, Tinghan Shen wrote:
> Do a sanity check on the SCP image before loading it to avoid
> driver crashes.
> 
> Signed-off-by: Tinghan Shen <tinghan.shen@mediatek.com>
> ---
>  drivers/remoteproc/mtk_scp.c | 1 +
>  1 file changed, 1 insertion(+)
> 

I have applied this patch.

Thanks,
Mathieu

> diff --git a/drivers/remoteproc/mtk_scp.c b/drivers/remoteproc/mtk_scp.c
> index d421a2ccaa1e..0861b76f185f 100644
> --- a/drivers/remoteproc/mtk_scp.c
> +++ b/drivers/remoteproc/mtk_scp.c
> @@ -649,6 +649,7 @@ static const struct rproc_ops scp_ops = {
>  	.load		= scp_load,
>  	.da_to_va	= scp_da_to_va,
>  	.parse_fw	= scp_parse_fw,
> +	.sanity_check	= rproc_elf_sanity_check,
>  };
>  
>  /**
> -- 
> 2.18.0
> 

