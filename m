Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4D242C77B7A
	for <linux-mediatek@archiver.kernel.org>; Wed, 31 May 2023 07:43:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=2hCCJrsaz/NjGrHJ94qpM3huv+xsF2o6fZiZu7/z8AY=; b=SFi/CmzYeXlVbl5ShXfFvFlqU6
	nCNsxCfXsw7pQ2qW+a2DXXiVnH+tfLrKlyCNzkJmsCi3ymwc3K+2KdEYaJyLW6uO+j/+mqXSiECNw
	4wM+lFN83LlfZ7TVdg73vtJPV1T9pz5SeemQXKdBbiQNlstwh5KxSflDKS8O03xWFJ3eCQS4RSk0X
	4jeS3l6myJSBZSQDrA/Q0ytvIjDNteDn6yP2dp1b9je8oq6TiJyx0oedZ3WQRrx14aNAST9o3KNS6
	r31X1CTMQh3rkxFgL+7LzdFcnbKq0TlmweBJYep4RG5evkY+psxA+yJ8sl/93r9v63EJXYgWEvTf+
	UB8XR/Qw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1q4GUT-00GUMz-2D;
	Wed, 31 May 2023 07:43:29 +0000
Received: from mail-qv1-xf2c.google.com ([2607:f8b0:4864:20::f2c])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1q4GUQ-00GULg-0Q
	for linux-mediatek@lists.infradead.org;
	Wed, 31 May 2023 07:43:27 +0000
Received: by mail-qv1-xf2c.google.com with SMTP id 6a1803df08f44-62615694bb9so19949506d6.0
        for <linux-mediatek@lists.infradead.org>; Wed, 31 May 2023 00:43:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1685519003; x=1688111003;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=2hCCJrsaz/NjGrHJ94qpM3huv+xsF2o6fZiZu7/z8AY=;
        b=VgW5pvZ3wqpWZIFiq2dd7Bfobqfflrkuq1mJb47cnl5/aQQxXhGgkRBV+EjtQexHxd
         lJZWjBXAxCLvKTbwl27X2FfjdySA+Jwm64MC+9lvyp1mBq4kYsmUet2vBoCNCscQBHV0
         XZoYE0Gq4tiQumSoLTu79fhV4aTBeW4GO+O1E=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1685519003; x=1688111003;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=2hCCJrsaz/NjGrHJ94qpM3huv+xsF2o6fZiZu7/z8AY=;
        b=A+5x8ymm6iJ3widoqS1lgQlHOEk6qUadHSgHrawH6oHUnFqPMflJAyRljqxPBkTMTo
         8+hCLvZRQpmJNYUX+JrGjBOTRvEyNOysW4Vp5ZjS9eGor3nWD17lcUYFLpyuZvMN54GU
         jR7caBLhbZ4yQyBE61H+hDmaKmguA1J7Ly9go1vgkiV4aaRqtQM1fwdR+HpavuNoZSgy
         McNnk4hFtEwvOpOOrO7LR11rEbOfrhcvVhtH4TY4cgzJNmzn1P3TK6kiExhs+wnm6B+z
         xXzkcvfrHUf+6wuB9eT4MhVjFjXkNiJ4a274lS0GXhkQx8RWWUak3hfcIBo8jCpo1IW4
         lAVA==
X-Gm-Message-State: AC+VfDx+OneSKuoZQlrP0jR/0yp/jqPY0tSxs06vun6wnwBZQHa4tS0x
	J0KdoZ8pViJYRUn60K1d+6MfLOHIRVLunug3ffcw8A==
X-Google-Smtp-Source: ACHHUZ55CaO/7pKYADZLoW2cfgMbio+kJB5f8rUaty9cLHbxEhYWcWalPWE0GNlEOIgz74JZcSTB8c25FAlzJvkwUKw=
X-Received: by 2002:a05:6214:528d:b0:625:7802:f36d with SMTP id
 kj13-20020a056214528d00b006257802f36dmr4655699qvb.24.1685519003409; Wed, 31
 May 2023 00:43:23 -0700 (PDT)
MIME-Version: 1.0
References: <20230306080659.15261-1-jason-jh.lin@mediatek.com> <20230306080659.15261-3-jason-jh.lin@mediatek.com>
In-Reply-To: <20230306080659.15261-3-jason-jh.lin@mediatek.com>
From: Chen-Yu Tsai <wenst@chromium.org>
Date: Wed, 31 May 2023 15:43:12 +0800
Message-ID: <CAGXv+5EPktjMABhtWf9dL-25dAe=Mf4=BSMmE+=4m2WisDXXFQ@mail.gmail.com>
Subject: Re: [PATCH v8 2/2] soc: mediatek: remove DDP_DOMPONENT_DITHER from enum
To: Matthias Brugger <matthias.bgg@gmail.com>
Cc: Chun-Kuang Hu <chunkuang.hu@kernel.org>, "Jason-JH.Lin" <jason-jh.lin@mediatek.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
	Nathan Lu <nathan.lu@mediatek.com>, Singo Chang <singo.chang@mediatek.com>, 
	linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org, 
	Project_Global_Chrome_Upstream_Group@mediatek.com, 
	Rex-BC Chen <rex-bc.chen@mediatek.com>, Nancy Lin <nancy.lin@mediatek.com>, 
	linux-mediatek@lists.infradead.org, linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230531_004326_241651_39C0F81B 
X-CRM114-Status: GOOD (  13.75  )
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

Hi Matthias,

On Mon, Mar 6, 2023 at 4:07=E2=80=AFPM Jason-JH.Lin <jason-jh.lin@mediatek.=
com> wrote:
>
> After mmsys and drm change DITHER enum to DDP_COMPONENT_DITHER0,
> mmsys header can remove the useless DDP_COMPONENT_DITHER enum.
>
> Signed-off-by: Jason-JH.Lin <jason-jh.lin@mediatek.com>
> Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collab=
ora.com>
> Reviewed-by: Rex-BC Chen <rex-bc.chen@mediatek.com>
> Acked-by: Matthias Brugger <matthias.bgg@gmail.com>

CK didn't pick up this patch. Since the other patch already got picked up
in v6.4-rc1, could you merge this for v6.5?


Thanks
ChenYu


> ---
>  include/linux/soc/mediatek/mtk-mmsys.h | 3 +--
>  1 file changed, 1 insertion(+), 2 deletions(-)
>
> diff --git a/include/linux/soc/mediatek/mtk-mmsys.h b/include/linux/soc/m=
ediatek/mtk-mmsys.h
> index dc2963a0a0f7..8eb5846985b4 100644
> --- a/include/linux/soc/mediatek/mtk-mmsys.h
> +++ b/include/linux/soc/mediatek/mtk-mmsys.h
> @@ -27,8 +27,7 @@ enum mtk_ddp_comp_id {
>         DDP_COMPONENT_CCORR,
>         DDP_COMPONENT_COLOR0,
>         DDP_COMPONENT_COLOR1,
> -       DDP_COMPONENT_DITHER,
> -       DDP_COMPONENT_DITHER0 =3D DDP_COMPONENT_DITHER,
> +       DDP_COMPONENT_DITHER0,
>         DDP_COMPONENT_DITHER1,
>         DDP_COMPONENT_DP_INTF0,
>         DDP_COMPONENT_DP_INTF1,
> --
> 2.18.0
>

