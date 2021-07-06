Return-Path: <SRS0=SroS=L6=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_ADSP_CUSTOM_MED,DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AD083C07E96
	for <linux-mediatek@archiver.kernel.org>; Tue,  6 Jul 2021 11:00:44 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 83E67619B6
	for <linux-mediatek@archiver.kernel.org>; Tue,  6 Jul 2021 11:00:44 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 83E67619B6
Authentication-Results: mail.kernel.org; dmarc=fail (p=reject dis=none) header.from=google.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=o1jHEFgU2BKS0HahMbqcqhIP1JlytJK2ZqzpvekFhyE=; b=MSlWsgevIg9E+8
	x7d1N/5Tm2J57R/Yhfg5fFFLeTMfoV7qUsi/mi5UgWal/APd2yU6kjNeGHQ2nsDLh8c8Ey4HOkYPf
	9swXwQoh/fZoP3vU0hM7D8Nd4GXrJndO8XwlPxDwmk7bRaF00y5ZUpDn12q9el3afU92Ktclnj4SQ
	0WajIaLLAP2lHx/nQyTk3pL3k/4VuyzDv3IG7xdGHwRraWK2zu3wBUphYcXihUqfUSgt738IOQiSh
	1yX2XCTJraOkC74sOlXf/H4GC0tCix9nX4QZcLf3w2Wepo/gc1SMM+PeJts7iSjhqCpfzx5dOJa9r
	AF/a8kBuOMnMdi2okkkA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1m0ioc-00B8wG-5i; Tue, 06 Jul 2021 11:00:34 +0000
Received: from mail-io1-xd2b.google.com ([2607:f8b0:4864:20::d2b])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1m0ioY-00B8ue-D9
 for linux-mediatek@lists.infradead.org; Tue, 06 Jul 2021 11:00:32 +0000
Received: by mail-io1-xd2b.google.com with SMTP id k16so24305474ios.10
 for <linux-mediatek@lists.infradead.org>; Tue, 06 Jul 2021 04:00:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=85+RRGhjODs6lcH6FGoMJhqGI1UPU1GAYsHb+vDqTGI=;
 b=kcovIMeHxj6d6wLhZ9CMLTwalFGptJT2AhB7Kp8+N3lEiQHjcOsi4c2/ggoM58tdcA
 S39evUYCjLYP/6eY51tHdYzEl7GOPaCwr4GDqXkXsPX8vcgOnyZayFPvuuHaqGicqH61
 hz/Nd9JWKB44kz3d3Ng4CIVm8WfbT8v4gGRO0MY0A/XoVjyEgchrXD/v3OQ221bUbNYi
 NLK8xNdebbXAGR9KxoKq23Bz2yrx34YbloODkjeLElxtCbe6P/joEzomSRM0tCH4xJYt
 cIXImUDQsVOe6upPw/A9lDbU7dRsRQjbq6yJYUCpzbGrNfMzTILlcc6ydf2sg7pNfe8X
 wlkA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=85+RRGhjODs6lcH6FGoMJhqGI1UPU1GAYsHb+vDqTGI=;
 b=IxpurE+IxbPDKyh0Ege9e6VrjyKDhD7umpw3r1qEEtHqRGdnRsr4SGsuNIKOegwpna
 NhWv0cA5iiFkW1zIRORZaSJo95iLkk/V3faKhhxB7ObwHqPDL40eXiNMnw7DqwClTpUr
 pHyT14bRc7KgEvVJnLAlxAzp6BbAWW6llW8fIebo8xltsew58AedW0FOjt+fArRg2Dal
 8Yapdy6Skqz6N+OKw2XT34J52l7U7xqkabYW+HEbAByiS0rH1iFLdVw8fB7EqQYUKjLI
 hPg2PjZ/iqv62GW/4GPpboB7PmA6z1DVyv00L9hiw5mxYIjFDp6IJ8mQ9bFaTyFGudWq
 yfMQ==
X-Gm-Message-State: AOAM533dYDYbsXvhTwZ2tTgqNMCTR1Cn0nQMObh4P05nEvvHbaAalJ2h
 sCm7J9C4lXs8yBZUIgWI3c8+J13AoQ7MSyv2iFM91g==
X-Google-Smtp-Source: ABdhPJwYqdX4uXaVnVQi0XP4/rzQ+1UfhvfYjksjrP95PYtkRwbQIPBuuu2IAg0m0BTSZ7BHhytyyXcXKrSXS2nUkA0=
X-Received: by 2002:a5d:87d0:: with SMTP id q16mr15428748ios.109.1625569227924; 
 Tue, 06 Jul 2021 04:00:27 -0700 (PDT)
MIME-Version: 1.0
References: <1625038079-25815-1-git-send-email-kyrie.wu@mediatek.com>
In-Reply-To: <1625038079-25815-1-git-send-email-kyrie.wu@mediatek.com>
From: Tzung-Bi Shih <tzungbi@google.com>
Date: Tue, 6 Jul 2021 19:00:17 +0800
Message-ID: <CA+Px+wVQFK1MXbq6=x7gSfRu8uRp5hbiNgSWtJ-9ok3Lt+vz8A@mail.gmail.com>
Subject: Re: [PATCH v2,0/9] Support jpeg encode for MT8195
To: "kyrie.wu" <kyrie.wu@mediatek.com>
Cc: Hans Verkuil <hverkuil-cisco@xs4all.nl>,
 Mauro Carvalho Chehab <mchehab@kernel.org>, 
 Rob Herring <robh+dt@kernel.org>, Bin Liu <bin.liu@mediatek.com>, 
 Matthias Brugger <matthias.bgg@gmail.com>, Tzung-Bi Shih <tzungbi@chromium.org>,
 Project_Global_Chrome_Upstream_Group@mediatek.com, 
 linux-media@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-mediatek@lists.infradead.org, Tomasz Figa <tfiga@chromium.org>, 
 xia.jiang@mediatek.com, maoguang.meng@mediatek.com, 
 srv_heupstream@mediatek.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210706_040030_497998_0CF494DC 
X-CRM114-Status: GOOD (  12.34  )
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

On Wed, Jun 30, 2021 at 3:28 PM kyrie.wu <kyrie.wu@mediatek.com> wrote:
> add component framework to using multi-HW for MT8195 jpeg encode.
Could you add some summary for each patch for getting an overview of the series?

>   dt-bindings: mediatek: Add mediatek, mt8195-jpgenc compatible
>   media: mtk-jpegenc: Add MT8195 JPEG venc driver
>   media: mtk-jpegenc: remove redundant code of irq
>   media: mtk-jpegenc: Refactor jpeg clock interface
>   media: mtk-jpegenc: Generalize jpeg encode irq interfaces
>   media: mtk-jpegenc: Generalize jpegenc HW timeout interfaces
>   media: mtk-jpegenc: Use component framework to manage each hardware
>     information
>   media: mtk-jpegenc: Generalize jpegenc HW operations interfaces
>   media: mtk-jpegenc: Refactor jpegenc device run interface
The series has some consistency issues which would make readers feel
uncomfortable.

For example:
- Whether to capitalize the first characters in the commit messages/titles.
- Whether to add a period at the end of English sentences.

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
