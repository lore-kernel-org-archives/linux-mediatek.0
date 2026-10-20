Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 17BC3606A321
	for <linux-mediatek@archiver.kernel.org>; Tue, 20 Oct 2026 16:52:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=mPyco4VM;
	dkim=pass (2048-bit key, unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=dkim header.b=k3+Fxa8z
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Message-Id:Date:References:
	In-Reply-To:Cc:To:From:Subject:Content-Transfer-Encoding:Content-Type:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=La8BSzU6EOhtfkyhIFlJpnRIC4j2c2GRZKQvEm7Ei+8=; b=mPyco4VMI8iC0ZyYq38FU6qzlL
	R/U3OPbHunuoxTQpxL5stU4AzTskHLk1oETwQaM3q3fgt38Try8CTR1DdhO2mWDR70Wa3dfWSHen8
	vxdlcPBOG3AVGoASj6OGDan1wYNtE1T2ewSbCQvpVb8A5NameBfXRLezqEg2LsE3cTmVFo7ZJYnDJ
	KHERk5Bvja9iIfR1cmUG6LdBLP+caZNALImwb9vASsKmDX6zClMWo5ZA3TCDfCb0OgVDLgpN+2UlZ
	mOJOqHV8jdUVd+riFS/p9yDW5228HuYaiTKUxGlmiu3i2veLcx7iN80U7bfZIJF7YOldN+ix5pI2c
	nIhMXgoA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xJD4V-0000000AFyD-0MVa;
	Tue, 20 Oct 2026 16:52:19 +0000
Received: from smtpout-02.galae.net ([185.246.84.56])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xJD4P-0000000AFut-0FfB;
	Tue, 20 Oct 2026 16:52:14 +0000
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id 6E7CD1A1294;
	Tue, 20 Oct 2026 16:52:11 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 3B8EC60393;
	Tue, 20 Oct 2026 16:52:11 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 27B1910328D3B;
	Tue, 20 Oct 2026 18:52:01 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1792515125; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=La8BSzU6EOhtfkyhIFlJpnRIC4j2c2GRZKQvEm7Ei+8=;
	b=k3+Fxa8zo7GnSCkZ0k0esCei06gWxur8ZWyCR7Zg7xc88FoeIGhVldzYe2h/pLuccTCmO5
	vifLPpFUN5nHzS8szl09bh7quVai8bPenBfwaRN580IWtIg/ScDdagziQnNvRcsILOQP3T
	PHYqhsYM1oopfItNe7MBmhhtehQe8nb//XBlYjjPUZor7X9dpZNO5qZZ6Jg+3czHupV+7G
	n19b3h5bPdgk09PZJP7/7LQ7FNaZ89ryH73J1sqfVOoDvob7N0D+CfZefOzAIPqnmldsAy
	wIOKBJTaFvx4vQSXZfFO8MMrlkz2HcC6Y1HNPKpysgyisWX+ztv611b745i+Cw==
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Subject: Re: [PATCH v8 02/14] drm/bridge: it6505: quiesce work items before
 powering off
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
In-Reply-To: <f9780400c44f9bb24754588503257d6dc86d3c77.1790552614.git.daniel@makrotopia.org>
References: <cover.1790552614.git.daniel@makrotopia.org>
 <f9780400c44f9bb24754588503257d6dc86d3c77.1790552614.git.daniel@makrotopia.org>
Date: Tue, 20 Oct 2026 18:51:39 +0200
Message-Id: <179251509974.78870.11099004101869522210.b4-review@b4>
X-Mailer: b4 0.16.0
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261020_095213_265475_FEE2DE88 
X-CRM114-Status: UNSURE (   9.95  )
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

On Mon, 28 Sep 2026 00:49:45 +0100, Daniel Golle <daniel@makrotopia.org> wrote:
> it6505_poweroff() asserts the reset line and disables the regulators
> while link_works, hdcp_wait_ksv_list and hdcp_work may still be
> running. The work items and the register accessors only check
> it6505->powered, and the flag is cleared last, so a work item keeps
> driving link training or HDCP authentication into a chip that is
> already off until the flag catches up. Cancel the three work items
> before touching the power rails. None of them takes a runtime PM
> reference or extcon_lock, so the synchronous cancel is safe from
> every context that powers the chip off.
> 
> [...]

Reviewed-by: Luca Ceresoli <luca.ceresoli@bootlin.com>

-- 
Luca Ceresoli, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com


