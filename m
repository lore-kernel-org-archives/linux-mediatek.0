Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 53052C27C4F
	for <linux-mediatek@archiver.kernel.org>; Wed, 26 Jun 2024 07:43:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=EHFOfbCRzI142my6Sqkyyx0K+jU8Bmzgfa23LdSQ3+k=; b=OeuHZF13xxPhlxSBCHE0+bn5pB
	6UPKogZFFnEixTqsvWL824ofwMB4Cj0qsvekNo6Me/J2ysllEpAJA1RPjUPhCIHNUeM1rWP85qm+O
	nNOPD45o+HML4aCdSvqUVqR8y2MBg/8Ij9SwyYu2beVP3XQ376zTy0LMOJEff9hhvPNGW1HJUplda
	XeHW0GHJqt3XrE04Mj8dBXFmpWAzUsqfCFZdLFvimTSSViOrJN7LEmy+7yceeCB5QxVyfwrePJtoG
	we2NOygQLQRzocN7uCnSy0rJ19aVIAfI71kTo7W0kng28oulrs844//rTtg403020FV3BYTNC73+P
	YOurvfaA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sMNJn-00000005n14-3QUH;
	Wed, 26 Jun 2024 07:43:51 +0000
Received: from madrid.collaboradmins.com ([2a00:1098:ed:100::25])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sMNJf-00000005n07-32KE;
	Wed, 26 Jun 2024 07:43:45 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1719387818;
	bh=QVwwwwWJMC02wU6Kl7A1QxNTL8rAbcV54YrqF8y2+Iw=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=PFzJch1vLYzrVQ7JPoyPNhbYxtzjzkfkQTYjt7iZJcbUYagAeEd+Jcz+mRS4N4k+C
	 7K44jeaYtTEURxDJMY+W9T2/97ED6LuC6VwGz30ZoH/oLS0ZmalwssH275HWYqMFUn
	 Fef+DZbZCzxpstdzVXYzJxq0IitWai9W+kgOLXK5hFLR4ZGmq5py6Os7DkmP//VEdL
	 039i81SnuMfSn3i/64BU46IYb2OSMqdRrhkDpxWlcnJbEPJnuD5HlS4GwlJ23IYTZL
	 XBgBQ0/nDEEe9QBAKzNoyiJb0DeHS+0eIOQvEmmAwd2jLYFkEC3gt0pVh5v37tcJHw
	 U20c01voSopKw==
Received: from [100.113.186.2] (cola.collaboradmins.com [195.201.22.229])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by madrid.collaboradmins.com (Postfix) with ESMTPSA id 571C137821B7;
	Wed, 26 Jun 2024 07:43:37 +0000 (UTC)
Message-ID: <4541415f-0e6d-438f-a7b3-0c29c196e432@collabora.com>
Date: Wed, 26 Jun 2024 09:43:36 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: (subset) [PATCH v6 0/7] MediaTek DVFSRC Bus Bandwidth and
 Regulator knobs
To: Mark Brown <broonie@kernel.org>, djakov@kernel.org
Cc: robh@kernel.org, krzysztof.kozlowski+dt@linaro.org, conor+dt@kernel.org,
 matthias.bgg@gmail.com, lgirdwood@gmail.com, gustavoars@kernel.org,
 henryc.chen@mediatek.com, linux-pm@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org,
 kernel@collabora.com, wenst@chromium.org, amergnat@baylibre.com,
 Kees Cook <kees@kernel.org>
References: <20240610085735.147134-1-angelogioacchino.delregno@collabora.com>
 <171934124556.1173981.12014605377517424760.b4-ty@kernel.org>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Content-Language: en-US
In-Reply-To: <171934124556.1173981.12014605377517424760.b4-ty@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240626_004344_179058_BAD999A2 
X-CRM114-Status: GOOD (  17.55  )
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

Il 25/06/24 20:47, Mark Brown ha scritto:
> On Mon, 10 Jun 2024 10:57:28 +0200, AngeloGioacchino Del Regno wrote:
>> Changes in v6:
>>   - Fixed build with clang (thanks Nathan!)
>>   - Removed unused mtk_rmw() macro in mtk-dvfsrc.c
>>   - Added MODULE_DESCRIPTION() to mtk-dvfsrc-regulator.c
>>
>> Changes in v5:
>>   - Fixed Kconfig dependencies in interconnect
>>   - Fixed module build for dvfsrc and interconnect
>>
>> [...]
> 
> Applied to
> 

Thanks Mark, appreciated :-)

Cheers

>     https://git.kernel.org/pub/scm/linux/kernel/git/broonie/regulator.git for-next
> 
> Thanks!
> 
> [1/7] dt-bindings: regulator: Add bindings for MediaTek DVFSRC Regulators
>        commit: b147ae7ae5141cb10c520d372ecabb2c520210c4
> [5/7] regulator: Remove mtk-dvfsrc-regulator.c
>        commit: cd102850e32c145661c6a0640dc6c5feba11af72
> [6/7] regulator: Add refactored mtk-dvfsrc-regulator driver
>        commit: d2ea920a4092b3c0a6a004b93ce198ca37455d90
> 
> All being well this means that it will be integrated into the linux-next
> tree (usually sometime in the next 24 hours) and sent to Linus during
> the next merge window (or sooner if it is a bug fix), however if
> problems are discovered then the patch may be dropped or reverted.
> 
> You may get further e-mails resulting from automated or manual testing
> and review of the tree, please engage with people reporting problems and
> send followup patches addressing any issues that are reported if needed.
> 
> If any updates are required or you are submitting further changes they
> should be sent as incremental updates against current git, existing
> patches will not be replaced.
> 
> Please add any relevant lists and maintainers to the CCs when replying
> to this mail.
> 
> Thanks,
> Mark
> 




