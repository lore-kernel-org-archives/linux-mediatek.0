Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A1214C636CC
	for <linux-mediatek@archiver.kernel.org>; Wed, 15 Feb 2023 13:14:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=j7pGfC7xDTusd6z5pgWikV3xKmcksuQG65csYT81LO8=; b=Cd9AtKc1AijjrEydzwIG686EM4
	DXBzBE/aeXwIDipG74BsoXxamMm5X0vOcc5wLfj6sHS4MVkrNxveFQRyT4ulxn7SYX0eEbjA+akBi
	+Y4bibrBy6qkmyykM/TQvTVV0KKE8uzkNuKrHisI/mMNUXO/ddQlYA2cPSTmFLmigjfO8sEAs2LMC
	Zx+yFYIpNPdxVFisTPM/IkL3dVRYq1+CT6qSwKWndoe+mwFcXjc9cPZLkpYPT20OZsfjL9iLf76s4
	e81q6gAIhQ2Xihwv2iYduUqj9pTP44z0JzasVhq5ErHab+ZN5gOQQEbjni2hyecpGLk+g4U4HpzB8
	FtYTcIeg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pSHcQ-005wfM-IH; Wed, 15 Feb 2023 13:14:42 +0000
Received: from mail-ej1-x62d.google.com ([2a00:1450:4864:20::62d])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pSHcD-005wbg-Vn
	for linux-mediatek@lists.infradead.org; Wed, 15 Feb 2023 13:14:32 +0000
Received: by mail-ej1-x62d.google.com with SMTP id hx15so48021461ejc.11
        for <linux-mediatek@lists.infradead.org>; Wed, 15 Feb 2023 05:14:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20210112.gappssmtp.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=j7pGfC7xDTusd6z5pgWikV3xKmcksuQG65csYT81LO8=;
        b=HlgkGbMBMm1kpIRDLdzHFSLFy+y4fm6Lbw+ofyJ59QsiyeC1wj6KTzfdboAS6oGMMP
         K69RRWHkTnGaQG5p+4WO3gn4w3hhDsnzCfDFbRXBc2oK6k6Ar9B+TovSGRu99FgvRutm
         weDrvg9e80z+khKXBakdjGun+6TBzwjjyFvdErd6+oUOvZ2fOVycZtUdD2cRlYFyuNpm
         vxGGtoR+OaIofsO6g3zT9Pzv+N7naro9AfdtmOBd2Jm6VDk92kpqvpPjIPPkk7g0R7dy
         PTgUFzA60YGG/Ea9yzpPRSqc8NASlih2R6mBNl4a1uwX0YOwzwbOroq0GWHbSgk2uWEG
         S8Rg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=j7pGfC7xDTusd6z5pgWikV3xKmcksuQG65csYT81LO8=;
        b=F8GRtoMP448Byhm6fZo7Ak0c2nV3qGm04v598YfYcYrWPneq/YConsiAMWXHQvv0R+
         dc/GvzsPtVPFJns9AUIuNJUfPA2S7J0g/tnnH49yWyu3K6YIN1dCp2Y1d4qBYh69K9aD
         E/jTjlkunjM4R8FXuedzUk7zqKQgXjoYwLp//RGAxc1su7oDrBjViXEgJYw5hu0MVqWd
         g/vS2U3+COXvwPySbLTF5++KIBq/bDRwBWZzX2Zerjbpj8oFDsPbUna/Mo6lU9RAcLIs
         ULaUfKVWSIs32VYZhetOtcJyfjkdlF7yHULr1y/zA8NzcWKA8I/3msuXPLdsvqenIret
         esTA==
X-Gm-Message-State: AO0yUKXGhNvIb6+WncTUVH9k5DjYFasNCECNrn1NlFpHqbhv34CeIDCj
	W4lHYhpwRKWxeNCTPZb5iF72BrcrLvZllY9O4e7zHQ==
X-Google-Smtp-Source: AK7set9CC24FinuDxUg1COSSewk41cLJdoKkapFGP11oCCpkm+dmPDtDds53b1ZuB9NwFxiqhywCafs5fa1jtix0epY=
X-Received: by 2002:a17:906:c04:b0:88d:ba79:4315 with SMTP id
 s4-20020a1709060c0400b0088dba794315mr1895992ejf.5.1676466866224; Wed, 15 Feb
 2023 05:14:26 -0800 (PST)
MIME-Version: 1.0
References: <20230209105628.50294-1-bchihi@baylibre.com> <20230209105628.50294-7-bchihi@baylibre.com>
 <CAGuA+oqOgprdu0dVcmB=qJd5HJjada3d8ZazMpoG-SBPizzuPQ@mail.gmail.com> <80c60f09-56eb-cb84-43f0-7b055ea4b32c@collabora.com>
In-Reply-To: <80c60f09-56eb-cb84-43f0-7b055ea4b32c@collabora.com>
From: Balsam CHIHI <bchihi@baylibre.com>
Date: Wed, 15 Feb 2023 14:13:50 +0100
Message-ID: <CAGuA+oqJVTXE5YHm6rSv4pPWsGxR8nZD-T5EM7LS9gPtdcu4HA@mail.gmail.com>
Subject: Re: [PATCH v14 6/6] arm64: dts: mediatek: mt8195: Add temperature
 mitigation threshold
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: daniel.lezcano@linaro.org, rafael@kernel.org, amitk@kernel.org, 
	rui.zhang@intel.com, matthias.bgg@gmail.com, robh+dt@kernel.org, 
	krzysztof.kozlowski+dt@linaro.org, rdunlap@infradead.org, 
	ye.xingchen@zte.com.cn, p.zabel@pengutronix.de, linux-pm@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-mediatek@lists.infradead.org, devicetree@vger.kernel.org, 
	khilman@baylibre.com, james.lo@mediatek.com, rex-bc.chen@mediatek.com
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230215_051430_264162_87336625 
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

Hi Angelo,

On Wed, Feb 15, 2023 at 1:50 PM AngeloGioacchino Del Regno
<angelogioacchino.delregno@collabora.com> wrote:
>
> Il 14/02/23 15:43, Balsam CHIHI ha scritto:
> > Hi Matthias, Angelo,
> >
> > Would you please confirm if this patch can be applied?
> > and, if it is the case, to which tree it will be applied?
> >
> > Best regards,
> > Balsam
>
> I think it's fine to apply 5/6 and 6/6, as you're adding pre-Tjunction
> max temperature - this is not board specific, but rather SoC-specific.
> In reality it's practically the same for most SoCs, even.
>
> Each board will define extensions (that are thermal envelope dependant)
> to these "please-dont-burn-my-device" initial thresholds, but that's a
> story for another day, and for other people anyway (including me).
>
> Matthias, over to you!

Indeed.
Thank you for your feedback!

Best regards,
Balsam

