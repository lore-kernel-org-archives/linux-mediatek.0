Return-Path: <SRS0=Gsgc=KQ=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.1 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_ADSP_CUSTOM_MED,DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 52C86C433B4
	for <linux-mediatek@archiver.kernel.org>; Fri, 21 May 2021 13:38:43 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id CA0D26109F
	for <linux-mediatek@archiver.kernel.org>; Fri, 21 May 2021 13:38:42 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org CA0D26109F
Authentication-Results: mail.kernel.org; dmarc=fail (p=reject dis=none) header.from=google.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:
	References:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=MA5/UJr1RJpbfsDrpOl3q53Hfpmt7Lmt3wfJb2rBCRk=; b=LOCmORzCI1maO65btdw31XbF7K
	D3qS0PgNGNA/ULr/FjdvVMHRow+PxJ0go0fGhvVWa8jZIT6ftkVOCm81zQaOjhO7yXzL7tG7kWIKr
	ZqpbZV0+tzDzTgeztQbX7syPWc7+oM/emjlDf+MVtKumXXPe3Czg5p8yfh+BayE1H2YGye/AXrP0w
	cBFV2fqTydG8fipcanSff2CxnEXIu8R+7XITPNgb4zciZxYdylXR3j0V3XVZQRnD7rdFgpWTxLXe7
	2srzeK95KW7jgyzPqcOoJSYH+W6BI4Bu93DGCtuWZxd/P/Hxgq88aWSXaL21EWk88txcYU8U4ojBp
	YBCgrclA==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1lk5MA-005YyQ-Hb; Fri, 21 May 2021 13:38:26 +0000
Received: from bombadil.infradead.org ([2607:7c80:54:e::133])
 by desiato.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1lk5M5-005YwF-N1
 for linux-mediatek@desiato.infradead.org; Fri, 21 May 2021 13:38:24 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=Content-Type:Cc:To:Subject:Message-ID
 :Date:From:In-Reply-To:References:MIME-Version:Sender:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description;
 bh=zXInqLwOOkmxw3FAtCSHWSift3iK7/sFcDERc9LRSF4=; b=cJU2ps2cLk3+hpKRW8cNTQSli9
 5zjrph2IEc1uUigt/tyTCPNy6nbSImAbkGdcdbpeMj/eEoYmA4MkZViedPvK71iF/hcj77SwKmdAk
 jXMygFFrwftD4aPw0GNOqnxA2UueiZZ72aNJw63vstDXsZNJCImvdUpXnS4gI37/iyZq2zzkNG9V5
 jv8SUKMG+vprQeYOzo1EPSmufYpyc86BHVvNMojKWzsr8ck+XnuW+HUeifVmDILkO6nT8+Xh+twgd
 NofVU8APZCZoCmuO/AaF4mJFgI593Nxv6nSWb0LuyHq3poSGZCxa3eIgTbSenmjhJjZ9URnYASOq2
 PTBd+6kw==;
Received: from mail-io1-xd2d.google.com ([2607:f8b0:4864:20::d2d])
 by bombadil.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lk5M3-00H9Yi-7W
 for linux-mediatek@lists.infradead.org; Fri, 21 May 2021 13:38:20 +0000
Received: by mail-io1-xd2d.google.com with SMTP id b25so1819087iot.5
 for <linux-mediatek@lists.infradead.org>; Fri, 21 May 2021 06:38:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=zXInqLwOOkmxw3FAtCSHWSift3iK7/sFcDERc9LRSF4=;
 b=P+50PGwtRDOoeSEvb4QqD//5T0XqcThBfJTGTyXGa/7fVf0cA8hIb1SmGHWRm+npTW
 xzGND2Pva4PPpWL9EM+uqUvGKNxk4RBqy0YJwKPing7Ye6LW+mxzR+hPkOXQc59KYeP5
 zztM/HFZ1Vo17VrxhVyGBPxqobjIOPl37JteeOoC69VXt7LCvsCtAmRZyt0WQmp7BQ3J
 7jrOyzncZCqVfT+arDqQ7g2VuNValU4gSjobpj4PMND6JrPwvgOW2/F0KyBYpgRMMnho
 Yjrnb6S5eth7mVkI+IbYDNlxFbp0pm7uw6QfsR+up+JH8EXkwDovI1IfdUtODb4W7KCr
 LJgA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=zXInqLwOOkmxw3FAtCSHWSift3iK7/sFcDERc9LRSF4=;
 b=ERmtqs0rKU9waYSV7CjTOdpoN++Dg+u5XY8G5+pAdHUv9mWuwpZpXTwT7EnI817WIg
 NyjD/+5FW4CoVCCvLsg3+BQvTMxXgIzyUx8Pwo/yVAPXK4M5U0OB4waFUI7UDp4l/iCm
 WhlcgM9kVEWisyE/LMgp3RVjjgNW8oIULplioMT/5gfftsnGBu+ErHVO6wkomk1S9QWM
 /qNGqR+daYWux9AwQVYYVliyN6W1rOBDtDS6Fb+QbdBvcfz7wUswA/mKWhenYA83Rsf5
 vz2B2mv1cYSvxOPRjCVj7vvwox+HBLX72MuaZ6EUcx0hoR+XViQLdCPe6GCvAb0wcs+H
 E9Uw==
X-Gm-Message-State: AOAM532agoFDrU9BMtF2uPUoKxsW1j50Wf7oU8bv+iTYdQ8/BqIwMiA/
 17nHL8Iy5MjguJx9Zv1DIHz35yMt2yH4cq1fnp6p5g==
X-Google-Smtp-Source: ABdhPJzDCg3SDubz4fjQvEgSqB/x9Z08rEIowfTPC3zW+FVgcUW8kQxymOjjU9gFknfrlouULiZyZcawYJnd45GtWDg=
X-Received: by 2002:a02:5409:: with SMTP id t9mr4611825jaa.50.1621604297789;
 Fri, 21 May 2021 06:38:17 -0700 (PDT)
MIME-Version: 1.0
References: <20210519143011.1175546-1-acourbot@chromium.org>
 <20210519143011.1175546-11-acourbot@chromium.org>
In-Reply-To: <20210519143011.1175546-11-acourbot@chromium.org>
From: Tzung-Bi Shih <tzungbi@google.com>
Date: Fri, 21 May 2021 21:38:06 +0800
Message-ID: <CA+Px+wUWncvepPMhRZ7qdMzdeQr+0jnJRPYRY57qedVPM_8+wg@mail.gmail.com>
Subject: Re: [PATCH v5 10/14] media: mtk-vcodec: vdec: support stateless API
To: Alexandre Courbot <acourbot@chromium.org>
Cc: Tiffany Lin <tiffany.lin@mediatek.com>,
 Andrew-CT Chen <andrew-ct.chen@mediatek.com>, 
 Hans Verkuil <hverkuil-cisco@xs4all.nl>, 
 Dafna Hirschfeld <dafna.hirschfeld@collabora.com>,
 Yunfei Dong <yunfei.dong@mediatek.com>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>, linux-media@vger.kernel.org, 
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, 
 "moderated list:ARM/Mediatek SoC support" <linux-mediatek@lists.infradead.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210521_063819_279057_157D1A0A 
X-CRM114-Status: GOOD (  10.85  )
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

On Wed, May 19, 2021 at 10:31 PM Alexandre Courbot
<acourbot@chromium.org> wrote:
> +#include "media/videobuf2-v4l2.h"
> +#include <media/videobuf2-dma-contig.h>
> +#include <media/v4l2-event.h>
> +#include <media/v4l2-mem2mem.h>
> +#include <linux/module.h>
> +
> +#include "mtk_vcodec_drv.h"
> +#include "mtk_vcodec_dec.h"
> +#include "mtk_vcodec_intr.h"
> +#include "mtk_vcodec_util.h"
> +#include "vdec_drv_if.h"
> +#include "mtk_vcodec_dec_pm.h"

Would be good practice to separate <...> and "..." inclusion and sort them.

> +static void mtk_vdec_worker(struct work_struct *work)
> +{
> +       struct mtk_vcodec_ctx *ctx =
> +               container_of(work, struct mtk_vcodec_ctx, decode_work);
> +       struct mtk_vcodec_dev *dev = ctx->dev;
> +       struct vb2_v4l2_buffer *vb2_v4l2_src, *vb2_v4l2_dst;
> +       struct vb2_buffer *vb2_src;
> +       struct mtk_vcodec_mem *bs_src;
> +       struct mtk_video_dec_buf *dec_buf_src;
> +       struct media_request *src_buf_req;
> +       struct vdec_fb *dst_buf;
> +       bool res_chg = false;
> +       int ret;
> +
> +       vb2_v4l2_src = v4l2_m2m_next_src_buf(ctx->m2m_ctx);
> +       if (vb2_v4l2_src == NULL) {

To be neat, !vb2_v4l2_src.

> +       vb2_v4l2_dst = v4l2_m2m_next_dst_buf(ctx->m2m_ctx);
> +       if (vb2_v4l2_dst == NULL) {

To be neat, !vb2_v4l2_dst.

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
