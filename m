Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EFAD7D1AD53
	for <linux-mediatek@archiver.kernel.org>; Wed, 16 Oct 2024 12:27:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=o5XkYbhD7GQ/UM3/ZFxDvMxdDBYYQYu99C2uqRsaiV8=; b=WtoQX7ZEwZ7diPHtlrfr2v3HUs
	jfhhAFs1sigoRaQN/M4kchuVgQBK0hT/eY+B5k1kowcfxTKJE0X1t0q+wzynU3ulgrEeS8kxHszUp
	8LLWY9K7qa/59Hz5Njro0tf55BkxDGniDzrIepQHUmcJMbK33NN4g1+5XPkMeiNG4pTDQihIdBg9T
	P7jcVw1pEQQRMWzhCddY44CsS9N+6W/qimAXCVEvT++zTo2IH2iR4Tv9j+2/zxm+vRVxkz+J/GSYO
	SV12m0o434pSNycIZ7MdHAQWYgOUMwY2uYdYyFfFh5/tXSo4SsX2bfoFQBB7BU4EyP6uhoTeiBjkr
	uM3XVoZQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t137E-0000000BjfD-395q;
	Wed, 16 Oct 2024 12:27:00 +0000
Received: from mail-ed1-x52f.google.com ([2a00:1450:4864:20::52f])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t137C-0000000Bjcl-03aI;
	Wed, 16 Oct 2024 12:26:59 +0000
Received: by mail-ed1-x52f.google.com with SMTP id 4fb4d7f45d1cf-5c99be0a4bbso700480a12.2;
        Wed, 16 Oct 2024 05:26:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1729081616; x=1729686416; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=o5XkYbhD7GQ/UM3/ZFxDvMxdDBYYQYu99C2uqRsaiV8=;
        b=iC1kr/1v7mRavB154USws7eoJjdpUhz+xWVhFWqgXlfMIAJkVNTI46st/e2VtqGKW6
         jEc3q1jL3ICLVU2cwEPsaTiMGHvSlE3t9z5ecrg0AVwQQKtSBP0tIxeqByP5IIzmoeU7
         jFGPVCdM9i5kiV4qp/ivAwVvpHwDoWvw0IQTmki94mno8rEruPF7r1bWa2TknD5wVteC
         5fsLCPAXhzE0LyvPNrHixiVDq1EoctOKSwuxcXJ1wuRSupf7NxmSGQQZmVurvaB5kyxu
         MjRJMN/YlBN20lLCWKczUWSYbcNQ0FMi6R09dlzLnG9MTQrPLmckxVfN4jDYcliM1NZm
         l3cg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729081616; x=1729686416;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=o5XkYbhD7GQ/UM3/ZFxDvMxdDBYYQYu99C2uqRsaiV8=;
        b=ZsCSjSLUaBH8hDlaRYBKRgQukOqh3Xir+gdoxhZUUg31woghFaWDorSnju6QLvJZLp
         Q0Hj74gCF9GQOFpnPBPmat4yP9F5dYvNe7GPok81GXSEBiyJw6ZcZlvpqUsJJlhN39GR
         9bUWhr6lK/+wzT5u3EW2m4fhSRm+Z2W3rXW9K4j08N9AGwwxhO41886TwFKx0w71HrQD
         7ZT0Kv+EJFqC3HaEcLC+WE4xqmNqZAUJsh3iX3sFMmsW7xo1cLMDtYr/SF9OYbTJxo5n
         0JT8Ep0quPlONe+jFr3NQFpI/oLwWbEGvGYwE1Rk715/PnNEXAFZTSIEfrZP0ngx31ua
         ifiQ==
X-Forwarded-Encrypted: i=1; AJvYcCXZCyzDtBX76r8T1F3HwryIzK30jObHdj6QKoX2JTr5W46Up60lhn2SoxnPAYSIQaaZmIgQh5Ltw6DydisQ7uA=@lists.infradead.org, AJvYcCXvDqlLIQ4zVVBCLPnAUPpTsEpEROlvWJDOFFreT5EqpIA8cA0qPwVFKikvkdCCkDbyL3210JZkW1qwKS6H5v4r@lists.infradead.org
X-Gm-Message-State: AOJu0Yy8Eyu0525mY6SZDTXGEfOOjNC4Q6VcbGQO5QV1cstPeGCJ3fSF
	j0I2pLIrhEX5VOGhLVCZi7hyrNlQy+u8d4fyjvxoLrICNVu7E6zT
X-Google-Smtp-Source: AGHT+IFcnPGvv+07WP6skyv4hg/FfgbGscqMu7BmRbPY69IWoa1LmdxhGPZoAcM+AnYli8pZGFn0ow==
X-Received: by 2002:a05:6402:5210:b0:5c9:4a36:8f4e with SMTP id 4fb4d7f45d1cf-5c94a369527mr13528544a12.25.1729081615530;
        Wed, 16 Oct 2024 05:26:55 -0700 (PDT)
Received: from [192.168.42.132] ([81.95.8.245])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5c98d4d63fesm1659905a12.13.2024.10.16.05.26.53
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 16 Oct 2024 05:26:53 -0700 (PDT)
Message-ID: <8d35081d-74cd-4d4c-ae31-b3b4e8ce65de@gmail.com>
Date: Wed, 16 Oct 2024 14:26:51 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] drm/mediatek: Fix color format MACROs in OVL
To: Hsin-Te Yuan <yuanhsinte@chromium.org>,
 Chun-Kuang Hu <chunkuang.hu@kernel.org>,
 Philipp Zabel <p.zabel@pengutronix.de>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: dri-devel@lists.freedesktop.org, linux-mediatek@lists.infradead.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 dianders@chromium.org
References: <20241016-color-v2-1-46db5c78a54f@chromium.org>
Content-Language: en-US
From: Matthias Brugger <matthias.bgg@gmail.com>
In-Reply-To: <20241016-color-v2-1-46db5c78a54f@chromium.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241016_052658_125737_F1521764 
X-CRM114-Status: GOOD (  17.64  )
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



On 10/16/24 13:08, Hsin-Te Yuan wrote:
> In commit 9f428b95ac89 ("drm/mediatek: Add new color format MACROs in
> OVL"), some new color formats are defined in the MACROs to make the
> switch statement more concise. That commit was intended to be a no-op
> cleanup. However, there are typos in these formats MACROs, which cause
> the return value to be incorrect. Fix the typos to ensure the return
> value remains unchanged.
> 
> Fixes: 9f428b95ac89 ("drm/mediatek: Add new color format MACROs in OVL")
> Signed-off-by: Hsin-Te Yuan <yuanhsinte@chromium.org>

Reviewed-by: Matthias Brugger <matthias.bgg@gmail.com>

> ---
> Changes in v2:
> - Clarify that the commit get fixed was intended to be a no-op cleanup
> - Fix the typo in tag
> - Link to v1: https://lore.kernel.org/r/20241015-color-v1-1-35b01fa0a826@chromium.org
> ---
>   drivers/gpu/drm/mediatek/mtk_disp_ovl.c | 4 ++--
>   1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/gpu/drm/mediatek/mtk_disp_ovl.c b/drivers/gpu/drm/mediatek/mtk_disp_ovl.c
> index 89b439dcf3a6af9f5799487fdc0f128a9b5cbe4a..1632ac5c23d87e1cdc41013a9cf7864728dcb63b 100644
> --- a/drivers/gpu/drm/mediatek/mtk_disp_ovl.c
> +++ b/drivers/gpu/drm/mediatek/mtk_disp_ovl.c
> @@ -65,8 +65,8 @@
>   #define OVL_CON_CLRFMT_RGB	(1 << 12)
>   #define OVL_CON_CLRFMT_ARGB8888	(2 << 12)
>   #define OVL_CON_CLRFMT_RGBA8888	(3 << 12)
> -#define OVL_CON_CLRFMT_ABGR8888	(OVL_CON_CLRFMT_RGBA8888 | OVL_CON_BYTE_SWAP)
> -#define OVL_CON_CLRFMT_BGRA8888	(OVL_CON_CLRFMT_ARGB8888 | OVL_CON_BYTE_SWAP)
> +#define OVL_CON_CLRFMT_ABGR8888	(OVL_CON_CLRFMT_ARGB8888 | OVL_CON_BYTE_SWAP)
> +#define OVL_CON_CLRFMT_BGRA8888	(OVL_CON_CLRFMT_RGBA8888 | OVL_CON_BYTE_SWAP)
>   #define OVL_CON_CLRFMT_UYVY	(4 << 12)
>   #define OVL_CON_CLRFMT_YUYV	(5 << 12)
>   #define OVL_CON_MTX_YUV_TO_RGB	(6 << 16)
> 
> ---
> base-commit: 75b607fab38d149f232f01eae5e6392b394dd659
> change-id: 20241015-color-e205e75b64aa
> 
> Best regards,


