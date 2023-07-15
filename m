Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BDDFBC001DC
	for <linux-mediatek@archiver.kernel.org>; Sat, 15 Jul 2023 16:08:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Wj4Cy8RQ6W/zc3QPSV8hmPb4p0rBodU5v6Z12U3dgao=; b=QUfmtJyP6ZsYHBmDCv+w/eF/O0
	tvqnrpk727wKjatFVNoO1p+mx698W3ATQRJFRz4tzBJAWUuL/Ny3pIrVrPhxMtgo9w8q8h2t79rZA
	ebWuhdPZVzhcyvrdvmQifpRBrZ3auZfi7MW6b717IbpfDOpmX8mu2+jZk+3cPDKQsGxFG7jZrCmNc
	DBVon1BS5D/fVHr9bH0U/FTGbSyxbu2OrdlojX3/xgflqxeNju2Y141zrURoBAyZ9jssdvTfqV33W
	DhE0cxk39+oxEhZ19t9ChhRMXFqYBMNKSkak/8gmLimdv/Z8MnYl2xuUbdZFnjPAA6/VFxudpKWBe
	F5F7Rszw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qKhpC-0095aE-1m;
	Sat, 15 Jul 2023 16:08:50 +0000
Received: from mail-pl1-x629.google.com ([2607:f8b0:4864:20::629])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qKhp9-0095Z2-04;
	Sat, 15 Jul 2023 16:08:48 +0000
Received: by mail-pl1-x629.google.com with SMTP id d9443c01a7336-1b852785a65so18795285ad.0;
        Sat, 15 Jul 2023 09:08:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1689437325; x=1692029325;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Wj4Cy8RQ6W/zc3QPSV8hmPb4p0rBodU5v6Z12U3dgao=;
        b=f1Yoji6Lk7hLFrGWvVHMB99I94iqNPLf53nN99C+Euf1eko0lDj6+rwlqw+Dgk8UQQ
         SRpsuRlsVNHD4H3CtBAY6OqSPEqSJZUwFP+cS9hB5oGMHDh1EVrIAUWdGU5BH6VhjFBW
         /z1yHF+21yYGgNq9TAwrNx1v4HfpVczxiW79BGFcmf51YVbRm8YkB2rC0PG8Wz14mMZc
         0CZz2ejtvs3mc6jFez6MjOZAENbTvA1WktKizZDkR7JMqJrAQbPdsIohUFetUtXw+PaF
         KQoa95Jtgb3QO1zhPcZxPZtw2Jc8U8JccvLv74fIUQ1k70FctgFVnPIiuRT5Ui6YXY5w
         ivhA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1689437325; x=1692029325;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Wj4Cy8RQ6W/zc3QPSV8hmPb4p0rBodU5v6Z12U3dgao=;
        b=BSNAUEo7t2ebdiwTx1zPqwD5Y7duKr4hI/6cDHqtu7fahP4KkTF0XrL0mMX3bqeUsa
         P11reK6A1r4CMo6ZCQ59zsM0CHU2SNax6DeQHtQoQXjLT6hhGbl1RFonQpgiazOz9xrc
         pP8lnP7hy02JaYHdeACQW1zY++4jsIU0YHqbc2aGugLvG/ERpxioWp9tgefa50UXixTC
         emqJNmUSvPnqY7punAWWTK+kjMnSK6t/CTXIOWz0SQEM2jlTr+lMksQvGU0HOTKMNXUz
         UGi+TaXrmsAzGfC7aB7Uy8WCeDfhjO9oaAKtvNx8nFrkTNBiFWfiMdXaZC3gwzvmLKOp
         0PFA==
X-Gm-Message-State: ABy/qLYt9fbw+wm91BnHjqYSHP0E7HM0b+D17KwxR9H44zv0wgtWfQTM
	Bdv0JM6Yw76rDVmM2jZPG2ETuWrfA+P/NBI8NCc=
X-Google-Smtp-Source: APBJJlG9cTRO0B/J58Dk72R+ek7gW9xZzMEOglyV1YUlimrJNp3sZdyPb2I4AXwzW/e0UeBY9xyjV4b1/NXsL7lhrN0=
X-Received: by 2002:a17:902:dac7:b0:1b6:b703:36f8 with SMTP id
 q7-20020a170902dac700b001b6b70336f8mr8179654plx.25.1689437325128; Sat, 15 Jul
 2023 09:08:45 -0700 (PDT)
MIME-Version: 1.0
References: <20230707092414.866760-1-zyytlz.wz@163.com> <538096d2-7b24-e1c7-706d-4d4f952d35eb@baylibre.com>
In-Reply-To: <538096d2-7b24-e1c7-706d-4d4f952d35eb@baylibre.com>
From: Zheng Hacker <hackerzheng666@gmail.com>
Date: Sun, 16 Jul 2023 00:08:33 +0800
Message-ID: <CAJedcCzR6DzX_aG1KBgrMHDJ1xh=RTA-FrZ+TJ_4KawWpHyYuA@mail.gmail.com>
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
X-CRM114-CacheID: sfid-20230715_090847_058608_023FEE13 
X-CRM114-Status: GOOD (  13.10  )
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

Hi,

This issue has not been resolved for a long time. Is there anyone who can h=
elp?

Best regards,
Zheng

Alexandre Mergnat <amergnat@baylibre.com> =E4=BA=8E2023=E5=B9=B47=E6=9C=887=
=E6=97=A5=E5=91=A8=E4=BA=94 22:11=E5=86=99=E9=81=93=EF=BC=9A
>
>
>
> On 07/07/2023 11:24, Zheng Wang wrote:
> > In mtk_jpeg_probe, &jpeg->job_timeout_work is bound with
> > mtk_jpeg_job_timeout_work. Then mtk_jpeg_dec_device_run
> > and mtk_jpeg_enc_device_run may be called to start the
> > work.
> > If we remove the module which will call mtk_jpeg_remove
> > to make cleanup, there may be a unfinished work. The
> > possible sequence is as follows, which will cause a
> > typical UAF bug.
> >
> > Fix it by canceling the work before cleanup in the mtk_jpeg_remove
> >
> > CPU0                  CPU1
> >
> >                      |mtk_jpeg_job_timeout_work
> > mtk_jpeg_remove     |
> >    v4l2_m2m_release  |
> >      kfree(m2m_dev); |
> >                      |
> >                      | v4l2_m2m_get_curr_priv
> >                      |   m2m_dev->curr_ctx //use
>
> Reviewed-by: Alexandre Mergnat <amergnat@baylibre.com>
>
> --
> Regards,
> Alexandre

