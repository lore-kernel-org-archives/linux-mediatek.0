Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AA6F0C38A2D
	for <linux-mediatek@archiver.kernel.org>; Tue, 25 Oct 2022 10:19:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=VQczvz+g3URTXPLukX1U3rCOQSu42hoB10XM7APyb7Q=; b=s5bPlq5kBU3e8HdvLDNuke9crq
	TtHRKwIe2CmusU9cb2HGNW5TlU2+/gZ2Y2lRoaNkKIh58/ywNr8xh9A8nkpL5FBoeuSb7JnbSLsO3
	rkGpR6xHZfKOI7it1/esFuEFk17/jSUQ+gY3XNYbxovo/IhRZ05rTiOtRn2/MsIRvfcFhMhCKbpNC
	V3yYSRlQFx6Y5jKgQM0ucIhjtf3+QAgaO5+nfcr5ynEbOVWLknRKpGi7Hxf4IhYNv/2JL0oLRIN78
	9EathBjpjpQWEE69DrPs+jlvuM4C/0KiWXHfvo5tkaRRmHjzS1tFyVumm7gFi8AC79Yc5F2dWVwUB
	9yD5ol+Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1onH2B-004jcZ-Sj; Tue, 25 Oct 2022 10:19:47 +0000
Received: from madras.collabora.co.uk ([2a00:1098:0:82:1000:25:2eeb:e5ab])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1onH1F-004j9K-2t; Tue, 25 Oct 2022 10:18:50 +0000
Received: from [192.168.1.100] (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits))
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id 38415660239C;
	Tue, 25 Oct 2022 11:18:45 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1666693125;
	bh=oPF1o7oWPbryY18wvQiyqLyaSGkoOyYT6E+3DLkyLxs=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=aNxRpUtzvLMgc0F9bQ4w3Pla8RcdaRHv8Cryqkg+evUgzf2jE9kuUy6pcnO1hkucl
	 Jxs+diruWGkYOA5oU2Ydei2qtQTk2zOPW8nOwQ9P6wgrPpb1tnG0ghdJUGwuzOoFA4
	 +OuqXMVALz5ew3SouzOGDkE75nmFAkIzvs5/N7157pve+pFQ72TchQWZvqYE0G2ywj
	 XP9Ek3H4XfIEHoEw6kSfPSsCX0Im0z7EL2shxzG0l9lTgD2le5qep7g43dQBdxqEse
	 4kvlwIAGfvJBU13l1Y3aXlo/y8+BThw2hlbrBHzTRyfMALtthobTNh9w44it19NZhX
	 bYp2HlOWhlALQ==
Message-ID: <473d67ed-198f-82c6-9f32-5827c1f8c852@collabora.com>
Date: Tue, 25 Oct 2022 12:18:43 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.3.3
Subject: Re: [PATCH v2 03/12] ASoC: mediatek: mt8188: support audsys clock
Content-Language: en-US
To: =?UTF-8?B?VHJldm9yIFd1ICjlkLPmlofoia8p?= <Trevor.Wu@mediatek.com>,
 "robh+dt@kernel.org" <robh+dt@kernel.org>,
 "matthias.bgg@gmail.com" <matthias.bgg@gmail.com>,
 "p.zabel@pengutronix.de" <p.zabel@pengutronix.de>,
 "broonie@kernel.org" <broonie@kernel.org>, "tiwai@suse.com" <tiwai@suse.com>
Cc: "linux-arm-kernel@lists.infradead.org"
 <linux-arm-kernel@lists.infradead.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "linux-mediatek@lists.infradead.org" <linux-mediatek@lists.infradead.org>,
 "alsa-devel@alsa-project.org" <alsa-devel@alsa-project.org>,
 Project_Global_Chrome_Upstream_Group
 <Project_Global_Chrome_Upstream_Group@mediatek.com>,
 "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>
References: <20221021082719.18325-1-trevor.wu@mediatek.com>
 <20221021082719.18325-4-trevor.wu@mediatek.com>
 <de66f0e3-7694-7315-c896-9211259a1a17@collabora.com>
 <776557c0fda5a538549ee0d4f4b7f482b0d69934.camel@mediatek.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
In-Reply-To: <776557c0fda5a538549ee0d4f4b7f482b0d69934.camel@mediatek.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221025_031849_419089_37DCF31E 
X-CRM114-Status: GOOD (  21.77  )
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

Il 21/10/22 11:58, Trevor Wu (吳文良) ha scritto:
> On Fri, 2022-10-21 at 10:41 +0200, AngeloGioacchino Del Regno wrote:
>> Il 21/10/22 10:27, Trevor Wu ha scritto:
>>> Add mt8188 audio cg clock control. Audio clock gates are registered
>>> to CCF
>>> for reference count and clock parent management.
>>>
>>> Signed-off-by: Trevor Wu <trevor.wu@mediatek.com>
>>> ---
>>>    sound/soc/mediatek/mt8188/mt8188-audsys-clk.c | 206
>>> ++++++++++++++++++
>>>    sound/soc/mediatek/mt8188/mt8188-audsys-clk.h |  15 ++
>>>    .../soc/mediatek/mt8188/mt8188-audsys-clkid.h |  83 +++++++
>>>    3 files changed, 304 insertions(+)
>>>    create mode 100644 sound/soc/mediatek/mt8188/mt8188-audsys-clk.c
>>>    create mode 100644 sound/soc/mediatek/mt8188/mt8188-audsys-clk.h
>>>    create mode 100644 sound/soc/mediatek/mt8188/mt8188-audsys-
>>> clkid.h
>>>
>>> diff --git a/sound/soc/mediatek/mt8188/mt8188-audsys-clk.c
>>> b/sound/soc/mediatek/mt8188/mt8188-audsys-clk.c
>>> new file mode 100644
>>> index 000000000000..1f294231d4c2
>>> --- /dev/null
>>> +++ b/sound/soc/mediatek/mt8188/mt8188-audsys-clk.c
>>> @@ -0,0 +1,206 @@
>>> +// SPDX-License-Identifier: GPL-2.0
>>> +/*
>>> + * mt8188-audsys-clk.c  --  MediaTek 8188 audsys clock control
>>> + *
>>> + * Copyright (c) 2022 MediaTek Inc.
>>> + * Author: Chun-Chia Chiu <chun-chia.chiu@mediatek.com>
>>> + */
>>> +
>>> +#include <linux/clk.h>
>>> +#include <linux/clk-provider.h>
>>> +#include <linux/clkdev.h>
>>> +#include "mt8188-afe-common.h"
>>> +#include "mt8188-audsys-clk.h"
>>> +#include "mt8188-audsys-clkid.h"
>>> +#include "mt8188-reg.h"
>>> +
>>> +struct afe_gate {
>>> +	int id;
>>> +	const char *name;
>>> +	const char *parent_name;
>>> +	int reg;
>>> +	u8 bit;
>>> +	const struct clk_ops *ops;
>>> +	unsigned long flags;
>>> +	u8 cg_flags;
>>> +};
>>> +
>>> +#define GATE_AFE_FLAGS(_id, _name, _parent, _reg, _bit, _flags,
>>> _cgflags) {\
>>> +		.id = _id,					\
>>> +		.name = _name,					\
>>> +		.parent_name = _parent,				\
>>> +		.reg = _reg,					\
>>> +		.bit = _bit,					\
>>> +		.flags = _flags,				\
>>> +		.cg_flags = _cgflags,				\
>>> +	}
>>> +
>>> +#define GATE_AFE(_id, _name, _parent, _reg, _bit)		\
>>> +	GATE_AFE_FLAGS(_id, _name, _parent, _reg, _bit,		\
>>> +		       CLK_SET_RATE_PARENT | CLK_IGNORE_UNUSED,
>>> CLK_GATE_SET_TO_DISABLE)
>>
>> Can you please explain what's the reason for CLK_IGNORE_UNUSED here?
>> Maybe we can solve some issue that you're facing in a cleaner way.
>>
>> Regards,
>> Angelo
> 
> Hi Angelo,
> 
> Because clk_disable_unused() calls clk_core_is_enabled(), register
> access happens in is_enabled() ops.
> At the moment, the power for register access is not enabled, so the
> register read results in CPU hang.
> 
> That's why I added CLK_IGNORE_UNUSED here, but it can't resolve all
> issues. Actually, we met same problem when "cat
> /sys/kernel/debug/clk/clk_summary" is used. We are still suffering the
> problem.
> 
> I'm not sure if I can implement clk ops by myself, and exclude the
> registration of is_enabled() ops.
> 

Is the power for register access enabled with a power domain?

Check drivers/clk/clk.c, grep for core->rpm_enabled.

If you enable runtime PM before registering the clocks, and you register them
with the right struct device, the clock API will enable power for you before
trying to read the clock enable status.

Regards,
Angelo


