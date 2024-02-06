Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F40DBC4828D
	for <linux-mediatek@archiver.kernel.org>; Tue,  6 Feb 2024 16:11:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=oQ6TKJN0lmnOQaAjcNqgOOwYtodO5JTzaaKCivDRncM=; b=Lnu9XKymptzwG2JEC7sLFqW3/s
	U0d+Wr7CJ7TwLLtCDCP/EoZPg3azQ1V1cMfkH1RZzNg3E2tY0pIFL/MooKvY2hwg1kmkyWC2pAEdM
	MX6tsOF2O5NdnKph9tJ+OIJEglji+dafFHE/ykYaDXAvgZBmEd0KVHF4lq+BL6o3ThY4FTe6nRvH4
	bPcuzBUxDZlGPmve9Nq+5sL1rxKJnnrMVjbcArKpQqwvxya7PdMu+sOzqQA/1x2APSDOGSxxzuYyi
	XvGC099ku5yDr0cumpJ9TU/4ghyj4igPXzTYkUiRfv/9VPBdaHxZueEx13EBjqjgc7nGx530Y8XM1
	1oc52N2g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rXO32-00000008DKp-1eXZ;
	Tue, 06 Feb 2024 16:11:48 +0000
Received: from madrid.collaboradmins.com ([46.235.227.194])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rXO2J-00000008DBa-2CVc;
	Tue, 06 Feb 2024 16:11:07 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1707235860;
	bh=uy1Mkp3gzTrqH7Ahu2KKyj6Zh+0eGBQguM4Q0moS27k=;
	h=Date:From:To:Cc:Subject:From;
	b=2Okhq0ikLzfDyXKIO/Qrp49byJli+hKfZDPNTLKPHs5eSfpIMrxq910C8dHJpY5kc
	 RMlcT4B30spOGUQfGOamfClz8ZirMiMRC9LzQgn22W/9XRrl2b6sIGP3qA2/eWmDot
	 BSR7SdGL6GrOkhetQy29eU8sdZM/7gvUO09msbVJ7Xq6sXT2Uto3ur6bXA4XZvUwaX
	 CK5shYmI/fx0Rqp2bYzeGibjHCAQ35aHTMhBLZ/yRPKppy13p6iVjSrInTxw1KRIJP
	 9XKe4ur2fgzTpvp2zrmbPcPED2qguKSgkUbkrOPdOhgbdJf+REkzHwQmok7D/BupM2
	 se9a9EVxfKxrA==
Received: from notapiano (zone.collabora.co.uk [167.235.23.81])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: nfraprado)
	by madrid.collaboradmins.com (Postfix) with ESMTPSA id C82D837803EE;
	Tue,  6 Feb 2024 16:10:58 +0000 (UTC)
Date: Tue, 6 Feb 2024 11:10:56 -0500
From: =?utf-8?B?TsOtY29sYXMgRi4gUi4gQS4=?= Prado <nfraprado@collabora.com>
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
	Chen-Yu Tsai <wenst@chromium.org>
Cc: regressions@lists.linux.dev, linux-mediatek@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	kernel@collabora.com
Subject: Probe regression of efuse@11f10000 on
 mt8183-kukui-jacuzzi-juniper-sku16 running next-20240202
Message-ID: <47cdeac1-121d-4b1a-a3ac-e2affc7a2fc3@notapiano>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240206_081103_889663_EC08C04C 
X-CRM114-Status: UNSURE (   8.71  )
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

Hi,

KernelCI has identified a regression [1] on the
mt8183-kukui-jacuzzi-juniper-sku16 machine running on next-20240202 compared to
next-20240118:

<4>[    0.627077] sysfs: cannot create duplicate filename '/bus/nvmem/devices/mtk-efuse0'
<4>[    0.634945] CPU: 7 PID: 1 Comm: swapper/0 Not tainted 6.8.0-rc2-next-20240202 #1
<4>[    0.642542] Hardware name: Google juniper sku16 board (DT)
<4>[    0.648237] Call trace:
<4>[    0.650917]  dump_backtrace+0x94/0xec
<4>[    0.654815]  show_stack+0x18/0x24
<4>[    0.658359]  dump_stack_lvl+0x48/0x60
<4>[    0.662252]  dump_stack+0x18/0x24
<4>[    0.665796]  sysfs_warn_dup+0x64/0x80
<4>[    0.669688]  sysfs_do_create_link_sd+0xf0/0xf8
<4>[    0.674353]  sysfs_create_link+0x20/0x40
<4>[    0.678500]  bus_add_device+0x64/0x104
<4>[    0.682475]  device_add+0x33c/0x778
<4>[    0.686193]  nvmem_register+0x514/0x714
<4>[    0.690256]  devm_nvmem_register+0x1c/0x6c
<4>[    0.694577]  mtk_efuse_probe+0xe8/0x170
<4>[    0.698637]  platform_probe+0x68/0xd8
<4>[    0.702525]  really_probe+0x148/0x2b4
<4>[    0.706413]  __driver_probe_device+0x78/0x12c
<4>[    0.710990]  driver_probe_device+0xdc/0x160
<4>[    0.715394]  __driver_attach+0x94/0x19c
<4>[    0.719453]  bus_for_each_dev+0x74/0xd4
<4>[    0.723512]  driver_attach+0x24/0x30
<4>[    0.727312]  bus_add_driver+0xe4/0x1e8
<4>[    0.731284]  driver_register+0x60/0x128
<4>[    0.735343]  __platform_driver_register+0x28/0x34
<4>[    0.740265]  mtk_efuse_init+0x20/0x5c
<4>[    0.744155]  do_one_initcall+0x6c/0x1b0
<4>[    0.748214]  kernel_init_freeable+0x1c8/0x290
<4>[    0.752795]  kernel_init+0x20/0x1dc
<4>[    0.756512]  ret_from_fork+0x10/0x20
<4>[    0.760353] mediatek,efuse: probe of 11f10000.efuse failed with error -17

This efuse probe failure causes the probe failure of other components that
depend on it, including the display pipeline:

/soc/dsi-phy@11e50000
/soc/dsi@14014000
/soc/efuse@11f10000
/soc/i2c@11008000/anx7625@58
/soc/i2c@11008000/anx7625@58/aux-bus/panel
/soc/thermal@1100b000

There is a series already addressing the issue [2]. The first two patches have
been merged into the mediatek tree, but that tree isn't currently being
integrated into linux-next. Besides that, patch 3 hasn't been merged into the
nvmem tree yet, and it is required in order to solve the issue.

I'm sending this regression report so we can properly track the regression while
the fixes don't land on linux-next.

Thanks,
Nícolas

[1] https://linux.kernelci.org/test/plan/id/65bd63c3f12d8a95e200a225/
[2] https://lore.kernel.org/linux-mediatek/20240130095656.3712469-1-wenst@chromium.org/

#regzbot introduced next-20240118..next-20240202

