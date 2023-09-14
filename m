Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BCF11EEAA41
	for <linux-mediatek@archiver.kernel.org>; Thu, 14 Sep 2023 13:38:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:MIME-Version:In-Reply-To:References:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=cmkM3eTScVXDHH0jlpqEzGVs0jKDHtYdRBTAlD8i+NE=; b=HdBsQtSKPQsM8T0HBaKZLk13se
	vYl7SRNv7v+Ggq09+sjka7uEGDv9yHmno13AsGx0Y6ynITTyF8lnjRTwGUvDsN2nAok5oBz4l9zMd
	Lsm4zn7CFENPJy5epeL667zvjjTMSnsoHdLJ9DHwVlQh8oeMWSAMhlt76IOZmKVJy/2135DxNgWAl
	mCL0U929NpKngX2yl4Ngda6oJ3LJclC06nxV4voOihpYWiirwBzM904OOdatGhUaEIX2cbSe0AF99
	OjPpdxT/bKlP8SYoV3w1zbcoPa33pmV1D8/fJXwt0hPiVQg0Pyw3C3YvbtzH++uMiXTajwZuHUEmS
	q0261qvw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qgmYV-008X4a-2m;
	Thu, 14 Sep 2023 13:38:51 +0000
Received: from mail-oa1-x33.google.com ([2001:4860:4864:20::33])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qgmYQ-008X2I-2w
	for linux-mediatek@lists.infradead.org;
	Thu, 14 Sep 2023 13:38:50 +0000
Received: by mail-oa1-x33.google.com with SMTP id 586e51a60fabf-1c504386374so543692fac.3
        for <linux-mediatek@lists.infradead.org>; Thu, 14 Sep 2023 06:38:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1694698724; x=1695303524; darn=lists.infradead.org;
        h=cc:to:subject:message-id:date:mime-version:in-reply-to:references
         :user-agent:from:from:to:cc:subject:date:message-id:reply-to;
        bh=cmkM3eTScVXDHH0jlpqEzGVs0jKDHtYdRBTAlD8i+NE=;
        b=yuKdMOatLHJnm5jhr3w3+ESy2zkGB6/pjgSEqr5Zdir8UxYqpkSqQXiY/V5i6YMuwA
         Y6lR559xhewsUxwW8zxmmh3le5wKb6tVYQ5lWJF92L0mdE9fqgPoAWf2MwwCtysWE+ZU
         C6aXc7yTp49x4wYx3TqhL0UyRLI57elEpi1LXSJtY6XsOFUslCN1V/I+5fKai4J41sEE
         lF1N+De+6Rsj+TYXiVv9mMVj5zN85ONp2dLTv7ilYMsCN7KlRt0bg71OZ7BrCk1pvcxD
         HldD7i6SOk/oHa7aL/Mv1T0SffFcvEGuMFVnUqj5EF/6jKgEn5wT7JWeDrqRdPMzOwGI
         7KtQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1694698724; x=1695303524;
        h=cc:to:subject:message-id:date:mime-version:in-reply-to:references
         :user-agent:from:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=cmkM3eTScVXDHH0jlpqEzGVs0jKDHtYdRBTAlD8i+NE=;
        b=xBg4v2VgxxN7PeBnnaumvlnSVdKdzpiD9vbebz72ai180ZZbE+0z3Cd9kZyUQ6IHz9
         T+DdgfTzJepfMdGcXoua/j/HMaVCu1TUyO/GUutm4J44JpfRegVCiqmWWKNaCI9Ybkjl
         OvZolVo7FmBy8Imls0XSxo+VKXAHQyjET+Cf+zCZJwucDHqyKxHKhipZXRzh7fCI5bRh
         ojNWNiOaBdjEFN4MShB6gpznbiEKV8kMxF4U+KRLLVIt+qNRsHu2cpkDVhcDHJBFg5YE
         kOE/LJ8GdElR7PdGatd8WqSwrEbFuWn5u6cFKMuIc2gHN49VvDxY79ByBte/ismmNbsB
         Wzxw==
X-Gm-Message-State: AOJu0YwDF8TAP891wnSCOxSjPPesEfSxS2sRetoNPn1mVK+a1vwd0zUY
	7dbZMvD6uh7useazX7cdmcfC/5BycNu9PB0hzbfhNg==
X-Google-Smtp-Source: AGHT+IFh7Yh89j5toiLrapBEM+lFJrnPKMRKQDggX4YR83wnaK2tnE/8N6Y+YLTaga5Qlr9XmuCrRhn8q0u0c8VABfw=
X-Received: by 2002:a05:6870:b69d:b0:1d5:b0b9:f6f1 with SMTP id
 cy29-20020a056870b69d00b001d5b0b9f6f1mr6386214oab.8.1694698724531; Thu, 14
 Sep 2023 06:38:44 -0700 (PDT)
Received: from 753933720722 named unknown by gmailapi.google.com with
 HTTPREST; Thu, 14 Sep 2023 13:38:43 +0000
From: Guillaume Ranquet <granquet@baylibre.com>
User-Agent: meli 0.7.3
References: <20230914131058.2472260-1-jani.nikula@intel.com>
In-Reply-To: <20230914131058.2472260-1-jani.nikula@intel.com>
MIME-Version: 1.0
Date: Thu, 14 Sep 2023 13:38:43 +0000
Message-ID: <CABnWg9sy_u5+TRvuRXEN8FB8BGdSadYimUQ-R6=PYEKZn2RZRw@mail.gmail.com>
Subject: Re: [PATCH] drm/mediatek/dp: fix memory leak on ->get_edid callback
 error path
To: Jani Nikula <jani.nikula@intel.com>, dri-devel@lists.freedesktop.org
Cc: Markus Schneider-Pargmann <msp@baylibre.com>, Guillaume Ranquet <granquet@baylibre.com>, 
	Bo-Chen Chen <rex-bc.chen@mediatek.com>, CK Hu <ck.hu@mediatek.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
	Dmitry Osipenko <dmitry.osipenko@collabora.com>, Chun-Kuang Hu <chunkuang.hu@kernel.org>, 
	Philipp Zabel <p.zabel@pengutronix.de>, Matthias Brugger <matthias.bgg@gmail.com>, 
	linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, stable@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230914_063847_152001_237D4B6B 
X-CRM114-Status: UNSURE (   6.90  )
X-CRM114-Notice: Please train this message.
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

On Thu, 14 Sep 2023 15:10, Jani Nikula <jani.nikula@intel.com> wrote:
>Setting new_edid to NULL leaks the buffer.
>
>Fixes: f70ac097a2cf ("drm/mediatek: Add MT8195 Embedded DisplayPort driver")
>Cc: Markus Schneider-Pargmann <msp@baylibre.com>
>Cc: Guillaume Ranquet <granquet@baylibre.com>
>Cc: Bo-Chen Chen <rex-bc.chen@mediatek.com>
>Cc: CK Hu <ck.hu@mediatek.com>
>Cc: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
>Cc: Dmitry Osipenko <dmitry.osipenko@collabora.com>
>Cc: Chun-Kuang Hu <chunkuang.hu@kernel.org>
>Cc: Philipp Zabel <p.zabel@pengutronix.de>
>Cc: Matthias Brugger <matthias.bgg@gmail.com>
>Cc: dri-devel@lists.freedesktop.org
>Cc: linux-mediatek@lists.infradead.org
>Cc: linux-kernel@vger.kernel.org
>Cc: linux-arm-kernel@lists.infradead.org
>Cc: <stable@vger.kernel.org> # v6.1+
>Signed-off-by: Jani Nikula <jani.nikula@intel.com>
>

Reviewed-by: Guillaume Ranquet <granquet@baylibre.com>
>---
>
>UNTESTED
>---
> drivers/gpu/drm/mediatek/mtk_dp.c | 1 +
> 1 file changed, 1 insertion(+)
>
>diff --git a/drivers/gpu/drm/mediatek/mtk_dp.c b/drivers/gpu/drm/mediatek/mtk_dp.c
>index 2cb47f663756..8fc6eff68e30 100644
>--- a/drivers/gpu/drm/mediatek/mtk_dp.c
>+++ b/drivers/gpu/drm/mediatek/mtk_dp.c
>@@ -2049,6 +2049,7 @@ static struct edid *mtk_dp_get_edid(struct drm_bridge *bridge,
> 	 */
> 	if (mtk_dp_parse_capabilities(mtk_dp)) {
> 		drm_err(mtk_dp->drm_dev, "Can't parse capabilities\n");
>+		kfree(new_edid);
> 		new_edid = NULL;
> 	}
>
>--
>2.39.2
>

