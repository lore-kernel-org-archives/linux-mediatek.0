Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5FE97C433EF
	for <linux-mediatek@archiver.kernel.org>; Thu, 13 Jan 2022 13:13:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=hemQDuHeNxGxvbtlUP3c2NmDc3g7OUBYBJU58mQIsbQ=; b=jT2jghDR1u0k3/
	779gLFUlJ2M8oLwVtWoW7k9tpsHcU89vdhqikB/YAsY2fTdSzPCitdKiR/HoG0Ip5holkgxPQ2Xkw
	om+eCLLwOiwm67MRc8li7LUMIid9x9S7xNIGIcLFQOhznSx5eVOCsLBNeu3xclIKDR34VG/QiR03m
	+IGLL+Tp7cd71h0VFY+KnYRp2QYtaxElLH39Aw1lNXMBkuLE/Xw/KwvMF7jfhP5G5c4jzuRWEm/yY
	feLUySYG1jxxWTq3si6StWhco7Fp/79VT+67aa8mkIx5EyzExrR26PRs2/1Xpw1iGY5MhqUdwNyla
	hR3EOEnq2yIOJvhbmhWA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1n7zv7-0063NQ-I0; Thu, 13 Jan 2022 13:13:37 +0000
Received: from mail-yb1-xb2e.google.com ([2607:f8b0:4864:20::b2e])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1n7zum-0063Fp-1N; Thu, 13 Jan 2022 13:13:23 +0000
Received: by mail-yb1-xb2e.google.com with SMTP id z22so14303505ybi.11;
 Thu, 13 Jan 2022 05:13:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=2g1mOmaucLb7XHs8JQUVqK6opVNl2Di7/j45TJR+WOs=;
 b=GUkpUVFLcgKxF9APCPN+kpP9/OgHaz3ibPzyeczCSWzl/VApI+iGGZcYDqvSgtz3PP
 GOYVr9+LmHsvoCh8KyhOxLq8jDf00dyNAoGIqH62Y2flIeUN+Mzsj8Hs6C8g7CHRt8di
 UGZ+NFc5kCHdgCRoVW4O5s9TWtT8sr4YONnBSXyK5PjVLMxMuN2WbksYpkkomFYy4HwT
 5Y0LPfRNOkUHbFCWJbf2azHgrxE7NH0qOS7qDJF6Kwa+IBzTfs3M4r4uMPggO1VZzCLZ
 AGk3DrXcTriTZhqluocUNWIa9s9+fVvuDUt9bI35ghl8pefvyjvGIuV2eYFdTAnPsNwd
 2WUA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=2g1mOmaucLb7XHs8JQUVqK6opVNl2Di7/j45TJR+WOs=;
 b=qN1Nf4Y90tYOIi3jV3Zf0VUTtEPSl5vVJH8rwpM3DtwBcctMg6IiHEAXk08617KfIr
 mGWkaN8EkhmpGuRbABm2Eh8igwDGf2odUHXB4yjSWBXG7FEnWhYDJo8a2Nt4ba8hnQNR
 YA+J281lTBHMAhqajpqB0EE24SIiQ2aBXywtqCSZ1KDeRa4esbbHoI2hSOxlsIxO9trQ
 AuCHMD2ympd0BD7NrbFsn0+vOhz/omahg3YjHz51XEsuCq/n5Twl9dHK7K6tDKQJ//48
 W+JHY9GEtny76FCBcDhWrW9/Qt7isyn/z0ofET5Ya8mlUd+/2lhudsNWyTyeiCE4+lEG
 iWSA==
X-Gm-Message-State: AOAM533DeLEMB2+5oXfDy+sFogdF3jN9fN+qkBtop9Xiqo8ClvvehG74
 LA3QbKfFuRLgJsBFrJJYUpZOE5MWfcysqkeO/tc=
X-Google-Smtp-Source: ABdhPJy6/bFgiqUi0Vw/oTvUtA1ZdJOqxBOpdRCOAxD3OyBZrdffGioQDjLfY1gmbMNtOi5Sw1oQ0oJ7FIxILzyauSs=
X-Received: by 2002:a5b:281:: with SMTP id x1mr5627475ybl.41.1642079593957;
 Thu, 13 Jan 2022 05:13:13 -0800 (PST)
MIME-Version: 1.0
References: <20220111002314.15213-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <20220111002314.15213-10-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <d66a7182-825f-b9a3-afc9-c0117ea846a2@xs4all.nl>
In-Reply-To: <d66a7182-825f-b9a3-afc9-c0117ea846a2@xs4all.nl>
From: "Lad, Prabhakar" <prabhakar.csengg@gmail.com>
Date: Thu, 13 Jan 2022 13:12:48 +0000
Message-ID: <CA+V-a8s9s9Q=-NiwZYhpUNuiHyTzREqzMrH60mkdcR9uUYN+2A@mail.gmail.com>
Subject: Re: [PATCH v2 09/13] media: mtk-vcodec: Drop unnecessary call to
 platform_get_resource()
To: Hans Verkuil <hverkuil-cisco@xs4all.nl>
Cc: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>, 
 linux-media <linux-media@vger.kernel.org>,
 Mauro Carvalho Chehab <mchehab@kernel.org>, 
 Tiffany Lin <tiffany.lin@mediatek.com>,
 Andrew-CT Chen <andrew-ct.chen@mediatek.com>, 
 Matthias Brugger <matthias.bgg@gmail.com>, Rob Herring <robh+dt@kernel.org>, 
 Andy Shevchenko <andy.shevchenko@gmail.com>,
 LAK <linux-arm-kernel@lists.infradead.org>, 
 "moderated list:ARM/Mediatek SoC support" <linux-mediatek@lists.infradead.org>,
 LKML <linux-kernel@vger.kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220113_051316_125145_691F5D8D 
X-CRM114-Status: GOOD (  10.62  )
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

Hi Hans,

On Thu, Jan 13, 2022 at 1:05 PM Hans Verkuil <hverkuil-cisco@xs4all.nl> wrote:
>
> Hi Prabhakar,
>
> I'm skipping this patch since if I am not mistaken this patch fixes this as well
> (as part of a larger overhaul):
>
> https://patchwork.linuxtv.org/project/linux-media/patch/20220113041055.25213-9-yunfei.dong@mediatek.com/
>
> I posted a PR for that series, so that's on the way in.
>
> Please confirm so I can mark your patch as Superseded.
>
Ack.

Cheers,
Prabhakar

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
