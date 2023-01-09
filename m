Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 24645C5479D
	for <linux-mediatek@archiver.kernel.org>; Mon,  9 Jan 2023 20:57:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=EI+HK5d2VVHprte9/R4H7nRhtttrT0pgRQ4cGp2gqIE=; b=uSYx70Uw5VplMHyQgy6pQxkGAQ
	g1LlmKB6IApz7G4jrrvjhA9CSX73mAvAI3P/kAc4oH0N4fq/EbNQvs+YRCqxzzRaqi+qXRrNlcVec
	wEpNabZ90tJfAwvwak1YMp8XIwW3WHUwHMFOQ2ODhWNzlZGN0WbhnX1NDomNaNoVSOGaMej4ezQ91
	jfgT26LTmrod4JuwzN3C/IvG70omgjQGCnbvZHknAS9TGjCgZqmbhiSaDRShWWxVPgblHV0xswhQ3
	M7VkpO5aJYLvyI45c2L4ulTaemuqRTtUdNIpBEnluDuD2xXFviLcLre/Mb/Fysk66Rp/bEPueOl5O
	PBicJG3w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pEzD7-0041pq-AN; Mon, 09 Jan 2023 20:57:37 +0000
Received: from mail-pg1-x52d.google.com ([2607:f8b0:4864:20::52d])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pEzBC-0040q5-JC; Mon, 09 Jan 2023 20:55:39 +0000
Received: by mail-pg1-x52d.google.com with SMTP id s67so6761662pgs.3;
        Mon, 09 Jan 2023 12:55:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=EI+HK5d2VVHprte9/R4H7nRhtttrT0pgRQ4cGp2gqIE=;
        b=XXSphh6WdemqNlaouq27ZMv9FP/uelVUYlorwcZLgqAYLkGmCZpoIMxcvLw17XqQlk
         Wq/rki201eF9da9X5SZjRnH7GUBOad2hD9nME7ux6bfICDszp0NTAoGgZjST8dPBU9+G
         +ZFmWlA6yHf3FEmbDRIWfg44SBnSMyDQgxkb/tvEfG1srLYwbSJfn9c96o2s+r6TSjT6
         H3adegRyMv9R2Dw43i668JZf5yOZ/EG0BOextW/2Py2wcB1n3OuHz6Z3AGINU8D0Zq6i
         uXuFYaX3t79fxm38YgA2HtmAMj1Jaa9W/62SfvD7oAOWMiuUv1dMC/CfSVan5XD+zdd1
         bAQg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=EI+HK5d2VVHprte9/R4H7nRhtttrT0pgRQ4cGp2gqIE=;
        b=k4GUuZTsleEP/us5iHpKROrUqCOn56vVQTHJBQmkuX+UbjtDJYkve/MOG+qa8IuhrZ
         a6wgvsRdMdkZnsnM/9VyowlnVY98c0CEUegKpIR3Lm1q3bfOliYR6IGm3ZGFE2SXwCTd
         iPGEGXW0Shc8cXf85Izei4rEJXP90X5mHF063R7yPc0xmn9c19KUE/ArE+JO/HQDnkSf
         wzVe0b66CBIAPGZhTxjJW8f9pDaH0oVY3mHui0ddoUF1eBwkS0rPh0sPwrhPwrvtPKNS
         D2CTBPcVUyfDhsuyhcXje8gwG33i78Gpvn7pAIbQUExAaT1i/K48EEuoHYRn5xV4kOBe
         x2QQ==
X-Gm-Message-State: AFqh2kpRpar/8K5xyJR7LddeiOEFsIZGp31X1DI8JrRKvqeWa4e6YfiI
	xBdF7Tvrz9o8LvZ8Ikceflv9FESct/8AelQAWsY=
X-Google-Smtp-Source: AMrXdXtBdjMC2XbkCbg/sKxAYKrMMuQrVmVkCfTKgQdKmZ+HbnKyM9ffUAKFBpYnQwb9R5I/d32LLW0gc4vI7HYioOE=
X-Received: by 2002:a65:6bc5:0:b0:478:31a5:3656 with SMTP id
 e5-20020a656bc5000000b0047831a53656mr3286091pgw.273.1673297736001; Mon, 09
 Jan 2023 12:55:36 -0800 (PST)
MIME-Version: 1.0
References: <20230103075603.12294-1-Kuan-Ying.Lee@mediatek.com>
 <CA+fCnZdk0HoWx6XCbTsiNhyR2Z_7zv5JUdgNs8Q_tV4GRkkmCg@mail.gmail.com> <dbaeb044c547ddb908bffdce4d2dfa0936805ef7.camel@mediatek.com>
In-Reply-To: <dbaeb044c547ddb908bffdce4d2dfa0936805ef7.camel@mediatek.com>
From: Andrey Konovalov <andreyknvl@gmail.com>
Date: Mon, 9 Jan 2023 21:55:25 +0100
Message-ID: <CA+fCnZfhH+XRU-Ywvb6WThjmwuSODfNV5fNxDpHY1enibdNYSQ@mail.gmail.com>
Subject: Re: [PATCH] kasan: infer the requested size by scanning shadow memory
To: =?UTF-8?B?S3Vhbi1ZaW5nIExlZSAo5p2O5Yag56mOKQ==?= <Kuan-Ying.Lee@mediatek.com>
Cc: "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, 
	"linux-mediatek@lists.infradead.org" <linux-mediatek@lists.infradead.org>, 
	=?UTF-8?B?UXVuLXdlaSBMaW4gKOael+e+pOW0tCk=?= <Qun-wei.Lin@mediatek.com>, 
	"linux-mm@kvack.org" <linux-mm@kvack.org>, 
	=?UTF-8?B?Q2hpbndlbiBDaGFuZyAo5by16Yym5paHKQ==?= <chinwen.chang@mediatek.com>, 
	"dvyukov@google.com" <dvyukov@google.com>, 
	"kasan-dev@googlegroups.com" <kasan-dev@googlegroups.com>, 
	"akpm@linux-foundation.org" <akpm@linux-foundation.org>, 
	"ryabinin.a.a@gmail.com" <ryabinin.a.a@gmail.com>, 
	"linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, 
	"vincenzo.frascino@arm.com" <vincenzo.frascino@arm.com>, "glider@google.com" <glider@google.com>, 
	"matthias.bgg@gmail.com" <matthias.bgg@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230109_125538_707104_28B6CFE1 
X-CRM114-Status: GOOD (  10.45  )
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

On Mon, Jan 9, 2023 at 6:02 AM Kuan-Ying Lee (=E6=9D=8E=E5=86=A0=E7=A9=8E)
<Kuan-Ying.Lee@mediatek.com> wrote:
>
> > Let's leave the first two lines as is, and instead change the second
> > two lines to:
> >
> > The buggy address is located 0 bytes to the right of
> >  requested 184-byte region [ffff888017576600, ffff8880175766c0)
>
> Did you mean region [ffff888017576600, ffff8880175766b8)?

Yes! Forgot to change the range. The idea is to refer to the requested
size in these two lines of the report.

