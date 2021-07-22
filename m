Return-Path: <SRS0=Khw4=MO=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6212BC63797
	for <linux-mediatek@archiver.kernel.org>; Thu, 22 Jul 2021 07:19:23 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id E52BF61283
	for <linux-mediatek@archiver.kernel.org>; Thu, 22 Jul 2021 07:19:22 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org E52BF61283
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=cerno.tech
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=j633EolblIGS0bQUP01cuh39tdTKdpUl23rBVKw7dRk=; b=Mt0sv5NiEvM5iP
	+59cRa8kkCjvPUHWnnxRJGg3HZlO62eEstAF+wsHtXrOi1Wm1/0PwfKL65I63sueBYuWaJ6gC3DbY
	zhwnlL6IMBZwpZEu/EkFBDA+qTQswfy9S7yJZpXbWN00V0DccfEhlUnR56IF1MBsO9dCNYJPrCtoN
	Rv+Id0lYHq3d55sG9xHLp+5LoUEye0d95uzYvrB6OFm3o7ZhioEQdwoYTzrnv3f5wKuc7BKEXS0+D
	YuV1CNnsbVWGt1LYR8Ck1YpXGjXf3cxhibVZQ0dULzWaGf/Uum4HmaGGHPy2heVB5qBdepUEJ9asp
	O/I1v3f+WJfgSIe3eVPg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1m6Sz9-000U0x-L3; Thu, 22 Jul 2021 07:19:11 +0000
Received: from new2-smtp.messagingengine.com ([66.111.4.224])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1m6Syw-000Tyg-VI; Thu, 22 Jul 2021 07:19:00 +0000
Received: from compute1.internal (compute1.nyi.internal [10.202.2.41])
 by mailnew.nyi.internal (Postfix) with ESMTP id 91390580A89;
 Thu, 22 Jul 2021 03:18:49 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
 by compute1.internal (MEProxy); Thu, 22 Jul 2021 03:18:49 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=
 date:from:to:cc:subject:message-id:references:mime-version
 :content-type:content-transfer-encoding:in-reply-to; s=fm3; bh=M
 MS57oheX02/j+i8L4R78gMJwqx7BCT+iNUbaucQL0o=; b=pbHzH66XoVemAYn+n
 0kl+xtwZoTWlmj4B3y1x/tI8esxHfdXOvcdqPMTqytR4n8INwhKL7EMr1nGc9ep7
 uzffQ/N/ceUzWRXwFzLADykEnkg9C0xTB1ScaVGqnoTf6opYywV2/AUuXX1LfkX+
 1l5rjGpQnjr4qQCd7cVdjOSEOwmNLdoeci9f7ed6on0fhcByPOo46Gwuexu1uGaX
 p36bn6V29Pdccsq4RFp0pzJ8gdSzzkDM5Q510PryODYsgxXHsHfKpw/36ufi1kDr
 tpgocoGPx2x7MX/HH6jtrJwp4XgDK9uifMr8R5e489aatJi8V65WhefiUbTWUid6
 yq5jQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-transfer-encoding:content-type
 :date:from:in-reply-to:message-id:mime-version:references
 :subject:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
 :x-sasl-enc; s=fm3; bh=MMS57oheX02/j+i8L4R78gMJwqx7BCT+iNUbaucQL
 0o=; b=oo/cd6FYAjfGq4mDh7z4q5F8hi8ffXIoSX5uZrOcIHkVCRW92Gh8OGSQZ
 d/vqRzQOoJvL8cTY5+nUVTuxfKpl5EIygHrRM1fbPpDR9XmU9xCwQfK6WmM17B0w
 fFXCByc82oqMoUpBCRakI0VTthvW0B0inwLJCTkeEPwts73EO1HM6mC4MUfYC6gG
 Zw6K0gm1Zv6WP6Jw9RmRzF545IiMPkRaN/uDnczbuL4HMZDjNkgKI5o3aDvPNFuO
 oajY7A1S7oaA7vbMUEK37p1tLGnbr05+1y8evSZG9p7ZRiBdrF8vc8ObYukvgXVR
 ec1A2kCG9SRZg4oBEjjEoMHaf+PnQ==
X-ME-Sender: <xms:1xv5YNX6GYxaMU4-W5n5t3QKEyp0q7Yo5urSJ3AU91lMqUlOXzqg6w>
 <xme:1xv5YNlGvTgLyxrolPp9l2jGGh0aGsm2aB0ObVUdUkUV7mXplcs1QuXRb8UuFZo9r
 e1eKNKr4nDbJRJ8cHg>
X-ME-Received: <xmr:1xv5YJZ4qqviH36l_3GFwH02NRaxnDqvS9XcTWQzmSOwTpWWfDz84dSKwmwaRiW_SUqEMwe5oKPJ-aWpu4NZGL5rstHCVph-TbO3>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvtddrfeehgdduudeiucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhepfffhvffukfhfgggtugfgjgesthhqredttddtvdenucfhrhhomhepofgrgihi
 mhgvucftihhprghrugcuoehmrgigihhmvgestggvrhhnohdrthgvtghhqeenucggtffrrg
 htthgvrhhnpefgjeettdejgffgffdvteeutdehtdehgeehueetkeefgefhtdetjeekledu
 gedvudenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpe
 hmrgigihhmvgestggvrhhnohdrthgvtghh
X-ME-Proxy: <xmx:1xv5YAWIF8MQcmkV17sj6Db2LOmkOklinoXKUWM6syNpNsAie1y0kA>
 <xmx:1xv5YHksGSwrEmPBwbBqbnMRiReZ1DZJ-xIpC3Ylxf_ORpVIpvw3Bg>
 <xmx:1xv5YNdBH9PshBH8M0p46X6WDa1rDnBQJgzK7-x8E7w9tCotjLZNqw>
 <xmx:2Rv5YJ2SY8YzIfyId2rkqD-Tt5eYeQEpEUlVNnTiiIC5PTHuuQ2CGA>
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Thu,
 22 Jul 2021 03:18:46 -0400 (EDT)
Date: Thu, 22 Jul 2021 09:18:44 +0200
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
Subject: Re: [PATCH v1 1/7] drm/bridge: ps8640: Use atomic variants of
 drm_bridge_funcs
Message-ID: <20210722071844.g2kkmc7y2gcc6nir@gilmour>
References: <20210722062246.2512666-1-sam@ravnborg.org>
 <20210722062246.2512666-2-sam@ravnborg.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20210722062246.2512666-2-sam@ravnborg.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210722_001859_105951_A1481B1A 
X-CRM114-Status: UNSURE (   7.22  )
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

On Thu, Jul 22, 2021 at 08:22:40AM +0200, Sam Ravnborg wrote:
> The atomic variants of enable/disable in drm_bridge_funcs are the
> preferred operations - introduce these.
> 
> The ps8640 driver used the non-atomic variants of the drm_bridge chain
> functions - convert these to the atomic variants.
> 
> Signed-off-by: Sam Ravnborg <sam@ravnborg.org>
> Cc: Andrzej Hajda <a.hajda@samsung.com>
> Cc: Neil Armstrong <narmstrong@baylibre.com>
> Cc: Robert Foss <robert.foss@linaro.org>
> Cc: Laurent Pinchart <Laurent.pinchart@ideasonboard.com>
> Cc: Jonas Karlman <jonas@kwiboo.se>
> Cc: Jernej Skrabec <jernej.skrabec@gmail.com>

Reviewed-by: Maxime Ripard <maxime@cerno.tech>

Maxime

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
