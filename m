Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 059FAC83F25
	for <linux-mediatek@archiver.kernel.org>; Tue, 22 Jul 2025 09:54:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=DAgUznr1X1JtX85tfa2WUk7WuDWSP7ZuzPrbz/RzCxg=; b=b8FV86TyG2ejPFHK7Uoumo20hx
	2nFn4M8gcpGJri28ee7nxd9dxJeLcheEMExXcVKE7AuXL2H9x7CPBrTIaamGDNE9SQXZCatn8phVk
	WN4bWMYlL1aVmDWFFGUNAcmoA8KXoV12d6k3Uwnqjn1HGmkrHeEEyAdFLmdRPRnRYJf/YTpheLCxi
	lT1x4Gc6f98YrpkgNxRFYLkdRLK10F0GozlyXMq9T+W+j1XMLO1f5jQbJj48vyvxziWYmCbiSIwcc
	P9SskfYlrVb18RyVB5Io77iZKMbvyhO7Zm/tyw7vactPFO/NIyZvgtZaGt/EhzathZoXoU42ne+8G
	/h4AtTtA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ue9hM-000000024IG-1Zkc;
	Tue, 22 Jul 2025 09:54:12 +0000
Received: from bali.collaboradmins.com ([148.251.105.195])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ue9eo-000000023so-1LlE;
	Tue, 22 Jul 2025 09:51:36 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1753177892;
	bh=lVxHa2zhNH+2LvdHq/VYL69cUHX2Etw2hbHzGQ0URVo=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=HaIsBVE8eb/H8dV25NCgrOEWFYTe4t/eYFuI/rz3+JDB+8bOoCx4I/92/IvQb5kcc
	 cqq1Gn+T91lmo3V7bp9P1lUM2TZN755yPWu4pszqk5oxSaQJj3woP59HmLtiMY2Ljd
	 G7WYyATvPVKQCWH/6UENC+7bTtSF4+pVO1IV9txxnpH31sQRIHoNfzXtXPooYZolGF
	 pvKdFcs7RX7wJFTbxBJEWM2am1eizZU2h+vFnCpiqo1ytdiU9N3NugbEKZIP3oa+wW
	 ZtXKGlxCT3YJPA5SbOL/0IfIAV4OYkNgNKfqxZ/aNYWqp8DV/YZDfJk+atR9mHB893
	 IT0sZ5j8piJ0g==
Received: from laura.lan (unknown [IPv6:2001:b07:646b:e2:bd9c:eae9:88b0:783c])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: laura.nao)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id AAF6817E10D6;
	Tue, 22 Jul 2025 11:51:30 +0200 (CEST)
From: Laura Nao <laura.nao@collabora.com>
To: wenst@chromium.org
Cc: andrew-ct.chen@mediatek.com,
	angelogioacchino.delregno@collabora.com,
	arnd@arndb.de,
	bchihi@baylibre.com,
	colin.i.king@gmail.com,
	conor+dt@kernel.org,
	daniel.lezcano@linaro.org,
	devicetree@vger.kernel.org,
	kernel@collabora.com,
	krzk+dt@kernel.org,
	lala.lin@mediatek.com,
	laura.nao@collabora.com,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-mediatek@lists.infradead.org,
	linux-pm@vger.kernel.org,
	lukasz.luba@arm.com,
	matthias.bgg@gmail.com,
	nfraprado@collabora.com,
	rafael@kernel.org,
	robh@kernel.org,
	rui.zhang@intel.com,
	srini@kernel.org,
	u.kleine-koenig@baylibre.com
Subject: Re: [PATCH 0/9] Add thermal sensor driver support for Mediatek MT8196
Date: Tue, 22 Jul 2025 11:50:46 +0200
Message-Id: <20250722095046.27549-1-laura.nao@collabora.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <CAGXv+5EmigF=m1zDZ71AMv02XwyYWQxpiRpiwc7YMg=8vc2FZA@mail.gmail.com>
References: <CAGXv+5EmigF=m1zDZ71AMv02XwyYWQxpiRpiwc7YMg=8vc2FZA@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250722_025134_508890_0875D1F1 
X-CRM114-Status: GOOD (  18.54  )
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

Hi ChenYu,

On 7/22/25 09:40, Chen-Yu Tsai wrote:
> Hi,
>
> On Mon, Jul 21, 2025 at 4:18 PM Laura Nao <laura.nao@collabora.com> wrote:
>>
>> This patch series extends the MediaTek LVTS thermal driver to support the
>> MT8196 SoC.
>>
>> MT8196 uses a positive temp_factor for temperature conversion, requiring
>> slight adjustments in the conversion logic.
>>
>> To support this, the series introduces:
>>
>> - A new struct lvts_platform_ops to allow platform-specific
>>   conversion logic between raw sensor values and temperature
>> - A variant of the lvts_temp_to_raw() implementation for SoCs with positive
>>   temp_factor values
>> - Platform data and controller definitions for MT8196
>
> I see the GPU and APU thermal sensors were left out. Was there a reason
> for this?
>

Based on my testing, the GPU and APU sensors are not functional at this 
stage - the APU controller returns an invalid ID, and the GPU sensors 
report invalid values. I suspect that both the GPU and APU need to be 
fully initialized for the sensors to operate correctly, so I'm planning 
to upstream support for those at a later stage.

Best,

Laura

> Thanks
> ChenYu
>
>> Laura Nao (9):
>>   dt-bindings: thermal: mediatek: Add LVTS thermal controller support
>>     for MT8196
>>   thermal/drivers/mediatek/lvts: Make number of calibration offsets
>>     configurable
>>   thermal/drivers/mediatek/lvts: Guard against zero temp_factor in
>>     lvts_raw_to_temp
>>   thermal: mediatek: lvts: Add platform ops to support alternative
>>     conversion logic
>>   thermal/drivers/mediatek/lvts: Add lvts_temp_to_raw variant for
>>     positive temp_factor
>>   thermal/drivers/mediatek/lvts: Add support for ATP mode
>>   thermal/drivers/mediatek/lvts: Support MSR offset for 16-bit
>>     calibration data
>>   thermal/drivers/mediatek/lvts_thermal: Add MT8196 support
>>   dt-bindings: nvmem: mediatek: efuse: Add support for MT8196
>>
>>  .../bindings/nvmem/mediatek,efuse.yaml        |   1 +
>>  .../thermal/mediatek,lvts-thermal.yaml        |   2 +
>>  drivers/thermal/mediatek/lvts_thermal.c       | 315 ++++++++++++++++--
>>  .../thermal/mediatek,lvts-thermal.h           |  26 ++
>>  4 files changed, 325 insertions(+), 19 deletions(-)
>>
>> --
>> 2.39.5
>>
>>


