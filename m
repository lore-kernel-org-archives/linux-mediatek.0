Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F23C1C25B0E
	for <linux-mediatek@archiver.kernel.org>; Fri, 19 Aug 2022 06:28:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=u1KqzyDRkxYnMy29Xf5MPFj+6FYZs5Pa7lqmHSKprJI=; b=t64lwgXsxQiR6DAvpUzWaucyBe
	FuPiOIqf4TuXOXMdteED7YOkc0jkJnK1OBpz8rPvO/8Cj9m6xjlRz6qM+df4Zu+vOu1ISAYd8Zx33
	4mo7dKXOjA/R7mmZnD9bE8z+0coiwqG6OhjHWCX2Ilidd+61ICbLlgFqTf05zDyNLIz8DaSDthESm
	92GjdD6D5Rh+OQhZURQfvpfTGJkQj3+8jUXgGKfYmVQGa2Xs60iFiNisG0Yoq5xO0qeSQUDAE7/Jk
	dJ/Jwj0tJr9mHLZUwhVmhQU2sAGoL0XxCxd3VYVIWQDz4Ilw2v2KH4hlz7h5DBiQ2HhisGomBJYIa
	hnIFMrIg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oOvUC-002VjB-Id; Fri, 19 Aug 2022 06:28:04 +0000
Received: from mail-qv1-xf31.google.com ([2607:f8b0:4864:20::f31])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oOvU1-002VG7-8u; Fri, 19 Aug 2022 06:27:54 +0000
Received: by mail-qv1-xf31.google.com with SMTP id m17so2746256qvv.7;
        Thu, 18 Aug 2022 23:27:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc;
        bh=u1KqzyDRkxYnMy29Xf5MPFj+6FYZs5Pa7lqmHSKprJI=;
        b=UJ6UF7fjJhXDPtm+29oVQnbPXtWwfXWAHN06xBCXVJIz2JlGAJaJDfuRvr1EIZvayi
         /uxsL9bzGgra1rgdUobYvTzzeCBbtg42mDy2AqD1f8BRBx3N/3iX7T28mItcaO6+MC/1
         KHhVoMyXfQ+rOpxIpiILU+YyAHbjBL2nKGrdUbMzPea4o73yTEilCKXLDx0lzIS5phZS
         MfxL5Juj5fT+jSQ7H6HyOHLFyBiQ7BVGi7jaBRYWl7N1/5lxQVvRT78bVutR5yrLdvaU
         fjg7VYcgk5IcU0N+mABZHaS8aea94euGkr0uhWqNNdbY1gKZvXPX3Uij6F7Phr2XDepc
         IS9g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc;
        bh=u1KqzyDRkxYnMy29Xf5MPFj+6FYZs5Pa7lqmHSKprJI=;
        b=GJaZxsn597fz2s+6XRqoUQfhcJWdaNIORfwUQUpG2pqjOfDjz58SDWIFjScs3gQeNN
         6x570jZqnVHvV7gvhIsDHR+NReOitZ92EXyk6sXoQYHXc8btlrprVssHHcoxhzzdSqtm
         l//wlW9AVL8ek7yk72PK6H0FpQEcODW9HOuJPv5SxbXFWxNp4XhdJysFUhKXpWDAoX0I
         wcoWQCoz8VnDQV8n1iuV6pZuCQuCBPuGwpsrIyUhsIfeXDxJiBCha4xC2+t7R7GS3BUs
         CE98JbYMoRlwc7anI6cnn16exY3CnbCyoLcNdAxXKWbxBTnf9NY/rRbj+EzQ9hu9wmMz
         OXZw==
X-Gm-Message-State: ACgBeo1poJWIpYSv8FlH7gw4iEXN4zn0rgX44prsC1yuBK02HylFwcYD
	uL6xzF76c72ZekCWYnvjGgbUll1BAaj0gEQ+uqo=
X-Google-Smtp-Source: AA6agR74TrdSjfocyJ/Cvt/8HWnKOmGRr4x/TIynE/dnpm/pgOS3/1ywVJtVhnS6rnthL1Dbz+ixroMopM/QhnWEs+8=
X-Received: by 2002:a05:6214:5290:b0:479:5df:e654 with SMTP id
 kj16-20020a056214529000b0047905dfe654mr5093449qvb.97.1660890469227; Thu, 18
 Aug 2022 23:27:49 -0700 (PDT)
MIME-Version: 1.0
References: <Yv8ezribLQbq5ggv@kili>
In-Reply-To: <Yv8ezribLQbq5ggv@kili>
From: Andy Shevchenko <andy.shevchenko@gmail.com>
Date: Fri, 19 Aug 2022 09:27:13 +0300
Message-ID: <CAHp75VcotcJzqc4iSwNTKcvF3vAYz6VUuMrsj7LF6mi6Xu8D=Q@mail.gmail.com>
Subject: Re: [PATCH] mfd: mt6370: add bounds checking to regmap_read/write functions
To: Dan Carpenter <dan.carpenter@oracle.com>
Cc: Lee Jones <lee@kernel.org>, ChiYuan Huang <cy_huang@richtek.com>, 
	Matthias Brugger <matthias.bgg@gmail.com>, ChiaEn Wu <chiaen_wu@richtek.com>, 
	linux-arm Mailing List <linux-arm-kernel@lists.infradead.org>, 
	"moderated list:ARM/Mediatek SoC support" <linux-mediatek@lists.infradead.org>, 
	kernel-janitors <kernel-janitors@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220818_232753_363937_DA564371 
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
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On Fri, Aug 19, 2022 at 8:25 AM Dan Carpenter <dan.carpenter@oracle.com> wrote:
>
> It looks like there are a potential out of bounds accesses in the
> read/write() functions.  Also can "len" be negative?  Let's check for
> that too.

...

> Fixes: ab9905c5e38e ("mfd: mt6370: Add MediaTek MT6370 support")

> From static analysis.  This code is obviously harmless however it may
> not be required.  The regmap range checking is slightly complicated and
> I haven't remembered where all it's done.

Exactement! I do not think this Fixes anything, I believe you are
adding a dead code. So, can you do deeper analysis?

-- 
With Best Regards,
Andy Shevchenko

