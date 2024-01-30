Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D9800C47DA9
	for <linux-mediatek@archiver.kernel.org>; Tue, 30 Jan 2024 03:24:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=FTNL9ohxLrANr0wy+wFa79m7nHa0bIs2wMJPrxNz1A8=; b=pcPMtMAsk7iwAEAK58YrrQnss0
	LdXxvCsz/gZ2Sn+dOY0DyM0L77GXbvn69EhbgxzymOLLX+GNFBJMs7KenMhcIY6iHLr1yce0W5Q8+
	5xhvNgEFrh0Ywp5aRPNSatmX92X5YkybYKCRWqEiNTzNq7ew/qMnvE0aOR03D+jvG6Hv+rEOmioi3
	KnnCydbP/J1KAS8WJq3BTbkM30NdnyoPvhjhdXLfF+ZONGl/t02NyrGervK7aUpeGkbIOvuFAqeoq
	SlCN5tb8fYZrJoGsog11KYliMJaE51oy+HL+mA9OWbogMxUb3J3Sjq7T54FQqc7mceoaM0ya7aOGT
	M54Dvl5Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rUejd-0000000F7F8-20qs;
	Tue, 30 Jan 2024 03:24:29 +0000
Received: from mail-lf1-x12a.google.com ([2a00:1450:4864:20::12a])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rUeja-0000000F7E1-1cWD
	for linux-mediatek@lists.infradead.org;
	Tue, 30 Jan 2024 03:24:27 +0000
Received: by mail-lf1-x12a.google.com with SMTP id 2adb3069b0e04-51031ae95a1so3062535e87.0
        for <linux-mediatek@lists.infradead.org>; Mon, 29 Jan 2024 19:24:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1706585063; x=1707189863; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=FTNL9ohxLrANr0wy+wFa79m7nHa0bIs2wMJPrxNz1A8=;
        b=mqTTxp8tQ97G21eFe+8jKFVBg+YExk/NDQ1CYKFodQjZytGE+umrH5yqu0AqILCAXH
         dQeEFQ81wbG1M0OuDCg2N2Ro+ZXdZb2UHdouvkepkoJ6lK7aoHmev1E6fZY8hZJho46t
         71B7JqGtLt0x5hVPQKtzNyl/XUPktajZFXmRk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1706585063; x=1707189863;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=FTNL9ohxLrANr0wy+wFa79m7nHa0bIs2wMJPrxNz1A8=;
        b=IU5Vk9dW4SWZjwnX3qx0GnpxlRxkIWGGbHwSv8P+5rSiV/+LVsKpZHjd9GSiXOyklh
         fwXe95cM2HCOF8G8ofkjUE2pCvwDCbHcupgrlWcqaOlz5SRu3qMuxqNMvJpc6JzILTkm
         THlompjTW6ZFqjzMMqWhI5V3BLltgRYmkIRCM/N3CAPbhaxtFn2YQvrQYkIvTXOJTTGn
         PBHRpUVy3BVqEbE0q10kNRq1Xo+uQIA3xztwRCL605MGAzq5CLONizDs1zuirXRRu18t
         0b9dTSsm28HWP2eN25uRAUkhEqATkzx9geXhgeazpQgoVAFTM0X59fNuzoOHxWcPUEn6
         XuHA==
X-Gm-Message-State: AOJu0YyWNdlNFvwapIm34e8V1i4NOSOewk5AmAV7gSelv+kqbFPSqk+s
	c+eETq1GeuN2vRJ9kilhb+FWnqE6srn7rviYrcFKIhDk9ZHLQO0k1b8RPsowBMH4gN+e99+rd1Q
	IsYwfgGbjFHz7zbPBf7NO1eR5s3mtq/cnWfzP
X-Google-Smtp-Source: AGHT+IHasIeOeQNhmIgzA0J3oP+hkDAX7iNew/UQEnuWH9J+d2zxww/qMxouAz63r8GpwRI6Q1usW0Rn5MblFlW2xIM=
X-Received: by 2002:a05:6512:401c:b0:50e:7bc5:20d8 with SMTP id
 br28-20020a056512401c00b0050e7bc520d8mr5731043lfb.4.1706585063646; Mon, 29
 Jan 2024 19:24:23 -0800 (PST)
MIME-Version: 1.0
References: <20240127084258.68302-1-eugen.hristev@collabora.com>
 <170652472373.127352.5854831299483160743.b4-ty@collabora.com> <282822ba-0e96-4078-a807-4b0b08e42014@collabora.com>
In-Reply-To: <282822ba-0e96-4078-a807-4b0b08e42014@collabora.com>
From: Chen-Yu Tsai <wenst@chromium.org>
Date: Tue, 30 Jan 2024 11:24:12 +0800
Message-ID: <CAGXv+5Em3HUJV1pv177LUwf9iMhKSLcGhVAt6ON9YZMNaT2oZw@mail.gmail.com>
Subject: Re: [PATCH v3 1/2] dt-bindings: media: mediatek-jpeg-encoder: change
 max iommus count
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: linux-mediatek@lists.infradead.org, linux-media@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240129_192426_651362_E821BB82 
X-CRM114-Status: GOOD (  11.62  )
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

(Drop a bunch of people from CC)

On Mon, Jan 29, 2024 at 6:48=E2=80=AFPM AngeloGioacchino Del Regno
<angelogioacchino.delregno@collabora.com> wrote:
>
> Il 29/01/24 11:41, AngeloGioacchino Del Regno ha scritto:
> >
> > On Sat, 27 Jan 2024 10:42:57 +0200, Eugen Hristev wrote:
> >> MT8186 has 4 iommus in the list, to cope with this situation, adjust
> >> the maxItems to 4 (instead of previous 2).
> >> Add also minItems as 2 to keep compatibility with current devices.
> >>
> >>
> >
> > Applied to v6.4-next/dts64, thanks!
> >
>
> Sorry, typo: v6.8-next/dts64

I was wondering, what script produces this email?

AFAIK `b4 ty` gives a simple thank you letter without branch or commit
hashes.

ChenYu

> > [1/2] dt-bindings: media: mediatek-jpeg-encoder: change max iommus coun=
t
> >        commit: b824b32dd5e98221cbe2e8bcccc6fb4134e35fc1
> > [2/2] arm64: dts: mediatek: mt8186: Add jpgenc node
> >        commit: 4c5b46fbf52d52b0f392f0fc3913560bad438e49
> >
> > Best regards,
>
>

