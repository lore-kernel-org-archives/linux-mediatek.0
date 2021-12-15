Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 92F06C433F5
	for <linux-mediatek@archiver.kernel.org>; Wed, 15 Dec 2021 20:14:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=GhBa1ld9sHzCJcAhiih9aqV0plR+qMB7+nmoUdVAeLw=; b=uCqU7EMD7bZTda
	8JjuEP36r3f//twOmgn9r558BIwmDcGCg6SVosyjm3LOh76J9Km507fO1LNsvr4DQ403BNmIqf+uI
	j5wuNgEiRvbOCrdgwIVFMbT7iC5dFQe+PX52sEk53RLu85WdgtU6fq5pV05fadCzY/SFiXqYt0ibe
	oFibQP6ZSUK6gcNhiEgQh5ZQclUW83bDajWuaxZi2BzXxlsLjPxqPYK6DVrNcUd6CpRwBiyUjalVT
	ONJu3gOP59sljvjUWTFfcm9+UyYCsn32+BqFQcXCDjuhSFHbFS8C+FuVLk0N8mIpE1BSrNspV4bev
	gGXwW2YOZOR4ju3PJ3Mg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mxafX-002ZGt-2x; Wed, 15 Dec 2021 20:14:31 +0000
Received: from mail-wr1-x431.google.com ([2a00:1450:4864:20::431])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mxafO-002ZBl-1P; Wed, 15 Dec 2021 20:14:23 +0000
Received: by mail-wr1-x431.google.com with SMTP id i22so10390107wrb.13;
 Wed, 15 Dec 2021 12:14:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=E1VZMDNDn7cqxKxApca8uJlehdzt88dyZchiwwKVm7U=;
 b=g1YyMuTJ5GsMHrXtXUEAz4CRABMZW0S01hXe8QKWhyABEJi3BSEjuBy3EaXP0Yw2UM
 Il36LK+Tu016+3Ogmt+dKV2opDXRvH3DInp+s2ABpg92+3aVMbIIxDVNTR0x8kbtqKnX
 s5DlUfbxNhTFU7fWAbhPB9mSAi+mbLD7qYcVGGZo05cj+AlxhrTdSMZjMQ36IoS/H15U
 Ncf4K+gfKNpj5EpmlPU3POL7uLtoU643+74wvawF0qyKP0FohOPXapbgdRi7JzHJBfBX
 8H3ZNubWMsoFWlFLipISi+RUENOj5G4b4eqHp/wHzdFCwzWSMDXNOX7tDscJQ/3P98zJ
 U+Mw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=E1VZMDNDn7cqxKxApca8uJlehdzt88dyZchiwwKVm7U=;
 b=IslpEA5MTRT7vevtVsk983wsak2lVzRiiSr/q1BZtZAY1aiWJscBGkt9DGPsTlMp+I
 2bJSMhFstWLa97Upz2DK1noE0hmoEbTJ6ojkNi8YEfjU0ZWECCeOZK+ZChnXcjiLE/CN
 t9wTsZak4NxDUMAjFY/Op40JE2/sg4/GOIW6UwE+/X5VZr226gJ/9IowvY3RL1ghwhOA
 QuVLFHADMUee8u5EO/ZGcMbIDsmCPMfSYuBexTTPkMi/pN5HiEot4MEyep+ZPogQ7nyh
 ahk8fOdLs+aE/wBzeXQumkJl9bvp7AELxiYC/XHHO9jdIfMo00UE/bv0Dp+3qw6Joxi1
 ukHQ==
X-Gm-Message-State: AOAM533lQhZZbQAZJKjqIdPVHQOtmhQI72/J4o7usDDuED+zh3WvOEah
 D0S6cwQcx5ch5RChs8P/RAM=
X-Google-Smtp-Source: ABdhPJxBcM7HgZAgdlpi5+nkMNlxm9PmJ9F1y1ZmeyiXC8WxsVPU+9cBAt9sxOLu46Lj9oHh7lCXAg==
X-Received: by 2002:a5d:47a1:: with SMTP id 1mr6122296wrb.436.1639599260782;
 Wed, 15 Dec 2021 12:14:20 -0800 (PST)
Received: from [192.168.0.18] (81.172.62.207.dyn.user.ono.com. [81.172.62.207])
 by smtp.gmail.com with ESMTPSA id a1sm3810907wri.89.2021.12.15.12.14.19
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 15 Dec 2021 12:14:20 -0800 (PST)
Message-ID: <5b90dd50-f088-8250-7683-fe359d9679a8@gmail.com>
Date: Wed, 15 Dec 2021 21:14:19 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.2.0
Subject: Re: [PATCH v6 5/7] drm/mediatek: dpi: Add dpintf support
Content-Language: en-US
To: Guillaume Ranquet <granquet@baylibre.com>,
 Chun-Kuang Hu <chunkuang.hu@kernel.org>,
 Philipp Zabel <p.zabel@pengutronix.de>, David Airlie <airlied@linux.ie>,
 Daniel Vetter <daniel@ffwll.ch>
Cc: Markus Schneider-Pargmann <msp@baylibre.com>,
 dri-devel@lists.freedesktop.org, linux-mediatek@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
References: <20211110130623.20553-1-granquet@baylibre.com>
 <20211110130623.20553-6-granquet@baylibre.com>
From: Matthias Brugger <matthias.bgg@gmail.com>
In-Reply-To: <20211110130623.20553-6-granquet@baylibre.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211215_121422_118068_819A5752 
X-CRM114-Status: GOOD (  22.91  )
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org



On 10/11/2021 14:06, Guillaume Ranquet wrote:
> From: Markus Schneider-Pargmann <msp@baylibre.com>
> 
> dpintf is the displayport interface hardware unit. This unit is similar
> to dpi and can reuse most of the code.
> 
> This patch adds support for mt8195-dpintf to this dpi driver. Main
> differences are:
>   - Some features/functional components are not available for dpintf
>     which are now excluded from code execution once is_dpintf is set
>   - dpintf can and needs to choose between different clockdividers based
>     on the clockspeed. This is done by choosing a different clock parent.
>   - There are two additional clocks that need to be managed. These are
>     only set for dpintf and will be set to NULL if not supplied. The
>     clk_* calls handle these as normal clocks then.
>   - Some register contents differ slightly between the two components. To
>     work around this I added register bits/masks with a DPINTF_ prefix
>     and use them where different.
> 
> Based on a separate driver for dpintf created by
> Jason-JH.Lin <jason-jh.lin@mediatek.com>.
> 
> Signed-off-by: Markus Schneider-Pargmann <msp@baylibre.com>
> Signed-off-by: Guillaume Ranquet <granquet@baylibre.com>
> ---
[...]
> diff --git a/include/linux/soc/mediatek/mtk-mmsys.h b/include/linux/soc/mediatek/mtk-mmsys.h
> index 4bba275e235ac..56ed2fa5f59e8 100644
> --- a/include/linux/soc/mediatek/mtk-mmsys.h
> +++ b/include/linux/soc/mediatek/mtk-mmsys.h
> @@ -19,6 +19,8 @@ enum mtk_ddp_comp_id {
>   	DDP_COMPONENT_DITHER,
>   	DDP_COMPONENT_DPI0,
>   	DDP_COMPONENT_DPI1,
> +	DDP_COMPONENT_DP_INTF0,
> +	DDP_COMPONENT_DP_INTF1,
>   	DDP_COMPONENT_DSI0,
>   	DDP_COMPONENT_DSI1,
>   	DDP_COMPONENT_DSI2,
> 

For the mtk-mmsys.h:
Acked-by: Matthias Brugger <matthias.bgg@gmail.com>

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
