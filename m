Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 040D3CA0ED3
	for <linux-mediatek@archiver.kernel.org>; Wed,  4 Sep 2024 10:36:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Y4KivTlLQsrs8/eog2KE5IYE9wwB2vaE2IV6Oyt+Eno=; b=3NQm6JgXAyereQu5qU3WJ+niz4
	FUyZGMoBESx7sV83RpdPJ6xpFSWwZs1T+m1+O9H4fmODMAglBaae1Xp8aL3RZwOZ98ENCkqY3c9Iq
	CplzcxksSEe0DKqmMzOfzZOpcd796IdmUjtBHRN52O+7Dm5faz4NYdPT+yUVk+Fhpzn7EEd6NXCOe
	ldptaHQgrMT+HvWH0KkvXVeWvtoVvXiAKJWoJ8Hh8Qo1gZ+15OFB2Qjh/9Dd9FxvVDnLbsFJIuBZj
	LOO3XxsJW423ToY/Gbtr4X0N+sZmBBmlOF3wpiqL75ah/Ev0xtLjWxD4F3mkvE2cGNhEeyEntF6Ui
	UrxjZtWA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1slnN3-00000003xD1-1Uhy;
	Wed, 04 Sep 2024 10:36:17 +0000
Received: from nyc.source.kernel.org ([2604:1380:45d1:ec00::3])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1slmw9-00000003puY-259u;
	Wed, 04 Sep 2024 10:08:31 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 3C973A43725;
	Wed,  4 Sep 2024 10:08:21 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 08F95C4CEC2;
	Wed,  4 Sep 2024 10:08:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1725444508;
	bh=h+ZEYfjn015chexkmjVF91yXTddj8EqTDzVXa7vLvQs=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=JHfyKHB0HJBsFEZlL7NjNCB5ddfJxum5SE+uGVyWPlj7ImOuEjAJWhQ19kXHj86O/
	 JUSehN6SDX/w+BTnao+5DetDK0qdy6ycr2ZvoN9Hgw5dn9YwpS8aqGPdOZ6Q3NW4bO
	 4G47XVjyBuKsE32/ICXRP112G7vJLvzvXHF7B0QbGl0xqeprwT79ho3iBQa9gdteTK
	 MVHIMvatmubJWC2FpyeQnix0sFd4KzBWc6dl/DAmNPhg3Nxonxs2Mu6ZAlinKvW8Pz
	 WTYUz87+WIGyVhzpsYUxs2ilKDSFTELafqe+ckjorc+6gFxR6wGxgdqcfBDmVuh4cz
	 AF3GBajLF7CGQ==
Date: Wed, 4 Sep 2024 10:08:22 +0000
From: Tzung-Bi Shih <tzungbi@kernel.org>
To: Chen-Yu Tsai <wenst@chromium.org>
Cc: Rob Herring <robh@kernel.org>, Saravana Kannan <saravanak@google.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Wolfram Sang <wsa@kernel.org>, Benson Leung <bleung@chromium.org>,
	Mark Brown <broonie@kernel.org>,
	Liam Girdwood <lgirdwood@gmail.com>,
	chrome-platform@lists.linux.dev, devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org,
	Douglas Anderson <dianders@chromium.org>,
	Johan Hovold <johan@kernel.org>, Jiri Kosina <jikos@kernel.org>,
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	linux-i2c@vger.kernel.org
Subject: Re: [PATCH v6 11/12] platform/chrome: Introduce device tree hardware
 prober
Message-ID: <Ztgxlmhnkn7NVC81@google.com>
References: <20240904090016.2841572-1-wenst@chromium.org>
 <20240904090016.2841572-12-wenst@chromium.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240904090016.2841572-12-wenst@chromium.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240904_030829_616359_F388055F 
X-CRM114-Status: GOOD (  12.78  )
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

On Wed, Sep 04, 2024 at 05:00:13PM +0800, Chen-Yu Tsai wrote:
> diff --git a/drivers/platform/chrome/chromeos_of_hw_prober.c b/drivers/platform/chrome/chromeos_of_hw_prober.c
[...]
> +static int chromeos_of_hw_prober_probe(struct platform_device *pdev)
> +{
> +	for (size_t i = 0; i < ARRAY_SIZE(hw_prober_platforms); i++) {
> +		int ret;
> +
> +		if (!of_machine_is_compatible(hw_prober_platforms[i].compatible))
> +			continue;
> +
> +		ret = hw_prober_platforms[i].prober(&pdev->dev, hw_prober_platforms[i].data);
> +		/* Ignore unrecoverable errors and keep going through other probers */
> +		if (ret == -EPROBE_DEFER)
> +			return ret;

Is it harmless if some of the components get probed multiple times?  E.g.:
comp1 probed -> comp2 probed -> comp3 returned -EPROBE_DEFER -> some time
later, chromeos_of_hw_prober_probe() gets called again.

