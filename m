Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 84F67E784A7
	for <linux-mediatek@archiver.kernel.org>; Mon,  2 Oct 2023 03:32:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=EWv/fAJ8KXJqmxtsUaOg9Lo1TrGsfrhH4MozFvJpS0M=; b=4MTO15jYTOdFbRucf/lNDUM3od
	1TuPf+pEPkv1sa7b07JUmEDahfIcrdFjy5D6R1k7hymO7QmgAkdZDrBfHnIOx/KKPwCL1aVci2AHY
	rAlJ7HxQYQ/24AQjO5+g5L+5kanPTkypNt2jvw3Nex4uFJJ0n9horSduaOQGqQrHNJoBMMSCeI3JW
	vKCY7dmvVA/BPsnU4xkCMVKPnAGd0L34hS7GZrjhSuRBJeV6gvz3kB8QQIIMT2IRV6mPDmtidoZyk
	vylRny/tMD6eHul1SIl7XvdbFYRSKbc1E/J2XKlAYfak3O09n/NGfxvLQlGgOhxv1Y1HDZnM/RFTp
	cEeUH1fA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qn9fE-00BtuL-0B;
	Mon, 02 Oct 2023 03:32:08 +0000
Received: from mail-lj1-x235.google.com ([2a00:1450:4864:20::235])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qn9fB-00BttR-0v
	for linux-mediatek@lists.infradead.org;
	Mon, 02 Oct 2023 03:32:06 +0000
Received: by mail-lj1-x235.google.com with SMTP id 38308e7fff4ca-2c12ae20a5cso247759591fa.2
        for <linux-mediatek@lists.infradead.org>; Sun, 01 Oct 2023 20:32:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1696217520; x=1696822320; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=EWv/fAJ8KXJqmxtsUaOg9Lo1TrGsfrhH4MozFvJpS0M=;
        b=Sc6Eprpvg2CFDzuvxsGd4oWUROnVAGXNCk2q8ouCl7AyWHSiyHdF5GL7a7vWUyIK3y
         DGznLfLJ+yQ3Utj1DIGcJTtubdItYcl/gI6spv6zhSI9UtL6YI/rCLU5e0TyF/Jkijd+
         ZLSBNM52S/Un6jt6QIMFc4VpGmHTHnxa++pU0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1696217520; x=1696822320;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=EWv/fAJ8KXJqmxtsUaOg9Lo1TrGsfrhH4MozFvJpS0M=;
        b=bNaNhTWoMHUYkXqN7arU/5uaftt1QG/gdTWeLT5E5Pjyr4pX0Q5JVpc4ZOhybVTAgU
         M/XjlOJ1NkawYh5ZtzdKsCSoBxHJf1y/cnebcdXNi/Qk/6I+De83Mx6pBknnhgN85zc2
         vW3pIcxbmXVDe9AVQOPdtZIyAP4I17oTgV/xl/+5Kqxz+9hEAvhb+F9fJWOdzGJ07BcT
         5Kk/8JGm2zqs8C7Yu1FRHV55rPMknM0rqSWLqQUmzUGQoDXTBA83xMHuTwrxb8SZJx+q
         M4w9iPFoZU6+vU9WgMd8FUH6gyK0I13gmpXqUB3jtxHLNH7cFdLlHb8OcZkJQ9QoO+8D
         l43Q==
X-Gm-Message-State: AOJu0YzRN9rfyRJFWtIWnLR/8v025AwcTZx3UzvV8Ckbnxw/zfxjqMP2
	1wXsdsDIvvkbP0my2+NZkDWQUw9PKTWX/2sqaEmSRw==
X-Google-Smtp-Source: AGHT+IHA/+yPyNmWeR7RlmC08qBdT/8fj4Ys1puQzDzqaq+77KqxGiTyXpFVIt9j9xUiIEMQNJy+1PX4h78yu3Mw35g=
X-Received: by 2002:a05:6512:b8b:b0:4ff:aeef:b582 with SMTP id
 b11-20020a0565120b8b00b004ffaeefb582mr10046958lfv.66.1696217520317; Sun, 01
 Oct 2023 20:32:00 -0700 (PDT)
MIME-Version: 1.0
References: <20230929082009.71843-1-angelogioacchino.delregno@collabora.com> <52BBF3AC-ED0B-4B5B-8773-E7C3E0DBED73@public-files.de>
In-Reply-To: <52BBF3AC-ED0B-4B5B-8773-E7C3E0DBED73@public-files.de>
From: Chen-Yu Tsai <wenst@chromium.org>
Date: Mon, 2 Oct 2023 11:31:49 +0800
Message-ID: <CAGXv+5GLG0UErUyzVExjfpOiVx=JmBs_FRgj=jsXYwcv6duLZA@mail.gmail.com>
Subject: Re: [PATCH] MAINTAINERS: Add Angelo as MediaTek SoC co-maintainer
To: frank-w@public-files.de
Cc: linux-mediatek@lists.infradead.org, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, linux-kernel@vger.kernel.org, 
	nfraprado@collabora.com, matthias.bgg@gmail.com, robh@kernel.org, 
	amergnat@baylibre.com, arnd@arndb.de
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231001_203205_346721_F7C25E0C 
X-CRM114-Status: GOOD (  18.67  )
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

On Sat, Sep 30, 2023 at 3:55=E2=80=AFPM Frank Wunderlich
<frank-w@public-files.de> wrote:
>
> Am 29. September 2023 10:20:09 MESZ schrieb AngeloGioacchino Del Regno <a=
ngelogioacchino.delregno@collabora.com>:
> >I am a top reviewer mainly for MediaTek SoC related patches in most
> >subsystems and I've also been upstreaming both improvements, fixes
> >and new drivers and devicetrees when required.
> >
> >The MediaTek scene saw a generous increase in number of patches that
> >are sent to the lists every week, increasing the amount of required
> >efforts to maintain the MTK bits overall, and we will possibly see
> >even more of that.
> >
> >For this reason, and also because of suggestions and encouragement
> >coming from the community, I'm stepping up to be a co-maintainer of
> >MediaTek SoCs support.
> >
> >Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@col=
labora.com>
> >---
> >
> >P.S.: I tried to reach to Matthias for almost two months, but I couldn't
> >find any way to talk to him and he has been unresponsive on the mailing
> >lists as well.
> >
> >P.P.S.: This also comes after Rob Herring's suggestion to have myself as
> >a MediaTek SoC co-maintainer [1] and support from other people.
> >
> >[1]: https://lore.kernel.org/all/20230804225813.12493-1-robh@kernel.org/
> >
>
> Hi,
>
> Thank you Angelo for supporting Matthias here. I also have no information=
 why his tree is stale for more than 2 months and also got no response on d=
irect contact. I hope he is still ok and do only need some free time.
>
> I waiting for these to be merged:
>  https://patchwork.kernel.org/project/linux-mediatek/list/?series=3D76129=
3   https://patchwork.kernel.org/project/linux-mediatek/list/?series=3D7777=
12
>
> Do you have created an own tree from matthias' one or can you directly wo=
rk on it? If working on own tree please send me the link,so that i can trac=
k when changes (also from others) are merged.

It's likely going to be under a new namespace. Matthias used his own
namespace, which is not shared.
AFAIK the kernel.org git infrastructure doesn't allow others to push
to a user's namespace.

> regards Frank
>

