Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1AF16C36010
	for <linux-mediatek@archiver.kernel.org>; Tue,  1 Apr 2025 10:59:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=pRV+VeBoTN2SUSAD80QVrLhbV77gG979UsKYtyQMX8w=; b=jd5sIKO6fbN6TPCr03kEjEY+cG
	R+uKUIrlClrlIo4u7l7rVGeg8szAD5K6ZpIrfaW/YspnAJIiZdto3nMKtQIPFnX9VYqtXDZ88Iqqd
	YIJKfqK8NKQ7P6EgP9rA0sRNTjAeM4NJt5QGtJzcEE/NbubrD0RcbpPSpMglPDETsO6poBHuSEqkV
	ksA+fHdvWU6Sw3/tNV7NdweLntpn27ZA7n4CzMoue1MYF7eJNFrMrFryE+x6g/QZHEftfSd7xXTJ6
	efCAiG3kOArd9XXlQC8smGAFMZ9A8raqTxlWIQklw/VDtQGSVNqKGy9Iy0DxXbiw8SRDij9thD0Ht
	yjJJmK5w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.1 #2 (Red Hat Linux))
	id 1tzZKr-00000002hfo-0ss5;
	Tue, 01 Apr 2025 10:59:13 +0000
Received: from mail-lj1-x22a.google.com ([2a00:1450:4864:20::22a])
	by bombadil.infradead.org with esmtps (Exim 4.98.1 #2 (Red Hat Linux))
	id 1tzZ1i-00000002ebV-0Azy
	for linux-mediatek@lists.infradead.org;
	Tue, 01 Apr 2025 10:39:28 +0000
Received: by mail-lj1-x22a.google.com with SMTP id 38308e7fff4ca-30bf8632052so47446881fa.0
        for <linux-mediatek@lists.infradead.org>; Tue, 01 Apr 2025 03:39:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1743503964; x=1744108764; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=pRV+VeBoTN2SUSAD80QVrLhbV77gG979UsKYtyQMX8w=;
        b=fOeSfeGj5yacaikpYO6l1gdAimCvv4hEHn4JIwuQ2B5BaEpTs1nF3KN6GVapsHQh2E
         PqepA9Xt3qpmopBREg/2iA7dKYUio00ujn4/fYUc9lNuDt/W2KWrcpgGZhDUgCpt1Gxq
         J9nrd9aAD0RQwxWscGCm/j+LWjWissAiQaeWw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743503964; x=1744108764;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=pRV+VeBoTN2SUSAD80QVrLhbV77gG979UsKYtyQMX8w=;
        b=EBJdaaok815CjRygozFKe833nQCvRNyMFoVQDiWrGz+SxhdH/axM8nEXhxx45rXpx6
         +H0HVAsIBQlH9vt1CxTR6Uzhk4TKTEjHHrRBQ4qj/ZoDYpveB0O6cUbIgHk8cf+mfJor
         62ecLVUSSD/gahZO/3yUNHZzR8eSqoSzizZtUqQx6ExlXvWShGCujrql9jsZW26Yf1o9
         Ycjp1QJzc7uud5zuca+VtHLZ8UaHP8eOpPNYV2YDsK3ymbe9mZlZsJcRqjX3isGQ6/xT
         y7VTK86VFRD3e0Akl7rt1ieOAR7NjIxSs2tAFivMnk2BGlaRuS4ILhZQnL54JxkLVE9X
         umFw==
X-Forwarded-Encrypted: i=1; AJvYcCWIjSxuzriP4/gnV9hAlw3GYin3qfmM6CeMOdbgRMut5XcBhPGVIEyseVPRFwjEuRoyqxOCJ6HGtG0QIYD/Bg==@lists.infradead.org
X-Gm-Message-State: AOJu0Yw2wyamTDvPSeE8UVScGGJNmm+plpr+HkvNvWIHCdia8ZZDyKCT
	3r8LnaI5RJDV5odA0H098S72gce31RZd5eiV29aL+WNVLMqllrenD0are/Z0z6dso+/tX8jptLa
	CqmCZ675oSfT9LCjizL/q2qwUnNH0/E5wCTcz
X-Gm-Gg: ASbGnct7U/ukIVxdkIS/GSU14qpiTkMVjbR7/3ayQ/+g4xEdn5J9E+QOCFIwCmn7NR9
	wjy3JiJguNM2WmiSAzZf2A2DUlfnxklSD9A6MRB1/Z+ckcRKkdpiiWC2OCRN1orhmBBAVi2qaGo
	a33V+vxfgSV4He4jsALOV10PjcSgKjd6k0neVjChNNbU2qfZBA0Gi9Ag==
X-Google-Smtp-Source: AGHT+IHYL4/j9tzg1TKZZJWZGJjZ8cGZeF1J3Sn0HnhWsgBtHcAF53FT/BIES0497J4HXcNOkVv/f17SBTVzgwcdel4=
X-Received: by 2002:a2e:9b05:0:b0:30d:626e:d03a with SMTP id
 38308e7fff4ca-30de02f8530mr35374221fa.34.1743503964001; Tue, 01 Apr 2025
 03:39:24 -0700 (PDT)
MIME-Version: 1.0
References: <20250401085659.1222008-1-wenst@chromium.org> <2de0cc68-f3d7-4b9c-86d3-105666963fb7@collabora.com>
 <CAGXv+5Hw+13J6eU6X3EPa+Vr4kmyNH5L83Zj2VLqx=_Z+XtOzw@mail.gmail.com>
In-Reply-To: <CAGXv+5Hw+13J6eU6X3EPa+Vr4kmyNH5L83Zj2VLqx=_Z+XtOzw@mail.gmail.com>
From: Chen-Yu Tsai <wenst@chromium.org>
Date: Tue, 1 Apr 2025 18:39:12 +0800
X-Gm-Features: AQ5f1Jofn6bhSx5kpNoRsfEnci1ZkLDZUqLOYiDj9S7j7E1dOgnZdf4ci23APiY
Message-ID: <CAGXv+5GwbFXo0W3VCkwgouHZTDwqou-i7sQ2zocNchgEYG16fw@mail.gmail.com>
Subject: Re: [PATCH] ASoC: mediatek: re-enable buffer pre-allocation on some platforms
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: Mark Brown <broonie@kernel.org>, Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, 
	Matthias Brugger <matthias.bgg@gmail.com>, linux-sound@vger.kernel.org, 
	linux-mediatek@lists.infradead.org, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org, treapking@chromium.org, yuanhsinte@chromium.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250401_033926_097421_42E67F71 
X-CRM114-Status: GOOD (  31.17  )
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

On Tue, Apr 1, 2025 at 6:38=E2=80=AFPM Chen-Yu Tsai <wenst@chromium.org> wr=
ote:
>
> On Tue, Apr 1, 2025 at 6:12=E2=80=AFPM AngeloGioacchino Del Regno
> <angelogioacchino.delregno@collabora.com> wrote:
> >
> > Il 01/04/25 10:56, Chen-Yu Tsai ha scritto:
> > > In commit 32c9c06adb5b ("ASoC: mediatek: disable buffer pre-allocatio=
n")
> > > buffer pre-allocation was disabled to accommodate newer platforms tha=
t
> > > have a limited reserved memory region for the audio frontend.
> > >
> > > Turns out disabling pre-allocation across the board impacts platforms
> > > that don't have this reserved memory region. Buffer allocation failur=
es
> > > have been observed on MT8173 and MT8183 based Chromebooks under low
> > > memory conditions, which results in no audio playback for the user.
> > >
> > > Reinstate the original policy of pre-allocating audio buffers at prob=
e
> > > time on MT8173, MT8183, and MT8186 platforms. These platforms do not
> > > have reserved memory for the audio frontend.
> > >
> > > Fixes: 32c9c06adb5b ("ASoC: mediatek: disable buffer pre-allocation")
> > > Signed-off-by: Chen-Yu Tsai <wenst@chromium.org>
> >
> > Have you tried to add the reserved memory regions to the MT8173/83/86 A=
FE?
>
> I haven't tried it, though I'm fairly certain that would work as well.
>
> > This means not only devicetree but also the driver - that should be sim=
ple
> > enough, and would allow to eventually add a layer of further commonizat=
ion
> > between the AFE PCM drivers of all those MediaTek SoCs.
>
> I think no driver changes are necessary? It's a single memory region,
> so it would automatically be picked by the driver core for all coherent
> DMA allocations.
>
> I picked the driver route because it restores old behavior.

Also because one setting policy in the device tree, while the other
is in the implementation.

>
> ChenYu
>
> > Cheers,
> > Angelo
> >
> > > ---
> > >   sound/soc/mediatek/common/mtk-afe-platform-driver.c | 4 +++-
> > >   sound/soc/mediatek/common/mtk-base-afe.h            | 1 +
> > >   sound/soc/mediatek/mt8173/mt8173-afe-pcm.c          | 1 +
> > >   sound/soc/mediatek/mt8183/mt8183-afe-pcm.c          | 1 +
> > >   sound/soc/mediatek/mt8186/mt8186-afe-pcm.c          | 1 +
> > >   5 files changed, 7 insertions(+), 1 deletion(-)
> > >
> > > diff --git a/sound/soc/mediatek/common/mtk-afe-platform-driver.c b/so=
und/soc/mediatek/common/mtk-afe-platform-driver.c
> > > index 6b6330583941..70fd05d5ff48 100644
> > > --- a/sound/soc/mediatek/common/mtk-afe-platform-driver.c
> > > +++ b/sound/soc/mediatek/common/mtk-afe-platform-driver.c
> > > @@ -120,7 +120,9 @@ int mtk_afe_pcm_new(struct snd_soc_component *com=
ponent,
> > >       struct mtk_base_afe *afe =3D snd_soc_component_get_drvdata(comp=
onent);
> > >
> > >       size =3D afe->mtk_afe_hardware->buffer_bytes_max;
> > > -     snd_pcm_set_managed_buffer_all(pcm, SNDRV_DMA_TYPE_DEV, afe->de=
v, 0, size);
> > > +     snd_pcm_set_managed_buffer_all(pcm, SNDRV_DMA_TYPE_DEV, afe->de=
v,
> > > +                                    afe->preallocate_buffers ? size =
: 0,
> > > +                                    size);
> > >
> > >       return 0;
> > >   }
> > > diff --git a/sound/soc/mediatek/common/mtk-base-afe.h b/sound/soc/med=
iatek/common/mtk-base-afe.h
> > > index f51578b6c50a..a406f2e3e7a8 100644
> > > --- a/sound/soc/mediatek/common/mtk-base-afe.h
> > > +++ b/sound/soc/mediatek/common/mtk-base-afe.h
> > > @@ -117,6 +117,7 @@ struct mtk_base_afe {
> > >       struct mtk_base_afe_irq *irqs;
> > >       int irqs_size;
> > >       int memif_32bit_supported;
> > > +     bool preallocate_buffers;
> > >
> > >       struct list_head sub_dais;
> > >       struct snd_soc_dai_driver *dai_drivers;
> > > diff --git a/sound/soc/mediatek/mt8173/mt8173-afe-pcm.c b/sound/soc/m=
ediatek/mt8173/mt8173-afe-pcm.c
> > > index 04ed0cfec174..37b20ec80829 100644
> > > --- a/sound/soc/mediatek/mt8173/mt8173-afe-pcm.c
> > > +++ b/sound/soc/mediatek/mt8173/mt8173-afe-pcm.c
> > > @@ -1114,6 +1114,7 @@ static int mt8173_afe_pcm_dev_probe(struct plat=
form_device *pdev)
> > >       afe->mtk_afe_hardware =3D &mt8173_afe_hardware;
> > >       afe->memif_fs =3D mt8173_memif_fs;
> > >       afe->irq_fs =3D mt8173_irq_fs;
> > > +     afe->preallocate_buffers =3D true;
> > >
> > >       platform_set_drvdata(pdev, afe);
> > >
> > > diff --git a/sound/soc/mediatek/mt8183/mt8183-afe-pcm.c b/sound/soc/m=
ediatek/mt8183/mt8183-afe-pcm.c
> > > index d083b4bf0f95..0ef07fb2898d 100644
> > > --- a/sound/soc/mediatek/mt8183/mt8183-afe-pcm.c
> > > +++ b/sound/soc/mediatek/mt8183/mt8183-afe-pcm.c
> > > @@ -1214,6 +1214,7 @@ static int mt8183_afe_pcm_dev_probe(struct plat=
form_device *pdev)
> > >       afe->mtk_afe_hardware =3D &mt8183_afe_hardware;
> > >       afe->memif_fs =3D mt8183_memif_fs;
> > >       afe->irq_fs =3D mt8183_irq_fs;
> > > +     afe->preallocate_buffers =3D true;
> > >
> > >       afe->runtime_resume =3D mt8183_afe_runtime_resume;
> > >       afe->runtime_suspend =3D mt8183_afe_runtime_suspend;
> > > diff --git a/sound/soc/mediatek/mt8186/mt8186-afe-pcm.c b/sound/soc/m=
ediatek/mt8186/mt8186-afe-pcm.c
> > > index db7c93401bee..c588a68d672d 100644
> > > --- a/sound/soc/mediatek/mt8186/mt8186-afe-pcm.c
> > > +++ b/sound/soc/mediatek/mt8186/mt8186-afe-pcm.c
> > > @@ -2935,6 +2935,7 @@ static int mt8186_afe_pcm_dev_probe(struct plat=
form_device *pdev)
> > >       afe->irq_fs =3D mt8186_irq_fs;
> > >       afe->get_dai_fs =3D mt8186_get_dai_fs;
> > >       afe->get_memif_pbuf_size =3D mt8186_get_memif_pbuf_size;
> > > +     afe->preallocate_buffers =3D true;
> > >
> > >       afe->runtime_resume =3D mt8186_afe_runtime_resume;
> > >       afe->runtime_suspend =3D mt8186_afe_runtime_suspend;
> >
> >

