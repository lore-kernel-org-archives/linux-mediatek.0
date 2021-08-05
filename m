Return-Path: <SRS0=uG8S=M4=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.4 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_ADSP_CUSTOM_MED,DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7CD86C4338F
	for <linux-mediatek@archiver.kernel.org>; Thu,  5 Aug 2021 11:52:02 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 3665561102
	for <linux-mediatek@archiver.kernel.org>; Thu,  5 Aug 2021 11:52:02 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 3665561102
Authentication-Results: mail.kernel.org; dmarc=fail (p=reject dis=none) header.from=google.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=uzaTtNt0z9sKlB0iyyccowPvs0uyXgVZWUevGsTadGw=; b=OV8NxhGCR88wC/
	hzmqipTkmRT/bCLLfLUpoR1PcUPnNd9R+IZiyDypwVHjX/J/uUFaaDKn+vtSqLcW5YyxiQ8idhMmf
	gcM/0CyRa19KOXpiCJbemWQkojnIUxnJToItAj0kXaqo4sCH4du3itJkqEG1e4Tga1QP3/rhPj3cG
	wW1MD0RNJaDWd5s4CQcPnzncD2ob8BzPadf1Q8S8X6/wgGum0d2RyxzHz80QE6wrlFcvpopr8KW03
	hrrzvkIA78IzdgKqnwmHGKE+VjKmROpap9mLq0ZdlNyYLITf9252PJEhuzsr+wFgSTefj27DUvG/S
	ewl30UX711sD+bEyPLIA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mBbui-009IgH-O9; Thu, 05 Aug 2021 11:51:52 +0000
Received: from mail-io1-xd32.google.com ([2607:f8b0:4864:20::d32])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mBbuf-009Ien-JR
 for linux-mediatek@lists.infradead.org; Thu, 05 Aug 2021 11:51:51 +0000
Received: by mail-io1-xd32.google.com with SMTP id y1so6308197iod.10
 for <linux-mediatek@lists.infradead.org>; Thu, 05 Aug 2021 04:51:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=TsqI2f4PszkolvCq0Vj/MJlhnRVimXlHdN3ztF9TtDc=;
 b=h9Ihuy67i+BPHbno8ksO+l7rRWsFMJu0B6yiBfPHRxv4EmpMJbRxqk5YJXlz6W7+CO
 uE3dUWZx6q63v5aX0O09Q1JMpskADy5RGDyKu0RfrPTskZomGnqFq8kR03Wv17C8H9jf
 N+IXJJsN/bX0rJY4TQlkBqADVsXV/DK/cCjXZwEJGTXFlh3gOL3PIs38B+fbEyzOFZ+c
 Cs6INT1PEHeTw3r58VBWcelXrfih83TPWsmxr7DYsBdHtP6IXYj3+Javgv7UWyjjAqdt
 kdrp9QL8apoFudTcrcGvz2k3dGUHLWb20nIxajEAC2b+aZCBG2qEr/us4XG0zUJbVouw
 yVqg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=TsqI2f4PszkolvCq0Vj/MJlhnRVimXlHdN3ztF9TtDc=;
 b=UFA5gn7OKL6YX1gGoyteP690NJS41aldbQNBnxjgjl4C5OQ4jdbhLibmVYcIU5SZj+
 k/j8xLl22Ooit+AoknIML3D38TMZCnGoKNOF0O9seJopJYzwR4gTHlNDiQioLfeLM9VC
 YtmzhFNspulMrbw3SpnVIGmIfteHlOs2Fr3Yk/oB5IlAB8YtoGUKicnJ8gy76XG9HZsY
 iah+/Zli+9KgHcMev+oo+WX3R2yvFAFcI8EzuymrZeCBEQEBxx8V2DtP1PFK6HWT7UH4
 NAGyGJdEl6bbnqijMSzTXAP+auxyWVOHrok/JKSUH6Q8cPMtrDcndWSqzGCe2r6SJyA8
 NQ2w==
X-Gm-Message-State: AOAM5306oiAqYhet4hzPhWGR3AdvbQFOO9qHB4Qr93bkbUPu6YtQO6WY
 Qh+0fg9ET6Lb05WRqRCVdrvfAfOI/hnlMJbUQDoRAA==
X-Google-Smtp-Source: ABdhPJwN2okbkH6vhEz2oQAP4lCx3J40CVTNusFx6KveRCIE/34YDrRFFEclMt3GEqmVWTQ5dVQczfBztrR21Vfltj4=
X-Received: by 2002:a02:cf2e:: with SMTP id s14mr4381393jar.74.1628164305688; 
 Thu, 05 Aug 2021 04:51:45 -0700 (PDT)
MIME-Version: 1.0
References: <20210705053258.1614177-1-acourbot@chromium.org>
 <20210705053258.1614177-12-acourbot@chromium.org>
 <8929c97f-b105-ee35-d882-1cd218edcfd1@xs4all.nl>
In-Reply-To: <8929c97f-b105-ee35-d882-1cd218edcfd1@xs4all.nl>
From: Tzung-Bi Shih <tzungbi@google.com>
Date: Thu, 5 Aug 2021 19:51:34 +0800
Message-ID: <CA+Px+wWARA-TF66x3k8nY+TNqNo90Cn2Q_c73a66JUXWkY0dsg@mail.gmail.com>
Subject: Re: [PATCH v6 11/14] media: mtk-vcodec: vdec: support stateless H.264
 decoding
To: Hans Verkuil <hverkuil-cisco@xs4all.nl>
Cc: Alexandre Courbot <acourbot@chromium.org>,
 Tiffany Lin <tiffany.lin@mediatek.com>, 
 Andrew-CT Chen <andrew-ct.chen@mediatek.com>, 
 Dafna Hirschfeld <dafna.hirschfeld@collabora.com>,
 Yunfei Dong <Yunfei.Dong@mediatek.com>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>, linux-media@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-mediatek@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210805_045149_671764_FA284CA0 
X-CRM114-Status: GOOD (  13.89  )
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

On Tue, Jul 20, 2021 at 6:52 PM Hans Verkuil <hverkuil-cisco@xs4all.nl> wrote:
> Several new structs do not have any field documentation, but they do start with /**,
> so I get complaints about missing field docs.
>
> After manually changing this to /*, I still get a few remaining warnings:
Will fix in next version.

> mtk-vcodec/vdec/vdec_h264_req_if.c:189: warning: Function parameter or member 'h264_slice_params' not described in 'vdec_h264_vsi'
> mtk-vcodec/vdec/vdec_h264_req_if.c:210: warning: Function parameter or member 'h264_slice_param' not described in 'vdec_h264_slice_inst'
> mtk-vcodec/vdec/vdec_h264_req_if.c:210: warning: Function parameter or member 'dpb' not described in 'vdec_h264_slice_inst'
>
> Can you fix this?
Will fix in next version.

> I also want to take this patch series at the same time:
>
> https://patchwork.linuxtv.org/project/linux-media/cover/20210630085247.27554-1-irui.wang@mediatek.com/
>
> Can you verify that this would not cause any problems with your series? As far as
> I can see it is fine, but a second pair of eyeballs wouldn't hurt.
Series [1] shouldn't cause any problems with this series.

However, series [1] doesn't apply after this series (conflicted with
[2]).  It needs to rebase and send another version after fixing the
typo anyway.

[1]: https://patchwork.linuxtv.org/project/linux-media/cover/20210630085247.27554-1-irui.wang@mediatek.com/
[2]: https://patchwork.linuxtv.org/project/linux-media/patch/20210630085247.27554-3-irui.wang@mediatek.com/

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
