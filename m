Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3AC95CA5FA1
	for <linux-mediatek@archiver.kernel.org>; Mon, 28 Sep 2026 23:44:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=1WdtbWW9ZiTyoHXGF6wqFuwUhglmsjzBGLU11/qcEXY=; b=Lsn1roxVO4uIZ6MkS+ACNnQXPP
	aJFpp8YMAHGElRTQptWYaElfzlNK9yrJvR68Lwf0fqtNZ5QEYwk9RK3ks4ASGgBEqqT1ADu1czUlv
	O903x+qhx6W3UMFSIKlvT6vXQ5QmZQ8Y/ErSrcUZyqEugmWKSd1vMKqf6OR6b1k0wqpF8FBye5uMl
	QApnNAFMjYj85N01X+XFqlMeXwdyrPOmBsYT30oRStMNr3g7qI/e7C9awmby8ysVsbDsmMMGEn5f+
	/o4xgYcEPoNlapcTTgdwgtfAWbRZU1P1a2gzAucy3MsIGcKw6KzGTlWnuM9uIC2JwpyccZolv8OlG
	gGQb6E9w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xBL0t-00000001tav-2v7H;
	Mon, 28 Sep 2026 23:44:03 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xBL0s-00000001taY-1otQ
	for linux-mediatek@lists.infradead.org;
	Mon, 28 Sep 2026 23:44:02 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id DAEC143E18
	for <linux-mediatek@lists.infradead.org>; Mon, 28 Sep 2026 23:44:01 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BF9831F0089A
	for <linux-mediatek@lists.infradead.org>; Mon, 28 Sep 2026 23:44:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790639041;
	bh=1WdtbWW9ZiTyoHXGF6wqFuwUhglmsjzBGLU11/qcEXY=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=M68z9GNgU1PQrr9z96rreonup5D0owhIvGzXs7QpZSeLQ9/G7DCePG8c/J106NVF2
	 ELp/hW5TMc2AR/+rWeSLdh5b7f9XHZnjkhNOA+kktP60q87GW6/PYc+BVKdH2rr+3O
	 pYHGlrlKzuOoIG7xI1cKlu9mEqO8kzArWJo14OQW6/zUIRVgpoBpECMMLlMBaBrYA+
	 uQsYt441dFP1HMl0wkwVJRzPAsSrqyZfi6zdUm+qcnvWeuMBGGmQfi0q1Rwogu22o5
	 AKsCj3oHGRtU4XlGiJ+w6psK3GDWyT2GK4qJq6OfkdCxJS0SztqCYFWc1Oy5K/PFoF
	 sFMKXcWf815NQ==
Received: by mail-dl2-f43.google.com with SMTP id a92af1059eb24-1450541ab50so1569369c88.3
        for <linux-mediatek@lists.infradead.org>; Mon, 28 Sep 2026 16:44:01 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AKwUvBzFL3rbm+bxW1d41I0pb7IQGTCMFEFQkWxaBDxK8832pkPAT712kzySCvfRNtxldJUtsN+hOiDH/w5fNvp3Hw==@lists.infradead.org
X-Gm-Message-State: AFuF++lRasQr9xzV0ARsaX4S0kFvjHMNl2x4u+6+Dru7+P2+MrU1L1Zt
	qDrPsy3qv/6LQXRrTmU/7R4qd9lsSYq4f0o8ekglBp1VUGe0NAKVLxJlqAmHBbPWA5uTPaLyOGH
	nc64/aLDs7WfZ3JPImJI/MMzQRvzgFw==
X-Received: by 2002:a05:7022:220e:b0:143:296a:4e58 with SMTP id
 a92af1059eb24-146cfec8688mr17695133c88.27.1790639041117; Mon, 28 Sep 2026
 16:44:01 -0700 (PDT)
MIME-Version: 1.0
References: <20260828-mtk-hdmi-v2-fix-register-offset-v1-1-118ad5d7ebe3@baylibre.com>
In-Reply-To: <20260828-mtk-hdmi-v2-fix-register-offset-v1-1-118ad5d7ebe3@baylibre.com>
From: Chun-Kuang Hu <chunkuang.hu@kernel.org>
Date: Tue, 29 Sep 2026 07:45:55 +0800
X-Gmail-Original-Message-ID: <CAAOTY_9wM00UUgXCCapLkuNhaV8h7Hh5gDP=ayhUTy2kxLn8gg@mail.gmail.com>
X-Gm-Features: AclHuK9rDQP3ezTpoWlsP6Hp3Tj24gUagLdqOtVesows-kOTI3dxpack7i3LaLs
Message-ID: <CAAOTY_9wM00UUgXCCapLkuNhaV8h7Hh5gDP=ayhUTy2kxLn8gg@mail.gmail.com>
Subject: Re: [PATCH] drm/mediatek: mtk_hdmi_v2: fix VID_DOWNSAMPLE_CONFIG
 register offset
To: Julien Stephan <jstephan@baylibre.com>
Cc: Chun-Kuang Hu <chunkuang.hu@kernel.org>, Philipp Zabel <p.zabel@pengutronix.de>, 
	David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
	Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
	Louis-Alexis Eyraud <louisalexis.eyraud@collabora.com>, CK Hu <ck.hu@mediatek.com>, 
	dri-devel@lists.freedesktop.org, linux-mediatek@lists.infradead.org, 
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	Tommy Chen <tommyyl.chen@mediatek.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
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

Julien Stephan <jstephan@baylibre.com> =E6=96=BC 2026=E5=B9=B48=E6=9C=8828=
=E6=97=A5=E9=80=B1=E4=BA=94 =E4=B8=8B=E5=8D=888:10=E5=AF=AB=E9=81=93=EF=BC=
=9A
>
> According to the datasheet, VID_DOWNSAMPLE_CONFIG is at offset 0x8f0;
> 0x8d0 is the VID_CSC_COEFF_0 register.

Applied to mediatek-drm-fixes [1], thanks.

[1] https://git.kernel.org/pub/scm/linux/kernel/git/chunkuang.hu/linux.git/=
log/?h=3Dmediatek-drm-fixes

Regards,
Chun-Kuang.

>
> Fixes: 8d0f79886273 ("drm/mediatek: Introduce HDMI/DDC v2 for MT8195/MT81=
88")
> Signed-off-by: Julien Stephan <jstephan@baylibre.com>
> ---
>  drivers/gpu/drm/mediatek/mtk_hdmi_regs_v2.h | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/drivers/gpu/drm/mediatek/mtk_hdmi_regs_v2.h b/drivers/gpu/dr=
m/mediatek/mtk_hdmi_regs_v2.h
> index 521b35c7e14d..bf3ebf5492d1 100644
> --- a/drivers/gpu/drm/mediatek/mtk_hdmi_regs_v2.h
> +++ b/drivers/gpu/drm/mediatek/mtk_hdmi_regs_v2.h
> @@ -173,7 +173,7 @@
>  #define  TPI_AUDIO_LOOKUP_EN           BIT(2)
>
>  /* Video downsampling configuration */
> -#define VID_DOWNSAMPLE_CONFIG          0x8d0
> +#define VID_DOWNSAMPLE_CONFIG          0x8f0
>  #define  C444_C422_CONFIG_ENABLE       BIT(0)
>  #define  C422_C420_CONFIG_ENABLE       BIT(4)
>  #define  C422_C420_CONFIG_BYPASS       BIT(5)
>
> ---
> base-commit: 1b78070aaef63512688aebfbc82365ef9d6660f1
> change-id: 20260828-mtk-hdmi-v2-fix-register-offset-879afc38cad1
>
> Best regards,
> --
> Julien Stephan <jstephan@baylibre.com>
>

