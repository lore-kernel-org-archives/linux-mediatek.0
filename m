Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 80556C61DA4
	for <linux-mediatek@archiver.kernel.org>; Sun, 29 Jan 2023 02:43:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=pOuOJHJOgcXScbA0cO7u2RDbmSRLGbfI56zQrx2KeEY=; b=23tqhKWip1BsVMfoLsA/c/mAQ+
	L2+JtgIrNEqDMj7g0esVd8D3v5B096k4OIljIwYhossAFR54A1A8/uFFgMaR8gFVAW6KYUne8k9Yu
	R4svsUVbemmYt068usr99UzqxE0lFY4LP4RBqjTmHg/uEG2Zf8zdi6lzEwZqTsPy4G0+yqUnFvKaA
	4YqQXRLKtb43X3NUxuyMqFcHCJ5NzG4wqm0p74xibSzZY19zvFllmn50r1NdhFFNh6q3QAfhSe5QI
	jaWAwnf8j59JhWR82z5Uh/uy1bDVc4JZ/lIqxzNuWqyTFoZp5Kh3zITwPEj1CKO8vLvRIrDk7tkSj
	Yd0p9jYA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pLxev-000vZ4-G9; Sun, 29 Jan 2023 02:43:09 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pLxek-000vW3-Ev; Sun, 29 Jan 2023 02:42:59 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 44E1360C72;
	Sun, 29 Jan 2023 02:42:56 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9C0BDC4339E;
	Sun, 29 Jan 2023 02:42:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1674960175;
	bh=eLjMMpuPC+msCk8tJokSDBn8qk6r0ihX0UPlPEdZoaY=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=dDkj/RkiTABi/evFeqEhGLVjK5k0aLdPX2t9ZcRikgbdYq7Cqo/dvjRnNAalj6mmF
	 9RGxEs4Q6yznwG0Pa5PvDKqgwW32NGtmiBPDoVqR9GhxAZqFUiJ6281Ua2pULHs1Y5
	 3fG+G3povprQqgm7lRrS/v+lIn82T8gyj+cN8f8oUDNlMxam6Px9GmwzIe8yNj9etO
	 DX+7JRJy42z9fNt4g6bM/Bwh1/pFpIVbgWqqK996pUlf63nSfpDiXpoRFRODW3KqSx
	 5w8vsoMlm4g5aBgNy6yssxlkZ3AWNdcDzyLeccNQIrTcFMDEZ3hG7EdCl0dQ8uMPDg
	 Fgg0YV7oYQ22A==
Received: by mail-lj1-f175.google.com with SMTP id g14so9505109ljh.10;
        Sat, 28 Jan 2023 18:42:55 -0800 (PST)
X-Gm-Message-State: AO0yUKVA+sAMe75AowivqqlDVkL39iV1dUIhn8Xi8IgfMXLN3lIYRYGp
	82TiGEl5QnJtAt1BWfSVNYXEY09UlQnpMazKCg==
X-Google-Smtp-Source: AK7set8aEKszNvVH3ydOBmwpXEYphtTde4TFpUS74w2l17hiB5Fp963hu02r5xyQBUTx/v1BLaq47isJzUKHIoZViTg=
X-Received: by 2002:a2e:3c0a:0:b0:28d:bb26:1902 with SMTP id
 j10-20020a2e3c0a000000b0028dbb261902mr1460711lja.22.1674960173614; Sat, 28
 Jan 2023 18:42:53 -0800 (PST)
MIME-Version: 1.0
References: <20230118091829.755-1-allen-kh.cheng@mediatek.com> <20230118091829.755-9-allen-kh.cheng@mediatek.com>
In-Reply-To: <20230118091829.755-9-allen-kh.cheng@mediatek.com>
From: Chun-Kuang Hu <chunkuang.hu@kernel.org>
Date: Sun, 29 Jan 2023 10:42:41 +0800
X-Gmail-Original-Message-ID: <CAAOTY_-he6yeunyTjNU8wT0T=Uc3yxDx+unFm8NJ4HHqHyTv9A@mail.gmail.com>
Message-ID: <CAAOTY_-he6yeunyTjNU8wT0T=Uc3yxDx+unFm8NJ4HHqHyTv9A@mail.gmail.com>
Subject: Re: [PATCH v2 8/9] dt-bindings: display: mediatek: Fix the fallback
 for mediatek,mt8186-disp-ccorr
To: Allen-KH Cheng <allen-kh.cheng@mediatek.com>
Cc: Matthias Brugger <matthias.bgg@gmail.com>, Rob Herring <robh+dt@kernel.org>, 
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Chun-Kuang Hu <chunkuang.hu@kernel.org>, 
	Philipp Zabel <p.zabel@pengutronix.de>, David Airlie <airlied@gmail.com>, 
	Daniel Vetter <daniel@ffwll.ch>, Stephen Boyd <sboyd@kernel.org>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, dri-devel@lists.freedesktop.org, 
	Project_Global_Chrome_Upstream_Group@mediatek.com, devicetree@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	linux-mediatek@lists.infradead.org, hsinyi@chromium.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230128_184258_597170_02C5C557 
X-CRM114-Status: GOOD (  17.89  )
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

Hi, Allen:

Allen-KH Cheng <allen-kh.cheng@mediatek.com> =E6=96=BC 2023=E5=B9=B41=E6=9C=
=8818=E6=97=A5 =E9=80=B1=E4=B8=89 =E4=B8=8B=E5=8D=885:18=E5=AF=AB=E9=81=93=
=EF=BC=9A
>
> The mt8186-disp-ccorr is not fully compatible with the mt8183-disp-ccorr
> implementation. It causes a crash when system resumes if it binds to the
> device.
>
> We should use mt8192-disp-ccorr as fallback of mt8186-disp-ccorr.

Applied to mediatek-drm-next [1], thanks.

[1] https://git.kernel.org/pub/scm/linux/kernel/git/chunkuang.hu/linux.git/=
log/?h=3Dmediatek-drm-next

Regards,
Chun-Kuang.

>
> Fixes: 8a26ea19d4dc ("dt-bindings: display: mediatek: add MT8186 SoC bind=
ing")
> Signed-off-by: Allen-KH Cheng <allen-kh.cheng@mediatek.com>
> Reviewed-by: Rob Herring <robh@kernel.org>
> ---
>  .../devicetree/bindings/display/mediatek/mediatek,ccorr.yaml    | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/Documentation/devicetree/bindings/display/mediatek/mediatek,=
ccorr.yaml b/Documentation/devicetree/bindings/display/mediatek/mediatek,cc=
orr.yaml
> index 63fb02014a56..117e3db43f84 100644
> --- a/Documentation/devicetree/bindings/display/mediatek/mediatek,ccorr.y=
aml
> +++ b/Documentation/devicetree/bindings/display/mediatek/mediatek,ccorr.y=
aml
> @@ -32,7 +32,7 @@ properties:
>        - items:
>            - enum:
>                - mediatek,mt8186-disp-ccorr
> -          - const: mediatek,mt8183-disp-ccorr
> +          - const: mediatek,mt8192-disp-ccorr
>
>    reg:
>      maxItems: 1
> --
> 2.18.0
>

