Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 90A6FC7EE23
	for <linux-mediatek@archiver.kernel.org>; Tue, 30 May 2023 10:13:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=hZ0BJZ8SmdZjdj+zn8FxFAZpMTTsRd9o+hpEFn6fp34=; b=ts7fxchMAJ9PqdtXyl5bO02gb1
	Jx9qm14h7jiEpmyUWqY+sncx/HSowQk27djCP7ocIr0hB8OtWqqFPS0kiHZvm5tTTHoPNl6q4QHVu
	ZvalJ5lvzCBpOs6e5l0zVK/88+HSnqvml6huzl2C9nUjuwQnH3kCd5yaCaIwZDUOYZ37hwABLKAoS
	DOIA11Vanfsk2Jm3vu1i7T9f3TLjY/cvGOG5grjVRFoHOHGEACsyMitz+BkfqYnGcAaIaKRk2vVx5
	E4Vb+G2n1GVt07JKKYp9OeXh3gU5FsnyuBGDCPyFz5K+DdD+GOOU7nhDZ5TS+V6DApRdIWUw+ph5f
	Ce0UKeIQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1q3wMP-00DKRg-2W;
	Tue, 30 May 2023 10:13:49 +0000
Received: from mail-vk1-xa2f.google.com ([2607:f8b0:4864:20::a2f])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1q3wMN-00DKQT-0V
	for linux-mediatek@lists.infradead.org;
	Tue, 30 May 2023 10:13:48 +0000
Received: by mail-vk1-xa2f.google.com with SMTP id 71dfb90a1353d-457080dc902so1255856e0c.2
        for <linux-mediatek@lists.infradead.org>; Tue, 30 May 2023 03:13:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1685441626; x=1688033626;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=hZ0BJZ8SmdZjdj+zn8FxFAZpMTTsRd9o+hpEFn6fp34=;
        b=RBBWzQ8HEW+9Ib3a8FhJhb7FYys7zwdEFNmdgcI7F5skhmV2LX9SyfMfN2P/VqSG4B
         XHHINCDVjtKyi6EFACg4gOn0kT9la/m1FLdlFjCItqtAC7lLcbtZg0M7ZXJE/s0fPYcE
         WnkkEu9TcEkazWD+Lx00lIhvQUkPQFzDILi20=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1685441626; x=1688033626;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=hZ0BJZ8SmdZjdj+zn8FxFAZpMTTsRd9o+hpEFn6fp34=;
        b=L0FkU6iOl+1HLQZz76pNk0Rr6Xy9XL9tZfiEKSMfTF4HA4uNdMGoaJk81GdXQHXefS
         vO9U9KTPXTQxG/IF25UdqoQUnW09h0HktilZGznwcU+mbCs8lm4E9aNoa40h1kgF0qir
         zA4EzsgkOi9ZuJ7eAmHgJLM1zsjNXn8kPqR4eH4kDQVBA4u4f6WlsvA8ZEGCZkiuSPIk
         7RSsa6eI50iCOAIvMeDRreygpUV5a2OaQi41R6S5V4mYMYGB0yrAkhTm71LqlYC2t0EA
         dpJIaJgDbx1pgc7h40Nrd/EYSaQsNM3Kc9t3GwbtjtWK9ePVRMgpP165XL5GTSabJ2V+
         Zpcg==
X-Gm-Message-State: AC+VfDzJQaoy4TcMeV6cxQVj5A6CHS6Cq91cfOO1RsPHTVR/DWfUdEuK
	WhSH3CKca0BArxjlo5xz8YAxhwgOlFN47NYMbuU5Pw==
X-Google-Smtp-Source: ACHHUZ7bdeDqEKSO8uuf8TcSdZrCbpL1tSVPRVUVUmGf74rTT2eVhIui40uKYx4bjCTsIWoYlRWwreTsGzdE2XuIez0=
X-Received: by 2002:a1f:5fd2:0:b0:43f:8928:151c with SMTP id
 t201-20020a1f5fd2000000b0043f8928151cmr392643vkb.11.1685441625957; Tue, 30
 May 2023 03:13:45 -0700 (PDT)
MIME-Version: 1.0
References: <20230525021219.23638-1-yunfei.dong@mediatek.com>
In-Reply-To: <20230525021219.23638-1-yunfei.dong@mediatek.com>
From: Chen-Yu Tsai <wenst@chromium.org>
Date: Tue, 30 May 2023 18:13:34 +0800
Message-ID: <CAGXv+5HLXiD10UV+Z-CTDrHQC16RFMYi6hsiGs3B0m4kgXkCZA@mail.gmail.com>
Subject: Re: [PATCH v5,0/8] media: mediatek: vcodec: Add debugfs file for
 decode and encode
To: Yunfei Dong <yunfei.dong@mediatek.com>
Cc: Nicolas Dufresne <nicolas.dufresne@collabora.com>, Hans Verkuil <hverkuil-cisco@xs4all.nl>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
	Benjamin Gaignard <benjamin.gaignard@collabora.com>, 
	=?UTF-8?B?TsOtY29sYXMgRiAuIFIgLiBBIC4gUHJhZG8=?= <nfraprado@collabora.com>, 
	Nathan Hebert <nhebert@chromium.org>, Hsin-Yi Wang <hsinyi@chromium.org>, 
	Fritz Koenig <frkoenig@chromium.org>, Daniel Vetter <daniel@ffwll.ch>, 
	Steve Cho <stevecho@chromium.org>, linux-media@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, 
	Project_Global_Chrome_Upstream_Group@mediatek.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230530_031347_224823_E272115A 
X-CRM114-Status: GOOD (  18.95  )
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

On Thu, May 25, 2023 at 10:12=E2=80=AFAM Yunfei Dong <yunfei.dong@mediatek.=
com> wrote:
>
> Need to change kernel driver to open decode and encode debug log at curre=
nt period,
> it's very unreasonable. Adding debugfs common interface to support decode=
 and encode,
> using echo command to control debug log level and getting useful informat=
ion for each
> instance.
>
> patch 1 add dbgfs common interface.
> patch 2~5 support decode.
> patch 6~7 support encode
> patch 8 add help function

I find the interface kind of weird. A lot of debugfs usage in other places
just dumps out the current state. Here you are writing to it to ask it to
do a snapshot, and then you read it later. This ends up requiring manual
management of a buffer, instead of using seq_file, which is commonly used
for virtual files.

ChenYu

> ---
> changed with v4:
> - rebase to the top of media stage header.
>
> changed with v3:
> - add help function for patch 8
> - remove append '\0' and enlarge buffer size for patch 4
>
> changed with v2:
> - using pr_debug and dev_dbg instead of pr_info for patch 2.
> - fix word fail: informatiaoin -> information for patch 3.
> - used to print each instance format information for patch 5.
>
> changed with v1:
> - add new patch 4 and 5.
> - using cmd 'cat vdec' to show debug information instead of pr_info direc=
tly.
> ---
> Yunfei Dong (8):
>   media: mediatek: vcodec: Add debugfs interface to get debug
>     information
>   media: mediatek: vcodec: Add debug params to control different log
>     level
>   media: mediatek: vcodec: Add a debugfs file to get different useful
>     information
>   media: mediatek: vcodec: Get each context resolution information
>   media: mediatek: vcodec: Get each instance format type
>   media: mediatek: vcodec: Change dbgfs interface to support encode
>   media: mediatek: vcodec: Add encode to support dbgfs
>   media: mediatek: vcodec: Add dbgfs help function
>
>  .../media/platform/mediatek/vcodec/Makefile   |   6 +
>  .../mediatek/vcodec/mtk_vcodec_dbgfs.c        | 216 ++++++++++++++++++
>  .../mediatek/vcodec/mtk_vcodec_dbgfs.h        |  72 ++++++
>  .../mediatek/vcodec/mtk_vcodec_dec_drv.c      |   4 +
>  .../platform/mediatek/vcodec/mtk_vcodec_drv.h |   4 +
>  .../mediatek/vcodec/mtk_vcodec_enc_drv.c      |   2 +
>  .../mediatek/vcodec/mtk_vcodec_util.c         |   8 +
>  .../mediatek/vcodec/mtk_vcodec_util.h         |  26 ++-
>  8 files changed, 335 insertions(+), 3 deletions(-)
>  create mode 100644 drivers/media/platform/mediatek/vcodec/mtk_vcodec_dbg=
fs.c
>  create mode 100644 drivers/media/platform/mediatek/vcodec/mtk_vcodec_dbg=
fs.h
>
> --
> 2.25.1
>

