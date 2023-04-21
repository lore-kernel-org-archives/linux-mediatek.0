Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 69F3EC7618E
	for <linux-mediatek@archiver.kernel.org>; Fri, 21 Apr 2023 06:46:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=c8rGJOc85qIlsCEw2pQTROCuUhgxQbJfAVwawiJ5nNY=; b=ZOJQitglN4aZFVUP+YfygJ1I8W
	yGMSATb8Fl4emDikHY48SkCqOZ35BOytx5DG7UpMwgbuD6Ogd/ttItoNcY0SEud3PApxP4Q1+HrgM
	KceSMWU561XaJtHL4tyos5WGYGKkJbAPDqNH7UPehFyxw1Tjz0RKnww2PWYAeySgneU/XvNdbmVVT
	WiDa4tv+BwXa4KfaNLEDA5Cbvm8sYXEPKJmIwDX7bh+zXIhRUv81aw5LvIEKawGgofccYH26LG3t7
	H0ZOysLr92VXSxarUArswdO/39r+uGStUBD4XLueDtCgrE60YcPVuvufqX6lwvbzVHAMb8M5azBPD
	bH2dVMFQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1ppkXJ-009s6j-1w;
	Fri, 21 Apr 2023 06:46:25 +0000
Received: from mail-ua1-x929.google.com ([2607:f8b0:4864:20::929])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1ppkXF-009s5I-2A
	for linux-mediatek@lists.infradead.org;
	Fri, 21 Apr 2023 06:46:23 +0000
Received: by mail-ua1-x929.google.com with SMTP id a1e0cc1a2514c-77858d8dcb5so5453631241.1
        for <linux-mediatek@lists.infradead.org>; Thu, 20 Apr 2023 23:46:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1682059579; x=1684651579;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=c8rGJOc85qIlsCEw2pQTROCuUhgxQbJfAVwawiJ5nNY=;
        b=VUlajZafzyZ/QAZ2etTEDkTYnUMuKwu8jBdsx5O8omch76Ox0jh2Cjvu2tY5/cuZo6
         ZUU3MEY7hDyOC9nmKFkojb3FJp2tN1l4SmRCENFxE/RrqM/KB2Orc4bmDjzJ8nrvZ1j2
         I513zQ6Gu/dAOqam4KJCl84lP+hQhRDkdxxbg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1682059579; x=1684651579;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=c8rGJOc85qIlsCEw2pQTROCuUhgxQbJfAVwawiJ5nNY=;
        b=AGmlG8hKj89PZDr2qaJdz95IrbLBCUgR1zgizzTFwh9UrEvuN+YPT6Iylwg8FN1mn4
         /wVP8YkLLbsffukoBBRXU82zEzBsNv5G83ZIJtc1GTWSaPpbliu+hbtgQ7ETr1XFJ56W
         91jjREaYoORd2E9+N4AiFNyvGCuEL5nNxQvBxhxMC4uyHmL9k/SNzS1WEFPTUaMRGYDP
         fYsXh5EnlZ1kQtUradkY+YkurDGPRQ9hpTnGLmCa0wvdKwCnNmk0m4AXv1uIpnAcs8Rg
         Fouip20Ak16DkKMm1rNeKi8EXlvgOL3phsfUkAFJj4NMgrcnLM/pjaDYQK2k/nt/wTFO
         pfbA==
X-Gm-Message-State: AAQBX9fpp+1wEUVymsnsGmQiYTDVUlelMKrl+iMtBu+y8TUOfqDCv53X
	R19GYvvZPXT/JXx7pI7DO4lCZaUamvFhyfeujNIc2Q==
X-Google-Smtp-Source: AKy350br7yCL1OJ1XJzVtNg1OFPeo3p9YhQpUa8cOHRZlJ8ebufKSznYUo1MYTqbjlZM+QmiW/h15w5lwrtnnSAOKp0=
X-Received: by 2002:a1f:784a:0:b0:446:adde:f761 with SMTP id
 t71-20020a1f784a000000b00446addef761mr548850vkc.7.1682059579067; Thu, 20 Apr
 2023 23:46:19 -0700 (PDT)
MIME-Version: 1.0
References: <20230420094433.42794-1-angelogioacchino.delregno@collabora.com> <20230420094433.42794-3-angelogioacchino.delregno@collabora.com>
In-Reply-To: <20230420094433.42794-3-angelogioacchino.delregno@collabora.com>
From: Chen-Yu Tsai <wenst@chromium.org>
Date: Fri, 21 Apr 2023 14:46:08 +0800
Message-ID: <CAGXv+5EtCdpXtq6q2Cv+QAZPUE6yJiSZhngSc0sftz-_uDrZXw@mail.gmail.com>
Subject: Re: [PATCH 2/5] arm64: dts: mediatek: cherry: Assign dp-intf aliases
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: matthias.bgg@gmail.com, robh+dt@kernel.org, 
	krzysztof.kozlowski+dt@linaro.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-mediatek@lists.infradead.org, kernel@collabora.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230420_234621_707140_4F06C1A1 
X-CRM114-Status: GOOD (  13.93  )
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

On Thu, Apr 20, 2023 at 5:45=E2=80=AFPM AngeloGioacchino Del Regno
<angelogioacchino.delregno@collabora.com> wrote:
>
> On Cherry boards, the IP at 0x1c015000 (dp_intf0) is used as primary
> dp-intf, while the other at 0x1c113000 (dp_intf1) is used as secondary:
> assign them to dp-intf{0,1} aliases respectively.
>
> Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@coll=
abora.com>
> ---
>  arch/arm64/boot/dts/mediatek/mt8195-cherry.dtsi | 2 ++

This should be applied at the SoC level. The display pipeline is fixed in
MMSYS, so it applies to all MT8195 devices.

>  1 file changed, 2 insertions(+)
>
> diff --git a/arch/arm64/boot/dts/mediatek/mt8195-cherry.dtsi b/arch/arm64=
/boot/dts/mediatek/mt8195-cherry.dtsi
> index 0820e9ba3829..918380697a9a 100644
> --- a/arch/arm64/boot/dts/mediatek/mt8195-cherry.dtsi
> +++ b/arch/arm64/boot/dts/mediatek/mt8195-cherry.dtsi
> @@ -10,6 +10,8 @@
>
>  / {
>         aliases {
> +               dp-intf0 =3D &dp_intf0;
> +               dp-intf1 =3D &dp_intf1;
>                 i2c0 =3D &i2c0;
>                 i2c1 =3D &i2c1;
>                 i2c2 =3D &i2c2;
> --
> 2.40.0
>
>

