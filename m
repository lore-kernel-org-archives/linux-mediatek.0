Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C0D6AC52D7C
	for <linux-mediatek@archiver.kernel.org>; Mon, 12 Aug 2024 18:13:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=p0PjGWHjLLz8EOjdcHDFrYa4pq/EAznYs6KPrDyuY1E=; b=mX9GdWenavA8DoD8/aoW/Uo/oj
	IpU85C+3us3H8RFN5asXYVPRPT+yRkkxoqwErk6NPwNKnASjYbxM7+M8rSCKnCU1UQ176x35z6CZl
	np66X34fj9476rl9ww/jzGgu9Rq2JaaWOaOUBMCQCu0Aul4ZiX42/3URpMBrxQqnZXHFvlsBJj1P7
	4J6cwZpv0WJjeSnO9Dp4O4kjAiiBlMzIbkOVFS01Z77hlOXbAKbD+n5BO1TUYXmlctEvvJUZG9F5e
	AhJeIhQwg+Oz+lUfy9ByGSCA39AU0sS5FSdqDkkgROyw7DrIEKeSOJ9WKlmpgAmGxGhYOZSeK6twU
	FGYvfWhA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sdZXq-000000019Q1-0ghx;
	Mon, 12 Aug 2024 18:13:26 +0000
Received: from sin.source.kernel.org ([145.40.73.55])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sdZXB-0000000199E-43CK;
	Mon, 12 Aug 2024 18:12:47 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id F10F3CE1027;
	Mon, 12 Aug 2024 18:12:43 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 73BCAC4AF12;
	Mon, 12 Aug 2024 18:12:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1723486363;
	bh=g0XHzIpUs5eYiW9UQlfz0vWRfgRQzN1dVhSEmnmVHow=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=gm94uMtcYmIt+6LMyxQ9EVa9yh4TAeRVzZzmN2OC86TNUXCFKPudnG0pgR2aSq/7i
	 RVQfFDkMD3Dp+JpaasLwCFt7yCWw6MSOvROhRH7AZeSqg1DdWIQQBfnM2A9x8XrfNj
	 KMcHi9JLd1jKSch5n6s1e2c5Stoxk6ll5Z5Tp4E6p5qWJvkF/qZ8RgNG7EBGd+7QFK
	 2rPUtsQlK/zmtP6f97EW/3DHqZ6kEvp1Q96TjZI8tCy3f4Ii1s70bOyNdp833LBO81
	 PykyBxc2T6di+OkYMnej605xtlXkDhsfWs5rncwC4JAbjb7mcPRhNG39m9S3tl+can
	 9EmIL0jLfTZsQ==
Date: Mon, 12 Aug 2024 11:12:43 -0700
From: Kees Cook <kees@kernel.org>
To: Amit Vadhavana <av2082000@gmail.com>
Cc: dmaengine@vger.kernel.org, linux-kernel@vger.kernel.org,
	ricardo@marliere.net, linux-kernel-mentees@lists.linux.dev,
	skhan@linuxfoundation.org, vkoul@kernel.org,
	olivierdautricourt@gmail.com, sr@denx.de,
	ludovic.desroches@microchip.com, florian.fainelli@broadcom.com,
	bcm-kernel-feedback-list@broadcom.com, rjui@broadcom.com,
	sbranden@broadcom.com, wangzhou1@hisilicon.com, haijie1@huawei.com,
	fenghua.yu@intel.com, dave.jiang@intel.com, zhoubinbin@loongson.cn,
	sean.wang@mediatek.com, matthias.bgg@gmail.com,
	angelogioacchino.delregno@collabora.com, afaerber@suse.de,
	manivannan.sadhasivam@linaro.org, Basavaraj.Natikar@amd.com,
	linus.walleij@linaro.org, ldewangan@nvidia.com,
	jonathanh@nvidia.com, thierry.reding@gmail.com,
	laurent.pinchart@ideasonboard.com, michal.simek@amd.com,
	Frank.Li@nxp.com, n.shubin@yadro.com, yajun.deng@linux.dev,
	quic_jjohnson@quicinc.com, lizetao1@huawei.com, pliem@maxlinear.com,
	u.kleine-koenig@pengutronix.de, konrad.dybcio@linaro.org,
	gustavoars@kernel.org, bryan.odonoghue@linaro.org,
	linux@treblig.org, dan.carpenter@linaro.org,
	linux-arm-kernel@lists.infradead.org,
	linux-rpi-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	linux-actions@lists.infradead.org, linux-arm-msm@vger.kernel.org,
	linux-tegra@vger.kernel.org
Subject: Re: [PATCH] dmaengine: Fix spelling mistakes
Message-ID: <202408121112.480CE2FAF@keescook>
References: <20240810184333.34859-1-av2082000@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240810184333.34859-1-av2082000@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240812_111246_198140_C99D74E3 
X-CRM114-Status: UNSURE (   5.94  )
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

On Sun, Aug 11, 2024 at 12:13:33AM +0530, Amit Vadhavana wrote:
> Corrected spelling mistakes in the DMA engine to improve readability
> and clarity without altering functionality.
> 
> Signed-off-by: Amit Vadhavana <av2082000@gmail.com>

With a quick skim on my part, these all seems correct. Thanks!

Reviewed-by: Kees Cook <kees@kernel.org>

-- 
Kees Cook

