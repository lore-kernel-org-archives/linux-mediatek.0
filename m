Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 853B7606A323
	for <linux-mediatek@archiver.kernel.org>; Mon, 16 Nov 2026 08:56:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=F+P3bSx8
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=nWHWGQOqMeeouKQY4a/YXbC8ScdtcsCKi4ObLazlgrU=; b=F+P3bSx8aZfiHUkOZmsH1AHamn
	4QY+2mojBY/Zoq+Jgr68EIxPUFKYIysvGOq+CnINu9rrdAIAwS0s/s/VwKdbBMFLVM7mKDB2uwZyl
	jjUvKy2HGeFXmzUGOtdxYtfxiP9XvsvDYY6Vmb640JQpKSiIJqARQeWuJOjVEt0IjCFRm9rKemv7j
	fU6CyjlYDgKZ6Sit8dYXtJ8gkZr2NcvicFTqO1b3OHz6UpKciwjWKg2GIQQTnrdKwHt2sSJzr/VeB
	0749ELYxP4Sft06r97KbDUjbOj3cfaoqAwKIkPnhgAIdayxYp9YAWLwFl/Hr/2Tdd5Ms/G7J2fxis
	p19ZYFPg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xSsW2-00000001gOH-18CM;
	Mon, 16 Nov 2026 08:56:42 +0000
Received: from pidgin.makrotopia.org ([2a07:2ec0:3002::65])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xSsVz-00000001gMo-1W4U;
	Mon, 16 Nov 2026 08:56:40 +0000
Received: from local
	by pidgin.makrotopia.org with esmtpsa (TLS1.3:TLS_AES_256_GCM_SHA384:256:X25519MLKEM768)
	 (Exim 4.100.1)
	(envelope-from <daniel@makrotopia.org>)
	id 1xSsVs-000000007sv-10gN;
	Mon, 16 Nov 2026 08:56:33 +0000
Date: Mon, 16 Nov 2026 08:56:18 +0000
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
Subject: Re: [PATCH v8 08/14] drm/bridge: it6505: avoid division by zero in
 audio FS debug print
Message-ID: <179481904178.211952.8076269834336042526@makrotopia.org>
References: <cover.1790552614.git.daniel@makrotopia.org>
 <26ee2c94c42fb09c081201071cb5730c96c8c25b.1790552614.git.daniel@makrotopia.org>
 <179251509978.78870.2485132679226608837.b4-review@b4>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <179251509978.78870.2485132679226608837.b4-review@b4>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261116_005639_399998_5CEBCF8D 
X-CRM114-Status: GOOD (  20.00  )
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
> By just looking at your patch and the current driver code I'm failing to
> understand what's going on with the REG_AUDIO_INPUT_FREQ register:
>
>  * it is read, but never written
>  * its value is used by:
>    - it6505_enable_audio() only for logging: is that logging really useful?
>    - it6505_audio_input(), just checking whether it is 0xFF or not; what's
>      that 0xFF? Is it documented? A macro hinting at what 0xFF means would
>      be better than just '0xFF'
>
> If you could share what that register is for, it would probably answer some
> of those questions.

I don't have documentation for it either, and with ITE gone there is
nobody left to ask. Judging from the debug print, which computes the
sample rate as 6750 / regbe kHz, it is a read-only measurement of the
audio sample period, and 0xff looks like the counter saturating when
no audio clock is present.

As for the logging, I don't think it is worth an extra i2c read and a
division in the enable path, so in v9 I'll drop the read and the
print from it6505_enable_audio() instead of guarding the division.
Without documentation I'd rather not invent a name for 0xff and leave
it6505_audio_input() as it is.

Cheers

Daniel

