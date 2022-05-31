Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7A0A0C433EF
	for <linux-mediatek@archiver.kernel.org>; Tue, 31 May 2022 13:07:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=NK46mmeqMfSI+TRc2hk9TfTjiGmvJzbsMHWDU2ueFto=; b=xu/xxZVNrKV1y6
	9ZpU4pnZkC0aBg3ixiMTgyKNmmlEjaUmMEJ1kNvbQK/lkYfgY3e9baOlRlsdiJ0M4SIXYjXoVOCYt
	U5FPV+oHWlxkmi/e8Rc6HYYBlio2dOII7GLTDBo7nbqp5/NPqNRlOj6rinI3xxHr9HRIppR8dg8Eh
	6ALi2gxf5GN4xzDfs9onWbb7xI+sUKC4FRsvI+PLjuYpAXj95hzkn5dd0v+mC6379POj4SrqH9vDv
	PhMEjho73ReQ0YuJyHFQ/wWZCABjCNbhAK0xuisq3F4B0V7fj3go5CaRPdZIg8KlNwHP9sCmgH0DC
	o0OImi1rwFr5XkvT5nRQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nw1ab-00AyMk-Ri; Tue, 31 May 2022 13:07:13 +0000
Received: from ams.source.kernel.org ([2604:1380:4601:e00::1])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nw1a9-00AyCw-9m; Tue, 31 May 2022 13:06:46 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.source.kernel.org (Postfix) with ESMTPS id 5B252B80CA5;
	Tue, 31 May 2022 13:06:42 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2BE90C3411E;
	Tue, 31 May 2022 13:06:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1654002401;
	bh=fQyBKa6i2Oi/d6zUCqifTnGlCz1MKWwjMKnJhC5OgKU=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=JXv5yfghZk1tbSPMN2pXN+/znRFvMr95s0HVF2hqCp6bqeUeugg1kxs8H4LQtBht9
	 dJZaT5lNuD8kP3vI6JI24z3USrGb+1JRAzQXpcm57FqxndsTpzTa/zTBS+zRc462Lz
	 mKY54sWvSNREBI9oTsSsSembR9Uoi0cV1NKwCv2+Jg8yHYXtGro5xWFgR6bkS6vwhI
	 kquO7eJ1TXunLXG/cjdVsvSkVXWX+LYroWCQOASBj3HUEZdrHVLtDVk3ShwONZ4bxS
	 YeIzDMC9KW9blAgNNg+2bLKycmYnGos7yYCbyEuXJXtkMw2pHXrqxmDX/0Z8cNVref
	 H2SixmTqhF12Q==
Received: by mail-vs1-f51.google.com with SMTP id c26so13511442vsl.6;
        Tue, 31 May 2022 06:06:41 -0700 (PDT)
X-Gm-Message-State: AOAM532VxFm4XcFVkVQf1Q8cNySESqbJvFhpwIBh5xj97tJyh5k4Mua9
	i5y9RSpN8/i3mBYXaSabcGeO0IcOXsXyLz56oQ==
X-Google-Smtp-Source: ABdhPJzIzgHJ8nyxJIrzYvXYC2oWioOfU589jWLaAk9OWmEVsMAUlK4GGYDgQwFpI0Ejh52SgdHXc2ULtIxtWnWSJlk=
X-Received: by 2002:a05:6102:510b:b0:337:a739:ce7c with SMTP id
 bm11-20020a056102510b00b00337a739ce7cmr18125393vsb.53.1654002400089; Tue, 31
 May 2022 06:06:40 -0700 (PDT)
MIME-Version: 1.0
References: <20220531053358.19003-1-qun-wei.lin@mediatek.com>
In-Reply-To: <20220531053358.19003-1-qun-wei.lin@mediatek.com>
From: Rob Herring <robh+dt@kernel.org>
Date: Tue, 31 May 2022 08:06:28 -0500
X-Gmail-Original-Message-ID: <CAL_JsqJnir+qA1Cgm5ATzsAH-pMqQSychLG=JQyUQg02dYb8TQ@mail.gmail.com>
Message-ID: <CAL_JsqJnir+qA1Cgm5ATzsAH-pMqQSychLG=JQyUQg02dYb8TQ@mail.gmail.com>
Subject: Re: [PATCH] scripts: dtc: fix a false alarm for node_name_chars_strict
To: Qun-Wei Lin <qun-wei.lin@mediatek.com>
Cc: Frank Rowand <frowand.list@gmail.com>, Matthias Brugger <matthias.bgg@gmail.com>, 
	devicetree@vger.kernel.org, 
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, 
	linux-arm-kernel <linux-arm-kernel@lists.infradead.org>, 
	"moderated list:ARM/Mediatek SoC support" <linux-mediatek@lists.infradead.org>, casper.li@mediatek.com, 
	chinwen.chang@mediatek.com, kuan-ying.lee@mediatek.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220531_060645_543174_9CC1A422 
X-CRM114-Status: GOOD (  19.51  )
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

On Tue, May 31, 2022 at 12:34 AM Qun-Wei Lin <qun-wei.lin@mediatek.com> wrote:
>
> The function check_node_name_chars_strict issues a false alarm when
> compiling an overlay dts.
>
> /fragment@0/__overlay__: Character '_' not recommended in node name
>
> This workaround will fix it by skip checking for node named __overlay__.
>
> Signed-off-by: Qun-Wei Lin <qun-wei.lin@mediatek.com>
> ---
>  scripts/dtc/checks.c | 5 +++++

We don't take patches for dtc. You must send them to upstream dtc and
then it will be sync'ed to the kernel tree.

>  1 file changed, 5 insertions(+)
>
> diff --git a/scripts/dtc/checks.c b/scripts/dtc/checks.c
> index 781ba1129a8e..6ef4f2cd67b9 100644
> --- a/scripts/dtc/checks.c
> +++ b/scripts/dtc/checks.c
> @@ -325,6 +325,11 @@ static void check_node_name_chars_strict(struct check *c, struct dt_info *dti,
>  {
>         int n = strspn(node->name, c->data);
>
> +       if (streq(node->name, "__overlay__")) {
> +               /* HACK: Overlay fragments are a special case */

Not a hack IMO.

However, this should be checking for any node name starting with '__'.

Also, doesn't 'fragment@0' cause a warning about missing 'reg'?

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
