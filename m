Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5CD48C00A8F
	for <linux-mediatek@archiver.kernel.org>; Tue, 24 Oct 2023 09:40:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=pFZJO3NvFyuTGjb36RJAaXGwhe1Ycdi/eoT9Ykdj5nc=; b=OwWG2pzvuF0F8aoRv0qPHU6vJF
	qwrK4A3yZk6kHaB2Nxb4D5YlCVoUzBP+f3RrZHq/dTKFBylXKTzbGfPgqIkH2+zbWx4O4jbhOs9mN
	d0SRuJD2sFujGwbX1OVlA4osHijNQmfzcCbZlgb5Ql9EObZGWuTp5Ds5EazRX5e791DypF6wgzstY
	qJ6OFsxBgTHHyLUhrAKcBtyviBzN4TEIcE/GPIUPA1nl8NU54Zntd9SFrcTWkxbl2cvPFmt+LlJPI
	q8vxsx41P5FejpG/4V242bDbhr0dquPugpSTCTx2fpmRkb3NcFpAh0wxAiEZhTd5paIa4MiPyUVmI
	QeRwMz/w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qvDuE-009Lgm-1N;
	Tue, 24 Oct 2023 09:40:58 +0000
Received: from mail-lf1-x12b.google.com ([2a00:1450:4864:20::12b])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qvDuB-009LdU-23
	for linux-mediatek@lists.infradead.org;
	Tue, 24 Oct 2023 09:40:56 +0000
Received: by mail-lf1-x12b.google.com with SMTP id 2adb3069b0e04-507a0907896so6325066e87.2
        for <linux-mediatek@lists.infradead.org>; Tue, 24 Oct 2023 02:40:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1698140439; x=1698745239; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=pFZJO3NvFyuTGjb36RJAaXGwhe1Ycdi/eoT9Ykdj5nc=;
        b=WH3ul9Jl7+6lLMndiACThgJKSXbLhui+CtB1XMVyGOPRcx6mqhLTXWPJUcZh5Z3aUV
         IW6zBzuVc9GtD8TwUW3Ezc5Kk+mz2AJRrWFoY3J5+rTRIbcu5tbOEaAByoKzu5U1lMhI
         VhCYMX0HnXSkhEMFGFkbOxIgKg6btiLhTDeLQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1698140439; x=1698745239;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=pFZJO3NvFyuTGjb36RJAaXGwhe1Ycdi/eoT9Ykdj5nc=;
        b=J6y1CnavRWwyBH+ZdAk36r6E7hKdKMzHHLm4zrRzKoZhwl+KAipvxwrsmYIcHPIdCc
         WdghKLmcHhORcFz5XyW96qixgVxg6F8PT+h90HBaPSecNwzelEkOAU7q23J0bqMwT9ZK
         RwviidQigCx+XxLAWnK2NgsXaZoYgtDlEGfaIA//j4KhcNJjQomVlNbDvRplXAl3KZPf
         VBcJwbcq9+H0ygAK1YLHnZSlY7vWpS+cwfWHUJTyFovtH4QnukxSwtnAEXcbu5Z7UuuJ
         oKh2+bahSuyOEzo7w8tjM2ND0QAXRMQoQUMFRsT9Y8ezYmZu3JJdQy0C6CHj8XbRJPT5
         b3ww==
X-Gm-Message-State: AOJu0YxlpgwobjcR9LgPJs0QMKUg6s26YEePBXd3dCozYf7UPO7+i6iv
	P6DtGCMeNhtVOT/NyLm4RHtObHvyWw94EuKecMJKAg==
X-Google-Smtp-Source: AGHT+IFRZoOVcRS4ZKYarSnzLWrQREggh2jb5IX+ohhI5nUZEVJ5YlSwxKC/Th6J+FUnLbHbkRFl8qn3j0n8dWEz5WA=
X-Received: by 2002:ac2:58e2:0:b0:503:9eb:47f0 with SMTP id
 v2-20020ac258e2000000b0050309eb47f0mr7287602lfo.59.1698140438950; Tue, 24 Oct
 2023 02:40:38 -0700 (PDT)
MIME-Version: 1.0
References: <20231023-display-support-v1-0-5c860ed5c33b@baylibre.com> <20231023-display-support-v1-3-5c860ed5c33b@baylibre.com>
In-Reply-To: <20231023-display-support-v1-3-5c860ed5c33b@baylibre.com>
From: Chen-Yu Tsai <wenst@chromium.org>
Date: Tue, 24 Oct 2023 17:40:27 +0800
Message-ID: <CAGXv+5Hwe8jhgthnxwXEPezhwvhfcE=WMp_My3W8FisRagRTKQ@mail.gmail.com>
Subject: Re: [PATCH 03/18] dt-bindings: display: mediatek: color: add binding
 for MT8365 SoC
To: Alexandre Mergnat <amergnat@baylibre.com>
Cc: Chun-Kuang Hu <chunkuang.hu@kernel.org>, Philipp Zabel <p.zabel@pengutronix.de>, 
	David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>, Rob Herring <robh+dt@kernel.org>, 
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Conor Dooley <conor+dt@kernel.org>, 
	Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
	Jitao Shi <jitao.shi@mediatek.com>, Xinlei Lee <xinlei.lee@mediatek.com>, 
	CK Hu <ck.hu@mediatek.com>, Thierry Reding <thierry.reding@gmail.com>, 
	=?UTF-8?Q?Uwe_Kleine=2DK=C3=B6nig?= <u.kleine-koenig@pengutronix.de>, 
	Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, 
	dri-devel@lists.freedesktop.org, linux-mediatek@lists.infradead.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-pwm@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231024_024055_673362_96EE9D05 
X-CRM114-Status: GOOD (  13.43  )
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

On Mon, Oct 23, 2023 at 10:40=E2=80=AFPM Alexandre Mergnat
<amergnat@baylibre.com> wrote:
>
> Display Color for MT8365 is compatible with another SoC.
> Then, add MT8365 binding along with MT8183 SoC.

This unfortunately doesn't match what the patch is doing.

ChenYu

> Signed-off-by: Alexandre Mergnat <amergnat@baylibre.com>
> ---
>  Documentation/devicetree/bindings/display/mediatek/mediatek,color.yaml |=
 1 +
>  1 file changed, 1 insertion(+)
>
> diff --git a/Documentation/devicetree/bindings/display/mediatek/mediatek,=
color.yaml b/Documentation/devicetree/bindings/display/mediatek/mediatek,co=
lor.yaml
> index f21e44092043..fbf15242af52 100644
> --- a/Documentation/devicetree/bindings/display/mediatek/mediatek,color.y=
aml
> +++ b/Documentation/devicetree/bindings/display/mediatek/mediatek,color.y=
aml
> @@ -39,6 +39,7 @@ properties:
>                - mediatek,mt8188-disp-color
>                - mediatek,mt8192-disp-color
>                - mediatek,mt8195-disp-color
> +              - mediatek,mt8365-disp-color
>            - const: mediatek,mt8173-disp-color
>    reg:
>      maxItems: 1
>
> --
> 2.25.1
>
>

