Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 62EDFC77B6F
	for <linux-mediatek@archiver.kernel.org>; Thu, 13 Apr 2023 09:29:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=D3U2hfqICh/t0rTR8QFky9kB6NZAGED0nHUzfdyq10E=; b=Y5QAT3nw4e+oGdxJHhaQt/vcMs
	LM5NhNzL4GFURtuJ4cLBGT3jaIAVuXUJ0G17vCl8h2sUdpg/OWNaVBY3iNMoWcHHQ8KkrV5hEQbIb
	U02XGNF8IURbs4vDEo/jbPpgxzVG6IdHpvDe0//MfEn6To9heL+Rklm1fk334/7xAYkJnv6Zrbdm1
	oewaiQcZtPltNjSu8hL3hrJGu4F56W+rtaJiHPgUzUptYFzfW+/uxSnGc/NPQ9l2IpTnZQP3kcTxX
	I0VxYei5sl5F0sfN+1Nm7XFKIXM7kij76tZcEybR3y+dkVNef/a1UiKhev6+1ikRNThLUcaWy4LN+
	UkGJJLLw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pmtGJ-005cxT-0H;
	Thu, 13 Apr 2023 09:29:03 +0000
Received: from madras.collabora.co.uk ([2a00:1098:0:82:1000:25:2eeb:e5ab])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pmtGB-005csn-0b;
	Thu, 13 Apr 2023 09:28:56 +0000
Received: from [192.168.1.100] (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits))
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id 461686603207;
	Thu, 13 Apr 2023 10:28:52 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1681378133;
	bh=XjK0zXGcRUwWwMF6tZnTtwrjb64IJRzNjt7p/8KBhjs=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=d6UgCefhED/N6R8YjSiNAxuQU77pHTuH671k0sortzz+h8HWsWRqZ+jYQSW7fvRuT
	 eyERdIo/mVGeDewj1B8XzdivfyeIBoj4BbuwUO+g6g4nueknODvGQJMPlI4yxePiu7
	 NuOwzs1nxxvQLZoT6Gz6QqlumXZ/LPPtoRalL/PNZBRzWi21FDr1ERMSzf5/YdQ0ao
	 SuCRTmMDLW4w6pVFA5oYs7uzGfTMJDl8OlQ+a74HPRNcFs/xWKKxq7XUUUEEK9E3RM
	 B6DPGx+OyIBsldxVd+4s/2jbWuEmIGhyaXfSXOHhbMSK51XO+1b02CwJ3aQWBP1d/D
	 z/bAWlEu4eshg==
Message-ID: <4a016428-be44-27e3-5bc2-dc517922fa15@collabora.com>
Date: Thu, 13 Apr 2023 11:28:49 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.1
Subject: Re: [PATCH 01/27] dt-bindings: pwm: Add compatible for MediaTek
 MT6795
Content-Language: en-US
To: Matthias Brugger <matthias.bgg@gmail.com>, Rob Herring <robh@kernel.org>
Cc: p.zabel@pengutronix.de, linux-pwm@vger.kernel.org, kernel@collabora.com,
 chunkuang.hu@kernel.org, linux-phy@lists.infradead.org, ck.hu@mediatek.com,
 jitao.shi@mediatek.com, houlong.wei@mediatek.com,
 linux-kernel@vger.kernel.org, phone-devel@vger.kernel.org, vkoul@kernel.org,
 chunfeng.yun@mediatek.com, daniel@ffwll.ch, robh+dt@kernel.org,
 linux-mediatek@lists.infradead.org, xinlei.lee@mediatek.com,
 airlied@gmail.com, u.kleine-koenig@pengutronix.de,
 linux-arm-kernel@lists.infradead.org, krzysztof.kozlowski+dt@linaro.org,
 kishon@kernel.org, ~postmarketos/upstreaming@lists.sr.ht,
 thierry.reding@gmail.com, devicetree@vger.kernel.org,
 dri-devel@lists.freedesktop.org, jassisinghbrar@gmail.com
References: <20230412112739.160376-1-angelogioacchino.delregno@collabora.com>
 <20230412112739.160376-2-angelogioacchino.delregno@collabora.com>
 <168133318912.3190428.16120880490622098945.robh@kernel.org>
 <5c0bc1f2-5917-ab84-8b0b-f2adc48f8be7@gmail.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
In-Reply-To: <5c0bc1f2-5917-ab84-8b0b-f2adc48f8be7@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230413_022855_367986_AC42F1E8 
X-CRM114-Status: GOOD (  13.66  )
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

Il 13/04/23 10:52, Matthias Brugger ha scritto:
> 
> 
> On 12/04/2023 23:03, Rob Herring wrote:
>>
>> On Wed, 12 Apr 2023 13:27:13 +0200, AngeloGioacchino Del Regno wrote:
>>> Add a compatible string for MediaTek Helio X10 MT6795's display PWM
>>> block: this is the same as MT8173.
>>>
>>> Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
>>> ---
>>>   Documentation/devicetree/bindings/pwm/mediatek,pwm-disp.yaml | 4 +++-
>>>   1 file changed, 3 insertions(+), 1 deletion(-)
>>>
>>
>> Running 'make dtbs_check' with the schema in this patch gives the
>> following warnings. Consider if they are expected or the schema is
>> incorrect. These may not be new warnings.
>>
> 
> These are not new warnings. I think we should address them in a different patch. In 
> my opinion it shouldn't block this patch. In the end it only add as compatible here.
> 

I agree. These warnings should not block this patch, as they're totally unrelated
to it.

Regards,
Angelo


