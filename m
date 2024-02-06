Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F2191C48297
	for <linux-mediatek@archiver.kernel.org>; Tue,  6 Feb 2024 16:14:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=6LevaEdmrWTeZjuRgoDNaL/sbczTsATmQBMldo0GZNY=; b=Aq8XATQnQhGMofFpPL1Oqp2+KU
	VGSdq1oAr9Mo3VYY1T47t80so4S7oRq6bPcJn5MQ+Ej7OReXYSUf9EHhm16/v0QqbaWi+n8Aa8r5h
	JGJm3OVD3kymQc873BWhV/ssfKAmxXk8Kq9C/tsrk/uOTPnOLdzEsxcQ2rrKtj918ATQvmPzoUhOU
	q6DvtlKDuTvvI4dCn0TKyCWvtwR4EIfl2e37lTvmlWA/3D8hLEcwmaH+lrcZbb3iNlAoGZWOA+qge
	kqHlXgH6wHuKBwUb7qNt68NuVopPAMirLNd831elO8yq61xsHg+2pKCqITnmYvqiqy2Kcw8e1P2H5
	Hd0ht0NQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rXO5J-00000008Dlf-2mG2;
	Tue, 06 Feb 2024 16:14:09 +0000
Received: from madrid.collaboradmins.com ([46.235.227.194])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rXO5G-00000008Dkr-3ZaG;
	Tue, 06 Feb 2024 16:14:08 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1707236045;
	bh=tEkx7A+6AgwnGEsLHznPy0/5jiVXyn3+twjXfInoCys=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=WToGyYlHypkBbAwLW4E6hcECZpmOLTfS479VjD4Mlrn/B46Wz9TeUA7QgBp24QPOK
	 dc+XfhXoxoM71FTqCo1dqfGHSlUszPL3KuJ1HrrqmUWEzLTtzPoUan514gzI4UjISi
	 VMqGtu6hVyQFgWi6KY43HNH1/rvPW0kddbPAi7Up6/yued8KwmoDYoW3Sx4tCnyn4e
	 m9PZ6B94sCLnC2JFKPjgwagv5a/L9rtSn6Ei61vcGtkjB+k7iuZo6j4NjTHUglkpi0
	 95SCLW4c6IGpNpYCfyijYe+VrlSFAfF7s7akrx0gd6WDEKHQ3tfCVO6/pkcqzjtQMV
	 fj08YCB6d+pxQ==
Received: from notapiano (zone.collabora.co.uk [167.235.23.81])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: nfraprado)
	by madrid.collaboradmins.com (Postfix) with ESMTPSA id E00F637803EE;
	Tue,  6 Feb 2024 16:14:03 +0000 (UTC)
Date: Tue, 6 Feb 2024 11:14:01 -0500
From: =?utf-8?B?TsOtY29sYXMgRi4gUi4gQS4=?= Prado <nfraprado@collabora.com>
To: Chen-Yu Tsai <wenst@chromium.org>
Cc: Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	William-tw Lin <william-tw.lin@mediatek.com>
Subject: Re: [PATCH 3/3] nvmem: mtk-efuse: Drop NVMEM device name
Message-ID: <915f1ec3-a70a-4b56-9e93-5b597fc770cd@notapiano>
References: <20240130095656.3712469-1-wenst@chromium.org>
 <20240130095656.3712469-4-wenst@chromium.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20240130095656.3712469-4-wenst@chromium.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240206_081407_042590_0CBA3B67 
X-CRM114-Status: GOOD (  10.66  )
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

On Tue, Jan 30, 2024 at 05:56:53PM +0800, Chen-Yu Tsai wrote:
> The MT8183 has not one but two efuse devices. The static name and ID
> causes the second efuse device to fail to probe, due to duplicate sysfs
> entries.
> 
> With the rework of the mtk-socinfo driver, lookup by name is no longer
> necessary. The custom name can simply be dropped.
> 
> Fixes: 4e6102d60d88 ("nvmem: mtk-efuse: Register MediaTek socinfo driver from efuse")
> Signed-off-by: Chen-Yu Tsai <wenst@chromium.org>

Tested-by: Nícolas F. R. A. Prado <nfraprado@collabora.com>

This does fix the efuse (and display) probe issue on MT8183. FYI I've sent a
regression report for it at
https://lore.kernel.org/all/47cdeac1-121d-4b1a-a3ac-e2affc7a2fc3@notapiano

Thanks,
Nícolas

