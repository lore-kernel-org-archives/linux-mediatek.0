Return-Path: <SRS0=rIjB=KI=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.5 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8EFA6C433B4
	for <linux-mediatek@archiver.kernel.org>; Thu, 13 May 2021 08:05:45 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 052966140C
	for <linux-mediatek@archiver.kernel.org>; Thu, 13 May 2021 08:05:44 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 052966140C
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=chromium.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:
	References:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=sF5W1giuzutbKgnFwmhQ1dCKPQdcSxZ/4ZYJ1g6dDZ0=; b=IYqms+Lr+17GsoocmH+zUiZzm
	/4GGFLBc5OSY1ePzBoEye6j/7Vowz3+mH0rgWBJ6j4ath+yblTiUewHpe31RF7EEZwK3BePHfM0TF
	DdJ0wl5SMVVFV20q7ufLQWMVPnEfkL7Au5m/Kw7/49JhqyDKCzKESDKv8mUUP76PqDf/bEVFxDhSQ
	R1XdWI7e9cxNPJJErZCtwwXXJJu5XPlqMf/nYEAu9+PUj2H3I6AIkP4exsKSSgnGKabogYb8+T9nV
	A/G5WfOwuFtTg1QGr1xSpoKtyDB861vEuXDz9DbtRpDRKS/EfOnYZiNi2MiNKwe0RrfivhOXDJUqb
	GRJsCKboQ==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lh6LW-0053qe-P9; Thu, 13 May 2021 08:05:26 +0000
Received: from bombadil.infradead.org ([2607:7c80:54:e::133])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lh6LU-0053qP-Rv
 for linux-mediatek@desiato.infradead.org; Thu, 13 May 2021 08:05:25 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=Content-Type:Cc:To:Subject:Message-ID
 :Date:From:In-Reply-To:References:MIME-Version:Sender:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description;
 bh=YGYhlEtHJ4cDIvOhyvkm1Ik0yqS7El9eC6BJ8CsVKBM=; b=1kg2aBUL6BSsnVfcMHaqYW5x8i
 c0L2cvhLQW1FPtEUgPwZt/haXTquvwPlHFsk8FDvhBLThjpA7Jr4trkwCFXXh7uxZHKhEKujDxmVN
 Jvlwsn+5WzK+aWa9wl84vPBa5/PBt3rrAR6Z3oD9oNY+nO9jWuB84TOuzfEd7TKuRoBylpdmgcq3y
 Drxe3/ckt8LCGjlraD4GaXzk0gtaYnKAuE+NObTiSEi05ndtbsDSsTvklZOovUUw7hHOqxZNeO9IK
 Eo0wTRUouUqJGqoUSoeiST6o5VLIN3O3j5WW3pEaqHevZuQCxNO/7EAjWWdwvxIPf36wpd5krYPF0
 c5ZFIgJw==;
Received: from mail-lf1-x12f.google.com ([2a00:1450:4864:20::12f])
 by bombadil.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lh6LO-00B619-Un
 for linux-mediatek@lists.infradead.org; Thu, 13 May 2021 08:05:23 +0000
Received: by mail-lf1-x12f.google.com with SMTP id i9so30837974lfe.13
 for <linux-mediatek@lists.infradead.org>; Thu, 13 May 2021 01:05:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=YGYhlEtHJ4cDIvOhyvkm1Ik0yqS7El9eC6BJ8CsVKBM=;
 b=R4HgB1qbhtCEbNxBfKElzO/lZ5CpsVCPCWNCWhThJU/+wTDVcDWWFQywbKGfht7LZF
 MKeaPQXJe61GjYKxoSZ6ZCNDqlfM261JYubKxvrFPfFDhARR0nX/CwaG6icsukv2EJPt
 WZ8HLr/Z2RlsnhLSq2SFo/ZWb2QBId1KIYw8s=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=YGYhlEtHJ4cDIvOhyvkm1Ik0yqS7El9eC6BJ8CsVKBM=;
 b=TNTsCdD6Uu6I/bCj6827mfcywT7ph/FTAwsryDRA0nJ1MlVTDmDI6lC28LWIur6d30
 kVcuLIOsZBfdvWric80YVIXAztUapV4DczBSkciOCU4Zjo4W/N3Ny+F+DpDxFUdgNTne
 NGIjrdjvpSLvCyGzlPH1v3mY12Af5UZx3uLIbSNv04cAXiQrXfOXq+Z2rrq2D9KdCgCd
 PGpc0nD/gAfUr8nm+u/ClRY1s99AwK6h9xUoj7hKHIUgJ37vlhvMeZ7FLENm5mKZL2lF
 k94ofxL6De0l+w6ezyi51UMOjCILyLb1p0HeVEQc9R0FboskQtv1oEURzECULMYteBy+
 nv7g==
X-Gm-Message-State: AOAM530+hrSWXs7FYYQIrrFLv7wlvTZL4iIQw8IQ51Bvll4VWG2U3Vp/
 6aUUiZrctWokrb0YtYiD+t+Qy+YXyhnO+Q==
X-Google-Smtp-Source: ABdhPJzUTX/CNXOi9/7vNHhtuM9KLpwLN5eaPEyCcw6W7z1CK4SBxu1lBOR8dMVgr5akwAVw0RdrOg==
X-Received: by 2002:a05:6512:128e:: with SMTP id
 u14mr13420765lfs.303.1620893115228; 
 Thu, 13 May 2021 01:05:15 -0700 (PDT)
Received: from mail-lj1-f178.google.com (mail-lj1-f178.google.com.
 [209.85.208.178])
 by smtp.gmail.com with ESMTPSA id z12sm213896lfe.195.2021.05.13.01.05.14
 for <linux-mediatek@lists.infradead.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 13 May 2021 01:05:14 -0700 (PDT)
Received: by mail-lj1-f178.google.com with SMTP id p20so8818349ljj.8
 for <linux-mediatek@lists.infradead.org>; Thu, 13 May 2021 01:05:14 -0700 (PDT)
X-Received: by 2002:a2e:5345:: with SMTP id t5mr33513099ljd.259.1620893114204; 
 Thu, 13 May 2021 01:05:14 -0700 (PDT)
MIME-Version: 1.0
References: <20210427111526.1772293-1-acourbot@chromium.org>
 <20210427111526.1772293-8-acourbot@chromium.org>
 <faa5553f-2ea5-27a5-7f85-e1418d2c7df1@xs4all.nl>
In-Reply-To: <faa5553f-2ea5-27a5-7f85-e1418d2c7df1@xs4all.nl>
From: Alexandre Courbot <acourbot@chromium.org>
Date: Thu, 13 May 2021 17:05:02 +0900
X-Gmail-Original-Message-ID: <CAPBb6MUKtxCS=JbtBmvwwEovrN8NCtLmMGcTkozo_gnDMRsqHw@mail.gmail.com>
Message-ID: <CAPBb6MUKtxCS=JbtBmvwwEovrN8NCtLmMGcTkozo_gnDMRsqHw@mail.gmail.com>
Subject: Re: [PATCH v4 07/15] media: mtk-vcodec: vdec: add media device if
 using stateless api
To: Hans Verkuil <hverkuil-cisco@xs4all.nl>
Cc: Tiffany Lin <tiffany.lin@mediatek.com>,
 Andrew-CT Chen <andrew-ct.chen@mediatek.com>, 
 Rob Herring <robh+dt@kernel.org>, Yunfei Dong <yunfei.dong@mediatek.com>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 Linux Media Mailing List <linux-media@vger.kernel.org>, 
 LKML <linux-kernel@vger.kernel.org>, 
 "moderated list:ARM/Mediatek SoC support" <linux-mediatek@lists.infradead.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210513_010519_045623_0EB46276 
X-CRM114-Status: GOOD (  13.81  )
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

Hi Hans, thanks for the review!

On Thu, Apr 29, 2021 at 4:28 PM Hans Verkuil <hverkuil-cisco@xs4all.nl> wrote:
>
> On 27/04/2021 13:15, Alexandre Courbot wrote:
> > From: Yunfei Dong <yunfei.dong@mediatek.com>
> >
> > The stateless API requires a media device for issuing requests. Add one
> > if we are being instantiated as a stateless decoder.
>
> Why for the stateless decoder only? Why not create one for all?
>
> It's not a blocker, but I would recommend looking at this.

Would there be any use in creating a media device for a stateful
decoder that does not need to use requests?

Cheers,
Alex.

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
