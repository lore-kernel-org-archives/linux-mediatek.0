Return-Path: <SRS0=Khw4=MO=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1CA59C6377D
	for <linux-mediatek@archiver.kernel.org>; Thu, 22 Jul 2021 07:32:40 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id D62E660551
	for <linux-mediatek@archiver.kernel.org>; Thu, 22 Jul 2021 07:32:39 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org D62E660551
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=cerno.tech
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=9qiSXqfLgUDHaS6pjTNWQ5rzuMnIQBZ6i6q+RiEby4o=; b=eoU3UFcnLeQCKA
	VDuz4bGDZRvAgM3R0Km4pZYDMUbVbTyakOONOOdFjl3u10dzsyQ0lcOYOiVQJaKjz7nusVV0EUn//
	97SOsZjfciP3ZNXmIsgCJX/S5WNwnbVBZKZuRqJv0XTisKI7nbUBIuDcY0vLRw0RyyNiFGdcXzKnj
	VLJcMYqfNnIKT7MzINwZCIxNxIsByrS4dIcNbQ6/N+xvUPuvobx92ueJiKEqFV4P7/rJaJ9+dwMkU
	Yrz/7jlJxkWrlWymk0vTgPZ2MWfQNDWxNRWGLLH+y3QKtZEK6Z5uyDiVEX8cD1TROWfFnq/lLzb9Y
	dD9ObLZKG9OxPAgMhLMQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1m6TC0-000WGF-8W; Thu, 22 Jul 2021 07:32:28 +0000
Received: from new2-smtp.messagingengine.com ([66.111.4.224])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1m6TBi-000W8U-GI; Thu, 22 Jul 2021 07:32:11 +0000
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailnew.nyi.internal (Postfix) with ESMTP id 69F4B5816CC;
 Thu, 22 Jul 2021 03:32:09 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
 by compute4.internal (MEProxy); Thu, 22 Jul 2021 03:32:09 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=
 date:from:to:cc:subject:message-id:references:mime-version
 :content-type:content-transfer-encoding:in-reply-to; s=fm3; bh=X
 FqgXhrVncJn1RmeEackjt647URidH76/zWxbiz4y74=; b=AkZLmqOOm6LOkSrq/
 97CnYUYDmaOBlK5QdmE658LXMgy9gYXjI3r7nwXNtIk3w6q9eHlpFqsj0mjNDu8w
 YWwR68MBVhn3Jh8p5V8rSGEBud1SSE6S4gwjv7QXfvoCTsECvR/3dI4V5gwANs7w
 m0S6Jh+cCGRQ78aRofVIheE34p6qJ/wOZHuyEBSFzGhwPsJk2BxgqEh6n9kg8Rcd
 JfELl/e2WwKdIG8DatVDAzPFNLLI94hCGAmC+GuoNHfEBLy9kkBNyVN9ZOLdv+GI
 D2eYDSGajFZoAlENom1HmPdn2iAAFjbHZ6/UX2MmfaY1UBlSM+8uyI25W9Sr/aZR
 qdKLA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-transfer-encoding:content-type
 :date:from:in-reply-to:message-id:mime-version:references
 :subject:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
 :x-sasl-enc; s=fm3; bh=XFqgXhrVncJn1RmeEackjt647URidH76/zWxbiz4y
 74=; b=d4MmOL+DYKXen08+/PINeptmHTcC9xaDGHGYTAB8lomgFzXV60+pyiHxq
 7TxTX4WbXKpTHJ0p1pItoTs7uIgGIE3Tc0LhFzDaUv+L2Vu6H7Phd4R9C8ra2Gxi
 neBRi+1lDCn795F3Q3bl3xSfeov8agXn39Q8Gtc0PsgAbVtOzvQd6ilvTBL7MhDm
 n+hKyU9NSs78og8KK41dC24Zgk5S2VWMBWFhJsdWi+WcrP8hHLeX+yvZ7xn1RW4v
 96/mkLH4UXI7bN6vWN6uUgH98n2iBIjyUw9zG1Bas1vt6KTxUDZ9KkQz11cFoWXW
 kMaDF/jdIXKDwTZ8oaDUEPh1iiMXw==
X-ME-Sender: <xms:-R75YMLMZdANodbo7gxj2h0GWyWlQpruBalRWi7ZaHecsyfNyuL6Zw>
 <xme:-R75YMKWHHi5RXNBddB_iUXTvdUsw1bHDLTOPYEFmPtn5_TNTsWbl36g_F6yhfzqp
 2lkTU3giYL1AOLt0nM>
X-ME-Received: <xmr:-R75YMvU1gE90FeqJf0DCkF1bqosmheDVH9r6KzjyOJauZv7ON1yGe5Wa6ZYxkA7jqd0kchhVg1lXXOcWeX8XxNhcdrvb5gFOCK1>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvtddrfeehgdduudelucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhepfffhvffukfhfgggtugfgjgesthhqredttddtvdenucfhrhhomhepofgrgihi
 mhgvucftihhprghrugcuoehmrgigihhmvgestggvrhhnohdrthgvtghhqeenucggtffrrg
 htthgvrhhnpefgjeettdejgffgffdvteeutdehtdehgeehueetkeefgefhtdetjeekledu
 gedvudenucevlhhushhtvghrufhiiigvpedunecurfgrrhgrmhepmhgrihhlfhhrohhmpe
 hmrgigihhmvgestggvrhhnohdrthgvtghh
X-ME-Proxy: <xmx:-R75YJZorkVlvAHZnPjF2bBBuQLw0N8uxKEH1WoL_VklMWUUmLB4QA>
 <xmx:-R75YDYQxRcnzwewyf8pKwJxKufVwRYyyzhZlpytjDK7g8Usq6Y1OA>
 <xmx:-R75YFAHJ3LkmiSsbHwPO_Y4xoT-4j76URwqJt6p9qzzaUeP0-ahXQ>
 <xmx:-R75YLJ_nAfsRn8uId0TjaDbktSTencVNUNSH8ZsdQlYmO3nI5wQHQ>
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Thu,
 22 Jul 2021 03:32:08 -0400 (EDT)
Date: Thu, 22 Jul 2021 09:32:07 +0200
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
Subject: Re: [PATCH v1 6/7] drm/bridge: Drop drm_bridge_chain_mode_fixup
Message-ID: <20210722073207.bsbydwc2f43ri7iy@gilmour>
References: <20210722062246.2512666-1-sam@ravnborg.org>
 <20210722062246.2512666-7-sam@ravnborg.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20210722062246.2512666-7-sam@ravnborg.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210722_003210_650049_B5419319 
X-CRM114-Status: GOOD (  10.07  )
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

On Thu, Jul 22, 2021 at 08:22:45AM +0200, Sam Ravnborg wrote:
> There are no users left and we do not want to have this function
> available.
> 
> drm_atomic_bridge_check() is used to call the mode_fixup() operation for
> the chained bridges and there is no need for drm_atomic_bridge_check().
> Drop it.
> 
> Signed-off-by: Sam Ravnborg <sam@ravnborg.org>
> Cc: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
> Cc: Maxime Ripard <mripard@kernel.org>
> Cc: Thomas Zimmermann <tzimmermann@suse.de>
> Cc: David Airlie <airlied@linux.ie>
> Cc: Daniel Vetter <daniel@ffwll.ch>

Reviewed-by: Maxime Ripard <maxime@cerno.tech>

Maxime

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
