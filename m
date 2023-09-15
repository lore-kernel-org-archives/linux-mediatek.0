Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 05F98EED61A
	for <linux-mediatek@archiver.kernel.org>; Fri, 15 Sep 2023 17:04:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=LlAvjtLPcGmDg4A7voaF5Wo0HxRPXZyKmdzluEIsWow=; b=3RGfjS8E/qAIUwOAhj/0yLuBp+
	3O8C35cA5nsplirzmtTYLnJ3RWmE0++F4cPDRjYeNBxdoYxPqKjHuB8zvrN1k8XOfC8v6E8FGy6pZ
	DEribIcm+ItR68BGalxOlVXaDlRXHryRmrllJPqmgWkTtBc4xSCsJcPe+f5yeSkWVfuNXxwDP6tJc
	oqGNstDW7jzWUQIEzCkQk3IWvqbESvyeBRF1pGXjDgAtA6vpZIpjCM47c4foAUikcWXXmyXxqlvI9
	NtGV8LPsMYBdVCDbG+wJz498BHfp2u8Ir6YcWs6+RSGNfjc3gpwI3+SoZ1YSoqtlEcFY8Zy/Wlf5Z
	/JctlD8w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qhCFI-00B6az-2m;
	Fri, 15 Sep 2023 17:04:44 +0000
Received: from mail-wm1-x32a.google.com ([2a00:1450:4864:20::32a])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qhCFG-00B6ZT-16
	for linux-mediatek@lists.infradead.org;
	Fri, 15 Sep 2023 17:04:43 +0000
Received: by mail-wm1-x32a.google.com with SMTP id 5b1f17b1804b1-4009fdc224dso1215e9.1
        for <linux-mediatek@lists.infradead.org>; Fri, 15 Sep 2023 10:04:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1694797479; x=1695402279; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=LlAvjtLPcGmDg4A7voaF5Wo0HxRPXZyKmdzluEIsWow=;
        b=U1ACa62mq0hmRqk0fXAHEkUFOHk2BcXPA9YNwbuenQaSl0Jq+cUdjuIvHxRIeTS69g
         VGAJTKjAY1i5rI/iWanVZQ4naT+M4UPfXMHC8tgcElrlJRAT/vXleRSOO2iHFEUjjRjn
         pnciVzdiyiUkGsFV12TWqpoGA/XLdCHhHNQshNgeOxIhJuWRaJ0lxvjvIft3/kraZLnQ
         e7WKoU8QEFgh8Q5APBcZzVodCfXa8ZmUHLxsUUMzZh07HGBglDaT01UIwpZFzSkkSNPe
         /HdNJENZ+Ad6kr9hTHlDbGK34R26HFnXF/y4XvJTeU09rlvBEeNWqlPLrknH9CvH6nB7
         OQCQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1694797479; x=1695402279;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=LlAvjtLPcGmDg4A7voaF5Wo0HxRPXZyKmdzluEIsWow=;
        b=MpXVXzjfKRvLYgRwQFCDwVczSx5/QW2iT59mEgdssiGU01mxl4VNpclG3zpzAExBOk
         j/ZAhpypr7qLgD1z4K/4y2Svs1pls0H8s6pSU1YbcyBR0XzSYIY+1+X8sHiwAmpTXupp
         pyI1LH+hjD8MYqPIkT7SPMdLSM3fsfV2gOddG3825HzYZczFnHRoB2u6kQZV8+S4TFeV
         AnHIOFlAukg0oarZR9R3w+Z+WfvDAT9mtNDUfH9XbSpVeC1fiirnLovjYVeC7TgbAQNX
         +/uTAKMUBnXSoaTtWqERHwJwvJpwIRsX2uWbn1RJuuFe4EFEk/O/IMyLUyV7K9QdVB/C
         qL7g==
X-Gm-Message-State: AOJu0Yz1LCdtXhaUZ2ZaeL8FDzbf9RUjzsTzy+pvLKbDxYq36g5TQEUI
	yRwHNXi1VAMMRIodL35OuXtCjAN1bMSu+78C9UJ7jg==
X-Google-Smtp-Source: AGHT+IEonzgZqc+V81TNYkvowwdDOWM/CYqm2sY+5KYoHV7zxqDLiUjikh2qIP4geMp2o3XvkFv+g/ec00ROIhSqgW8=
X-Received: by 2002:a05:600c:1e07:b0:3f6:f4b:d4a6 with SMTP id
 ay7-20020a05600c1e0700b003f60f4bd4a6mr2391wmb.7.1694797479400; Fri, 15 Sep
 2023 10:04:39 -0700 (PDT)
MIME-Version: 1.0
References: <CA+fCnZePgv=V65t4FtJvcyKvhM6yA3amTbPnwc5Ft5YdzpeeRg@mail.gmail.com>
 <20230915024559.32806-1-haibo.li@mediatek.com> <CA+fCnZfuaovc4fk6Z+p1haLk7iemgtpF522sej3oWYARhBYYUQ@mail.gmail.com>
In-Reply-To: <CA+fCnZfuaovc4fk6Z+p1haLk7iemgtpF522sej3oWYARhBYYUQ@mail.gmail.com>
From: Jann Horn <jannh@google.com>
Date: Fri, 15 Sep 2023 19:04:00 +0200
Message-ID: <CAG48ez3GSubTFA8+hw=YDZoVHC79JVwNi+xFTQt9ssy_+O1aaw@mail.gmail.com>
Subject: Re: [PATCH] kasan:fix access invalid shadow address when input is illegal
To: Andrey Konovalov <andreyknvl@gmail.com>
Cc: Haibo Li <haibo.li@mediatek.com>, akpm@linux-foundation.org, 
	angelogioacchino.delregno@collabora.com, dvyukov@google.com, 
	glider@google.com, kasan-dev@googlegroups.com, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	linux-mediatek@lists.infradead.org, linux-mm@kvack.org, mark.rutland@arm.com, 
	matthias.bgg@gmail.com, ryabinin.a.a@gmail.com, vincenzo.frascino@arm.com, 
	xiaoming.yu@mediatek.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230915_100442_376801_127FB74D 
X-CRM114-Status: GOOD (  17.43  )
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
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On Fri, Sep 15, 2023 at 6:51=E2=80=AFPM Andrey Konovalov <andreyknvl@gmail.=
com> wrote:
> On Fri, Sep 15, 2023 at 4:46=E2=80=AFAM 'Haibo Li' via kasan-dev
> <kasan-dev@googlegroups.com> wrote:
> >
> > The patch checks each shadow address,so it introduces extra overhead.
>
> Ack. Could still be fine, depends on the overhead.
>
> But if the message printed by kasan_non_canonical_hook is good enough
> for your use case, I would rather stick to that.
>
> > Now kasan_non_canonical_hook only works for CONFIG_KASAN_INLINE.
> >
> > And CONFIG_KASAN_OUTLINE is set in my case.
> >
> > Is it possible to make kasan_non_canonical_hook works for both
> > INLINE and OUTLINE by simply remove the "#ifdef CONFIG_KASAN_INLINE"?
>
> Yes, it should just work if you remove the ifdefs in mm/kasan/report.c
> and in include/linux/kasan.h.
>
> Jann, do you have any objections to enabling kasan_non_canonical_hook
> for the outline mode too?

No objections from me.

