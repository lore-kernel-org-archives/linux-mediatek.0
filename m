Return-Path: <SRS0=uG8S=M4=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.4 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_ADSP_CUSTOM_MED,DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 28534C4338F
	for <linux-mediatek@archiver.kernel.org>; Thu,  5 Aug 2021 11:52:20 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id E35DD60F42
	for <linux-mediatek@archiver.kernel.org>; Thu,  5 Aug 2021 11:52:19 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org E35DD60F42
Authentication-Results: mail.kernel.org; dmarc=fail (p=reject dis=none) header.from=google.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=pOjQ5pC+UshCcGiFfm9ovRtNU50RJI4vKAwW7dHRSBA=; b=LoeR4yTfJQB6vw
	4Cg5EwOySvO60eOYGV/asbQD0Tdu9ez6aX92mriET4tOOlxrdmZVcraqkF+S3RfdAMDPPV80zNfUv
	OXBABadTEu1vZRot92lAPIUkJq2F3eeVaicQ84LUMs6YJQ4AffX2I6a76o+QPYhWao6Y9enrkWBG5
	2WWax7pOPvGMV9egNJqRAhIe2wBwQx/0gIiKoMYSCDHDiHm41mazMnoEz+NgXy6wZ4qruBMl4eh1R
	AWETuKS4G1rUYi/15gyQI31vDWhzATFaDK8SqD4Q0VZzJCEwwDsgS95vVHN1j0vaKsRxOlbJhKm0N
	c2WAPX+y5CloZ2Y+nUCg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mBbuz-009IkA-Ks; Thu, 05 Aug 2021 11:52:09 +0000
Received: from mail-io1-xd30.google.com ([2607:f8b0:4864:20::d30])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mBbuw-009Ij5-WC
 for linux-mediatek@lists.infradead.org; Thu, 05 Aug 2021 11:52:08 +0000
Received: by mail-io1-xd30.google.com with SMTP id m13so6295190iol.7
 for <linux-mediatek@lists.infradead.org>; Thu, 05 Aug 2021 04:52:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=f4GRvnSd2SfTisSbPOnvrb1AGqj2A6VfpqkuBFd8fVE=;
 b=RWa/9OFA5awZx3nilxSRf38QZA0f7ubdiVCjTcKfbkE6DezE9w4XMThdZXYqSnnP5q
 yLejaEgrb0dLym3yOlSQi8X7hH1DKT+OE/XS3F/GtWC18T+WO/5VvBhdl/6uIMAZYsEL
 Ey3GcEd+6nlnFLkN9iEACLdTqz/rTF7G78jbO9FNQrCtjIZtxQP7FZKEy4of+A+3S/xW
 hOk/2dfaPt1XYEcLvHDzfzp1ri5mWwCcp3JPcRN0KemjmPuMNHgec454Ea98OJbxoedd
 HoaSAJgbmS5FX08kMgqhGkl2kK/WXSX+Ay76zBA6ij4ju+SXFZ8u9ojXfeKUJGJPpmSX
 5zxw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=f4GRvnSd2SfTisSbPOnvrb1AGqj2A6VfpqkuBFd8fVE=;
 b=UhGzBC+XIwqNL5tTZG1Y4eww4p+VT9BqkbMyzu/25w2jy340JlRvSpsM2Xfp0Ng3oi
 nVKcAtl04SO/UyBU/fJ1GETogQGOVbFiBlpNx0KJChtavXGhr55neZjDr6o1jKg+wTF6
 v3FoJKLrMQs7VkC4UqVv82PV/8Bh9PhuO+i1qUN9MdQ3jdX37iogozAv8OcYXDzjDC5z
 uAQV0bqds0k8qk0gMDz427dJD+5+M88rlVtN1omBoBF0lq3xlDaXKRPIKi40v2Bhn51e
 iPoQt8x6GU0rG+Lla8qTa41i7YzB+k7XW48FgFT7hXCg/6X6LCW8K9KOhAAyS4bHhwbd
 nP4Q==
X-Gm-Message-State: AOAM53360X7bKWGZnbBOzc6oA181/aVRJmy412Efvtexv2gzLXQAROGM
 zqZs9Hwqr7Idybqdtkjebm9knuaSNxhDukHs9JO9MQ==
X-Google-Smtp-Source: ABdhPJzGQPitS//icrJkZI9zrnhgfKCvXOkyoNpJVFRpO/Os1R43Br1+wcD58Q5kYse0TOwb7aERr1q8UeqA5ufhZCE=
X-Received: by 2002:a6b:ea18:: with SMTP id m24mr972480ioc.76.1628164326010;
 Thu, 05 Aug 2021 04:52:06 -0700 (PDT)
MIME-Version: 1.0
References: <20210705053258.1614177-1-acourbot@chromium.org>
 <20210705053258.1614177-13-acourbot@chromium.org>
 <a0a8b9a1-df9e-0e30-9ce6-36759f707e27@collabora.com>
In-Reply-To: <a0a8b9a1-df9e-0e30-9ce6-36759f707e27@collabora.com>
From: Tzung-Bi Shih <tzungbi@google.com>
Date: Thu, 5 Aug 2021 19:51:55 +0800
Message-ID: <CA+Px+wVEpDazZP9gOV=5ANOKhV-k5GzbRWDWFMAJQO7_S=bgEg@mail.gmail.com>
Subject: Re: [PATCH v6 12/14] media: mtk-vcodec: vdec: add media device if
 using stateless api
To: Dafna Hirschfeld <dafna.hirschfeld@collabora.com>
Cc: Alexandre Courbot <acourbot@chromium.org>,
 Tiffany Lin <tiffany.lin@mediatek.com>, 
 Andrew-CT Chen <andrew-ct.chen@mediatek.com>,
 Hans Verkuil <hverkuil-cisco@xs4all.nl>, 
 Yunfei Dong <Yunfei.Dong@mediatek.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>, 
 linux-media@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-mediatek@lists.infradead.org, 
 Collabora Kernel ML <kernel@collabora.com>, 
 Enric Balletbo i Serra <enric.balletbo@collabora.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210805_045207_077986_7085631E 
X-CRM114-Status: GOOD (  10.91  )
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

On Tue, Jul 20, 2021 at 12:22 AM Dafna Hirschfeld
<dafna.hirschfeld@collabora.com> wrote:
> On 05.07.21 07:32, Alexandre Courbot wrote:
> > +             mtk_v4l2_debug(0, "media registered as /dev/media%d", vfd_dec->num);
> the media's node minor is not vfd_dec->num
IIUC, it should be vfd_dec->minor[1].  Will fix in the next version.

[1]: https://elixir.bootlin.com/linux/v5.14-rc4/source/include/media/v4l2-dev.h#L243

> >   struct mtk_vcodec_dev {
> This structs has a lot of duplicated fields for enc/dec
> Since the device represents either a decoder or an encoder,
> I think all those dupliactes can be removed, so for example
> instead of having both 'dec_irq' and 'enc_irq' we can have just 'irq'
I understand the struct may contain duplicate fields.  However I
prefer to separate the refactor into another series.  Would provide
the fixes later.

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
