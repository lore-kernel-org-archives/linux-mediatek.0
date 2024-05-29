Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 387E9C25B7C
	for <linux-mediatek@archiver.kernel.org>; Wed, 29 May 2024 09:17:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=DhhdnnOXh6qGL5/6zvdk/VdVZmsP1nLae35wo137JWg=; b=G6q42NvcjaEjTi6Db/+ockhhzg
	C2//7EMHwrbVgm/SRUY1vy/LsTKQ7pjOVNmTGUmcXN+kfsdbRDRSFGp07tMV3XoHVv2e+lHcEBOA4
	EmRGSt3bQ9bJSREAy4ss4LvhDIU9I8IqgLZCcn500Jn7ABUOncGJ4iWtWoKINlfY87pqq1ovyD1Q0
	DEQa9z+s7X2fWLPXHS3rtJKxJURVdy1l8d40YjkNBazEpFABOBD/9jEscOxYp96EuXPRbYXmti8Bz
	uXoUQyhdCw6K06wiUnx/JmhaNX/mQmhCXQtkhjb8+T5LTewzsgfbWIr2gY+exY1xlJWa4eI1r4h2r
	sVq0GXnA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sCFQs-00000003alk-3rfd;
	Wed, 29 May 2024 09:17:18 +0000
Received: from mail-ed1-x536.google.com ([2a00:1450:4864:20::536])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sCFQp-00000003ak0-08Hq;
	Wed, 29 May 2024 09:17:17 +0000
Received: by mail-ed1-x536.google.com with SMTP id 4fb4d7f45d1cf-5789733769dso1107771a12.1;
        Wed, 29 May 2024 02:17:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1716974232; x=1717579032; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=DhhdnnOXh6qGL5/6zvdk/VdVZmsP1nLae35wo137JWg=;
        b=Eb2PCvD4J+ugjyy6arwNkzlCakNFqLp7V4qYucRS5GzFPp1jtSCSYpFl8zXXYjhxvN
         tFfYwcig1bHkgSXcjIe6pdillZjd/h5Pjh2NfSQxDJxgZOyPEKNqNRteQ1wBmZR1xcWN
         jJeYk6lTImbz1zJlbWHxi8rr0DT3DFpdTOjrOig+Av6WwkDtcErb5eYrCeawQSflIKjB
         oVD2W/0EnJEpOKhn6A9fBZYPARbOROAj8pHoW1UWuSSmOpoS4Tk8FV0aNlTd/t98+USJ
         Z6YcsBH88Q5r53v2PbZmlLJnxO+g0R5QA1VvG0bCVYNAruWrOEzvle8sHcb3CoPQ1IO+
         87uQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1716974232; x=1717579032;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=DhhdnnOXh6qGL5/6zvdk/VdVZmsP1nLae35wo137JWg=;
        b=NT/3qetR27GvnPtpxWrrcoftLmdxqg26+AmmVQxoqES4oTZ9UbM7Cf/0WF9lUlt5Om
         6PcbdLSQOD1f96AWMKSVKl5sMgN/Sj/ez3mVwKG4ujbTQe/v8bJHD6FVdLE0lQ+19xNO
         bVTlc89sB0nG5SZi+dmUV4r9e3cukl9XlKzEAoXkbI54Ec+1ols51HZqkP+AahA8ZRC6
         aFW+nBrJMuRmal1UlJMxxZR77ZhDtXSfbi68UjrjTUXzZYpRwoqGpqTkD/rU3z8fh2Dl
         xQSV86BvyhKkSHG/lO9jE4+7+d+O8YUoO0+rvFqGc8+pOoS5pcxTxHmQnj5tq8o52bWH
         3fng==
X-Forwarded-Encrypted: i=1; AJvYcCUCeu+7H5RW5JuYs6qd4W4T6/cfc3kXIpyj2JyoO7IXpRApJ16Ok/7/wfpF1bOjmXdIla89awQRS7HDQFAsiNiLjrR84CYBtHDaf/eiDZfZcSvCsy36UZpBya9wC2t/nWz5pE3uRRe+QVfH8Vn0XN4J+doEos2vebI=
X-Gm-Message-State: AOJu0YwN6oNROkOhFdQi03bubj8BmcaQloIX+2ykf7hOGg6LABN8gPyy
	AzuraOIJJvt+JiQ4UgPoKnmpb1TaDD0heGtGT8AB2K+pSiYPHGw5kW5EAfdFaXwl6kA9PhJjZT1
	4PM8QPvuhNexukV4vE8/4d/1hnPs=
X-Google-Smtp-Source: AGHT+IHGdwBKFS281WJKM1LepXLS87qJk4CkOo+icUfU1WShxVz0GmuGPZsuGmboZ5p2ros9zrvRRiQCXqmzCeTNR8M=
X-Received: by 2002:a17:906:718f:b0:a5a:7493:5b68 with SMTP id
 a640c23a62f3a-a642d95819emr140252866b.24.1716974232163; Wed, 29 May 2024
 02:17:12 -0700 (PDT)
MIME-Version: 1.0
References: <20240528194951.1489887-1-andy.shevchenko@gmail.com>
 <20240528194951.1489887-11-andy.shevchenko@gmail.com> <358b6488-3f7c-4378-a811-175b6c77290f@collabora.com>
In-Reply-To: <358b6488-3f7c-4378-a811-175b6c77290f@collabora.com>
From: Andy Shevchenko <andy.shevchenko@gmail.com>
Date: Wed, 29 May 2024 12:16:36 +0300
Message-ID: <CAHp75VfG__AA7bHd15-dg1UphkvzwpMN6eXzJXhyUDNW0a1_1w@mail.gmail.com>
Subject: Re: [PATCH v2 10/11] pinctrl: mediatek: Convert to use func member
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: Andy Shevchenko <andriy.shevchenko@linux.intel.com>, 
	Linus Walleij <linus.walleij@linaro.org>, Daniel Golle <daniel@makrotopia.org>, 
	linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org, imx@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, 
	linux-mips@vger.kernel.org, Dong Aisheng <aisheng.dong@nxp.com>, 
	Fabio Estevam <festevam@gmail.com>, Shawn Guo <shawnguo@kernel.org>, Jacky Bai <ping.bai@nxp.com>, 
	Pengutronix Kernel Team <kernel@pengutronix.de>, Sascha Hauer <s.hauer@pengutronix.de>, 
	Sean Wang <sean.wang@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>, 
	Paul Cercueil <paul@crapouillou.net>, Lakshmi Sowjanya D <lakshmi.sowjanya.d@intel.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240529_021715_099604_5B4E04F3 
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

On Wed, May 29, 2024 at 11:24=E2=80=AFAM AngeloGioacchino Del Regno
<angelogioacchino.delregno@collabora.com> wrote:
>
> Il 28/05/24 21:45, Andy Shevchenko ha scritto:
> > Convert drivers to use func member embedded in struct function_desc,
> > because other members will be removed to avoid duplication and
> > desynchronisation of the generic pin function description.
> >
> > Signed-off-by: Andy Shevchenko <andy.shevchenko@gmail.com>
>
> pinctrl: mediatek: moore: Convert to use func member

Sure, if I need a new version. Otherwise I hope Linus can tweak this
whilst applying.

> Then,
> Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collab=
ora.com>

Thanks!

--=20
With Best Regards,
Andy Shevchenko

