Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0100EC4332F
	for <linux-mediatek@archiver.kernel.org>; Fri, 16 Dec 2022 13:51:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=cbz1CmmqId9+bDZYuPcoGryuf7U1LfPDstaViRXo87U=; b=q8g1VeFn6EEFVgVynQfNRekOq9
	ShNbkxo9mBHfFi7XyIDHZyp4+a4pJJsnp7TTvR2hbaIw53KDRfIbVHTx/UjIaqlLCwFkLpv+N3BsL
	Ff50cTMlu0MbTCBC63q/6t+vmF0ZRzZDqsC72/EsYs7dczwp5SgySaqPULIWfsftgL0/lnjc1f3fD
	5OCAA8oZ+PuSBQ3QHml1RAy9DGW/6Oj5V93gz65OVUxgxOOErA2rE/LVm8V9jimM1jNDhRUfGVXeM
	qldF52nnZdryJNcAz/FFz5VlTWSZ1aajFT1n4/gdhmGDw6fcz+QinTStxD0ow4REZdG+Ek6Wl+/8K
	yMY+o4tA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p6B70-00FRsH-Tj; Fri, 16 Dec 2022 13:50:54 +0000
Received: from mail-vs1-xe2c.google.com ([2607:f8b0:4864:20::e2c])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p6B6y-00FRpe-5o
	for linux-mediatek@lists.infradead.org; Fri, 16 Dec 2022 13:50:53 +0000
Received: by mail-vs1-xe2c.google.com with SMTP id i2so2342109vsc.1
        for <linux-mediatek@lists.infradead.org>; Fri, 16 Dec 2022 05:50:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=cbz1CmmqId9+bDZYuPcoGryuf7U1LfPDstaViRXo87U=;
        b=T4i/qzq//6fdCaYHlNfEoSRrLrqmCxFovIEbSwW1oZ4YZKRo/hIWj6bXCStckFWlEv
         MHi0VNpg07o/AbPS4dVsrCsjd8BffW2saH9axZ4LCXoDI5WpC9sbC4mtnIDGN3qUbC8f
         UVy5JX4S0WMBKWVgdHPAuve8ToVb4sHnwXw9o=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=cbz1CmmqId9+bDZYuPcoGryuf7U1LfPDstaViRXo87U=;
        b=Y0UO08BhF4yLUT8iuAwoWtvKd/rIgiBvuyj8ijR4lVjRrY2brPd9Epz23ShGeJus/t
         Oi5pShfCZZl6cvvXYjxUkFKUF1xe+qJrGviibi/iv0Q3YW0ld0ImEvbIM8OxseONj4M8
         MifAHYriOwf/MhLTO8cCmMIGgP11omunPxeBjli4KxU8muf8BVRk2g+gNc2Bv+Akag/9
         y0LDFkhjV8K1boL1ZcvsaNsL0DP90fhjlv2/QXXigieZQky5+Umrm1AjbQPpZh9jXlCb
         uFxI/6Ukg1UO5gpTPuTYP7HBTDq3Tj7+IO9z/6hFXtcY9WiCBgL5Fr3vgVg8IEH5JW8s
         caiw==
X-Gm-Message-State: ANoB5pkYgXibekfFwNWJHdP+qEhCxA/Oq9dbvp0OhkpwPV/H1Ix4J/0I
	obzkEzTl8DWtZ8iYjsGYd06sOTImXwvBziCPTVAtCg==
X-Google-Smtp-Source: AA0mqf4J17hQ+kty31TbVJ9lwVCeJHjF5elt4zuRZXXx2EaqUgcKMpqJYKtw1VJNlTldCeKshR0UJyDv+E0j3MEd8Cg=
X-Received: by 2002:a67:c98e:0:b0:3ad:3d65:22b with SMTP id
 y14-20020a67c98e000000b003ad3d65022bmr49199011vsk.65.1671198649627; Fri, 16
 Dec 2022 05:50:49 -0800 (PST)
MIME-Version: 1.0
References: <20221111082912.14557-1-matthias.bgg@kernel.org>
 <46c17d4b-d130-86a7-b5f8-73c30d7fdfdd@collabora.com> <CAGXv+5FORS=iGe55StxR_1E3sdtk9cvitfvNa1SydqCjWGcubg@mail.gmail.com>
 <CAGXv+5GfZYdhSCkhdGXRvbprwhceMJy9a9j+cNxsyUFYhMNZOw@mail.gmail.com> <52a9924a-aaea-ed31-672f-fdf8e1ef2881@gmail.com>
In-Reply-To: <52a9924a-aaea-ed31-672f-fdf8e1ef2881@gmail.com>
From: Chen-Yu Tsai <wenst@chromium.org>
Date: Fri, 16 Dec 2022 21:50:38 +0800
Message-ID: <CAGXv+5E8fdFsCf5rVYx0ssZzQsDn69ThX6d3betejkE6=GdBnw@mail.gmail.com>
Subject: Re: [PATCH v2] soc: mediatek: Add deprecated compatible to mmsys
To: Matthias Brugger <matthias.bgg@gmail.com>
Cc: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, matthias.bgg@kernel.org, 
	nancy.lin@mediatek.com, linux-arm-kernel@lists.infradead.org, 
	linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221216_055052_260990_CADFDBDF 
X-CRM114-Status: GOOD (  20.81  )
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

On Fri, Dec 16, 2022 at 9:35 PM Matthias Brugger <matthias.bgg@gmail.com> wrote:
>
>
>
> On 01/12/2022 12:25, Chen-Yu Tsai wrote:
> > On Thu, Dec 1, 2022 at 7:20 PM Chen-Yu Tsai <wenst@chromium.org> wrote:
> >>
> >> On Mon, Nov 14, 2022 at 7:59 PM AngeloGioacchino Del Regno
> >> <angelogioacchino.delregno@collabora.com> wrote:
> >>>
> >>> Il 11/11/22 09:29, matthias.bgg@kernel.org ha scritto:
> >>>> From: Matthias Brugger <matthias.bgg@gmail.com>
> >>>>
> >>>> For backward compatibility we add the deprecated compatible.
> >>>>
> >>>> Signed-off-by: Matthias Brugger <matthias.bgg@gmail.com>
> >>>
> >>> Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
> >>>
> >>> ...And tested on MT8195 Cherry Chromebook.
> >>
> >> This now seems like a bad idea. In the dtsi we have two nodes (vdosys0 and
> >> vdosys1) that both currently use the -mmsys compatible, which in the driver
> >> maps to vdosys0. So not only do we have vdosys1 incorrectly probing as
> >> vdosys0, we also have duplicate clks being registered and duplicate DRM
> >> pipelines. On my device vdosys1 ends up winning the duplicate clock race.
> >>
> >> I suggest just reverting this. The display stuff won't be useful unless
> >> the drivers are able to distinguish themselves from one another.
> >
> > That and try to fix the vdosys0 node ASAP.
>
> I'm not sure what you mean? If there are any patches that are in my queue that
> needs attention, please let me know.

It was more of a P.S. note.

