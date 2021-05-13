Return-Path: <SRS0=rIjB=KI=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.5 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 39559C433ED
	for <linux-mediatek@archiver.kernel.org>; Thu, 13 May 2021 08:07:07 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 8E3466008E
	for <linux-mediatek@archiver.kernel.org>; Thu, 13 May 2021 08:07:06 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 8E3466008E
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=chromium.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:
	References:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=qnJNnQ4QFNPeWctCPbMLkUS3z8T7+Pay85vIa3L/Feo=; b=pqVHyX2zHNcSSBOiAFVR5oX8u
	QwACXkK9T0bTGOC5O28A5p+Bf2o572CpQzUHEFzP9eodyqi4dw4GI1hk42OgMDf3QxvMpTpMh2F1a
	LTxhjMiWU9VfJwCl9wtQv98uiDWsZXiEAiyRR52+ePDDTTJP1Y8jJlpkmoFXjUg2fHUC+F9TmsUil
	1cbR4bTH7kv3hXAVJOgHQJjUtqByW/JZzLkoVDWW21CPd3mybx/Sz4bOA5WdvZwHrSwWC1o3CkcjL
	rdD5pE9SDyZ+qEI6C+4+MBO+BM3u2b5X4pFHFeL1PBhM+Y4MAZjYsWFTinqtL+g8jIhxG3zxWB6+k
	na7YpFqSw==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lh6Mw-0053zn-0j; Thu, 13 May 2021 08:06:54 +0000
Received: from bombadil.infradead.org ([2607:7c80:54:e::133])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lh6Mu-0053zR-HX
 for linux-mediatek@desiato.infradead.org; Thu, 13 May 2021 08:06:52 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=Content-Type:Cc:To:Subject:Message-ID
 :Date:From:In-Reply-To:References:MIME-Version:Sender:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description;
 bh=QctHHCbUmE9SKQZkFUYr3/NvHKRxwu7+aZMbj4K6Y0s=; b=oKyXnzpi9Z6Lsbl0d4gyAxIwqs
 XLQPH7D/yQMfQKqksYcI/LP0Qveq0Kd5fBBeR3m2hECknMeGO9AsgC9DyiP4RG4jcIASgHIaigIZN
 QzgYpAoVJ0RQZ79Db9rzza95yh3SLq9j0EeaaivbiRMznpeeb9A8OWfW5pN3q5CSZ2YZYlF5TIYXY
 MwRoMxQt5gGm0wCspJD+poCMiCKUIyoTWCqrHERuIhKikNjuIULYgnf2L1mS2QlG8Azbx1c+/wdvV
 ackUdUcZ55OqCAz0eG6yFQaueE4oWKJQRBdi0CQh9ePf0lxhyDIX915xJncMK9oJnK36poWRG81He
 graRgEpg==;
Received: from mail-lj1-x232.google.com ([2a00:1450:4864:20::232])
 by bombadil.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lh6Ms-00B64b-1n
 for linux-mediatek@lists.infradead.org; Thu, 13 May 2021 08:06:51 +0000
Received: by mail-lj1-x232.google.com with SMTP id c15so18282135ljr.7
 for <linux-mediatek@lists.infradead.org>; Thu, 13 May 2021 01:06:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=QctHHCbUmE9SKQZkFUYr3/NvHKRxwu7+aZMbj4K6Y0s=;
 b=UrrG78ANjwlxHajiwC6dWsS3HzweOg606bt2lUOLuehAG0yrzClCg+WnQ0OA8yEZ78
 47htgMiPMZbkfnutDCbgJjY/yD2njfUY02gXJjoSBRfX8TE2VQqMxdBldwSqe75XwGoS
 WLbz2hWUhZieap36G1eSpFvx0qXG3MmxZqtUY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=QctHHCbUmE9SKQZkFUYr3/NvHKRxwu7+aZMbj4K6Y0s=;
 b=L/giZMH6udv51kEykSAGCtB20b+kULeslI5hiJj/7WR9AlRb/kDJkDI6cCey/VlpXZ
 yjb8tJj9nZYuxh+z5a8XEhO0FocepXLtUAs5j4fc2E77myUl6yvXylwTV2EXoYQVqbHE
 iqJfa5xLt1XlDDJ8IVBJ6Jg02I6HngWEAA9ZNOHVJ7ihwOtpc58Pto1BrSLf9co1ucQE
 GB8D8tUjpKnXrDK31s9X3KyMqiMuCQHZNITj6xaH3XT5s4z48hC3UFiwP2I+nHFqIFGr
 zxLXjGFsujUrwHDcqv7Aa6onX9aPJOUDD1kzuiYiVRmY82c3BZjB+vkHXCxQcf0NXuAA
 0AZQ==
X-Gm-Message-State: AOAM5328wNWwX8/C+5ys8EhJqq04zmTHav4NH198Dggt6SMzQvERxgI3
 5R2Yt8vijva7Ia8rwXaKJhwu3wo+441L1Q==
X-Google-Smtp-Source: ABdhPJwdUKX84idQmNu+1mUlIsavosyxB/lBc5Imq8lReDEIG+BZCEzCYYlF1hdvAeUA1tbRCoandA==
X-Received: by 2002:a2e:8005:: with SMTP id j5mr33209507ljg.336.1620893208090; 
 Thu, 13 May 2021 01:06:48 -0700 (PDT)
Received: from mail-lf1-f54.google.com (mail-lf1-f54.google.com.
 [209.85.167.54])
 by smtp.gmail.com with ESMTPSA id z12sm214865lfr.106.2021.05.13.01.06.47
 for <linux-mediatek@lists.infradead.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 13 May 2021 01:06:47 -0700 (PDT)
Received: by mail-lf1-f54.google.com with SMTP id c3so37400433lfs.7
 for <linux-mediatek@lists.infradead.org>; Thu, 13 May 2021 01:06:47 -0700 (PDT)
X-Received: by 2002:a19:550a:: with SMTP id n10mr14675259lfe.403.1620893207308; 
 Thu, 13 May 2021 01:06:47 -0700 (PDT)
MIME-Version: 1.0
References: <20210427111526.1772293-1-acourbot@chromium.org>
 <34782bc5-d891-8eef-d370-6cfcc547166a@xs4all.nl>
In-Reply-To: <34782bc5-d891-8eef-d370-6cfcc547166a@xs4all.nl>
From: Alexandre Courbot <acourbot@chromium.org>
Date: Thu, 13 May 2021 17:06:35 +0900
X-Gmail-Original-Message-ID: <CAPBb6MVykfSzXEA5_CWBpr84QduNDx24-aaf=0MUfxKcK69N1g@mail.gmail.com>
Message-ID: <CAPBb6MVykfSzXEA5_CWBpr84QduNDx24-aaf=0MUfxKcK69N1g@mail.gmail.com>
Subject: Re: [PATCH v4 00/15] media: mtk-vcodec: support for MT8183 decoder
To: Hans Verkuil <hverkuil-cisco@xs4all.nl>
Cc: Tiffany Lin <tiffany.lin@mediatek.com>,
 Andrew-CT Chen <andrew-ct.chen@mediatek.com>, 
 Rob Herring <robh+dt@kernel.org>, Yunfei Dong <yunfei.dong@mediatek.com>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 Linux Media Mailing List <linux-media@vger.kernel.org>, 
 LKML <linux-kernel@vger.kernel.org>, 
 "moderated list:ARM/Mediatek SoC support" <linux-mediatek@lists.infradead.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210513_010650_111367_D4A2D3A7 
X-CRM114-Status: GOOD (  21.16  )
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

On Thu, Apr 29, 2021 at 4:35 PM Hans Verkuil <hverkuil-cisco@xs4all.nl> wrote:
>
> On 27/04/2021 13:15, Alexandre Courbot wrote:
> > This series adds support for the stateless API into mtk-vcodec, by first
> > separating the stateful ops into their own source file, and introducing
> > a new set of ops suitable for stateless decoding. As such, support for
> > stateful decoders should remain completely unaffected.
> >
> > This series has been tested with both MT8183 and MT8173. Decoding was
> > working for both chips, and in the case of MT8173 no regression has been
> > noticed.
> >
> > Patches 1-9 add MT8183 support to the decoder using the stateless API.
> > MT8183 only support H.264 acceleration.
> >
> > Patches 10-15 are follow-ups that further improve compliance for the
> > decoder and encoder, by fixing support for commands on both. Patch 11
> > also makes sure that supported H.264 profiles are exported on MT8173.
>
> For a v5 I would recommend that - where possible - these 'improve compliance'
> patches are moved to the beginning of the series. That way they can be picked
> up quickly without having to wait for the whole series to be accepted.

Makes sense, the current order reflects the chronology these patches
have been written, but I agree that improving compliance should be
merged first. Let me try to reorder things a bit.

Cheers,
Alex.

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
