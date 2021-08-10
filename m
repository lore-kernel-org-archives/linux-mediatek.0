Return-Path: <SRS0=C/QR=NB=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.5 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_ADSP_CUSTOM_MED,DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C7DDCC4338F
	for <linux-mediatek@archiver.kernel.org>; Tue, 10 Aug 2021 11:14:01 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 880E56101E
	for <linux-mediatek@archiver.kernel.org>; Tue, 10 Aug 2021 11:14:01 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 880E56101E
Authentication-Results: mail.kernel.org; dmarc=fail (p=reject dis=none) header.from=google.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=5okxGE8vwxKRGohAYW5zC1kpE9s5xgiGeUSXl7g21Hc=; b=pFrVWv766FSDIp
	bL4spwW2BfbiFrYqqBXaN2XmTEN4FHa+ME4OWGqrwXYdhq5XszVk2hezdkmJ7nnVMTWNHEvEUhVnj
	P2tT3JTKJAqDobBfsCeiAavFxBfqSjLsf6C3XEUZKLOiuzoZLndmVYB2m1q4W5wZG+SFMi8QPwOSL
	sS8eyhwgA2JqLtjhBcRbedd218sRsSxZvVZjIr5rocZIJx31U8xp+K3BxCXH/mIop9Ivq2XNB5d0Z
	BtTjrNzRTaIpUnTATElwcIhCSqPZgA01FVFzA2w4JFzF63HFvlq1fP/IQ7kZ02ekMlhvMznPvEEXi
	NQ3WMuWxZwuSyYgBxWAQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mDPhX-003biK-Qu; Tue, 10 Aug 2021 11:13:43 +0000
Received: from mail-il1-x130.google.com ([2607:f8b0:4864:20::130])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mDPhS-003bfx-LC
 for linux-mediatek@lists.infradead.org; Tue, 10 Aug 2021 11:13:42 +0000
Received: by mail-il1-x130.google.com with SMTP id i9so14911204ilk.9
 for <linux-mediatek@lists.infradead.org>; Tue, 10 Aug 2021 04:13:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=R24U8eygNrNa6Kfw/TB79Hp4avk7mrJgwEsiLlVUa14=;
 b=uc7ViAIsfak15w+R8Aguh9X+jPfNitVeN0r1HWrC+3IKVUGQ+Ru7fRo2Qo3t7Eannd
 vgxtR3KOz8QEmHD4uAmGVAWsxbyUh+oZgjtiq50VMk98OhzWV3XJcGX4OYRdTM5be+E4
 cI12L78DgJatroOaAEHh2GiLwl+0D0Qc275DogwrcvGGtWwPNO1OUrs505nTGOpEtvIU
 Agbvwaa5NdBCZ13VgfHJzV5C3plyC4d3kN0/pR6bPBqgJ3rFlqlkIrLl4AJiKcr+mIvy
 SnXj/J5HJ4MK6yGPSy+gGkqiWKeaIMjp8sovggYPj8r7mtaDivA9V4t9gQL2uWfpWqlu
 RVWQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=R24U8eygNrNa6Kfw/TB79Hp4avk7mrJgwEsiLlVUa14=;
 b=OOgkIK19d2ipAofKjLcQYUPuWsoWNVr8/FxIMDPBNQYVGK66i3pZO5IjPXC5RBgCbN
 /eMHW//i4fUTa40/xySZtKnzwDb94uHenl8Q0/3AV/AsRxWsQdYO8CEs2WJbE66wRdH5
 AYpFFhopQNDiKPSucC8ltfUhcroKC3VoqOZv5v5/bWOe0D8dyovZNHJ1TVGnNLWSiRTH
 bJDm3gArHemgenjQB8Jcu477mxGx64GEkB8Xv8xQBw5WVW2agf57SXo6svDw/e6G2cf6
 STI/gNVrFSAwXBvK3j4goKqzgyE2cXsKozA4DBxg2k+05iwmhIBE4mUQ6u7AD3Xoq0Lp
 h+NQ==
X-Gm-Message-State: AOAM532Lnoc8747O5+0PMbCa2H6v2AXX78xSqYVE7jwRBXArl7/sr6lY
 GWviKVt9CfeylWDsLRNl3+2hiPnXaGemGjj6O8gwHg==
X-Google-Smtp-Source: ABdhPJwY2OJpBSIipazUvXTbGw/knJcOBQtgWX6jXKOHKgdkgkyuLfro/TnppdMOUgQdOF7LK2Cn0KQW+9JIsn0XqEc=
X-Received: by 2002:a92:ddc9:: with SMTP id d9mr230817ilr.204.1628594014125;
 Tue, 10 Aug 2021 04:13:34 -0700 (PDT)
MIME-Version: 1.0
References: <20210810083047.16693-1-yunfei.dong@mediatek.com>
In-Reply-To: <20210810083047.16693-1-yunfei.dong@mediatek.com>
From: Tzung-Bi Shih <tzungbi@google.com>
Date: Tue, 10 Aug 2021 19:13:23 +0800
Message-ID: <CA+Px+wWsYUCAzwbJjFQqhtOiW1zkn6ZTbr3NymUs1TZQWwdQxQ@mail.gmail.com>
Subject: Re: [PATCH v4, 00/15] Using component framework to support multi
 hardware decode
To: Yunfei Dong <Yunfei.Dong@mediatek.com>
Cc: Alexandre Courbot <acourbot@chromium.org>,
 Hans Verkuil <hverkuil-cisco@xs4all.nl>, 
 Tzung-Bi Shih <tzungbi@chromium.org>, Tiffany Lin <tiffany.lin@mediatek.com>, 
 Andrew-CT Chen <andrew-ct.chen@mediatek.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>, 
 Rob Herring <robh+dt@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>, 
 Tomasz Figa <tfiga@google.com>, Hsin-Yi Wang <hsinyi@chromium.org>, 
 Fritz Koenig <frkoenig@chromium.org>, Irui Wang <irui.wang@mediatek.com>, 
 linux-media@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 srv_heupstream@mediatek.com, linux-mediatek@lists.infradead.org, 
 Project_Global_Chrome_Upstream_Group@mediatek.com, 
 George Sun <george.sun@mediatek.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210810_041338_750465_0EAF7950 
X-CRM114-Status: GOOD (  12.73  )
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

On Tue, Aug 10, 2021 at 04:30:32PM +0800, Yunfei Dong wrote:
> This patch dependents on "media: mtk-vcodec: support for MT8183 decoder"[1].
>
> Multi hardware decode is based on stateless decoder, MT8183 is the first time
> to add stateless decoder. Otherwise it will cause conflict. Please also accept
> this patch together with [1].
>
> [1]https://lore.kernel.org/patchwork/project/lkml/list/?series=507084
Didn't see anything from the link but I guess you mean the series
https://patchwork.linuxtv.org/project/linux-media/list/?series=6057


Some obvious issues from the series:
- Please remove all unneeded "Change-Id" tags.
- Please include Reviewed-by tags if no significant changes.
  - E.g. https://patchwork.linuxtv.org/project/linux-media/patch/20210727101051.24418-3-yunfei.dong@mediatek.com/
  - E.g. https://patchwork.linuxtv.org/project/linux-media/patch/20210727101051.24418-4-yunfei.dong@mediatek.com/

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
