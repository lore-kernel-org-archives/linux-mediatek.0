Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EF26EC25B75
	for <linux-mediatek@archiver.kernel.org>; Fri, 31 May 2024 17:05:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Date:Message-Id:Subject:References:In-Reply-To:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ym7rsIKUITf1o2rpDGFOU9sPvcJ2euU29jETwzwCyZk=; b=x0Of12Ya+cEztkvjTay5fQLF8f
	x66Z9RiVseE4ZEWKvJMs3nXEAx1h9SH4TfIfKpxEpFklMigzkBjYSuxrR1CXVbCSDOgGSbkHa3vUI
	jqk7W0KqvxZjpwKVhVroFKDLz1f3lKJMa9Lwr+4l7jSxu8xQa9NwtR7JWyMAfn0Bmbolb8HF2KPJw
	KfLysuHQlCFdWMr82Q7H3Pq4cCLqCi6TACCi9ZcGHDN9EDJOGLM7ziIW9l2P0oTMMb+VXczM8+tb8
	zRjKP9tcR1P/TTOQmO5YpdM3dBt7e0NFGqoGMjNAwtEeHBrxInh7uSZJCcmP9si4OZhhAhOaPygRZ
	W1txOsIg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sD5hN-0000000AxDT-477L;
	Fri, 31 May 2024 17:05:49 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sD5hH-0000000AxCC-3EIB;
	Fri, 31 May 2024 17:05:47 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 9FCB362CF7;
	Fri, 31 May 2024 17:05:42 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3D71CC116B1;
	Fri, 31 May 2024 17:05:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1717175142;
	bh=ojVyu4m/QK0eLUTVMQOzVZ1/YGKhIT0HpeVHhtnOmKk=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=uyHzAlGy36mwd/hrJc4dAsxeyBUw+RfUNcOonw/PUWHZC7fON26bUJr9jG6PxPs+8
	 +b64s2p3Kwp9LC40cykPj7lOOCNJk1a2AehDFiAUhwIEKcvoR3vFxaUBZMl79z5OPz
	 FPJou03ZjeF5uFpYjrob/v2hj5gkmunLcAdogQvs4YPnYOr2qU1UYI674FY5fYEtkT
	 bV6Iz9TBwQ6kGqqt2y+KSnIDKZ3O0Rl8R6hRSNb1kBzoIX5s9FQlSLhw1KvIrlTk5T
	 n/ehnIOHOAjzlO1mWH2UnkRDSHieko8+XRtALn6kFf6EAbQWNq0BgUCKU55pJfp1KT
	 NUoC3k6sQFn+w==
From: Lee Jones <lee@kernel.org>
To: jic23@kernel.org, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: lars@metafoo.de, robh@kernel.org, krzk+dt@kernel.org, 
 conor+dt@kernel.org, matthias.bgg@gmail.com, lee@kernel.org, 
 andy@kernel.org, nuno.sa@analog.com, bigunclemax@gmail.com, 
 dlechner@baylibre.com, marius.cristea@microchip.com, 
 marcelo.schmitt@analog.com, fr0st61te@gmail.com, mitrutzceclan@gmail.com, 
 mike.looijmans@topic.nl, marcus.folkesson@gmail.com, 
 linux-iio@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-mediatek@lists.infradead.org, kernel@collabora.com
In-Reply-To: <20240530093410.112716-4-angelogioacchino.delregno@collabora.com>
References: <20240530093410.112716-1-angelogioacchino.delregno@collabora.com>
 <20240530093410.112716-4-angelogioacchino.delregno@collabora.com>
Subject: Re: (subset) [PATCH v1 3/4] mfd: mt6397-core: Add support for
 AUXADCs on MT6357/58/59 PMICs
Message-Id: <171717513800.1210753.10558574294552850707.b4-ty@kernel.org>
Date: Fri, 31 May 2024 18:05:38 +0100
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Mailer: b4 0.12.4
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240531_100546_459720_CA630EEF 
X-CRM114-Status: UNSURE (   5.71  )
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

On Thu, 30 May 2024 11:34:09 +0200, AngeloGioacchino Del Regno wrote:
> Add the relevant AUXADC driver entries to the MFD cells of the
> MT6357, MT6358, MT6359 PMICs to support their Auxiliary ADCs.
> 
> 

Applied, thanks!

[3/4] mfd: mt6397-core: Add support for AUXADCs on MT6357/58/59 PMICs
      commit: fa9d9f4b5588003a955193fe9ff009687541f3e7

--
Lee Jones [李琼斯]


