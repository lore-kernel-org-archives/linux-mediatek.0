Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3843FCD5BD0
	for <linux-mediatek@archiver.kernel.org>; Wed, 27 May 2026 17:05:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=8S3OkwC+qKI+yIddqXjqOelntUQdzQNfeovup2Cv5Y8=; b=layt1+itklCAK0kyx50Ylc1SnL
	Iv49DJXuPrNxIcr6h4KTijluNCwcy2Qup6CsCrKsBeEy/3rBfpiHJdXO6jQLm9TbqkXCkv8NFrZje
	auC54530UpVdacwavNM7ARCQX2WpAvNW8RoGpLWIXStUwaV2xLCN5vW0lfzN4LWWInH4SnRfmk2S2
	kwcC40Gf3TpsB04/lYb0WGeF7yAZGm2P3fZBO0LVwgoV27/WfRAeYYqgMAslOWdqM38/cIRB1hU4f
	XeszMypcTPmH2zOZ7+/MOP5DMpguNFzdPzftKFqj/4z4jzFzGVqT3r43LRTxlcM57kMBqoIayKhzC
	IyIZIvmg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wSHgz-00000004YvN-35jG;
	Wed, 27 May 2026 17:05:17 +0000
Received: from mailgate02.uberspace.is ([2a00:d0c0:200:0:1c7b:a6ff:fee0:8ea4])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wSHgw-00000004Ytt-3NPL
	for linux-mediatek@lists.infradead.org;
	Wed, 27 May 2026 17:05:16 +0000
Received: from perseus.uberspace.de (perseus.uberspace.de [95.143.172.134])
	by mailgate02.uberspace.is (Postfix) with ESMTPS id 9AD2418014B
	for <linux-mediatek@lists.infradead.org>; Wed, 27 May 2026 19:05:03 +0200 (CEST)
Received: (qmail 28769 invoked by uid 988); 27 May 2026 17:05:03 -0000
Authentication-Results: perseus.uberspace.de;
	auth=pass (plain)
Received: from unknown (HELO unknown) (::1)
	by perseus.uberspace.de (Haraka/3.1.1) with ESMTPSA; Wed, 27 May 2026 19:05:02 +0200
Message-ID: <370e76e3-1d41-469b-8e50-8ace6b5622d2@david-bauer.net>
Date: Wed, 27 May 2026 19:05:00 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH mt76] wifi: mt76: mt7915: configure noise floor reporting
 on reset
To: Felix Fietkau <nbd@nbd.name>, Lorenzo Bianconi <lorenzo@kernel.org>,
 Ryder Lee <ryder.lee@mediatek.com>, Shayne Chen <shayne.chen@mediatek.com>,
 Sean Wang <sean.wang@mediatek.com>, Matthias Brugger
 <matthias.bgg@gmail.com>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: linux-wireless@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org
References: <20260516144944.2574053-1-mail@david-bauer.net>
 <a83c9aca-da9e-4a5e-a364-382910388a68@nbd.name>
Content-Language: en-US
From: David Bauer <mail@david-bauer.net>
Autocrypt: addr=mail@david-bauer.net; keydata=
 xjMEZgynMBYJKwYBBAHaRw8BAQdA+32xE63/l6uaRAU+fPDToCtlZtYJhzI/dt3I6VxixXnN
 IkRhdmlkIEJhdWVyIDxtYWlsQGRhdmlkLWJhdWVyLm5ldD7CjwQTFggANxYhBLPGu7DmE/84
 Uyu0uW0x5c9UngunBQJmDKcwBQkFo5qAAhsDBAsJCAcFFQgJCgsFFgIDAQAACgkQbTHlz1Se
 C6eKAwEA8B6TGkUMw8X7Kv3JdBIoDqJG9+fZuuwlmFsRrdyDyHkBAPtLydDdancCVWNucImJ
 GSk+M80qzgemqIBjFXW0CZYPzjgEZgynMBIKKwYBBAGXVQEFAQEHQPIm0qo7519c7VUOTAUD
 4OR6mZJXFJDJBprBfnXZUlY4AwEIB8J+BBgWCAAmFiEEs8a7sOYT/zhTK7S5bTHlz1SeC6cF
 AmYMpzAFCQWjmoACGwwACgkQbTHlz1SeC6fP2AD8CduoErEo6JePUdZXwZ1e58+lAeXOLLvC
 2kj1OiLjqK4BANoZuHf/ku8ARYjUdIEgfgOzMX/OdYvn0HiaoEfMg7oB
In-Reply-To: <a83c9aca-da9e-4a5e-a364-382910388a68@nbd.name>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Rspamd-Bar: /
X-Rspamd-Report: SUSPICIOUS_RECIPS(1.5) BAYES_HAM(-2.227727) XM_UA_NO_VERSION(0.01) MIME_GOOD(-0.1)
X-Rspamd-Score: -0.817727
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
	d=david-bauer.net; s=uberspace;
	h=from:to:cc:subject:date;
	bh=AHwrOyMcjOU+TKZ/ei9ohjaLiam4EHbLaLXCi9V69LQ=;
	b=qcIFRMu42+I0Ni21+8xZaHHyCeHpIE4Cf8Fq5BOPMT269ZD3lmB/68KUY92pSII+pL/ntO/NyQ
	Ae/mxFx+6nnOFcBydRVvDfKlH4vyEQeToFhY5Xbujjp+Ww+50DyB30XSEIbwyE9b/ehtnsSuBSNN
	dozEZ75VrWANephLvAODrR0qasgpf+r1m+TIthC3S2pmxGDNjv36VPbTLuVMn3sxGvJrNvS1Q7Vi
	3CgmEcFbwgJjr/OR/sxmtEiHBraMLiOKy0XNB9N06YglHqpd3W+1lCzY6jxVrVJpa3WJ6A4T19kA
	IbygySrlpJ+/K0HgZSqjQ3RuA75HhQaJpuzZdvS88TS5WmqKl4AVzgzJCdw+BEf3nKp5KCV/lP5/
	PrX9wx6ijo+CT6XU7PjL4MM0kaBRBYkVrm7zN0G5tL7AdNQf9UD60hGXq7JUgXNcTEsyy5o7hW1b
	2U4bKIVCIhxaEuY6MJ00bFOsJykWYDHM+GPEukmPxNENVzAd0ibJ8aNh65YY4JA17Ifpq7kgBU83
	dLfwWDJtS6+EkikEvgQPkd7WGTYf8hcN1BJtZ1Iz4ddov0rUmVv/qEb3VZRvKfVCY5yjtA6mjZOv
	bZFMbVX+976dLOMsmHPuhTrMP5TLBMRDucr19hmJaXt8WhTMIp7ALFXsl1KzrxEhIDfIV2SNqavl
	U=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260527_100515_283723_7D8A7092 
X-CRM114-Status: GOOD (  10.22  )
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

Hi Felix,

On 5/27/26 15:56, Felix Fietkau wrote:
> On 16.05.26 16:49, David Bauer wrote:
>> When performing a full system recovery of the MCU on a dual-phy
>> platform, band 0 (usually 2.4GHz) stops reading correct noise floor
>> data.
>>
>> This is due to noise floor reporting only being configured correctly
>> for the second device PHY.
>>
>> Configure the respective registers correctly after restarting the MCU
>> firmware to fix reported noise-floor values.
>>
>> Signed-off-by: David Bauer <mail@david-bauer.net>
> Have you considered clearing MT76_STATE_RUNNING in mt7915_mac_restart instead?

The call to mt7915_run is guarded by MT76_STATE_RUNNING being set per-phy.

I think this is to not start the second PHY in case it was never started due to
it not being present. We could in theory remove this check for the primary PHY
and clear the flag prior calling mt7915_run.

This seems a bit more hacky to me. Alternatively I can also refactor the entire
mechanism to make it easier to understand and resolve this indirection in the
process.

What do you think?

Best
David

> 
> - Felix


