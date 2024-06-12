Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 403FBC27C53
	for <linux-mediatek@archiver.kernel.org>; Wed, 12 Jun 2024 07:57:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ssaxYkVceyn7ICHHraGM/vbLmPV2xtb883mRncUVHuQ=; b=21XUtaTy5fECf8
	ZXK3pmuyjkIwx14hiFBa/Xs3lFBq7QDdrQL4sSqBdb1Q/ub7e2WSxMCgim8Eea1kQfDRVAh2amaFu
	nuVHjnrV+XXWyi+dtt33czwwmvdzQBPbVDtRrr4UJNf58FlwTi4ohAARMP6WfpSsWfdMAPM4E+B5A
	y1CJ3/gzMddts0XO/kQCNMuuA0FXwfFYmmJybCw3Ukm57M56IqMXDoYbRcFmefy/k2KpmfDSCOoTv
	qifYV0o9q6yVvQXpynx46rHiXlxV4ZPHe9+XinQwlx57AJpngcfJH0B22y8drvdEBeOzqWgP2+jxB
	Zw9qnIvOTM59DyEzUMog==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sHIr2-0000000BYVb-1qQi;
	Wed, 12 Jun 2024 07:57:12 +0000
Received: from sin.source.kernel.org ([145.40.73.55])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sHIqz-0000000BYTd-05r6;
	Wed, 12 Jun 2024 07:57:10 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id A9A97CE2065;
	Wed, 12 Jun 2024 07:57:06 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 955CAC3277B;
	Wed, 12 Jun 2024 07:57:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1718179025;
	bh=hESmEHrQk7WtxKynr/6hcy4GMsBs6FznD7ZDEnXzOqo=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=QCw/Q+KsYXtgn/fPiS76aWlM7QL+2rbkPu2yKxx35dexv6Lv+6l2LUysiI38vX3BB
	 Xg3MqkGpvtDom18PuFoW68C8QU2J0EYMFOliXNfuXTPzWycZmErA9cCKg2Cqcfck3c
	 WfdZqZN0RtNAEfvbsUcNkQ38oOUtFucjri3wZFoZxKPhK0gQAv/v25YlHkI2nMbIPk
	 Q341ZJdXEmFJwKGFC4t3YNEUOInpFeJNKMrhx0C/WWMGMq3p1fpY8EXO3V0SQ0tSn7
	 vtqqOElOkUObCTrFTzyjU/5hGBWffuaN9iLQknLnH8KIVp0MhpwIfwWoHi7yYCy/f3
	 QU7C2lCnYZBQw==
From: Maxime Ripard <mripard@kernel.org>
To: Chun-Kuang Hu <chunkuang.hu@kernel.org>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Douglas Anderson <dianders@chromium.org>
Subject: Re: (subset) [PATCH v2] drm/mediatek: Call drm_atomic_helper_shutdown() at shutdown time
Date: Wed, 12 Jun 2024 09:56:59 +0200
Message-ID: <171817900323.766520.11311110578010469430.b4-ty@kernel.org>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20240611102744.v2.1.I2b014f90afc4729b6ecc7b5ddd1f6dedcea4625b@changeid>
References: <20240611102744.v2.1.I2b014f90afc4729b6ecc7b5ddd1f6dedcea4625b@changeid>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240612_005709_265621_7C7C8183 
X-CRM114-Status: GOOD (  12.03  )
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
Cc: Neil Armstrong <neil.armstrong@linaro.org>, Linus Walleij <linus.walleij@linaro.org>, linux-kernel@vger.kernel.org, Maxime Ripard <mripard@kernel.org>, linux-mediatek@lists.infradead.org, dri-devel@lists.freedesktop.org, Daniel Vetter <daniel@ffwll.ch>, Matthias Brugger <matthias.bgg@gmail.com>, David Airlie <airlied@gmail.com>, linux-arm-kernel@lists.infradead.org, AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On Tue, 11 Jun 2024 10:27:44 -0700, Douglas Anderson wrote:
> Based on grepping through the source code this driver appears to be
> missing a call to drm_atomic_helper_shutdown() at system shutdown
> time. Among other things, this means that if a panel is in use that it
> won't be cleanly powered off at system shutdown time.
> 
> The fact that we should call drm_atomic_helper_shutdown() in the case
> of OS shutdown/restart comes straight out of the kernel doc "driver
> instance overview" in drm_drv.c.
> 
> [...]

Applied to misc/kernel.git (drm-misc-fixes).

Thanks!
Maxime

