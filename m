Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D74ABCD13CF
	for <linux-mediatek@archiver.kernel.org>; Mon,  2 Sep 2024 15:11:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=D9rypXAWMcgXo95n4JRKIoFCfiCMfGF6hOvWGECnhvc=; b=R3m6fdmNo0ZiSAKbFaaiaQhNj1
	EIiGI8ADwgcOTdj9zRm5dZb2DzKMZMAE/kKkTiUZtxmmcdSkU3ZNQTUcG/Ywzb5wcWtF8vAnF5U/3
	heMAbZ2x5pQz8N2FnuGFqOUZweQMEqWMy10mWU05fXY13fKoNhd6KeDcBpJF6lpedmsJvb2tJpYr1
	WEDoRGf8imZHu7AgsKUYA2Tc+ywFuIoB1wXQWvXE2mTGLL6HF6a3KcwubAtAlQBbJ7bO3QyZ1dHy+
	uotlYaci/kq1JSFS18NjiSaO/UxddNynZpd+6igWafTLDdPlbVMmd5fN6R0zFW3Y+1nyAVOTqnM8M
	QKJBDQPg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sl8i9-0000000Enw6-2AbA;
	Mon, 02 Sep 2024 15:11:21 +0000
Received: from mail-ed1-x52a.google.com ([2a00:1450:4864:20::52a])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sl8df-0000000En0E-0mVV;
	Mon, 02 Sep 2024 15:06:44 +0000
Received: by mail-ed1-x52a.google.com with SMTP id 4fb4d7f45d1cf-5c218866849so4573816a12.0;
        Mon, 02 Sep 2024 08:06:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1725289602; x=1725894402; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=D9rypXAWMcgXo95n4JRKIoFCfiCMfGF6hOvWGECnhvc=;
        b=GAZeiP7X8MuXLHG16orG/JWBJrAsy1MFiODfcpS7jDx6X+EyTKwoIg9fW54FUlfzPn
         nhYIbZEacMWik8fGsRVSQ0RLW66QDH5zZ4fngzxA0QlxqM6Ivnp+5j8Mmj7uIJxApr13
         3jvzljbPu4FOu/B82xuBbdWByP++hP3W6a/b3DKv9Rfk/OYskZL5q4DjQJ5u0yI2M4xq
         fW2/7mtC/+PM4u1rzXPsBcZaTOHw+ayZAbrWN+RnUc8P91Ao8wU96VPHCLTa6otJ9MGB
         jXZcdUYgGRElLjCwLEo5OeOW43X3ohuOV6wfA66tHyviD+po4856MfE9Et5AriPpywVl
         SYeA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1725289602; x=1725894402;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=D9rypXAWMcgXo95n4JRKIoFCfiCMfGF6hOvWGECnhvc=;
        b=JwiAvIaUf/GrCMHEk07YSNZ/vesu6j1w2YYvelYXZOSU8ImCqG61RzNiUr9QY2yF/+
         8YLmm52vsryqy4wdp56YM9sMWgwhlj3uMb7jeUSFuS4b+MjJikVrzEBaTNkCTbffz4FI
         v1Bvx2e4XMQMYleo04kHoii6po1MEVfTrdfs0YQlkpnFqfdUG5njZxuY67Cr0Rkm8X8f
         vchkqH3ILCyyW7ScHiZc2x0DcckMC5sjQXivX0HKNT6TbB4Yui6lTMeJ6RRQe7Eehi2I
         KWt3d+EwD/FUjCpDEulqcAJrtUI1vhHtaawLNGhOrHASYrVOhaXz1Vh8I6jNzA/igKsw
         OI8w==
X-Forwarded-Encrypted: i=1; AJvYcCUmVRcampMu0/wr9IK08UuLJK6t5G0cqClSVgpAt9YqA6WYBzU1d0M/f/lfrj2+jMH5HViX777BmeVk6VUujJSk@lists.infradead.org, AJvYcCX3smbqnds2s3fO5ibEOC6NJLIbh5zhnIbap/T8ACiz5+9r/frfzW3gGjjpRtdrpfBe9IRxBLSI+3W4wQMQCL8=@lists.infradead.org
X-Gm-Message-State: AOJu0Yxd7lUVmj3vZGrwW2B3UC7218wCT9c5HjW1FnkixfvX3L3yagK8
	ZH/McoLrHIT1WTQLpju1IzckxDc1nwwwtAiiGZKwS7hxvWsC/ihg
X-Google-Smtp-Source: AGHT+IEV06D0gjzas2Qzz4fJfat5nN9q+SxRpndd7IqZOjugMa2klJ/zM1s4NvNZGmlM+9J6F9nJGw==
X-Received: by 2002:a05:6402:13c9:b0:5c2:631c:80d5 with SMTP id 4fb4d7f45d1cf-5c2631c8107mr1391455a12.5.1725289601038;
        Mon, 02 Sep 2024 08:06:41 -0700 (PDT)
Received: from [192.168.0.20] ([148.56.230.39])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5c226ccfe3csm5353155a12.75.2024.09.02.08.06.39
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 02 Sep 2024 08:06:39 -0700 (PDT)
Message-ID: <cc3e30c6-3e97-4db8-a978-9c2048bfad0e@gmail.com>
Date: Mon, 2 Sep 2024 17:06:37 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH][next] media: mediatek: vcodec: Remove trailing space
 after \n newline
To: Colin Ian King <colin.i.king@gmail.com>,
 Tiffany Lin <tiffany.lin@mediatek.com>,
 Andrew-CT Chen <andrew-ct.chen@mediatek.com>,
 Yunfei Dong <yunfei.dong@mediatek.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>, linux-media@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20240902140758.308202-1-colin.i.king@gmail.com>
Content-Language: en-US, ca-ES, es-ES
From: Matthias Brugger <matthias.bgg@gmail.com>
Autocrypt: addr=matthias.bgg@gmail.com; keydata=
 xsFNBFP1zgUBEAC21D6hk7//0kOmsUrE3eZ55kjc9DmFPKIz6l4NggqwQjBNRHIMh04BbCMY
 fL3eT7ZsYV5nur7zctmJ+vbszoOASXUpfq8M+S5hU2w7sBaVk5rpH9yW8CUWz2+ZpQXPJcFa
 OhLZuSKB1F5JcvLbETRjNzNU7B3TdS2+zkgQQdEyt7Ij2HXGLJ2w+yG2GuR9/iyCJRf10Okq
 gTh//XESJZ8S6KlOWbLXRE+yfkKDXQx2Jr1XuVvM3zPqH5FMg8reRVFsQ+vI0b+OlyekT/Xe
 0Hwvqkev95GG6x7yseJwI+2ydDH6M5O7fPKFW5mzAdDE2g/K9B4e2tYK6/rA7Fq4cqiAw1+u
 EgO44+eFgv082xtBez5WNkGn18vtw0LW3ESmKh19u6kEGoi0WZwslCNaGFrS4M7OH+aOJeqK
 fx5dIv2CEbxc6xnHY7dwkcHikTA4QdbdFeUSuj4YhIZ+0QlDVtS1QEXyvZbZky7ur9rHkZvP
 ZqlUsLJ2nOqsmahMTIQ8Mgx9SLEShWqD4kOF4zNfPJsgEMB49KbS2o9jxbGB+JKupjNddfxZ
 HlH1KF8QwCMZEYaTNogrVazuEJzx6JdRpR3sFda/0x5qjTadwIW6Cl9tkqe2h391dOGX1eOA
 1ntn9O/39KqSrWNGvm+1raHK+Ev1yPtn0Wxn+0oy1tl67TxUjQARAQABzSlNYXR0aGlhcyBC
 cnVnZ2VyIDxtYXR0aGlhcy5iZ2dAZ21haWwuY29tPsLBkgQTAQIAPAIbAwYLCQgHAwIGFQgC
 CQoLBBYCAwECHgECF4AWIQTmuZIYwPLDJRwsOhfZFAuyVhMC8QUCWt3scQIZAQAKCRDZFAuy
 VhMC8WzRD/4onkC+gCxG+dvui5SXCJ7bGLCu0xVtiGC673Kz5Aq3heITsERHBV0BqqctOEBy
 ZozQQe2Hindu9lasOmwfH8+vfTK+2teCgWesoE3g3XKbrOCB4RSrQmXGC3JYx6rcvMlLV/Ch
 YMRR3qv04BOchnjkGtvm9aZWH52/6XfChyh7XYndTe5F2bqeTjt+kF/ql+xMc4E6pniqIfkv
 c0wsH4CkBHqoZl9w5e/b9MspTqsU9NszTEOFhy7p2CYw6JEa/vmzR6YDzGs8AihieIXDOfpT
 DUr0YUlDrwDSrlm/2MjNIPTmSGHH94ScOqu/XmGW/0q1iar/Yr0leomUOeeEzCqQtunqShtE
 4Mn2uEixFL+9jiVtMjujr6mphznwpEqObPCZ3IcWqOFEz77rSL+oqFiEA03A2WBDlMm++Sve
 9jpkJBLosJRhAYmQ6ey6MFO6Krylw1LXcq5z1XQQavtFRgZoruHZ3XlhT5wcfLJtAqrtfCe0
 aQ0kJW+4zj9/So0uxJDAtGuOpDYnmK26dgFN0tAhVuNInEVhtErtLJHeJzFKJzNyQ4GlCaLw
 jKcwWcqDJcrx9R7LsCu4l2XpKiyxY6fO4O8DnSleVll9NPfAZFZvf8AIy3EQ8BokUsiuUYHz
 wUo6pclk55PZRaAsHDX/fNr24uC6Eh5oNQ+v4Pax/gtyyc7BTQRd1TlIARAAm78mTny44Hwd
 IYNK4ZQH6U5pxcJtU45LLBmSr4DK/7er9chpvJ5pgzCGuI25ceNTEg5FChYcgfNMKqwCAekk
 V9Iegzi6UK448W1eOp8QeQDS6sHpLSOe8np6/zvmUvhiLokk7tZBhGz+Xs5qQmJPXcag7AMi
 fuEcf88ZSpChmUB3WflJV2DpxF3sSon5Ew2i53umXLqdRIJEw1Zs2puDJaMqwP3wIyMdrfdI
 H1ZBBJDIWV/53P52mKtYQ0Khje+/AolpKl96opi6o9VLGeqkpeqrKM2cb1bjo5Zmn4lXl6Nv
 JRH/ZT68zBtOKUtwhSlOB2bE8IDonQZCOYo2w0opiAgyfpbij8uiI7siBE6bWx2fQpsmi4Jr
 ZBmhDT6n/uYleGW0DRcZmE2UjeekPWUumN13jaVZuhThV65SnhU05chZT8vU1nATAwirMVeX
 geZGLwxhscduk3nNb5VSsV95EM/KOtilrH69ZL6Xrnw88f6xaaGPdVyUigBTWc/fcWuw1+nk
 GJDNqjfSvB7ie114R08Q28aYt8LCJRXYM1WuYloTcIhRSXUohGgHmh7usl469/Ra5CFaMhT3
 yCVciuHdZh3u+x+O1sRcOhaFW3BkxKEy+ntxw8J7ZzhgFOgi2HGkOGgM9R03A6ywc0sPwbgk
 gF7HCLirshP2U/qxWy3C8DkAEQEAAcLBdgQYAQgAIBYhBOa5khjA8sMlHCw6F9kUC7JWEwLx
 BQJd1TlIAhsMAAoJENkUC7JWEwLxtdcP/jHJ9vI8adFi1HQoWUKCQbZdZ5ZJHayFKIzU9kZE
 /FHzzzMDZYFgcCTs2kmUVyGloStXpZ0WtdCMMB31jBoQe5x9LtICHEip0irNXm80WsyPCEHU
 3wx91QkOmDJftm6T8+F3lqhlc3CwJGpoPY7AVlevzXNJfATZR0+Yh9NhON5Ww4AjsZntqQKx
 E8rrieLRd+he57ZdRKtRRNGKZOS4wetNhodjfnjhr4Z25BAssD5q+x4uaO8ofGxTjOdrSnRh
 vhzPCgmP7BKRUZA0wNvFxjboIw8rbTiOFGb1Ebrzuqrrr3WFuK4C1YAF4CyXUBL6Z1Lto//i
 44ziQUK9diAgfE/8GhXP0JlMwRUBlXNtErJgItR/XAuFwfO6BOI43P19YwEsuyQq+rubW2Wv
 rWY2Bj2dXDAKUxS4TuLUf2v/b9Rct36ljzbNxeEWt+Yq4IOY6QHnE+w4xVAkfwjT+Vup8sCp
 +zFJv9fVUpo/bjePOL4PMP1y+PYrp4PmPmRwoklBpy1ep8m8XURv46fGUHUEIsTwPWs2Q87k
 7vjYyrcyAOarX2X5pvMQvpAMADGf2Z3wrCsDdG25w2HztweUNd9QEprtJG8GNNzMOD4cQ82T
 a7eGvPWPeXauWJDLVR9jHtWT9Ot3BQgmApLxACvwvD1a69jaFKov28SPHxUCQ9Y1Y/Ct
In-Reply-To: <20240902140758.308202-1-colin.i.king@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240902_080643_280747_91FAB721 
X-CRM114-Status: GOOD (  14.41  )
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



On 02/09/2024 16:07, Colin Ian King wrote:
> There is a extraneous space after a newline in a mtk_venc_debug message.
> Remove it.
> 
> Signed-off-by: Colin Ian King <colin.i.king@gmail.com>

Reviewed-by: Matthias Brugger <matthias.bgg@gmail.com>

> ---
>   .../media/platform/mediatek/vcodec/encoder/venc/venc_h264_if.c  | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/media/platform/mediatek/vcodec/encoder/venc/venc_h264_if.c b/drivers/media/platform/mediatek/vcodec/encoder/venc/venc_h264_if.c
> index f8145998fcaf..59e56b81d5e0 100644
> --- a/drivers/media/platform/mediatek/vcodec/encoder/venc/venc_h264_if.c
> +++ b/drivers/media/platform/mediatek/vcodec/encoder/venc/venc_h264_if.c
> @@ -515,7 +515,7 @@ static int h264_encode_frame(struct venc_h264_inst *inst,
>   	struct venc_frame_info frame_info;
>   	struct mtk_vcodec_enc_ctx *ctx = inst->ctx;
>   
> -	mtk_venc_debug(ctx, "frm_cnt = %d\n ", inst->frm_cnt);
> +	mtk_venc_debug(ctx, "frm_cnt = %d\n", inst->frm_cnt);
>   
>   	if (MTK_ENC_IOVA_IS_34BIT(ctx)) {
>   		gop_size = inst->vsi_34->config.gop_size;

