Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D9DD9D31A26
	for <linux-mediatek@archiver.kernel.org>; Wed, 14 Jan 2026 08:10:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=iyQ7CAxaVgfqcnEakSL72b/nQ33nYsikOLFTzPcqfjI=; b=m0AlUq2aWfqSm10CqXvw2lZVRH
	P5/yZIZNPUgQiEskm0HdXKp9oXSREu16Z14+zVrAoVX1tWMWl/RghmFUp2KNL65mSs0b+llHc/fTW
	98Vq8Dt7KcdefjO0Chw1423aUJwyRIZ92kgBJGO+WxyfwwQhXIbtEJEbefdNZ4/S0HsRqVp1TAQrZ
	yy7Tft3nfsKERnV5nJ/AKgI/O2YujT5lIQN3tSdR7Ou2NVbqVz+26TKOLHMDejwced2chisDtL71J
	Sm56R0j9zeaHY3QRakNFhxsAz6dGzaCVkR3JSAiLqLPxKlfSDofDfOrO5vxdCNW3Gau1lw8RZns0n
	NVGNgW+g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vfvxq-00000008Hbh-12ma;
	Wed, 14 Jan 2026 08:10:50 +0000
Received: from mail-wr1-x436.google.com ([2a00:1450:4864:20::436])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vfvxn-00000008Hal-1T4e
	for linux-mediatek@lists.infradead.org;
	Wed, 14 Jan 2026 08:10:48 +0000
Received: by mail-wr1-x436.google.com with SMTP id ffacd0b85a97d-42fbc3056afso4850292f8f.2
        for <linux-mediatek@lists.infradead.org>; Wed, 14 Jan 2026 00:10:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1768378245; x=1768983045; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=iyQ7CAxaVgfqcnEakSL72b/nQ33nYsikOLFTzPcqfjI=;
        b=J+N6g+tD+nI3hyVDQ7pnxNP7yacB5rRCn3HOr3HJhwmrQIRlry9Cl4MrVZLVMsDR99
         h3xKPLeSyrjGGGAX9mbUSZA1VqABkrRxRpu1f9Qme2twC/5CxByEROjh6ojgcz1/7H97
         xul91USCBr0lXRrNuFEA0dZbDRYKBDijTDWYnjxQpaN3O97wIYmSfmIBDryZJNIHIOow
         BBvHuVhrxg6iCKs4UrvFpZ4oI+cyUjNw8BN08GfK4q+IsfyciRfN2BpBBb5B5okXAT7z
         PSHi5WgbGKGOgk5Y3oScuY1O5/DApLo1P7+1cSXz4oDzXnpHZzVEJrPjtLaZyZU4kuMx
         pOUQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768378245; x=1768983045;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=iyQ7CAxaVgfqcnEakSL72b/nQ33nYsikOLFTzPcqfjI=;
        b=RTHFk3dyxsBdNL4fHDvkT21ungNY3iMIk8PRKK8s94ywDo+HvfgvY+x0x6SG5I/eeE
         74aafa6e0gUwbcgaq0Qx7WHsXT5Jy9GLaonnHSatyN3S9ji7QICbx+LysqOLJZ3oGVls
         8dpm6ZTwEa6gnxY9JzuuKvWkvNxRFsOyjHxthcrGSvGZTly1XFRARuLmVXl3Ds1vXbDb
         m8OZSSKweGKUBXjN4AtNM9iFL8bT146Wsgoq4ZVCn0Evm8t9pQSxuahMwD2hCMOZUGSe
         VuC30Rs0EzPngPyHJxbWVoBaPx+HlwrkI6ts2htH62F84M6QoOXyL2n26oXmEzPEXz31
         mGpg==
X-Gm-Message-State: AOJu0YyP72TpWd4Oh2clr82KYdqDilrZefpQJTdEWcK1mPEl+QW8vvoQ
	QLqO04iyEOFxDtx3lZ2z3aSjkkc35wU352ridalkWpXTUyTm6oET9cI1
X-Gm-Gg: AY/fxX6Gr+wz/fIig2VHdB8xA79aQVxuqzzr79zfc+h0F+ybBtWdswPDBgoEfejXrfI
	+V6xOz/hjPs7UmNmQaWIZFYyT3dTLZa8YUt29gXVqi7PXGGVivCCgi/Hi47XftkHKHJz2YILOl0
	aoVPJbKtHQ0prQ3EawulDNq7DoRLD4fllAA5bUsGwg4ymqCIIkJy75wjdgvjeCf+A6MTvAOC71h
	E5zvNIN/oMIekDD/1qyIqXCpBLL90pXwcxg5jK7/4tfZI3PvQzWy1/SaX7AqUvQuoIq9WwtW116
	V1giQEkBYms0uskswkCgp7lE4q5nHQhybISZfomGgppC4/+SqzDPWGxCT1W0J2/sCIKNXdagyir
	L/j9UVK4cIRpSJO9B+Noue20zeDCxS8D2OPrLGtTab6vl1/QPpXtm3MJRW7xSy6GN5uB8QQQ2aH
	M0UpWKshRRVEXH6uc0/fd0zMxW5uictLb6TUstbdx51VoLYJF+asDIhewfgjPXU4l+d2s=
X-Received: by 2002:a05:6000:4024:b0:432:5ce4:6fed with SMTP id ffacd0b85a97d-4342c4f3f3bmr1574271f8f.9.1768378244853;
        Wed, 14 Jan 2026 00:10:44 -0800 (PST)
Received: from [192.168.1.27] (84.121.134.198.dyn.user.ono.com. [84.121.134.198])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-432bd5edd51sm48599398f8f.29.2026.01.14.00.10.43
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 14 Jan 2026 00:10:43 -0800 (PST)
Message-ID: <0c93f704-40a2-4257-b834-8d0f3c50f2ee@gmail.com>
Date: Wed, 14 Jan 2026 09:10:42 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH V2] mediatek: rename MT8188 SCP firmware
To: Moudy Ho <moudy.ho@mediatek.com>, linux-firmware@kernel.org
Cc: linux-mediatek@lists.infradead.org, nfraprado@collabora.com,
 Jason-ch.Chen@mediatek.com, angelogioacchino.delregno@collabora.com,
 Macpaul.Lin@mediatek.com
References: <20260114072433.3076970-1-moudy.ho@mediatek.com>
 <20260114072433.3076970-2-moudy.ho@mediatek.com>
Content-Language: en-GB
From: Matthias Brugger <matthias.bgg@gmail.com>
In-Reply-To: <20260114072433.3076970-2-moudy.ho@mediatek.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260114_001047_399926_5691BDB6 
X-CRM114-Status: GOOD (  13.45  )
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

On 14/1/26 08:23, Moudy Ho wrote:
> The MT8188 device tree (DTS) is configured for dual core SCP, and the
> driver by default attempts to load "scp_c0.img" as the core 0 firmware.
> To conform with upstream naming conventions, this patch renames the
> existing firmware file "scp.img" to "scp_c0.img" to ensure proper firmware
> loading for dual core SCP.
> 
> Signed-off-by: Moudy Ho <moudy.ho@mediatek.com>

Reviewed-by: Matthias Brugger <matthias.bgg@gmail.com>

> ---
>   WHENCE                                  |   3 ++-
>   mediatek/mt8188/{scp.img => scp_c0.img} | Bin
>   2 files changed, 2 insertions(+), 1 deletion(-)
>   rename mediatek/mt8188/{scp.img => scp_c0.img} (100%)
> 
> diff --git a/WHENCE b/WHENCE
> index 4a211c48..fecf42f8 100644
> --- a/WHENCE
> +++ b/WHENCE
> @@ -6057,7 +6057,8 @@ File: mediatek/mt8192/scp.img
>   Version: v2.0.20536
>   File: mediatek/mt8195/scp.img
>   Version: v2.0.21961
> -File: mediatek/mt8188/scp.img
> +File: mediatek/mt8188/scp_c0.img
> +Link: mediatek/mt8188/scp.img -> scp_c0.img
>   Version: v2.0.27748
>   File: mediatek/mt8189/scp.img
>   Version: v1.0.0
> diff --git a/mediatek/mt8188/scp.img b/mediatek/mt8188/scp_c0.img
> similarity index 100%
> rename from mediatek/mt8188/scp.img
> rename to mediatek/mt8188/scp_c0.img


