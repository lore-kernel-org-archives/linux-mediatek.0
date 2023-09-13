Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 53528CA5500
	for <linux-mediatek@archiver.kernel.org>; Wed, 13 Sep 2023 07:55:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=eVi9HWsbyhPpxRlpwWkXgfmiV8lk8qQbW6adbUERlyM=; b=MaBUa9CEE/ZE5GcWZFILN24nt2
	nPFhZDs4M/8vGKV9+GJNrzTXBSuS0lOjsWHZmu+8Yab7Eyqk4ATMurJXdJhDDWBroMZghXH7AkIz6
	RhvDoFwiIiUQTkrOwSWjwFPOjLuRji6gY7GSBBP7jf8U5w/zbYY1AVsm0dlCZhhn4FTk5sA/ZBXOz
	MX0+gbTmJ8owd3KhEDvTcE+o6ogK+BFvUL8kAYaF0NcnNnKVU2kaqVQDa1ll/VVLaH5CLRJayXFZN
	x587RTOn+hgqunaY9YxI26uV+t10RzJBzv3sjSpXCtMR8MOeauzU/gRte+iIK2ft47vHApoXPcK0R
	jqdxVuJQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qgKiC-004zpt-0p;
	Wed, 13 Sep 2023 07:55:00 +0000
Received: from mail-io1-xd36.google.com ([2607:f8b0:4864:20::d36])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qgKi9-004zoy-13
	for linux-mediatek@lists.infradead.org;
	Wed, 13 Sep 2023 07:54:58 +0000
Received: by mail-io1-xd36.google.com with SMTP id ca18e2360f4ac-79834a7a5d8so61077739f.3
        for <linux-mediatek@lists.infradead.org>; Wed, 13 Sep 2023 00:54:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1694591695; x=1695196495; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=eVi9HWsbyhPpxRlpwWkXgfmiV8lk8qQbW6adbUERlyM=;
        b=DFFlvZ00z4boSSd3uaQEt6lyw3KmXO3NhBrtWzT8BCzAD3NtabS9MXjIZPC/oNKR2y
         OdkUcV0D5d+RoPKajDXqFfsmIvq89DghqarxXMWoaiW9mZTe5NGptp2S5a9LBzJk79ow
         7N1FMQEZHsbuqBTpVLYrVPxWrDahit7D4xKa8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1694591695; x=1695196495;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=eVi9HWsbyhPpxRlpwWkXgfmiV8lk8qQbW6adbUERlyM=;
        b=hbaAzZ3HnZzYWRcUokDXJbD7v5H4ps/H2Oh9EVaso4ldIRVhGhIPu14wDoASSHu56f
         mOharOL6T3L4EzXBX6Bw76ZpxEYDJsn8IaueUxgBmBg5liPVVp4Bb7iU6qeasqJgghDv
         ZY6HxAHJCtvu5s/nNWWQVOW0YsbEBkgMYokBr7WW1WC/QW1RZYJj3Tt7u/n7pU4pG+Gx
         fTesVZ+NiNteXOAMUv5A6XfwwQ+RSdUtXaKsw+Oa3Wjd2d0DXXNZ5yjixmu0dgs4wt+g
         a9ZtiI1edcDVgZImICG7aAOsvvm1X/AM0smIerTXCweiVhj6/MFzSAw/bOPFl//IzFnZ
         ioJg==
X-Gm-Message-State: AOJu0YwEnPAdSgSl7UxMGG1NyG9rsbPvxCxjlSBhMDm/7W+fZI06yLrA
	R4W0Wc8ZKGCCzVOw9+fXXjTVlCLM4pGPaOzIuXQ=
X-Google-Smtp-Source: AGHT+IHLvcwPLDpicyN7ri4Uf4OxYdG+gZ5U43s3EeUd4Gfl9ucW8YSgOUxhjOZBY9M38WkzhVrwKw==
X-Received: by 2002:a5e:dd46:0:b0:786:f47b:c063 with SMTP id u6-20020a5edd46000000b00786f47bc063mr2036670iop.21.1694591695357;
        Wed, 13 Sep 2023 00:54:55 -0700 (PDT)
Received: from mail-io1-f49.google.com (mail-io1-f49.google.com. [209.85.166.49])
        by smtp.gmail.com with ESMTPSA id u9-20020a5ec009000000b00791e6ae3aa4sm3364602iol.23.2023.09.13.00.54.55
        for <linux-mediatek@lists.infradead.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 13 Sep 2023 00:54:55 -0700 (PDT)
Received: by mail-io1-f49.google.com with SMTP id ca18e2360f4ac-792726d3aeeso221153739f.0
        for <linux-mediatek@lists.infradead.org>; Wed, 13 Sep 2023 00:54:55 -0700 (PDT)
X-Received: by 2002:a05:6602:3281:b0:786:7100:72de with SMTP id
 d1-20020a056602328100b00786710072demr2263328ioz.16.1694591694827; Wed, 13 Sep
 2023 00:54:54 -0700 (PDT)
MIME-Version: 1.0
References: <20230822132646.9811-1-jason-jh.lin@mediatek.com> <CAC=S1njUVqt969Wv+dMc5wD3Uyu-2Cm4qCUwkp7kfeG_uBbpVw@mail.gmail.com>
In-Reply-To: <CAC=S1njUVqt969Wv+dMc5wD3Uyu-2Cm4qCUwkp7kfeG_uBbpVw@mail.gmail.com>
From: Fei Shao <fshao@chromium.org>
Date: Wed, 13 Sep 2023 15:54:18 +0800
X-Gmail-Original-Message-ID: <CAC=S1nhhAevMct0SoipCRpVmHmMGEuvu2yKmkjuVVUpeZxZ5ug@mail.gmail.com>
Message-ID: <CAC=S1nhhAevMct0SoipCRpVmHmMGEuvu2yKmkjuVVUpeZxZ5ug@mail.gmail.com>
Subject: Re: [PATCH] drm/mediatek: Add spinlock for setting vblank event in atomic_begin
To: "Jason-JH.Lin" <jason-jh.lin@mediatek.com>
Cc: Chun-Kuang Hu <chunkuang.hu@kernel.org>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
	Alexandre Mergnat <amergnat@baylibre.com>, Eugen Hristev <eugen.hristev@collabora.com>, 
	Jason-ch Chen <jason-ch.chen@mediatek.com>, Johnson Wang <johnson.wang@mediatek.com>, 
	Singo Chang <singo.chang@mediatek.com>, Nancy Lin <nancy.lin@mediatek.com>, 
	Shawn Sung <shawn.sung@mediatek.com>, dri-devel@lists.freedesktop.org, 
	linux-mediatek@lists.infradead.org, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org, 
	Project_Global_Chrome_Upstream_Group@mediatek.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230913_005457_414469_1AFB2CEB 
X-CRM114-Status: GOOD (  10.03  )
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

On Thu, Aug 31, 2023 at 3:12=E2=80=AFPM Fei Shao <fshao@chromium.org> wrote=
:
>
> On Tue, Aug 22, 2023 at 10:27=E2=80=AFPM Jason-JH.Lin <jason-jh.lin@media=
tek.com> wrote:
> >
> > Add spinlock protection to avoid race condition on vblank event
> > between mtk_drm_crtc_atomic_begin() and mtk_drm_finish_page_flip().
> >
> > Fixes: 119f5173628a ("drm/mediatek: Add DRM Driver for Mediatek SoC MT8=
173.")
> > Signed-off-by: Jason-JH.Lin <jason-jh.lin@mediatek.com>
>
> Reviewed-by: Fei Shao <fshao@chromium.org>

Also, I verified that this fixes a real world system hang issue on the
MT8195 Chromebook.

Tested-by: Fei Shao <fshao@chromium.org>

