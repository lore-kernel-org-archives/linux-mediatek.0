Return-Path: <SRS0=VOwE=NP=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.5 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DAEBBC4338F
	for <linux-mediatek@archiver.kernel.org>; Tue, 24 Aug 2021 07:11:00 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id A2ABC61165
	for <linux-mediatek@archiver.kernel.org>; Tue, 24 Aug 2021 07:11:00 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org A2ABC61165
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=chromium.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=QcM0TyLThoNdUR4mB2v9SGibwXVsT6fvGbwdJLJ8RvI=; b=afvkpN/QdVekrH
	jvZIS0MZkrZqEgBgXpPPxPvDWbVww64yugOcG5Ff9LlZcwMmpRLbZUux0kbpkaQDtrNn+tl/CzOQL
	/KSM0U/OYFapGBbYbKXOYWpCXN1OYtdxo/bqB/A4zQ1X88KjmZBS4NqXLM147GumehBTTtXDeEDWu
	w0p1X04Ucnc5HEel7imn6TjBQfJxLJqvan/5MIWeAUNWIEpSypj46hijv4vJhZfYejG7eB4I9ylDZ
	dCoAfSiPa9sS97/jExs6RCXHoBz1p04WaIUKC5LC5lRlEm0w+J1KLaJe3IEFNybmN0ALHRazRl7mS
	FlC0jnulvQ/xv8DOhnMw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mIQa5-001zm5-Ib; Tue, 24 Aug 2021 07:10:45 +0000
Received: from mail-io1-xd2b.google.com ([2607:f8b0:4864:20::d2b])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mIQa0-001zkM-LQ
 for linux-mediatek@lists.infradead.org; Tue, 24 Aug 2021 07:10:44 +0000
Received: by mail-io1-xd2b.google.com with SMTP id z1so25112484ioh.7
 for <linux-mediatek@lists.infradead.org>; Tue, 24 Aug 2021 00:10:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=LgRucL3K4cUFafkmcwegDWstDciTynvkAhKij7AEIBk=;
 b=XjwCcBqTjO8zbpgRAvkXX4cEK21t+nleXjTkL4VzdxxdLsNvjwNcndFWSg6JlrSwJq
 bpSdGFO+BrTrAT8Vmftfwj9hkT+k9VzKKyZauDR/U1vyuv5aWPiz/wR4BLCxKVgR0+Ar
 HAtZRuWjONau0qmolRjDQ0es97dtHpDqC2jDM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=LgRucL3K4cUFafkmcwegDWstDciTynvkAhKij7AEIBk=;
 b=E6PiYfROS2Wlg+W+xvDQqnPitWCCR0/JP0JJi/4t+FWyv9K+YTRqyfZqA9rup/Tog6
 tgovvjYKB1dvpN3oDVxyS3WK/MRVhdOyjDDJftkmYktHEa37JoGcrkeizW9RxLLSjA5d
 xA4tUvYchA4D98ctIuZnxpPCukQKtwIuCdAcybit7x+i/N0yxW6apse8GOd5JsTAHoty
 5t6/rj0u1p2t/Dz+XB3H3+JYrMdv7nEjDfI2MMGRgtGGojZpQjVvLqILU3n3H0HJutGj
 P2dlKztfoAb6F3gWQKrpikkR9f5W8kxAc+SqBYTYbwGVJHnMjJnSgKJxudO/JtpBo3qY
 2y4Q==
X-Gm-Message-State: AOAM530oph4CRU7TJaQx8wkkOAncIarHlrq6mpudBHldROpBy+ZtnRqW
 GEl8Jm4N4pMDi8d+IHbcusRlo46x9bQxh//430cVUA==
X-Google-Smtp-Source: ABdhPJxa8cXPwlwxMitmLNqhhcUpAXaFNNqqlX3QkiCbaPVcTW2lKOWSXVoLKeh/GHZwtAyAQE/miho2FRPpMMPkaXY=
X-Received: by 2002:a05:6602:341:: with SMTP id
 w1mr29896459iou.40.1629789038867; 
 Tue, 24 Aug 2021 00:10:38 -0700 (PDT)
MIME-Version: 1.0
References: <20210813065324.29220-1-yong.wu@mediatek.com>
 <20210813065324.29220-12-yong.wu@mediatek.com>
In-Reply-To: <20210813065324.29220-12-yong.wu@mediatek.com>
From: Hsin-Yi Wang <hsinyi@chromium.org>
Date: Tue, 24 Aug 2021 15:10:12 +0800
Message-ID: <CAJMQK-hkufqh2vaEKcuO+k0v2SzpCHcyZuEqrvJ__rrAek2P0A@mail.gmail.com>
Subject: Re: [PATCH v2 11/29] iommu/mediatek: Always pm_runtime_get while tlb
 flush
To: Yong Wu <yong.wu@mediatek.com>
Cc: Joerg Roedel <joro@8bytes.org>, Rob Herring <robh+dt@kernel.org>, 
 Matthias Brugger <matthias.bgg@gmail.com>, Will Deacon <will@kernel.org>, 
 Robin Murphy <robin.murphy@arm.com>, 
 Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>,
 Evan Green <evgreen@chromium.org>, 
 Tomasz Figa <tfiga@google.com>, Tomasz Figa <tfiga@chromium.org>, 
 "moderated list:ARM/Mediatek SoC support" <linux-mediatek@lists.infradead.org>,
 srv_heupstream@mediatek.com, Devicetree List <devicetree@vger.kernel.org>,
 lkml <linux-kernel@vger.kernel.org>, 
 "moderated list:ARM/FREESCALE IMX / MXC ARM ARCHITECTURE"
 <linux-arm-kernel@lists.infradead.org>, iommu@lists.linux-foundation.org, 
 youlin.pei@mediatek.com, Nicolas Boichat <drinkcat@chromium.org>,
 anan.sun@mediatek.com, chao.hao@mediatek.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210824_001040_760277_1867C486 
X-CRM114-Status: GOOD (  16.92  )
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

On Fri, Aug 13, 2021 at 2:57 PM Yong Wu <yong.wu@mediatek.com> wrote:
>
> Prepare for 2 HWs that sharing pgtable in different power-domains.
>
> The previous SoC don't have PM. Only mt8192 has power-domain,
> and it is display's power-domain which nearly always is enabled.
>
> When there are 2 M4U HWs, it may has problem.
> In this function, we get the pm_status via the m4u dev, but it don't
> reflect the real power-domain status of the HW since there may be other
> HW also use that power-domain.
>
> Currently we could not get the real power-domain status, thus always
> pm_runtime_get here.
>
> Prepare for mt8195, thus, no need fix tags here.
>
> This patch may drop the performance, we expect the user could
> pm_runtime_get_sync before dma_alloc_attrs which need tlb ops.

Can you check if there are existing users that need to add this change?


>
> Signed-off-by: Yong Wu <yong.wu@mediatek.com>
> ---
<snip>

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
