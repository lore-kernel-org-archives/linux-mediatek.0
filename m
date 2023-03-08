Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 978C8C64EC4
	for <linux-mediatek@archiver.kernel.org>; Wed,  8 Mar 2023 11:46:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:References:Cc:To:From:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=QtIo6+b9DxVxHhC3QOgcVpYhVg5GQs+t/MMJzZHD8u0=; b=rFN/zbjfZHbX8g68D4g4uyOqJB
	uBpN17/YDcrmF2CaxEiaSBa13/r6oTzIBRHpu7OX5kOvgpUIH9j1j8pamlqeFDiYhZ6HKfZ4bnnzy
	AHe7f+hR6sKx+Gmw63xWXtMR7+AxiRSW4SPqBdfvPTBRnhwRXJ85HIzL73aHyNMHGoS55ilkiEqlr
	FUI3JsaECQ06Z6ECDgHihN8hkRlWhUkNDKesQP5+bhTi1pIyCXEFZ92ip/bazqtcws4CrIlnrLwCr
	ELjAvmjWHJmnPi9N7aqyyEXD+taQEXeaeBwuoq+yAuVNORNnY1s2BNYyUJuYrwLag7C6p6Uyr6N1l
	dtFoHNNA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pZsFS-004fty-JH; Wed, 08 Mar 2023 11:46:22 +0000
Received: from madras.collabora.co.uk ([2a00:1098:0:82:1000:25:2eeb:e5ab])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pZsFH-004frH-JD; Wed, 08 Mar 2023 11:46:13 +0000
Received: from [192.168.1.100] (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id 97D9F660000F;
	Wed,  8 Mar 2023 11:46:09 +0000 (GMT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1678275970;
	bh=Fz4r9E9olNDyPmEeLOcgEBzWwcRZ44On96yQB42TXEw=;
	h=Date:Subject:From:To:Cc:References:In-Reply-To:From;
	b=acrXZejibitZcABdpwyKEZGsbOVzp3Q4HAaFxtm54hQ4rGX4a+KIqL+7z3WHmfpD8
	 ZirF9hYD51MjKGy2CLEVwbgVNu5jT3daVgNvXQDuhiY2p49wRK8Dk0T+ODmy0ZCgLa
	 RVw7A3HWF1cGsyVQVXNnMvYk5X94xti8jRIRoleVb1j7/qUbCQ3vnTmkpVJtlBLphG
	 u+mR5evvfUXZCiuUHU+faC0JhgH9V8I2GIpC0vGDs/Rmduwf6LA+4VC7WF6KDifFt5
	 CkEH82xPXX5AzieR+T+2IVHx9gB1HET8RdXJJTahZWuHvTDkmhbIohQ/CNj5AmrhrF
	 HY8k/P1nr81jQ==
Message-ID: <06909bd8-3da2-1cf0-82ac-3ed4f3e63def@collabora.com>
Date: Wed, 8 Mar 2023 12:46:07 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Subject: Re: [PATCH 0/2] pwm: mtk-disp: Fix backlight configuration at boot
Content-Language: en-US
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
To: thierry.reding@gmail.com
Cc: u.kleine-koenig@pengutronix.de, matthias.bgg@gmail.com,
 weiqing.kong@mediatek.com, jitao.shi@mediatek.com,
 linux-pwm@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org,
 kernel@collabora.com, Greg Kroah-Hartman <gregkh@linuxfoundation.org>
References: <20230123160615.375969-1-angelogioacchino.delregno@collabora.com>
 <06918fde-64ea-37b2-da1a-1c8316457223@collabora.com>
In-Reply-To: <06918fde-64ea-37b2-da1a-1c8316457223@collabora.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230308_034611_781795_38C88CBC 
X-CRM114-Status: GOOD (  13.49  )
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

Il 23/02/23 15:16, AngeloGioacchino Del Regno ha scritto:
> Il 23/01/23 17:06, AngeloGioacchino Del Regno ha scritto:
>> Since the pwm-mtk-disp driver was fixed to get PWM_EN state from the
>> right register, an old two-wrongs-make-one-right issue emerged: as a
>> result, MT8192 Asurada Spherion got no backlight at boot unless a
>> suspend/resume cycle was performed.
>> Also, the backlight would sometimes not get updated with the requested
>> value, requiring the user to change it back and forth until it worked.
>>
>> This series fixes both of the aforementioned issues found on MT8192.
>>
>> AngeloGioacchino Del Regno (2):
>>    pwm: mtk-disp: Disable shadow registers before setting backlight
>>      values
>>    pwm: mtk-disp: Configure double buffering before reading in
>>      .get_state()
>>
>>   drivers/pwm/pwm-mtk-disp.c | 34 +++++++++++++++++++++++-----------
>>   1 file changed, 23 insertions(+), 11 deletions(-)
>>
> 
> Gentle ping for this one: this is fixing backlight issues on multiple MediaTek
> SoCs and was well tested.
> 
> Thanks,
> Angelo

Since this series was sent more than one month ago, and since this fixes broken
backlight on a number of Chromebooks with MT8183 and MT8192 SoCs, and seen the
urgency of getting these fixes in, I'm adding Greg to the loop.

Regards,
Angelo

