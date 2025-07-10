Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2D52FC83F1D
	for <linux-mediatek@archiver.kernel.org>; Thu, 10 Jul 2025 10:10:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=IbMjrJbm+vCEXbCzlc+pe2ZZgUE7LGCN4UW3uV+MEfQ=; b=qRWMXfMkEcYwaLJM24/2N7o3k0
	rEiD22+jBur3PWObUA2AifAc/RDyg+OsTg+DBTwr+xlKU5ZkCwljFOI9MkE0OUxEJ8kn49EuM9NWQ
	xv7ZV/8IxPlMRHS1HIPWLB4NrJWjTpM3qL5HiukUuPVYjosNI8xaj6bNHnAvMeGrO6e4otZp68W7Q
	mxbju9fbVI94pqHokH0mJgWpphT8CotFgsdyB6/7WxIDln0riEYl8VCXPeWbxZV+6nvO0jgiJhGnX
	UX66uxhSNc9PhrLPJzWkv5uKbrXbqeI1hd1e7rbBGDl+NA319VTNi+RhGJUgFjuNmMimfaCoimUUJ
	YEY6xBGg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uZoEJ-0000000BQP4-29DJ;
	Thu, 10 Jul 2025 10:10:15 +0000
Received: from mail-lj1-x22b.google.com ([2a00:1450:4864:20::22b])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uZmrN-0000000BDSV-1LhO
	for linux-mediatek@lists.infradead.org;
	Thu, 10 Jul 2025 08:42:30 +0000
Received: by mail-lj1-x22b.google.com with SMTP id 38308e7fff4ca-32f1763673cso8810001fa.3
        for <linux-mediatek@lists.infradead.org>; Thu, 10 Jul 2025 01:42:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1752136947; x=1752741747; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=IbMjrJbm+vCEXbCzlc+pe2ZZgUE7LGCN4UW3uV+MEfQ=;
        b=ZSHDN618gnBNUgcv1usKkscspn73aOEsxwvvfT/+x+92GLqPSvjthEd2tFpAXo5SvJ
         hLU5catNfHSGjNpkjHJhu1UZavTPUum9UV0/c996U2bRQ/fcb/Cedz0BVjr2tbCm3IBY
         d1qMQFj771a5s8PQCyikndUiEljA+RFn0vLMM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752136947; x=1752741747;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=IbMjrJbm+vCEXbCzlc+pe2ZZgUE7LGCN4UW3uV+MEfQ=;
        b=G65wntYr2jMXIYd/vliUEpN+wraXrEoZS2P/nmlAqSSRoVi/4vTOCFO4RvWwaxCpnO
         MDi3/DUWRtZrBJEHFyCC1wRKgespOxsauUIv00KCpMWB36XuTvhvgS+e4KOtZ3z+zzeI
         e5kG2QX3McTjvJtG8NY0PBS5EJp8uz1BhGUBXpC4MvROc5B32Bz4FaXXwx7I1MAOgbPO
         +5LcC0ym39uydmTwW4SsoFwsjqn3ldRIY6qPx6HjKlXaL+ZnvVgbIUH2LGiR7m9ZP5NG
         iXjKAQZTvQKosopkElXC1tpyRGRwcUsiHjD+YCzgorBuO6o5fisSTCrUdW0UfG5B28Ub
         06Ng==
X-Forwarded-Encrypted: i=1; AJvYcCUisTr+VCTHClLGQchauc+nOdiAwA7Hzv97+9m117izLL36nB9Hf/tBfBG1Nc9JJ4E6EYN3zZi2pVjorrH1qw==@lists.infradead.org
X-Gm-Message-State: AOJu0YxgBCi22sj8Nrrt3W6O1rayrQMfnvMLcWNWdTCo/Mv1rbYFNril
	3/MK0X56TtaE4lXI1fHotQNvUgJ1Onlb854/yqrf7gEHJvRC1F9GeR47OMAelSmk1fGnxj21624
	DvLGVZqAoYMO45GcFN1xfL6tK8QOLDFZXDP5woly/
X-Gm-Gg: ASbGncs7SGMjsN9Z3MCcKHKeTim9NZiYpFyN1MDuDhCShwjZWvxhYMoIbls98VAOrEC
	i4h1V4RLcr1yTzP+F0pMwqFw5daNOONd0eJQO1qW+uALURa9WLGyijRogblqyoQNbx6c7GnyRHs
	OgIcTghGbVrOFG8N3YrYPPuj+9M8nKFkxL4Zwic2qEtNZ7bcInF5BoRBpoRYGfPUVUmnDoo4E=
X-Google-Smtp-Source: AGHT+IH98HyUSFcxzn0ZLDTDXzcG2xAq4tfunT0Q0Flrc8e1qgVm3bYMsY/33vj2EMiqcDSWrQ5h5u7h7vcdWubER9k=
X-Received: by 2002:a2e:a99f:0:b0:30b:b956:53c2 with SMTP id
 38308e7fff4ca-32fab95f588mr5305791fa.11.1752136946822; Thu, 10 Jul 2025
 01:42:26 -0700 (PDT)
MIME-Version: 1.0
References: <20250610063431.2955757-1-wenst@chromium.org> <CAGXv+5HDAZ-MBBMk00O+cdcq55KnsKdEAMD7E2uaAf=2LY=1cg@mail.gmail.com>
 <5ee16a72-01a0-4f2c-9bcb-e4b4b069b2dd@collabora.com>
In-Reply-To: <5ee16a72-01a0-4f2c-9bcb-e4b4b069b2dd@collabora.com>
From: Chen-Yu Tsai <wenst@chromium.org>
Date: Thu, 10 Jul 2025 16:42:15 +0800
X-Gm-Features: Ac12FXxsLgCZAUA9cokLqBFuaQ1ZCvwcmNm2Lv9LiZZijxwC0ttVDjqCnXtUfEA
Message-ID: <CAGXv+5E=xLJg9Y4OProhrH3ROy12J+3gNc3eiebGeJuEVEq+zw@mail.gmail.com>
Subject: Re: [PATCH v2 0/2] arm64: mediatek: Enable efuse GPU speed bin post-processing
To: Srinivas Kandagatla <srini@kernel.org>
Cc: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
	linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Lala Lin <lala.lin@mediatek.com>, Matthias Brugger <matthias.bgg@gmail.com>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Andrew-CT Chen <andrew-ct.chen@mediatek.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250710_014229_386993_A9A8919B 
X-CRM114-Status: GOOD (  19.57  )
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

Srinivas,

On Thu, Jul 3, 2025 at 7:48=E2=80=AFPM AngeloGioacchino Del Regno
<angelogioacchino.delregno@collabora.com> wrote:
>
> Il 01/07/25 11:15, Chen-Yu Tsai ha scritto:
> > Hi Angelo,
> >
> > On Tue, Jun 10, 2025 at 2:34=E2=80=AFPM Chen-Yu Tsai <wenst@chromium.or=
g> wrote:
> >>
> >> Hi everyone,
> >>
> >> This is v2 of the MT8188 efuse GPU speed bin post-processing enablemen=
t
> >> patches. In v1 [1] the change was made to the driver. Angelo, the plat=
form
> >> maintainer believes the change should be made to the DT binding instea=
d
> >> [2]. v2 adopts Angelo's argument.
> >>
> >> Patch 1 updates the efuse DT binding so that MT8186 is a base compatib=
le
> >> with no fallback, and MT8188 falls back to MT8186.
> >>
> >> Patch 2 updates the MT8188 DT to follow the new binding.
> >>
> >> If possible I would like to see both patches merged through the soc
> >> tree once the DT binding maintainers give an ack. This avoids prolonge=
d
> >> waiting for the binding changes to land and uncertainty about whether
> >> things have fully landed or not.
> >>
> >>
> >> Thanks
> >> ChenYu
> >>
> >> [1] https://lore.kernel.org/all/20241223100648.2166754-1-wenst@chromiu=
m.org/
> >> [2] https://lore.kernel.org/all/11028242-afe4-474a-9d76-cd1bd9208987@c=
ollabora.com/
> >>
> >> Chen-Yu Tsai (2):
> >>    dt-bindings: nvmem: mediatek: efuse: split MT8186/MT8188 from base
> >>      version
> >>    arm64: dts: mediatek: mt8188: Change efuse fallback compatible to
> >>      mt8186
> >
> > Friendly ping. Please take a look and see if this scheme is to your lik=
ing.
> >
>
> For the whole series
>
> Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collab=
ora.com>

Could you merge  the DT binding patch so that we can merge the DT change
ahead of -rc6? Or alternatively could you give an Ack so both patches
go through the soc tree?


Thanks
ChenYu

