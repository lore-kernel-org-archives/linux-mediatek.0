Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E3F1BC04FFE
	for <linux-mediatek@archiver.kernel.org>; Mon, 20 May 2024 10:06:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:Resent-From
	:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=lSvPWojDpzKX092L/6OhftF6lNjVjUW7qvYbcd/Etvc=; b=juytqwrtLZyXbU8LyOFk7tNvIn
	UgQY/9tIGIyRlObIChjzmFSgAXnYijhddQqXAfxRs1+gpECu/au6Yhn2uwCQcIRsaIPx7mGsGX9Rg
	w8ACrAWXCzVFGR/n6oj2PhcpRIzcA1CloWOhUBN4+1HjWlu6WSU5ACuyLC6T1mqolbmi58K0MIuPx
	pFwHKbhapoQ32m6kwbKNLyXow3CR2fHqZrQataA4BOCGZCfO/kzdkk0M61vsnhEnc8VCDH9s15ny+
	Zdgs8to+jDdj8LeCeMLvHiatz4bXlPDZeaegozHAn/uCeWudR7Gecs769RyxEj3+JNVoJhbdq9ZZd
	TR0enehg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s8zv0-0000000E5SK-487q;
	Mon, 20 May 2024 10:06:58 +0000
Received: from madrid.collaboradmins.com ([2a00:1098:ed:100::25])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s8zux-0000000E5RN-0VWG;
	Mon, 20 May 2024 10:06:56 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1716199613;
	bh=vb+S3v0VFH+2kufPH8rXeEV4ZmE//CWYzZhNwvQ83wM=;
	h=Date:Subject:To:References:From:In-Reply-To:From;
	b=38z8CCsuKFNlEFOI8zKZiaIoR24d2xYKgwkiqCs0fEy6eEbUr0nwwXkrXcCfQmtbL
	 nUaoOacEpmeJb2ebeOQd7ubBmu+PHX3ChWO2IOnD9iqkfKPvyAdHb5YBDKBjnbDHCy
	 ozft6KKYyyMHEEesYZpKiDFPW5GhNQkf5NDk2FZJ1815WWY/UvHHlW2FyqzVWq8rKg
	 EwPxZE0TtgCda3YVcbM5mR07OouW9zwsREHiboOh8aQKjW3VkeIJhzwnb1CXX2rYJ+
	 hKObzyxCt9iQV9klOjOBQAHK+S/6I9T0zGihr7EITRtI6pjFwuDPqCAMbkGAQqtKj3
	 YU4dg37ZORrTQ==
Received: from [100.113.186.2] (cola.collaboradmins.com [195.201.22.229])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by madrid.collaboradmins.com (Postfix) with ESMTPSA id 1699D37809D1;
	Mon, 20 May 2024 10:06:53 +0000 (UTC)
Message-ID: <f7760293-ded2-4d89-928c-a73359a045d2@collabora.com>
Date: Mon, 20 May 2024 12:06:52 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 3/4] arm64: dts: mediatek: mt8365: drop incorrect
 power-domain-cells
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
 Lee Jones <lee@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>,
 MandyJH Liu <mandyjh.liu@mediatek.com>, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org
References: <20240518211159.142920-1-krzysztof.kozlowski@linaro.org>
 <20240518211159.142920-3-krzysztof.kozlowski@linaro.org>
 <3b1be547-ac49-40fb-909f-96952c299545@collabora.com>
 <1540f43c-9859-49a8-9b20-1fb08d1c153f@linaro.org>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Content-Language: en-US
In-Reply-To: <1540f43c-9859-49a8-9b20-1fb08d1c153f@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240520_030655_525266_5BF983AD 
X-CRM114-Status: GOOD (  12.44  )
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

Il 20/05/24 12:03, Krzysztof Kozlowski ha scritto:
> On 20/05/2024 11:58, AngeloGioacchino Del Regno wrote:
>> Il 18/05/24 23:11, Krzysztof Kozlowski ha scritto:
>>> The top SCPSYS node is not a power domain provider.  It's child
>>> "power-controller" is instead.  Fix dtbs_check warnings like:
>>>
>>>     mt8365-evk.dtb: syscon@10006000: '#power-domain-cells' does not match any of the regexes: 'pinctrl-[0-9]+'
>>>
>>> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
>>
>> Well if you're fixing that by migrating to scpsys compatible, you might as well
>> resolve all of the warnings in one commit, removing that power-domain-cells
>> property in patch [2/4], otherwise this one is technically a fix for that.
>>
>> Please squash [2/4] and [3/4], like that it just makes more sense.
>>
> 
> That's independent thing. Previous compatible - syscfg - also did not
> allow power domains. The difference is that bindings did not print a
> warning without my change. We can reverse the patches if this is more
> suitable.
> 

You're still introducing a warning with patch 2.

As for swapping the order, that could also be a solution, but I still don't see
that as an independent thing - in any case, swapping them is something I can do
while applying, eventually.




