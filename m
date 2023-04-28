Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 427B5C77B60
	for <linux-mediatek@archiver.kernel.org>; Fri, 28 Apr 2023 20:11:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=MgdzgDNJNalWOFj5w5YaMVuep8d52QqErlgDWabqkzo=; b=UXqO76UHkwihHyYg+Gr+IwROBj
	E8honIme082UWoV+69J6OHMFc2At1kI1nLLyQSwir0sS0msSDVoDQFNBWcrWdEeDvauSrYz4NjK3s
	hIqkkF+38Ia5zlIZQgPDtw2eyKmVtJTNmEHjNz/Xs+68GFHVYFvjtCSvEVcBDBFNvc8qkMEpaaWzU
	sysJ2DwsT8zFd49itg78uro6XRVpKsUiBLD02xl5y7wvYnrO4K4+HeFC44H1B3KPp09UexFD4oFox
	vr1iMU00DklslacIRqNlPLVc+4g8wORW2gGWeKOR9fmJdxGHusfUjYKGcIpRelx8/ek7v4jJj4pyJ
	ewhrbXTg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1psUQg-00BhyO-39;
	Fri, 28 Apr 2023 20:10:54 +0000
Received: from madras.collabora.co.uk ([2a00:1098:0:82:1000:25:2eeb:e5ab])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1psUQc-00Bhwz-0N;
	Fri, 28 Apr 2023 20:10:53 +0000
Received: from notapiano (unknown [194.36.25.39])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: nfraprado)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id 1E58866032CF;
	Fri, 28 Apr 2023 21:10:43 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1682712648;
	bh=b5em7hgy8DNSPO5+mn/VtcgYEzm4w56x9wJfr+VO8D4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=mOYtKibkW1pr8UXj77mTOfkBfTEHE2oP6mK91rL1sLuM5uyyvweODtM13BjoCDbqq
	 FFlgX6LUhK6MPAje3n1giNCCJZ6nK4Jzn282wQtxAY3Vs3fUeYfiB0HcI4kr75L+QD
	 dtA550hoHvFG0YaRobuOVtopR1PCjQlRpnP/TYL21qS0vVL4cseX7YVT1gXlGIHQJY
	 Cm5igPAjkdFstwIoKSWNP0DM2AqJnoDgW3xoW0u7vuXjWkqqJnBXPphbruh4q3VzOf
	 EYiQtcnpkVuoWrFv54pwSmzpmg18h9OujEAIIqdPwFmu+14kVVWc/OuZiWOp4YltMr
	 20V+GcMJtpdWw==
Date: Fri, 28 Apr 2023 16:10:38 -0400
From: =?utf-8?B?TsOtY29sYXMgRi4gUi4gQS4=?= Prado <nfraprado@collabora.com>
To: bchihi@baylibre.com
Cc: daniel.lezcano@linaro.org, angelogioacchino.delregno@collabora.com,
	rafael@kernel.org, amitk@kernel.org, rui.zhang@intel.com,
	matthias.bgg@gmail.com, robh+dt@kernel.org,
	krzysztof.kozlowski+dt@linaro.org, rdunlap@infradead.org,
	ye.xingchen@zte.com.cn, p.zabel@pengutronix.de,
	linux-pm@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org, devicetree@vger.kernel.org,
	wenst@chromium.org, james.lo@mediatek.com, rex-bc.chen@mediatek.com,
	abailon@baylibre.com, amergnat@baylibre.com, khilman@baylibre.com
Subject: Re: [PATCH v2 3/5] thermal/drivers/mediatek/lvts_thermal: Add mt8192
 support
Message-ID: <37680c5e-e61c-410b-b48d-829914200e4a@notapiano>
References: <20230425133052.199767-1-bchihi@baylibre.com>
 <20230425133052.199767-4-bchihi@baylibre.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20230425133052.199767-4-bchihi@baylibre.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230428_131050_283229_46EA2856 
X-CRM114-Status: GOOD (  20.54  )
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

On Tue, Apr 25, 2023 at 03:30:50PM +0200, bchihi@baylibre.com wrote:
> From: Balsam CHIHI <bchihi@baylibre.com>
> 
> Add LVTS Driver support for MT8192.
> 
> Signed-off-by: Balsam CHIHI <bchihi@baylibre.com>
> Co-developed-by : Nícolas F. R. A. Prado <nfraprado@collabora.com>
> Signed-off-by: Nícolas F. R. A. Prado <nfraprado@collabora.com>
> ---
>  drivers/thermal/mediatek/lvts_thermal.c | 92 +++++++++++++++++++++++++
>  1 file changed, 92 insertions(+)
> 
> diff --git a/drivers/thermal/mediatek/lvts_thermal.c b/drivers/thermal/mediatek/lvts_thermal.c
> index 5ea8a9d569ea6..8df7b4c72a658 100644
> --- a/drivers/thermal/mediatek/lvts_thermal.c
> +++ b/drivers/thermal/mediatek/lvts_thermal.c
[..]
> +static const struct lvts_ctrl_data mt8192_lvts_mcu_data_ctrl[] = {
> +	{
> +		.cal_offset = { 0x04, 0x08 },
> +		.lvts_sensor = {
> +			{ .dt_id = MT8192_MCU_BIG_CPU0 },
> +			{ .dt_id = MT8192_MCU_BIG_CPU1 }
> +		},
> +		.num_lvts_sensor = 2,
> +		.offset = 0x0,
> +		.hw_tshut_temp = LVTS_HW_SHUTDOWN_MT8192,

Hi Balsam,

during the investigation I did to fix the interrupt issues I mentioned in v1, I
noticed that the threshold interrupts (hot, hot to normal, cold), only trigger
when the controller is configured to filtered mode. In immediate mode the
threshold interrupts are not triggered.

So I say we add

               .mode = LVTS_MSR_FILTERED_MODE,

for all the controllers here. Same for MT8195, although I guess that'd be better
done in a separate series. And I haven't had time to test more on MT8195 to see
if I can get any interrupts there.

One issue with filtered mode is that the data read is often not ready (valid bit
unset), so most of the time it returns -EAGAIN. But I think that should be easy
to address by reading with a timeout (equal to the measurement interval we
already know), instead of a single time, if on filtered mode.

I'll also try to review the other commits in this series, though that'll have to
wait for next week.

Thanks,
Nícolas

