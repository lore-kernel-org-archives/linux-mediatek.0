Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2359BC46CA1
	for <linux-mediatek@archiver.kernel.org>; Mon, 18 Sep 2023 10:44:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=IGkdCcI18B7hgDeo6RzVWYQ9sD6aoucVKvw6M/xbnDU=; b=zQofHWm/8VZQyTfxBQ+FbyCgVK
	IUbDjOYo+U3/I5fOSTSNu7WAmiCWhkwANY/+oy7jKQqJGF8ijNnXqhf87nhANDyOuf/ImWd/dGR/K
	MFu1mlZOlh/CLVs/RK/qUUCqgE551xVw5GQnH/hXW/0gS5jKeliwsgib9+RCajWaXrqbvhuKDuqdA
	+BhjsFj8BcgPjHe4J1rFyn4/yJonQeiKTMNpuk0y4Cz+tDLTm46xBojMbNh3LiwIRt9Ozjfw/joso
	0xQn5Pa+hLghxva1yImZ0B3vNyaRZ/jlXrISglmKcWAf4lg5TzSoIZs4uSsSY2vTZUoNY9B4veMz9
	LU+52p/A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qiBkN-00FFdo-2r;
	Mon, 18 Sep 2023 10:44:55 +0000
Received: from mail-lf1-x12e.google.com ([2a00:1450:4864:20::12e])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qiBk9-00FFaV-0g
	for linux-mediatek@lists.infradead.org;
	Mon, 18 Sep 2023 10:44:43 +0000
Received: by mail-lf1-x12e.google.com with SMTP id 2adb3069b0e04-500bbe3ef0eso5129457e87.1
        for <linux-mediatek@lists.infradead.org>; Mon, 18 Sep 2023 03:44:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1695033876; x=1695638676; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=IGkdCcI18B7hgDeo6RzVWYQ9sD6aoucVKvw6M/xbnDU=;
        b=mV5jCDnyx9vA15rHvfApodprUOVz45XG/tp26dedDnNO/k2bCRd8JupJneAi06LT4m
         jFb8+tr2/CkENCrmJhEXVeGsnVx1skBpX5Z5FI7jPOmSgakOD0qy5s9rgNVy8V2QVHk4
         V+6TZSfLm5ppkuKB8AeD7g46czwdbQ2d01XBk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1695033876; x=1695638676;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=IGkdCcI18B7hgDeo6RzVWYQ9sD6aoucVKvw6M/xbnDU=;
        b=E6HKpwqWbAoJscCp1g5LDy/7V77fzNhwHkAIzbJUg2wpskAJLHJ/4FFZoeNdDTSfnM
         KBt2h6y1tUg7Y2qaOvx38GcVNTxJCne3SFuBpohRTCjIv/D63uW/tKVEpXMg9PxN6RnQ
         QCcf4S7VUMI8Ab6CVzK4ZCqIy8uQ75AUdawHPC8JVKUe37OO6GkKXHrMEFbsS8kLSljR
         kUmje9or5wZeMB16YGRM5H3mjkZh2WL3M8Ud+IsWObM5Iu5Ao7wh3Mw8iZP5zuIDzZ7N
         42mBhpiRNOnl1rT5FAtI0ftnJJhMoRF51KOy/6F9JvSoYnrRYpvOuYYblZznvjp6g3KS
         7raQ==
X-Gm-Message-State: AOJu0YxophQswmPJ8IxCzeVxMHzfWRoAxZHGGilwroMlLy2xsqe4SibK
	jAj5r2UCD9/qVtrPfzQeY+4ZJSOto0k4M3EYvR+hgA==
X-Google-Smtp-Source: AGHT+IGIg/CJtdEmuQQHM8i7T4H6aOlEi6CRY6h6lVig1fzQNxD9WQD0b+EvqCe7Iv5e6XJyFKEGdbI+7C1+JpTi2ro=
X-Received: by 2002:a05:6512:1599:b0:501:b872:8c6c with SMTP id
 bp25-20020a056512159900b00501b8728c6cmr4185650lfb.27.1695033876680; Mon, 18
 Sep 2023 03:44:36 -0700 (PDT)
MIME-Version: 1.0
References: <ZQH2dG+l/dONUsyi@p14s> <20230918103141.126271-1-laura.nao@collabora.com>
In-Reply-To: <20230918103141.126271-1-laura.nao@collabora.com>
From: Chen-Yu Tsai <wenst@chromium.org>
Date: Mon, 18 Sep 2023 18:44:25 +0800
Message-ID: <CAGXv+5Esi=G0xgkP=+Bhf39Xs3gMN1PBzarxKBKduOjgwDijAA@mail.gmail.com>
Subject: Re: [PATCH v17 00/14] Add support for MT8195 SCP 2nd core
To: Laura Nao <laura.nao@collabora.com>, tinghan.shen@mediatek.com, 
	angelogioacchino.delregno@collabora.com
Cc: mathieu.poirier@linaro.org, 
	Project_Global_Chrome_Upstream_Group@mediatek.com, andersson@kernel.org, 
	conor+dt@kernel.org, devicetree@vger.kernel.org, 
	krzysztof.kozlowski+dt@linaro.org, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org, linux-mediatek@lists.infradead.org, 
	linux-remoteproc@vger.kernel.org, matthias.bgg@gmail.com, robh+dt@kernel.org, 
	kernel@collabora.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230918_034441_247715_51462770 
X-CRM114-Status: GOOD (  13.62  )
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

On Mon, Sep 18, 2023 at 6:32=E2=80=AFPM Laura Nao <laura.nao@collabora.com>=
 wrote:
>
> > Other than patch 2 and 14, I have applied this set.  The remaining patc=
hes will
> > have to be resent to Matthias.
>
> > Thanks,
> > Mathieu
>
> Hello,
>
> With patch 2 missing, the SCP is not probed correctly anymore on asurada =
(MT8192) and kukui (MT8183). The mtk-scp driver relies on the existence of =
the `cros-ec-rpmsg` node in the dt to determine if the SCP is single or mul=
ticore. Without patch 2 the driver wrongly assumes the SCP on MT8192 and MT=
8183 are multicore, leading to the following errors during initialization:
>
> 10696 04:33:59.126671  <3>[   15.465714] platform 10500000.scp:cros-ec: i=
nvalid resource (null)
> 10697 04:33:59.142855  <3>[   15.478560] platform 10500000.scp:cros-ec: F=
ailed to parse and map sram memory
> 10698 04:33:59.149650  <3>[   15.486121] mtk-scp 10500000.scp: Failed to =
initialize core 0 rproc
>
> The issue was caught by KernelCI, complete logs can be found here:
> - asurada: https://storage.kernelci.org/next/master/next-20230914/arm64/d=
efconfig+arm64-chromebook+videodec/gcc-10/lab-collabora/baseline-nfs-mt8192=
-asurada-spherion-r0.html
> - kukui: https://storage.kernelci.org/next/master/next-20230914/arm64/def=
config+arm64-chromebook+videodec/gcc-10/lab-collabora/baseline-nfs-mt8183-k=
ukui-jacuzzi-juniper-sku16.html
>
> Reporting the issue so that patch 2 and 14 can be resent and merged soon.

This being a backward incompatible DT binding change, maybe we should rever=
t
the node name change. Or, the driver could simply count the number of child
nodes that have the "mediatek,rpmsg-name" property, which is required.

ChenYu

