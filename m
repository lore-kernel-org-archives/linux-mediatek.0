Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 26F8FC4332F
	for <linux-mediatek@archiver.kernel.org>; Tue, 31 Oct 2023 06:13:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=CnsBwc25XTCfMAo0+GI5roZ5GuLTSammQf7P8YSq7yM=; b=h/yYYL8vikSk5aUJLe9Eb5OXYZ
	kYqt2IyxvSF/WAjTHV1qYBkEF+L5wgRGTreyRtfR42nBqi9Mxqc/1l0ofW7MGn8/cvF1/D0I67fox
	TBw1BHeMJRN880BWd8qDO09Hiq/UIX6jCgoA6AZuVpMJKJHlaJeaRNYbHrEpd5ydrCZ3cdxAXZz0i
	FD4JI7gd8TKCu4gkKdqNt9fwtxn4orrNkcTNUVHk7SEhzEm1mHAl8GjGYaIp7CPhQzaN39IKrEGf7
	z1VNuXq+RXHg6Y1ueKTcveppHrlw1Dd4wqW/4Ue8MbPW3ihDHwPz4li8czL5t6q8uBHRuxdT65S5c
	t78Jh+Zg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qxi0G-004c1H-05;
	Tue, 31 Oct 2023 06:13:28 +0000
Received: from mail-oi1-x22f.google.com ([2607:f8b0:4864:20::22f])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qxi0D-004c0F-0z;
	Tue, 31 Oct 2023 06:13:26 +0000
Received: by mail-oi1-x22f.google.com with SMTP id 5614622812f47-3b2ea7cc821so3650366b6e.1;
        Mon, 30 Oct 2023 23:13:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1698732803; x=1699337603; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=CnsBwc25XTCfMAo0+GI5roZ5GuLTSammQf7P8YSq7yM=;
        b=IqbavvF3HBHz42nx6+oYpf9oox71HuSUAGQNGGXLabquDwf4+bw00U42Oioh2SkRum
         iOLsrvV6kcish6B+fY97f0+Osd9s8bZSPCPktqqXuFWP11MreBi3WPGfEvKLgo68l0c2
         oBxRM/UhJPmtbvePXMU8tHC2JJFet17HDJ6exZ7rhjdeLAWbHO9zKd3D5ht3o5q01Mrg
         YsSt3adUIh1cAvncb43NJwYxDq53Wu6l9aiyVwccBpRgHdp/1mMnNE2Ct731I5L5eqJ0
         FEbvEgwRzv4HVCDg1TDJV97kL21lxswLEvPr1uaHlv8NpSvDPVy2KgpTeshKZZvwnm14
         9gPg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1698732803; x=1699337603;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=CnsBwc25XTCfMAo0+GI5roZ5GuLTSammQf7P8YSq7yM=;
        b=RzYu9UWtCry9+yU18u8Y5QdkeCYAoiYZ7quEz9/bXUFgyUeaX4GYORp3vtmaVhg4uA
         NOebqJIQBRzVgZN5nrLtf8aLjCc820ImUuWgLz9bAg88MQRsoNjfYAJjG79P6igCT6E4
         s+ygKB+WcEUsBmGtWR7fTxe9EmysFQ7PYqy4y2i2dRM953Pd3Q/7fXE9SA4le2kO7hOp
         HiXXl+9rBDiX0vJyerjn+DnwzuoyN7SxdJulC7U9wdtF+jh0b5QS64NZGMrW4hmzNVQK
         mV0DgKR0bDdvA2CcU4xovMtn5mjxuhz7Tfd6zvjITy8IJHjRmmJW9EixQuALnElsHsm4
         wlDw==
X-Gm-Message-State: AOJu0YxtsYm5jfyvipZLOT3K6C6mQSJF5ClhjFtzSl6cr7/rgF9+vMrQ
	O5ldxuFeQwTB5HWHFiVjr6etafanr6uwN20g8vE=
X-Google-Smtp-Source: AGHT+IGrBfSiOw0QxtPs9SYLozH9F2oFeT55K/phAH35aMIB94/vCdunurZiNZtPmzlnc4j34JJOR+ygl9/qPDF1z/E=
X-Received: by 2002:a05:6808:646:b0:3b2:d8c8:7bfa with SMTP id
 z6-20020a056808064600b003b2d8c87bfamr13000899oih.8.1698732803133; Mon, 30 Oct
 2023 23:13:23 -0700 (PDT)
MIME-Version: 1.0
References: <20231027091612.38896-1-zyytlz.wz@163.com> <b9407b5d-3dba-3e7d-139b-075728b8346c@collabora.com>
In-Reply-To: <b9407b5d-3dba-3e7d-139b-075728b8346c@collabora.com>
From: Zheng Hacker <hackerzheng666@gmail.com>
Date: Tue, 31 Oct 2023 14:13:12 +0800
Message-ID: <CAJedcCz3CwJ8meXmv-1tgOHZ-6zHAmSwX7sPO1X9oyKv=oPyNQ@mail.gmail.com>
Subject: Re: [PATCH 0/2] media: mtk-jpeg: Remove cancel worker in
 mtk_jpeg_remove to avoid the crash of multi-core JPEG devices
To: Dmitry Osipenko <dmitry.osipenko@collabora.com>
Cc: Zheng Wang <zyytlz.wz@163.com>, Kyrie.Wu@mediatek.com, bin.liu@mediatek.com, 
	mchehab@kernel.org, matthias.bgg@gmail.com, 
	angelogioacchino.delregno@collabora.com, linux-media@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-mediatek@lists.infradead.org, Irui.Wang@mediatek.com, 
	security@kernel.org, 1395428693sheep@gmail.com, alex000young@gmail.com, 
	amergnat@baylibre.com, wenst@chromium.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231030_231325_349435_A9436592 
X-CRM114-Status: GOOD (  19.56  )
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

Dmitry Osipenko <dmitry.osipenko@collabora.com> =E4=BA=8E2023=E5=B9=B410=E6=
=9C=8831=E6=97=A5=E5=91=A8=E4=BA=8C 13:49=E5=86=99=E9=81=93=EF=BC=9A
>
> On 10/27/23 12:16, Zheng Wang wrote:
> > This patch reverts commit c677d7ae8314
> > ("media: mtk-jpeg: Fix use after free bug due to uncanceled work").
> > The job_timeout_work is initialized only for
> > the single-core JPEG device so it will cause the crash for multi-core
> > JPEG devices.
> >
> > Fix it by removing the cancel_delayed_work_sync function.
> >
> > Fixes: c677d7ae8314 ("media: mtk-jpeg: Fix use after free bug due to un=
canceled work")
> > Signed-off-by: Zheng Wang <zyytlz.wz@163.com>
> > Signed-off-by: Dmitry Osipenko <dmitry.osipenko@collabora.com>
> > ---
> >  drivers/media/platform/mediatek/jpeg/mtk_jpeg_core.c | 1 -
> >  1 file changed, 1 deletion(-)
> >
> > diff --git a/drivers/media/platform/mediatek/jpeg/mtk_jpeg_core.c b/dri=
vers/media/platform/mediatek/jpeg/mtk_jpeg_core.c
> > index 7194f88edc0f..60425c99a2b8 100644
> > --- a/drivers/media/platform/mediatek/jpeg/mtk_jpeg_core.c
> > +++ b/drivers/media/platform/mediatek/jpeg/mtk_jpeg_core.c
> > @@ -1403,7 +1403,6 @@ static void mtk_jpeg_remove(struct platform_devic=
e *pdev)
> >  {
> >       struct mtk_jpeg_dev *jpeg =3D platform_get_drvdata(pdev);
> >
> > -     cancel_delayed_work_sync(&jpeg->job_timeout_work);
> >       pm_runtime_disable(&pdev->dev);
> >       video_unregister_device(jpeg->vdev);
> >       v4l2_m2m_release(jpeg->m2m_dev);
>
> Please send all three patches as a single series and version it with v2.
> Add cover letter with changelog.
>
> # git format-patch --cover-letter -v2 -3
>

Thanks for your kind reminder. Will do right now.

Best regards,
Zheng Wang

> --
> Best regards,
> Dmitry
>

