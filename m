Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 79600606A33D
	for <linux-mediatek@archiver.kernel.org>; Thu, 19 Nov 2026 16:26:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=NDZVRjXW
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=0Q5O7wQWWp7G0PSZR747dT3nh3JKK2m5Y0byjfb03Bk=; b=NDZVRjXWorN76JcouM92vY+ZJ6
	rmYpGVL0zHVZn39n2oG3rUvPFzM7q36m0HJhEJjTFIcJSgEHaDgvXVnTrVK6vdXurxY9gWKOAzs9a
	w7TWeFSLV/BN4OZzOx067hhNmY6dG1Qix6F8SExfRapk0/F+ujmRH2l9wFZHQIBZOBbgLIKxxJ8ZS
	LY7JNCi1O6/oMa4beEvL3X00nkw+paZRdI74iidzsKl0NpPD+LIqR6mhA/03kcjnrfJq1QhjtdOit
	ldFtM/VgUV2XTCW/cIxUA4BciNrOWJ3PSaqRJPKBRsUsdgy3svZMTFE0aahO2aDYojUV5X674RLqP
	Cgm9UC3A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xU4yP-0000000CdKB-0XFb;
	Thu, 19 Nov 2026 16:26:57 +0000
Received: from pidgin.makrotopia.org ([2a07:2ec0:3002::65])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xU4yK-0000000CdIa-4A8s;
	Thu, 19 Nov 2026 16:26:55 +0000
Received: from local
	by pidgin.makrotopia.org with esmtpsa (TLS1.3:TLS_AES_256_GCM_SHA384:256:X25519MLKEM768)
	 (Exim 4.100.1)
	(envelope-from <daniel@makrotopia.org>)
	id 1xU4y2-000000007XY-2OT2;
	Thu, 19 Nov 2026 16:26:34 +0000
Date: Thu, 19 Nov 2026 16:26:23 +0000
From: Daniel Golle <daniel@makrotopia.org>
To: Hermes.Wu@ite.com.tw
Cc: luca.ceresoli@bootlin.com, andrzej.hajda@intel.com,
	neil.armstrong@linaro.org, rfoss@kernel.org,
	Laurent.pinchart@ideasonboard.com, jonas@kwiboo.se,
	jernej.skrabec@gmail.com, maarten.lankhorst@linux.intel.com,
	mripard@kernel.org, tzimmermann@suse.de, airlied@gmail.com,
	simona@ffwll.ch, matthias.bgg@gmail.com,
	angelogioacchino.delregno@collabora.com, allen.chen@ite.com.tw,
	treapking@chromium.org, wenst@chromium.org,
	dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org
Subject: Re: [PATCH v8 08/14] drm/bridge: it6505: avoid division by zero in
 audio FS debug print
Message-ID: <av8jL0W1vgdqPQhu@makrotopia.org>
References: <cover.1790552614.git.daniel@makrotopia.org>
 <26ee2c94c42fb09c081201071cb5730c96c8c25b.1790552614.git.daniel@makrotopia.org>
 <179251509978.78870.2485132679226608837.b4-review@b4>
 <179481904178.211952.8076269834336042526@makrotopia.org>
 <9485b4a86b124cc3a528ca147609bf4c@ite.com.tw>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <9485b4a86b124cc3a528ca147609bf4c@ite.com.tw>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261119_082653_027270_615B13B9 
X-CRM114-Status: GOOD (  22.04  )
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

On Wed, Nov 18, 2026 at 03:12:14AM +0000, Hermes.Wu@ite.com.tw wrote:
> Hi Daniel, Luca,
> 
> On Mon, Nov 16, 2026 at 08:56:18AM +0000, Daniel Golle wrote:
> > On Tue, Oct 20, 2026 at 06:51:39PM +0200, Luca Ceresoli wrote:
> > > If you could share what that register is for, it would probably answer some
> > > of those questions.
> >
> > I don't have documentation for it either, and with ITE gone there is
> > nobody left to ask.
> 
> REG_AUDIO_INPUT_FREQ (0xBE) is a read-only input audio frequency
> counter. The driver uses it to check whether the I2S BCLK is
> present and changing, i.e. whether there is audio input.

Great to see you are actually still around, and thank you for confirming
that we can drop the register read there.

I was afraid the bouncing emails of the former driver maintainers would
indicate the driver has now been orphaned. It'd hence be great if you
can enlist yourself in the MAINTAINERS file for that driver.

> > As for the logging, I don't think it is worth an extra i2c read and a
> > division in the enable path, so in v9 I'll drop the read and the
> > print from it6505_enable_audio() instead of guarding the division.
> 
> Fine with us, the value is only informational there.

+1

