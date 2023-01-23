Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 12D5FC05027
	for <linux-mediatek@archiver.kernel.org>; Mon, 23 Jan 2023 21:47:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=bNWIhXG5Qs/cS/Kge9YI8j6hmkwjT8WYdLmFW/zVK4w=; b=yQI1243egyJSiIYU6n/6tzbKhe
	nuMa6YRl4PC8NQKc+AT5xQDM5BZcqOBJx0928zhKl4bM74/2Y30FDBwwaGAlXP/0Y1LYY2Yc5v1RW
	gVZ7h2a0F3t2QuAFKu/ulTTzQahP2YC5EgXVObA6uheJVD+t62nMlUT7AlO2JFqn+Mbws1Pyy+aLs
	GahbhPkqAp0HJK6/041aAEIa4O9nO3kiNLHvBKMxGITzlHL3E/D949cc2kQQtLnKrCHDHkowa/t2+
	4f5pUvZqN3J0Dzl0SiOCULEaEWW7jARn0NX4KObPrM02i1L/gWyQpeXdwcwJuS4eoPgQhg99M1MAu
	SA4yawqA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pK4eu-001ZQo-Tt; Mon, 23 Jan 2023 21:47:20 +0000
Received: from mail-pg1-x52b.google.com ([2607:f8b0:4864:20::52b])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pK4ej-001ZOq-TZ; Mon, 23 Jan 2023 21:47:11 +0000
Received: by mail-pg1-x52b.google.com with SMTP id q9so10054917pgq.5;
        Mon, 23 Jan 2023 13:47:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=bNWIhXG5Qs/cS/Kge9YI8j6hmkwjT8WYdLmFW/zVK4w=;
        b=I7B2lxMUcvQhT40X7gb4E9g8d/+2yvoIvQPsuzDkL4AA4cW1bqp6w343ARp6DQfbwT
         HB3U72WxKcK+giXl0xs5676UFA9XgjB12Odip1XalFk/e5vF+mKLP4nOGNRroaNvaIR8
         bQULc65y7O643vmUGcx+yKNipka0DSjwXaUKRpFQQFUEMxNB40VjNcSx4PKmzwB8DVEw
         1tEQqvBnLTQR0eatpxCtHczDL+04sl34/X+XQhYhjCu+HOTafB2jcAMv4xtZ0SeBDdrK
         al/LEtk4+dRBBpVsUDSvLPYOYFIGdYO2xUdpySykEuAp4oqMQ8oqJUiC37vEOaowR6iR
         Lr1g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=bNWIhXG5Qs/cS/Kge9YI8j6hmkwjT8WYdLmFW/zVK4w=;
        b=HYwncgOUKhbi8yseDcds58uCNKo98kr02CbCGt1GSdBNy28wt+91aoq9lM0iD2+Vus
         +afs7h3iqriEb63lGVReyWfM95uwXLB1j6ChY6RbOZeYBFx7yT/4lxAMXf32Xvrgxt35
         0ya3JX94CVwRtn4nmC8QLg+eYdq4IH8syz46VQZWhVCs9dR5m4aqAtU5/X8JlsXzY8wY
         L23kJiq2oAi+0NpF9HaiwsBkGBk1I4xFCVSKCVF+nx3u4W0bwt0ZYhksONI07QsDYoEB
         OJMQtJFqi8ItmjVQ9J87j76/52mgF02zUcpSgTR8xZmqp2uUhFsOMTK2VR7OwgMTL73G
         00ng==
X-Gm-Message-State: AFqh2koSDJZ/NAuz37/XSi8FXUHP+sEZ9dTwYtUzGYccC2XnB5YGMu1I
	rmXfPehxB8zHBvgr2DGz3MC8Lo3EBSWhHTgTU7g=
X-Google-Smtp-Source: AMrXdXvCLUy1D+cqvlpSTKtU8PocxDNbqF6QFj2+8HllzwfzDCIJYpNZr9tmlhT2ybfJ9Z/22mQD7n4/o1qCikRXNcE=
X-Received: by 2002:a05:6a00:3496:b0:576:f9e2:a968 with SMTP id
 cp22-20020a056a00349600b00576f9e2a968mr3320171pfb.84.1674510427720; Mon, 23
 Jan 2023 13:47:07 -0800 (PST)
MIME-Version: 1.0
References: <20230118093832.1945-1-Kuan-Ying.Lee@mediatek.com>
In-Reply-To: <20230118093832.1945-1-Kuan-Ying.Lee@mediatek.com>
From: Andrey Konovalov <andreyknvl@gmail.com>
Date: Mon, 23 Jan 2023 22:46:56 +0100
Message-ID: <CA+fCnZcS-p5nCALg4-96cp+sXNZSvN_u=L+=xK+zaH2rigJMKw@mail.gmail.com>
Subject: Re: [PATCH v2] kasan: infer the requested size by scanning shadow memory
To: Kuan-Ying Lee <Kuan-Ying.Lee@mediatek.com>
Cc: Andrey Ryabinin <ryabinin.a.a@gmail.com>, Alexander Potapenko <glider@google.com>, 
	Dmitry Vyukov <dvyukov@google.com>, Vincenzo Frascino <vincenzo.frascino@arm.com>, 
	Andrew Morton <akpm@linux-foundation.org>, Matthias Brugger <matthias.bgg@gmail.com>, 
	chinwen.chang@mediatek.com, qun-wei.lin@mediatek.com, 
	kasan-dev@googlegroups.com, linux-mm@kvack.org, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230123_134709_972130_31C87028 
X-CRM114-Status: GOOD (  19.11  )
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

On Wed, Jan 18, 2023 at 10:39 AM Kuan-Ying Lee
<Kuan-Ying.Lee@mediatek.com> wrote:
>
> We scan the shadow memory to infer the requested size instead of
> printing cache->object_size directly.
>
> This patch will fix the confusing kasan slab-out-of-bounds
> report like below. [1]
> Report shows "cache kmalloc-192 of size 192", but user
> actually kmalloc(184).
>
> ==================================================================
> BUG: KASAN: slab-out-of-bounds in _find_next_bit+0x143/0x160 lib/find_bit.c:109
> Read of size 8 at addr ffff8880175766b8 by task kworker/1:1/26
> ...
> The buggy address belongs to the object at ffff888017576600
>  which belongs to the cache kmalloc-192 of size 192
> The buggy address is located 184 bytes inside of
>  192-byte region [ffff888017576600, ffff8880175766c0)
> ...
> Memory state around the buggy address:
>  ffff888017576580: fb fb fb fb fb fb fb fb fc fc fc fc fc fc fc fc
>  ffff888017576600: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
> >ffff888017576680: 00 00 00 00 00 00 00 fc fc fc fc fc fc fc fc fc
>                                         ^
>  ffff888017576700: fc fc fc fc fc fc fc fc fc fc fc fc fc fc fc fc
>  ffff888017576780: fc fc fc fc fc fc fc fc fc fc fc fc fc fc fc fc
> ==================================================================
>
> After this patch, slab-out-of-bounds report will show as below.
> ==================================================================
> ...
> The buggy address belongs to the object at ffff888017576600
>  which belongs to the cache kmalloc-192 of size 192
> The buggy address is located 0 bytes right of
>  allocated 184-byte region [ffff888017576600, ffff8880175766b8)
> ...
> ==================================================================
>
> Link: https://bugzilla.kernel.org/show_bug.cgi?id=216457 [1]
>
> Signed-off-by: Kuan-Ying Lee <Kuan-Ying.Lee@mediatek.com>
> ---
> V1 -> V2:
>  - Implement getting allocated size of object for tag-based kasan.
>  - Refine the kasan report.
>  - Check if it is slab-out-of-bounds report type.
>  - Thanks for Andrey and Dmitry suggestion.

Hi Kuan-Ying,

I came up with a few more things to fix while testing your patch and
decided to address them myself. Please check the v3 here:

https://github.com/xairy/linux/commit/012a584a9f11ba08a6051b075f7fd0a0eb54c719

The significant changes are to print "freed" for a slab-use-after-free
and only print the region state for the Generic mode (printing it for
Tag-Based modes doesn't work properly atm, see the comment in the
code). The rest is clean-ups and a few added comments. See the full
list of changes in the commit message.

Please check whether this v3 looks good to you, and then feel free to submit it.

Thank you!

