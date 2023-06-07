Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F2B97C77B7A
	for <linux-mediatek@archiver.kernel.org>; Wed,  7 Jun 2023 07:17:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=EQ56zX8A8ZK7356EGcnF/pDjYYqkt+7e/kyGZKrNV0A=; b=ZAKbl23J+9StTH7y6nJ0/zsFMV
	1gQki88z0MMNL3z/zN1hFfdsdVqttOZ9HOzNXl7jo2F2Sk7ZKUlEHF3eqEKJW/pTO1g9HKvDR9Sg3
	QJjqW+CTTEX3v//aaw7UL45V+AaUTbARu9fy5BrZ9G4YLT1Sx+G+qYPuv4IelzMeZwC9gHyCgBxmU
	TBiBlXHhjJHPw5JzoOT4cwT8psyWhuQaJxFIhmwLbePrBLivIFNzndK816VCspMciRjLQ4u4SEAjp
	RnS2QEBmaUGpupMPOIqGCVZcXnmV2PlbXAgyL7s/revxeHhWwjLueyBVGIUrzQb1IoX9egk0c2Q9o
	UxbPJThQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1q6nQ7-004h2e-1M;
	Wed, 07 Jun 2023 07:17:27 +0000
Received: from madras.collabora.co.uk ([46.235.227.172])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1q6nQ4-004h0D-1h
	for linux-mediatek@lists.infradead.org;
	Wed, 07 Jun 2023 07:17:25 +0000
Received: from [IPV6:2001:b07:2ed:14ed:a962:cd4d:a84:1eab] (unknown [IPv6:2001:b07:2ed:14ed:a962:cd4d:a84:1eab])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits))
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id 1DE336606EB0;
	Wed,  7 Jun 2023 08:17:20 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1686122241;
	bh=D80LMK+36KFKk3hvSjD4i/C4Qajq5CzPucr2mCsl7Ms=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=Q8NXF4L43kBDu2vl4rwJfHwYJfa8ZKCyBCO6AGcZzx8dXBeiaQ6Ohl0hrJGBxYzDQ
	 CFRrqR0faSqpFZlhA+sGmVq0htN7ZZf/UFkheeGxYcAiMzQACuOZyZ1qm2N6VIBoed
	 +q6JoMdIWmmbS3yWaZ0KIF+Ubm9JHe6xRqBc7sNsq7Gllii8pAgfF8/iwsvxqFHVhQ
	 8u6Kgq3oIqGuPJ9pq5rPeXZ90uUYUZ+aDr1QNsXu4m3v/Asfr1hBRpP9OlyjnLQpoq
	 Af8aBDhWiY153oNSvAOCiTm0gbo4JePrOr/+r6MVMJdSd1ic6efukvF/drWc1w4DLv
	 Te0Lyh1vfBjMA==
Message-ID: <6138a97f-1b8b-f33f-8be5-e2141314dbd7@collabora.com>
Date: Wed, 7 Jun 2023 09:17:17 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.2
Subject: Re: [PATCH v12 1/1] serial: core: Start managing serial controllers
 to enable runtime PM
Content-Language: en-US
To: Chen-Yu Tsai <wenst@chromium.org>, Tony Lindgren <tony@atomide.com>
Cc: John Ogness <john.ogness@linutronix.de>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Jiri Slaby <jirislaby@kernel.org>,
 Andy Shevchenko <andriy.shevchenko@intel.com>, Dhruva Gole <d-gole@ti.com>,
 =?UTF-8?Q?Ilpo_J=c3=a4rvinen?= <ilpo.jarvinen@linux.intel.com>,
 Johan Hovold <johan@kernel.org>,
 Sebastian Andrzej Siewior <bigeasy@linutronix.de>,
 Vignesh Raghavendra <vigneshr@ti.com>, linux-omap@vger.kernel.org,
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
 linux-kernel@vger.kernel.org, linux-serial@vger.kernel.org,
 =?UTF-8?B?TsOtY29sYXMgRi4gUi4gQS4gUHJhZG8=?= <nfraprado@collabora.com>,
 linux-mediatek@lists.infradead.org
References: <20230602083335.GA181647@google.com>
 <87a5xii33r.fsf@jogness.linutronix.de> <20230603054139.GR14287@atomide.com>
 <20230603063533.GS14287@atomide.com> <20230605061511.GW14287@atomide.com>
 <CAGXv+5Fbx7eTxP0ep6DV+jyronAWxYvu2M-g=MjHGRhjSXUc=w@mail.gmail.com>
 <20230605122447.GY14287@atomide.com>
 <CAGXv+5HwL+R5QpO3pHGQd9qAxu2pCMDjYvdni1HjiC8eEE38mg@mail.gmail.com>
 <20230605131803.GA14287@atomide.com>
 <CAGXv+5GR9TEaNrj4B21H2iukS2kWW=rtoWkoVnWewVsrbcG0Hw@mail.gmail.com>
 <20230606122059.GC14287@atomide.com>
 <CAGXv+5ERwrFgpWBUBTkoawfyyTHU9w=Owiy-2BbCXHwEpZk1tA@mail.gmail.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
In-Reply-To: <CAGXv+5ERwrFgpWBUBTkoawfyyTHU9w=Owiy-2BbCXHwEpZk1tA@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230607_001724_695699_CD5C3C10 
X-CRM114-Status: GOOD (  14.01  )
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

Il 07/06/23 06:46, Chen-Yu Tsai ha scritto:
> On Tue, Jun 6, 2023 at 8:21 PM Tony Lindgren <tony@atomide.com> wrote:
>>
>> * Chen-Yu Tsai <wenst@chromium.org> [230606 09:17]:
>>> I ended up following 8250_dw's design, which seemed less convoluted.
>>> The original code was waaay too convoluted.
>>
>> OK that looks good to me thanks. Good to hear you got it sorted out.
>>
>> The 8250_dw style runtime PM is a good solution for simple cases. Where
>> it won't work are SoCs where runtime PM calls need to propagate up the
>> bus hierarchy. For example, 8250_omap needs runtime PM calls for the
>> interconnect and power domain to get register access working.
> 
> Good to know. On MediaTek platforms I don't think there are any power
> domains covering the basic peripherals. (Or it's hidden from the kernel.)
> 

On (relatively) new SoCs, basic peripherals are always powered, you're correct.

Cheers,
Angelo

>>> BTW, the Bluetooth breakage seems like a different problem.
>>
>> OK seems like we're good to go then :)
> 
> Yup. After a bit more testing, it seems the Bluetooth problem is more like
> an undervolt issue. If I have WiFi and BT probe at the same time, Bluetooth
> fails. If they probe separately, everything works fine.
> 
> ChenYu



