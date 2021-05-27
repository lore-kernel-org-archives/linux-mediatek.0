Return-Path: <SRS0=4IUA=KW=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.1 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 46DADC47089
	for <linux-mediatek@archiver.kernel.org>; Thu, 27 May 2021 10:10:50 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 0FC3C6135F
	for <linux-mediatek@archiver.kernel.org>; Thu, 27 May 2021 10:10:50 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 0FC3C6135F
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=chromium.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=+ja4ex0Ja+ImvtGiIV3avmy9MUUwyMlkhxs3jHGki/E=; b=CtldlK5ChR/U+t
	PfpVhs/yBkn+Vs+iMwOnCFwZQP88j6hMxGu3EnlRheuIVje4JeQeo3Vy1zgztkgmf8oFUNHn2x4iY
	KbJz3BtcGBfQ3svFiUyN9pdB7wj3Ofb/Y++9PxNxV5RgfMAwUAXMUJGuQoR8qi/PxXMzNu6mM9ZcC
	ff/3FVJ0jz5ovj673NNOm6fYqg8voQe/GbLCTcMw4Z1QG6F3qhrrvSs5BSvil2g4/y9c7yWpWNemQ
	6Fos1pD/2IRFZ2MvrcCQE1V+iB/iwcq6lJhZUkR2Ett/Mh/6xjJ3ekvCUwtcQ5IFNlCEeYWstX4cG
	Z16uTHDVCdUzfhjz84ZA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1lmCyM-004eho-78; Thu, 27 May 2021 10:10:38 +0000
Received: from mail-lf1-x130.google.com ([2a00:1450:4864:20::130])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1lmCyI-004ecm-FI
 for linux-mediatek@lists.infradead.org; Thu, 27 May 2021 10:10:35 +0000
Received: by mail-lf1-x130.google.com with SMTP id r5so7194674lfr.5
 for <linux-mediatek@lists.infradead.org>; Thu, 27 May 2021 03:10:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=x4yEjCZpjXjlLtm8fIGk3hS7YCL51ZB0U7PousVU3z0=;
 b=ehfhag2ColEd2R3+qduQ1URjFhb+8Dy6hnhyDGq+Z/YorltmfPecHA0Qzss59HJrj5
 6PzCTDrPNFTQmDDJI9s/Ic5C6WRxC1A2y+095uulcjneTfYYKOUIZeTUv+fv8EvvR86q
 0VemvTJREFYEOfXJ8XtOcP4X+X38X49UwA5ck=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=x4yEjCZpjXjlLtm8fIGk3hS7YCL51ZB0U7PousVU3z0=;
 b=D3NMWYaJVHMi+AiKRyZwcRZ6+TbQ2vK7WgncV/ZQSHksJsflutVJFPd6CshFVI3iv9
 osnMv+mY0/EBLAj4xXIJ5TFT5FLww6jwehCTr+t6em8q2WwSKEPgGxsZDPgfuWZGLr6i
 w8GAqTzuJdrMEuqvVM+L4KIJgfhZF3WucFoS6PbKbhnF09DpVV4Ha+5qxjXlqXiGfrQa
 Rt57JDSGc0dEWx2d5XOTeLX6FzStlbBcXrDtOXs1FyO3AA33HZaLFDm1YQh/H8EEV9BJ
 mg2TD79ROdf07ihIlYRgAgXS5u4QEWgp85GpMOMRnwzfvae5iM1XEGkYRHIaUH6wG5H5
 ARyA==
X-Gm-Message-State: AOAM533Iv4b3Y5Lj6Lqah+d2WI/YLjF7X7qOGco34+GOsjflCgkIp4N3
 UpOgvCkpeTH6ZnNYE+J2gCFOBZaXwU0rKQ==
X-Google-Smtp-Source: ABdhPJwAOuo/bnRzJRgudkZ/Mqn2c/0D4okojcI7cKWKzHBRLX3P13MNHmg7Mo3EFx2YQw5jAPwlkQ==
X-Received: by 2002:a05:6512:159:: with SMTP id
 m25mr2014062lfo.594.1622110230310; 
 Thu, 27 May 2021 03:10:30 -0700 (PDT)
Received: from mail-lf1-f47.google.com (mail-lf1-f47.google.com.
 [209.85.167.47])
 by smtp.gmail.com with ESMTPSA id t7sm173953lfe.170.2021.05.27.03.10.29
 for <linux-mediatek@lists.infradead.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 27 May 2021 03:10:29 -0700 (PDT)
Received: by mail-lf1-f47.google.com with SMTP id w33so7178716lfu.7
 for <linux-mediatek@lists.infradead.org>; Thu, 27 May 2021 03:10:29 -0700 (PDT)
X-Received: by 2002:a19:6102:: with SMTP id v2mr1818325lfb.403.1622110228818; 
 Thu, 27 May 2021 03:10:28 -0700 (PDT)
MIME-Version: 1.0
References: <20210519143011.1175546-1-acourbot@chromium.org>
 <20210519143011.1175546-6-acourbot@chromium.org>
 <CA+Px+wUaA9o+Aom4weuTH4TDpCfFpxv0YHDArCJswEs6QmCw0A@mail.gmail.com>
In-Reply-To: <CA+Px+wUaA9o+Aom4weuTH4TDpCfFpxv0YHDArCJswEs6QmCw0A@mail.gmail.com>
From: Alexandre Courbot <acourbot@chromium.org>
Date: Thu, 27 May 2021 19:10:16 +0900
X-Gmail-Original-Message-ID: <CAPBb6MXnv0g5knZ_KNhTKkwyRh29zQWqKV-vyA+dQyDn4qkMGA@mail.gmail.com>
Message-ID: <CAPBb6MXnv0g5knZ_KNhTKkwyRh29zQWqKV-vyA+dQyDn4qkMGA@mail.gmail.com>
Subject: Re: [PATCH v5 05/14] media: mtk-vcodec: venc: support START and STOP
 commands
To: Tzung-Bi Shih <tzungbi@google.com>
Cc: Tiffany Lin <tiffany.lin@mediatek.com>,
 Andrew-CT Chen <andrew-ct.chen@mediatek.com>, 
 Hans Verkuil <hverkuil-cisco@xs4all.nl>, 
 Dafna Hirschfeld <dafna.hirschfeld@collabora.com>,
 Yunfei Dong <yunfei.dong@mediatek.com>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 Linux Media Mailing List <linux-media@vger.kernel.org>, 
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, 
 "moderated list:ARM/Mediatek SoC support" <linux-mediatek@lists.infradead.org>,
 Hsin-Yi Wang <hsinyi@chromium.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210527_031034_534212_9493AF9E 
X-CRM114-Status: GOOD (  14.22  )
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

On Fri, May 21, 2021 at 10:37 PM Tzung-Bi Shih <tzungbi@google.com> wrote:
>
> On Wed, May 19, 2021 at 10:31 PM Alexandre Courbot
> <acourbot@chromium.org> wrote:
> > Signed-off-by: Alexandre Courbot <acourbot@chromium.org>
> > [hsinyi: fix double-free issue if flush buffer was not dequeued by the
> > time streamoff is called]
> > Signed-off-by: Hsin-Yi Wang <hsinyi@chromium.org>
>
> Per guideline[1]:
> > Notably, the last Signed-off-by: must always be that of the developer submitting the patch.
>
> In the case, should you provide another signed-off at the last line?
>
> [1]: https://www.kernel.org/doc/html/latest/process/submitting-patches.html#when-to-use-acked-by-cc-and-co-developed-by

IIUC the main author's signoff should come first, and you should not
sign patches twice. checkpatch.pl did not raise any objection, so I
suppose the current form is correct?

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
