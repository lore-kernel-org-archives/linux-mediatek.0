Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 826A1C0015E
	for <linux-mediatek@archiver.kernel.org>; Thu, 20 Jul 2023 03:17:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=mf/NJQ+u428p5uEFrwZXkvKS5alcwGdh9zkPDo+6gjU=; b=0QkQx0qVsruPFFk/is/6N/8B7n
	Afc+xBSTqP87Prh32cE61Jtfbq8vNpUFo4ej4woCeYllAfk4vqhP5t44qNTdoEfN4VABxeolexqCV
	ah+5vEfakANLLxWCOq/AE/qIUFADKCUT8Bd9TkyOMd6t1dU6lPHXnGGTMX4g23bLMxNpozQeEhtL6
	xz8au/uAvlodaPUR9P7sXmifI3dP6ze/05agnbYm9UXZim43WtbnNqorQ9RolGEqKI61bdn+Jsedu
	FWLX8tlb+CTzZe5kqiYMzS8wsm8u6bmtK1ywGiQvUcBnJ5yswOzC2gQuYGUByFSVswzjr2Esm/VsH
	24EMUpWA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qMKAS-009dQa-2x;
	Thu, 20 Jul 2023 03:17:28 +0000
Received: from mail-pg1-x531.google.com ([2607:f8b0:4864:20::531])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qMKAP-009dOe-0w;
	Thu, 20 Jul 2023 03:17:26 +0000
Received: by mail-pg1-x531.google.com with SMTP id 41be03b00d2f7-55fcc15e109so141802a12.3;
        Wed, 19 Jul 2023 20:17:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1689823043; x=1690427843;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=mf/NJQ+u428p5uEFrwZXkvKS5alcwGdh9zkPDo+6gjU=;
        b=mqZbMeUgbHTig981lvv2u/s487KbPpUNB1KQa3TQocGeyoiDB13btddiwbEBXZf9hw
         Ht39uqtw1zYecYIWdzW5wOG2oeseSRZ0h1XN1WsmXk5OOE7WT/LwLyNqgDeNdwiC56JC
         Yp3ihZfZDwVeeFy7amrwhPZm9hIVZZ2ZQ8qbtfM5sYL8QfZxhM447JSBDeFczRCMzNK/
         uhv5ZOElbuymi6mS/PWoS1mtfsXdZlUePBjf8GGcoIk7fTGZR3gek4gbgAC8aV12SzZt
         jSpmX/FRqfQygKoB50a/IoGkSYcyR8bkt1yVpOOpeHhfHvtJSHNMd7tOO84mSqhrDmoU
         fchg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1689823043; x=1690427843;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=mf/NJQ+u428p5uEFrwZXkvKS5alcwGdh9zkPDo+6gjU=;
        b=CA1Lf5ebkwMwVGTJGY+JhoyvC7+PxkY9++lOdOsOh40FWUIES7Gy0TT/oBus4z4KSY
         YQAUCRusFXyIzQ28BOgiG9SuoHFOhWadqxaMq4uA4HomMKg2GTuGFWYgMwWdzmO+7hAm
         EVzrETPB23mZKqEA3YxNNuVcQCVrtj/gRlGYqYPWDvLJQxoHssddkBkESqoUGelaSNk3
         srkzkjHpYQwDBNwieDvxbEIp4PiUgqtgHTwJItXYcuBri0iZLX7krXlNzAFzyIEbQ7bd
         21ak5P5sId4ljs2bP0OjXKNUVkoDnRSAvpZ5UUEAZJLL8cpA3JSqI7NiMGrJSAem4FKl
         QNzw==
X-Gm-Message-State: ABy/qLYjU9ORoin7FuBt0OZYYe+f31xgcF77WLqcmGoK5ofDzO3zvOgJ
	NyeMeFxHVxLX7cR9Gj0VJgZSpej8n0ec1ZimTGI=
X-Google-Smtp-Source: APBJJlEnomW/hvUCj8J28dUJrCNM46A+qa33E74KWzq4Qd2g8zGu1aEvU4zorYv8Gm51p2xGZgTGdl0cuI9m2CPmYQM=
X-Received: by 2002:a17:90a:6907:b0:263:f5f8:beed with SMTP id
 r7-20020a17090a690700b00263f5f8beedmr3024049pjj.19.1689823043095; Wed, 19 Jul
 2023 20:17:23 -0700 (PDT)
MIME-Version: 1.0
References: <20230707092414.866760-1-zyytlz.wz@163.com> <538096d2-7b24-e1c7-706d-4d4f952d35eb@baylibre.com>
 <CAJedcCzR6DzX_aG1KBgrMHDJ1xh=RTA-FrZ+TJ_4KawWpHyYuA@mail.gmail.com>
 <CAJedcCyKv-hdDhWcogDZrC-kY6qtO-H1fDYqjTXMJvCR19MxYg@mail.gmail.com> <55c336a4-b268-d2d3-47f3-213300e4e623@baylibre.com>
In-Reply-To: <55c336a4-b268-d2d3-47f3-213300e4e623@baylibre.com>
From: Zheng Hacker <hackerzheng666@gmail.com>
Date: Thu, 20 Jul 2023 11:17:10 +0800
Message-ID: <CAJedcCw_gLkkAYCDF3NuGqXz7A3CVR2sfcRvW=AhnWQy9Bnvew@mail.gmail.com>
Subject: Re: [RESEND PATCH v2] media: mtk-jpeg: Fix use after free bug due to
 uncanceled work
To: Alexandre Mergnat <amergnat@baylibre.com>
Cc: Zheng Wang <zyytlz.wz@163.com>, Kyrie.Wu@mediatek.com, bin.liu@mediatek.com, 
	mchehab@kernel.org, matthias.bgg@gmail.com, 
	angelogioacchino.delregno@collabora.com, linux-media@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-mediatek@lists.infradead.org, Irui.Wang@mediatek.com, 
	security@kernel.org, 1395428693sheep@gmail.com, alex000young@gmail.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230719_201725_337024_27E7D87D 
X-CRM114-Status: GOOD (  17.16  )
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

Thanks dor your kind reply. I'll try to connect them later.

Best regards,
Zheng

Alexandre Mergnat <amergnat@baylibre.com> =E4=BA=8E2023=E5=B9=B47=E6=9C=881=
9=E6=97=A5=E5=91=A8=E4=B8=89 18:17=E5=86=99=E9=81=93=EF=BC=9A
>
>
>
> On 18/07/2023 05:07, Zheng Hacker wrote:
> > Friendly ping
> >
> > Zheng Hacker <hackerzheng666@gmail.com> =E4=BA=8E2023=E5=B9=B47=E6=9C=
=8816=E6=97=A5=E5=91=A8=E6=97=A5 00:08=E5=86=99=E9=81=93=EF=BC=9A
> >>
> >> Hi,
> >>
> >> This issue has not been resolved for a long time. Is there anyone who =
can help?
> >>
> >> Best regards,
> >> Zheng
> >>
> >> Alexandre Mergnat <amergnat@baylibre.com> =E4=BA=8E2023=E5=B9=B47=E6=
=9C=887=E6=97=A5=E5=91=A8=E4=BA=94 22:11=E5=86=99=E9=81=93=EF=BC=9A
> >>>
> >>>
> >>>
> >>> On 07/07/2023 11:24, Zheng Wang wrote:
> >>>> In mtk_jpeg_probe, &jpeg->job_timeout_work is bound with
> >>>> mtk_jpeg_job_timeout_work. Then mtk_jpeg_dec_device_run
> >>>> and mtk_jpeg_enc_device_run may be called to start the
> >>>> work.
> >>>> If we remove the module which will call mtk_jpeg_remove
> >>>> to make cleanup, there may be a unfinished work. The
> >>>> possible sequence is as follows, which will cause a
> >>>> typical UAF bug.
> >>>>
> >>>> Fix it by canceling the work before cleanup in the mtk_jpeg_remove
> >>>>
> >>>> CPU0                  CPU1
> >>>>
> >>>>                       |mtk_jpeg_job_timeout_work
> >>>> mtk_jpeg_remove     |
> >>>>     v4l2_m2m_release  |
> >>>>       kfree(m2m_dev); |
> >>>>                       |
> >>>>                       | v4l2_m2m_get_curr_priv
> >>>>                       |   m2m_dev->curr_ctx //use
> >>>
> >>> Reviewed-by: Alexandre Mergnat <amergnat@baylibre.com>
> >>>
> >>> --
> >>> Regards,
> >>> Alexandre
>
> Hi Zheng,
>
> If you asking me to merge patch, sorry but I can't, I'm just a reviewer.
> I invite you to ping the maintainers directly:
>
> Bin Liu <bin.liu@mediatek.com> (supporter:MEDIATEK JPEG DRIVER)
> Mauro Carvalho Chehab <mchehab@kernel.org> (maintainer:MEDIA INPUT
> INFRASTRUCTURE (V4L/DVB))
> Matthias Brugger <matthias.bgg@gmail.com> (maintainer:ARM/Mediatek SoC
> support)
>
> Otherwise, I misunderstood what you asking me. If so, can you rephrase
> your question please?
>
> --
> Regards,
> Alexandre

