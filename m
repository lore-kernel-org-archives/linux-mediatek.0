Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F117EC61DA4
	for <linux-mediatek@archiver.kernel.org>; Thu, 16 Feb 2023 08:23:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=t4Hmavd74pc9hNKbMy0OT4KjV0TBYqpmbiZ39L4sh4g=; b=aKL1f1FJOjCI+YzN1dRBBX/NmJ
	N5oo8HK1a/AS51KNkCwCAMBPhw8Txf2IgXrhi5+NtoXEmQeQxQ0YLymvmzdq8amnnEakKWqE6d/5k
	stANXNdST22yEfbIQ5Xjvl20RqlaHr1ePjtWHik0DUmmem/P/jTfKC6Ymx16JwCkIwPTQMgHvoOsm
	6iEQUo0blBFR423TnmKqa/Pxr2EmCEKnFVjWbfEjNy0QT76zbeZNTmG6Nstx/J7avsVG7BA2Q4w1A
	9GVcxs3xYz5380zg9JLVQYpTcPu4Hu3iQgT3Nghuw5PfSIEhPS5eusPCTJ9fY1027EMNhqb5ISWm7
	J8H9lmkQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pSZXj-008zP2-Hr; Thu, 16 Feb 2023 08:23:03 +0000
Received: from mail-vs1-xe2b.google.com ([2607:f8b0:4864:20::e2b])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pSZXW-008zLl-3z
	for linux-mediatek@lists.infradead.org; Thu, 16 Feb 2023 08:22:53 +0000
Received: by mail-vs1-xe2b.google.com with SMTP id z15so1114829vsj.12
        for <linux-mediatek@lists.infradead.org>; Thu, 16 Feb 2023 00:22:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=t4Hmavd74pc9hNKbMy0OT4KjV0TBYqpmbiZ39L4sh4g=;
        b=U6ZdpCafQotK8qbTTSdk+96qUzTw9xQpMg+ZhUkq4h9bs64Ym3JcCYJK3QPFAo9RZs
         1Qrg104hDRL/7TryGDwRy+efxYYuXEjALAxLKnNFCtIrMIOYRKrYh4YmBiL4DCtLh0sT
         p8Vod9IfZzH9eiSRRtG0yWXXbWm3zWi39Ugf4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=t4Hmavd74pc9hNKbMy0OT4KjV0TBYqpmbiZ39L4sh4g=;
        b=8Fb1bBsFHy1uTzKh65R4nZccyqgw2HPcIXKgqH5YRwEwVV6CZReF+uwzIE2WtVRbQE
         pY4k8/jmlMGbh6UamgPfFrn+aSCPISDlZpBuFqW0dQiWZV9w1QISp3zPEHQduGw2CF7J
         PFVSp0Ye4Wq3T3BAtlw/6xNMFFrsdUFrTC5gP6Z9nakUw2Px4iYzuKYMd7v1OM+HN8f2
         PNcHh4i45kDaNFmvHyTdgyvxm/RZpwSfDIc8KWyTaJKrr82Bo2Wexwi6Bbg2c++04Sko
         kyTYVGtZOnJCrnR7rJtxz1IKJ8R5zRn+F4foil39C2kVnO9Fwv2/kqMIszuBaQUBCUmO
         L6IQ==
X-Gm-Message-State: AO0yUKXv3wirgH+3cP47XZwMSz3h8vq5cAiXLMaOpHDLSYd5uJRRtdS/
	1ygE7s3D4f0dSvXSPs9cPh2E7eWfgwTLIuihiKexQQ==
X-Google-Smtp-Source: AK7set/NiPdqGO4lax1hRZGi4C5xRM7rX75lwKlIcLeNUE7rasZWoOGb5+OT1/zHR5BKwnytbaZ5kCNjsC8Vf+ml7tM=
X-Received: by 2002:a67:f749:0:b0:3fc:58d:f90f with SMTP id
 w9-20020a67f749000000b003fc058df90fmr953233vso.60.1676535768772; Thu, 16 Feb
 2023 00:22:48 -0800 (PST)
MIME-Version: 1.0
References: <20230214134127.59273-1-angelogioacchino.delregno@collabora.com> <20230214134127.59273-20-angelogioacchino.delregno@collabora.com>
In-Reply-To: <20230214134127.59273-20-angelogioacchino.delregno@collabora.com>
From: Chen-Yu Tsai <wenst@chromium.org>
Date: Thu, 16 Feb 2023 16:22:37 +0800
Message-ID: <CAGXv+5Ft-dmvedRvyjXJwv7Cx+j=GPH6_j1s2oJFwPKYc_Qz_A@mail.gmail.com>
Subject: Re: [PATCH v2 19/47] clk: mediatek: mt8183: Compress clocks arrays
 entries where possible
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: mturquette@baylibre.com, sboyd@kernel.org, matthias.bgg@gmail.com, 
	johnson.wang@mediatek.com, miles.chen@mediatek.com, 
	chun-jie.chen@mediatek.com, daniel@makrotopia.org, fparent@baylibre.com, 
	msp@baylibre.com, nfraprado@collabora.com, rex-bc.chen@mediatek.com, 
	zhaojh329@gmail.com, sam.shih@mediatek.com, edward-jw.yang@mediatek.com, 
	yangyingliang@huawei.com, granquet@baylibre.com, pablo.sun@mediatek.com, 
	sean.wang@mediatek.com, chen.zhong@mediatek.com, linux-kernel@vger.kernel.org, 
	linux-clk@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-mediatek@lists.infradead.org, kernel@collabora.com
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230216_002250_204191_27E27862 
X-CRM114-Status: UNSURE (   6.55  )
X-CRM114-Notice: Please train this message.
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

On Tue, Feb 14, 2023 at 9:42 PM AngeloGioacchino Del Regno
<angelogioacchino.delregno@collabora.com> wrote:
>
> Increase human readability and decrease number of lines by compressing
> the clock array entries where possible, to a maximum of ~95 columns.
>
> Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>

Looks better. Thanks!

Reviewed-by: Chen-Yu Tsai <wenst@chromium.org>

