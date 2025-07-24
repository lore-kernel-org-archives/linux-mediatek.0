Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 34857C87FD1
	for <linux-mediatek@archiver.kernel.org>; Thu, 24 Jul 2025 10:09:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:Content-Type:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=1EGUBO7UhvbornJQ/pvHFRfx3IzKAnj1mgdzrBixYxY=; b=pLFvmypId11A0I
	1R+yDiJVJtp6YmQ6k/ly1XXUVztUSum2a6HdyJcYsHQoHquBvsxapB3ywd5KczNOGU2kJEsx0SaPi
	Sqcu+zMNc3p4/Jrm+Faik96uBkSTqTCunwMqThI0ypZgTq2WAqZPGJS06lx+CUwpZi4Y8d2DuQPMb
	6SckYXAUsfG4Hq6gFg3WgtAqtewZwJE0yZ1yCT08WeQYBp4a35GUPqQWQLLklk39Ft+TAbtS+3Y0Q
	6mZbO21GvuvefQpA6fzGkQvqbqs1sC7y8xH5nHWS5i67hrfDlM7vAUMr5kewyZEkvdqUF/5rMglqj
	DRG5z4xfBy4J8GR8Wrkw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uesst-00000007AQp-0L5D;
	Thu, 24 Jul 2025 10:09:07 +0000
Received: from mail-lf1-x12c.google.com ([2a00:1450:4864:20::12c])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ues43-000000070Xq-11Ns
	for linux-mediatek@lists.infradead.org;
	Thu, 24 Jul 2025 09:16:36 +0000
Received: by mail-lf1-x12c.google.com with SMTP id 2adb3069b0e04-556373661aaso671683e87.2
        for <linux-mediatek@lists.infradead.org>; Thu, 24 Jul 2025 02:16:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1753348593; x=1753953393; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=1EGUBO7UhvbornJQ/pvHFRfx3IzKAnj1mgdzrBixYxY=;
        b=CFAK04A5lac39+h1Se1wGHznF5gSZkI0ly9Qle3XWbm1IDVKq2wIoATb/iun2stirB
         rOhPhmNDdwkm8XfMvZ0EX3756s4PE9HARQpJfJsY7UIk6Oal5barFzrU+deLb/aShhSk
         +3eIEjigwyPr2nfZAvyNkN0PE2yEZU1sR6oiQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753348593; x=1753953393;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=1EGUBO7UhvbornJQ/pvHFRfx3IzKAnj1mgdzrBixYxY=;
        b=Zq0Ayl5VajvZLN0OmvV3yZXGjg+HBCSDZ89GhcG6puavzFIXJ1JV0MOKf8KINjN/h3
         Il76CDJDYMJyfDgddVvmyUZRNQBbrmD5fNu3yBjdDdcZJYiVfBySkdG3xVwB4ChD68h7
         x1auHrFTxaCDtjAGDIjGyS1HBAAfrLzOWUGobwDmRBs4Z7Fqgsev5mpxnK8zPrKgk1+B
         qk0ZVhGXfXuAVIoyBguvuWy7xxNIqVSBezHbwSEEhFOopGf9bImth+k2tEr+3PhPS1no
         eRQglX+690FqEvgCLWRUjx/NmEISF8oTaFBjvbJNOpP8tQOD57YlytUOTeNyyguqkmsx
         nUsQ==
X-Gm-Message-State: AOJu0YzYR/huzqUa60nhV/dPpjCmKguOqT7hA8pFAkcpRF/RIswG/fjp
	bgYBgT2sM67tnps1URfNQDfjdR2YqJWo55HzLrrHP8OFG7/iBWRTe7HvPHjoFQLhI6DZlBiL7Go
	t8vKWBg4FO6k6uGSfnpUC1NGXqDcZ5Zq/5L5gxguq
X-Gm-Gg: ASbGncsezQm2MYvVVuWtTs+sl3rcjE1PGLceE3T5oWwNtLLBPXsRbpyfIPjCaHd3dXZ
	V0NBXk44dH/ou9q74C5DSj70pIB4HCBmJSX9a7wTCdTx85peCJBw28OteK+gaDFFW1zy/8+h51Z
	2OinOsMLwgo97mRuEBPylu05rKZt3/mFxnt8b8OAwzOOv1pDDEsw831UtwfdR0v77uInx4Ddg8i
	mmD+wIIf8zQxDdwvLhJjyHdkDjL9adH+kY=
X-Google-Smtp-Source: AGHT+IFazo0IJsf/W4w5gkkS9NANKkfwPsnIOoIE7mqPwq0TufYlLOotKobMGK5+6Hu6w3hpGvP3VOsw43jDOtB0xs8=
X-Received: by 2002:a05:6512:3ba6:b0:553:6583:8e6 with SMTP id
 2adb3069b0e04-55a5136bd25mr1849929e87.15.1753348592903; Thu, 24 Jul 2025
 02:16:32 -0700 (PDT)
MIME-Version: 1.0
References: <20250724083914.61351-1-angelogioacchino.delregno@collabora.com> <20250724083914.61351-2-angelogioacchino.delregno@collabora.com>
In-Reply-To: <20250724083914.61351-2-angelogioacchino.delregno@collabora.com>
From: Chen-Yu Tsai <wenst@chromium.org>
Date: Thu, 24 Jul 2025 17:16:21 +0800
X-Gm-Features: Ac12FXzsHRsmJR2EJuPhkIesX-COS28ovNftNstiUszbMRhNBb7-HPz6xQpMdw4
Message-ID: <CAGXv+5HTdK8aiUYdtNVhWAvsSNfMPgK6iCqe-Jsb-OBqQBWsBg@mail.gmail.com>
Subject: Re: [PATCH 01/38] dt-bindings: display: mediatek: dpi: Allow
 specifying resets
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250724_021635_304968_19EBFC5F 
X-CRM114-Status: GOOD (  17.05  )
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
Cc: daniel.lezcano@linaro.org, mwalle@kernel.org, chunkuang.hu@kernel.org, linus.walleij@linaro.org, linux-remoteproc@vger.kernel.org, dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, olivia.wen@mediatek.com, shane.chien@mediatek.com, devicetree@vger.kernel.org, linux-gpio@vger.kernel.org, linux-phy@lists.infradead.org, airlied@gmail.com, simona@ffwll.ch, robh@kernel.org, herbert@gondor.apana.org.au, eugen.hristev@linaro.org, jassisinghbrar@gmail.com, jiaxin.yu@mediatek.com, andy.teng@mediatek.com, chunfeng.yun@mediatek.com, jieyy.yang@mediatek.com, kishon@kernel.org, conor+dt@kernel.org, jitao.shi@mediatek.com, p.zabel@pengutronix.de, arnd@arndb.de, kyrie.wu@mediatek.corp-partner.google.com, maarten.lankhorst@linux.intel.com, tinghan.shen@mediatek.com, mripard@kernel.org, ck.hu@mediatek.com, broonie@kernel.org, linux-mediatek@lists.infradead.org, houlong.wei@mediatek.com, matthias.bgg@gmail.com, tglx@linutronix.de, mchehab@kernel.org, linux-arm-kernel@lists.infradead.org, granquet@baylibre.com, sam.shih@mediatek.com, mathieu.poirier@linaro.org, fparent@baylibre.com, andersson@kernel.org, sean.wang@kernel.org, linux-sound@vger.kernel.org, lgirdwood@gmail.com, vkoul@kernel.org, linux-crypto@vger.kernel.org, tzimmermann@suse.de, atenart@kernel.org, krzk+dt@kernel.org, linux-media@vger.kernel.org, davem@davemloft.net
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On Thu, Jul 24, 2025 at 4:39=E2=80=AFPM AngeloGioacchino Del Regno
<angelogioacchino.delregno@collabora.com> wrote:
>
> Even though the DPI IP has a reset bit on all MediaTek SoCs, it
> is optional, and has always been unused until MT8195; specifically:
> on older SoCs, like MT8173, the reset bit is located in MMSYS, and
> on newer SoCs, like MT8195, it is located in VDOSYS.
>
> For this reason, allow specifying the resets and reset-names on
> all MediaTek SoCs.
>
> Those properties are optional because there are multiple ways to
> reset this IP and the reset lines in MM/VDO are used only if the
> IP cannot perform warm-reset.
>
> Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@coll=
abora.com>
> ---
>  .../devicetree/bindings/display/mediatek/mediatek,dpi.yaml | 7 +++++++
>  1 file changed, 7 insertions(+)
>
> diff --git a/Documentation/devicetree/bindings/display/mediatek/mediatek,=
dpi.yaml b/Documentation/devicetree/bindings/display/mediatek/mediatek,dpi.=
yaml
> index b659d79393a8..eb4f276e8dc4 100644
> --- a/Documentation/devicetree/bindings/display/mediatek/mediatek,dpi.yam=
l
> +++ b/Documentation/devicetree/bindings/display/mediatek/mediatek,dpi.yam=
l
> @@ -102,6 +102,13 @@ properties:
>        - port@0
>        - port@1
>
> +  resets:
> +    maxItems: 1
> +
> +  reset-names:
> +    items:
> +      - const: dpi
> +

Do we really need the name if there is only one though?

>  required:
>    - compatible
>    - reg
> --
> 2.50.1
>

