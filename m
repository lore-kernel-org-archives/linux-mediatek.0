Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BC4FCC27C76
	for <linux-mediatek@archiver.kernel.org>; Wed, 25 Jan 2023 16:54:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=SIZywMUisVmnloRixbIoiGBncQ3oo41hmW5rDh5H3HY=; b=flr/XsWYxwezOxqKKLsEFrGMwv
	17rPIQPeVCuxj4kGAFxtyoUdc+ELDLMNvHk21+WufScFlQaUyundbp/m7q4p6oevQtk2jBVijvL2T
	Ld1/68Kx/acrNwUyd4MORq2Zk+VPi7aXO7Bo4ZjdKej2UXrFxWvgF7yN8ShU1Lyduaap0ncLHLM8w
	AbKJy1zELbGcfatQkEJxtmlfHScw9QoS5LgP8TDvlClEC02YN1S5S8Q2dd+liV5eStgGzbK9g8vr0
	t+zuGQx9X+0bIo1u2zbJLQjmJdL+GeFQ0E156zUrvZcVc9D3/0JR9MzISw59+n8h17JvjdynFwf9W
	i4DwpOlA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pKj2w-0085oA-TG; Wed, 25 Jan 2023 16:54:50 +0000
Received: from sender4-op-o14.zoho.com ([136.143.188.14])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pKj2e-0085hc-76; Wed, 25 Jan 2023 16:54:33 +0000
ARC-Seal: i=1; a=rsa-sha256; t=1674665668; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=Q3SZIKmg98u/0LCExf0y8XU+kU0RsgSRE/aINqK48rm5nnvIekxBzlnAHXqL10VTe+04Z+udVF9G62OYASNfD1T5P+KkrZxeRUAKeYekbGf+LbmewEK+cE9H6jDn2OsEMW4rdq2ka21B7d6gFABGMnhfbDUSkcqZuL5GmqdeRwU=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1674665668; h=Content-Type:Content-Transfer-Encoding:Cc:Date:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:To; 
	bh=SIZywMUisVmnloRixbIoiGBncQ3oo41hmW5rDh5H3HY=; 
	b=mZ+1TjJJApQjKngEPPHBo+4yhHnGVQqZKigFFF+DirjGk9Vz0iWBvw7JPj+Nb6BX178TZYeA2/jpiwjGLnHUC6Lf5VKoasqfAXJAphZ9ohK5bMpu3DVG/XueR8iRVZtUQQN+yoBHP9saE25g+F9fR0Vs+14tmM6digtvRTzPT5E=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=arinc9.com;
	spf=pass  smtp.mailfrom=arinc.unal@arinc9.com;
	dmarc=pass header.from=<arinc.unal@arinc9.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1674665668;
	s=zmail; d=arinc9.com; i=arinc.unal@arinc9.com;
	h=Message-ID:Date:Date:MIME-Version:Subject:Subject:To:To:Cc:Cc:References:From:From:In-Reply-To:Content-Type:Content-Transfer-Encoding:Message-Id:Reply-To;
	bh=SIZywMUisVmnloRixbIoiGBncQ3oo41hmW5rDh5H3HY=;
	b=gW3CYVCtcwPvM2mNPI5GHVE5m0ks6GtRUL7o0xaH87KZSI6y7S1dS+pWuH9ZreXw
	8wykqSKrg+7fmQk4Hw0MCz50ftYhg8zzuon2WC9SU4hWjw66FhGEGLcpRMBtK2pq825
	/FtJQKEjIiC4vR3Q21qrKbdKd8aTJpQSbXChrv9o=
Received: from [10.10.10.3] (37.120.152.236 [37.120.152.236]) by mx.zohomail.com
	with SMTPS id 1674665667043392.6251380291727; Wed, 25 Jan 2023 08:54:27 -0800 (PST)
Message-ID: <cf7d3247-4d21-98f0-819b-7653153ee4c0@arinc9.com>
Date: Wed, 25 Jan 2023 19:54:22 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.2
Subject: Re: [PATCH 4/5] arm: dts: mt7623: mux phy0 on Bananapi BPI-R2
Content-Language: en-US
To: frank-w@public-files.de, Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Matthias Brugger <matthias.bgg@gmail.com>
Cc: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org,
 erkin.bozoglu@xeront.com, Sean Wang <sean.wang@mediatek.com>,
 DENG Qingfang <dqfext@gmail.com>
References: <20230120205318.519493-1-arinc.unal@arinc9.com>
 <20230120205318.519493-5-arinc.unal@arinc9.com>
 <9A7BD95A-F026-4EAB-96E1-12B1B0C6AAA4@public-files.de>
From: =?UTF-8?B?QXLEsW7DpyDDnE5BTA==?= <arinc.unal@arinc9.com>
In-Reply-To: <9A7BD95A-F026-4EAB-96E1-12B1B0C6AAA4@public-files.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ZohoMailClient: External
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230125_085432_301899_BE8C068B 
X-CRM114-Status: UNSURE (   8.12  )
X-CRM114-Notice: Please train this message.
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

On 25.01.2023 19:41, Frank Wunderlich wrote:
> Am 20. Januar 2023 21:53:17 MEZ schrieb "Arınç ÜNAL" <arinc.unal@arinc9.com>:
> 
>> 		switch@1f {
>> 			compatible = "mediatek,mt7530";
>> 			reg = <0x1f>;
>> @@ -199,11 +208,6 @@ ports {
>> 				#address-cells = <1>;
>> 				#size-cells = <0>;
>>
>> -				port@0 {
>> -					reg = <0>;
>> -					label = "wan";
>> -				};
>> -
> 
> This will break existing userspace setups using wan as interface name.

Yup. The OS being used will have to either rename the interface or adapt 
to the new name, eth1.

Arınç

