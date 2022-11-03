Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2A0E6C4332F
	for <linux-mediatek@archiver.kernel.org>; Thu,  3 Nov 2022 21:03:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=V56w4IKznjfuluhA6fSqo5+nAAWn0dApHy/TY9w79jE=; b=VwIyegwzKNblW1zCAKcXn8xmC+
	xHncg/8GlZYaXy/nvZj0CsV2adAv9mUItAm/ZYYVqs0jt3WYyCTlMQ86PfxFwJ6Hc66+0ZLgjbbJ3
	MklVui0d+TmvuWXvtsyRgjhM92Joz/UHmqMCpHYdrwfCj72m9vOMcFENF+0BKslvmd3SkzIMYRPka
	Db5BWXW6HrAYV2app5aJdf3dVzzCT52QpjX6D1Di/6SzNcXAhx/UqCuAsAcY5zkeTGjgsXBoSP1j2
	iJg0Gf4u8E+s2ejggTk6OZqieC35tqMXH3FF+vLJ3y6j8d9WJ7j7MlbgmAqair7Ejw08cn8PQybtk
	/qsHzWCQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oqhNN-001gDf-K5; Thu, 03 Nov 2022 21:03:49 +0000
Received: from madras.collabora.co.uk ([46.235.227.172])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oqhMx-001gB3-Ir; Thu, 03 Nov 2022 21:03:24 +0000
Received: from notapiano (unknown [IPv6:2600:4041:5b1a:cd00:524d:e95d:1a9c:492a])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: nfraprado)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id 226E06602946;
	Thu,  3 Nov 2022 21:03:19 +0000 (GMT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1667509401;
	bh=V56w4IKznjfuluhA6fSqo5+nAAWn0dApHy/TY9w79jE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=NBDxFm4mr3csQUybIFz6G8NVG3xGYl5esnOpE/eqWpP9gCja7xQavnK4b5gi1XIUc
	 7NnK3ZmYRS8LblLRQQnY/MCmj6IT7TBhpaxZO0VOJTZGQYbNZsReicy0HO/YiPVM0f
	 BukU7YNF8lWGC4g97/IxrFWtMGj56uH4a+fLrRWddhmjcRrSTeFFiy4IJwUYlbUWaB
	 yPIQ/OUvDxt7PCkarmBvnKioNvpgUEXSGanRypyDIr1evtuXZmyZS0urJtkgmB0fkg
	 FvA9xFkb3m/2wZ5Nnr1YTYcktbMqqAE3Af66MWebop77thtljgybt5r2ATLu56Z7P/
	 f8A+qx4NTc1rw==
Date: Thu, 3 Nov 2022 17:03:15 -0400
From: =?utf-8?B?TsOtY29sYXMgRi4gUi4gQS4=?= Prado <nfraprado@collabora.com>
To: "Nancy.Lin" <nancy.lin@mediatek.com>
Cc: Rob Herring <robh+dt@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	Chun-Kuang Hu <chunkuang.hu@kernel.org>,
	Philipp Zabel <p.zabel@pengutronix.de>, wim@linux-watchdog.org,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	linux@roeck-us.net, David Airlie <airlied@linux.ie>,
	Daniel Vetter <daniel@ffwll.ch>,
	Nathan Chancellor <nathan@kernel.org>,
	Nick Desaulniers <ndesaulniers@google.com>,
	"jason-jh . lin" <jason-jh.lin@mediatek.com>,
	Yongqiang Niu <yongqiang.niu@mediatek.com>,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org, dri-devel@lists.freedesktop.org,
	llvm@lists.linux.dev, singo.chang@mediatek.com,
	Project_Global_Chrome_Upstream_Group@mediatek.com
Subject: Re: [PATCH v27 2/7] drm/mediatek: add ETHDR support for MT8195
Message-ID: <20221103210315.lm2d3n4uolra44no@notapiano>
References: <20221103032610.9217-1-nancy.lin@mediatek.com>
 <20221103032610.9217-3-nancy.lin@mediatek.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20221103032610.9217-3-nancy.lin@mediatek.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221103_140323_783698_5E9E02AE 
X-CRM114-Status: UNSURE (   8.74  )
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

On Thu, Nov 03, 2022 at 11:26:05AM +0800, Nancy.Lin wrote:
[..]
> --- /dev/null
> +++ b/drivers/gpu/drm/mediatek/mtk_ethdr.h
[..]
> +void mtk_ethdr_unregister_vblank_cb(struct device *dev);
> +void mtk_ethdr_enable_vblank(struct device *dev);
> +void mtk_ethdr_disable_vblank(struct device *dev);
> +#endif
> +

As warned by git when applying the patch, you have an extra new line at the end
here.

Applying: drm/mediatek: add ETHDR support for MT8195
.git/rebase-apply/patch:454: new blank line at EOF.
+
warning: 1 line adds whitespace errors.

