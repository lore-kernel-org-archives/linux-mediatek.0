Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3CD49C0015E
	for <linux-mediatek@archiver.kernel.org>; Thu, 27 Jul 2023 01:58:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Rl6PigYMVh9s2oP7S4CJnyurGxqCI1k7lEZU6lICmsE=; b=xP6Fl9Cj8esB4sqviBdD/9hTkl
	hZAZgLTGRDUxxXq4vSQpEkPxX3mIoELav2cZ/OixH8ck8pcN5+eJxj32J4bSHnaYMIE/H//1fhx/W
	cndRnM2PLeCpTeiKza8ENXeOo2xyA5XUk98vwtz+zObfs7XxhqHx83X220t1sxHGfrO+qavCVnROc
	ZuYsxAICtXyWVTXGLOTClX0l5y7SIxisSGdSDoObVc8wg/bnUjqiE69Hx9eIyimdk9SRjPpZHOn7G
	l3k4NPTg5AFbX0BG+D4yqcXyP4Wu5RoHFYCv3caI9UwZM5wLh9PbROmR019W0UHFXavBNvtqAHVkC
	fqGZM5Xw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qOqGR-00Btmn-2i;
	Thu, 27 Jul 2023 01:58:03 +0000
Received: from mail-qv1-xf34.google.com ([2607:f8b0:4864:20::f34])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qOqGO-00BtlM-2B
	for linux-mediatek@lists.infradead.org;
	Thu, 27 Jul 2023 01:58:02 +0000
Received: by mail-qv1-xf34.google.com with SMTP id 6a1803df08f44-63d35aa5419so2885376d6.1
        for <linux-mediatek@lists.infradead.org>; Wed, 26 Jul 2023 18:57:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1690423077; x=1691027877;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Rl6PigYMVh9s2oP7S4CJnyurGxqCI1k7lEZU6lICmsE=;
        b=aOxJydwM7qarFE1aSYtvrlq/ALrNN3AChwDvKukN93oOy57SYxC1aY9DDG+ue0IF7O
         As1VmTB/9bJf+gJOqiFArKRmWTLY8d8Xmkk74bIk0VN5PUk30wdbU4PqlbG1hW1GCNMr
         ddrGC7+fewHyM3uzjDZuvUIymxlTsGLsURxFM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1690423077; x=1691027877;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Rl6PigYMVh9s2oP7S4CJnyurGxqCI1k7lEZU6lICmsE=;
        b=FGZJiSzeYMrTqi8vUyuVDlOp/EzM8J7i7Tf3hneIAOUFo+YjXriBzWP1RA85KUufdy
         9dcN1ESNeS6zZCc3Jtcr32HbuWQoCSTrbtWNUWa15zzm/zW80bSmig0XSxkKpUkD2tSq
         HY3ctQuenmSq8trxouc3SrCwY7rqK5xuDEfDgBmb3HQ/p+DLLGWDXRIM1ry+zXfXKbCe
         5IFJoAknVhu/0np6M2fCVeOalx5WL3A5fBZcfUpBQN9MFfWH3yj5vZi3OwCu3h3DrfeW
         raWhf3QNPXTRMkP7F05dPXP9KZBxLwfAY5/y85MsSmn4oWszuX3uWJeqWtX6fEGX9I8C
         KD7A==
X-Gm-Message-State: ABy/qLZ/5UkN5OVo3MHiOtu/ToSzS8U8GH6sTX/E/JEt4oTH7OBGxC5n
	xbuZRZWGVXk2dxucIs5kvxHhWihBc7BGexf2+MOang==
X-Google-Smtp-Source: APBJJlGWwiYxDmlj9yiU/OLhw9doknISI60IdPj5e9gLcY/AYufaO9U5H4YxZimDw2OOn2nclBzVDw==
X-Received: by 2002:a0c:e094:0:b0:63c:f71f:7159 with SMTP id l20-20020a0ce094000000b0063cf71f7159mr3084091qvk.5.1690423077525;
        Wed, 26 Jul 2023 18:57:57 -0700 (PDT)
Received: from mail-qv1-f42.google.com (mail-qv1-f42.google.com. [209.85.219.42])
        by smtp.gmail.com with ESMTPSA id c7-20020ae9e207000000b00767b07ec8adsm76628qkc.82.2023.07.26.18.57.56
        for <linux-mediatek@lists.infradead.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 26 Jul 2023 18:57:56 -0700 (PDT)
Received: by mail-qv1-f42.google.com with SMTP id 6a1803df08f44-63d35aa5419so2885236d6.1
        for <linux-mediatek@lists.infradead.org>; Wed, 26 Jul 2023 18:57:56 -0700 (PDT)
X-Received: by 2002:a0c:dc0b:0:b0:63c:cbff:b490 with SMTP id
 s11-20020a0cdc0b000000b0063ccbffb490mr3316082qvk.45.1690423076287; Wed, 26
 Jul 2023 18:57:56 -0700 (PDT)
MIME-Version: 1.0
References: <20230328092608.523933-1-harperchen1110@gmail.com> <CAAFQd5CqhZgtCJ_-6M0=dYAfVs0TFeBjPURvosS_24qgour=Ow@mail.gmail.com>
In-Reply-To: <CAAFQd5CqhZgtCJ_-6M0=dYAfVs0TFeBjPURvosS_24qgour=Ow@mail.gmail.com>
From: Tomasz Figa <tfiga@chromium.org>
Date: Thu, 27 Jul 2023 10:57:44 +0900
X-Gmail-Original-Message-ID: <CAAFQd5BnfStWf-S2TSR3w-6vbsCc7DU_JirwDVOixTj_6+TENQ@mail.gmail.com>
Message-ID: <CAAFQd5BnfStWf-S2TSR3w-6vbsCc7DU_JirwDVOixTj_6+TENQ@mail.gmail.com>
Subject: Re: [PATCH] media: vcodec: Fix potential array out-of-bounds in vb2ops_venc_queue_setup
To: mchehab@kernel.org, Hans Verkuil <hverkuil@xs4all.nl>
Cc: tiffany.lin@mediatek.com, andrew-ct.chen@mediatek.com, 
	yunfei.dong@mediatek.com, matthias.bgg@gmail.com, 
	angelogioacchino.delregno@collabora.com, linux-media@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-mediatek@lists.infradead.org, Wei Chen <harperchen1110@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230726_185800_742418_90AF0E67 
X-CRM114-Status: GOOD (  21.21  )
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

Hi Mauro, Hans,

On Thu, Jun 15, 2023 at 1:23=E2=80=AFAM Tomasz Figa <tfiga@chromium.org> wr=
ote:
>
> On Tue, Mar 28, 2023 at 6:26=E2=80=AFPM Wei Chen <harperchen1110@gmail.co=
m> wrote:
> >
> > variable *nplanes is provided by user via system call argument. The
> > possible value of q_data->fmt->num_planes is 1-3, while the value
> > of *nplanes can be 1-8. The array access by index i can cause array
> > out-of-bounds.
> >
> > Fix this bug by checking *nplanes against the array size.
> >
> > Signed-off-by: Wei Chen <harperchen1110@gmail.com>
> > ---
> >  drivers/media/platform/mediatek/vcodec/mtk_vcodec_enc.c | 2 ++
> >  1 file changed, 2 insertions(+)
> >
> > diff --git a/drivers/media/platform/mediatek/vcodec/mtk_vcodec_enc.c b/=
drivers/media/platform/mediatek/vcodec/mtk_vcodec_enc.c
> > index d65800a3b89d..1ea02f9136f6 100644
> > --- a/drivers/media/platform/mediatek/vcodec/mtk_vcodec_enc.c
> > +++ b/drivers/media/platform/mediatek/vcodec/mtk_vcodec_enc.c
> > @@ -821,6 +821,8 @@ static int vb2ops_venc_queue_setup(struct vb2_queue=
 *vq,
> >                 return -EINVAL;
> >
> >         if (*nplanes) {
> > +               if (*nplanes !=3D q_data->fmt->num_planes)
> > +                       return -EINVAL;
> >                 for (i =3D 0; i < *nplanes; i++)
> >                         if (sizes[i] < q_data->sizeimage[i])
> >                                 return -EINVAL;
> > --
> > 2.25.1
> >
>
> Thanks for the patch, it makes sense indeed.
>
> Reviewed-by: Tomasz Figa <tfiga@chromium.org>

Do you plan to pick this patch? Thanks.

Best regards,
Tomasz

