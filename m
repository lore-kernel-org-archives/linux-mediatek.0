Return-Path: <SRS0=Khw4=MO=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D6682C6377D
	for <linux-mediatek@archiver.kernel.org>; Thu, 22 Jul 2021 07:35:00 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 9501361260
	for <linux-mediatek@archiver.kernel.org>; Thu, 22 Jul 2021 07:35:00 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 9501361260
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=cerno.tech
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Ymk9Tsf4EnANQ01tA9DPB9kg8b0/rcoGvRF/zswV38c=; b=veUTbMuCEjAr2T
	Da2JA/MwY8QhZFT2CURuaaeQPrYMjneOC0AGq2fb00+OBg7syjqVNpGcPlzjEd8wHTwzlkr/fJXmT
	tU96rCSdNGoYcSxP8/xMtiFWdyDgq7Qssp6gi/pLcoS7VdXf4q1s4z3QL9xGh7zq1jELtZ6IxSwIQ
	yiaOT7jduEUzDdZT4JR0GPobEIqRdK8/kY8V48CPueZDZdtuYdW2Bn4C4b0vt/4rw1MuEOlURlKKR
	/3pD6fPERc1yggGFDhaTw5YOgvIzDgo5wgikSO5fqXLSKgENxs5wCPPhQ73jsSJBBe6svaPISHmlU
	GuAUbcPbTK9JNWdRYeCQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1m6TEG-000Wyc-2T; Thu, 22 Jul 2021 07:34:48 +0000
Received: from new2-smtp.messagingengine.com ([66.111.4.224])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1m6TDz-000WtK-Na; Thu, 22 Jul 2021 07:34:33 +0000
Received: from compute1.internal (compute1.nyi.internal [10.202.2.41])
 by mailnew.nyi.internal (Postfix) with ESMTP id 9E2F65817B4;
 Thu, 22 Jul 2021 03:34:30 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
 by compute1.internal (MEProxy); Thu, 22 Jul 2021 03:34:30 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=
 date:from:to:cc:subject:message-id:references:mime-version
 :content-type:content-transfer-encoding:in-reply-to; s=fm3; bh=l
 FZVxS7iBfV66LqMyyxylgHFDfEUNJwOBRNBLqq9zA0=; b=I2OPNrVF6mCwf1U28
 zX7vw71bFwSRHnu7mPBS66F0OxK5yKkLmktLODfnV1LXrAHhuetIx+V9PI6FuDPF
 hSHnQ9c2822TWQIZSm6CHrb2CxlPhCgp9gS8AGRjVOwn5fnXsxqMnEdeYbfYkBnx
 hsVMmyQjFnwABsf0/5NtSdVzOq++rrlogxjqWHvT0Z4/L5vH2DxLZ1a+TYkUa9aJ
 j44r+LPWygICv4jFncFYwoO1IuU6b4HylIP3kUzNlzD+SI4WBxBWFFchxOKUTYLw
 qJ9JylUiFZ+o/p7N1xoMi+xagsq5cc6DOkp6Ah6aeOqHmMiNDLAFuRxut+i6Xmw3
 xNRwQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-transfer-encoding:content-type
 :date:from:in-reply-to:message-id:mime-version:references
 :subject:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
 :x-sasl-enc; s=fm3; bh=lFZVxS7iBfV66LqMyyxylgHFDfEUNJwOBRNBLqq9z
 A0=; b=oBW+wGLCUw9iZK1be5UY5Nh1j8IvFhUfy+05XNraEoj1D0+ekPE2fJaHv
 nbTLrQlDkI5Vk+gQQWKui9a70xRc5EcIUeMvh6pcuCZCO5rPGtGzUkGXarX4GV8o
 Luvwhlt5YjBKpUE7tQxCfxPKib1+Nw9unkm2e/x/kRLs3oNPliO4LkR5++Ac+jjZ
 wgi7aUQ41WdpitjtsRj8RvbU0feZYysNq1JWgPvWOs0T5sprl2ECTvpo4tkhF1kv
 PHdiynpG2iQ7VEdrReLU+WOraGyWahM4H/YoGc1J3QzioD8FMArDFc/kbSlz+2o/
 KemF7qPtJ2yPHKN6vbgwOTwHIbt4g==
X-ME-Sender: <xms:hB_5YBAdLx_QbUSYlm0hSXhs--79juDsY1dq9y3gwfS1S_F1YFbmlA>
 <xme:hB_5YPjb4Y0d3ICFxChZJxesFo1JoqmYg9kiwLeFCF2OT5f8FnAo4KKlX4xLM1pWL
 iVAmI77iYcG9PysU8g>
X-ME-Received: <xmr:hB_5YMnQyyQ6CbUTwpa-k6KBSjDfvfnPvL5uUF_25trCh6V5jHu1__4fthkHNwmNaCG0ZsiGsrps9w9qRr3ByQKuWtydOMO2taV2>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvtddrfeehgdduudelucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhepfffhvffukfhfgggtugfgjgesthhqredttddtvdenucfhrhhomhepofgrgihi
 mhgvucftihhprghrugcuoehmrgigihhmvgestggvrhhnohdrthgvtghhqeenucggtffrrg
 htthgvrhhnpefgjeettdejgffgffdvteeutdehtdehgeehueetkeefgefhtdetjeekledu
 gedvudenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpe
 hmrgigihhmvgestggvrhhnohdrthgvtghh
X-ME-Proxy: <xmx:hB_5YLzni9QgxKRYxfsZuE9_Ar5xtApc-A87PGpUby9iJr1QGplXWA>
 <xmx:hB_5YGRXWBff0vCiBlHguE0Rdn5oPwMCd7GiRPHqoLE9sXxpA679FQ>
 <xmx:hB_5YOapNxhhyJv4ZXKj2wESdjvEcQ9G6ZjyhyvosVm6xA6uJ1j7Jg>
 <xmx:hh_5YPCoTKftD-Z6G3v_R8XsBl_un2X_bgViCrMYjEnhzBTv14oSSg>
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Thu,
 22 Jul 2021 03:34:27 -0400 (EDT)
Date: Thu, 22 Jul 2021 09:34:26 +0200
From: Maxime Ripard <maxime@cerno.tech>
To: Sam Ravnborg <sam@ravnborg.org>
Cc: dri-devel@lists.freedesktop.org, Andrzej Hajda <a.hajda@samsung.com>,
 Chun-Kuang Hu <chunkuang.hu@kernel.org>,
 Dafna Hirschfeld <dafna.hirschfeld@collabora.com>,
 Daniel Vetter <daniel@ffwll.ch>, David Airlie <airlied@linux.ie>,
 Jernej Skrabec <jernej.skrabec@gmail.com>, Jonas Karlman <jonas@kwiboo.se>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 Neil Armstrong <narmstrong@baylibre.com>,
 Philipp Zabel <p.zabel@pengutronix.de>,
 Robert Foss <robert.foss@linaro.org>,
 Thomas Zimmermann <tzimmermann@suse.de>
Subject: Re: [PATCH v1 7/7] drm/todo: Add bridge related todo items
Message-ID: <20210722073426.dyuytcoqstxoksbk@gilmour>
References: <20210722062246.2512666-1-sam@ravnborg.org>
 <20210722062246.2512666-8-sam@ravnborg.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20210722062246.2512666-8-sam@ravnborg.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210722_003431_899209_1AC2D760 
X-CRM114-Status: UNSURE (   6.89  )
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On Thu, Jul 22, 2021 at 08:22:46AM +0200, Sam Ravnborg wrote:
> - deprecated callbacks in drm_bridge_funcs
> - move connector creation to display drivers
> 
> Signed-off-by: Sam Ravnborg <sam@ravnborg.org>
> Cc: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
> Cc: Maxime Ripard <mripard@kernel.org>
> Cc: Thomas Zimmermann <tzimmermann@suse.de>
> Cc: David Airlie <airlied@linux.ie>
> Cc: Daniel Vetter <daniel@ffwll.ch>

Acked-by: Maxime Ripard <maxime@cerno.tech>

Maxime

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
