Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 444E1C10F16
	for <linux-mediatek@archiver.kernel.org>; Mon,  6 May 2024 10:49:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=19TDxsJ2H96dLzJOLxOYu2eSjvvg3MDmzirIRT8ytBA=; b=aATgNuWG38Yb5/XDqS4Pu1/Va2
	KumcW7gUyolmxsw/yIU6Zo4CIPIyKXjHNlj8cQnYUPF95ahfPoLy7LYehyQA1RyOhQTzmlV38tFFm
	J+k8D58krLfDZx0PSLx7NJ6Wc0Xej5bj8DmxeCHmKV4LhxzgSxF8KZ5DQiBsZo9hpQ4223kFs1pWe
	laI/dTCXjgBbVIVU+jF/ESyihNXLD1nBkLtAd2IzSNoybRBccLZwhD7hJCh1UvBNThFyhqr2LA3ko
	ylqP/WdiBUcURgRM1bqL1tG+WUe63bNmAOYf9n2SD6UrdLzRT0OyZsu44cPWEkJQh5284mzF/Gz18
	tZeL9eQQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s3vuL-000000071DJ-2NUi;
	Mon, 06 May 2024 10:49:21 +0000
Received: from madrid.collaboradmins.com ([46.235.227.194])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s3vuH-000000071AN-3JCU;
	Mon, 06 May 2024 10:49:19 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1714992554;
	bh=U/kzEOQ26Mmpd4R1uZMPZjt4NRUfQiwR3IwxIqce6wU=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=VpYs5fbREURqcme7Xr78ZgTxa1uOFiGGJFgfpkypUbfRzsqB0NG60wqtWLz2zUVQv
	 FtDHq//NVsI3cEYx/O9beRilY7tnxZsyeBTV1SVpi/bhyjkrKb1TrOSw+tRpsDKbOv
	 QU2z9T1v2S95YZHCXr844IYYn/rd/C+RoKPu5He3beolspQH46vcNr5ZrFX8Rex1w7
	 SAJQX5JvoYqWK65hZKHIa4VQRb8B+FhDbDIXVl45UtOBD/NZvpEhMXuPf9QnN7rZtw
	 +FjM7b9ALWq0EAFcJecAn36Hxt584eUcad8d+0AFzDiejz1GUvonm78/dNL79WA/Ft
	 WA2BwAZVJZMeQ==
Received: from [100.113.186.2] (cola.collaboradmins.com [195.201.22.229])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by madrid.collaboradmins.com (Postfix) with ESMTPSA id 8C7E8378020D;
	Mon,  6 May 2024 10:49:13 +0000 (UTC)
Message-ID: <522a4bbb-af1b-418b-b00c-95657222160b@collabora.com>
Date: Mon, 6 May 2024 12:49:12 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 7/7] interconnect: mediatek: Add MediaTek MT8183/8195
 EMI Interconnect driver
To: Georgi Djakov <djakov@kernel.org>
Cc: robh@kernel.org, krzysztof.kozlowski+dt@linaro.org, conor+dt@kernel.org,
 matthias.bgg@gmail.com, lgirdwood@gmail.com, broonie@kernel.org,
 keescook@chromium.org, gustavoars@kernel.org, henryc.chen@mediatek.com,
 linux-pm@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org, kernel@collabora.com,
 wenst@chromium.org, amergnat@baylibre.com
References: <20240424095416.1105639-1-angelogioacchino.delregno@collabora.com>
 <20240424095416.1105639-8-angelogioacchino.delregno@collabora.com>
 <52335ded-43e7-4694-80bf-6ceee7d918d8@kernel.org>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Content-Language: en-US
In-Reply-To: <52335ded-43e7-4694-80bf-6ceee7d918d8@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240506_034918_056927_E92EA979 
X-CRM114-Status: GOOD (  14.82  )
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

Il 03/05/24 13:53, Georgi Djakov ha scritto:
> Hi Angelo,
> 
> On 24.04.24 12:54, AngeloGioacchino Del Regno wrote:
>> Add an interconnect driver for the External Memory Interface (EMI),
>> voting for bus bandwidth over the Dynamic Voltage and Frequency Scaling
>> Resource Collector (DVFSRC).
>>
>>               ICC provider         ICC Nodes
>>                                ----          ----
>>               ---------       |CPU |   |--- |VPU |
>>      -----   |         |-----  ----    |     ----
>>     |DRAM |--|DRAM     |       ----    |     ----
>>     |     |--|scheduler|----- |GPU |   |--- |DISP|
>>     |     |--|(EMI)    |       ----    |     ----
>>     |     |--|         |       -----   |     ----
>>      -----   |         |----- |MMSYS|--|--- |VDEC|
>>               ---------        -----   |     ----
>>                 /|\                    |     ----
>>                  |change DRAM freq     |--- |VENC|
>>               ----------               |     ----
>>              |  DVFSR   |              |
>>              |          |              |     ----
>>               ----------               |--- |IMG |
>>                                        |     ----
>>                                        |     ----
>>                                        |--- |CAM |
>>                                              ----
>>
>> Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
> 
> Thank you for working on this! It looks good to me.
> Do we have a plan how to merge all this?
> 

Nothing (regulator, nor interconnect)  will ever get enabled by Kconfig unless
the drivers/soc/mediatek patches are picked (or COMPILE_TEST!).... so I guess
we can just pick per-subsystem and call it a day :-)

As for the bindings, patch [3/7] *depends on* [1/7] and [2/7], but there is no
reverse dependency (so 1-2 can be picked, no warnings).

Otherwise I can pick all bindings, or.... whatever is easier for you :-)

Cheers,
Angelo

> Thanks,
> Georgi
> 
>> ---
>>   drivers/interconnect/Kconfig            |   1 +
>>   drivers/interconnect/Makefile           |   1 +
>>   drivers/interconnect/mediatek/Kconfig   |  29 ++
>>   drivers/interconnect/mediatek/Makefile  |   5 +
>>   drivers/interconnect/mediatek/icc-emi.c | 153 +++++++++++
>>   drivers/interconnect/mediatek/icc-emi.h |  40 +++
>>   drivers/interconnect/mediatek/mt8183.c  | 143 ++++++++++
>>   drivers/interconnect/mediatek/mt8195.c  | 339 ++++++++++++++++++++++++
>>   8 files changed, 711 insertions(+)
>>   create mode 100644 drivers/interconnect/mediatek/Kconfig
>>   create mode 100644 drivers/interconnect/mediatek/Makefile
>>   create mode 100644 drivers/interconnect/mediatek/icc-emi.c
>>   create mode 100644 drivers/interconnect/mediatek/icc-emi.h
>>   create mode 100644 drivers/interconnect/mediatek/mt8183.c
>>   create mode 100644 drivers/interconnect/mediatek/mt8195.c
> 



