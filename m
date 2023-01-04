Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CA6B4C46467
	for <linux-mediatek@archiver.kernel.org>; Thu,  5 Jan 2023 02:17:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=rSa3y2kVtXyGfcBV6KdEhTjbXDEsZrA1QZe8gseBjok=; b=lB1Y9XS8EUjm5ke47JFjEsHdJQ
	pzk2KkR4V/kXUFYXW16Y6ur1Y7IJnZMev9VvsRIFpFMuU+nP0M91k6YqXWhMz1viyJcJ4seOxNjew
	bH9f+zw6IUUElUfGiQO06MNUwCFBvs/oll2UHu6JqmyV3dcYJ3fTcn5BDXqBkRk4cAPJIJOKgoVU3
	mkaHFOSYlfkjNaR8dTOxH2MydJWFp7WKv6ctjmRDUJSi9af/FBRpShVLD9JCXqt9iV1CK8EvM4M7v
	HYDYrgpGvdKz4Cp8Y602MCLkOwIIba2fUk1x42W3nnUkAfsnaaSCpxWeB07JNh80d3s/+Ujly+tm1
	4ahShTIw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pDFp3-00GXyn-VJ; Thu, 05 Jan 2023 02:17:37 +0000
Received: from mail-pj1-x102e.google.com ([2607:f8b0:4864:20::102e])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pDCXr-00Ct8E-DU
	for linux-mediatek@lists.infradead.org; Wed, 04 Jan 2023 22:47:43 +0000
Received: by mail-pj1-x102e.google.com with SMTP id o7-20020a17090a0a0700b00226c9b82c3aso97553pjo.3
        for <linux-mediatek@lists.infradead.org>; Wed, 04 Jan 2023 14:47:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=rSa3y2kVtXyGfcBV6KdEhTjbXDEsZrA1QZe8gseBjok=;
        b=pdyU5nNwLPBCT14Il41JLXWCOGGjzhZ4+/GNaRyCvoxhZxkZmU4IXOpTTppmn/l7+m
         H6wQXscp6yQEha0x4Im1vXl/LkEmw3hm1SugtqM17JUzmrfKImfohf5zBk5FUs58OB3q
         exz/fJi8zcAHdS4uiEK9t4dx3lQsHNPSchD5KnhuGwT/o7CCDMvrU/hMcYVzbTaS35nE
         9+dQRxUAXzGlXEbQGM+omi47Y/9m9f5Y7us2U2xh00UMTdwQQVPAn41osB1UB2HeDRA1
         6+aDcvEkCLucxEV9EDI93yOaPLK6QEHwPvxkajgsNNX+W3EhSHKPA72kjjhwDQZooPhY
         j1+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=rSa3y2kVtXyGfcBV6KdEhTjbXDEsZrA1QZe8gseBjok=;
        b=o8svDNADlrYirY0OhMwnAaDiuZXG/vC2Ryu+FRLZlh3uDCpZw4iddQRQOGiKPLKlg+
         HBwWp72X2SSAYD0FXgEvJyh/eVoTTnzT/UJsGd1wsa//9QIsrGUWxxnmvrkYGf2Gd2Y9
         1LhJhn8GqsXHUtVktbKLmONS+uWTuRjSNtTCM2y7JG07493Zo9Dyo3aRTN8N3VSigeZQ
         mfo3BtCxZ4tH+5GrsgLsXzXsjmkVSgoZPoIEvG0Anf5+XsCGvI8TbqwtvELCaHv5SPCe
         aWYHWXIoDhV60/GqJUs1b7Et66fUy/uwlcwQCP7FYboXAwKuOdGGB8DsEoIfZmMbXg11
         eMag==
X-Gm-Message-State: AFqh2krHCL0cEbMDtdxgoGO10Bdt1FhLgUF3RvPzp6TXCnet0iIx5qWP
	jA48QKCTUilxBUexTy+tHD3sYQ==
X-Google-Smtp-Source: AMrXdXunaxUnZdko3CQ/sTo/WkLccuHLO8jxYV96IN/3Yhs/EMlXwL0hEXVd2h6ymN2kv2e8H7xYPw==
X-Received: by 2002:a05:6a21:339b:b0:b0:29db:fb73 with SMTP id yy27-20020a056a21339b00b000b029dbfb73mr68503088pzb.12.1672872453217;
        Wed, 04 Jan 2023 14:47:33 -0800 (PST)
Received: from p14s ([2604:3d09:148c:c800:1328:ca09:d4c2:fcbc])
        by smtp.gmail.com with ESMTPSA id e11-20020aa798cb000000b005825460056asm7433625pfm.70.2023.01.04.14.47.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Jan 2023 14:47:32 -0800 (PST)
Date: Wed, 4 Jan 2023 15:47:30 -0700
From: Mathieu Poirier <mathieu.poirier@linaro.org>
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: andersson@kernel.org, matthias.bgg@gmail.com,
	linux-remoteproc@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org,
	wenst@chromium.org
Subject: Re: [PATCH 0/2] MediaTek SCP IPI cleanups
Message-ID: <20230104224730.GC2112402@p14s>
References: <20230104115341.320951-1-angelogioacchino.delregno@collabora.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230104115341.320951-1-angelogioacchino.delregno@collabora.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230104_144741_060899_193AA0C7 
X-CRM114-Status: GOOD (  10.98  )
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

On Wed, Jan 04, 2023 at 12:53:39PM +0100, AngeloGioacchino Del Regno wrote:
> Cleanups bringing no functional changes.
> Tested on MT8173 Elm, MT8192 Asurada, MT8195 Tomato.
> 
> This series applies only on top of [1].
> 
> [1]: https://lore.kernel.org/lkml/20230104083110.736377-1-wenst@chromium.org/
> 
> AngeloGioacchino Del Regno (2):
>   remoteproc/mtk_scp: Use readl_poll_timeout_atomic() for polling
>   remoteproc/mtk_scp: Remove timeout variable from scp_ipi_send()
>

I have applied both patches.

Thanks,
Mathieu

>  drivers/remoteproc/mtk_scp_ipi.c | 23 ++++++++++++-----------
>  1 file changed, 12 insertions(+), 11 deletions(-)
> 
> -- 
> 2.39.0
> 

