Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4B533C433F5
	for <linux-mediatek@archiver.kernel.org>; Wed,  9 Feb 2022 07:07:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=f+uFbRbu8oHkLmTrYLaX26/iQcqvI0FGHvxVxc0WM8g=; b=esiKPNWLejC8l9
	n7xy3EBY8tpA3LYHlT7WMjmyCzVMHspeYZIgKRT4D9IXONLPUOy4i0ITlotuEDiWQeD/nivEj6Stf
	/ajmVyV8uOWCNuvX3pLLRxEZG+QhTHDoRSIasydRg9+Jdhz+eT9mhy1A7HZ1XuTeUqcsULasFVBTT
	JoONHomX76VmRmAPJDqE/KCf2FGmd/lrGiVfJE+epaV/8TCmSBdTo2myYs5v0Tuz80BPRRdcpLs6I
	TBmR7ANt6Ydjbq5Poy3kdCyWXJy21lZBSWPUA4CEG0ChKyN+Cna/SWNNr+ppfM80rpDLOi+oceOjU
	22JboatwsRlo9j8hfHeA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nHh4I-00GQYJ-Tv; Wed, 09 Feb 2022 07:07:10 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nHh45-00GQTl-JE; Wed, 09 Feb 2022 07:06:58 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 8EB826174B;
 Wed,  9 Feb 2022 07:06:56 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F2715C340F0;
 Wed,  9 Feb 2022 07:06:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1644390416;
 bh=IaS3n+YSyvbjKGntCu5fWfQp5qdKI/SX1N0ILn7hVFU=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=Y8w/wlhK/H1xRHOLXNeDLRPmVxGRf/tkGY2XhoQ1RNZxDN6KpE3nRX/PO0S85c4ND
 CB28fc6d7cSyBFoqt1cLj/YeU8AA0KwOFIkLtz/HNG7RWgiydTbBD8iVTur1qsSMXs
 ia+mRRFrHWL3F29Zl2mXlRsZRyOhvjgTW11lPMwChexeDpChc0FZYnsAeb7xeJHvYg
 qfKQQUg0StYlhLbU33KjzcE2y2fQ+Pgjx3YFtUr7QxCACq2XMR8fcwUgzY5IoCullY
 mcVlCfprJITpw0UCa5njqYOrn0y9LRqPjWTVBn4O9fxg/qMchKKokPQkhpdh1ZNM1n
 Wy4LFpF3GjE6Q==
Received: by mail-wm1-f50.google.com with SMTP id
 k6-20020a05600c1c8600b003524656034cso868452wms.2; 
 Tue, 08 Feb 2022 23:06:55 -0800 (PST)
X-Gm-Message-State: AOAM530R2gyuNm13oLTTV2vz84Nk3uUTpSpMorIICJJkapza1sTdfOMs
 927z8Bhm7bBN+gH0EfS6qNlRo1MYSTS8eo6qZt0=
X-Google-Smtp-Source: ABdhPJzX9jWLhzTjtjQU7wN7OVHKYBR8BpWTxogSCK0npxv6vZ89SR9rQCAouuuUi4Nxuv6jbnTSYXFfBTmTa5PVQXo=
X-Received: by 2002:a1c:f309:: with SMTP id q9mr1267664wmq.173.1644390414247; 
 Tue, 08 Feb 2022 23:06:54 -0800 (PST)
MIME-Version: 1.0
References: <6fc4a81f-1a13-bff9-7b2e-d5bec382cb42@synopsys.com>
 <9bab4777-3034-b789-fdf6-ca8d7e6a8c35@infradead.org>
 <CAOMZO5Aa4WxuadfoFGwwyYyD4UGPm-E258xTWU3-ozp_hwG-7g@mail.gmail.com>
 <d8981e2a-4f61-72bb-e5cc-bf4ded29c08a@synopsys.com>
 <CAK8P3a3ELrSC=KX6cr8UnP6kkJN0AXeAE4EG4oUY=Zz7gG_dgg@mail.gmail.com>
 <b44de208-6d5f-3fcd-0e36-f05745297747@synopsys.com>
 <CAK8P3a27RtHxYwtj=rjxcDzkMdKhC-w9ho=SApHpczma_vU8JQ@mail.gmail.com>
 <6743d6b1-13fe-9c83-f706-82338dd03897@synopsys.com>
 <7ed6137e-cf19-3614-9404-e89389411a8f@infradead.org>
 <992f01cc-eb0c-b503-f9b4-4a037c6cf67a@synopsys.com>
 <2434f050-b82c-03e6-ee8f-8c8799119815@infradead.org>
 <1aef3a8f-f93e-2824-6b6e-8df8a1460f15@synopsys.com>
In-Reply-To: <1aef3a8f-f93e-2824-6b6e-8df8a1460f15@synopsys.com>
From: Arnd Bergmann <arnd@kernel.org>
Date: Wed, 9 Feb 2022 08:06:38 +0100
X-Gmail-Original-Message-ID: <CAK8P3a3bJcMKW5QJqoUT8jDe+cbK0A-zSbNZhveX0WwC=ZEUqw@mail.gmail.com>
Message-ID: <CAK8P3a3bJcMKW5QJqoUT8jDe+cbK0A-zSbNZhveX0WwC=ZEUqw@mail.gmail.com>
Subject: Re: Kconfig CONFIG_FB dependency regression
To: Thinh Nguyen <Thinh.Nguyen@synopsys.com>
Cc: Randy Dunlap <rdunlap@infradead.org>, Fabio Estevam <festevam@gmail.com>, 
 Kees Cook <keescook@chromium.org>, Daniel Vetter <daniel.vetter@ffwll.ch>, 
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, 
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 John Youn <John.Youn@synopsys.com>, Bing Yuan <Bing.Yuan@synopsys.com>, 
 "linux-mediatek@lists.infradead.org" <linux-mediatek@lists.infradead.org>, 
 "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220208_230657_712181_1DEC5047 
X-CRM114-Status: GOOD (  13.16  )
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

On Tue, Feb 8, 2022 at 11:42 PM Thinh Nguyen <Thinh.Nguyen@synopsys.com> wrote:
> Randy Dunlap wrote:
> > On 2/8/22 12:10, Thinh Nguyen wrote:
> >> Randy Dunlap wrote:
> >>> On 2/3/22 19:21, Thinh Nguyen wrote:

> Ah.. It's because I don't use old.config as the base config. I use
> x86_64_defconfig as the base plus some additional configs I need, and it
> has CONFIG_FB_EFI set by default.

Does it hang if you just disable CONFIG_FB_EFI on an otherwise working
kernel? This is supposed to only disable the framebuffer, but it could be
the actual cause if something else depends on its presence.

        Arnd

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
