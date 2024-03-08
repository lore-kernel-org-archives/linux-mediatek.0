Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0AA67C5475B
	for <linux-mediatek@archiver.kernel.org>; Fri,  8 Mar 2024 08:38:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=q9+qPHkMLozkGbSHmqvMLLk98n1LQLLDqZWufi8WqE8=; b=i6WDO9FQPNMELAl7eLN5g1IT7p
	Dnq32R/mSAdsl4ovDxICtw4a57u3wU1aFp0WKQ3cI/V7nP63aPwNLcANqlPXbOQrtR8iVPGWbbC/+
	tFiFQU2WV+pMSf+zQB3auBdOZp4B52JIXujIuN2Q4XB02uMkQwbrT0JhqbQHDmft4WxSQeXCqv/Wy
	Uiq/qcssfdxRz+PebUoKt2crnYb+75kJTush1OsyuL7sjUn/NepoFAATieXEEzWLeRyb7v+dYDlnu
	6DhE+vZAMa7m3cmDekgGPbtPUk0eN5d04ZL6198BOIb7gtuKl6eJldFkHexBZiMDOO3NhEEQhJrdG
	lrdTqTMw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1riVkA-00000008M0P-2Ic4;
	Fri, 08 Mar 2024 08:38:18 +0000
Received: from madrid.collaboradmins.com ([2a00:1098:ed:100::25])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1riVk7-00000008LyB-0gCh;
	Fri, 08 Mar 2024 08:38:16 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1709887092;
	bh=x/iJ/njqsFro++xvJFXW2s3sHRF1jcLiv3ix3nVesq8=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=v9NtW7BedkJvfuiL7yLJL7SveyiayjRZzA62fg0l/uLog+i05oBxPbaIDGmI9/IoQ
	 2Ti8emiQYx98Q2cY5JQ1zkE6IuklbIpDSQL0rWTNta/a90cBsPHbDX72AC1/KH8zvj
	 /ccP/Q5HX53OdIUBw95nwy60kIBeK5nPLHwOgTMkwbOohkmapQ1FlIcjabl57rhUcF
	 VSDoz8kkZGFLRDLadN2rRWOVCFsas3F3q0VGeFL7ITlr5a7gZHMezCaqs/BbZF1MWZ
	 7RupJ3NQaV7ZFSPnP38iF+niUSlhW1Y4RPqKMqPx6R5nNCeeHTTyYAY6qBFVa3xFzV
	 FXjDwzVhAB+3w==
Received: from [100.113.186.2] (cola.collaboradmins.com [195.201.22.229])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by madrid.collaboradmins.com (Postfix) with ESMTPSA id 6903337813CA;
	Fri,  8 Mar 2024 08:38:11 +0000 (UTC)
Message-ID: <89d6a820-d510-4549-8097-76670fa36e6a@collabora.com>
Date: Fri, 8 Mar 2024 09:38:10 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/2] dt-bindings: timer: mediatek: Convert to json-schema
Content-Language: en-US
To: Rob Herring <robh+dt@kernel.org>
Cc: daniel.lezcano@linaro.org, tglx@linutronix.de,
 krzysztof.kozlowski+dt@linaro.org, matthias.bgg@gmail.com,
 linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org
References: <20220929122901.614315-1-angelogioacchino.delregno@collabora.com>
 <20220929122901.614315-3-angelogioacchino.delregno@collabora.com>
 <CAL_JsqKrad8JndQhxHAYjFXPkj7eaJ0GXqkSJy=xrfa=EHvOwA@mail.gmail.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
In-Reply-To: <CAL_JsqKrad8JndQhxHAYjFXPkj7eaJ0GXqkSJy=xrfa=EHvOwA@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240308_003815_360952_6C7A0539 
X-CRM114-Status: GOOD (  13.11  )
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

Il 07/03/24 19:15, Rob Herring ha scritto:
> On Thu, Sep 29, 2022 at 7:29 AM AngeloGioacchino Del Regno
> <angelogioacchino.delregno@collabora.com> wrote:
>>
>> Convert the MediaTek SoC timer txt binding to json-schema.
>>
>> Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
>> ---
>>   .../bindings/timer/mediatek,mtk-timer.txt     | 47 ----------
>>   .../bindings/timer/mediatek,timer.yaml        | 86 +++++++++++++++++++
>>   2 files changed, 86 insertions(+), 47 deletions(-)
>>   delete mode 100644 Documentation/devicetree/bindings/timer/mediatek,mtk-timer.txt
>>   create mode 100644 Documentation/devicetree/bindings/timer/mediatek,timer.yaml
> 
> Looks like this never got applied. I've applied it now and added 8365
> which got added to the .txt binding in the mean time. I'm not sure
> it's right though. The txt binding says it was CPUX timer, but the dts
> says otherwise. The 6795 dts looks wrong. It says the timer is CPUX
> and GPT timer. That warning remains.
> 

Thanks. This one got totally forgotten, yes.

By the way, I'll recheck the 6795 DT as soon as possible.

Cheers!
Angelo


