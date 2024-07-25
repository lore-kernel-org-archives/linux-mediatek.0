Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6D089C3DA49
	for <linux-mediatek@archiver.kernel.org>; Thu, 25 Jul 2024 18:29:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=7H82UX58ZrrZtRiHAVe/+LcpHIvYYzG0b2RLD43YNbY=; b=yd01U4i0fGKwCiv7ugIpsFdUej
	UNOGt+g0pTnsKlEc/GXDWVe4xKy7DXWHuwLju7B7nRjt710lzTd80uweV9EGlj3bEGkwxDtm/6VdG
	gyOdz18Mnm4LM6MbHFap4JnePfGw/OrN2X1yOladzPBeA3s3uzXpyImOXbggreIa5UCRwPFT4VyKN
	swBTvuhZ92fQfJFUwpbJtqYltSxGFlnRczC6k9JEvWA6t2is2p+pJX9lQq97DMClCcKNMhQYIfANO
	mK3CGBZiiKsQYmNLyICmTF4zy607Ja8lNtGSSy50LlrjY0fmzU+TxWYyawQfkUGRd/yWq5McCzngK
	v0W+pJIw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sX3DH-00000001ml8-1bgd;
	Thu, 25 Jul 2024 18:29:15 +0000
Received: from mail-yb1-xb2d.google.com ([2607:f8b0:4864:20::b2d])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sX3DE-00000001mjB-35oI
	for linux-mediatek@lists.infradead.org;
	Thu, 25 Jul 2024 18:29:13 +0000
Received: by mail-yb1-xb2d.google.com with SMTP id 3f1490d57ef6-e0874f138aeso1175058276.2
        for <linux-mediatek@lists.infradead.org>; Thu, 25 Jul 2024 11:29:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1721932147; x=1722536947; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=7H82UX58ZrrZtRiHAVe/+LcpHIvYYzG0b2RLD43YNbY=;
        b=Ic6udll162cc9UHqVuPOrW2EmiX2TJk5QXKs+PvViKaieGDpGVCOAUhHG+BgBOpDRS
         d3sdqW601WLxCCt3fAuua0UQZRSIjfFUh1qfbvZR+WPVHVk47RT3Zt5NcCgM+qIaMbIt
         Uugl+hwwQLHsoTHpX2JbtcUF4HpXSctNpMT7hn4OcqRxlOt7IIy+44Da2BL4AqHFmZJA
         X97VaQu55n6igyr52IJjIoc893U0bpTZk8yjZkdrlDOZS/zkEyRTafN2RLJVxhbveXVu
         Bn3qmUMtER7lwKNnmJWUfxpLxNbUwn9+q0SmobljZju7ECNCoBXPC6HITSEQQGk+OJsg
         jfbg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1721932147; x=1722536947;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=7H82UX58ZrrZtRiHAVe/+LcpHIvYYzG0b2RLD43YNbY=;
        b=pmtrFGyMx2G1sgrpE0GTVctaIGGw2nIZ8Nupbuw6Tv4P9tzOyZNJU1n6MAqStCBz5F
         jrOMIhnZ8ZYP0hAugwhPY1Gw3ZgNgjCNxgfg0rUfxWdKnU6Udjp5XQcD7hWE4S5QLHg1
         vKlhqmFmIrYYZe5w4ZRwBLWQaMwRQa5mvxmLfrdsvjQDxsS8B+zVHjJ+SklOFnfO7a+P
         3Y0DEbSecZgfYoT62m7EUtWbPj4d88De6HGKvuSLBFdFj58XXaj61Xl3K9KOi2Bk3z5B
         VFwDDzAbIU/ytyXXpfeGlpcx0WOhKNdBvJVW22K6WIIcK52RdasqAEPWjCZHvgIo/iGE
         zj7w==
X-Forwarded-Encrypted: i=1; AJvYcCWLFwqxE+o81ne8zbNWTIakc9LNDiMVWLYivWPIIEscQgdz3ugPGxlVRe6UU49PVILBrRS6L3JJ8+7ohVKXD1xHg9yzpZfslLiXiFr/ilPfMG0x
X-Gm-Message-State: AOJu0YwEz1hjGdSrZBfulnmS09pDkZdslDis9yS5wD3UECkOcSUre01A
	6GPQ/yLKvAm426Ijz5znj8fR3aFPWt2eEV3Y0kzhLbbZvfsk2rXmiYaSVLtVoATNA2L0pr33Vkg
	h+4noSJNXzg1mtztb+iGVykgSF7Oyo+QtO01c
X-Google-Smtp-Source: AGHT+IGItijrenPjAmbxU5/Nvgn7ovQBfsTeRuhZp2oL9F1LlVeqZKuRyX0WfNygkWhlg9mziIYn9ttT+ix/HaljKmM=
X-Received: by 2002:a05:6902:c0b:b0:e0b:1519:e0da with SMTP id
 3f1490d57ef6-e0b23230e16mr4766336276.52.1721932147352; Thu, 25 Jul 2024
 11:29:07 -0700 (PDT)
MIME-Version: 1.0
References: <20240720071606.27930-1-yunfei.dong@mediatek.com>
 <20240720071606.27930-5-yunfei.dong@mediatek.com> <8b143d1c-edf9-4b2c-a382-75328156a7b0@amd.com>
In-Reply-To: <8b143d1c-edf9-4b2c-a382-75328156a7b0@amd.com>
From: "T.J. Mercier" <tjmercier@google.com>
Date: Thu, 25 Jul 2024 11:28:55 -0700
Message-ID: <CABdmKX2SqrUE1dnZWFnzMYLYqScoCrM0JDxc3YuzQyyV43wDHg@mail.gmail.com>
Subject: Re: [PATCH v7 04/28] dma-buf: heaps: Deduplicate docs and adopt
 common format
To: =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
Cc: Yunfei Dong <yunfei.dong@mediatek.com>, Jeffrey Kardatzke <jkardatzke@google.com>, 
	=?UTF-8?B?TsOtY29sYXMgRiAuIFIgLiBBIC4gUHJhZG8=?= <nfraprado@collabora.com>, 
	Nathan Hebert <nhebert@chromium.org>, Nicolas Dufresne <nicolas.dufresne@collabora.com>, 
	Hans Verkuil <hverkuil-cisco@xs4all.nl>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
	Benjamin Gaignard <benjamin.gaignard@collabora.com>, 
	Sebastian Fricke <sebastian.fricke@collabora.com>, Tomasz Figa <tfiga@chromium.org>, 
	Mauro Carvalho Chehab <mchehab@kernel.org>, Marek Szyprowski <m.szyprowski@samsung.com>, 
	Chen-Yu Tsai <wenst@chromium.org>, Yong Wu <yong.wu@mediatek.com>, 
	Hsin-Yi Wang <hsinyi@chromium.org>, Fritz Koenig <frkoenig@chromium.org>, 
	Daniel Vetter <daniel@ffwll.ch>, Steve Cho <stevecho@chromium.org>, 
	Sumit Semwal <sumit.semwal@linaro.org>, Brian Starkey <Brian.Starkey@arm.com>, 
	John Stultz <jstultz@google.com>, Matthias Brugger <matthias.bgg@gmail.com>, linux-media@vger.kernel.org, 
	dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, 
	Project_Global_Chrome_Upstream_Group@mediatek.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240725_112912_798469_0A16460C 
X-CRM114-Status: GOOD (  12.56  )
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

On Thu, Jul 25, 2024 at 4:52=E2=80=AFAM Christian K=C3=B6nig
<christian.koenig@amd.com> wrote:
>
> Am 20.07.24 um 09:15 schrieb Yunfei Dong:
> > From: "T.J. Mercier" <tjmercier@google.com>
> >
> > The docs for dma_heap_get_name were incorrect, and since they were
> > duplicated in the header they were wrong there too.
> >
> > The docs formatting was inconsistent so I tried to make it more
> > consistent across functions since I'm already in here doing cleanup.
> >
> > Remove multiple unused includes and alphabetize.
> >
> > Signed-off-by: T.J. Mercier <tjmercier@google.com>
> > Signed-off-by: Yong Wu <yong.wu@mediatek.com>
> > [Yong: Just add a comment for "priv" to mute build warning]
> > Signed-off-by: Yunfei Dong <yunfei.dong@mediatek.com>
>
> Since this is essentially a complete independent documentation fix I've
> gone ahead and pushed it to drm-misc-next.
>
> Regards,
> Christian.

Thanks!

