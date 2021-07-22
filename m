Return-Path: <SRS0=Khw4=MO=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 08EC8C63793
	for <linux-mediatek@archiver.kernel.org>; Thu, 22 Jul 2021 07:42:35 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id C465961279
	for <linux-mediatek@archiver.kernel.org>; Thu, 22 Jul 2021 07:42:34 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org C465961279
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=cerno.tech
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=vKLca2Vt7kkuuLB/ntrvYEcKMDELSWNcdRxMD/DMZ54=; b=Ss3Bld56OH97ow
	BzNu/tfAV37Gb3QbJrPdUhP6dR25A1RdVDcZmgVfTfGEjo3WJqloAYL+3hlidx2jalPuj6ErhSzqW
	HBheS+N/1SrnM4ayUdqbZ517u47Fi9MQJXUqttkdvwwAz2OPYeTxxcgyy6E7keUopq99F+qUL3S9i
	qXL5Kow1ODeA0QgdUgX0gUUGoASpV5ULuTaKigYff4LspKlxGqmdUk+Q+8j/brBtS0PmjWclwiP1X
	cBcV84jsJYl1qr9X2LBzgqEkcHT/R6Y7X6EfptLHmvYBzk0NjDOK+KK50/VskKaUItzv62mAT2iGW
	9vNf/0f8ZOQgXozsY+gg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1m6TLZ-000YmG-V1; Thu, 22 Jul 2021 07:42:21 +0000
Received: from new2-smtp.messagingengine.com ([66.111.4.224])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1m6TLK-000Yi2-Iu; Thu, 22 Jul 2021 07:42:08 +0000
Received: from compute6.internal (compute6.nyi.internal [10.202.2.46])
 by mailnew.nyi.internal (Postfix) with ESMTP id 9D2505816CC;
 Thu, 22 Jul 2021 03:42:05 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
 by compute6.internal (MEProxy); Thu, 22 Jul 2021 03:42:05 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=
 date:from:to:cc:subject:message-id:references:mime-version
 :content-type:content-transfer-encoding:in-reply-to; s=fm3; bh=v
 uZq0a+OMUd1soOo7W326W3NzchpzZAcVaI98OVEzX4=; b=M0BwsKI4vEVw61j0P
 /uaUaAiaXeFbJqbWJHfME/eiiSqnn7uE2IDjsf1Ba/GTHNZz+GVl99atm5/pZMqI
 8CFfw2ImdxQLBjDpyHt6QnofiBfiqWull5kXGFYsgzwENKPdAJFXRLYiWHLo2vFN
 Dk9Ma15UmZ0b+Fev5/9rLDA+XyhSllylkIV39SP1wRELRcoT/Y109z+bFvup+yX8
 rWM+76EoXklYxz9p7QTG+S6Zo7bKY2d0FxS37NAV66tpbMOX5DAE2+EmrRMqwK0L
 AfVuUZqQVrcWjcN/RHV419Lu8LUx7JmHJk2UgiEilSHV70qq2VW+4ooTUJWHz7pv
 LmqZw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-transfer-encoding:content-type
 :date:from:in-reply-to:message-id:mime-version:references
 :subject:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
 :x-sasl-enc; s=fm3; bh=vuZq0a+OMUd1soOo7W326W3NzchpzZAcVaI98OVEz
 X4=; b=MU7IrcR4M6oy+hGVA1r2Amoey7sa6stOWm1ksXXkUqASK8exmA8Hzs+qz
 eQBPY5Z/nYLELR9hhNfXEjR8qoPkVffJb3a39V65wi/SYL8fnh2FiNErgWxdVVAI
 CeUhtAUgxmvS9cVV9j79x4nbBoeZTzea1r2/A8ygDf/RkETBni/TsUTk8AIHobAM
 U9UHNns6jTW/d4PcpfH6CB+eSWfoPgrNQZE6QERuv2mbeN5wiA82APmveiFnOWSa
 /ROGn+VtRb7mGpGByJIlivTbltlHV585B6Snnp+8QZHsB0+9QfN75RoZ1Ie+y5DG
 lvimLEqP75Xg+zetacosmv1aan+Tg==
X-ME-Sender: <xms:SSH5YGx5ED3PKrYSkNiZtG5_53bbsm9emsGEUJ8txX6YZ6IbqlcYJg>
 <xme:SSH5YCTXoKzBXwb_Toqku4OSGENVS8CAYBxFEJ7SH-BBkNraXXXtdPe2vX97-47S1
 N-tT6lgr3nUoJGUa9c>
X-ME-Received: <xmr:SSH5YIVKVoZW9dIWVeh6368kdwoPGlgtFfIZ5gv_gUo_71wvRKUqp_6OL-pxFDzZgw5BuAh9PWU-AmrJ53PdR5poOER61mnE2GwP>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvtddrfeehgdduvdduucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhepfffhvffukfhfgggtugfgjgesthhqredttddtvdenucfhrhhomhepofgrgihi
 mhgvucftihhprghrugcuoehmrgigihhmvgestggvrhhnohdrthgvtghhqeenucggtffrrg
 htthgvrhhnpeevheeuheekkefftdduveevheetfffhudeghfevkeegkeehiefggfdvkeeh
 heeiheenucffohhmrghinhepsghoohhtlhhinhdrtghomhenucevlhhushhtvghrufhiii
 gvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpehmrgigihhmvgestggvrhhnohdrthgv
 tghh
X-ME-Proxy: <xmx:SSH5YMikMAcMp78Z6mDpchr-CH2b4be7U1a9ekRjW0KOdZYGVSGDEw>
 <xmx:SSH5YICdZVgBPDgvWWtU99izt9lPu2UACPRVn7LgjA41uHHirO8pHw>
 <xmx:SSH5YNKrq6GU8YXrpM9T-CK0iY0a3acObkNZ8vHDrIK0TCmCiyf6SQ>
 <xmx:TSH5YCzlZaI9-DMTqHMyZgb2ZNYgiUzFYqkQK2gquOviG5dsQROypA>
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Thu,
 22 Jul 2021 03:42:01 -0400 (EDT)
Date: Thu, 22 Jul 2021 09:42:00 +0200
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
Subject: Re: [PATCH v1 4/7] drm/bridge: lontium-lt9611: Use atomic variants
 of drm_bridge_funcs
Message-ID: <20210722074200.3pdgt63vmex76oug@gilmour>
References: <20210722062246.2512666-1-sam@ravnborg.org>
 <20210722062246.2512666-5-sam@ravnborg.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20210722062246.2512666-5-sam@ravnborg.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210722_004206_740474_D42F7122 
X-CRM114-Status: GOOD (  18.03  )
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

Hi,

On Thu, Jul 22, 2021 at 08:22:43AM +0200, Sam Ravnborg wrote:
> The atomic variants of enable/disable in drm_bridge_funcs are the
> preferred operations - introduce these.
> 
> Use of mode_set is deprecated - merge the functionality with
> atomic_enable()
> 
> Signed-off-by: Sam Ravnborg <sam@ravnborg.org>
> Cc: Andrzej Hajda <a.hajda@samsung.com>
> Cc: Neil Armstrong <narmstrong@baylibre.com>
> Cc: Robert Foss <robert.foss@linaro.org>
> Cc: Laurent Pinchart <Laurent.pinchart@ideasonboard.com>
> Cc: Jonas Karlman <jonas@kwiboo.se>
> Cc: Jernej Skrabec <jernej.skrabec@gmail.com>
> ---
>  drivers/gpu/drm/bridge/lontium-lt9611.c | 69 ++++++++++---------------
>  1 file changed, 27 insertions(+), 42 deletions(-)
> 
> diff --git a/drivers/gpu/drm/bridge/lontium-lt9611.c b/drivers/gpu/drm/bridge/lontium-lt9611.c
> index 29b1ce2140ab..dfa7baefe2ab 100644
> --- a/drivers/gpu/drm/bridge/lontium-lt9611.c
> +++ b/drivers/gpu/drm/bridge/lontium-lt9611.c
> @@ -700,9 +700,17 @@ lt9611_connector_mode_valid(struct drm_connector *connector,
>  }
>  
>  /* bridge funcs */
> -static void lt9611_bridge_enable(struct drm_bridge *bridge)
> +static void lt9611_bridge_atomic_enable(struct drm_bridge *bridge,
> +					struct drm_bridge_state *old_bridge_state)
>  {
>  	struct lt9611 *lt9611 = bridge_to_lt9611(bridge);
> +	const struct drm_display_mode *mode;
> +	const struct drm_crtc_state *crtc_state;
> +	struct hdmi_avi_infoframe avi_frame;
> +	int ret;
> +
> +	crtc_state = drm_bridge_new_crtc_state(bridge, old_bridge_state);
> +	mode = &crtc_state->mode;

So, yeah, it looks like you can't make the assumption that crtc_state is
going to be valid here.

I'm not entirely clear on how bridge states are allocated, but it looks
to me that they are through drm_atomic_add_encoder_bridges, which is
called for all the affected connectors in a commit here:

https://elixir.bootlin.com/linux/latest/source/drivers/gpu/drm/drm_atomic_helper.c#L744

Then, the atomic_enable call is made through
drm_atomic_bridge_chain_enable(), which is called in
drm_atomic_helper_commit_modeset_enables only if the CRTC is active and
needs a modeset.

I guess this means that we won't have a null pointer for crtc_state
there, but wouldn't that cause some issues? I can imagine a property
like the bpc count or output format where it wouldn't imply a modeset
but would definitely affect the bridges in the chain?

Maxime

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
