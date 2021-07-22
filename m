Return-Path: <SRS0=Khw4=MO=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3461BC63793
	for <linux-mediatek@archiver.kernel.org>; Thu, 22 Jul 2021 07:32:23 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id E593D61279
	for <linux-mediatek@archiver.kernel.org>; Thu, 22 Jul 2021 07:32:22 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org E593D61279
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=cerno.tech
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=V49YqRRTTOwu1OV2eNFENpm0N3150lu6VFlE5ro6qYQ=; b=C2HXX/OX2sphWx
	2DgDqLc90m1BLkftaEzT3NzG+jmNhvofcICjUj1HlGbhRUUBVSxsVtuxr4fqmy5gemKGnn4yz3heE
	CvSo3aCCpthab55T0MCJjSvMJAhm5xv9aw7dKNSrnTj9pNkyMjyIXDYhVbcU4zYmUcEKrNfXfGfCm
	Y/LKGYFcX/y7rb96kcdHlQLnvbvmRwU3+hY80vmpN48UZzJq6R3Fg5aZ/okDVds6uX/HVn0MFuAJz
	cjsfYcqsMjnKBxbAKVbUL6M1hlGm6FaKnsYyRMqHpK/bgqkJEqs4X/lBQoIYgplNlt2gcxIOFJMCl
	LVYSHu7mHIZyy4c6Gmjw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1m6TBk-000W8s-1J; Thu, 22 Jul 2021 07:32:12 +0000
Received: from new2-smtp.messagingengine.com ([66.111.4.224])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1m6TBQ-000W3Y-AA; Thu, 22 Jul 2021 07:31:53 +0000
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailnew.nyi.internal (Postfix) with ESMTP id 6A3305816CC;
 Thu, 22 Jul 2021 03:31:51 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
 by compute4.internal (MEProxy); Thu, 22 Jul 2021 03:31:51 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=
 date:from:to:cc:subject:message-id:references:mime-version
 :content-type:content-transfer-encoding:in-reply-to; s=fm3; bh=/
 I4etZeEnDA+034NbHZPFsmfe1xdUqAONXI0N+Ofdbw=; b=YjaVhF5u4EalTcQYp
 XlPYecVWnReNLESjPxrTCjYsnol4ZeRqrKS5P38PSBDXdoHhF+4COp3FV/g06IOZ
 MmLDQEwcUMFHQcpKnDyfcuJEAJH9GC4PzHAuyTwLHiUaunpp/cTB9ZVf/AACyeyp
 ZCXcTbPWf2s0brf0XpJGU9UWi5TYyYvpG4zQ4Hf8v/+/akL6J+o7GCWpCO4n8v/y
 qsaO15WyXkWK/vMZeCZpGEmfJe/AIHgtQn/XtBFW8dyLo9dwRnd5lLJsSj8PK3lG
 kV6OBPTDhp9EwAqRZthIFtQCANlMS6N4jTZ8MPx1iPEWDYLVPLJJkmJJkod1Lxsy
 MOBvA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-transfer-encoding:content-type
 :date:from:in-reply-to:message-id:mime-version:references
 :subject:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
 :x-sasl-enc; s=fm3; bh=/I4etZeEnDA+034NbHZPFsmfe1xdUqAONXI0N+Ofd
 bw=; b=lhxmBOXhDcB7NXHcrBa4kzZTu6EMGfRieJNn0yCuwVLvyOZc4gk5/BPRe
 BGyVHpnstMUbAmeBxnxfIFo2qgKYpIcvCiq5DN+E2B8btE3EUX8dREB4PGkXBdmk
 W3j4y0AIJXgetK6OSMS561pNqUiMQoQ5Cy7328r00yUToHzRTxLpgsNpgTJ8cCm6
 8fIzfAbGz7jEvzS40MVr2NWVS4Nc7ycJ0A7HzJt73o2hVO07XKp28hyirCTr6mVE
 Ve40+jylhLivequ5ooJR0D47r0UF07mDeAt/8NKt6hAc6h6UPfHg6nrig6OEIaRN
 /Ce9R+JYMl0lJBVsxE1tc7GmmKWNw==
X-ME-Sender: <xms:5R75YPNyQXq_eIj371inR-SaYJGCBw8pjTGFROTtfjPJXhda43qlDg>
 <xme:5R75YJ9fHtWShxIw8ZJdk9cJl06xvCFDUM5-bY-UPd-S4gAFeeq2J2JNaARsTSHqe
 3oR7yjkpl_MZcpipFk>
X-ME-Received: <xmr:5R75YOToywd2CDXgnGOhG2FFcylD_zeyeeGP0Amn7qTlT46-HMRWxHyngE7pmcQUeUammWx9BIj7HSipnxV_Vy5RXbBDbwPLED-Q>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvtddrfeehgdduudelucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhepfffhvffukfhfgggtugfgjgesthhqredttddtvdenucfhrhhomhepofgrgihi
 mhgvucftihhprghrugcuoehmrgigihhmvgestggvrhhnohdrthgvtghhqeenucggtffrrg
 htthgvrhhnpefgjeettdejgffgffdvteeutdehtdehgeehueetkeefgefhtdetjeekledu
 gedvudenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpe
 hmrgigihhmvgestggvrhhnohdrthgvtghh
X-ME-Proxy: <xmx:5R75YDttIjQxfKXs6iCjAnMonygpfTAHBZGpDk-T0EPMcn1BvBlhmQ>
 <xmx:5R75YHdIczkQBdCzTtq7lf4jeun2p2IewT6l-5rPCH-tZN1LQ53_nA>
 <xmx:5R75YP1gy4ngQkPyOmpsTIz5Ac4lCfy2iWt3op8WxDLhWIV7VwHTbQ>
 <xmx:5x75YCueZJDnY4KgZT8DhHnfLEX-zJbZf7o1N7AZe4_PElbcm__WRQ>
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Thu,
 22 Jul 2021 03:31:49 -0400 (EDT)
Date: Thu, 22 Jul 2021 09:31:48 +0200
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
Subject: Re: [PATCH v1 5/7] drm/mediatek: Drop chain_mode_fixup call in
 mode_valid()
Message-ID: <20210722073148.rkgsvam37ytafykf@gilmour>
References: <20210722062246.2512666-1-sam@ravnborg.org>
 <20210722062246.2512666-6-sam@ravnborg.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20210722062246.2512666-6-sam@ravnborg.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210722_003152_465995_460D0198 
X-CRM114-Status: GOOD (  15.21  )
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

On Thu, Jul 22, 2021 at 08:22:44AM +0200, Sam Ravnborg wrote:
> The mode_valid implementation had a call to
> drm_bridge_chain_mode_fixup() which would be wrong as the mode_valid is
> not allowed to change anything - only to validate the mode.
> 
> As the next bridge is often/always a connector the call had no effect
> anyway. So drop it.
> 
> From the git history I could see this call was included in the original
> version of the driver so there was no help there to find out why it was
> added in the first place. But a lot has changed since the initial driver
> were added and is seems safe to remove the call now.
> 
> Signed-off-by: Sam Ravnborg <sam@ravnborg.org>
> Cc: Chun-Kuang Hu <chunkuang.hu@kernel.org>
> Cc: Philipp Zabel <p.zabel@pengutronix.de>
> Cc: Matthias Brugger <matthias.bgg@gmail.com>
> Cc: Dafna Hirschfeld <dafna.hirschfeld@collabora.com>
> Cc: linux-mediatek@lists.infradead.org
> Cc: linux-arm-kernel@lists.infradead.org

Reviewed-by: Maxime Ripard <maxime@cerno.tech>

Maxime

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
