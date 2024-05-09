Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8BAFAC10F1A
	for <linux-mediatek@archiver.kernel.org>; Thu,  9 May 2024 12:47:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=azh3jkpwUkK1BDWHA193744+q2OM6G0yEYf353EXV+c=; b=KOYjsKF8e0zbttL8m2gwHU7Hq+
	1eGn3OrNpFvWVoVTfj+5k7pR4jl213Nnnav4YPHcFgK+GBwnP7Hw47XPdFZtwhJWH7FdWEYZ8nP50
	aRLO8vz+uV2j6KNtrE17JZYuRjZj30SQ3gNZLlJYhjI+USKHla7vJ6DDDZf5D/O2AetVnTy8dwmsk
	QCuNvOg3rJ/84MeHiIccufcgU1n4vWRgouXatRfI7Rw/PuAKwotEDakQFwp1XQwfYXp8c3oDVy/TN
	0td25K824BOjgvW8j77wlaqO5wzYhbTZtQxFNVFfk2s2kNDJ7QsWkNGlxKe1eEJfhZTSY4JdfulSX
	E3lwDBww==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s53At-00000001Tdc-2GYh;
	Thu, 09 May 2024 12:47:03 +0000
Received: from sin.source.kernel.org ([145.40.73.55])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s53Aq-00000001TbF-04Ou;
	Thu, 09 May 2024 12:47:01 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id 12B84CE1B4E;
	Thu,  9 May 2024 12:46:58 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 09D71C116B1;
	Thu,  9 May 2024 12:46:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1715258817;
	bh=Y1puUf3Rn4PFEIfYWjo05C5VlGgGVxqEMZoIhApAwoE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=AQoXxdBT+Gf6/1FnwrPKEUEL8un/LA/u/2/sGpDCC3rxgKcoqyWXiIYW010ItlUum
	 CLW5mYm545cimXqZBYmCGhgG0TDtnkqwrORVR4iSIbEqIRhyhcrt3kwfXNkXg6K64O
	 w/OV3lp+KVg/vrgpg6Otpk5K6rEE7UjvK0+ZQ/3ke7FMj3+1HjaVBF4DAXoz4gPzwI
	 0n+UHl6L4pv6WqF0RUQ69KZCeD51zRNa7aM9mIiyeZyDaYmsZpsgrROCD8g6oq1W5t
	 bWTjyIxOyJS//5RBCY/Nlq3g0oX9RTKZSdE+TICUdGYgN2wahiJLQ61bVw8OeIOqkv
	 DvX0r1wcBJS5w==
Date: Thu, 9 May 2024 08:46:55 -0400
From: Sasha Levin <sashal@kernel.org>
To: Pavel Machek <pavel@ucw.cz>
Cc: linux-kernel@vger.kernel.org, stable@vger.kernel.org,
	Krzysztof Kozlowski <krzk@kernel.org>,
	Joerg Roedel <jroedel@suse.de>, yong.wu@mediatek.com,
	joro@8bytes.org, will@kernel.org, matthias.bgg@gmail.com,
	angelogioacchino.delregno@collabora.com, iommu@lists.linux.dev,
	linux-mediatek@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH AUTOSEL 4.19 7/7] iommu: mtk: fix module autoloading
Message-ID: <ZjzFv38K2fudS_zQ@sashalap>
References: <20240422232040.1616527-1-sashal@kernel.org>
 <20240422232040.1616527-7-sashal@kernel.org>
 <Zied1/2cELhaQupG@duo.ucw.cz>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Disposition: inline
In-Reply-To: <Zied1/2cELhaQupG@duo.ucw.cz>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240509_054700_257896_00C268A0 
X-CRM114-Status: GOOD (  11.40  )
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

On Tue, Apr 23, 2024 at 01:39:03PM +0200, Pavel Machek wrote:
>Hi!
>
>> [ Upstream commit 7537e31df80cb58c27f3b6fef702534ea87a5957 ]
>>
>> Add MODULE_DEVICE_TABLE(), so modules could be properly autoloaded
>> based on the alias from of_device_id table.
>
>This patch is queued for 4.19 and 5.15, but not 5.10. I believe that's
>wrong.

Heh, this is funny. It fails to build on 5.10:

drivers/iommu/mtk_iommu.c:872:1: warning: data definition has no type or storage class
   872 | MODULE_DEVICE_TABLE(of, mtk_iommu_of_ids);
       | ^~~~~~~~~~~~~~~~~~~
drivers/iommu/mtk_iommu.c:872:1: error: type defaults to 'int' in declaration of 'MODULE_DEVICE_TABLE' [-Werror=implicit-int]
drivers/iommu/mtk_iommu.c:872:1: warning: parameter names (without types) in function declaration
cc1: some warnings being treated as errors
make[2]: *** [scripts/Makefile.build:286: drivers/iommu/mtk_iommu.o] Error 1

But not on any of the older trees.

-- 
Thanks,
Sasha

