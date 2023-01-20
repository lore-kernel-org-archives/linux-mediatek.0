Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B29A9C05027
	for <linux-mediatek@archiver.kernel.org>; Fri, 20 Jan 2023 11:16:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=DLoyrmTh4KJgumMe2lkNF1VG3vM7p0Q9gqjR6o8rgRA=; b=h5UWJQYuClMxeC3sqX6egwRYqn
	XgSF11KIrwfFy1LNbYoOLjATvteC2nM8JjvlcXz9dWGLGxHgGxdLOAXYlXNuhALNxhFhEp7Fq4HiY
	+60HKSAkkDYThSMUmCfQKrIP7Nfzoaw6d1yZIWlVQETQ6sV2+OYFvXJmf86jVt+3FeCepEtY/AZ+p
	hJj4h039w9gm8MXuMXIa1N5Yzo3oQ0LwUuYe2/yios2I5ApVetrzdmMJPT4aU2HXkR6qWILP402es
	wbjva+qgAhgHFALGq6q4RHU7UH4ZMC5znVyPBc8PKPTQcK7+aivj+IzjuACrzwVHUIgc7VGCbP06H
	iviJniyg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pIpNC-009yZz-95; Fri, 20 Jan 2023 11:15:54 +0000
Received: from madras.collabora.co.uk ([46.235.227.172])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pIpMl-009yNn-Pw; Fri, 20 Jan 2023 11:15:29 +0000
Received: from [192.168.1.100] (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits))
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id CD80A660230B;
	Fri, 20 Jan 2023 11:15:21 +0000 (GMT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1674213324;
	bh=CASdzRtoHYplP6yd6/mt/6hm04+ftfOht/MoW2dAnK8=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=YaLvVsczluXVfnE14rTAqsOFML8ibEN1/3WdsV84rBmyv56rm0yhbjdLUhD+eXUI3
	 yKn2Ye+ICWEX+swXtC8nTyojSyi5j8aVZuPYvhCHx1sWbnW1CWR4J/WG6G5TcHOWq+
	 13fRRh3EqjgwoQo7KnaqPqj0ur/D2OH2xexc1gB7gf/Hlbt7rT5ZQgwX6J3xN0YQdo
	 SrTxkQ28Dw8AuQNXaTwK75BGopNLRf82Lq2KW9Jw2yZz9otY2jWkfw+0AnSgNmiMk3
	 /A+CAQqcuPdlo4xosz+MWz7duPvfGPQgBCRsPxfwYxeslWq4G5I77YLn6dGajAqHo7
	 NKDsK9qZMT2Aw==
Message-ID: <1e924d3b-1283-b9f9-d2a0-0e42db656d4e@collabora.com>
Date: Fri, 20 Jan 2023 12:15:19 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.0
Subject: Re: [PATCH v3 3/3] drm: Convert users of drm_of_component_match_add
 to component_match_add_of
Content-Language: en-US
To: Sean Anderson <sean.anderson@seco.com>, David Airlie <airlied@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 dri-devel@lists.freedesktop.org
Cc: linux-kernel@vger.kernel.org, Jyri Sarha <jyri.sarha@iki.fi>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Alain Volmat <alain.volmat@foss.st.com>,
 Brian Starkey <brian.starkey@arm.com>, Chen Feng <puck.chen@hisilicon.com>,
 Chen-Yu Tsai <wens@csie.org>, Christian Gmeiner
 <christian.gmeiner@gmail.com>, Chun-Kuang Hu <chunkuang.hu@kernel.org>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Jernej Skrabec <jernej.skrabec@gmail.com>, John Stultz <jstultz@google.com>,
 Liviu Dudau <liviu.dudau@arm.com>, Lucas Stach <l.stach@pengutronix.de>,
 Mali DP Maintainers <malidp@foss.arm.com>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 Mihail Atanassov <mihail.atanassov@arm.com>,
 Paul Cercueil <paul@crapouillou.net>, Philipp Zabel
 <p.zabel@pengutronix.de>, Rob Clark <robdclark@gmail.com>,
 Russell King <linux@armlinux.org.uk>, Samuel Holland <samuel@sholland.org>,
 Sean Paul <sean@poorly.run>, Tian Tao <tiantao6@hisilicon.com>,
 Tomi Valkeinen <tomba@kernel.org>, Xinliang Liu <xinliang.liu@linaro.org>,
 Xinwei Kong <kong.kongxinwei@hisilicon.com>, etnaviv@lists.freedesktop.org,
 freedreno@lists.freedesktop.org, linux-arm-kernel@lists.infradead.org,
 linux-arm-msm@vger.kernel.org, linux-mediatek@lists.infradead.org,
 linux-mips@vger.kernel.org, linux-sunxi@lists.linux.dev
References: <20230119191040.1637739-1-sean.anderson@seco.com>
 <20230119191040.1637739-4-sean.anderson@seco.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
In-Reply-To: <20230119191040.1637739-4-sean.anderson@seco.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230120_031528_330141_B8ED6009 
X-CRM114-Status: UNSURE (   8.59  )
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

Il 19/01/23 20:10, Sean Anderson ha scritto:
> Every user of this function either uses component_compare_of or
> something equivalent. Most of them immediately put the device node as
> well. Convert these users to component_match_add_of and remove
> drm_of_component_match_add.
> 
> Signed-off-by: Sean Anderson <sean.anderson@seco.com>
> Acked-by: Jyri Sarha <jyri.sarhaı@iki.fi>
> Tested-by: Jyri Sarha <jyri.sarha@iki.fi>

For MediaTek mtk_drm_drv:

Tested-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>



