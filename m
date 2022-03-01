Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EBF10C433F5
	for <linux-mediatek@archiver.kernel.org>; Tue,  1 Mar 2022 06:47:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Q+or7B904B2fZRyzUZR3kgrSMB9DYBEQ5yrPET9Bzaw=; b=lIiP3HEzihBKA8
	n9HAf263HVh9+Is/UVrjV/N7yoLYlEJ/wG0zqkvhpmECWqpvMdMkI2NihTWp5Flxig3YVPdNniJ4s
	LiLJfYKoodbLzMNPkFUfrUMiD0JKh/tIetMrEwxk9SxSMHefTKH+q4fEyOJjPdOtH0xXLnpRzINLg
	IcNOQ2RpP739k6j/d75aMA+gqg+pEBQy89r4vaPsU3OZGHjOXjyMwCTfPpl/eW2P8zgdQdRb+bBep
	kYCsMw3UuTqQQmycZheDjqKQFRt6XyBYYA+PHRt7VH4TUe3YVQxleywH/HZRmeNDVSYggIUrOQiqb
	c5R9eC63dhXKu7y+qVmw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nOwIQ-00FC56-V5; Tue, 01 Mar 2022 06:47:42 +0000
Received: from mail-qt1-x831.google.com ([2607:f8b0:4864:20::831])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nOwIB-00FC0T-V5; Tue, 01 Mar 2022 06:47:29 +0000
Received: by mail-qt1-x831.google.com with SMTP id q10so9182639qtw.4;
 Mon, 28 Feb 2022 22:47:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=jlE+aw4vKQP7l4rMDwOyrdUiA+p3i6LYl1waIrS2FnY=;
 b=LK0pxIWS+C7nL82UcRra+sUQYOg3g9q51kLePI4iqnnsyMYo/deFFUIQWRWGhLoSil
 zLqlARYibdVb3+Ndqikvb4qbgre9TcF3muzIIm9/+KwT5vJk0nGmD25gEm+Cxn31r/nI
 UVPbduLqGDKOiG8UYVSXYsYoVqEbRn2Rg5bYiJTtrFmDrYC72TPWAbiFStPAFAytq8OZ
 EJq0274++kDkgqJJ8qwoRCbuMie0J+/7R5YB6U+oBouAEDYP0E85C10S5FLDK1WeFKQP
 6NX3SEIgwVMSxX0CfqF2Pe41KMXxzJLEa4JKafCr5718dL/UcYMAyqpFMvqbggo4UiTX
 1yuA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=jlE+aw4vKQP7l4rMDwOyrdUiA+p3i6LYl1waIrS2FnY=;
 b=m8TKN81GqTuSyLYrpDxiPamhTCYgIsXSNlR04R+Euv+kLzv7CO2A4O4dhMhMK3Q77Q
 3cUhksESujAgvAX1HoibaMJRDQrbjPfFPLA4Od7v1YqiAz7qiXoxhbpyEEdsXf0JRLgu
 DbR2/yhTjHU6hM+6YRfYeMoEtQl++rUBRHS3aTDedkFRD2nVEnTOynYTIxVDLOMGLcZM
 foBPG4JuSHlUKfKC1eiI0iRqrJzBpwjClgdIQMIdWPwHARIuKqDxgg7HwK947dTvwcV/
 b38jx/eOpeUGuMAubc1Bc3YsVI4i0rh2Xsqd+AStqcCwiCnZD9QcUqWHbFUoywLV83qa
 myfw==
X-Gm-Message-State: AOAM530A0/GDY9LYsHeHOmcENwC4epsflRIhDioy74glc/6vIly/jyOK
 JzYedkCGTFi2k3X3+3rAa6DX4JcgK1DOAtbJKBBwDTSXwnk=
X-Google-Smtp-Source: ABdhPJwPCa0jMqSrvLn61FRp2pIKH/PoSyey0WyJQSP95GLF/cLiU1nD6hdWqS3r8lgXiPbd4u4TV4u5GGEa1OuNHXM=
X-Received: by 2002:ac8:7f51:0:b0:2dd:3339:dfe5 with SMTP id
 g17-20020ac87f51000000b002dd3339dfe5mr18914162qtk.269.1646117246333; Mon, 28
 Feb 2022 22:47:26 -0800 (PST)
MIME-Version: 1.0
References: <20220301011507.15494-1-ilya.lipnitskiy@gmail.com>
In-Reply-To: <20220301011507.15494-1-ilya.lipnitskiy@gmail.com>
From: Sergio Paracuellos <sergio.paracuellos@gmail.com>
Date: Tue, 1 Mar 2022 07:47:15 +0100
Message-ID: <CAMhs-H-oqhGd2UrWN6OOPhmOqiOHhbvNvHwbc9gxF+zNSEBmjA@mail.gmail.com>
Subject: Re: [PATCH] MIPS: ralink: mt7621: use bitwise NOT instead of logical
To: Ilya Lipnitskiy <ilya.lipnitskiy@gmail.com>
Cc: John Crispin <john@phrozen.org>,
 Thomas Bogendoerfer <tsbogend@alpha.franken.de>, 
 Matthias Brugger <matthias.bgg@gmail.com>, Chuanhong Guo <gch981213@gmail.com>,
 "open list:MIPS" <linux-mips@vger.kernel.org>,
 linux-arm-kernel@lists.infradead.org, 
 "moderated list:ARM/Mediatek SoC support" <linux-mediatek@lists.infradead.org>,
 linux-kernel <linux-kernel@vger.kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220228_224728_031674_E0BF0C07 
X-CRM114-Status: GOOD (  10.55  )
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

Hi Ilya,

On Tue, Mar 1, 2022 at 2:49 AM Ilya Lipnitskiy
<ilya.lipnitskiy@gmail.com> wrote:
>
> It was the intention to reverse the bits, not make them all zero by
> using logical NOT operator.
>
> Fixes: cc19db8b312a ("MIPS: ralink: mt7621: do memory detection on KSEG1")
> Suggested-by: Chuanhong Guo <gch981213@gmail.com>
> Signed-off-by: Ilya Lipnitskiy <ilya.lipnitskiy@gmail.com>
> ---
>  arch/mips/ralink/mt7621.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)

Reviewed-by: Sergio Paracuellos <sergio.paracuellos@gmail.com>

Thanks,
    Sergio Paracuellos

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
