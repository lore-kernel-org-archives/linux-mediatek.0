Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 803E4C46CCD
	for <linux-mediatek@archiver.kernel.org>; Thu, 21 Dec 2023 12:31:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=buD83/qETqFbGIs1429qoqdrMqjGZKhMQlvCFS5OiqA=; b=hd8FaLNyA2t5Qr+4+yNKrmrN7p
	FswG6K80ose4+26Jhp01NWqFzPVML2zqF1RfEUQc3aRQwMvuKe6k96O+ejbsXCMR08IXSMnGjVPy2
	Z39GNKf1UsdjIZkx1oj85MkiGrZahQVhPcJgsZVa8V1ghyDPe5/SCh7SyCWKUoTzDo2khmaZUK7gS
	wAerl0MiztsHKSsEHGLc23nIuLjqg92i+fRmzgCiznYOMe2JV58I/iubmuVpOdioyJjWxMXX6zlTi
	7nq3jLN3dmskuZCjPCVKtUjmcnRhjubU0E4szTAsk17Mc4+7WFuWpZ6ry2qN4HWuuxDCgKsykCOZm
	D8OUUqCw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rGIDD-002mRp-1C;
	Thu, 21 Dec 2023 12:31:39 +0000
Received: from madrid.collaboradmins.com ([46.235.227.194])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rGID9-002mPF-2j;
	Thu, 21 Dec 2023 12:31:37 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1703161893;
	bh=fTnA2jwL1Z5vwL2hbJmD6Lrtk57PUUHeFhqO6KtWNek=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=nXQHSBcA4QuuwDPN1RMBuldncYvS2Pc0lW4WotGVysc8deC49O2IouEKdCZu0/Bt4
	 qk7I+3T1F2i9TdnRUy8fHC8X52p8dFExWnIPYodTmgLwQszmynU0Aet5/3QRm1Y4fB
	 z9icmXD5z693LymQcMrgRPonVgFswQ4ed0OXcsg5P2lZ72rRFxjiJ/cRtbLxLfTswL
	 +7BAb1yL+89yhOm7tUUiCVxgDllKTXiqrMxMzViFrHCMnVFj/chTuWNShlsEmlSwD0
	 kK6mG9NftTeJkj75I4Ttdq7Pr87hHAR7DT4eJlhBhJ1cdRV0q6wfi6yCEXEJu9phQ/
	 6vzlNCpj5n9hA==
Received: from [100.113.186.2] (cola.collaboradmins.com [195.201.22.229])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by madrid.collaboradmins.com (Postfix) with ESMTPSA id 92A0E3781485;
	Thu, 21 Dec 2023 12:31:32 +0000 (UTC)
Message-ID: <e80dbd42-b9c8-4564-be4e-6ee449d24c70@collabora.com>
Date: Thu, 21 Dec 2023 13:31:31 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: Discuss Mediatek Power Domain Driver Support Mulitle Smi Clamp
 Protection
Content-Language: en-US
To: =?UTF-8?B?WXUtY2hhbmcgTGVlICjmnY7nprnnkosp?= <Yu-chang.Lee@mediatek.com>,
 "matthias.bgg@gmail.com" <matthias.bgg@gmail.com>,
 "msp@baylibre.com" <msp@baylibre.com>
Cc: "fparent@baylibre.com" <fparent@baylibre.com>,
 =?UTF-8?B?Q2hyaXMtcWogQ2hlbiAo6Zmz5aWH6YCyKQ==?=
 <Chris-qj.Chen@mediatek.com>, =?UTF-8?B?QmVuIExvayAo6Zm45b+X5oGGKQ==?=
 <ben.lok@mediatek.com>, =?UTF-8?B?TG91aXMgWXUgKOa4uOaUv+mMlSk=?=
 <louis.yu@mediatek.com>, =?UTF-8?B?QmVhciBXYW5nICjokKnljp/mg5/lvrcp?=
 <bear.wang@mediatek.com>,
 "linux-mediatek@lists.infradead.org" <linux-mediatek@lists.infradead.org>,
 =?UTF-8?B?TWFuZHlKSCBMaXUgKOWKieS6uuWDlik=?= <MandyJH.Liu@mediatek.com>,
 "amergnat@baylibre.com" <amergnat@baylibre.com>,
 "afgros@baylibre.com" <afgros@baylibre.com>,
 =?UTF-8?B?WGl1ZmVuZyBMaSAo5p2O56eA5bOwKQ==?= <Xiufeng.Li@mediatek.com>,
 "linux-arm-kernel@lists.infradead.org"
 <linux-arm-kernel@lists.infradead.org>, =?UTF-8?B?RmFuIENoZW4gKOmZs+WHoSk=?=
 <fan.chen@mediatek.com>, "abailon@baylibre.com" <abailon@baylibre.com>
References: <a3aaf3180fdb3da117132089bd160ba4d5cebc17.camel@mediatek.com>
 <b4fa9b7f-512f-4a34-884a-a99a3b035d34@collabora.com>
 <f8150ce2859bc8d22d2fa7cbc671bf2d43d4a86d.camel@mediatek.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
In-Reply-To: <f8150ce2859bc8d22d2fa7cbc671bf2d43d4a86d.camel@mediatek.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231221_043136_054343_C78856B2 
X-CRM114-Status: GOOD (  31.20  )
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

Il 21/12/23 09:29, Yu-chang Lee (李禹璋) ha scritto:
> On Wed, 2023-12-20 at 14:11 +0100, AngeloGioacchino Del Regno wrote:
>> Il 20/12/23 10:36, Yu-chang Lee (李禹璋) ha scritto:
>>> Dear Markus, Matthias, Angelo:
>>>
>>> I am writing to seek your expertise and advice regarding the
>>> revision
>>> of the Mediatek power domain driver for the MT8188 platform.
>>> Specifically, the display power domain requires multiple SMI clamp
>>> protections (refer to [1] in mt8188.dts "MT8188_POWER_DOMAIN_DIP"
>>> "mediatek,smi"). However, the current version on the main branch,
>>> which
>>> has already merged SMI and infra bus protection (mainly [2]),
>>> complicates the mapping of individual SMIs to their respective bus
>>> protections.
>>>
>>> While not a complete solution, I believe the patch in [3] may
>>> better
>>> illustrate my intentions.
>>>
>>> Markus has provided some thoughts and recommendations that I want
>>> to
>>> bring forward, hoping to gain further direction based on your
>>> expertise.
>>>
>>> 1.My initial thought is to revert the changes made in [2], which
>>> separated the SMI infra bus protection operations. This approach
>>> would
>>> simplify the mapping of multiple SMIs to bus protections by their
>>> order
>>> in the DTS. However, reverting to an older version may not be
>>> desired.
>>>
>>
>> Relying on the order of bus protections in DTS can be flaky and prone
>> to generate
>> future mistakes; remember that whatever we send upstream is something
>> that not
>> only has to be working, clean, solid and reliable, but we should also
>> take care
>> of avoiding future mistakes that could happen when somebody from the
>> community, or
>> other MediaTek engineers, implement new platforms.
> 
>> Reverting commits is not prohibited as long as we're not breaking
>> support for any
>> platform (so, as long as we're not removing features), but still, I
>> don't think
>> that this is the best solution, honestly.
>>
>> Besides, I don't get why the order of SMI phandles is important, can
>> you please
>> explain why?
> 
> I apologize for the confusion, The bp_cfg order in mt8188-pm-domain.h
> is important because the order of bus protection is depned on it.
> However smi clamp protection should be done before infra one. So rely
> on this is also a little shaky I think. Also it will take some overhead
> to loop through bp_cfg, mixed with infra and smi, to find the correct
> name smi to do clamp protection.
> 
> That why the first approach seems straight forward to me because it
> separate smi and infra. And we can do different protection with them.
> 
>>
>>> 2.The second approach, suggested by Markus, is to introduce
>>> "mediatek,smi-names" and convert "mediatek,smi" to an array of
>>> phandles. We could add a new field to the struct
>>> scpsys_bus_prot_data,
>>> such as const char *smi_name, which could be NULL (for device trees
>>> with only a single property). This way, we can use the smi-names to
>>> specify the desired SMI. While this method retains the current code
>>> structure, the implementation may not be as straightforward.
>>>
>>
>> To be completely honest, neither of the two approaches are state of
>> the art,
>> but the mediatek,smi-names one is better than the first, granted that
>> we
>> really need to guarantee that the SMIs are ordered.
>>
>> But again, my question is: why should those be ordered?
>> Can't we clamp IMG1 before clamping IMG0?
>>
> We can clamp IMG1 before clamping IMG0, I am more concerned with the
> order between infra and smi rather than the order between smi. And I
> think current structure mixed smi and infra may also introduce
> misunderstanding in the future. Maybe separate the bp_cfg and match the
> smi name with smi's bus protection step could be a direction to fix the
> problem?
> 

That could work, yes. You could alternatively build an array, or a 32 bit value for
which each bit corresponds to the position of a BUS_PROT_WR entry in .bp_cfg, and
then use that to locate SMI vs INFRA bus protection entries.

Taking as an example a "messy" bp_cfg:

.bp_cfg = {
	BUS_PROT_WR(INFRA, other_params),
	BUS_PROT_WR(SMI, other_params),
	BUS_PROT_WR(INFRA, ...),
	BUS_PROT_WR(INFRA, ...),
	BUS_PROT_WR(SMI, ...),
}

probe_function() {
	...

	for (....) {
		if (.bp_cfg[i] == SMI)
			pd->smi_bp_map |= BIT(i);
	}

	....
}

powerup_function() {
	...
	u16 smi_bp_map = pd->smi_bp_map;

	for_each_set_bit(i, &smi_pd_map, 16)
		bus_protect_smi_write(somewhere->bp_cfg[i]);

	...

	bus_protect_infra_write()

	...
}


Or, simply, we can *enforce* ordering in bp_cfg, so that all of the SMI entries
are before INFRA, like:

.bp_cfg = {
	/* Ordering is important here: SMI bus prot always before INFRA */
	BUS_PROT_WR(SMI, other_params),
	BUS_PROT_WR(SMI, ...),
	BUS_PROT_WR(INFRA, other_params),
	BUS_PROT_WR(INFRA, ...),
	BUS_PROT_WR(INFRA, ...),
}

...so that we never build any positional information / bitmaps.

Since the SMI vs INFRA order is really important, we could add a "failsafe" check
in the probe function, like:

probe() {
	bool smi_prot_found;

	for (....) {
		if ((...->bp_cfg[i].flags & BUS_PROT_COMPONENT_INFRA) &&
		    smi_prot_found) {
			dev_err(... , "SMI bus prot cannot be mixed with INFRA");
			return -EINVAL;
		} else if (....->bp_cfg[i] & BUS_PROT_COMPONENT_SMI)
			smi_prot_found = true;
	}
}

Obviously the error message etc should be reworded, all the above is just
examples to solve the issue without having any meaningful overhead in the
performance paths [scpsys_power_on() and scpsys_power_off()].

Does that help you?

Cheers,
Angelo

> Thanks for your timely feedback!
> 
> Best Regards,
> yu-chang.lee
> 
> 
>> Cheers,
>> Angelo
>>
>>> Attempting to resolve this issue, I find the first option easier
>>> and
>>> more direct. However, I would greatly appreciate hearing the
>>> thoughts
>>> of experts on this matter before proceeding with upstreaming.
>>>
>>> I look forward to your valued response.
>>>
>>> Cheers!
>>> Best Regards,
>>> Yu-chang.lee
>>>
>>> [1]:
>>>
> https://urldefense.com/v3/__https://chromium.googlesource.com/chromiumos/third_party/kernel/*/87222665c8f974e4ff9dca408cedf6b540a9e770__;Kw!!CTRNKA9wMg0ARbw!kDNdDHejJnDRc6HgYp1-LOvU7Ij4m23UJizlQOGgaJET_rH1jNegg7tYmhOf8XkHVZF_dqG94-kHyhzX6nZE_6aGNBv2CSyx6g$
>>>   
>>> [2]:
>>>
> https://lore.kernel.org/all/20230918093751.1188668-6-msp@baylibre.com/
>>> [3]:
>>>
> https://urldefense.com/v3/__https://chromium-review.googlesource.com/c/chromiumos/third_party/kernel/*/5098295__;Kw!!CTRNKA9wMg0ARbw!kDNdDHejJnDRc6HgYp1-LOvU7Ij4m23UJizlQOGgaJET_rH1jNegg7tYmhOf8XkHVZF_dqG94-kHyhzX6nZE_6aGNBvmL2Hiaw$
>>>   
>>
>>
>>


