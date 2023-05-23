Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E4487C7EE26
	for <linux-mediatek@archiver.kernel.org>; Tue, 23 May 2023 15:18:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=kjyn+WTl4LbVMkNNCokMveD7xNAakP9qnkKqL3vwETo=; b=ggWQhfR5mNvUIf8i1OViM7ZJi7
	2lkeAOhmm1d4bPddmJpm0C3MBCUTYTBqKmRy7oADLtJ2xDdysYF7zbyAoyVTu1wmLULGMqAugHD5c
	Ql0Kh03ss5gX+xq6fWVcvs+Re1sqhHEof+bbz5yojWspf6FlzT0pJWET31bB43xaf3mV5BHFH59NP
	qjqWlvM5Z5b4LO2jA1GVwLN6OGAn69sGSSzjp8Ek6R1YZ2/XqES0Dcb9sZNxyS6M4034zoOJJT36S
	Ww32/NwzU0FiYTP7LQfqUR+5mHubkCvQbBXFoWQPh3Xr2KU6ADo2nDBgOzn3h+zkjyP8j2evoORdu
	ZAgn7SAQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1q1Tmn-00Ac9e-3C;
	Tue, 23 May 2023 15:18:53 +0000
Received: from mail-io1-xd36.google.com ([2607:f8b0:4864:20::d36])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1q1Tml-00Ac7k-26
	for linux-mediatek@lists.infradead.org;
	Tue, 23 May 2023 15:18:53 +0000
Received: by mail-io1-xd36.google.com with SMTP id ca18e2360f4ac-76fe43b85e4so345228739f.1
        for <linux-mediatek@lists.infradead.org>; Tue, 23 May 2023 08:18:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1684855128; x=1687447128;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=kjyn+WTl4LbVMkNNCokMveD7xNAakP9qnkKqL3vwETo=;
        b=DvPI8gg5hq1vkC+t7ecoxjYXYOwjdo1b5OHHOMFEmQPq2gaQdw9jvvEYMWz1Lmd8uh
         LaEo2pdjq5di13xvQ3PpP/aXcRrVUgiRzAgzdU+22cE8vmY5YTSmAi4+h8uWo0Qsd2Sq
         MGz0CgN1AQrG5u7daIXmDLyG3TJUCSgExx72k=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1684855128; x=1687447128;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=kjyn+WTl4LbVMkNNCokMveD7xNAakP9qnkKqL3vwETo=;
        b=PwGrWuJjvr4Bp110f19gC6gdlxznsTleYOasLbuhakeo4NMXuaiLI07XksL8JO/GDx
         Z8VvBJDamEJNqIsEcvN5N6GuMsAcfUJuToWc0daimOQf1ZQSd/0c0W0wO1PevQF+JiIz
         NOSL21WTQC7SGGDapPyUvDGcKuEXkXrseYuPiIBzjiChHzHOKG7r4d4tbaf7MBSjsMF5
         r1cEfH8ZkSrCFOTmR4auT1RPuxg9PunXAKSqBy9/JYkW4EZP9rnufAcm3D31G1vBUU7u
         BwZ5tgXd7fidveXktZ5TJY+GwCBOqc25CqdgDi6AWQcybzZBbV+HlvAS4XeKLf5M462N
         iMGA==
X-Gm-Message-State: AC+VfDxWGb3Zxuo/Ow3Ks2z11dysHUqOmF2xq4mjxENvWgmqpGiCnQj9
	khCC4W3h3uWu3PJE4FldgTCXIrGgNjl68uaRFtc=
X-Google-Smtp-Source: ACHHUZ6Qilgdoys4pYF4Z1kSiI9sFVRZVZr/yW7zBn0xwP+JFa5FTficOtbg9Rji1EabeT0fSeqsIg==
X-Received: by 2002:a5d:83d8:0:b0:76f:1664:672 with SMTP id u24-20020a5d83d8000000b0076f16640672mr8703522ior.13.1684855128331;
        Tue, 23 May 2023 08:18:48 -0700 (PDT)
Received: from mail-io1-f52.google.com (mail-io1-f52.google.com. [209.85.166.52])
        by smtp.gmail.com with ESMTPSA id z62-20020a0293c4000000b00411b4acc990sm2508135jah.7.2023.05.23.08.18.46
        for <linux-mediatek@lists.infradead.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 23 May 2023 08:18:47 -0700 (PDT)
Received: by mail-io1-f52.google.com with SMTP id ca18e2360f4ac-76fe43b85e4so345225039f.1
        for <linux-mediatek@lists.infradead.org>; Tue, 23 May 2023 08:18:46 -0700 (PDT)
X-Received: by 2002:a5d:9942:0:b0:76c:62ab:5d96 with SMTP id
 v2-20020a5d9942000000b0076c62ab5d96mr11928374ios.19.1684855126148; Tue, 23
 May 2023 08:18:46 -0700 (PDT)
MIME-Version: 1.0
References: <20230515141610.v2.1.I0d1657be3fea5870f797e975a7aa490291e17993@changeid>
 <b5799dfe-f17b-a838-0916-645ba83307d2@xs4all.nl> <2f1bf798-49c3-13d7-96e5-b29e7df73bd1@xs4all.nl>
In-Reply-To: <2f1bf798-49c3-13d7-96e5-b29e7df73bd1@xs4all.nl>
From: Fei Shao <fshao@chromium.org>
Date: Tue, 23 May 2023 23:18:10 +0800
X-Gmail-Original-Message-ID: <CAC=S1ngKqJfTh8Dnjv2yYLG0r44Yx6pw5DsRnArsJu2okoKJUA@mail.gmail.com>
Message-ID: <CAC=S1ngKqJfTh8Dnjv2yYLG0r44Yx6pw5DsRnArsJu2okoKJUA@mail.gmail.com>
Subject: Re: [PATCH v2] media: mediatek: vcodec: mtk_vcodec_dec_hw: Use devm_pm_runtime_enable()
To: Hans Verkuil <hverkuil-cisco@xs4all.nl>, fshao@chromium.org
Cc: =?UTF-8?Q?Uwe_Kleine=2DK=C3=B6nig?= <u.kleine-koenig@pengutronix.de>, 
	Chen-Yu Tsai <wenst@chromium.org>, Andrew-CT Chen <andrew-ct.chen@mediatek.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
	Matthias Brugger <matthias.bgg@gmail.com>, Mauro Carvalho Chehab <mchehab@kernel.org>, 
	Tiffany Lin <tiffany.lin@mediatek.com>, Yunfei Dong <yunfei.dong@mediatek.com>, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	linux-media@vger.kernel.org, linux-mediatek@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230523_081851_689298_FD05A038 
X-CRM114-Status: GOOD (  24.46  )
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

On Tue, May 23, 2023 at 8:28=E2=80=AFPM Hans Verkuil <hverkuil-cisco@xs4all=
.nl> wrote:
>
> On 23/05/2023 13:42, Hans Verkuil wrote:
> > On 15/05/2023 08:16, Fei Shao wrote:
> >> Convert pm_runtime_enable() to the managed version, and clean up error
> >> handling and unnecessary .remove() callback accordingly.
> >
> > This patch no longer applies. Can you make a v3?
>
> Sorry, you can ignore this. I now realize that this was a v2 of
>
> https://patchwork.linuxtv.org/project/linux-media/patch/20230510233117.1.=
I7047714f92ef7569bd21f118ae6aee20b3175a92@changeid/
>
> I had that v1 applied, so obviously this v2 would fail to apply. After dr=
opping
> that v1 patch it now applies cleanly.

Ack, many thanks.
BTW, besides the review tags (appreciation to all), would you mind
adding this tag also as I missed it in the beginning?

Suggested-by: Chen-Yu Tsai <wenst@chromium.org>

Regards,
Fei





>
> Regards,
>
>         Hans
>
> >
> > Regards,
> >
> >       Hans
> >
> >>
> >> Signed-off-by: Fei Shao <fshao@chromium.org>
> >>
> >> ---
> >>
> >> Changes in v2:
> >> Use devm_pm_runtime_enable() per suggestion from the previous thread:
> >> https://lore.kernel.org/lkml/20230510164330.z2ygkl7vws6fci75@pengutron=
ix.de/T/#m25be91afe3e9554600e859a8a59128ca234fc63d
> >>
> >>  .../mediatek/vcodec/mtk_vcodec_dec_hw.c       | 26 ++++++------------=
-
> >>  1 file changed, 8 insertions(+), 18 deletions(-)
> >>
> >> diff --git a/drivers/media/platform/mediatek/vcodec/mtk_vcodec_dec_hw.=
c b/drivers/media/platform/mediatek/vcodec/mtk_vcodec_dec_hw.c
> >> index b753bf54ebd9..e1cb2f8dca33 100644
> >> --- a/drivers/media/platform/mediatek/vcodec/mtk_vcodec_dec_hw.c
> >> +++ b/drivers/media/platform/mediatek/vcodec/mtk_vcodec_dec_hw.c
> >> @@ -148,20 +148,21 @@ static int mtk_vdec_hw_probe(struct platform_dev=
ice *pdev)
> >>      ret =3D mtk_vcodec_init_dec_clk(pdev, &subdev_dev->pm);
> >>      if (ret)
> >>              return ret;
> >> -    pm_runtime_enable(&pdev->dev);
> >> +
> >> +    ret =3D devm_pm_runtime_enable(&pdev->dev);
> >> +    if (ret)
> >> +            return ret;
> >>
> >>      of_id =3D of_match_device(mtk_vdec_hw_match, dev);
> >>      if (!of_id) {
> >>              dev_err(dev, "Can't get vdec subdev id.\n");
> >> -            ret =3D -EINVAL;
> >> -            goto err;
> >> +            return -EINVAL;
> >>      }
> >>
> >>      hw_idx =3D (enum mtk_vdec_hw_id)(uintptr_t)of_id->data;
> >>      if (hw_idx >=3D MTK_VDEC_HW_MAX) {
> >>              dev_err(dev, "Hardware index %d not correct.\n", hw_idx);
> >> -            ret =3D -EINVAL;
> >> -            goto err;
> >> +            return -EINVAL;
> >>      }
> >>
> >>      main_dev->subdev_dev[hw_idx] =3D subdev_dev;
> >> @@ -173,36 +174,25 @@ static int mtk_vdec_hw_probe(struct platform_dev=
ice *pdev)
> >>      if (IS_SUPPORT_VDEC_HW_IRQ(hw_idx)) {
> >>              ret =3D mtk_vdec_hw_init_irq(subdev_dev);
> >>              if (ret)
> >> -                    goto err;
> >> +                    return ret;
> >>      }
> >>
> >>      subdev_dev->reg_base[VDEC_HW_MISC] =3D
> >>              devm_platform_ioremap_resource(pdev, 0);
> >>      if (IS_ERR((__force void *)subdev_dev->reg_base[VDEC_HW_MISC])) {
> >>              ret =3D PTR_ERR((__force void *)subdev_dev->reg_base[VDEC=
_HW_MISC]);
> >> -            goto err;
> >> +            return ret;
> >>      }
> >>
> >>      if (!main_dev->subdev_prob_done)
> >>              main_dev->subdev_prob_done =3D mtk_vdec_hw_prob_done;
> >>
> >>      platform_set_drvdata(pdev, subdev_dev);
> >> -    return 0;
> >> -err:
> >> -    pm_runtime_disable(subdev_dev->pm.dev);
> >> -    return ret;
> >> -}
> >> -
> >> -static int mtk_vdec_hw_remove(struct platform_device *pdev)
> >> -{
> >> -    pm_runtime_disable(&pdev->dev);
> >> -
> >>      return 0;
> >>  }
> >>
> >>  static struct platform_driver mtk_vdec_driver =3D {
> >>      .probe  =3D mtk_vdec_hw_probe,
> >> -    .remove =3D mtk_vdec_hw_remove,
> >>      .driver =3D {
> >>              .name   =3D "mtk-vdec-comp",
> >>              .of_match_table =3D mtk_vdec_hw_match,
> >
>

