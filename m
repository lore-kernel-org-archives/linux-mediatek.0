Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C9A701049518
	for <linux-mediatek@archiver.kernel.org>; Wed, 11 Mar 2026 09:35:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-Id:Date
	:Subject:To:From:Reply-To:Content-Type:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=CM4HNHgToIsY7znX80S3YppzLGCbDWWtJmJHNlsSv9I=; b=jX9DNxb/PelDEz
	XvPKjkkpxHEVQfo0xyrLSGunazbMKFZW4FxFvG7p3JoehBDJvvawKWqY2ryx3S/e8rikH5mZb7YT/
	FpO6bXEYRo87VW7NI8ytgVsgK4jGn/mEKzil+tC3Up8nmjpkA8it1Ax0BxAo8apVWAQy1dFXD/ahP
	huNJjSgT54YbRx3ygKApdzHcmo1Rrs+miX5Q9cJr42kzBNiIoR+iuiIKCmdfMEyEZ4liKsc9MvLuF
	kRsQ0otcJuqekhN19QAAuTSb6kAb8XyhWqDzOzDYRMWsEheTWrsj3p5gUcv6qcVVDHKzc3rK+86H5
	IqRS7bLCjLFW9ly3z8BQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w0Fys-0000000BINy-0SsZ;
	Wed, 11 Mar 2026 09:35:54 +0000
Received: from bali.collaboradmins.com ([148.251.105.195])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w0Fyp-0000000BINI-1Q3Q;
	Wed, 11 Mar 2026 09:35:52 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1773221747;
	bh=OZdi9gkak4UPUWK0IKlhqWGeXKeTqlYLrSwjLN5yZtE=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=WWVm+JLKRdZryLlwHsOckfGDgdCYiv0Uu+8TtPNJlx5342n7W4lfCvb1ih0+4FLIj
	 EXJuIhVH0c50PHP9hyrS/RqJQiwBdgq9aGzOcvnwEEB0vObPK2fveoGg+bFxmx+Yg7
	 prbw6LGi1NJYw5Y1m23kATABbPISplehakmS0gapdeAxo8PjmmbuRMTWvTTRS8GiYc
	 FILrnAzbgUFGNOzHz5ZBIXZMV3tGBXcz2mY4m2Ny4Ayui3INyDt0frQ1y9dqiZcfY+
	 AN+WCA3BfPO6R89MYOACon2c2WBNHH8/ycTFQEiZ4KCV3KRsxI+xHsyMwNiVLoOf17
	 9Hh/6R5v8FLUA==
Received: from laura.lan (unknown [IPv6:2001:b07:646b:e2:fe32:28f4:51af:732e])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: laura.nao)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id A234617E0EC1;
	Wed, 11 Mar 2026 10:35:46 +0100 (CET)
From: Laura Nao <laura.nao@collabora.com>
To: linux@fw-web.de
Subject: Re: [PATCH] thermal/drivers/mediatek/lvts: fix mt7987 thermal crash
Date: Wed, 11 Mar 2026 10:35:19 +0100
Message-Id: <20260311093519.15810-1-laura.nao@collabora.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20260309064439.4296-1-linux@fw-web.de>
References: <20260309064439.4296-1-linux@fw-web.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260311_023551_523383_F0D2CD3F 
X-CRM114-Status: GOOD (  16.37  )
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
Cc: rafael@kernel.org, linux-pm@vger.kernel.org, daniel.lezcano@linaro.org, daniel@makrotopia.org, linux-kernel@vger.kernel.org, laura.nao@collabora.com, linux-mediatek@lists.infradead.org, lukasz.luba@arm.com, matthias.bgg@gmail.com, rui.zhang@intel.com, linux-arm-kernel@lists.infradead.org, angelogioacchino.delregno@collabora.com
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

Hi!

On 3/9/26 07:44, Frank Wunderlich wrote:
> From: Frank Wunderlich <frank-w@public-files.de>
>
> On mt7987 we see a crash due to missing ops entry.
>
> [    1.518540] Internal error: Oops: 0000000096000005 [#1]  SMP
> ...
> [    1.564481] pc : lvts_get_temp+0x84/0xc4
> [    1.564492] lr : lvts_get_temp+0x60/0xc4
> ...
> [    1.620900] Call trace:
> [    1.631753]  lvts_get_temp+0x84/0xc4 (P)
> [    1.645471]  __thermal_zone_get_temp+0x24/0x11c
> [    1.656502]  __thermal_zone_device_update+0x9c/0x52c
>
> Add the new ops member added in 7.0-rc1 for mt7987 too.
>
> Fixes: a4c40559499f ("thermal/drivers/mediatek/lvts: Add platform ops to support alternative conversion logic")

I think the Fixes tag should reference 
"thermal/drivers/mediatek/lvts_thermal: Add mt7987 support", as the 
commit introducing the ops also updated all existing data structs (seems 
like mt7987 support landed right after).

> Signed-off-by: Frank Wunderlich <frank-w@public-files.de>
> ---
>  drivers/thermal/mediatek/lvts_thermal.c | 1 +
>  1 file changed, 1 insertion(+)
>
> diff --git a/drivers/thermal/mediatek/lvts_thermal.c b/drivers/thermal/mediatek/lvts_thermal.c
> index a9617d5e0077..5671531d4c23 100644
> --- a/drivers/thermal/mediatek/lvts_thermal.c
> +++ b/drivers/thermal/mediatek/lvts_thermal.c
> @@ -2026,6 +2026,7 @@ static const struct lvts_data mt7987_lvts_ap_data = {
>  	.temp_offset	= LVTS_COEFF_B_MT7987,
>  	.gt_calib_bit_offset = 32,
>  	.def_calibration = 19380,

You'll probably need to define num_cal_offsets too, since the number of 
calibration bytes was also made configurable (not sure if this is 
already addressed by a separate patch).

> +	.ops = &lvts_platform_ops_mt7988,
>  };
>  
>  static const struct lvts_data mt7988_lvts_ap_data = {

Best,

Laura



