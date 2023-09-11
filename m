Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A7C54EE7FF4
	for <linux-mediatek@archiver.kernel.org>; Mon, 11 Sep 2023 09:48:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=wm2YmJVOriV/yRdvcbsQXLItPPHdzGLbJNDl3+HotFI=; b=oAwxrTrGvZtKw/tVwLrBAY5sW0
	Z9oOXKcxoQfWlddfbQoRLO2SFnOjkmDqmPkTMhZi3bYKNPtgLvDc3QqljPFW2R3TggEhi8uDqaN8z
	Hzrqup9Bxk68amHdCEB03a0uLnVLZPmaVPMGtmmGofi/XvZZALD/1+sKBoVrTm5CPgrq8N1VsHVSw
	cvx3joxLUwuIiQDOgi4pyP4IBMx0NHDoOVbDEG6+fIK9ZQetmAsxayd5NcDOs3eyNy5ZdvAA7caBe
	aVe1nNFrhXdWzjMe9L2/R61IiDFwPLtvB17eCr3iR7B66DWrpaqpEz2QE2VMakuCyEnmThi9ltF65
	PuoC3hyw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qfdWW-0003gQ-1u;
	Mon, 11 Sep 2023 09:48:04 +0000
Received: from mail-lf1-x132.google.com ([2a00:1450:4864:20::132])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qfdWS-0003bW-1R
	for linux-mediatek@lists.infradead.org;
	Mon, 11 Sep 2023 09:48:03 +0000
Received: by mail-lf1-x132.google.com with SMTP id 2adb3069b0e04-4ff8f2630e3so7134544e87.1
        for <linux-mediatek@lists.infradead.org>; Mon, 11 Sep 2023 02:47:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1694425677; x=1695030477; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=wm2YmJVOriV/yRdvcbsQXLItPPHdzGLbJNDl3+HotFI=;
        b=kUlF3DnvfAIW9QqRw3A6bhm6770Ys57TjhqmJvclGtiCteGFQ5tQ/Q68PMTdzDbJUE
         AM9u3sVNLJIdvKKed2llWPeo3KOfljwYtCgJxcAsEZBYQvtHaMHf8k4yfw0VR70O0UF3
         GpFdt0tQ6+h9FRsz8u/kQ0sGVGFLpFxOAgaa8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1694425677; x=1695030477;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=wm2YmJVOriV/yRdvcbsQXLItPPHdzGLbJNDl3+HotFI=;
        b=m50M7hKDqTQ2yWoSqK1gB2G2/ypA8oTVBowOc7OK0EEMctO2eEbpKCH+/CmDq5xWTk
         ofRnjOUoVVlkaxAJmD4UgioxO7mk/klLzWi/uwY6EoRFGxisJOD79y9DTa1w4iW002Zh
         icbhwzyCOtEPKffCaIrdwoLpdjRxRVK3+ai5g+s+7M6yfyOoA+BpVaHC1McudbG7D7pz
         EqiECgeFQVgxlOWSWi0aWeeM5tAtj121lBmzPChHX6wDyWqnoY8hekEOGYXhpctKUZoy
         mDyiswE+X27c/aaqQvFtcQb2O8R/Pc1hfBcnI/K7y3jd1DaXe9BX2CmgX5HuvkHZrQ7P
         BvhQ==
X-Gm-Message-State: AOJu0YyecJFnq1jn5WlxbA8vpx9y/noKD8u3u73M3tTZix5rH6vZZ3vh
	JYmuafHHqR9aKJMezqIzJHdCHL/NH0Zy53D2oHpsRg==
X-Google-Smtp-Source: AGHT+IGWjA/3h5X0/Q/l0sfVCrt1QJB9gmyw19Mcqrpt2/l1xxEV7W6ZF/oF6qKEC0slUsiKK7HLJI4rHzdG3BsTnkY=
X-Received: by 2002:ac2:58e6:0:b0:501:bdde:5a49 with SMTP id
 v6-20020ac258e6000000b00501bdde5a49mr6797745lfo.15.1694425677350; Mon, 11 Sep
 2023 02:47:57 -0700 (PDT)
MIME-Version: 1.0
References: <20230911080927.17457-1-chun-jen.tseng@mediatek.com>
In-Reply-To: <20230911080927.17457-1-chun-jen.tseng@mediatek.com>
From: Chen-Yu Tsai <wenst@chromium.org>
Date: Mon, 11 Sep 2023 17:47:45 +0800
Message-ID: <CAGXv+5Gqpuu+QVtixOK=ULKkBaqhScFz7tgVqtczknx6CbdjLA@mail.gmail.com>
Subject: Re: [PATCH] arm64: dts: mediatek: mt8186: change CCI OPP scaling mapping
To: Mark Tseng <chun-jen.tseng@mediatek.com>
Cc: Rob Herring <robh+dt@kernel.org>, 
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Conor Dooley <conor+dt@kernel.org>, 
	Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-mediatek@lists.infradead.org, 
	Project_Global_Chrome_Upstream_Group@mediatek.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230911_024800_582488_A02092F4 
X-CRM114-Status: GOOD (  15.39  )
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

On Mon, Sep 11, 2023 at 4:09=E2=80=AFPM Mark Tseng <chun-jen.tseng@mediatek=
.com> wrote:
>
> The original CCI OPP table minimum frequency 500Mhz is too low to cause
> system stall, So it need update to new version, 1.4G ~ 1.05G.

This doesn't read as you think it does. I suggest the following instead:

The original CCI OPP table's lowest frequency 500 MHz is too low and causes
system stalls. Increase the frequency range to 1.05 GHz ~ 1.4 GHz and adjus=
t
the OPPs accordingly.


I also suggest making the subject more precise, like "Increase CCI frequenc=
y".

ChenYu

>
> Fixes: 32dfbc03fc26 ("arm64: dts: mediatek: mt8186: Add CCI node and CCI =
OPP table")
>
> Signed-off-by: Mark Tseng <chun-jen.tseng@mediatek.com>
> ---
>  arch/arm64/boot/dts/mediatek/mt8186.dtsi | 90 ++++++++++++------------
>  1 file changed, 45 insertions(+), 45 deletions(-)
>
> diff --git a/arch/arm64/boot/dts/mediatek/mt8186.dtsi b/arch/arm64/boot/d=
ts/mediatek/mt8186.dtsi
> index f04ae70c470a..b98832d032eb 100644
> --- a/arch/arm64/boot/dts/mediatek/mt8186.dtsi
> +++ b/arch/arm64/boot/dts/mediatek/mt8186.dtsi
> @@ -39,79 +39,79 @@
>                 compatible =3D "operating-points-v2";
>                 opp-shared;
>
> -               cci_opp_0: opp-500000000 {
> -                       opp-hz =3D /bits/ 64 <500000000>;
> -                       opp-microvolt =3D <600000>;
> +               cci_opp_0: opp-1050000000 {
> +                       opp-hz =3D /bits/ 64 <1050000000>;
> +                       opp-microvolt =3D <843750>;
>                 };
>
> -               cci_opp_1: opp-560000000 {
> -                       opp-hz =3D /bits/ 64 <560000000>;
> -                       opp-microvolt =3D <675000>;
> +               cci_opp_1: opp-1073000000 {
> +                       opp-hz =3D /bits/ 64 <1073000000>;
> +                       opp-microvolt =3D <850000>;
>                 };
>
> -               cci_opp_2: opp-612000000 {
> -                       opp-hz =3D /bits/ 64 <612000000>;
> -                       opp-microvolt =3D <693750>;
> +               cci_opp_2: opp-1096000000 {
> +                       opp-hz =3D /bits/ 64 <1096000000>;
> +                       opp-microvolt =3D <856250>;
>                 };
>
> -               cci_opp_3: opp-682000000 {
> -                       opp-hz =3D /bits/ 64 <682000000>;
> -                       opp-microvolt =3D <718750>;
> +               cci_opp_3: opp-1120000000 {
> +                       opp-hz =3D /bits/ 64 <1120000000>;
> +                       opp-microvolt =3D <862500>;
>                 };
>
> -               cci_opp_4: opp-752000000 {
> -                       opp-hz =3D /bits/ 64 <752000000>;
> -                       opp-microvolt =3D <743750>;
> +               cci_opp_4: opp-1143000000 {
> +                       opp-hz =3D /bits/ 64 <1143000000>;
> +                       opp-microvolt =3D <881250>;
>                 };
>
> -               cci_opp_5: opp-822000000 {
> -                       opp-hz =3D /bits/ 64 <822000000>;
> -                       opp-microvolt =3D <768750>;
> +               cci_opp_5: opp-1166000000 {
> +                       opp-hz =3D /bits/ 64 <1166000000>;
> +                       opp-microvolt =3D <893750>;
>                 };
>
> -               cci_opp_6: opp-875000000 {
> -                       opp-hz =3D /bits/ 64 <875000000>;
> -                       opp-microvolt =3D <781250>;
> +               cci_opp_6: opp-1190000000 {
> +                       opp-hz =3D /bits/ 64 <1190000000>;
> +                       opp-microvolt =3D <906250>;
>                 };
>
> -               cci_opp_7: opp-927000000 {
> -                       opp-hz =3D /bits/ 64 <927000000>;
> -                       opp-microvolt =3D <800000>;
> +               cci_opp_7: opp-1213000000 {
> +                       opp-hz =3D /bits/ 64 <1213000000>;
> +                       opp-microvolt =3D <918750>;
>                 };
>
> -               cci_opp_8: opp-980000000 {
> -                       opp-hz =3D /bits/ 64 <980000000>;
> -                       opp-microvolt =3D <818750>;
> +               cci_opp_8: opp-1236000000 {
> +                       opp-hz =3D /bits/ 64 <1236000000>;
> +                       opp-microvolt =3D <937500>;
>                 };
>
> -               cci_opp_9: opp-1050000000 {
> -                       opp-hz =3D /bits/ 64 <1050000000>;
> -                       opp-microvolt =3D <843750>;
> +               cci_opp_9: opp-1260000000 {
> +                       opp-hz =3D /bits/ 64 <1260000000>;
> +                       opp-microvolt =3D <950000>;
>                 };
>
> -               cci_opp_10: opp-1120000000 {
> -                       opp-hz =3D /bits/ 64 <1120000000>;
> -                       opp-microvolt =3D <862500>;
> +               cci_opp_10: opp-1283000000 {
> +                       opp-hz =3D /bits/ 64 <1283000000>;
> +                       opp-microvolt =3D <962500>;
>                 };
>
> -               cci_opp_11: opp-1155000000 {
> -                       opp-hz =3D /bits/ 64 <1155000000>;
> -                       opp-microvolt =3D <887500>;
> +               cci_opp_11: opp-1306000000 {
> +                       opp-hz =3D /bits/ 64 <1306000000>;
> +                       opp-microvolt =3D <975000>;
>                 };
>
> -               cci_opp_12: opp-1190000000 {
> -                       opp-hz =3D /bits/ 64 <1190000000>;
> -                       opp-microvolt =3D <906250>;
> +               cci_opp_12: opp-1330000000 {
> +                       opp-hz =3D /bits/ 64 <1330000000>;
> +                       opp-microvolt =3D <993750>;
>                 };
>
> -               cci_opp_13: opp-1260000000 {
> -                       opp-hz =3D /bits/ 64 <1260000000>;
> -                       opp-microvolt =3D <950000>;
> +               cci_opp_13: opp-1353000000 {
> +                       opp-hz =3D /bits/ 64 <1353000000>;
> +                       opp-microvolt =3D <1006250>;
>                 };
>
> -               cci_opp_14: opp-1330000000 {
> -                       opp-hz =3D /bits/ 64 <1330000000>;
> -                       opp-microvolt =3D <993750>;
> +               cci_opp_14: opp-1376000000 {
> +                       opp-hz =3D /bits/ 64 <1376000000>;
> +                       opp-microvolt =3D <1018750>;
>                 };
>
>                 cci_opp_15: opp-1400000000 {
> --
> 2.18.0
>

