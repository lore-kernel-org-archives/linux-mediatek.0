Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 26604C27C6E
	for <linux-mediatek@archiver.kernel.org>; Fri, 14 Jun 2024 09:39:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=CnYCOeE6PniptcF7tA7N0tQfM5wEPUG2en8T2e4EWps=; b=sUFl7jF3JchbKB1IYkqsmJxQCC
	1VmhB9YIx/CkL7jyVKDS8J56IvoN/nesA1CHtOFLFJDbuwN4lTmXy0tZF7Olgdz5p0kVa837HPIl1
	xokVcZNTR2agyy0CUoSXMU59SKQykHWNtDu2RQSKmTzV+eB8MolUDq0HYlSmy/BUaE2MArfJKfqV1
	ANBePkOowOpDeKPy3l4iguvDzetzjplDjibfn/him9vG4h83D9/j93CIGrY9X2ZMP9l/y6/x1oDuP
	0paLk8Rkg3rMOwrFTteuGc3Q2/MUMMj65YewqTlljXeyTZ5Cx3YM72NqHSx2Dh6Yl1s5sdxmsSbZU
	LDE3kQdw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sI3PM-00000002DcZ-0TaS;
	Fri, 14 Jun 2024 09:39:44 +0000
Received: from madrid.collaboradmins.com ([46.235.227.194])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sI3PI-00000002Dbs-0hrN;
	Fri, 14 Jun 2024 09:39:42 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1718357977;
	bh=aHsuGDceh1SMMPY2DbZoInR++E/rZZ8+cC+vYKo1Eto=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=nHxVw/il4wiHGljkF3skTUS2640bGADQVrIwyi4YEwxJFl+T2L4BcEXEFhLO+V0oZ
	 WakDFMqZ/uvmbqQqYzMEi4TrJZyJ5I2r/Hp8M60jbcMxuZfVcyQcMsScvaQZeZXFV2
	 NHQtaqWmbvBvD8sewC3A04UiRa8t5mL+IDNKlhp5Di+R5sADY/tmHDeDCNbwH8h9Jh
	 7Ht+YUmNxiHqISJSo3EgYOsFiJs2bgpflBb7qVmuKqi7jERZ8Ftpe2ARMBJZi26ARH
	 GI5l/7xszBbuzJ50Fp4SjDB8/3O3UPFS77lkFuSLxeGkqy4ue9dSqdNcNqjHLkCW7q
	 3PsFqN8EfcsEA==
Received: from [100.113.186.2] (cola.collaboradmins.com [195.201.22.229])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by madrid.collaboradmins.com (Postfix) with ESMTPSA id 132C53782139;
	Fri, 14 Jun 2024 09:39:36 +0000 (UTC)
Message-ID: <b8026db3-6893-4609-8ead-b78f9b9eb40b@collabora.com>
Date: Fri, 14 Jun 2024 11:39:35 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 0/7] MediaTek DVFSRC Bus Bandwidth and Regulator knobs
To: Georgi Djakov <djakov@kernel.org>, broonie@kernel.org
Cc: robh@kernel.org, krzysztof.kozlowski+dt@linaro.org, conor+dt@kernel.org,
 matthias.bgg@gmail.com, lgirdwood@gmail.com, keescook@chromium.org,
 gustavoars@kernel.org, henryc.chen@mediatek.com, linux-pm@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org,
 kernel@collabora.com, wenst@chromium.org, amergnat@baylibre.com
References: <20240610085735.147134-1-angelogioacchino.delregno@collabora.com>
 <d5b593f6-1764-43f0-9697-78d586239c23@kernel.org>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Content-Language: en-US
In-Reply-To: <d5b593f6-1764-43f0-9697-78d586239c23@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240614_023940_530533_67F907FA 
X-CRM114-Status: GOOD (  14.32  )
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

Il 13/06/24 14:38, Georgi Djakov ha scritto:
> On 10.06.24 11:57, AngeloGioacchino Del Regno wrote:
>> Changes in v6:
>>   - Fixed build with clang (thanks Nathan!)
>>   - Removed unused mtk_rmw() macro in mtk-dvfsrc.c
>>   - Added MODULE_DESCRIPTION() to mtk-dvfsrc-regulator.c
>>
> [..]
>>
>> AngeloGioacchino Del Regno (7):
>>    dt-bindings: regulator: Add bindings for MediaTek DVFSRC Regulators
>>    dt-bindings: interconnect: Add MediaTek EMI Interconnect bindings
>>    dt-bindings: soc: mediatek: Add DVFSRC bindings for MT8183 and MT8195
>>    soc: mediatek: Add MediaTek DVFS Resource Collector (DVFSRC) driver
>>    regulator: Remove mtk-dvfsrc-regulator.c
>>    regulator: Add refactored mtk-dvfsrc-regulator driver
>>    interconnect: mediatek: Add MediaTek MT8183/8195 EMI Interconnect
>>      driver
> 
> Thanks Angelo! I have picked patches 2 and 7. Patch 2 is also available
> in my icc-mtk stable branch. Feel free to pull it to resolve the schema
> dependency for patch 3.
> 

Thank you Georgi!

I have to wait until Mark takes the regulator bindings and commits, then I will
be able to pick the soc bindings and driver. :-)

Cheers,
Angelo



> BR,
> Georgi
> 
>>
>>   .../interconnect/mediatek,mt8183-emi.yaml     |  51 ++
>>   .../mediatek,mt6873-dvfsrc-regulator.yaml     |  43 ++
>>   .../soc/mediatek/mediatek,mt8183-dvfsrc.yaml  |  83 +++
>>   drivers/interconnect/Kconfig                  |   1 +
>>   drivers/interconnect/Makefile                 |   1 +
>>   drivers/interconnect/mediatek/Kconfig         |  29 +
>>   drivers/interconnect/mediatek/Makefile        |   5 +
>>   drivers/interconnect/mediatek/icc-emi.c       | 153 +++++
>>   drivers/interconnect/mediatek/icc-emi.h       |  40 ++
>>   drivers/interconnect/mediatek/mt8183.c        | 143 +++++
>>   drivers/interconnect/mediatek/mt8195.c        | 339 +++++++++++
>>   drivers/regulator/mtk-dvfsrc-regulator.c      | 248 ++++----
>>   drivers/soc/mediatek/Kconfig                  |  11 +
>>   drivers/soc/mediatek/Makefile                 |   1 +
>>   drivers/soc/mediatek/mtk-dvfsrc.c             | 545 ++++++++++++++++++
>>   .../interconnect/mediatek,mt8183.h            |  23 +
>>   .../interconnect/mediatek,mt8195.h            |  44 ++
>>   include/linux/soc/mediatek/dvfsrc.h           |  36 ++
>>   include/linux/soc/mediatek/mtk_sip_svc.h      |   3 +
>>   19 files changed, 1666 insertions(+), 133 deletions(-)
>>   create mode 100644 
>> Documentation/devicetree/bindings/interconnect/mediatek,mt8183-emi.yaml
>>   create mode 100644 
>> Documentation/devicetree/bindings/regulator/mediatek,mt6873-dvfsrc-regulator.yaml
>>   create mode 100644 
>> Documentation/devicetree/bindings/soc/mediatek/mediatek,mt8183-dvfsrc.yaml
>>   create mode 100644 drivers/interconnect/mediatek/Kconfig
>>   create mode 100644 drivers/interconnect/mediatek/Makefile
>>   create mode 100644 drivers/interconnect/mediatek/icc-emi.c
>>   create mode 100644 drivers/interconnect/mediatek/icc-emi.h
>>   create mode 100644 drivers/interconnect/mediatek/mt8183.c
>>   create mode 100644 drivers/interconnect/mediatek/mt8195.c
>>   create mode 100644 drivers/soc/mediatek/mtk-dvfsrc.c
>>   create mode 100644 include/dt-bindings/interconnect/mediatek,mt8183.h
>>   create mode 100644 include/dt-bindings/interconnect/mediatek,mt8195.h
>>   create mode 100644 include/linux/soc/mediatek/dvfsrc.h
>>
> 




