Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AD4AFC2BB3F
	for <linux-mediatek@archiver.kernel.org>; Wed, 15 Nov 2023 22:02:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=JuZvFHzKeqbg6jXEYOC+etK401rPBU1DU0zLZUwkdow=; b=LKKXrBWjHc8tlR5i5o/d3AEvbX
	zNz10CXHOtYr4bFOszx3njk7527zZgcQaVn6APAXDoQGjgOu+nzNK0zBCitmknpisrENb35W3HkQV
	qHuZmOHpxS7LU+TiM9FC/52t+E7eEgFfntQpc1mjXpip361VSC/a7MbUGa1uySXao1ZV5FL5Xi6qH
	KziaWkhRZMN8AzxIDggJGrZFgmVGlISqCiTcDTIsOPLS4sFCKeqhtc+m0QUvNzPjr8UhaR0/c/+GJ
	Gre5nYX7MAkLHRhYZ73aZhKMijVYq4nhC5lf3ambpN2aaLVipbqyYcfqtxv22StjkDNjeaACfifwS
	Ny2fsw+g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1r3Nxo-001pDu-1G;
	Wed, 15 Nov 2023 22:02:24 +0000
Received: from mail-pl1-x62b.google.com ([2607:f8b0:4864:20::62b])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1r3Nxk-001pCC-0Y
	for linux-mediatek@lists.infradead.org;
	Wed, 15 Nov 2023 22:02:21 +0000
Received: by mail-pl1-x62b.google.com with SMTP id d9443c01a7336-1cc209561c3so48235ad.0
        for <linux-mediatek@lists.infradead.org>; Wed, 15 Nov 2023 14:02:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1700085737; x=1700690537; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=JuZvFHzKeqbg6jXEYOC+etK401rPBU1DU0zLZUwkdow=;
        b=ymC7YC1KNsPTK+fim7IiLTtw8r01mxFpX1q2l8nF+eWksgifv3+xJrMyKkW/unwC3r
         bHOALPlQUC3ZLeB2m40Bd+adWqQr4Qr72xP3vLyogF5QVjpS4PRlLwEPWY6C7Yz3jbZk
         PopmFJx7aYrnSZkf/Oz0mxfqglkOK2t9FJAyl3301aviZef/GyBv0KWI7gjiHmW8dbDJ
         Zx6T4F5VdmApieAbrU/cOZ4Lba99X4LPaXC9yRVYTcob627NegtEAgyrGaxMV03GXt7p
         BOt0yN53GwyBMuvimgaabHhkiRiOeiNMzrauk732Adn8Veol0h9w/S0ArsShPhw7ywHy
         48zg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1700085737; x=1700690537;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=JuZvFHzKeqbg6jXEYOC+etK401rPBU1DU0zLZUwkdow=;
        b=O1tSwEMDa50TXA8roInUsCCQG/92fjMRHkb9VwB4xr0SggkoJAG9N9LmObM99NdYC8
         uB5Ji/fbXpvEzi2gy7l5LnoEjjVK1Alj04CZ+Hu7pNlgecbDyBWkuQtIej6WQTUA+VDK
         TrA2fxjrbicupq52nEV2Ba3ChBu0TNwP+6cD4dQxWYt13iGADTaVgzDV3burCL6kD2PW
         hbXR+UY6Ftskj9ixAUbEQ/+R6Q5CcajvWjLiKfdTXfwyQSeLauR4FX4ZLujF6HYNv0c2
         BL3kSmxrxFeKlW//4xBzsdsSJmh5WiS/dKG9g28itjrn3EtK/ry2a2GLMU4s8clfUcbW
         RpXQ==
X-Gm-Message-State: AOJu0Yw2L0yBmnpCyBHK5wFLhXF/5xvUkD1/S2bvbnClJHv1aj6VnMfA
	XSyBIyykDdhfEwmBQ78ya6xZNqd2ZSfAhBN8C8CW
X-Google-Smtp-Source: AGHT+IFRrz+wFMxIvQfSahyfIBqJGBGy54Oa9WJpbdDj3Indo4j6kQ+gLppqjmS9wzYszPzrga5jiO2H91ugbxFInwY=
X-Received: by 2002:a17:902:d506:b0:1c7:25e4:a9d5 with SMTP id
 b6-20020a170902d50600b001c725e4a9d5mr45085plg.17.1700085736744; Wed, 15 Nov
 2023 14:02:16 -0800 (PST)
MIME-Version: 1.0
References: <20231111111559.8218-1-yong.wu@mediatek.com> <ZU/V2XX71GbaV6Q8@duo.ucw.cz>
In-Reply-To: <ZU/V2XX71GbaV6Q8@duo.ucw.cz>
From: Jeffrey Kardatzke <jkardatzke@google.com>
Date: Wed, 15 Nov 2023 14:02:05 -0800
Message-ID: <CA+ddPcNd20Bg_pYWqty90NafwC54dz0LGEmTMpia5_7e4=N-cg@mail.gmail.com>
Subject: Re: [PATCH v2 0/8] dma-buf: heaps: Add secure heap
To: Pavel Machek <pavel@ucw.cz>
Cc: Yong Wu <yong.wu@mediatek.com>, Rob Herring <robh+dt@kernel.org>, 
	Sumit Semwal <sumit.semwal@linaro.org>, christian.koenig@amd.com, 
	Matthias Brugger <matthias.bgg@gmail.com>, 
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Conor Dooley <conor+dt@kernel.org>, 
	Benjamin Gaignard <benjamin.gaignard@collabora.com>, Brian Starkey <Brian.Starkey@arm.com>, 
	John Stultz <jstultz@google.com>, tjmercier@google.com, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-media@vger.kernel.org, 
	dri-devel@lists.freedesktop.org, linaro-mm-sig@lists.linaro.org, 
	linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, 
	jianjiao.zeng@mediatek.com, kuohong.wang@mediatek.com, 
	Vijayanand Jitta <quic_vjitta@quicinc.com>, Joakim Bech <joakim.bech@linaro.org>, 
	Nicolas Dufresne <nicolas@ndufresne.ca>, ckoenig.leichtzumerken@gmail.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231115_140220_208867_62E8E006 
X-CRM114-Status: GOOD (  15.38  )
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

The main goal is for secure video playback, and to also enable other
potential uses of this in the future. The 'secure dma-heap' will be
used to allocate dma_buf objects that reference memory in the secure
world that is inaccessible/unmappable by the non-secure (i.e.
kernel/userspace) world.  That memory will be used by the secure world
to store secure information (i.e. decrypted media content). The
dma_bufs allocated from the kernel will be passed to V4L2 for video
decoding (as input and output). They will also be used by the drm
system for rendering of the content.

Hope that helps.

Cheers,
Jeff

On Mon, Nov 13, 2023 at 3:38=E2=80=AFAM Pavel Machek <pavel@ucw.cz> wrote:
>
> Hi!
>
> > This patchset adds three secure heaps:
> > 1) secure_mtk_cm: secure chunk memory for MediaTek SVP (Secure Video Pa=
th).
> >    The buffer is reserved for the secure world after bootup and it is u=
sed
> >    for vcodec's ES/working buffer;
> > 2) secure_mtk_cma: secure CMA memory for MediaTek SVP. This buffer is
> >    dynamically reserved for the secure world and will be got when we st=
art
> >    playing secure videos, Once the security video playing is complete, =
the
> >    CMA will be released. This heap is used for the vcodec's frame buffe=
r.
> > 3) secure_cma: Use the kerne CMA ops as the allocation ops.
> >    currently it is a draft version for Vijay and Jaskaran.
>
> Is there high-level description of what the security goals here are,
> somewhere?
>
> BR,
>                                                                         P=
avel
> --
> People of Russia, stop Putin before his war on Ukraine escalates.

