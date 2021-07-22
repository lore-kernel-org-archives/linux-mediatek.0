Return-Path: <SRS0=Khw4=MO=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5AC34C63793
	for <linux-mediatek@archiver.kernel.org>; Thu, 22 Jul 2021 07:19:44 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 1BF8C6120D
	for <linux-mediatek@archiver.kernel.org>; Thu, 22 Jul 2021 07:19:44 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 1BF8C6120D
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=cerno.tech
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=d7pFG6ZGk0fXnFIZzgWS6SsYKttjaRRATQhXscwXiEA=; b=fg6UtUylhPF3VF
	YP7BBi/Zk3e+mJG7nRk2S4u/WnRTwDkfKPyOknVtfv2u7szeS+vPH87AfZQVvFM/kjHYU1umoYLS2
	oxixt7V+wmCnEh+yyGkHp/tczzW4KZGcEiRNtEc72NR1IAmrygvcImqS3Y4UD6kt+J9QJgpC5LHE6
	3+ja4D3G7GpgZ11H9bH0DLHzQ/U5Onp0/ZNiJ+Hgv8j5G8B5BroZVxGw6Rl0tD+e3JNZVUWlLpep/
	Lfa/w02YyNHSSxPG7hSPE/oKPpumPmrHEpp2+VtVQP/AO99g6s7cN1zbhXp2ii3AdWzW54lG/1KYj
	VWS/BJLdIEA+ZiY0pghg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1m6SzT-000U5T-Ka; Thu, 22 Jul 2021 07:19:31 +0000
Received: from new2-smtp.messagingengine.com ([66.111.4.224])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1m6SzE-000U1e-C2; Thu, 22 Jul 2021 07:19:19 +0000
Received: from compute6.internal (compute6.nyi.internal [10.202.2.46])
 by mailnew.nyi.internal (Postfix) with ESMTP id AA5D1580A89;
 Thu, 22 Jul 2021 03:19:15 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
 by compute6.internal (MEProxy); Thu, 22 Jul 2021 03:19:15 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=
 date:from:to:cc:subject:message-id:references:mime-version
 :content-type:content-transfer-encoding:in-reply-to; s=fm3; bh=p
 GUrYEwTJWxb00jR9voM7UpAPJOx9r172pFnflkjti0=; b=LAAUnSpG93dCyODtN
 REzGsm0Dt3R5L4lnlfi8q5hob2KCaLnuI11/eGAsXBSmfPrfp441fD4ygsPoYQmX
 IAU0iZDnnoR00gLR2a+VvEEkUGkZYcP1AC4hK8pn8Q+Or6EXEJyAlwNWJAAUgGNc
 FkySNcekHJJouCUdc0Qzq1POZMmIwzot7ui3/xthTGTyi6N5dPdqobWoerHRf4fE
 LGsNtWeGlyr4ts5tt4dAXYxAVpwDvkFRW704AlnW0KXZIA3akkbLTYUkxZSodUZt
 osIRugOjkWILrGrxtMZAPwr7e7kfLg3pKBZ9Ww1lHg9APHnu72Z9AevsD6S8POsl
 TNpZQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-transfer-encoding:content-type
 :date:from:in-reply-to:message-id:mime-version:references
 :subject:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
 :x-sasl-enc; s=fm3; bh=pGUrYEwTJWxb00jR9voM7UpAPJOx9r172pFnflkjt
 i0=; b=aYc+nI/gPfcOu5CFxzGkYcba6gbxviD2XdiYj+SbH8DezLxBAmkjUSs9+
 3x50SZHmAKO6UFVaqEirsQxHqKzUcuvOCkPcPu6z+cacxgSo/p9WCrnqmKImfUaY
 I5I19eUtB04S8y8yygNSevA3qAAZ3hsFUMgxKzzTl6spmiRUwTGpQWajlq6WSQZ5
 MugIo0sn4lK3pYltt/L9nC9cfmAnHXENhwG8HEkHNmF3hBRQ+XPVqQ5ORnZICOpm
 w1rLKChW6bMCaLjGwvvcXCsBmItVGM2CAFbOIINNKdXHKxvbzdNWZv6kolT4r7mw
 H3JKWUkZ0azAyKTPQWa8PJHjLwgNw==
X-ME-Sender: <xms:8Bv5YNAvui7DnxvETxporT66kBrDbenjq9jq5gUIVJ2-C0QO41Ztqw>
 <xme:8Bv5YLhX8ecGvDHuApfYub80wUg9_pTR-O7BZzDXUtU1eEsyZTub6291kjjmQEkHo
 dsUiFSsvAvxv5s8hyc>
X-ME-Received: <xmr:8Bv5YIkBkvuzOc57gZxb6CbeX4Rggxcclg_UcPVwg_C4QjgfkOJT6fpK3C02PbTKpVVVVVlOywIb2OHEJ00SZ6CQrxjXsoPjvxTx>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvtddrfeehgdduudeiucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhepfffhvffukfhfgggtugfgjgesthhqredttddtvdenucfhrhhomhepofgrgihi
 mhgvucftihhprghrugcuoehmrgigihhmvgestggvrhhnohdrthgvtghhqeenucggtffrrg
 htthgvrhhnpefgjeettdejgffgffdvteeutdehtdehgeehueetkeefgefhtdetjeekledu
 gedvudenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpe
 hmrgigihhmvgestggvrhhnohdrthgvtghh
X-ME-Proxy: <xmx:8Bv5YHwpu8c4EQ4tU5_7aUl_xz919iSBFe9ACcS_kXhJZcpubvgy7w>
 <xmx:8Bv5YCTWiTQ4KAhNuP4J-qhhYd-Mdktqm11HM-MXMiBTV7MKFtbwlw>
 <xmx:8Bv5YKYhK1cZssL7riwZzueX-JuOsVblTRk_MjELAsTq4J-xbuyz6w>
 <xmx:8xv5YLDh071K2X7S0FRF3Utro3dXptoYi6eZLrr_wrKY84XrAG1OFg>
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Thu,
 22 Jul 2021 03:19:12 -0400 (EDT)
Date: Thu, 22 Jul 2021 09:19:09 +0200
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
Subject: Re: [PATCH v1 2/7] drm/bridge: Drop unused drm_bridge_chain functions
Message-ID: <20210722071909.3sefghktl4dolhao@gilmour>
References: <20210722062246.2512666-1-sam@ravnborg.org>
 <20210722062246.2512666-3-sam@ravnborg.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20210722062246.2512666-3-sam@ravnborg.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210722_001916_524786_8BD1BD14 
X-CRM114-Status: UNSURE (   8.11  )
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

On Thu, Jul 22, 2021 at 08:22:41AM +0200, Sam Ravnborg wrote:
> The drm_bridge_chain_{pre_enable,enable,disable,post_disable} has no
> users left and we have atomic variants that should be used.
> Drop them so they do not gain new users.
> 
> Adjust a few comments to avoid references to the dropped functions.
> 
> Signed-off-by: Sam Ravnborg <sam@ravnborg.org>
> Cc: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
> Cc: Maxime Ripard <mripard@kernel.org>
> Cc: Thomas Zimmermann <tzimmermann@suse.de>
> Cc: Andrzej Hajda <a.hajda@samsung.com>
> Cc: Neil Armstrong <narmstrong@baylibre.com>
> Cc: Robert Foss <robert.foss@linaro.org>
> Cc: Daniel Vetter <daniel@ffwll.ch>

Reviewed-by: Maxime Ripard <maxime@cerno.tech>

Maxime

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
