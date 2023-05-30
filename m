Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2359AC7EE29
	for <linux-mediatek@archiver.kernel.org>; Tue, 30 May 2023 10:15:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=5H+OM4TnsiuKpfJz2aWBvBXWEkbbF/qKmNESlsSE5fA=; b=LSP40rXIvs+OBsARcLyZ/Y3erQ
	tuS4y1rPn/6pixiUZr4aj/9U6Cl/sbKZRffcmq8sdLZs7SebRqM+NllRdtywsiWExy4IzaS1wMgEa
	coK2/z+kbuzeP8Ksagwyxy1R1hBQflX+mzrEqKqcNAKf0i788i9E74YwfolI/I8bbopoFyREJ1/RU
	hSv8sxbflGHQRs6PB2Bp04wDVKbRm0cOXg8Z+A3ONQMsueyDzDkHp1uSkzIJ45k3pThMjPuTXTEZ3
	hQpAv+DHo4KLLQZyP8ePlt3tsRzIU9l9Iql65RNWZdrIAfqd8sgCo8MPZ3zlphNopdovjxNDd42su
	DhajGo4Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1q3wNw-00DKpn-32;
	Tue, 30 May 2023 10:15:24 +0000
Received: from mail-vs1-xe2c.google.com ([2607:f8b0:4864:20::e2c])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1q3wNu-00DKnj-0K
	for linux-mediatek@lists.infradead.org;
	Tue, 30 May 2023 10:15:23 +0000
Received: by mail-vs1-xe2c.google.com with SMTP id ada2fe7eead31-43ad7bf4db9so803818137.1
        for <linux-mediatek@lists.infradead.org>; Tue, 30 May 2023 03:15:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1685441719; x=1688033719;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=5H+OM4TnsiuKpfJz2aWBvBXWEkbbF/qKmNESlsSE5fA=;
        b=Sz6j91lcjKY2jK21OT3wWr5rVvHU/KeDdCrmr+Ql3+rIcaa8cmCFleJRQrfRm5b9bD
         oP+nXq5ZT1WmXzFpvwEPRCFhl28121sSUqUFXhv4sARR2E8URLUfsTUSakRTxq2fJkhK
         fK+vSL4f48iOrblaZr3t1ihc1cVAVcE4yQoIM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1685441719; x=1688033719;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=5H+OM4TnsiuKpfJz2aWBvBXWEkbbF/qKmNESlsSE5fA=;
        b=SD8I3nsytvu87+AGdGbpK4gZ/Ec5X6U5s9NLt6Y5E6r8Kdcy9YRTnM0L3z9NiryUM1
         ITxoLxafULmjbUULQOC1rn/bik66rhfrATrzTa/ahWDaG+MSQgj9QX8ksBUueqOICC/4
         sIRHvz/BwgNyRMLpX987HrYmeTVv6N0IbolqVjswp21WhAFk4FdQcZiwVN/ikOH6qAIn
         LyOuowfPg3UhdOuzq835JYEyw9Z50m8u/X0aXxV+UNCeCI9HHjSnjF+4+VpFjC2TR9EN
         OYU8X5jAlt+wPHlIJ28JrV79pKjkQZSEzA5ZmXE210E7SDoeltqwPXdqTkbWkTwlAGLu
         bN/Q==
X-Gm-Message-State: AC+VfDyp3aXYQ64nLp7cClGJYUJ6w1JvfzWIReEitpRCHFj0rMa/Wyc1
	ZtwUHSfDjfOKgDNoqKIfepAw7pjPO/IFDazWYyrOcQ==
X-Google-Smtp-Source: ACHHUZ58T5/tq/vl8scpFiVOYc5HSsRdNqgSIq8Y4CgGCHhjXslU0dbcvMkH6xW/Gx9F2Zbcj/xuTEttyO6kXmkoLR0=
X-Received: by 2002:a67:ec82:0:b0:434:50e9:164d with SMTP id
 h2-20020a67ec82000000b0043450e9164dmr574854vsp.17.1685441718904; Tue, 30 May
 2023 03:15:18 -0700 (PDT)
MIME-Version: 1.0
References: <20230525021219.23638-1-yunfei.dong@mediatek.com>
 <20230525021219.23638-9-yunfei.dong@mediatek.com> <f3322e41-1891-a33b-daaa-731ec548ec4e@collabora.com>
In-Reply-To: <f3322e41-1891-a33b-daaa-731ec548ec4e@collabora.com>
From: Chen-Yu Tsai <wenst@chromium.org>
Date: Tue, 30 May 2023 18:15:07 +0800
Message-ID: <CAGXv+5FFS6cC+drzXfAbtoEq8b_-9sA1Ry4Xb74hndCkCNiSSA@mail.gmail.com>
Subject: Re: [PATCH v5,8/8] media: mediatek: vcodec: Add dbgfs help function
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: Yunfei Dong <yunfei.dong@mediatek.com>, 
	Nicolas Dufresne <nicolas.dufresne@collabora.com>, Hans Verkuil <hverkuil-cisco@xs4all.nl>, 
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
X-CRM114-CacheID: sfid-20230530_031522_140765_A902E716 
X-CRM114-Status: GOOD (  24.57  )
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

On Tue, May 30, 2023 at 6:06=E2=80=AFPM AngeloGioacchino Del Regno
<angelogioacchino.delregno@collabora.com> wrote:
>
> Il 25/05/23 04:12, Yunfei Dong ha scritto:
> > Getting dbgfs help information with command "echo -help > vdec".
> >
> > Signed-off-by: Yunfei Dong <yunfei.dong@mediatek.com>
> > ---
> >   .../mediatek/vcodec/mtk_vcodec_dbgfs.c        | 24 ++++++++++++++++++=
-
> >   1 file changed, 23 insertions(+), 1 deletion(-)
> >
> > diff --git a/drivers/media/platform/mediatek/vcodec/mtk_vcodec_dbgfs.c =
b/drivers/media/platform/mediatek/vcodec/mtk_vcodec_dbgfs.c
> > index 237d0dc8a1fc..2372fc449b45 100644
> > --- a/drivers/media/platform/mediatek/vcodec/mtk_vcodec_dbgfs.c
> > +++ b/drivers/media/platform/mediatek/vcodec/mtk_vcodec_dbgfs.c
> > @@ -52,6 +52,23 @@ static void mtk_vdec_dbgfs_get_format_type(struct mt=
k_vcodec_ctx *ctx, char *buf
> >       *used +=3D curr_len;
> >   }
> >
> > +static void mtk_vdec_dbgfs_get_help(char *buf, int *used, int total)
> > +{
> > +     int curr_len;
> > +
> > +     curr_len =3D snprintf(buf + *used, total - *used,
> > +                         "help: (1: echo -'info' > vdec 2: cat vdec)\n=
");
> > +     *used +=3D curr_len;
> > +
> > +     curr_len =3D snprintf(buf + *used, total - *used,
> > +                         "\t-picinfo: get resolution\n");
> > +     *used +=3D curr_len;
> > +
> > +     curr_len =3D snprintf(buf + *used, total - *used,
> > +                         "\t-format: get output & capture queue format=
\n");
> > +     *used +=3D curr_len;
> > +}
> > +
> >   static ssize_t mtk_vdec_dbgfs_write(struct file *filp, const char __u=
ser *ubuf,
> >                                   size_t count, loff_t *ppos)
> >   {
> > @@ -84,6 +101,11 @@ static ssize_t mtk_vdec_dbgfs_read(struct file *fil=
p, char __user *ubuf,
> >       if (!buf)
> >               return -ENOMEM;
> >
> > +     if (strstr(dbgfs->dbgfs_buf, "-help")) {
>
> I would print the help strings in two conditions:
> 1. -help
> 2. (nothing)
>
> ...so that if you don't echo anything to vdec (no params), you get the he=
lp text.
> Otherwise, you would have to know that "-help" is a parameter that gives =
you help
> text in the first place.
>
> As for this commit "as is", it works as intended and it is useful to retr=
ieve
> the help text; you can either send a followup commit that extends the hel=
p to
> the corner case that I've explained, or send a v6 adding that to this sam=
e commit.
>
> I would prefer to see a v6 -- BUT -- since this series was sent a long ti=
me ago,
> you will get my R-b and I will leave the final choice to Hans.
>
> Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collab=
ora.com>

The help file could just exist as a separate file. You can then use cleaner
interfaces for it.

ChenYu

