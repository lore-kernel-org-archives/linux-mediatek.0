Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 087FBC04A95
	for <linux-mediatek@archiver.kernel.org>; Wed, 28 Sep 2022 06:52:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=VKS/VF0CIgvcZvBFOPg/1OgyZ/pIlJ2/81i9icexORw=; b=arWhPeESEM0TjBWh+WRTXZqiyY
	3Nx2nKMkalfvZakHwNuK4l0ajPSxZfi3z7evtRqxVnlQRpqbTjEMouDjd82T8LfZ8VDUMD3V2eEL6
	1PzhHXXafX3+Lu77BaDW1ciVDGdc6YW2KyF14Cq8yX5iDUHcfVuo3Y/1YWjLz6cVQtd8n+shle6s/
	m4Kt0DnQna3wOY1ICJOlXTtfZ0ODxEmYE3pFqYSxPinKVcoPwo6qZVZv0CEkchhvRUACAC8ZMHP9H
	fDmEyIFWVwHEcc9c7dxWqCE6BXC0TCcE0ykgNglEw99au1kwgJ9B65GY9KDg0ecFHVmD/VqK81fUT
	ls1LRq9g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1odQv5-00ELMH-DV; Wed, 28 Sep 2022 06:51:47 +0000
Received: from mail-ej1-x634.google.com ([2a00:1450:4864:20::634])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1odQum-00ELDe-BF
	for linux-mediatek@lists.infradead.org; Wed, 28 Sep 2022 06:51:30 +0000
Received: by mail-ej1-x634.google.com with SMTP id sd10so25148411ejc.2
        for <linux-mediatek@lists.infradead.org>; Tue, 27 Sep 2022 23:51:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date;
        bh=VKS/VF0CIgvcZvBFOPg/1OgyZ/pIlJ2/81i9icexORw=;
        b=iECOdZjKhncEnAw0CsNKmcZACs/WmHxH0eaQ4q0VbDy5j5wDGWw1csn5q7gxcz31md
         iZAjgiUd+ID5VWXQiNCNSy7lGFEDGfpmxASWMziXMhFmITezAXVrpFIrKCROmDEJL12x
         XAHO0OJxlXup8DfxacOU1eT4qWrUy+kfMxlSg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date;
        bh=VKS/VF0CIgvcZvBFOPg/1OgyZ/pIlJ2/81i9icexORw=;
        b=7TkDmb6s/oM64M59TJLxWEYi9N6VwZ0zaLZQ2ajeOiDT9bCdosM28q/1XFHOtQZeUJ
         R6DLbQjdjkYgY7QFHTx4p2rvePe5fL0Iz3f1B+kL1nhP7PX1OGeE1xZhX3e5Nxl58AiJ
         R1gxWgiFuHWntZ5tET0EjrPhHO8/hDavbkoLFbIG3GUtfQieVa8opBrn/QKJDkqUJ1lv
         oTXv4taqOkUOFwLiXbvJ7rQP9TS5NRtBggduKAPZS4zwWkIaRSoPrgYUS4A0qo4vhHXa
         mWDTSbEOqMKu3uPqnJrAzTY3/Gvz3AZJ8HeipweikHfGfsZ7Y7PlJ1mXJooMUSyuJR4P
         ktKg==
X-Gm-Message-State: ACrzQf1haTO31Cj07jH+FCoqCnP9Y7o6QUCRP76WHx9sbZC3m2aGukkj
	ZdyYzvb68LA6UQ73M+W/0iQPYOC7jSlMyHjXlcGCuA==
X-Google-Smtp-Source: AMsMyM7+efvQsRLd4e2MqG4ydC0xN3YqsjPc8629mTw8VIsF31t+nnGUFKem/9nHVbG9M7i14vzEBfCkJSHU3A+JEyM=
X-Received: by 2002:a17:907:7f93:b0:781:dbee:dece with SMTP id
 qk19-20020a1709077f9300b00781dbeedecemr26105617ejc.323.1664347884849; Tue, 27
 Sep 2022 23:51:24 -0700 (PDT)
MIME-Version: 1.0
References: <20220926102523.2367530-1-wenst@chromium.org> <20220926102523.2367530-4-wenst@chromium.org>
 <0a1618c4-b808-56bd-e89f-560b0423191d@collabora.com>
In-Reply-To: <0a1618c4-b808-56bd-e89f-560b0423191d@collabora.com>
From: Chen-Yu Tsai <wenst@chromium.org>
Date: Wed, 28 Sep 2022 14:51:13 +0800
Message-ID: <CAGXv+5E=RXd2u00-j98BFLpiXaei6JgHNbi21-R2nhqHn40x3Q@mail.gmail.com>
Subject: Re: [PATCH 3/6] clk: mediatek: mt8192: Do not re-register
 top_early_divs in probe function
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, 
	Matthias Brugger <matthias.bgg@gmail.com>, Miles Chen <miles.chen@mediatek.com>, 
	linux-clk@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220927_235128_410146_7C4761EA 
X-CRM114-Status: GOOD (  22.74  )
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

On Tue, Sep 27, 2022 at 6:39 PM AngeloGioacchino Del Regno
<angelogioacchino.delregno@collabora.com> wrote:
>
> Il 26/09/22 12:25, Chen-Yu Tsai ha scritto:
> > top_early_divs are registered in the CLK_OF_DECLARE_DRIVER() half of the
> > topckgen clk driver. Don't try to register it again in the actual probe
> > function. This gets rid of the "Trying to register duplicate clock ..."
> > warning.
> >
> > Signed-off-by: Chen-Yu Tsai <wenst@chromium.org>
>
> Can't we simply remove the CLK_OF_DECLARE_DRIVER() and top_init_early entirely,
> and transfer TOP_CSW_F26M_D2 to top_divs[] instead?
> I get that systimer concern and we have something similar in MT8195, where the
> TOP_CLK26M_D2 is registered "late".

That was what I initially wanted to do. However I asked MTK whether the
system would work fully without systimer, and apparently it is used during
suspend (presumably it is supposed to be running?), so making it not
functional was a bit concerning.

That said, I do plan to rework the systimer stuff. The /2 divider is
actually internal to the systimer block, and should not have been modeled
the way it is now. Notably, the divider is actually variable. It is
only configured and locked by the bootloader.

For this I think we have two options:

a. Move the /2 fixed factor clock into a standalone device node, like
   what was done for the MT8195

b. Rework the systimer to internalize the divider, and thus moving the
   systimer input clock to osc26M.

Either one is outside the scope of this series. Option a. works especially
well for MT8192, as the configurable divider was removed from the systimer
block (only for this chip).

> Getting back to MT8192, TOP_CSW_F26M_D2 seems to be used only for:
> 1. systimer
> 2. SPMI MST (registered "late").
>
> Being it a fixed factor clock, parented to another fixed clock, it doesn't
> even have any ON/OFF switch, so I think it would be actually possible to go
> for the proposed removal... which would further improve this cleanup.

As mentioned above, I do have some plans to rework the stuff, but it is
kind of beyond the scope of this series, as it changes the device tree
binding and ABI.

Regards
ChenYu

