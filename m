Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D0430C433EF
	for <linux-mediatek@archiver.kernel.org>; Thu, 27 Jan 2022 09:42:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=vmfjWqdhP2N21HuFTJ5zTL2bBIpCM8mXfHt7BasTjiY=; b=ptW98AP/KqWF7G
	2u8vvSo4Qzb9Y4ztb3l+ZG8YN8XHhL8VO92G9gDPvha+d3BBGZ4rR2EFQ15updh9Iqf9orx1P/f3u
	xwyrXcI9FzCUDT0yOE7CCs2E5s25teUT0ZwdgKiRwX/xiu2sVYWCTk2HtSyL6/e7vWEo4JVfsLKI1
	I0gFiKrbX4awV1gtM0xmDxbB5VBFghM8mwFDp37j9F07O+DA+afoLCPtjplH0s3bcqNlcJjdw4prG
	kJkarADUbvRekpSmKdCBfJQU8IvVDizWuHbKClWiM93ab+kM4CSExorC1KRp6Zg1Ouv3F1uPdFTKA
	H6aFbLrpmlrEyjPFPFFA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nD1IP-00Ewmh-UW; Thu, 27 Jan 2022 09:42:26 +0000
Received: from mail-lj1-x229.google.com ([2a00:1450:4864:20::229])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nD10l-00EskA-5p
 for linux-mediatek@lists.infradead.org; Thu, 27 Jan 2022 09:24:12 +0000
Received: by mail-lj1-x229.google.com with SMTP id e17so3369935ljk.5
 for <linux-mediatek@lists.infradead.org>; Thu, 27 Jan 2022 01:24:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=1/pFKZsibDbTasI5zHvoomcfgVulhQzgBhdCkCIsPV4=;
 b=SBk++oGjK7vx0bR/u816Fk2uDzB+AlEwqZ4fjozkcNku8sKEy0s4qnYQVBkjiLcXwZ
 iONXICtuFkUv6Hw8Tzo4sCIck9Nt/2u9zBftwk0FLSN/SWTNQTB3x08U4JLD4Wzx1o5h
 hiX00dZ7j99eLlL0vFrDxqxBbboh8fBIxyY6I=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=1/pFKZsibDbTasI5zHvoomcfgVulhQzgBhdCkCIsPV4=;
 b=gqW9k9PQYbUKXycdA8jmCfL2/ckYmlCOFzI0nNSNbnhEO0NDeyQMcuI9I7f4iPvEDk
 Tj6XeDKXEgEYSW307tZ3lMtU1inC5JCxN9jf79raK7yHVTYCquv304F2pqfgFrTmWoRk
 TNJNQq85zj7rY3Hks298ZGDg5y73EMTvfNWWkdLzOreC2AQv3nEXDywmiKTtw9NF1XY4
 c8ptdkdWkpFdgu7G63aoN1xaFa4ZzlJz0alrZTaO/vo5rjf855FkJFCh5o1UjVawqoV5
 0XrdYWE36y8B904pLuVXA1EGYD2DXozdqOQhf4Ve+zN0obTCZdxVs4wIuaf8k615lW5v
 ETcA==
X-Gm-Message-State: AOAM531pYUjaVKUxj4HDLNOav4aLLdazfvRRWES3eHOIDCb5VKs0NbB5
 NOZsklR6qstDDUa2i5+FhOF+kQ1rB3CR4n9tY1oB1A==
X-Google-Smtp-Source: ABdhPJyXM+RpThUvI1HjeGrfGwAx7jB600kp/rh3QNtWeV9RUuO7+U6MejDM5XXVg8GmXXHFoXWzjd3Eg8/BT40cL18=
X-Received: by 2002:a2e:920b:: with SMTP id k11mr2169470ljg.302.1643275447980; 
 Thu, 27 Jan 2022 01:24:07 -0800 (PST)
MIME-Version: 1.0
References: <20220127025544.10854-1-yunfei.dong@mediatek.com>
 <20220127025544.10854-8-yunfei.dong@mediatek.com>
In-Reply-To: <20220127025544.10854-8-yunfei.dong@mediatek.com>
From: Chen-Yu Tsai <wenst@chromium.org>
Date: Thu, 27 Jan 2022 17:23:56 +0800
Message-ID: <CAGXv+5ELuvvG6dwXH5DdHtjOm4j4AAVTk2UxGOitF5v5Vx265A@mail.gmail.com>
Subject: Re: [PATCH v1, 7/8] media: uapi: Init VP9 stateless decode params
To: Yunfei Dong <yunfei.dong@mediatek.com>, 
 Andrzej Pietrasiewicz <andrzej.p@collabora.com>
Cc: Alexandre Courbot <acourbot@chromium.org>,
 Hans Verkuil <hverkuil-cisco@xs4all.nl>, 
 Tzung-Bi Shih <tzungbi@chromium.org>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 Tiffany Lin <tiffany.lin@mediatek.com>,
 Andrew-CT Chen <andrew-ct.chen@mediatek.com>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>, Rob Herring <robh+dt@kernel.org>, 
 Matthias Brugger <matthias.bgg@gmail.com>, Tomasz Figa <tfiga@google.com>, 
 George Sun <george.sun@mediatek.com>, Xiaoyong Lu <xiaoyong.lu@mediatek.com>, 
 Hsin-Yi Wang <hsinyi@chromium.org>, Fritz Koenig <frkoenig@chromium.org>, 
 Dafna Hirschfeld <dafna.hirschfeld@collabora.com>, 
 Benjamin Gaignard <benjamin.gaignard@collabora.com>,
 Daniel Vetter <daniel@ffwll.ch>, 
 dri-devel <dri-devel@lists.freedesktop.org>, Irui Wang <irui.wang@mediatek.com>,
 Steve Cho <stevecho@chromium.org>, linux-media@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, srv_heupstream@mediatek.com, 
 linux-mediatek@lists.infradead.org, 
 Project_Global_Chrome_Upstream_Group@mediatek.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220127_012411_246236_162A43F7 
X-CRM114-Status: GOOD (  14.92  )
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

Hi,

On Thu, Jan 27, 2022 at 10:56 AM Yunfei Dong <yunfei.dong@mediatek.com> wrote:
>
> Init some of VP9 frame decode params to default value.
>
> Signed-off-by: Yunfei Dong <yunfei.dong@mediatek.com>

Maybe add

Fixes: b88dbe38dca8 ("media: uapi: Add VP9 stateless decoder controls")

> ---
>  drivers/media/v4l2-core/v4l2-ctrls-core.c | 8 ++++++++
>  1 file changed, 8 insertions(+)
>
> diff --git a/drivers/media/v4l2-core/v4l2-ctrls-core.c b/drivers/media/v4l2-core/v4l2-ctrls-core.c
> index 54abe5245dcc..b25c77b8a445 100644
> --- a/drivers/media/v4l2-core/v4l2-ctrls-core.c
> +++ b/drivers/media/v4l2-core/v4l2-ctrls-core.c
> @@ -112,6 +112,7 @@ static void std_init_compound(const struct v4l2_ctrl *ctrl, u32 idx,
>         struct v4l2_ctrl_mpeg2_picture *p_mpeg2_picture;
>         struct v4l2_ctrl_mpeg2_quantisation *p_mpeg2_quant;
>         struct v4l2_ctrl_vp8_frame *p_vp8_frame;
> +       struct v4l2_ctrl_vp9_frame *p_vp9_frame;
>         struct v4l2_ctrl_fwht_params *p_fwht_params;
>         void *p = ptr.p + idx * ctrl->elem_size;
>
> @@ -152,6 +153,13 @@ static void std_init_compound(const struct v4l2_ctrl *ctrl, u32 idx,
>                 p_vp8_frame = p;
>                 p_vp8_frame->num_dct_parts = 1;
>                 break;
> +       case V4L2_CTRL_TYPE_VP9_FRAME:
> +               p_vp9_frame = p;
> +               p_vp9_frame->profile = 0;
> +               p_vp9_frame->bit_depth = 8;
> +               p_vp9_frame->flags |= V4L2_VP9_FRAME_FLAG_X_SUBSAMPLING |
> +                       V4L2_VP9_FRAME_FLAG_Y_SUBSAMPLING;
> +               break;
>         case V4L2_CTRL_TYPE_FWHT_PARAMS:
>                 p_fwht_params = p;
>                 p_fwht_params->version = V4L2_FWHT_VERSION;
> --
> 2.25.1
>

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
