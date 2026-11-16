Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9615B606A31C
	for <linux-mediatek@archiver.kernel.org>; Mon, 16 Nov 2026 08:53:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=nhIhedT9
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=yeyghiiI6ugMxMzEYBna16w+kHo55vTWBdtlwVeJhVE=; b=nhIhedT9KGax/Z3vOpQ37ZdhlU
	UwOBd4c8yeqK96jPoNlFRqGOrW5dFXYxddswTLlIvAW8qbU/Nv7LmVc5L42jzvWF9Z70l64ON+d4n
	Xy5wQUTuXR7jb8O2UZog1YBWueeq6po64fx5kEzJQjuMTxc50TsNNgMLH/cbDl/4bciDvylop2/ek
	mGKHAcAudDK22Uy07/6egQkPxdCym24XEKflCx5DscspeZaXD89V0A1+wo4IZff469Y11J6C80DIK
	pHPrzK87JP54qa7HMURxTnTXpT9cBOt0kZpko/P7qF4A7bHk39ZgM04nH74sNxfwvv/CPE0peqF4v
	U5iBjXow==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xSsSv-00000001g1Y-1CrQ;
	Mon, 16 Nov 2026 08:53:29 +0000
Received: from pidgin.makrotopia.org ([2a07:2ec0:3002::65])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xSsSr-00000001g0r-3Kbg;
	Mon, 16 Nov 2026 08:53:27 +0000
Received: from local
	by pidgin.makrotopia.org with esmtpsa (TLS1.3:TLS_AES_256_GCM_SHA384:256:X25519MLKEM768)
	 (Exim 4.100.1)
	(envelope-from <daniel@makrotopia.org>)
	id 1xSsSY-000000007q8-22SV;
	Mon, 16 Nov 2026 08:53:06 +0000
Date: Mon, 16 Nov 2026 08:52:46 +0000
From: Daniel Golle <daniel@makrotopia.org>
To: Luca Ceresoli <luca.ceresoli@bootlin.com>
Cc: Andrzej Hajda <andrzej.hajda@intel.com>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Robert Foss <rfoss@kernel.org>,
	Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
	Jonas Karlman <jonas@kwiboo.se>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Hermes Wu <hermes.wu@ite.com.tw>,
	Allen Chen <allen.chen@ite.com.tw>,
	Pin-yen Lin <treapking@chromium.org>,
	Chen-Yu Tsai <wenst@chromium.org>, dri-devel@lists.freedesktop.org,
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org
Subject: Re: [PATCH v8 04/14] drm/bridge: it6505: unregister DP AUX adapter
 on bridge detach
Message-ID: <179481904177.211952.12953364281549371036@makrotopia.org>
References: <cover.1790552614.git.daniel@makrotopia.org>
 <ae0941be8fb5e20a309f2e30b5e2d8818168aa38.1790552614.git.daniel@makrotopia.org>
 <179251509976.78870.2847307917157375162.b4-review@b4>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <179251509976.78870.2847307917157375162.b4-review@b4>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261116_005325_831713_7E4F96EA 
X-CRM114-Status: GOOD (  10.89  )
X-Spam-Score: -1.9 (-)
X-BeenThere: linux-mediatek@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-mediatek.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-mediatek/>
List-Post: <mailto:linux-mediatek@lists.infradead.org>
List-Help: <mailto:linux-mediatek-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mediatek>,
 <mailto:linux-mediatek-request@lists.infradead.org?subject=subscribe>
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
X-Spam-Status: No, score=-3.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=no
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Hi Luca,

On Tue, Oct 20, 2026 at 06:51:39PM +0200, Luca Ceresoli wrote:
> The drm_dp_aux_unregister() docs don't say it is idempotent, so is it fair
> to assume it is and always will?

It is today, as both drm_dp_aux_unregister_devnode() and
i2c_del_adapter() return early for an adapter that is not registered,
but you are right that this is not a documented guarantee.

> I think it would be much cleaner if user drivers took case of calling it at
> the appropriate times, not more.
>
> A flag similar to it6505->extcon_state used in patch 3 could allow that?

Agreed, I'll track the registration in a flag in v9, like
extcon_registered from patch 1.

Cheers

Daniel

