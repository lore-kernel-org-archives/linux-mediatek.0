Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4EB5CC71153
	for <linux-mediatek@archiver.kernel.org>; Mon,  4 Sep 2023 07:27:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:Cc
	:References:In-Reply-To:Subject:To:From:Date:Message-ID:Reply-To:MIME-Version
	:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=JNhVO7J32g/jNSkAzwDwQKwnl1WMg+JmQO6bD+dAKvY=; b=4NFkduvktmxEibs7cZ3vWo8YZw
	Si5D1yRT3FeA4KVI5R63BEIXlQhkqRqH2Fk9CsExtk68xZTA5nhyQVuoJmoOO5eYfODaH2C88FZCW
	vNLrz7p2mGbF8ornq2zMLto8ZYFGVjTT4m/GDUjQp4KNMmwkqDbtTQcrTKl0pMBEQzCYkfi3ndplo
	RFuQqBV2lbA6Uyy4qYkrsU4uBX4bg1G0TsobhNSbFdaeUiSdwWdhVQbi6CUJ1ayEgK+eTLluuJzwz
	mIgH2KFjiVzPGR+Tgqo/kZpD3B/BJb6VS/qidiD5fItL5CVlQqykJlO6XWkIVY19H5YaRZOduS629
	w1O9tnGw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qd3za-003Thj-1y;
	Mon, 04 Sep 2023 07:27:26 +0000
Received: from sin.source.kernel.org ([2604:1380:40e1:4800::1])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qd3zV-003Tg9-1C;
	Mon, 04 Sep 2023 07:27:22 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by sin.source.kernel.org (Postfix) with ESMTPS id 16715CE0E16;
	Mon,  4 Sep 2023 07:27:18 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0359CC433C8;
	Mon,  4 Sep 2023 07:27:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1693812436;
	bh=zS+k6SmfaPf7quDUXWLnC5FUAjLDdauLMkbmb5Ev2aY=;
	h=Date:From:To:Subject:In-Reply-To:References:Cc:From;
	b=pxeD5oCW/zTniYTuovwvrai8EtpSH9fm8CngPOFps19j4rVRk/8pV+pOeSww/BLtf
	 whX4b6l0cDNTwsrEjX8Hh+g5OgrYpGLPZmJ9xr7cXcKPFDwNEw4wY79hd8Y+3LkQid
	 urVrQuN8XqfphF5u1o5v8UK+gPJIvY7cZaTrg6O+f1Tg44C9RLhfMrOk/SXkO7kvvT
	 mHEbuI35H2yT7tnFy6P/MRaTrr1/3gcSkGG10zACp2sFbVFSgMJ3ZK72tsDT9acu8L
	 6UlV9N/Q0cqQ19zTqpSfgBu/4pT6DFYXP6P4Z3a05eSQrueKJjurLWOliC7ajwokLl
	 UrTBMNdG7O3LQ==
Message-ID: <060226e5823e782a87c50b68d356e27b.mripard@kernel.org>
Date: Mon, 04 Sep 2023 07:27:13 +0000
From: "Maxime Ripard" <mripard@kernel.org>
To: "Douglas Anderson" <dianders@chromium.org>
Subject: Re: [RFT PATCH 05/15] drm/mediatek: Call
 drm_atomic_helper_shutdown() at shutdown time
In-Reply-To: <20230901164111.RFT.5.I2b014f90afc4729b6ecc7b5ddd1f6dedcea4625b@changeid>
References: <20230901164111.RFT.5.I2b014f90afc4729b6ecc7b5ddd1f6dedcea4625b@changeid>
Cc: airlied@gmail.com, angelogioacchino.delregno@collabora.com, chunkuang.hu@kernel.org, daniel@ffwll.ch, dri-devel@lists.freedesktop.org, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, linux-mediatek@lists.infradead.org, matthias.bgg@gmail.com, p.zabel@pengutronix.de, "Maxime
 Ripard" <mripard@kernel.org>
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230904_002721_610910_755EA08E 
X-CRM114-Status: UNSURE (   9.15  )
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
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On Fri, 1 Sep 2023 16:41:16 -0700, Douglas Anderson wrote:
> Based on grepping through the source code this driver appears to be
> missing a call to drm_atomic_helper_shutdown() at system shutdown
> time. Among other things, this means that if a panel is in use that it
> won't be cleanly powered off at system shutdown time.
> 
> 
> [ ... ]

Reviewed-by: Maxime Ripard <mripard@kernel.org>

Thanks!
Maxime

