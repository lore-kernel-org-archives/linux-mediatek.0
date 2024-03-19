Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1A7C3C54E5D
	for <linux-mediatek@archiver.kernel.org>; Tue, 19 Mar 2024 11:40:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=FDOG/qd1W7RDYW7nngfB+Idw2aCEmTlJq9eHZ0eQeNg=; b=UUHRS+M7mHdE9fvL6W06ST4Tu1
	qQHen38yxR31IPOPhEJ7h+9q21e1Rdhnzus05d8dL0w9QS/SWrc6r6gqgIC2eOK5xv1G4qBLSSbW7
	iHOtMXitBmUma9h0v4BiT+SJhCtUhKSJD4n21trSf4Rri0WdogENR4PAuetTv05sS5tGnenLlTTtK
	5xzwtnN2uF/OrrgSDNh6j4VDBb49Ks1j69z+is2bYH53DtGGBBb40i+JhCMpnEhVsgBtGukS/MlkF
	+gzS6waQtEbMdgwYHExL7TsZve+HeTQntxilQqJkYtOR7LM350IjLfqqwsFMqCtmmtMp6QGqZdgab
	H3Cz46XQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rmXpU-0000000CVOT-2ipB;
	Tue, 19 Mar 2024 11:40:28 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rmXpR-0000000CVNv-0GWI
	for linux-mediatek@lists.infradead.org;
	Tue, 19 Mar 2024 11:40:26 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 9CB7F60E8E;
	Tue, 19 Mar 2024 11:40:23 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2287FC433C7;
	Tue, 19 Mar 2024 11:40:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1710848423;
	bh=QCABlmmQRWtKI06jZoMFlB5Yrgasl+VafkEPPnZ6XrY=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=kOFTWEOzUnCMkQtyxvj+LkfkJxx4r05vJHBoolV6B9rpwTeHHLgGu3ITGBHg2ZHLg
	 Q7t1PWIE0dTEo2CquMjRyfzt1ipnGVbgdk0M2BA6ZuW7+Jxhc0Wv4YsgZiqcn9vYVt
	 t+McN7YdZ7NFvsks+UDQSmZevVTdPVHUCuOzLdeb5ndUWRiJ6h9/HMBlGEVF6OiZ2e
	 p6E9TyUzYW2Tcne1nMQSeDtffk8QUseLaf3e/JSq95AHkiMFxiuNYdEco/VdXhOUxI
	 H6B8dd3D4gy9g6DiHI8E/eY++Wg58fWajyE7gWayOfPjSKipfsEwkSDADH8qzuvSsQ
	 wZ76FrDFs2BJw==
Message-ID: <7a529bd6-abac-42d0-980e-3b1b5c46946f@kernel.org>
Date: Tue, 19 Mar 2024 12:40:20 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 01/13] thermal/drivers/mediatek/lvts_thermal: retrieve
 all calibration bytes
Content-Language: en-US
To: Nicolas Pitre <nico@fluxnic.net>,
 Daniel Lezcano <daniel.lezcano@linaro.org>, linux-pm@vger.kernel.org,
 linux-mediatek@lists.infradead.org, devicetree@vger.kernel.org
Cc: Nicolas Pitre <npitre@baylibre.com>
References: <20240318212428.3843952-1-nico@fluxnic.net>
 <20240318212428.3843952-2-nico@fluxnic.net>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@kernel.org>
In-Reply-To: <20240318212428.3843952-2-nico@fluxnic.net>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240319_044025_219985_D3753ACF 
X-CRM114-Status: GOOD (  18.01  )
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

Il 18/03/24 22:22, Nicolas Pitre ha scritto:
> From: Nicolas Pitre <npitre@baylibre.com>
> 
> Calibration values are 24-bit wide. Those values so far appear to span
> only 16 bits but let's not push our luck.
> 

I wonder how much feedback you got on v1 - I didn't even look and will not lose
time with that - but regardless, if you don't add the right people to the Cc field,
I really don't think that you'll ever get your patches reviewed (and probably also
not accepted).

That -- especially if you don't even Cc all the relevant maintainers...!

Please read:
https://www.kernel.org/doc/html/latest/process/submitting-patches.html

P.S.:
scripts/get_maintainer.pl lvts-8186-8188-patches.patch

"Rafael J. Wysocki" <rafael@kernel.org> (supporter:THERMAL)
Daniel Lezcano <daniel.lezcano@linaro.org> (supporter:THERMAL,commit_signer:21/22=95%)
Zhang Rui <rui.zhang@intel.com> (reviewer:THERMAL)
Lukasz Luba <lukasz.luba@arm.com> (reviewer:THERMAL)
Rob Herring <robh@kernel.org> (maintainer:OPEN FIRMWARE AND FLATTENED DEVICE TREE 
BINDINGS)
Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org> (maintainer:OPEN FIRMWARE 
AND FLATTENED DEVICE TREE BINDINGS)
Conor Dooley <conor+dt@kernel.org> (maintainer:OPEN FIRMWARE AND FLATTENED DEVICE 
TREE BINDINGS)
Matthias Brugger <matthias.bgg@gmail.com> (maintainer:ARM/Mediatek SoC 
support,commit_signer:4/22=18%)
AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com> 
(maintainer:ARM/Mediatek SoC support,commit_signer:13/22=59%)
Alexandre Mergnat <amergnat@baylibre.com> (commit_signer:11/22=50%)
"Nícolas F. R. A. Prado" <nfraprado@collabora.com> 
(commit_signer:10/22=45%,authored:7/22=32%,added_lines:128/453=28%,removed_lines:45/98=46%)
Balsam CHIHI <bchihi@baylibre.com> 
(authored:4/22=18%,added_lines:235/453=52%,removed_lines:22/98=22%,in file)
Chen-Yu Tsai <wenst@chromium.org> (authored:2/22=9%)
Minjie Du <duminjie@vivo.com> (authored:2/22=9%)
Frank Wunderlich <frank-w@public-files.de> 
(authored:2/22=9%,added_lines:72/453=16%,removed_lines:17/98=17%)
linux-pm@vger.kernel.org (open list:THERMAL)
devicetree@vger.kernel.org (open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS)
linux-kernel@vger.kernel.org (open list)
linux-arm-kernel@lists.infradead.org (moderated list:ARM/Mediatek SoC support)
linux-mediatek@lists.infradead.org (moderated list:ARM/Mediatek SoC support)


> Found while looking at the original Mediatek driver code.
> 
> Signed-off-by: Nicolas Pitre <npitre@baylibre.com>
> ---
>   drivers/thermal/mediatek/lvts_thermal.c | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/thermal/mediatek/lvts_thermal.c b/drivers/thermal/mediatek/lvts_thermal.c
> index 98d9c80bd4..8aa6a8675b 100644
> --- a/drivers/thermal/mediatek/lvts_thermal.c
> +++ b/drivers/thermal/mediatek/lvts_thermal.c
> @@ -679,7 +679,7 @@ static int lvts_calibration_init(struct device *dev, struct lvts_ctrl *lvts_ctrl
>   
>   	for (i = 0; i < lvts_ctrl_data->num_lvts_sensor; i++)
>   		memcpy(&lvts_ctrl->calibration[i],
> -		       efuse_calibration + lvts_ctrl_data->cal_offset[i], 2);
> +		       efuse_calibration + lvts_ctrl_data->cal_offset[i], 3);
>   
>   	return 0;
>   }


