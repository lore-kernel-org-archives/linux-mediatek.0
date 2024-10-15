Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E7E27CFC273
	for <linux-mediatek@archiver.kernel.org>; Tue, 15 Oct 2024 07:55:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=WmFcFRCIYAEw2190Z4FOUZUOyxlKcujKYWug46B335c=; b=BZLkrXXxHclNsUu+AGYf+py5T4
	XVy5Ize6z5hYPpFavOZOoCC/vm0dfpcHgzx/oHTKAZx4gwRyoxHW6KG7GxynNkerR1s+TlcnisZak
	UtU8Ip93FXcRwnQdyym54AP3CyN8IuI/TsJaj+ehC92ivkb5zsF4p9OQ9dncWTcuKxmqrQ9bL3UHJ
	7V4RpIP3ewLxTVeZCosOVT3s3VIzHnMP/pgnmFUWNeTNxLww6/7euxP/G1oLKYKmqKLGZFK8uCXmP
	h6xE9ix3VP5nY+FWluhXDz00Zil+1aHfIa63ZiAQTbkYmnVCw6J5hxTIVRYR3FRlPDPWDxT27FxQw
	FQFnnelQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t0cOd-00000007PHr-3eGO;
	Tue, 15 Oct 2024 07:55:11 +0000
Received: from mail-lf1-x12b.google.com ([2a00:1450:4864:20::12b])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t0cOL-00000007PCT-2iRd
	for linux-mediatek@lists.infradead.org;
	Tue, 15 Oct 2024 07:55:10 +0000
Received: by mail-lf1-x12b.google.com with SMTP id 2adb3069b0e04-539eb97f26aso2490928e87.2
        for <linux-mediatek@lists.infradead.org>; Tue, 15 Oct 2024 00:54:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1728978892; x=1729583692; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=WmFcFRCIYAEw2190Z4FOUZUOyxlKcujKYWug46B335c=;
        b=LxgmxAlU//mPmFUfzqZoq5jNbC7yMmwX1wFv5KGk8mZ1dMCIyg/hwZrMCS+QNjvOYl
         J0f9uNYC4rxqXZ2mP58zj0gpGnbbcn4SXusADWexKa08AFR8a6KXvjLDkuQMU+ig2rnP
         rC3so/dtRoHdDKQSs2Ju2YAO29mnu+kTUNvkc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728978892; x=1729583692;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=WmFcFRCIYAEw2190Z4FOUZUOyxlKcujKYWug46B335c=;
        b=N0Dlndg73sO2nty9Owxp9jRJyaaZYe3xmLdd83PCU2PI9uHFkeiWhlADijOLpqS04D
         AiOyIr3FIqVOIX/bxRTOAjgLzKItK996z1lzjTw9qwVAkqN6AH1ku3cSg3yTq5ooipG9
         jUQ6Z0K0ePENtErblj3yC9tHl5r7xsxxix9dSOaj2PpkI9fD9m37odk8jN72uRpUJzQV
         eFTgFbZlzYB0i07jwoJ4IyRSNF0Ykao02WGeaWx9kL9Tf4ptDBtkr5DwxP3o6YfH7u7i
         ICbavhyXuHUZ8CUBQ8IW9gUtyFOoFoM0nv7zCRmV9KTEjD5iEAdzueqAyqFe1KvFcGPv
         pXcA==
X-Forwarded-Encrypted: i=1; AJvYcCUEZuEobDUO83R2V5ckr4qSkFyExf2aHrL2Dgci8IkFkV/ScQuarO26CbD1OQKldRtWsUvoA5rBcNeiYNbttg==@lists.infradead.org
X-Gm-Message-State: AOJu0YznLmeLUXoHSgz/xUN15bXYDIiafrkclCxsbGl2r/rKzmGJZGsd
	/5qLDe2QUDv1Il0IGkuYQGH/aX39RdOQH7TOeCU/vjZuuZkI2b7WXUCvKv4Z/IrKNB3TGLQnY/u
	RZcz+VwxeDodGVQptyC+LLEg0kPzjOG7Sg1ey
X-Google-Smtp-Source: AGHT+IFUgfyLoHOaQbm6qbZAsrm98uAC9lIzeFdz3VvnKSPD4b56Z9J3TfdKULBQpAMGKGfWRGt6pNsyYRyR0zqkODw=
X-Received: by 2002:a05:6512:b22:b0:539:f8cb:f5e3 with SMTP id
 2adb3069b0e04-539f8cbf8a5mr3102219e87.48.1728978891625; Tue, 15 Oct 2024
 00:54:51 -0700 (PDT)
MIME-Version: 1.0
References: <20241014073314.18409-1-yunfei.dong@mediatek.com>
In-Reply-To: <20241014073314.18409-1-yunfei.dong@mediatek.com>
From: Chen-Yu Tsai <wenst@chromium.org>
Date: Tue, 15 Oct 2024 15:54:40 +0800
Message-ID: <CAGXv+5HV5EPvhFb6oFkRBSw-EGaccxDGBrW0tVDoWQR0RAAeiQ@mail.gmail.com>
Subject: Re: [PATCH 0/6] media: mediatek: vcodec: support h264 extend vsi
To: Yunfei Dong <yunfei.dong@mediatek.com>
Cc: =?UTF-8?B?TsOtY29sYXMgRiAuIFIgLiBBIC4gUHJhZG8=?= <nfraprado@collabora.com>, 
	Sebastian Fricke <sebastian.fricke@collabora.com>, 
	Nicolas Dufresne <nicolas.dufresne@collabora.com>, Hans Verkuil <hverkuil-cisco@xs4all.nl>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
	Benjamin Gaignard <benjamin.gaignard@collabora.com>, Nathan Hebert <nhebert@chromium.org>, 
	Daniel Almeida <daniel.almeida@collabora.com>, Hsin-Yi Wang <hsinyi@chromium.org>, 
	Fritz Koenig <frkoenig@chromium.org>, Daniel Vetter <daniel@ffwll.ch>, 
	Steve Cho <stevecho@chromium.org>, linux-media@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, 
	Project_Global_Chrome_Upstream_Group@mediatek.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241015_005453_711720_C463FE63 
X-CRM114-Status: GOOD (  16.55  )
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

Hi,

On Mon, Oct 14, 2024 at 3:33=E2=80=AFPM Yunfei Dong <yunfei.dong@mediatek.c=
om> wrote:
>
> The working buffer address start and end are calculated in kernel
> side currently, can't calculate the address end if the driver only
> getting the address file handle, not the real physical address. Need
> to extend the vsi to calculate the address end in scp.
>
> Re-construct some interface and add config to support extend and non
> extend at the same time.
> ---
> This patch series depends on:
> [1] https://patchwork.kernel.org/project/linux-mediatek/cover/20241012064=
333.27269-1-yunfei.dong@mediatek.com
> ---
> Yunfei Dong (6):
>   media: mediatek: vcodec: extend h264 video share information
>   media: mediatek: vcodec: remove parse nal info in kernel
>   media: mediatek: vcodec: remove vsi operation in common interface
>   media: mediatek: vcodec: rename vsi to extend vsi
>   media: mediatek: vcodec: adding non extend struct
>   media: mediatek: vcodec: support extend h264 driver

This should be reworked so that "adding non extend struct" is not needed.
"rename vsi to extend vsi" and "extend h264 video share information"
could be combined so that you are "adding" the extended data structures,
not reworking the existing ones. Otherwise the whole thing breaks existing
systems until "adding non extend struct" is applied, making the series
non-bisectable.


ChenYu

>
>  .../vcodec/decoder/mtk_vcodec_dec_drv.h       |   2 +
>  .../decoder/vdec/vdec_h264_req_multi_if.c     | 516 +++++++++++++++++-
>  2 files changed, 493 insertions(+), 25 deletions(-)
>
> --
> 2.46.0
>
>

