Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6F7F960A2604
	for <linux-mediatek@archiver.kernel.org>; Tue, 20 Oct 2026 16:52:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=GkBRk8nl;
	dkim=pass (2048-bit key, unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=dkim header.b=BH61s1Gl
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Message-Id:Date:References:
	In-Reply-To:Cc:To:From:Subject:Content-Transfer-Encoding:Content-Type:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=6XcyUJtIkiO9vvPz7IKkbuTRkju9mP6Fus4ZIhOD+q4=; b=GkBRk8nlZRMIwOThg/a0TwiaBm
	BVgayw8jlvi6UgX2sxPxvKdxOrHVCe0l6iGL0IyeCDLuKxgIDNkQsGvVSAz/5o5/M7DInPne/woGw
	B11mADcCgWujw2wPY8L4D5Rhxi5/Hf/D19NuRnyWhA81YsGVLWRq1jZt/uozsyHlGUcNmO2XyxsLn
	MDzaE9ltIWarc5CqX4Q1iq8XOXfYyHcerGGCZBr+0gKXz8+PPPxIzQyyfV6xNzVxtqGXmNdYRze15
	j/Bbodj2UlLs7J1Tqlgwj/xxH5Vd27u3gDfBJEmX2Gr7IQm9H6Imjwo45k2AbySuIa3FSilTHb7DR
	YtfJr3yA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xJD57-0000000AGVK-3tNv;
	Tue, 20 Oct 2026 16:52:58 +0000
Received: from smtpout-04.galae.net ([185.171.202.116])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xJD53-0000000AGPc-1L3V
	for linux-mediatek@lists.infradead.org;
	Tue, 20 Oct 2026 16:52:56 +0000
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-04.galae.net (Postfix) with ESMTPS id 0ED18C5CD67;
	Tue, 20 Oct 2026 16:53:50 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 7580B60393;
	Tue, 20 Oct 2026 16:52:51 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 4571010328DD2;
	Tue, 20 Oct 2026 18:52:44 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1792515169; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=6XcyUJtIkiO9vvPz7IKkbuTRkju9mP6Fus4ZIhOD+q4=;
	b=BH61s1Glkuc4IxXGejfE6yKzOVXmvtqYAN418w+0wiTjCfAgCoLPyXHjEB3XKx+HNVboKs
	Lql+vfMdKlrL5nJFY8D/KMkV2C8b8UePQAagBAp2uQrZT6smuK0kG0GDcKseWtpMOuoCPU
	RbbLsipSRVXHkIs4d6Ao/o7GEpOxJcANWzb6C6HtNAxEb3Dbkm7IxbNsDs6uiTtEr7/sDD
	/QMO9thr39SGBEJujl4rV+038KKA/68H/1aLze6C4RshH52vFQF5MzsbbOtOIpUsUHhFcI
	472tEUA2/BCueBZEbchM9vtGq5wq/UyMSLkjY6VDzxGCNql0f1S3/9eXog89Kg==
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Subject: Re: [PATCH v8 07/14] drm/bridge: it6505: avoid division by zero in
 pixel clock calculation
From: Luca Ceresoli <luca.ceresoli@bootlin.com>
To: Daniel Golle <daniel@makrotopia.org>
Cc: Andrzej Hajda <andrzej.hajda@intel.com>, 
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>, 
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, 
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Luca Ceresoli <luca.ceresoli@bootlin.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 Hermes Wu <hermes.wu@ite.com.tw>, Allen Chen <allen.chen@ite.com.tw>, 
 Pin-yen Lin <treapking@chromium.org>, Chen-Yu Tsai <wenst@chromium.org>, 
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org
In-Reply-To: <4316fa443587b7778d4f135d8656511a11233d87.1790552614.git.daniel@makrotopia.org>
References: <cover.1790552614.git.daniel@makrotopia.org>
 <4316fa443587b7778d4f135d8656511a11233d87.1790552614.git.daniel@makrotopia.org>
Date: Tue, 20 Oct 2026 18:51:39 +0200
Message-Id: <179251509978.78870.5665512963665107929.b4-review@b4>
X-Mailer: b4 0.16.0
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261020_095253_554991_893ECAAE 
X-CRM114-Status: UNSURE (   6.31  )
X-CRM114-Notice: Please train this message.
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
X-Spam-Status: No, score=-14.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no
	version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On Mon, 28 Sep 2026 00:50:25 +0100, Daniel Golle <daniel@makrotopia.org> wrote:
> it6505_calc_video_info() checks the sum of the three pixel clock
> counter samples for zero before dividing it by 3, so sums of 1 or 2
> truncate to 0 and the following pixel clock calculation divides by
> zero. Divide first and check the result.

Reviewed-by: Luca Ceresoli <luca.ceresoli@bootlin.com>

-- 
Luca Ceresoli, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com


