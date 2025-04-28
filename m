Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 576C0C369DC
	for <linux-mediatek@archiver.kernel.org>; Mon, 28 Apr 2025 16:21:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ozyYaD4uyMvYAeC6ThRYIW6+h6QCpMFE1Z79BTTe4Ys=; b=XFpB0m3eJyBXgZeiUVNUFRhLBJ
	jheGelnpfi6zjbxNIY3RZKXjOnntTlDag/0C5WZEXLdPXYxtkCZuSbzoXUHw0y0+ZyfE+mmKnNFts
	Gjlg3reQdx26eb+3mfcj0lDnov6nbkn2vIioVe0QSmhrh1ihwRgi7HNfAlTbj8L0PUZnwUNxK6CDN
	MEcpNMAEGLkRZ6aDFU4Y3NG25nTXIPp05PdCXXOSvjGUffxTk2P3cZDqalTpnKcigBLNh6mk4y3o1
	GLxcH1OZAVmzODTXwPdHAFcU6RN3Jv1XE2QV8ceDVaQ+NV6t5Ge0JC7x4QE0SIiM+hOX1QeX3bI26
	dq3UsToA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u9REl-00000006u7o-1hrl;
	Mon, 28 Apr 2025 16:21:43 +0000
Received: from mail-yw1-x112c.google.com ([2607:f8b0:4864:20::112c])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u9REj-00000006u6e-3UPA
	for linux-mediatek@lists.infradead.org;
	Mon, 28 Apr 2025 16:21:42 +0000
Received: by mail-yw1-x112c.google.com with SMTP id 00721157ae682-703cd93820fso43049487b3.2
        for <linux-mediatek@lists.infradead.org>; Mon, 28 Apr 2025 09:21:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1745857301; x=1746462101; darn=lists.infradead.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=ozyYaD4uyMvYAeC6ThRYIW6+h6QCpMFE1Z79BTTe4Ys=;
        b=MlmTv+8Qjifz7gcNndMWmd/VfUlgHdIWLBbCpo4zA+26beQh6kzVmk5PK81tkhVbOn
         DiI2I5xAwMQykmWAMatC8HBXnymdVJNHT2Dx0fdzEzgsBCL4bGAxCYcgVtPn1zc26shp
         vXuq94cmbcJ18N+2j2WYXvE+lwNvxkrmcSoca4VGArTKdiOPD6+IwpMaFPEKpy8fPkuV
         AWZXOgfLx+kH9haVsgneQydsbzlOCBp0sLMe0F2obI5YVqaVRVPg5bSIe0+FWLSzCzVE
         CjtEWMHOM6O3ptozfCVy7NDZWGJvxyvgiGNB1NrZ8hJ2cPW/30HJg8WrjSu/2cuDFntn
         TBAw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745857301; x=1746462101;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ozyYaD4uyMvYAeC6ThRYIW6+h6QCpMFE1Z79BTTe4Ys=;
        b=jaUVrNI8WhR0YWBjxkw3FHlhk4wvUGlc31b50J3b5ZirhHGPEQE37fkKdq69HTqhT4
         ZNv4XiJBOUyTKOUTIuAx5uikz+hCXQVRatGjFhXKc9ozXTLuwwTKpFOCeNClRntvpGa4
         oWYAGVUf1OX+vzcZwo5Y1ZiCvEdPB5XFtpMYR/1vxR8y1Pmt7B7mCt2Gt7xyYDaGsKPc
         spUzwfijcx1AaJvKe9l9Ks1TwniRQgqFPJZlugBSrRqUsqViFAlo09ll/wuO+PfeIOWJ
         UFmdO3D9qTworZoLieowE5r38iYP/C6m50lpndDyn8//8U2PAcoyfi7B+UFqbS3rOrFj
         NIBA==
X-Forwarded-Encrypted: i=1; AJvYcCXarHQuQU3bgztaaxw9lRXXmrVgrFuSoV1b4J+b5/3cewIlEJL/jNdDZc1Bh7HRE8LCp7weFHvVNFQGnAUu5g==@lists.infradead.org
X-Gm-Message-State: AOJu0YwlrddbPhwn45NKmik6AHEz0evCEq7cDvzFXAiZ2uzSbUWWGbht
	hqV/7ttqGNei1C4OSKjVoygjNXivcneiuNS+VzB5BDg66/j/fih+AGNljvBFMjVY8SMjcbUv6J8
	Hiz7dciEXSbPll3/KzmPXjDLVmYJE6kZtmVfJxg==
X-Gm-Gg: ASbGncvGYdnnl3hLDSftPcfVUfRGeWitAa0353keREtZP8cEH2oavtJ8WN7HVyDOpV6
	+z7XIcUjz8f/KezfSAYDWegzfyA9Udpnjd37fxzEKeHtK1F54I72/0V24NiEdI0ktbnHGemW3AG
	XCLiG/rBAbVrQMiLOwxJ/bDvU=
X-Google-Smtp-Source: AGHT+IF3Nj6mWpTWBj/+o4tJL25s0CN8hYakvk9PwN70OV0ov5/0UD6xzNyRF97ztJi6m2LHGnOwz76IAO3Cf/tDFG0=
X-Received: by 2002:a05:690c:7304:b0:708:170c:a699 with SMTP id
 00721157ae682-7085f239adamr122430517b3.27.1745857300782; Mon, 28 Apr 2025
 09:21:40 -0700 (PDT)
MIME-Version: 1.0
References: <20250416120245.147951-1-angelogioacchino.delregno@collabora.com>
In-Reply-To: <20250416120245.147951-1-angelogioacchino.delregno@collabora.com>
From: Ulf Hansson <ulf.hansson@linaro.org>
Date: Mon, 28 Apr 2025 18:21:05 +0200
X-Gm-Features: ATxdqUG1v-Vp3M3iAycu00z5_FRl29-cbPTsX6LqWTtDPHUaj3lI0F-RZsKBbmI
Message-ID: <CAPDyKFrjaEk49O4T1dfaxmA1OSsFaF_iH3U73mq-fWnbBiRaVw@mail.gmail.com>
Subject: Re: [PATCH] dt-bindings: mmc: mtk-sd: Add support for Dimensity 1200 MT6893
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: chaotian.jing@mediatek.com, robh@kernel.org, krzk+dt@kernel.org, 
	conor+dt@kernel.org, matthias.bgg@gmail.com, wenbin.mei@mediatek.com, 
	linux-mmc@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-mediatek@lists.infradead.org, kernel@collabora.com
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250428_092141_871194_A03EBADB 
X-CRM114-Status: GOOD (  14.81  )
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

On Wed, 16 Apr 2025 at 14:02, AngeloGioacchino Del Regno
<angelogioacchino.delregno@collabora.com> wrote:
>
> Add a compatible for the MediaTek Dimensity 1200 (MT6893) SoC.
> All of the MMC/SD controllers in this chip are compatible with
> the ones found in MT8183, but do also make use of an optional
> crypto clock when enabling HW disk encryption.
>
> Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>

Applied for next, thanks!

Kind regards
Uffe


> ---
>  Documentation/devicetree/bindings/mmc/mtk-sd.yaml | 2 ++
>  1 file changed, 2 insertions(+)
>
> diff --git a/Documentation/devicetree/bindings/mmc/mtk-sd.yaml b/Documentation/devicetree/bindings/mmc/mtk-sd.yaml
> index 0debccbd6519..6dd26ad31491 100644
> --- a/Documentation/devicetree/bindings/mmc/mtk-sd.yaml
> +++ b/Documentation/devicetree/bindings/mmc/mtk-sd.yaml
> @@ -32,6 +32,7 @@ properties:
>            - const: mediatek,mt2701-mmc
>        - items:
>            - enum:
> +              - mediatek,mt6893-mmc
>                - mediatek,mt8186-mmc
>                - mediatek,mt8188-mmc
>                - mediatek,mt8192-mmc
> @@ -299,6 +300,7 @@ allOf:
>        properties:
>          compatible:
>            enum:
> +            - mediatek,mt6893-mmc
>              - mediatek,mt8186-mmc
>              - mediatek,mt8188-mmc
>              - mediatek,mt8195-mmc
> --
> 2.49.0
>

