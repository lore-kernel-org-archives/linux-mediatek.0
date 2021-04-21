Return-Path: <SRS0=vHqv=JS=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-14.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A0806C433B4
	for <linux-mediatek@archiver.kernel.org>; Wed, 21 Apr 2021 13:29:35 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id D618061440
	for <linux-mediatek@archiver.kernel.org>; Wed, 21 Apr 2021 13:29:34 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org D618061440
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:
	References:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=UoH1U/OF43bqM0H/vltj+TqRYbAeuYw0YRFVF8odLoM=; b=pYkjOqAXsRHWpBtrK61F7EXkm
	UfcYvtK9rpnbyXCkgQUknT0/nwvm2K7tsgqK/9mm8b5f6vcWe29K8+GHjMwsZ+IzjJn34/c0QyZ4O
	V0fisQuiMuqLjRsTo08IHTzbFwlvit78Jdng1jm6vmg/Ki/sbfm7NupJhdcCPtGe7jpoQPSfZ3Gb3
	anDkR3M/K0PD1RLAdXDpLVVsqttQirXWwc+UL/ANw004vIBArJvOfpc4oj4UUdzGviDooNmRv3IGq
	Xt7jnInrV7VHpIm+8pLUG7NMnjXnvIKb8KiwBRji67f9ZBRCvaHYyOY1fMPTGRn0psp6BTex0Ua5Z
	xrLdPImZg==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lZCul-00ESnt-Hs; Wed, 21 Apr 2021 13:29:11 +0000
Received: from bombadil.infradead.org ([2607:7c80:54:e::133])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lZCuZ-00ESnI-NG; Wed, 21 Apr 2021 13:28:59 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=Content-Type:Cc:To:Subject:Message-ID
 :Date:From:In-Reply-To:References:MIME-Version:Sender:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description;
 bh=XktyXC22j+TdBGbZyfpgWSL93Kcygzh7KQYSbWjRkQA=; b=RNm9LOqPwq10a3qys84T4VU2HP
 aCR+OZnOzbpHId/1AYZBFGQl0OBPSFu8TB/XyXORCdciiLqRx/RdgMQ6auAQUTu4cdv/fXcfvj66W
 k/XSld/F1Z15CxYt1cHKdMYdCXU5zd4rG2TvnLK54NOfXeax+srPFEDIPYjGVVQscSAf7waPjW8Nb
 2KjM+s5Y6szs43IdhA94kKLBSBS55VFGjGJkikg1Fm7m5p1jbkRU23zzTxza7O4NHDB2nwLds80bp
 4rJsEQx+sXvz/94m2LermSkflofT/4RPbGyfcSfePLlpgULxndiikP3Q9PeXAOHd4PoidHaiNRAPL
 JGBA1+kA==;
Received: from mail.kernel.org ([198.145.29.99])
 by bombadil.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lZCuW-00CuyR-Ts; Wed, 21 Apr 2021 13:28:58 +0000
Received: by mail.kernel.org (Postfix) with ESMTPSA id 9BB046144D;
 Wed, 21 Apr 2021 13:28:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1619011735;
 bh=d8/vfSwddK+Y8TdODqYGvDFDCm4JKJqzn5GUmGaiiRs=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=TMzg7+28zsUnQ+CclYA+mOcApaUmH6AyNm5wjWaRSdO4UqDz6JXxrBm/8Jk4pufWp
 JePteHPwuyXkLUKa96DqrmM/KdTM50NYENHUXKhURWPH7eOwtRRK4vjjaFkaWK/ULV
 4KzjMaTrJnDj3ATietOM/xTYKW64qu8FXOR7YnBeBuHrGH8XqLc4m/OXE/YJQCDXVH
 b+Ct89HECfm4km7HCK5q6C3zFIpD45+mIe0YRhDp/SN2e92A6I1zkH/ypSpR5qDPRf
 q3KykO+mod3BTTsNDD0jBkQvvF3nGsN2BUrc/yGdieeFjRq4ha9tCYu02s+8Ejvuj5
 P8Iwt/9V9uMmA==
Received: by mail-ed1-f46.google.com with SMTP id g17so48686239edm.6;
 Wed, 21 Apr 2021 06:28:55 -0700 (PDT)
X-Gm-Message-State: AOAM5309CVoxV/6XuH+3grGRkPQHVatD/5ZBrz5sPGVz0ex/exMJwPmD
 m6z8FWfIdkfIesOGT66Io2AKqd44VONxd26yHSE=
X-Google-Smtp-Source: ABdhPJz6OX7rMgPGwizBBew3o4+66Oh3pVG75DbAo2FbGBZ8AAN8Btk4MTW1VJSRLyd2GBNubITN+56xYYrxhhNj60o=
X-Received: by 2002:a50:e607:: with SMTP id y7mr39234129edm.18.1619011734066; 
 Wed, 21 Apr 2021 06:28:54 -0700 (PDT)
MIME-Version: 1.0
References: <20200613230843.14109-1-wu000273@umn.edu>
 <19432e4d-dcc4-5056-17ef-a6d2dd7b6fb4@xs4all.nl>
In-Reply-To: <19432e4d-dcc4-5056-17ef-a6d2dd7b6fb4@xs4all.nl>
From: Krzysztof Kozlowski <krzk@kernel.org>
Date: Wed, 21 Apr 2021 15:28:42 +0200
X-Gmail-Original-Message-ID: <CAJKOXPeQZWZpeStxwEhOGoFuPQzRxNHkanEZ=8nrfg7DUccoEQ@mail.gmail.com>
Message-ID: <CAJKOXPeQZWZpeStxwEhOGoFuPQzRxNHkanEZ=8nrfg7DUccoEQ@mail.gmail.com>
Subject: Re: [PATCH] media: mtk-jpeg: Fix a reference count leak.
To: Hans Verkuil <hverkuil@xs4all.nl>
Cc: wu000273@umn.edu, kjlu@umn.edu, Rick Chang <rick.chang@mediatek.com>, 
 Bin Liu <bin.liu@mediatek.com>, Mauro Carvalho Chehab <mchehab@kernel.org>, 
 Matthias Brugger <matthias.bgg@gmail.com>, Ricky Liang <jcliang@chromium.org>, 
 Hans Verkuil <hans.verkuil@cisco.com>,
 Minghsiu Tsai <minghsiu.tsai@mediatek.com>, 
 linux-media@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-mediatek@lists.infradead.org, 
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210421_062857_025500_66574A55 
X-CRM114-Status: GOOD (  18.84  )
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

On Thu, 17 Sept 2020 at 13:48, Hans Verkuil <hverkuil@xs4all.nl> wrote:
>
> On 14/06/2020 01:08, wu000273@umn.edu wrote:
> > From: Qiushi Wu <wu000273@umn.edu>
> >
> > pm_runtime_get_sync() increments the runtime PM usage counter even
> > when it returns an error code. Thus call pm_runtime_put_noidle()
> > if pm_runtime_get_sync() fails.
> >
> > Fixes: b2f0d2724ba4 ("[media] vcodec: mediatek: Add Mediatek JPEG Decoder Driver")
> > Signed-off-by: Qiushi Wu <wu000273@umn.edu>
> > ---
> >  drivers/media/platform/mtk-jpeg/mtk_jpeg_core.c | 4 +++-
> >  1 file changed, 3 insertions(+), 1 deletion(-)
> >
> > diff --git a/drivers/media/platform/mtk-jpeg/mtk_jpeg_core.c b/drivers/media/platform/mtk-jpeg/mtk_jpeg_core.c
> > index f82a81a3bdee..097f0b050f67 100644
> > --- a/drivers/media/platform/mtk-jpeg/mtk_jpeg_core.c
> > +++ b/drivers/media/platform/mtk-jpeg/mtk_jpeg_core.c
> > @@ -710,8 +710,10 @@ static int mtk_jpeg_start_streaming(struct vb2_queue *q, unsigned int count)
> >       int ret = 0;
> >
> >       ret = pm_runtime_get_sync(ctx->jpeg->dev);
> > -     if (ret < 0)
> > +     if (ret < 0) {
> > +             pm_runtime_put_noidle(ctx->jpeg->dev);
> >               goto err;
> > +     }
> >
> >       return 0;
> >  err:
> >
>
> This patch no longer applies, can you rebase this?

This patch might be harmful, might be not. Probably should be skipped
due to uncertain intentions:
https://lore.kernel.org/linux-nfs/YH+7ZydHv4+Y1hlx@kroah.com/

Best regards,
Krzysztof

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
