Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6C32EC7EE2E
	for <linux-mediatek@archiver.kernel.org>; Mon,  5 Jun 2023 07:52:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=1OxS0+MXhITTik1SZSy3CKfcdf4/DnOZHZgAyW//31c=; b=WKtaiV51tBcgDq8d4K8GSIa05d
	wBc1aJdjFUBltpwhAbt8uXlA4P+BDxd+pXD/jLPWkta+xpqfYzpxFmO6BUVtX8gvPmgcRrkqkVaBw
	j+snR7RKLk1VLen+GbHPjZMGUbQ1tSBhUmMZOPBWUQevnN1WeIhd5jJ9h9v6twI2IoouT3/8bn6EV
	hoYlOz+8VAhRoxxEzEbSpdjXsZ2bG7lwaLzNwJJRa2EuoLgGbGDZqpUwrPPPeIrc3Qk7O3zs/e/p+
	+yH2qp1hHmuutTRnE5U6X/AI4CZzdU7LIFP5gb4Oq9OtyyPMavENSb8T0Y6gkYq72UbO0qzZMR1Vl
	8atj6Dpw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1q651C-00EccO-39;
	Mon, 05 Jun 2023 07:52:46 +0000
Received: from madras.collabora.co.uk ([46.235.227.172])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1q6518-00EcZw-1s;
	Mon, 05 Jun 2023 07:52:45 +0000
Received: from [IPV6:2001:b07:2ed:14ed:a962:cd4d:a84:1eab] (unknown [IPv6:2001:b07:2ed:14ed:a962:cd4d:a84:1eab])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits))
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id D2CF366056AA;
	Mon,  5 Jun 2023 08:52:39 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1685951561;
	bh=ma8BsYbgBg4IWVmjxVkOdcEeWuXb2Q5wJV89M9WEafQ=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=fPWZk0y1402kA+YZQ63ycsSDCF70dv82ThEZDWUKgjAM19Ezcmg9BuXaMBSW5r3eG
	 v5HY8RyJPmXdjOpab1yj3AJGh0K1nZbygk9BYHkj2DBBrgljsi9bDpqQTvTVib2f0d
	 IjlHgzHbpOkT7zvjeuyQty8h7zekYuuzxm3d1K6v+WhxfiKSjX94kMTfOerY4NuHz9
	 42D14zFM+hwhGtvd9eRF6fb8M//9CH4Ybf1Sww1lUD9I8munXPK2+ORGJO7B+b4g2m
	 t/rajBjUgz0i9YqDVFXZ7G/K1AK0kZotmW4GnVin4RAJPoYbeMrZxVmiwOj9fpV980
	 NgAic0Zt1XTvw==
Message-ID: <fdc3cfa9-3221-c422-a42b-602410dc22f4@collabora.com>
Date: Mon, 5 Jun 2023 09:52:37 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.2
Subject: Re: [PATCH v4 0/5] Add LVTS support for mt8192
Content-Language: en-US
To: =?UTF-8?B?TsOtY29sYXMgRi4gUi4gQS4gUHJhZG8=?= <nfraprado@collabora.com>,
 Chen-Yu Tsai <wenst@chromium.org>
Cc: =?UTF-8?Q?Bernhard_Rosenkr=c3=a4nzer?= <bero@baylibre.com>,
 daniel.lezcano@linaro.org, rafael@kernel.org, amitk@kernel.org,
 rui.zhang@intel.com, matthias.bgg@gmail.com, robh+dt@kernel.org,
 krzysztof.kozlowski+dt@linaro.org, rdunlap@infradead.org,
 ye.xingchen@zte.com.cn, p.zabel@pengutronix.de, linux-pm@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org, devicetree@vger.kernel.org,
 james.lo@mediatek.com, rex-bc.chen@mediatek.com, abailon@baylibre.com,
 amergnat@baylibre.com, khilman@baylibre.com
References: <20230530195132.2286163-1-bero@baylibre.com>
 <CAGXv+5EVfgEBDm=7MmQ=OsP322KmE23PwycJ-0LjU+3dEZygUQ@mail.gmail.com>
 <572f5a88-8c2e-4324-b477-836a5024ec67@notapiano>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
In-Reply-To: <572f5a88-8c2e-4324-b477-836a5024ec67@notapiano>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230605_005242_748723_FD5997C3 
X-CRM114-Status: GOOD (  25.33  )
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

Il 01/06/23 19:09, Nícolas F. R. A. Prado ha scritto:
> On Wed, May 31, 2023 at 12:49:43PM +0800, Chen-Yu Tsai wrote:
>> On Wed, May 31, 2023 at 3:51 AM Bernhard Rosenkränzer <bero@baylibre.com> wrote:
>>>
>>> From: Balsam CHIHI <bchihi@baylibre.com>
>>>
>>> Add full LVTS support (MCU thermal domain + AP thermal domain) to MediaTek MT8192 SoC.
>>> Also, add Suspend and Resume support to LVTS Driver (all SoCs),
>>> and update the documentation that describes the Calibration Data Offsets.
>>>
>>> Changelog:
>>>      v4 :
>>>          - Shrink the lvts_ap thermal sensor I/O range to 0xc00 to make
>>>            room for SVS support, pointed out by
>>>            AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
>>>
>>>      v3 :
>>>          - Rebased :
>>>              base-commit: 6a3d37b4d885129561e1cef361216f00472f7d2e
>>>          - Fix issues in v2 pointed out by Nícolas F. R. A. Prado <nfraprado@collabora.com>:
>>>            Use filtered mode to make sure threshold interrupts are triggered,
>>
>> I'm seeing sensor readout (either through sysfs/thermal/<x>/temp or hwmon)
>> fail frequently on MT8192. If I run `sensors` (lm-sensors), at least a couple
>> of the LVTS sensors would be N/A. Not sure if this is related to this change.
> 
> Yes, it is. Filtered mode has some delay associated with reading, meaning most
> of the time the value isn't ready, while immediate mode is, well, pretty much
> immediate and the read always succeeds.
> 
> For temperature monitoring, filtered mode should be used. It supports triggering
> interrupts when crossing the thresholds. Immediate mode is meant for one-off
> readings of the temperature. This is why I suggested using filtered mode.
> 
> As far as the thermal framework goes, it's ok that filtered mode doesn't always
> return a value, as it will keep the old one. But of course, having the
> temperature readout always work would be a desired improvement.
> 
> As for ways to achieve that, I think the intended way would be to enable the
> interrupts that signal data ready on filtered mode (bits 19, 20, 21, 28), read
> the temperature and cache it so it is always available when the get_temp()
> callback is called. The issue with this is that it would cause *a lot* of
> interrupts, which doesn't seem worth it.
> 
> Another option that comes to mind would be to enable immediate mode only during
> the get_temp() callback, to immediately read a value, and return to filtered
> mode at the end. That might work, but I haven't tried yet.
> 

The issue with keeping all as filtered mode comes when we want to add MediaTek
SVS functionality which, on most SoCs, is used only for the GPU (apart from the
MT8183 which has cpu+gpu svs).

It makes sense to cache the readings, but I'm concerned about possible
instabilities that we could get through the SVS voltage adjustment flows, as
that algorithm takes current IP temperature to shape the DVFS "V" curve; please
keep in mind that this concern is valid only if temperature readings get updated
"very slowly" (>100ms would be too slow).

So, point of the situation:
  - Filtered mode, less than 100ms per temperature reading -> cache it, it's ok
  - Filtered mode, more than 100ms per temp reading -> switch GPU to Immediate mode.

Your call.

Keep up the good work!
- Angelo


