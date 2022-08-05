Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E7740C25B06
	for <linux-mediatek@archiver.kernel.org>; Fri,  5 Aug 2022 00:00:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=E27IeQvvlc41LUcUnmptaTIHUKJpzlbCNIQnwCfHMMM=; b=HYnOtd+SqBP77YwI7tE1E2ctYM
	CUS1nJtps93NxTbhLcQ+cyM4ALFlig8FUOp2N0HdiXdEqGh4XWsZOWcmI+2fGfCEJjO/wkN82zhET
	DGY7xVYVV2K52ZelOzWtbbPwiNYmCEDs/cnEuivWwMHcdTI593mQ9Fz0T2ia4a4/Vgxj4naHAWvGI
	JcU5nzHBUjx8/QJWn0QEO0/HEenhL0DNYJaWwiZaCWsEGLFFZEximBig4v2FPu3WR8bl3E2t1VndQ
	Qpo9V68UgpYOLKJ+BhPJQw1Vv+2PRblHbslpL9C+O8XHKXahdUw8ulhuNL6aMNINfN9JLDCf2tYSN
	FUTZiyEA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oJklK-00ADWx-Np; Fri, 05 Aug 2022 00:00:22 +0000
Received: from madras.collabora.co.uk ([2a00:1098:0:82:1000:25:2eeb:e5ab])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oJkl9-00ADS0-2D; Fri, 05 Aug 2022 00:00:12 +0000
Received: from notapiano (pool-98-113-53-228.nycmny.fios.verizon.net [98.113.53.228])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: nfraprado)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id 168826601BFA;
	Fri,  5 Aug 2022 01:00:07 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1659657609;
	bh=9IWOqoMZl87xKFNXdbsY2lD256+X8oemFwBtvRVYKMU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=gCk84Flp/HQMm/r7Wu1xhl6K9nnsuhbKmhYnpEZFhls8m64otTleTFvTId5i3fg0J
	 n53uFS0ILVjAVjNE2AxXtF33RNeHDJiwFw4BAi0DpKfRN07o376iDyoMJ7rej8FxAV
	 cBzMNgOnjhk93Nck/64Wd61K41LZ3JthNdLcKMCuIUTOW+DOeC2xlKcunNvgiIZPhK
	 gzxuhTTlhwwTViXamwzMhNBd16XD0/CyWTVDqK17RRukKIqJlWBKuifhDFwjiQHALy
	 jig/uIpwDnMp8StHAvUDBtKHKHK4R1iX3d7oMGIg0EKNQIJpkBiIPGKGOz06se3Khr
	 Gi8NSKUhgv3EA==
Date: Thu, 4 Aug 2022 20:00:03 -0400
From: =?utf-8?B?TsOtY29sYXMgRi4gUi4gQS4=?= Prado <nfraprado@collabora.com>
To: bchihi@baylibre.com
Cc: rafael@kernel.org, rui.zhang@intel.com, daniel.lezcano@linaro.org,
	amitk@kernel.org, linux-pm@vger.kernel.org,
	linux-kernel@vger.kernel.org, khilman@baylibre.com,
	mka@chromium.org, robh+dt@kernel.org, krzk+dt@kernel.org,
	matthias.bgg@gmail.com, p.zabel@pengutronix.de,
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org, james.lo@mediatek.com,
	fan.chen@mediatek.com, louis.yu@mediatek.com,
	rex-bc.chen@mediatek.com, abailon@baylibre.com
Subject: Re: [PATCH v8.1, 4/7] thermal: mediatek: Add LVTS driver for mt8192
 thermal zones
Message-ID: <20220805000003.gljuut3udzed7avz@notapiano>
References: <20220804130912.676043-1-bchihi@baylibre.com>
 <20220804130912.676043-5-bchihi@baylibre.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20220804130912.676043-5-bchihi@baylibre.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220804_170011_261388_EB0F1F59 
X-CRM114-Status: UNSURE (   9.40  )
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

Hi Balsam,

another thing.

On Thu, Aug 04, 2022 at 03:09:09PM +0200, bchihi@baylibre.com wrote:
[..]
> --- /dev/null
> +++ b/drivers/thermal/mediatek/lvts_thermal.h
[..]
> +#define ONE_SAMPLE							(lvts_data->counting_window_us + 2 * BUS_ACCESS_US)

This macro is still using a hardcoded variable.

> +#define NUM_OF_SAMPLE(tc_id)				((lvts_data->tc[tc_id].hw_filter < LVTS_FILTER_2) ? \
> +	1 : ((lvts_data->tc[tc_id].hw_filter > LVTS_FILTER_16_OF_18) ? \
> +	1 : ((lvts_data->tc[tc_id].hw_filter == LVTS_FILTER_16_OF_18) ? \
> +	18 : ((lvts_data->tc[tc_id].hw_filter == LVTS_FILTER_8_OF_10) ? \
> +	10 : (lvts_data->tc[tc_id].hw_filter * 2)))))

Ditto.

> +
> +#define PERIOD_UNIT_US(tc_id)		((lvts_data->tc[tc_id].tc_speed->period_unit * 256 * \
> +	CLOCK_26MHZ_CYCLE_NS) / 1000)
> +#define FILTER_INT_US(tc_id)		(lvts_data->tc[tc_id].tc_speed->filter_interval_delay * \
> +	PERIOD_UNIT_US(tc_id))
> +#define SENSOR_INT_US(tc_id)		(lvts_data->tc[tc_id].tc_speed->sensor_interval_delay * \
> +	PERIOD_UNIT_US(tc_id))
> +#define GROUP_INT_US(tc_id)			(lvts_data->tc[tc_id].tc_speed->group_interval_delay * \
> +	PERIOD_UNIT_US(tc_id))

All of these too.

> +#define SENSOR_LATENCY_US(tc_id)	((NUM_OF_SAMPLE(tc_id) - 1) * FILTER_INT_US(tc_id) + \
[..]
> +#define DEVICE_READ				(CK26M_ACTIVE(lvts_data) | DEVICE_ACCESS)

And this.

> +#define DEVICE_WRITE			(CK26M_ACTIVE(lvts_data) | DEVICE_ACCESS | WRITE_ACCESS)

And this.

> +#define RESET_ALL_DEVICES		(DEVICE_WRITE | RG_TSFM_RST << 8 | 0xFF)
> +#define READ_DEVICE_REG(reg_id)	(DEVICE_READ | (reg_id) << 8 | 0x00)
> +#define READ_BACK_DEVICE_ID		(CK26M_ACTIVE(lvts_data) | DEVICE_ACCESS | BROADCAST_ID_UPDATE | \

And finally this one.

I might've have missed some, so please double-check and remove any lingering
hardcoded variable in macros.

Thanks,
Nícolas

> +	RG_DID_LVTS << 8)
[..]

