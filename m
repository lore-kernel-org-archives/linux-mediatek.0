Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 42E93C10DCE
	for <linux-mediatek@archiver.kernel.org>; Thu,  7 Dec 2023 11:15:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=+1zKx8JGuByRmZeIzOLjwU47rnrPjKnk2Jj1ReloFCE=; b=tcJtXxwsHXAqg/uiYcUdZEgQoG
	Djed/kthPB4yr8fkY4KYTMrb3AupXu46XZM2MrldMTWADYyexLnpPOSVhU7lCVEa8syrrxtSFRFkw
	E9xDo3TCTFEVUh5/BXcWZ/NZqE/g2cLtpXloIKHxrnAasAfruDG/1oDeLfL7DjLW16KYnfeA+R48p
	hoPmaynXeJMvLOS7W0IjHkQ1HtJSnELn0JocFtvrUAt4JnPYIy4x5otg5rd1YU06kskW5pMlL8FKs
	PTFEdIq6i8UlS5/vrHEjzrhUFaZTRXwGp7u1LXZXfbGSWgDHDfEhrCZ7ZugMtbHbbAlziaHTMwNhX
	3ah9xLOQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rBCLb-00CYPb-0F;
	Thu, 07 Dec 2023 11:15:15 +0000
Received: from mail-vk1-xa2c.google.com ([2607:f8b0:4864:20::a2c])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rBCLY-00CYMi-1Q
	for linux-mediatek@lists.infradead.org;
	Thu, 07 Dec 2023 11:15:13 +0000
Received: by mail-vk1-xa2c.google.com with SMTP id 71dfb90a1353d-4affeacaff9so159759e0c.3
        for <linux-mediatek@lists.infradead.org>; Thu, 07 Dec 2023 03:15:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1701947710; x=1702552510; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=+1zKx8JGuByRmZeIzOLjwU47rnrPjKnk2Jj1ReloFCE=;
        b=htzTgZ3OsHLGtpNUvH/AJqMO7Ro7dq6qQjFtFFNamFm2rFsW/+WNYNsTp8g3tFKobK
         y3uInwuTKVOO9IHe0IwYp64L3KSJREbYBKrr2S8LWxYN+wzniKWQpIxIhAmd//ax+lJU
         Zabq5d/OS8RpFAFWKq+U36uJoRJwJLcjM1NcM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701947710; x=1702552510;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=+1zKx8JGuByRmZeIzOLjwU47rnrPjKnk2Jj1ReloFCE=;
        b=i9N8LeqU/uLffLEgTb/SkGxmVMnE5KOI1GWqZCQpOhMGgMTbgHVqFCcDzls8A7hfL+
         b3X5TAFIJx7k4Zkl63mRkPyvGypuShNo1TVjDPg3tQkNoIJjgPXG7uLjgcNcAdaLmitl
         mkg1j37jJ824on1CEgHxmJt6BE4BtASkW8166Y4KUxVZIsxmjdEjGqVvIroTK/lFAYmU
         Fj9iJCHwwhc1ZS9b1+gu9g64o1m5y1KOLGC+HLT1zXvaXwjONibFq4BJHl0VouR/pt3+
         GjvKItnISvzdDKjHwqk7DySM4CKu1E8I3l2inIINL44g50JQeaPePX6T4RgdHvuZaUu4
         ki+g==
X-Gm-Message-State: AOJu0YzaGXTDU+KY7t14uJH6qKoW5gAbqSf8qF+6UlMxs+LtmpBN2Juf
	uofzzSz1rBXwBN+05BZZewMmxCYom9zcD0MKOYE=
X-Google-Smtp-Source: AGHT+IGgZ0b2xgqWH4WWJnxf70DbbbZTK3uTFaPID8f17J9msOpIGHtwWFMguxGhQKQ0/uPh0J5Lkw==
X-Received: by 2002:a05:6122:c94:b0:4b2:c554:e9ba with SMTP id ba20-20020a0561220c9400b004b2c554e9bamr2886787vkb.28.1701947710202;
        Thu, 07 Dec 2023 03:15:10 -0800 (PST)
Received: from mail-vk1-f182.google.com (mail-vk1-f182.google.com. [209.85.221.182])
        by smtp.gmail.com with ESMTPSA id r11-20020a056122014b00b0049d4f588b1asm50348vko.49.2023.12.07.03.15.08
        for <linux-mediatek@lists.infradead.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 07 Dec 2023 03:15:09 -0800 (PST)
Received: by mail-vk1-f182.google.com with SMTP id 71dfb90a1353d-4b2eaa89796so166730e0c.0
        for <linux-mediatek@lists.infradead.org>; Thu, 07 Dec 2023 03:15:08 -0800 (PST)
X-Received: by 2002:a05:6122:30a2:b0:49a:6dc0:5a89 with SMTP id
 cd34-20020a05612230a200b0049a6dc05a89mr2860131vkb.5.1701947707983; Thu, 07
 Dec 2023 03:15:07 -0800 (PST)
MIME-Version: 1.0
References: <20231113123049.4117280-1-fshao@chromium.org> <20231113123049.4117280-3-fshao@chromium.org>
 <3528639f-85a3-4756-b04b-c233f6c84276@collabora.com>
In-Reply-To: <3528639f-85a3-4756-b04b-c233f6c84276@collabora.com>
From: Fei Shao <fshao@chromium.org>
Date: Thu, 7 Dec 2023 19:14:31 +0800
X-Gmail-Original-Message-ID: <CAC=S1nibsNfo7Ans2J0aiXqJSz5-iTPh2NwTEuUL8-HUM0AJdw@mail.gmail.com>
Message-ID: <CAC=S1nibsNfo7Ans2J0aiXqJSz5-iTPh2NwTEuUL8-HUM0AJdw@mail.gmail.com>
Subject: Re: [PATCH 2/4] media: mediatek: vcodec: Drop unnecessary variable
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: Hans Verkuil <hverkuil-cisco@xs4all.nl>, Andrew-CT Chen <andrew-ct.chen@mediatek.com>, 
	Matthias Brugger <matthias.bgg@gmail.com>, Mauro Carvalho Chehab <mchehab@kernel.org>, 
	Nicolas Dufresne <nicolas.dufresne@collabora.com>, 
	=?UTF-8?B?TsOtY29sYXMgRi4gUi4gQS4gUHJhZG8=?= <nfraprado@collabora.com>, 
	Tiffany Lin <tiffany.lin@mediatek.com>, Yunfei Dong <yunfei.dong@mediatek.com>, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	linux-media@vger.kernel.org, linux-mediatek@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231207_031512_506487_319E9866 
X-CRM114-Status: GOOD (  12.31  )
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

Hi Angelo,

On Wed, Dec 6, 2023 at 6:19=E2=80=AFPM AngeloGioacchino Del Regno
<angelogioacchino.delregno@collabora.com> wrote:
>
> Il 13/11/23 13:26, Fei Shao ha scritto:
> > It's unclear why only mem->size has local copies without particular
> > usage in mtk_vcodec_mem_alloc() and mtk_vcodec_mem_free(), and they
> > seem removable.
> >
> > Drop them to make the code visually consistent, and update printk forma=
t
> > identifier accordingly.
> >
> > Signed-off-by: Fei Shao <fshao@chromium.org>
>
> That's probably just about personal preferences, as mem->size is not expe=
cted
> to change during the flow of those functions.
>
> That said, as much as you, I prefer not having this local copy as it's us=
ing
> (a very small amount of) memory for no real reason anyway, so:

Yes, and I think I should have mentioned this in the commit message...
I'll revise that in the next version.

Thanks,
Fei





>
> Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collab=
ora.com>
>
>

