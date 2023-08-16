Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 92876C25B7D
	for <linux-mediatek@archiver.kernel.org>; Wed, 16 Aug 2023 21:02:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=R7YFE3httCnXmQwrTkv/7O4t2RXwUhALO4aOS+uus1Q=; b=pjBulm45xN3BJ98Ri8O37OmBD5
	h9GRwdMmeTY+lTO7EGnFB3GvrobcZw5Db4SSgc9ajTRw3eUqKHdy26r6d0AHY5a71xnScRHD9k9eZ
	qOaQptNdITzhfVuGdyIRQwWykIHPJdx1GlLsjxAX8Imt3W9tfNPHsNM1dWU8pSOuXLPd566AGoQ64
	/4+mJv/Sklw3cnA8njFGFM7WI5GGoCu+00S3c8BYxZVc4brkW7C0BGjzgg2brL44+pXT7VoQmbsMB
	pYte25WSdF+5i2Pu7GipDfWPAOH5ERnVjAPBqtdJY1jGYYX3yA3kCwzIXhEFoTG1P6a65PXnoT47t
	Ka0X0lDw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qWNfO-00500X-1l;
	Wed, 16 Aug 2023 21:02:58 +0000
Received: from madras.collabora.co.uk ([2a00:1098:0:82:1000:25:2eeb:e5ab])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qWNfK-004zyB-0S;
	Wed, 16 Aug 2023 21:02:56 +0000
Received: from notapiano (zone.collabora.co.uk [167.235.23.81])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: nfraprado)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id 481D566071BF;
	Wed, 16 Aug 2023 22:02:47 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1692219770;
	bh=jcClwl4OGhC99pJpLTCKo2SBLKEEIwwWT4mkt12MUAI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=SlOO2yujal0smFFdkkDA4F1oLNQ4Iy07tmMC8ovoYd5hQ7lKGaQTnU/Ew8qgRcX+w
	 6T2utv1AT9PcqeLlBsGwQ3MMiJiw5dsRewkMf48F0zCOClDzNimo1R5CMvN9YjUYgE
	 pxH4krlF2s1jDplw1fKKC6zsJ9a8LdHMsrfJNTKWNdg9foiYgqj11r2bbTqhd/8bS/
	 NWiHMPRF7i0XO5J1mG2/e2AiB8xtQqz4KP5PUyxB7rFVXGrOszjm7M2IldsnkpdJJ4
	 1lEwd8XFg79mDfVTIdrQl0QZfZ2nIWo7u9f4xcmUgDgxjzy2lXEuLgxuddSH4z5D+5
	 zYyi1cLoFWVRA==
Date: Wed, 16 Aug 2023 17:02:43 -0400
From: =?utf-8?B?TsOtY29sYXMgRi4gUi4gQS4=?= Prado <nfraprado@collabora.com>
To: Daniel Lezcano <daniel.lezcano@linaro.org>
Cc: Bernhard =?utf-8?Q?Rosenkr=C3=A4nzer?= <bero@baylibre.com>,
	angelogioacchino.delregno@collabora.com, rafael@kernel.org,
	amitk@kernel.org, rui.zhang@intel.com, matthias.bgg@gmail.com,
	robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org,
	rdunlap@infradead.org, ye.xingchen@zte.com.cn,
	p.zabel@pengutronix.de, linux-pm@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org, devicetree@vger.kernel.org,
	wenst@chromium.org, james.lo@mediatek.com, rex-bc.chen@mediatek.com,
	abailon@baylibre.com, amergnat@baylibre.com, khilman@baylibre.com
Subject: Re: [PATCH v4 0/5] Add LVTS support for mt8192
Message-ID: <6547843f-95e7-4bb8-a463-06989acee847@notapiano>
References: <20230530195132.2286163-1-bero@baylibre.com>
 <107678ff-c3d5-4c3a-ad0e-fa292a125daa@notapiano>
 <a97efd71-23e2-5ac9-8d3d-427a431353c6@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <a97efd71-23e2-5ac9-8d3d-427a431353c6@linaro.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230816_140254_345014_CE3B2224 
X-CRM114-Status: GOOD (  12.23  )
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

On Wed, Aug 16, 2023 at 10:49:21PM +0200, Daniel Lezcano wrote:
> 
> Hi,
> 
> On 16/08/2023 21:57, Nícolas F. R. A. Prado wrote:
> 
> [ ... ]
> 
> > Hi Daniel,
> > 
> > just a gentle reminder. As you've just applied [1], there are no longer any
> > concerns with this series, and it'll provide both working interrupts and
> > reliable thermal readings on MT8192.
> 
> There are still concerns and questions in the series for patch2 and 3.

Indeed, I missed those, sorry for the noise.

Thanks,
Nícolas

