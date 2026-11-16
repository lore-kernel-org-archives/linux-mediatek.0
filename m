Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 40093606A31C
	for <linux-mediatek@archiver.kernel.org>; Mon, 16 Nov 2026 07:22:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=vKtNYkrj;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=dkim header.b=VM6McpRG
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:References:
	Subject:From:To:Cc:Message-Id:Date:Content-Type:Content-Transfer-Encoding:
	Mime-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=cOVpK7nTTongaD/rCENlqdfqICCKBI5pgjG4YudvvrE=; b=vKtNYkrjvhZ/0w
	6JOmFBrAJn+gEjD3tfhJLbGBsmiBI7CMl3x6WuBGv6NYRQTgvzyAWY8FW58uacW3h3VBGC7GKo/py
	CvGtuEhP9gwNNuyUvc9PX2wIapNUegVc6E6dUplWB/X5mbAKLZyuLkH6LGtKW0rv7ew/BP/bqzjk7
	bKRTEkqZylgduksmpdRNJuamtYJBvbWYNfxD/XazvpaQJNaxmsl21DXYV15n5ysND6IpL+NpfiIkq
	3CmVCMVrgWIYB9FhMHVihtEkMY5AqGgb8xSaNiUDT36ijlFovZrbYxoJ7jAuajoxlCrBI8FqZresI
	RTEvyNOkRLdh3rPWwysA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xSr36-00000001OcL-3zqU;
	Mon, 16 Nov 2026 07:22:44 +0000
Received: from smtpout-04.galae.net ([185.171.202.116])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xSr32-00000001ObI-1sT0
	for linux-mediatek@lists.infradead.org;
	Mon, 16 Nov 2026 07:22:43 +0000
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-04.galae.net (Postfix) with ESMTPS id 654CDC4EFD7;
	Mon, 16 Nov 2026 07:22:39 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 875936023F;
	Mon, 16 Nov 2026 07:22:35 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 61E9211BC0861;
	Mon, 16 Nov 2026 08:22:24 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1794813754; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=cOVpK7nTTongaD/rCENlqdfqICCKBI5pgjG4YudvvrE=;
	b=VM6McpRGS1u0+sxCmRE1nSQ3W1vVEWsYLMWaz9R4X3nLzBcsDmlPQn6M+KS7wN0gqXVvjU
	+x4795wDrS//2poojiTFEdqERKHuqnkukyQzP08XODJ8VGp7P1f/mzaThZyZrc/feQFKdL
	gi/98kFKaUOdnroVn2IOKQaw6gs7k+7xQ+ogyrh5187nGYp8O7SnVpxAMTZEbnER1D7iMb
	xEnzImGJ+Y40tjI6QYKnsV+Ny3mtB9eNTdS6xb1+qrUwVdS20kzIgFOuaE1xAmNm9niNLb
	7WTyo0jWTeV6o1HFD7hxNOPuzty2Y3t+NIFVGVfbT6CmEZouizw2LTrTl5o5iw==
X-Archived-By: <archiver.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Mon, 16 Nov 2026 08:22:23 +0100
Message-Id: <DMWGDF7FB9IX.4M4NOJ417NRA@bootlin.com>
Cc: "Jani Nikula" <jani.nikula@intel.com>, "Dmytro Malovanyi"
 <dmitrymalovanyy@gmail.com>
To: "Daniel Golle" <daniel@makrotopia.org>, "Andrzej Hajda"
 <andrzej.hajda@intel.com>, "Neil Armstrong" <neil.armstrong@linaro.org>,
 "Robert Foss" <rfoss@kernel.org>, "Laurent Pinchart"
 <Laurent.pinchart@ideasonboard.com>, "Jonas Karlman" <jonas@kwiboo.se>,
 "Jernej Skrabec" <jernej.skrabec@gmail.com>, "Luca Ceresoli"
 <luca.ceresoli@bootlin.com>, "Maarten Lankhorst"
 <maarten.lankhorst@linux.intel.com>, "Maxime Ripard" <mripard@kernel.org>,
 "Thomas Zimmermann" <tzimmermann@suse.de>, "David Airlie"
 <airlied@gmail.com>, "Simona Vetter" <simona@ffwll.ch>, "Matthias Brugger"
 <matthias.bgg@gmail.com>, "AngeloGioacchino Del Regno"
 <angelogioacchino.delregno@collabora.com>, "Hermes Wu"
 <hermes.wu@ite.com.tw>, "Allen Chen" <allen.chen@ite.com.tw>, "Pin-yen Lin"
 <treapking@chromium.org>, "Chen-Yu Tsai" <wenst@chromium.org>,
 <dri-devel@lists.freedesktop.org>, <linux-kernel@vger.kernel.org>,
 <linux-arm-kernel@lists.infradead.org>,
 <linux-mediatek@lists.infradead.org>
From: "Luca Ceresoli" <luca.ceresoli@bootlin.com>
Subject: Re: [PATCH v8 00/14] drm/bridge: it6505: DP audio support +
 shared-DAI hw_params fix
X-Mailer: aerc 0.22.0
References: <cover.1790552614.git.daniel@makrotopia.org>
 <avhRv2PdtfFMOu2v@makrotopia.org>
In-Reply-To: <avhRv2PdtfFMOu2v@makrotopia.org>
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261115_232240_646921_95925A37 
X-CRM114-Status: GOOD (  18.16  )
X-Spam-Score: -2.1 (--)
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
X-Spam-Status: No, score=-5.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS autolearn=no autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Hello Daniel,

On Sat Nov 14, 2026 at 1:19 PM CET, Daniel Golle wrote:
> Hi,
>
> On Mon, Sep 28, 2026 at 12:49:25AM +0100, Daniel Golle wrote:
>> Revive HDMI/DP audio support for the it6505, originally posted by
>> Jiaxin Yu [1], rebased onto current -next with the review feedback
>> addressed: &client->dev is gone (the driver gained it6505->dev) and
>> "#sound-dai-cells" has since been added by commit 325af1bef5b9
>> ("dt-bindings: display: bridge: it6505: Add #sound-dai-cells").
>>
>> Patches 1-12 fix pre-existing bugs found during review of earlier
>> versions of this series; they carry Fixes: tags and are ordered first
>> so stable trees can pick them.
>>
>> Patch 13 wires up the it6505 audio helpers via hdmi_codec_ops,
>> unblocking the mt8186-mt6366 sound card which references it6505 as
>> the I2S3 codec. Patch 14 makes hw_params succeed with no display
>> attached, needed when the I2S bus is shared with another codec as on
>> MT8186 "steelix" Chromebooks, where the speaker path must keep
>> working regardless of the it6505 link state.
>>
>> Tested on a MT8186 (google,steelix) Chromebook: the sound card comes
>> up, speakers, microphone and headset jack work. HDMI/DP audio output
>> itself could not be tested for lack of a suitable adapter cable.
>
> Kind reminder regarding this series.
> Some of the patches have received a review, others did not yet.
> I'd be great to have the Ideapad with working audio without being
> force to build with downstream kernel patches...
>
> I've added Dmytro Malovanyi and Jani Nikula who have both also
> recently been involved with other patches for the same driver.
>
> If there is anything I can do from my end, please let me know.

Yes, you can reply to the questionss I asked about some of your patches.

Luca

--
Luca Ceresoli, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

