Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7E7F3EED61A
	for <linux-mediatek@archiver.kernel.org>; Fri, 15 Sep 2023 16:51:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=C9N4U7m1ENfkMXf6AuPL4MT6Lni4JryuzWdzOGtlKI8=; b=4rUoHUm9QMySWb4CG+aBlX55jq
	oMFhVzBXvtsZw1aGzIupci1MV3ZCWmF7+FrfHc8p2mlfVWynBl2NVZ8Nmj4zFH8OkhgXhXhxS1LSc
	b2Pbj3o4TKGlahlkeek7C8dPwQv2yDMcjnuUBcTjiwO1J98WMHCJMIgx1UsHkO5FdHwj0qr3yRW7L
	qmqBIK0rnJXSZ3ElQALf4+2lOYsNuEL77TOHsnURFojxNrGi+5afiDdpa69+H/a80rFx80JHTdGX6
	YUGKn/EGk6vOVpyvvn8zhgxu0JP/0GAHdcCre87GNj444YIJTcKU4eF2+SS+YRy7Qpou4VHvvQPkn
	X2kaWa2Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qhC23-00B4zg-20;
	Fri, 15 Sep 2023 16:51:03 +0000
Received: from mail-pj1-x102e.google.com ([2607:f8b0:4864:20::102e])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qhC20-00B4yp-2k;
	Fri, 15 Sep 2023 16:51:02 +0000
Received: by mail-pj1-x102e.google.com with SMTP id 98e67ed59e1d1-274b45fa7a2so174718a91.0;
        Fri, 15 Sep 2023 09:51:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1694796659; x=1695401459; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=C9N4U7m1ENfkMXf6AuPL4MT6Lni4JryuzWdzOGtlKI8=;
        b=ay5KeaP42ltBYMDU+prw3fOEpfIVGRVBO43zkMvb+TPFvGMcbP7eCuVncFWk5N84cs
         RvP5AEaxBhSsNgnYZTvftMEcc+K8Z9NT6JQZolcFZqqUopkZzl6u370GgP/dm6Wb/69G
         M92+qoBtHFR4scAhi56hqMsMivjSAqBdOXvNBgr/KmfIl0v/nCYWsXX1Y1Z1rPNOCdZl
         hNMyuKgoVBv7B+NHnOKvhoOlNzp/ARZf9mB1ew96kuoTC+3rqEGlETZ9+m8X89MP2V2+
         IB46w9u19iuo+8pBr1zBG+kwcM9N4ohH5Dkp4NIsgbltGQOUnFKICBYdBGuVd3gtP3OM
         Q6ZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1694796659; x=1695401459;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=C9N4U7m1ENfkMXf6AuPL4MT6Lni4JryuzWdzOGtlKI8=;
        b=Ca4Dpw5CSWo9BbMUDjCAHDvlSuf8tDy1XscJfFel4lCJMWe+GDOL+utQygGSQxsWMN
         2HjrCmYSY2sdtQgR6/Su22+3RRoOcn8cwRMES4chUazgiOU/knALnT4UD1qSRIDGQR+6
         3xe65A1bncGCpGWomif/AHKQRONBtm1rYc8X6BDY1+RRHgdAnEUklszyLhmahTT3Q/m4
         mcFAvxInqUZtgrwIEqLdZiPdVLU3vQide/fgWJ9Zh7yfgrLPTsgdbOSiUq5Imo4EsiSF
         E/NMyUDq7AP2Uxtq1cZHdW8+dV0qy8maWpNP8t7e92WrXVe0jSVDoZA4F0S6CdgiK8wO
         6TTQ==
X-Gm-Message-State: AOJu0Yz9iUGSO3g2HDb4GkmoyJCG28bzvCQ7c00P04Si+MMVcli+NV5J
	mSGp2w+D5CJ6BcBby0mFpWwlJ71zeX6qXmcJ01A=
X-Google-Smtp-Source: AGHT+IGbqKZHfQYVZyeiRIfx3Rau8VcK1iGF77tUw+uQyQtNqnu5UagzuHOH8rpnQb8Ka+6MLiQbWH8tpwggqtgwVnk=
X-Received: by 2002:a17:90a:f312:b0:273:e42b:34c1 with SMTP id
 ca18-20020a17090af31200b00273e42b34c1mr1902942pjb.42.1694796659560; Fri, 15
 Sep 2023 09:50:59 -0700 (PDT)
MIME-Version: 1.0
References: <CA+fCnZePgv=V65t4FtJvcyKvhM6yA3amTbPnwc5Ft5YdzpeeRg@mail.gmail.com>
 <20230915024559.32806-1-haibo.li@mediatek.com>
In-Reply-To: <20230915024559.32806-1-haibo.li@mediatek.com>
From: Andrey Konovalov <andreyknvl@gmail.com>
Date: Fri, 15 Sep 2023 18:50:48 +0200
Message-ID: <CA+fCnZfuaovc4fk6Z+p1haLk7iemgtpF522sej3oWYARhBYYUQ@mail.gmail.com>
Subject: Re: [PATCH] kasan:fix access invalid shadow address when input is illegal
To: Haibo Li <haibo.li@mediatek.com>, jannh@google.com
Cc: akpm@linux-foundation.org, angelogioacchino.delregno@collabora.com, 
	dvyukov@google.com, glider@google.com, kasan-dev@googlegroups.com, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	linux-mediatek@lists.infradead.org, linux-mm@kvack.org, mark.rutland@arm.com, 
	matthias.bgg@gmail.com, ryabinin.a.a@gmail.com, vincenzo.frascino@arm.com, 
	xiaoming.yu@mediatek.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230915_095100_896020_705A12E3 
X-CRM114-Status: GOOD (  13.94  )
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

On Fri, Sep 15, 2023 at 4:46=E2=80=AFAM 'Haibo Li' via kasan-dev
<kasan-dev@googlegroups.com> wrote:
>
> The patch checks each shadow address,so it introduces extra overhead.

Ack. Could still be fine, depends on the overhead.

But if the message printed by kasan_non_canonical_hook is good enough
for your use case, I would rather stick to that.

> Now kasan_non_canonical_hook only works for CONFIG_KASAN_INLINE.
>
> And CONFIG_KASAN_OUTLINE is set in my case.
>
> Is it possible to make kasan_non_canonical_hook works for both
> INLINE and OUTLINE by simply remove the "#ifdef CONFIG_KASAN_INLINE"?

Yes, it should just work if you remove the ifdefs in mm/kasan/report.c
and in include/linux/kasan.h.

Jann, do you have any objections to enabling kasan_non_canonical_hook
for the outline mode too?

> Since kasan_non_canonical_hook is only used after kernel fault,it
> is better if there is no limit.

