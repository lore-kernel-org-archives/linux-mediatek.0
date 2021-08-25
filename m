Return-Path: <SRS0=pvhC=NQ=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.5 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 76022C4338F
	for <linux-mediatek@archiver.kernel.org>; Wed, 25 Aug 2021 10:56:34 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 43AC961100
	for <linux-mediatek@archiver.kernel.org>; Wed, 25 Aug 2021 10:56:34 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 43AC961100
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=chromium.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=dI2csJ3396JqtncgApdZUldrblP+VJL3JNlCbhVcd+o=; b=emd2EkHnXkmr1a
	T7znBHS68w3d/ZejkS51NpUSUCdGabMNohbikhqHOGS5VxFp40Tl1A/DW99WDu2EdYGsUXW5ZOa3B
	nkLeHwfP9yp6ZqaddvZt9GiZUoAPhcE6nqQZfEqbLYGOHZqkxqLkynLgYnE5iZb0d8vJdg3Sg4KnJ
	iogchEgUK6wIvX9MxDFt1wtjbc+1+aTrLlc37jsuqg6vboebLJWlFghyciB/pj3INRAr1kg266raj
	ToG2eU5ynlb5IhZMDjHXWmucIbqlPtzbbIgzO4SaKyMqdmXm+e04FmTmXtd3PXsqKsujZMZPgrGnb
	xzRh1mo/FJQC79J4j7yg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mIqZz-006goV-4Q; Wed, 25 Aug 2021 10:56:23 +0000
Received: from mail-lj1-x230.google.com ([2a00:1450:4864:20::230])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mIqZI-006gWg-3I
 for linux-mediatek@lists.infradead.org; Wed, 25 Aug 2021 10:55:44 +0000
Received: by mail-lj1-x230.google.com with SMTP id f2so42905912ljn.1
 for <linux-mediatek@lists.infradead.org>; Wed, 25 Aug 2021 03:55:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=8KtXsyPEoSgHBdmGP1qFsGT9RrscqrYn9YkfTv0ST8I=;
 b=F1U0ijMoJ+uQkTH7EAGMMDLpHekxkUXM+2SD8yUcKEs25h6R3TBXPRpl/5AbyiDFMp
 BFiGIYWwKmLgkr9pLHomKG//38jV5N+4G7knhte6u3A4z5PoYFAOhV9QzGB3RZKU0xRy
 oxZW4VlFokPe8hvZzOhJllirIQ4qcX5ZLBsY0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=8KtXsyPEoSgHBdmGP1qFsGT9RrscqrYn9YkfTv0ST8I=;
 b=hRTPK+PminCkFzi2o0TdKFLQJkKPylOrk3JArU/JBkQCbxwC/QL13MrVxGVRAzvSZ6
 5fVlaC4MCxHMIUhX23fIwJ/du576ny+XPUjjIkrWi8j9t44gJBYeAJeijzg3aK7xHzQk
 iaZ7vPBn2j8EyBARBOaWpMO/xnGznc/MBrKdFG76gZ/fbcAymalzipeR3yWObWT4B1sg
 OoSob8q58nFp7QiGs7g6Auz97YzR1rZs/Zzk7gkJh9RKhWmYThXjVu9gi9iwxhEhFrsZ
 TgOIG8bNFIDFAjzgBJJsu/kvNgusTKlafLbydYzruuFCDCx+lUmVYk00X5HmxaDSw1a5
 vqOw==
X-Gm-Message-State: AOAM531NqmfMkPTWYhfHgM/3U6cTrcDhksA5wguc0PGL86wD3JCkFbAW
 Gxsmo6ALdr7MN9h2pQ/p9LL4SgaCtF8PQ9hKA8zz/A==
X-Google-Smtp-Source: ABdhPJwSu+M1YeQxqLDZauUzq/Ihy/yhcPvX547+XWxq7oIDLMi7xFitdF7gXGp8kzYgBiuJeidB8DE6eyVKJQequNg=
X-Received: by 2002:a05:651c:211a:: with SMTP id
 a26mr22213894ljq.305.1629888937124; 
 Wed, 25 Aug 2021 03:55:37 -0700 (PDT)
MIME-Version: 1.0
References: <20210820111504.350-1-chun-jie.chen@mediatek.com>
 <20210820111504.350-19-chun-jie.chen@mediatek.com>
In-Reply-To: <20210820111504.350-19-chun-jie.chen@mediatek.com>
From: Chen-Yu Tsai <wenst@chromium.org>
Date: Wed, 25 Aug 2021 18:55:26 +0800
Message-ID: <CAGXv+5Eu1f+Mp5WE_BDRioqiZ1LPAyE=3SB5D8nNaHfposDHXA@mail.gmail.com>
Subject: Re: [v2 18/24] clk: mediatek: Add MT8195 vdosys1 clock support
To: Chun-Jie Chen <chun-jie.chen@mediatek.com>
Cc: Matthias Brugger <matthias.bgg@gmail.com>, Stephen Boyd <sboyd@kernel.org>,
 Nicolas Boichat <drinkcat@chromium.org>, Rob Herring <robh+dt@kernel.org>, 
 "moderated list:ARM/FREESCALE IMX / MXC ARM ARCHITECTURE"
 <linux-arm-kernel@lists.infradead.org>, LKML <linux-kernel@vger.kernel.org>, 
 "moderated list:ARM/Mediatek SoC support" <linux-mediatek@lists.infradead.org>,
 linux-clk@vger.kernel.org, Devicetree List <devicetree@vger.kernel.org>,
 srv_heupstream <srv_heupstream@mediatek.com>, 
 Project_Global_Chrome_Upstream_Group
 <Project_Global_Chrome_Upstream_Group@mediatek.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210825_035540_192327_08B063A7 
X-CRM114-Status: GOOD (  10.54  )
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

On Fri, Aug 20, 2021 at 7:31 PM Chun-Jie Chen
<chun-jie.chen@mediatek.com> wrote:
>
> Add MT8195 vdosys1 clock controller which provides clock gate
> control for video system.
>
> Signed-off-by: Chun-Jie Chen <chun-jie.chen@mediatek.com>
> ---
> Integrate with mtk-mmsys driver which will pupulate device by
> platform_device_register_data to start vdosys clock driver

Same thing about the commit message. The reason behind such a design
should be documented and shared, so that other people looking at the
code will have the same context.


ChenYu

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
