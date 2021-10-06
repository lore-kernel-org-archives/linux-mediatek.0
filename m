Return-Path: <SRS0=2J9p=O2=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 69758C433EF
	for <linux-mediatek@archiver.kernel.org>; Wed,  6 Oct 2021 00:58:14 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 2C08E6120F
	for <linux-mediatek@archiver.kernel.org>; Wed,  6 Oct 2021 00:58:14 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 2C08E6120F
Authentication-Results: mail.kernel.org; dmarc=fail (p=reject dis=none) header.from=google.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=f31zvqe4zyJXdMa0BH+fy19kbYw0+vu54ynMVToQV5c=; b=zkmUXCWUay5C2k
	Z5A9M+Wp+kvPxWqBT5lJ3w79T9UdjLhVmuMccH7wsmyEuddhSgnIfU1o+iQhRbH5nIA/Z+M/lmpev
	7uuZwPEr91rKUzx/oD7H8PKWtaMF6VZsNVjJLfIwl7E9TtDz59lhgxn4bgyMYohqenEs57J0MgJxG
	H6JRHMc6ZV6py1NdXFHu6OV1g9qKaJSJp5P1LpBecWLR5a3Svj0koibqOlZsq0/eFwgdvekzxIqFw
	ebOACHjfh+DCZtCWPNrkf0gLupAOfHROSKBnM+9ESRxPfA1lflbHIal7M9s6/6zrHfq4L5sZTur09
	1cu9MeRtwLcfXZbehh3w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mXvFt-00CT1H-7q; Wed, 06 Oct 2021 00:57:57 +0000
Received: from mail-ed1-x52c.google.com ([2a00:1450:4864:20::52c])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mXvFg-00CSqk-Db
 for linux-mediatek@lists.infradead.org; Wed, 06 Oct 2021 00:57:46 +0000
Received: by mail-ed1-x52c.google.com with SMTP id z1so3266484edb.8
 for <linux-mediatek@lists.infradead.org>; Tue, 05 Oct 2021 17:57:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=BnBbGM64QgB5WqzcyJW08etbln6pWC86wmdrU2FWwHk=;
 b=jq9S2dgjGpgRQfijmZdn0qh5bgVlzqhVZ9YJBI764wnh/E12jtFJ2PsOoeyo0oFIyR
 LHqk+MI1VVu0h7KDAtA59I+nITfVc00AJyvynBMYhqzLZPw8Z02I5zuWJYeR7q6wIY5m
 nVLO32I2DZyl62N73IIk6XUHS83X+YlV5v9UmFKEdkFPoLzMgIOeapoVNbikwiZvL9Nm
 7bouOO6ZWYcMco3gu5muzmHlkOplwpYfX6brhibL4DWUBQhYp9W8xo2qbYmUPsHRheHI
 C3/TYxsC/tAiN6v2C3ZoIDig7SBYEXbUQCFf+qwQ+d43Au5j5mqebfmMslkcGzj+/lbU
 u8bQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=BnBbGM64QgB5WqzcyJW08etbln6pWC86wmdrU2FWwHk=;
 b=s/lHOJjWxOPW0FsVKHRAsUV7gtt5fe0Wz0k354Shu+PJM41ny0WeukwUkZ297Z7cTj
 ZwbasFKuwV13mVfzsbkXRKc5odRK3Fy0WME0hC+PSmcf795zAIzUYq29qVQJOX20MzFM
 37YuO5dQGRoIJBWej+OUtgry7yj+gulJqbQJ//aYu4l0bj6cKOzoOX5srDpU8tEbsPtM
 MPmErkoSipOEZS/GbC2FC1Mqw3Ak0qsJMRb8vYBnqsS5KGz86lbHKIxCvq8aaPpVI997
 cIhGJSDDyzEZkTWD2rNaxcXcEWtg+UG4mQtLyYkBwrSy/I1xWTPDaGelgaivsr/sx22l
 cvlw==
X-Gm-Message-State: AOAM533y+1igxPzUKMwBM+c0Su9IjVd6ta7kW2R9LmtIzv5JdYuCVBJU
 XTIWoSWoGSYUQfbyxjXyGJFkW3g9qC6h2p6h8VtbiA==
X-Google-Smtp-Source: ABdhPJzAlobybkSmWpQ6ha24btcTyPI6Fe0fRQTXeGc7K0osnXOdlvUU2Svmk+mGvTY1LkqxvcAVltNOgEvreuqXjcw=
X-Received: by 2002:a50:d8cf:: with SMTP id y15mr30842697edj.66.1633481861084; 
 Tue, 05 Oct 2021 17:57:41 -0700 (PDT)
MIME-Version: 1.0
References: <20210926033935.9258-1-irui.wang@mediatek.com>
In-Reply-To: <20210926033935.9258-1-irui.wang@mediatek.com>
From: Hirokazu Honda <hiroh@google.com>
Date: Wed, 6 Oct 2021 09:57:30 +0900
Message-ID: <CAL1V8yzgu6k=RbijbiPGZsbbQMSk0LQRewvgzOgmO0Bbg6wBcA@mail.gmail.com>
Subject: Re: [PATCH] media: mtk-vcodec: MT8173 h264/vp8 encoder min/max
 bitrate settings
To: Irui Wang <Irui.Wang@mediatek.com>
Cc: Hans Verkuil <hverkuil-cisco@xs4all.nl>,
 Tzung-Bi Shih <tzungbi@chromium.org>, 
 Alexandre Courbot <acourbot@chromium.org>,
 Tiffany Lin <tiffany.lin@mediatek.com>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 Matthias Brugger <matthias.bgg@gmail.com>, 
 Tomasz Figa <tfiga@google.com>, Hsin-Yi Wang <hsinyi@chromium.org>, 
 Maoguang Meng <Maoguang.Meng@mediatek.com>,
 Longfei Wang <Longfei.Wang@mediatek.com>, 
 Yunfei Dong <Yunfei.Dong@mediatek.com>, Fritz Koenig <frkoenig@chromium.org>, 
 linux-media@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, srv_heupstream@mediatek.com, 
 linux-mediatek@lists.infradead.org, 
 Project_Global_Chrome_Upstream_Group@mediatek.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211005_175744_469111_28759AB7 
X-CRM114-Status: GOOD (  16.85  )
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

Hi Irui, thank you for the patch.


On Sun, Sep 26, 2021 at 12:39 PM Irui Wang <irui.wang@mediatek.com> wrote:
>
> Set recommend min/max bitrate range for MT8173 h264/vp8 encoder.
>
> Signed-off-by: Irui Wang <irui.wang@mediatek.com>


I confirmed the patch worked with my own test.

Tested-by: Hirokazu Honda <hiroh@chromium.org>

-Hiro
>
> ---
> This patch dependents on "Clean redundant encoder format definition",
> which already accepted into linux-next.git:
> https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git/patch/?id=4093eb21538ae4f2861b26f4615939e1fa50dc67
> ---
>  drivers/media/platform/mtk-vcodec/mtk_vcodec_enc_drv.c | 6 +++---
>  1 file changed, 3 insertions(+), 3 deletions(-)
>
> diff --git a/drivers/media/platform/mtk-vcodec/mtk_vcodec_enc_drv.c b/drivers/media/platform/mtk-vcodec/mtk_vcodec_enc_drv.c
> index 4489a9744cd7..5dce3681ce94 100644
> --- a/drivers/media/platform/mtk-vcodec/mtk_vcodec_enc_drv.c
> +++ b/drivers/media/platform/mtk-vcodec/mtk_vcodec_enc_drv.c
> @@ -388,8 +388,8 @@ static const struct mtk_vcodec_enc_pdata mt8173_avc_pdata = {
>         .num_capture_formats = ARRAY_SIZE(mtk_video_formats_capture_h264),
>         .output_formats = mtk_video_formats_output,
>         .num_output_formats = ARRAY_SIZE(mtk_video_formats_output),
> -       .min_bitrate = 1,
> -       .max_bitrate = 4000000,
> +       .min_bitrate = 64,
> +       .max_bitrate = 60000000,
>         .core_id = VENC_SYS,
>  };
>
> @@ -400,7 +400,7 @@ static const struct mtk_vcodec_enc_pdata mt8173_vp8_pdata = {
>         .output_formats = mtk_video_formats_output,
>         .num_output_formats = ARRAY_SIZE(mtk_video_formats_output),
>         .min_bitrate = 64,
> -       .max_bitrate = 4000000,
> +       .max_bitrate = 9000000,
>         .core_id = VENC_LT_SYS,
>  };
>
> --
> 2.25.1
>

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
