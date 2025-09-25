Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1E17CCAC5A5
	for <linux-mediatek@archiver.kernel.org>; Thu, 25 Sep 2025 04:54:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=AfOJlNr1JeVzQacNsJApm6u3eklKPliDP0EOZ1wC62c=; b=cw3K8tPHy/3vUN1yCn5q4T4sGR
	KYxMr1fNGhGkiKI4LDLhYDOKR7QiFURWeFxjpUeEl4tH77jbruHDXMa8lEE43pgnzIv8BSm4D5Dxs
	c1pZ1IUSekrBG/jJSXMp6hnMkyuFW64p5X9hM/XIIqQmeGtPxSwbImbTs+u3tEjcNrjpfiLjUkja+
	MoB6M7n9Sd99Y24WkzkTQSLv0iKT8nwVsPCcEvDcNeNf89FMbAIybjO/iB17grogGpIbPtHvGfrmr
	JtHtobWufiMAqsg1if/FV1PmY9oWAzML6z/KOvPZyLazmXoXfRdT2F+Nt+sQ8p+CHWWDuzwqnTVMG
	Ri9/NZ8g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v1e0D-00000005g19-2kkK;
	Thu, 25 Sep 2025 04:54:45 +0000
Received: from mail-lj1-x234.google.com ([2a00:1450:4864:20::234])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v1e0A-00000005g0U-27xy
	for linux-mediatek@lists.infradead.org;
	Thu, 25 Sep 2025 04:54:43 +0000
Received: by mail-lj1-x234.google.com with SMTP id 38308e7fff4ca-363f137bbf8so4192971fa.2
        for <linux-mediatek@lists.infradead.org>; Wed, 24 Sep 2025 21:54:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1758776080; x=1759380880; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=AfOJlNr1JeVzQacNsJApm6u3eklKPliDP0EOZ1wC62c=;
        b=MuTYzpHjj+sE/Bxa4TrnMZtkxGbjZWc+RrSSdcDA38nfW+xWkBW/HV+GPrhN9xOWCY
         Ki/Q8Qs2f4Wz2atn01Gmt6UNBF7TbKZ3FDnjXw1hEaZ5T3VJuC9WNc2tK/pkZ3ur9zIX
         csrIESvQyFErUlFb65W5n9NRibY4m0p8Twwlw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758776080; x=1759380880;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=AfOJlNr1JeVzQacNsJApm6u3eklKPliDP0EOZ1wC62c=;
        b=FX9BTBnCcTVHlqDjg2pfPBfpJ5cEXocezb8l5kiyGlP3KXVS8+AhTq0lj0NSjtqAZk
         Ik0Ciwdg5Bz0OkcP06Xf2mgGdVfXIvTwAgji5s4w1H7PMjccT2g84BjzSkPvvUuOa3jL
         ZHVVIIwIZ0sSzzEpbZ11qjhMzCZBMEC21flTG5vvKM3VYNB4hHz/YtEvVsZxbaOxtqcY
         fQsOxLsrTNato6gWHoEIJwto3wuXERIPQPOKMtYjt6ljkE0nStLoh6p0IfFAyHwq6azm
         zYZrKobLls7N4ijYS6I7yye4F7unsd6UT0+A30wY9qJsO2RUbfG3PpjXlH/LmDvilUwP
         vJOQ==
X-Forwarded-Encrypted: i=1; AJvYcCV69reQSKmsD7G0fObG14pTgUXWtlwLizwXILpFcPzWZUjrk7ymVSZEZnVH7uhy2y8wgrwy6nqTadGYFrt5bQ==@lists.infradead.org
X-Gm-Message-State: AOJu0Yz+WpQR2Y7EU2rDQ2acbq2NOqndDAC9cMsxCCxOCE8uAYjDSgfB
	q8ZX4s05Pw2ylxkNuNduqXrJ/8CM6jP9VL9HdYccll+oOeBW2fBjZND2b5nug9UE9Q3p7vktYHq
	vrpC6zIJjtqvSFzlzQTrYjKQ4zM5TmiejrZEvE7NH
X-Gm-Gg: ASbGnctXBJOtQKmoGU/WAHTDzvExs20o25hMS317pUVviVLLl0Ex75vu3pxg1SxKBWJ
	A3Q4w3BUuv6QSk+USqc+5wZNhUccegj+nsGsjZKhWQfEBDea5skW/ihCdFpiYHi4NIF70d1F+yd
	ETaTAff81NAuzuocsVvhUfzW7El36xBT+QFpSR+G0P/c8TnHhx90lr3h1R6FqCegQdlyaYe0ob/
	OOGUMBRtagn4RtnVUX3/0/WRhytE3Q8SOCXqQ==
X-Google-Smtp-Source: AGHT+IF0+5f68ueTJchiy8OVva2aPyot+zNZ1LmHpjgzKmp8yTmlbDcDBtW5B2Jmd8k/IXzMW6KzTG/3d0FIWAKFPI8=
X-Received: by 2002:a2e:bcc8:0:b0:365:b79:8845 with SMTP id
 38308e7fff4ca-36f7e795878mr4719381fa.10.1758776079768; Wed, 24 Sep 2025
 21:54:39 -0700 (PDT)
MIME-Version: 1.0
References: <20250924133552.28841-1-johan@kernel.org>
In-Reply-To: <20250924133552.28841-1-johan@kernel.org>
From: Chen-Yu Tsai <wenst@chromium.org>
Date: Thu, 25 Sep 2025 12:54:28 +0800
X-Gm-Features: AS18NWCf3jNifuSG2T8itLUmSv-v41oBGMU6IUYuN3HfGIanTdAfEHlrZ5xZLDM
Message-ID: <CAGXv+5FDyB5U+ec62D9E_ULvsDm7GCddpQqw15eQqN5oVPohDw@mail.gmail.com>
Subject: Re: [PATCH 0/3] media: mediatek: fix VPU device leaks on probe
To: Johan Hovold <johan@kernel.org>
Cc: Minghsiu Tsai <minghsiu.tsai@mediatek.com>, Houlong Wei <houlong.wei@mediatek.com>, 
	Andrew-CT Chen <andrew-ct.chen@mediatek.com>, Tiffany Lin <tiffany.lin@mediatek.com>, 
	Yunfei Dong <yunfei.dong@mediatek.com>, Mauro Carvalho Chehab <mchehab@kernel.org>, 
	Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
	Hans Verkuil <hans.verkuil@cisco.com>, linux-media@vger.kernel.org, 
	linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250924_215442_581254_D38D7B1F 
X-CRM114-Status: GOOD (  13.73  )
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

On Wed, Sep 24, 2025 at 9:36=E2=80=AFPM Johan Hovold <johan@kernel.org> wro=
te:
>
> This series fixes VPU device leaks during probe of the mdp and two codec
> drivers.
>
> Included is also a minor documentation update to make it clear that the
> VPU lookup helper returns the device with an incremented refcount.
>
> Johan
>
>
> Johan Hovold (3):
>   media: mediatek: vcodec: fix device leak on codec init
>   media: mediatek: mdp: fix device leak on probe
>   media: mediatek: amend vpu_get_plat_device() documentation

Whole series is

Reviewed-by: Chen-Yu Tsai <wenst@chromium.org>

>
>  drivers/media/platform/mediatek/mdp/mtk_mdp_core.c  |  7 +++++--
>  .../mediatek/vcodec/common/mtk_vcodec_fw_vpu.c      | 13 +++++++++++++
>  drivers/media/platform/mediatek/vpu/mtk_vpu.h       |  2 +-
>  3 files changed, 19 insertions(+), 3 deletions(-)
>
> --
> 2.49.1
>
>

