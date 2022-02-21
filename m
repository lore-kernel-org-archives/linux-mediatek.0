Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C4164C433EF
	for <linux-mediatek@archiver.kernel.org>; Mon, 21 Feb 2022 10:35:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ra2fl6D6E3D8QJR2bGRX7bw6eZLYNMdCTjLZpeR4srw=; b=hp6pvYKpPMcR0G
	hHFFiFv03eWNIoJBOe4Z8h27XB7TB41k0adKuC2tOj2Ik6wai5/lZLDJQ2/nTHH8mqnQxCfzoSHHo
	4VPGuoCpE/jThVKtjAAZy9m//dI6mbwwQsdhANIon23H0GfciDKRYXGUrm9N2jA5ZYTPsEJxIhDmn
	JQSPYErQ9na/opAu7zrvJYg1VExtNz6XiHAgyyx1Y7O76gPP2ycdaA9UD1B0jt/8ZOPYUQBfABkrb
	dIWEvRSPKKwud5j/mdY8k/wcphqMPOyqdxXMVduVsp4j/SrcQeBTLE6kPoWHn35crdynj+TNY8Wy8
	javzK3Iq2d/gp3IR6Mjw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nM62C-004zVM-EJ; Mon, 21 Feb 2022 10:35:12 +0000
Received: from mail-yw1-x1136.google.com ([2607:f8b0:4864:20::1136])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nM5SZ-004ijA-Ga
 for linux-mediatek@lists.infradead.org; Mon, 21 Feb 2022 09:58:25 +0000
Received: by mail-yw1-x1136.google.com with SMTP id
 00721157ae682-2d641c31776so131686547b3.12
 for <linux-mediatek@lists.infradead.org>; Mon, 21 Feb 2022 01:58:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=2eHktmmt0PkDk6CLraSoVlcsRan7jcJUGHnpRXDCQ04=;
 b=H7/UrUOdRbce8sQw2RpFzn7uMvbVVdDt0g3qOad21EwoGC+Ad83x4dQFUzNpD1uWoE
 jcFM2i4O3BSz6X/IcOg1pZ/1HhX+iFLloQs0Tn0GMaYilDBKWgjI+4UrU9p6GpQbZy6h
 h8BVNFlrqQsZNlBg5wd9UhjQMMisuAe4IF23k=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=2eHktmmt0PkDk6CLraSoVlcsRan7jcJUGHnpRXDCQ04=;
 b=C3kA8N1lHXjwB+ArViZy1F/kFEKzAVp0o16dNnpnjdT3HJBiVfWuXdFQZC6QxN+f1M
 b6zwWSFSFn6LlaPxFqQO7/+nob9QDhP5LwVXIFtfBv+A5ha5S6KOB71jXROpB0nJostX
 7JJ6d3PMWA1dPjHvDlQXrI6B6Vx3CHET3PrrMndrLGXTCRqTQwZOJQ6tHYU+LkMULxpm
 zqXwyuySinNQAFbfhmS8uSU8ByTZyQ/OQCZI+9e3L9Pm26ZtqzJBt9QAtiVDp8l+Y0oe
 S17aIIKDiB1LkUO0fGFzj1RgvbsvZTKqLtfFqFRfN43lQhxJdj/PvjWTsUj4ia1vTfcu
 BGpA==
X-Gm-Message-State: AOAM532pdvE8sLlRvSJtjYd/Ed/OQP4+VpGT6gU17Bb7rAM7n8rx9trt
 U/eBIUOxoi7dri0FR8JuwLUzAk0/JMhtE6pdiRJf0w==
X-Google-Smtp-Source: ABdhPJzWDVfTXmYwYk7yxLYvEuw00wYztgloZbX0vxTDnjc2/iQC2gsSGREss62vQj9jqvxQSfLcrGRXd4Sj0X1WK5s=
X-Received: by 2002:a0d:d613:0:b0:2d6:227e:1a10 with SMTP id
 y19-20020a0dd613000000b002d6227e1a10mr18998317ywd.21.1645437502779; Mon, 21
 Feb 2022 01:58:22 -0800 (PST)
MIME-Version: 1.0
References: <20220210141931.291712-1-angelogioacchino.delregno@collabora.com>
 <20220210141931.291712-6-angelogioacchino.delregno@collabora.com>
In-Reply-To: <20220210141931.291712-6-angelogioacchino.delregno@collabora.com>
From: Chen-Yu Tsai <wenst@chromium.org>
Date: Mon, 21 Feb 2022 17:58:11 +0800
Message-ID: <CAGXv+5H0OkMk=1MZH3jCFSZbauJmEcgFADfDXDPf2r1wrp8wCw@mail.gmail.com>
Subject: Re: [PATCH 5/5] pinctrl: mediatek: common-v1: Commonize
 spec_ies_smt_set callback
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: sean.wang@kernel.org, linus.walleij@linaro.org, matthias.bgg@gmail.com, 
 linux-mediatek@lists.infradead.org, linux-gpio@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 kernel@collabora.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220221_015823_607793_67402526 
X-CRM114-Status: GOOD (  11.42  )
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

On Thu, Feb 10, 2022 at 10:21 PM AngeloGioacchino Del Regno
<angelogioacchino.delregno@collabora.com> wrote:
>
> All of the MediaTek pinctrl drivers registering with pinctrl-mtk-common
> that are offering a .spec_ies_smt_set() callback are declaring their
> own function which is doing exactly the same on all drivers: calling
> mtk_pconf_spec_set_ies_smt_range() with their struct and a simple check.
>
> Commonize this callback by adding the ies and smt structure pointers
> to struct mtk_pinctrl_devdata and changing the callback signature to
> take it.
>
> Removing the callback and checking for the existence of the spec_smt
> and/or spec_ies data would allow us to staticize the function
> mtk_pconf_spec_set_ies_smt_range(), but this solution was avoided as
> to keep flexibility, as some SoCs may need to perform a very different
> operation compared to what this commonized function is doing.
>
> Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>

Signed-off-by: Chen-Yu Tsai <wenst@chromium.org>

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
