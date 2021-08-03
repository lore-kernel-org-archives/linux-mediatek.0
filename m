Return-Path: <SRS0=vV1m=M2=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.5 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9F950C4320A
	for <linux-mediatek@archiver.kernel.org>; Tue,  3 Aug 2021 11:57:27 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 6AB3960ED6
	for <linux-mediatek@archiver.kernel.org>; Tue,  3 Aug 2021 11:57:27 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 6AB3960ED6
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=chromium.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=zodGc5Duf3G3mp42uSHMaHvETGXEGp2P8hS6e9mtYC0=; b=lLsjbmQtlG49cg
	RZzwWVTPVQIjIQrNfE17tQvJjS5VXmG2dQIUcU8OZacwDVVGNGi8UqbZ118NondvgpVDwGzN9CKM2
	vN+Yq7GRrcIFNbnGrQk09A2K/S5FFq0JqtOtXXxtRZL8AakrUNNKMMM3v4MLLJheKG+2090UGV03E
	pxHSQh0GdmTWeb8YTj/HpVBFZgy361/Ztdu1q9eA3DKE/H58AtJKMGEopwQy1Xh1/ENgqqIJ/X1SO
	3DNzfIfyBnGgV+a/Lh25R17aNUfp2Ql0qHd6Io6xTVUQMwcL9fxK8ZYgGB6HcTTslLl1DuPY+tt2X
	DUDKCFgi+wSpFk8TYdvg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mAt2p-002RJM-43; Tue, 03 Aug 2021 11:57:15 +0000
Received: from mail-lj1-x230.google.com ([2a00:1450:4864:20::230])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mAsxp-002PKU-Lw
 for linux-mediatek@lists.infradead.org; Tue, 03 Aug 2021 11:52:07 +0000
Received: by mail-lj1-x230.google.com with SMTP id u13so2876203lje.5
 for <linux-mediatek@lists.infradead.org>; Tue, 03 Aug 2021 04:52:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=etK0elpS05hz7Km273394Meji45lu69rkvmUfpsPSIQ=;
 b=Tfds44W/7N6OvbAyP0TRdJLdBh4VucrnQroHeSiqwZDxfmA/2aGndP7kOTFdbAzzVv
 qffehGnqve2NBSPHMYGdm9DisaX3EvAc4/s09ESqikbBbjAv9wW0b59PQCadqWSEVKKC
 Rty/MzA4FfFXkICzwfYucun6omh3dosNSMpc4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=etK0elpS05hz7Km273394Meji45lu69rkvmUfpsPSIQ=;
 b=m8G9UyxIUJmXTM05xtd/ORsvoA5CyxJPUlOJVjIjwQFOK4ZOB9Lffw/6LxXFkfM7oN
 Na1IFmPf24yMDxVTyevWuSzjDUY8E0J+lvoEWpAQwBtsyrplEiosxHHTwyJa4cbnORhO
 4YQZ7yRzLUe62LgCLlU9yJD9aIvUKCX6RIn+nhD+n3qSU0BWHxe+EwRfddf8yrJ27OfS
 EwqbYcqHVK3eIVEk7HrAs5/VeF2EWqcv+ivq+B8n+ibASD5LZJms0tVW09aHHHoJEKhc
 nv0RgqpLXCskpWfEsqZnmjRoe1uixouro22TJTB5Jl+vkSKTK8VhydJLDXJ7F+UudssS
 E/4A==
X-Gm-Message-State: AOAM533kED+HXoCKdQ2Zx3libg8ZuwWiKP0B+My8v72m+uV1rqq3P9ym
 upPByx8MOc0UzaYSHTiXToCC3v/lItGSeQ==
X-Google-Smtp-Source: ABdhPJw8WOW2Fiiajs5r2RKVNEeCdKpprVlOp+b89DfNJXvQdrZ20qrw0RJ7kbO7yYcp4XeouHQxRQ==
X-Received: by 2002:a2e:bc21:: with SMTP id b33mr14409095ljf.188.1627991523914; 
 Tue, 03 Aug 2021 04:52:03 -0700 (PDT)
Received: from mail-lj1-f179.google.com (mail-lj1-f179.google.com.
 [209.85.208.179])
 by smtp.gmail.com with ESMTPSA id d3sm1062423lji.101.2021.08.03.04.52.03
 for <linux-mediatek@lists.infradead.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 03 Aug 2021 04:52:03 -0700 (PDT)
Received: by mail-lj1-f179.google.com with SMTP id a7so27793919ljq.11
 for <linux-mediatek@lists.infradead.org>; Tue, 03 Aug 2021 04:52:03 -0700 (PDT)
X-Received: by 2002:ac2:4433:: with SMTP id w19mr6028378lfl.30.1627991219371; 
 Tue, 03 Aug 2021 04:46:59 -0700 (PDT)
MIME-Version: 1.0
References: <20210802121215.703023-1-eizan@chromium.org>
 <20210802220943.v6.7.I2049e180dca12e0d1b3178bfc7292dcf9e05ac28@changeid>
 <CAFqH_527RL56P=zEg7yTaeeqTvFOjT3ThxpX-Qumk25dR6+-bA@mail.gmail.com>
In-Reply-To: <CAFqH_527RL56P=zEg7yTaeeqTvFOjT3ThxpX-Qumk25dR6+-bA@mail.gmail.com>
From: Eizan Miyamoto <eizan@chromium.org>
Date: Tue, 3 Aug 2021 21:46:42 +1000
X-Gmail-Original-Message-ID: <CAOak1e90y_2aaD4ssH9WfqUUXjUSWkN_rLW51NujkD7oMayhew@mail.gmail.com>
Message-ID: <CAOak1e90y_2aaD4ssH9WfqUUXjUSWkN_rLW51NujkD7oMayhew@mail.gmail.com>
Subject: Re: [PATCH v6 7/9] media: mtk-mdp: use mdp-rdma0 alias to point to
 MDP master
To: Enric Balletbo Serra <eballetbo@gmail.com>
Cc: linux-kernel <linux-kernel@vger.kernel.org>,
 Chen-Yu Tsai <wenst@chromium.org>, 
 Houlong Wei <houlong.wei@mediatek.com>, Yong Wu <yong.wu@mediatek.com>, 
 Enric Balletbo i Serra <enric.balletbo@collabora.com>,
 devicetree <devicetree@vger.kernel.org>, 
 Chun-Kuang Hu <chunkuang.hu@kernel.org>,
 Andrew-CT Chen <andrew-ct.chen@mediatek.com>, 
 Matthias Brugger <matthias.bgg@gmail.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>, 
 Minghsiu Tsai <minghsiu.tsai@mediatek.com>, 
 Linux ARM <linux-arm-kernel@lists.infradead.org>, 
 Linux Media Mailing List <linux-media@vger.kernel.org>, 
 "moderated list:ARM/Mediatek SoC support" <linux-mediatek@lists.infradead.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210803_045205_761362_FDC340A2 
X-CRM114-Status: GOOD (  11.07  )
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

Hi Enric, thanks for your comment.

> > ... Instead of depending on the presence of a mediatek,vpu property in
>
> Looks like there is something missing in the commit message?

That line is a continuation of the commit message header, I.e., it's
meant to read:
"use mdp-rdma0 alias to point to MDP master Instead of depending on
the presence of a mediatek,vpu property in the device node"

Eizan

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
