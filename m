Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EAE68C433FE
	for <linux-mediatek@archiver.kernel.org>; Wed, 30 Nov 2022 03:12:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=sdXRg/ymYsT6ceuUYZ9gb05rgN9bVA7aUAY63bAbLnU=; b=lu6PmfUxfoOFTn8GeDsJhZ0VCd
	jMnZVzQ4rKpY60gONVija1NlO9hWL0VGZObOfdQqf4t5e32MbnF1rv0Bvcxg66PqGOvs3ewZri5yF
	CywzGU8/Gj3by+dQoSmhaLEoXxKxo1qmwINgbFp2swODe7KMoDizSxG6Kxf7k8YqODHt4UL6tIpPo
	C9bEYYgGFzqxi0bHlCbPfsQobMcfZUHDbi0ytZZDGZxCV4ZF5pUiwTHTlMmjF/xldpyPmfR//R5Uh
	ObjhwnznRN5fdIaAk6xSY2TddE66fE8hUIchKHhVZDhCKpLOSyNaFpTrwSxXjH+0SPk3cABZTOl91
	Z8OF1nGA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p0DWB-00CRzX-D2; Wed, 30 Nov 2022 03:12:15 +0000
Received: from mail-vs1-xe32.google.com ([2607:f8b0:4864:20::e32])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p0DVz-00CRvX-Hb
	for linux-mediatek@lists.infradead.org; Wed, 30 Nov 2022 03:12:04 +0000
Received: by mail-vs1-xe32.google.com with SMTP id 124so16003986vsv.4
        for <linux-mediatek@lists.infradead.org>; Tue, 29 Nov 2022 19:12:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=sdXRg/ymYsT6ceuUYZ9gb05rgN9bVA7aUAY63bAbLnU=;
        b=SoIN7hD1Jx/EisJhAV5UvLlwF4O+R/hauxyTGykE6Td5nZVT5ngcr4kH1PVsIcObpm
         8X6yalURb9S/7usDf1wKbqxEBYxUzvfRZ08nTcMmiTZR07H8wU805uhOr1BDDG4wiUlR
         vBqkZoOzaTYU7osj2zZfD4SSENw8iEIlSQpZk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=sdXRg/ymYsT6ceuUYZ9gb05rgN9bVA7aUAY63bAbLnU=;
        b=zPvJj1ywm8FTCZ0T00oX8TjS0eONfTfnHJ9OBVRt9K32lcGaJSf7+D+HF/vGjMNabD
         nV/Mjy8zsgTu8iOwJSFYtwj3M3RToM9QQ7myRg+A0mfZfm8La5tCFdneFkVyhYA443d4
         0LN3ULXR7tJhRMLdIeM1I4xieb4TPjIoXeN9sd3oNHxaWD9T+kwMRYt/U6W6xdw2sLV8
         dy2yTjVsguePH2uYw4HVlZvkdnMmgioV1AGmqiiseaWgfzVl9Mtat5QH+2xgtj3X5Ved
         6//hFTvAh4us250q8cSOmeqg4IUuVLmBMM+JoUH3oaMsr5WVapF8mS4iF2oPbXpgwCTU
         HYAA==
X-Gm-Message-State: ANoB5pnSkH3ppc3LOvwZ2UEALk1LvYx+XbuNTwqXaX3ikFsnct7Hr+bp
	7StRZMPZZZd2SYEbBcbe/OaGcRDK8rp30RTFqOAsNg==
X-Google-Smtp-Source: AA0mqf4Ce12nXsx/KQEPYzoekZ8nkYEFv+RVatzvCHZ9e59KlrV+mHE/FyqwDJKS2UEJT28N79F40nXp1jsnNDpw4w0=
X-Received: by 2002:a05:6102:b16:b0:3a7:a88a:6bce with SMTP id
 b22-20020a0561020b1600b003a7a88a6bcemr25118213vst.65.1669777919916; Tue, 29
 Nov 2022 19:11:59 -0800 (PST)
MIME-Version: 1.0
References: <20221102190611.283546-1-nfraprado@collabora.com>
In-Reply-To: <20221102190611.283546-1-nfraprado@collabora.com>
From: Chen-Yu Tsai <wenst@chromium.org>
Date: Wed, 30 Nov 2022 11:11:49 +0800
Message-ID: <CAGXv+5GY5f4UWR982cY0vzUuk7aB4BSa_FcKtku1ELatMr4Dwg@mail.gmail.com>
Subject: Re: [PATCH v3 0/5] MT8192 Asurada devicetree - Part 2
To: Matthias Brugger <matthias.bgg@gmail.com>
Cc: kernel@collabora.com, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Rob Herring <robh+dt@kernel.org>, 
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org, linux-mediatek@lists.infradead.org, 
	=?UTF-8?B?TsOtY29sYXMgRi4gUi4gQS4gUHJhZG8=?= <nfraprado@collabora.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221129_191203_588862_E2CD91D9 
X-CRM114-Status: GOOD (  14.31  )
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

On Thu, Nov 3, 2022 at 3:06 AM N=C3=ADcolas F. R. A. Prado
<nfraprado@collabora.com> wrote:
>
>
> This series improves some more the support for MT8192 Asurada-based
> Chromebooks, by enabling some missing functionality, namely the internal
> display and audio.
>
> In addition to that, aliases are also added for the i2c and mmc nodes,
> which should've been done while adding the devices in the previous
> series.
>
> Some notable components that are still missing support are:
> - external display/HDMI audio (waiting for [1])
> - GPU (waiting for [2])
>
> As part of testing the audio, an UCM file was used, which has already
> been submitted upstream [3].
>
> This series depends on some missing dt-binding properties on rt5682,
> which are added by another series [4].

Hi Matthias,

This series has been floating around for some time now, and has been fully
tested by multiple parties. The rt5682 dt-binding changes have also been
merged.

Could you queue it up?


Thanks
ChenYu

