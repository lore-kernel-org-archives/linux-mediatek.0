Return-Path: <SRS0=Gsgc=KQ=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.1 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_ADSP_CUSTOM_MED,DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3A9C8C433B4
	for <linux-mediatek@archiver.kernel.org>; Fri, 21 May 2021 08:07:25 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id A8F12613AC
	for <linux-mediatek@archiver.kernel.org>; Fri, 21 May 2021 08:07:24 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org A8F12613AC
Authentication-Results: mail.kernel.org; dmarc=fail (p=reject dis=none) header.from=google.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:
	References:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=WGvbcTH7uRMiXoFOSA8d4pJx2vR8dY94TPoMXgRV344=; b=HAAlJDoExbFCC//R4Q8/iMO/Ej
	H1+LF26N0eEGb3g0Bjb/yIrt56KCt5e4TUe0Y1r5KMeW9QirW7ijTwKm0UgvT3brdJDhiYvmArnn2
	Fj12wmWkgyqXdnh2sPuRAbSq7+n//61pJKwwUXpGMtTY9J8SOb4UbYR/xSJbMN2GqpEZK6hep4fVw
	fYnm0bba8fugyMFIou6ZXCVuxGW7qF0kUhtL3gQRgQH8plWHlXZIG63BYkikteplQ58VDmiYArnNW
	UcO4PQjfq3hT8ge+NoywI4g6GJmZbG0XxoeS6qnZCcFBMvt3W2eb0eqcs6FKF638eedeGX/4GasCh
	P6xgf1Kw==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1lk0BZ-004Mov-7X; Fri, 21 May 2021 08:07:09 +0000
Received: from bombadil.infradead.org ([2607:7c80:54:e::133])
 by desiato.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1lk0BD-004Mhk-Uo
 for linux-mediatek@desiato.infradead.org; Fri, 21 May 2021 08:06:48 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=Content-Type:Cc:To:Subject:Message-ID
 :Date:From:In-Reply-To:References:MIME-Version:Sender:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description;
 bh=6v2xJJNz+8HWwlmw70n+P9Pe4twee3C0WXLKPwPDcwQ=; b=mtNHs0pme7hYxLhrh2nDO+y22t
 Ln1xpT3SKu0BaxN6kF3fR0ZDw67PaZvB+2R6wQRrEt7d2g4INYvvPmRQOXOvqnTJ+NHrgK0VhiwfJ
 GmDjfrQfYF39whksJCP9U/gzL6S8O+X08KU2U/Wdx8memsUQcpf3obPxTNEecPnR3LdRpsH/0qm8C
 Zs9QFwU6QfLNmzXjv2E6Mgn90Xm66JCJ0xy2Px4BXKf1kwgsoCyiy/7fNSDi34vmxufgiawf5veZN
 AxNepnTqIDdfPkmnQtoqbeFY4DX65XKebtyYZLTR36pEoYvZRo5yFs9GnOmqPt36oEAth15XYVIF3
 JQBVSCjA==;
Received: from mail-io1-xd30.google.com ([2607:f8b0:4864:20::d30])
 by bombadil.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lk0BB-00GvlV-0U
 for linux-mediatek@lists.infradead.org; Fri, 21 May 2021 08:06:46 +0000
Received: by mail-io1-xd30.google.com with SMTP id z24so19293480ioi.3
 for <linux-mediatek@lists.infradead.org>; Fri, 21 May 2021 01:06:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=6v2xJJNz+8HWwlmw70n+P9Pe4twee3C0WXLKPwPDcwQ=;
 b=toHvOupgQlvnzTBQKiq/TXqrmEEJULGhFpWLVs2IjH/4pc+gBTPWSyg2tgw0Cc9UgP
 5+xi9qDR2o9BROfVhs3/pUtTnk25OV3Ss34DTIGPFY/is9wTapmxNHYdq8Ih4iNeeo96
 w0Uh6QQrhxyfLaMO/MRMHiEpxwbjN9/x+/eAUC0vArQTdWwu/NXuQpzTSfQCE86C93Zf
 mpI0a//FVwGKmR7jxyU80AEm7Mcx0hXwz2Z5G/Sg/8Gtla2HiE+rJNFabZhICOAjPdJ9
 wmbSkxFpk5Ygw+ybK21UleGsHjKBUTHsM4wnczGkHTYJ6oK0xls1bbblKJXAtU2rKu36
 t1Ow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=6v2xJJNz+8HWwlmw70n+P9Pe4twee3C0WXLKPwPDcwQ=;
 b=nQQK240D2qHDEp+nwmJTPqw2/sYKRAUt8LeC4IMrOk+M8vu39hRV2Ircw+FEkJAyZe
 fjBF66u0F4wnywXi8eM+KLQi/7ky4XSSm6tUs/zCL0qKRj4o1kCQeIbYdqBa7HAweifR
 xKEce98JxiqsZeBFMxguMzgHaPL7NKzqbaj3KSj3Qcpra2kr5y6fTBtMkLLKhbq+tfrp
 JmRfs82VPOFHRx34fn6WbioXR29JODNLAAWpElJ8lKboz0P08UrhEWmNWHqI/kKY3Ckc
 iHihKpE2xm7JAUo3Ijsf/2QLPQfLdcd4v7lft52wrXM7S433W1LaavrpikhHGn7El7lP
 aB8A==
X-Gm-Message-State: AOAM531wbLHzo006DK/Hej+0xy2w4Nx1/5kxhMpREhx2uJRgziXBFzZn
 JZ1YlyfH9i5Nrggiwnk0ROL1dWztFdZ2cmRQoRQwbg==
X-Google-Smtp-Source: ABdhPJzWY2Pt+BD2l8jM9elECsKBOWmC/DwlAg5MCJ39ci2ZGyWFsesNN6ULPRe8pZX7cOH6JaRW0bkog+XrNt6P3XU=
X-Received: by 2002:a5d:9744:: with SMTP id c4mr10567537ioo.76.1621584403538; 
 Fri, 21 May 2021 01:06:43 -0700 (PDT)
MIME-Version: 1.0
References: <20210521070139.20644-1-irui.wang@mediatek.com>
 <20210521070139.20644-7-irui.wang@mediatek.com>
In-Reply-To: <20210521070139.20644-7-irui.wang@mediatek.com>
From: Tzung-Bi Shih <tzungbi@google.com>
Date: Fri, 21 May 2021 16:06:32 +0800
Message-ID: <CA+Px+wU+6AtcFLxAHrEXOK=E+LhwM2iX0R0JOgBvv-xzGO=Bcw@mail.gmail.com>
Subject: Re: [PATCH v4, 6/6] media: mtk-vcodec: Support MT8192 H264 4K encoding
To: Irui Wang <irui.wang@mediatek.com>
Cc: Alexandre Courbot <acourbot@chromium.org>,
 Hans Verkuil <hverkuil-cisco@xs4all.nl>, 
 Tiffany Lin <tiffany.lin@mediatek.com>,
 Andrew-CT Chen <andrew-ct.chen@mediatek.com>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>, Rob Herring <robh+dt@kernel.org>, 
 Matthias Brugger <matthias.bgg@gmail.com>, Tomasz Figa <tfiga@google.com>, 
 Hsin-Yi Wang <hsinyi@chromium.org>, Maoguang Meng <maoguang.meng@mediatek.com>,
 Longfei Wang <longfei.wang@mediatek.com>, Yong Wu <yong.wu@mediatek.com>, 
 Yunfei Dong <yunfei.dong@mediatek.com>, Fritz Koenig <frkoenig@chromium.org>, 
 Tzung-Bi Shih <tzungbi@chromium.org>, linux-media@vger.kernel.org, 
 "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS"
 <devicetree@vger.kernel.org>, 
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, 
 "moderated list:ARM/Mediatek SoC support"
 <linux-arm-kernel@lists.infradead.org>, srv_heupstream@mediatek.com, 
 "moderated list:ARM/Mediatek SoC support" <linux-mediatek@lists.infradead.org>,
 Project_Global_Chrome_Upstream_Group@mediatek.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210521_010645_057659_133148B7 
X-CRM114-Status: UNSURE (   9.99  )
X-CRM114-Notice: Please train this message.
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

On Fri, May 21, 2021 at 3:02 PM Irui Wang <irui.wang@mediatek.com> wrote:
>         fsize->type = V4L2_FRMSIZE_TYPE_STEPWISE;
> -       fsize->stepwise = mtk_venc_framesizes;
> +       fsize->stepwise =
> +               (ctx->dev->enc_capability & MTK_VENC_4K_CAPABILITY_ENABLE) ?
> +               mtk_venc_4k_framesizes : mtk_venc_hd_framesizes;

Use a normal if .. else .. is more readable.

> @@ -1210,6 +1231,9 @@ int mtk_vcodec_enc_ctrls_setup(struct mtk_vcodec_ctx *ctx)
>  {
>         const struct v4l2_ctrl_ops *ops = &mtk_vcodec_enc_ctrl_ops;
>         struct v4l2_ctrl_handler *handler = &ctx->ctrl_hdl;
> +       const u8 h264_max_level =
> +               (ctx->dev->enc_capability & MTK_VENC_4K_CAPABILITY_ENABLE) ?
> +               V4L2_MPEG_VIDEO_H264_LEVEL_5_1 : V4L2_MPEG_VIDEO_H264_LEVEL_4_2;

Again, I would like it to be a normal if .. else ..

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
