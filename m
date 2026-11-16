Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5C310606A31C
	for <linux-mediatek@archiver.kernel.org>; Mon, 16 Nov 2026 08:56:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=zQukLwHF
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=R32gEKrW706ZiyVdTAS8NJ1wU1G9YlflcPvlSWnKOWM=; b=zQukLwHFhcxo4qUnK1jZzw5JQQ
	6Tu0YVhkBrGzTCNw2BcQiRVU0BBSNqYooDkUKs5sgA6BqZEioMnDViQ2/tPPc3OdtRg+UspwQuPwG
	ZGcfcR2YL+kb6z12APnqsRqRTt+MlBLmhVWs7y+mKJkzk0mJmTUqlmaOLynitWyxwI2V3NJdhXIoL
	op/M9kaEZcmf7vxq1HGFc293O1B6HReUNg1YX3ViFC1NYKayAEyNTheZTww8rBCxqHyLvRtlW7/c4
	jFslxRPOFoPMdemGk5jq4r4OTjb6BBLNlSvwgQ4SN3ciit/8f3VFg/JFkjCk+/kZ7h2m/Xhug0Aj5
	feY/cn2A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xSsVV-00000001gII-0OuN;
	Mon, 16 Nov 2026 08:56:09 +0000
Received: from pidgin.makrotopia.org ([2a07:2ec0:3002::65])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xSsVS-00000001gHh-0EPw;
	Mon, 16 Nov 2026 08:56:07 +0000
Received: from local
	by pidgin.makrotopia.org with esmtpsa (TLS1.3:TLS_AES_256_GCM_SHA384:256:X25519MLKEM768)
	 (Exim 4.100.1)
	(envelope-from <daniel@makrotopia.org>)
	id 1xSsVK-000000007s4-3RPS;
	Mon, 16 Nov 2026 08:55:59 +0000
Date: Mon, 16 Nov 2026 08:55:45 +0000
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
Subject: Re: [PATCH v8 06/14] drm/bridge: it6505: bail out of the IRQ handler
 when status reads fail
Message-ID: <179481904177.211952.7029866729856302771@makrotopia.org>
References: <cover.1790552614.git.daniel@makrotopia.org>
 <2e003c2e6fdb56d03c3a6effdf090079afb2ffaf.1790552614.git.daniel@makrotopia.org>
 <179251509977.78870.3399297204284524303.b4-review@b4>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <179251509977.78870.3399297204284524303.b4-review@b4>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261116_005606_096360_DDFE276A 
X-CRM114-Status: GOOD (  16.20  )
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
> One first question it whether a read failure is realistic or not, and
> whether you have experienced it on real hardware.

I have not hit it on hardware. It takes a failing i2c transfer, e.g.
the chip NACKing while held in reset, which can be provoked through
the force_power_on_off debugfs knob: it6505_poweroff() only calls
disable_irq_nosync(), so a running handler keeps reading from a chip
that is being put into reset.

And hostesly, my interest here is basically getting audio going on
that Lenovo Ideapad, and for that

https://lore.kernel.org/all/cover.1784561622.git.daniel@makrotopia.org/

is sufficient. The 12 other patches are what Sahsiko has been chasing
me into, and all the complains it had looked valid and legitimate, so
I took on writing the fixes for that as well.

[...]
> I would consider replacing all the 3 it6505_read() calls with a single
> regmap_bulk_read(), making error management cleaner.
>
> What do you think about this option?
>
> Perhaps the three it6505_write() below could also become a bulk write.

Makes sense, INT_STATUS_01..03 are contiguous and the driver already
uses multi-byte transfers elsewhere. I'll switch to a bulk read and
write in v9.

Cheers

Daniel

