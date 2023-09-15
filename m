Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2B1FBEE644A
	for <linux-mediatek@archiver.kernel.org>; Fri, 15 Sep 2023 09:01:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Message-ID:References:In-Reply-To:Subject:Cc:To:From:Date:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=hLRZB7uQP5Gtl2ZgHrTWsFOjVean1SOtf0IpQI7/nq4=; b=4HG++enLRqeN6/nl4ZHe7424v9
	fr5cfMyAJ6gwfCwyKRJbUlDBgmSbcHAeJU0mxUIRHwmDCGRWrxX8kca0Y7sIRHhLM1GOZ7g8NcMYe
	JUv8ot3ckq3cmWtYxbwPZoWu5Hf5cwSipEmF3H4Bd07Qn+2VdP5T4JEgFWHWERqgZZKhaMng8XlOK
	/2rZqN+nbQFToJpmu/rr2FTTMNY/DYapq1pNDNvjcvByWVvRlS8RTmJ/mrlrCpMiXpRjsMLa2Ki1Y
	rwuiIJUC1ro6hrAFoyxNWX4nuzmWwAT0MTGNPb8XiDlH3bBki3tKNo6dbJCc0C9G4RchFFRaMVfdo
	OI/lAWJg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qh4hk-00ADEK-09;
	Fri, 15 Sep 2023 09:01:36 +0000
Received: from sin.source.kernel.org ([145.40.73.55])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qh4hh-00ADDY-0L;
	Fri, 15 Sep 2023 09:01:34 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by sin.source.kernel.org (Postfix) with ESMTPS id 8E78FCE2A7E;
	Fri, 15 Sep 2023 09:01:30 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7FBCFC433C8;
	Fri, 15 Sep 2023 09:01:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1694768488;
	bh=C6/KXGgH6tHW8U29QI5yRNYeBy8iAPkFYoHh2nhVIeE=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=WPvuu1ayMIwkplILF+8RvITgsrg7/Wvs1Iwc3LHh1mIXGDDRUhm/tfbWc+4lyGnKN
	 CNQYy9b842a0bcuKVnkc21PyOp6bxS+PFZYOiC+o/DB5aHsHYUQFP6J19cnMx/Vlrj
	 X5l34f0piINXbj9eckckZWtIHDucJDC7kkQDMjrI2Nde6wzpLUZb3S3vs2YE4wozMq
	 /QPNt5DTjMrDqSanhH7n2ADwUcjLMQxBeY3HqGKf6aL3ShkHaWx3ScPToYTMdRw6WQ
	 MqVON4LDNJXTpFK8EgCGq+IIOcJ7oLsMB6foNFveqhgxArQ/IBiu5IEHwK8xNOh9uG
	 mAlfV32+fAeyg==
MIME-Version: 1.0
Date: Fri, 15 Sep 2023 11:01:24 +0200
From: Michael Walle <mwalle@kernel.org>
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: Chun-Kuang Hu <chunkuang.hu@kernel.org>, Philipp Zabel
 <p.zabel@pengutronix.de>, David Airlie <airlied@gmail.com>, Daniel Vetter
 <daniel@ffwll.ch>, Matthias Brugger <matthias.bgg@gmail.com>, Jitao Shi
 <jitao.shi@mediatek.com>, dri-devel@lists.freedesktop.org,
 linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH] drm/mediatek: dsi: Fix EOTp generation
In-Reply-To: <0a184b35-133b-483c-d475-01120fbdc2ca@collabora.com>
References: <20230915075756.263591-1-mwalle@kernel.org>
 <0a184b35-133b-483c-d475-01120fbdc2ca@collabora.com>
Message-ID: <eb1f4f78be9b2da3ae2d54ec9417f2f7@kernel.org>
X-Sender: mwalle@kernel.org
Content-Type: text/plain; charset=US-ASCII;
 format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230915_020133_364010_5A0DEC9F 
X-CRM114-Status: GOOD (  10.56  )
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

Hi,

Am 2023-09-15 10:58, schrieb AngeloGioacchino Del Regno:
> Il 15/09/23 09:57, Michael Walle ha scritto:
>> The commit c87d1c4b5b9a ("drm/mediatek: dsi: Use symbolized register
>> definition") inverted the logic of the control bit. Maybe it was 
>> because
>> of the bad naming which was fixed in commit 0f3b68b66a6d ("drm/dsi: 
>> Add
>> _NO_ to MIPI_DSI_* flags disabling features"). In any case, the logic
>> wrong and there will be no EOTp on the DSI link by default. Fix it.
>> 
>> Fixes: c87d1c4b5b9a ("drm/mediatek: dsi: Use symbolized register 
>> definition")
>> Signed-off-by: Michael Walle <mwalle@kernel.org>
> 
> Hello Michael,
> your commit is missing a small piece! :-)
> 
> Besides, I've already sent a fix for what you're trying to do here:
> https://lore.kernel.org/linux-arm-kernel/07c93d61-c5fd-f074-abb2-73fdaa81fd65@collabora.com/T/

Ahh thanks, didn't noticed this. If not already applied, I'll send
a Tested-by: later.

Please disregard this patch then.

-michael

