Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CDE5BCEE325
	for <linux-mediatek@archiver.kernel.org>; Wed,  9 Oct 2024 15:41:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:MIME-Version:In-Reply-To:References:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=4Gd0Hd1MakjxQ8aCm1xPSRU0H3xeGSc63YXhhZpX4cc=; b=kikB2xozQfbDhNo+j6bO5q6AvT
	dKP0nBqGEWhp8LjagNpl5vZG3TyoqzZ0Ll0/yZ3+tJetIkeSOdC+y0vaPOJft8B/FJkCxlb9x9Gqz
	/lNuXeOHD2+y9eoKnTwZbxkjutIRKLMXL2SPoz1/EQC0no7fxKJGUzxSdO9KGDx4rwFduWQMCE7EC
	k0rHnaqzYYAQ/kIPgaEbVb0Y/fgkZYBE/wF/CWxobLkD5LuMxiVicxCn+URW/E34VZLeBpRH7vEmk
	VrrWwjdYFHrDxU0xVIjpeQ0SlIm1DF4Js7lkNfKuzhqUHcuToFFnkB+yHfnEfbwhwdwEU+fLgZLU2
	rIPK3BPQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1syYoy-00000009mrr-2wJ9;
	Wed, 09 Oct 2024 15:41:52 +0000
Received: from mail-oi1-x22f.google.com ([2607:f8b0:4864:20::22f])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1syYou-00000009mqP-1j0a
	for linux-mediatek@lists.infradead.org;
	Wed, 09 Oct 2024 15:41:50 +0000
Received: by mail-oi1-x22f.google.com with SMTP id 5614622812f47-3e411aff454so493161b6e.1
        for <linux-mediatek@lists.infradead.org>; Wed, 09 Oct 2024 08:41:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1728488506; x=1729093306; darn=lists.infradead.org;
        h=cc:to:subject:message-id:date:mime-version:in-reply-to:references
         :user-agent:from:from:to:cc:subject:date:message-id:reply-to;
        bh=4Gd0Hd1MakjxQ8aCm1xPSRU0H3xeGSc63YXhhZpX4cc=;
        b=sWdSTm9vgA4N7JX0jz+NdlR8q4VTECkHp1p8GLhHxfxEVNFXOIFjUeGXiaJYLGmqtS
         uVg9tlRH2Jdm99aSq5u9vqWUhQzt1JSc2qLL9qIyrzUXARADNl43EJw/9NR0dOQFiFe0
         mrCfBzV4iTqWM+UzpwbgbihjfO75WSxJ0OYCQYYdEhaNSyg/LnvP7/R8/drXkMFfA+Ae
         Ur6lvVYtW73ANVhlE/IRnssBAh1CjPpoCSKb/weX4ULK6bsg4x7XbmGIUcJMUQxZaa2j
         WjlpyKw7gfyoej0/mi52w8LAXDnd+QezIfrDK4wKtGkzIU8SoTeaB5OXxxm+phkS2Q4z
         tKTg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728488506; x=1729093306;
        h=cc:to:subject:message-id:date:mime-version:in-reply-to:references
         :user-agent:from:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=4Gd0Hd1MakjxQ8aCm1xPSRU0H3xeGSc63YXhhZpX4cc=;
        b=rBeAMz+UYQzZ34hYRIgfIYy+8940q0cJga/VXfdoTofXRzXgP5mf+0B+BLiC0buM1l
         qOrjjh4KUtZS9nEc5X8LFexGxO9WbWUK5eczSG6Coes4ITlbz7ZEGAf/GMG3MXZKCf4m
         /jpbFXQe39QLSCp3jkUkzWh3zxeyR3CW4ey4pyToGnrdh4+J0/b5XYBUOGO18Fn8udji
         E917HDEA0CL6ZQoYq6hXTOMdJObP9I1Qv7IBdodeTYgOOCoTDTj0zzzqxeWAWVFVlT+a
         ce9qhWvyTqVLdMYPbAguxXidEg1PLNVpPyKuhX48YoquI2uH0i05fLMShji/oSa1O6Bd
         MMww==
X-Forwarded-Encrypted: i=1; AJvYcCU3h1N7+Lrft24fbLPMQ3kBmVZahYeftDZL4YYOMJl4dasEmloBS155VOyRvc/p42BK9agZ6FcwvCXNGQ+F4w==@lists.infradead.org
X-Gm-Message-State: AOJu0YxhAwaRi5v5/ZP3r5/cpJPkg5ILSBstTvNVbL4tqsBIJMOR/7AK
	pDrTPtb3cGRoQOMleM4dY6+EQsVtAY7xXOe+zja23joFSXTWNcaJWdBNoHdQCHWDFMnL9fhpoCX
	mb8Dz5OxHzjp/6pCAy53WTRnZlEGdJbx4baeTIQ==
X-Google-Smtp-Source: AGHT+IGSAbf5K8peyNanI54kI2R8bIyKMUOuELhCM3eQhZJMBHU1uq8bm5qKHyh5KBHiKy63ie1sfKPMxntzRYNSqt4=
X-Received: by 2002:a05:6871:7505:b0:288:2b44:5577 with SMTP id
 586e51a60fabf-28834458deemr1908641fac.18.1728488506041; Wed, 09 Oct 2024
 08:41:46 -0700 (PDT)
Received: from 753933720722 named unknown by gmailapi.google.com with
 HTTPREST; Wed, 9 Oct 2024 08:41:45 -0700
From: Guillaume Ranquet <granquet@baylibre.com>
User-Agent: meli 0.8.7
References: <20240927153305.27642-1-liankun.yang@mediatek.com>
In-Reply-To: <20240927153305.27642-1-liankun.yang@mediatek.com>
MIME-Version: 1.0
Date: Wed, 9 Oct 2024 08:41:45 -0700
Message-ID: <CABnWg9uGR1yn9EsRaMjihksL76dwUv9vEi9eF=OCpzLfTvyYLg@mail.gmail.com>
Subject: Re: [PATCH v2 1/1] drm/mediatek: Fix potential KP on 0 bytes nvmem
 cell read
To: Liankun Yang <liankun.yang@mediatek.com>, chunkuang.hu@kernel.org, 
	p.zabel@pengutronix.de, airlied@gmail.com, simona@ffwll.ch, 
	matthias.bgg@gmail.com, angelogioacchino.delregno@collabora.com, 
	rex-bc.chen@mediatek.com, msp@baylibre.com, ck.hu@mediatek.com, 
	jitao.shi@mediatek.com, mac.shen@mediatek.com, peng.liu@mediatek.com
Cc: Project_Global_Chrome_Upstream_Group@mediatek.com, 
	dri-devel@lists.freedesktop.org, linux-mediatek@lists.infradead.org, 
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241009_084148_456368_26C81C9A 
X-CRM114-Status: GOOD (  10.57  )
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

On Fri, 27 Sep 2024 11:03, Liankun Yang <liankun.yang@mediatek.com> wrote:
>If the len is 0, kernel crash will occur when performing operations.
>Add the len check conditions to prevent kernel crash.
>
>Fixes: f70ac097a2cf ("drm/mediatek: Add MT8195 Embedded DisplayPort driver")
>Signed-off-by: Liankun Yang <liankun.yang@mediatek.com>
>---
>Changes in V2:
>- Fix the commit title.
>- Remove blank line between the Fixes and Signe-off-by.
>- Modify the judgment writing method.
>Per suggestion from the previous thread:
>https://patchwork.kernel.org/project/linux-mediatek/patch/20240925084116.28848-1-liankun.yang@mediatek.com/
>---
> drivers/gpu/drm/mediatek/mtk_dp.c | 2 +-
> 1 file changed, 1 insertion(+), 1 deletion(-)
>
>diff --git a/drivers/gpu/drm/mediatek/mtk_dp.c b/drivers/gpu/drm/mediatek/mtk_dp.c
>index d8796a904eca..9ecdf62398ee 100644
>--- a/drivers/gpu/drm/mediatek/mtk_dp.c
>+++ b/drivers/gpu/drm/mediatek/mtk_dp.c
>@@ -1082,7 +1082,7 @@ static void mtk_dp_get_calibration_data(struct mtk_dp *mtk_dp)
> 	buf = (u32 *)nvmem_cell_read(cell, &len);
> 	nvmem_cell_put(cell);
>
>-	if (IS_ERR(buf) || ((len / sizeof(u32)) != 4)) {
>+	if (IS_ERR(buf) || !len || ((len / sizeof(u32)) != 4)) {
> 		dev_warn(dev, "Failed to read nvmem_cell_read\n");

Hello Liankun,
Would you be able to describe the crash with more details?

I'm afraid I don't understand the fix?

if len is 0, dividing 0 by sizeof(u32) is 0 and thus != 4
So to me, checking for len != 0 is redundant?

Thx,
Guillaume.
>
> 		if (!IS_ERR(buf))
>--
>2.45.2

