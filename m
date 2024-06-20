Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0CDFAC27C79
	for <linux-mediatek@archiver.kernel.org>; Thu, 20 Jun 2024 08:01:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=qC8mYr30KY6ZAE1SfwSsCs9r+QwLrIimDNL8CR5WTtM=; b=qsXWXI+3zaSyfPE+26SkAlAhZP
	hnali41vdtINZVy8heWU+z7eB8l5hg7hUwjlgWGXynSFM7Pmgjg2k5+pqfQlE9sEKYE3znYgdHbXV
	vcQUAB3P2JHpTudx043xOsEjlhxnNHQA6PiGTXXirxT56ABkkvTORXUuQObNVMNoQxBU9kSw0gcFD
	8TMYIfaP2NZBaB0qMsgnR3HhAedF6WCP1JJ6qPHaTjY8AUUUeQp2aBy/6iWBu/wETMgqBPi2N971+
	jySL/8H4ZXwbTl0bSxE7ByqS+10qXqX4wpHy4CyqAV+zwSYpawrc5ni7eKijosjdiaE9FElvabcrd
	WYi8zZBQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sKCjX-000000044Bb-3a3B;
	Thu, 20 Jun 2024 08:01:28 +0000
Received: from madrid.collaboradmins.com ([46.235.227.194])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sKCjU-0000000448F-0OsH;
	Thu, 20 Jun 2024 08:01:25 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1718870479;
	bh=rhuKihUusm13Yt7WZRiQrggV9auR48Id+tI+3iKMR6k=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=qpwJiuz/3GUiDh+pyl66iIMgpVTGYlwqM9wSwUBdC62zYV+8VAl8jBpqo0E2mtKzF
	 7LPTXRg4+sYEfo9htAyqEBkO5gGcNXkMhbzs3eomwlMgcmHVd/f1cbnErEhtcDGn0G
	 2/WEAw6ORtAQOA0LweJJTuXL+MN0B573w9mffSpZBEuRs1CcMqf0tGbpzw57rvfIbS
	 9hqIdTEsowLJcDmv4aIUGCxSIKA20NxlBXDEbO9zrmbPwHRfjOtkYrWgufbMGIxF2t
	 H1vRGdfpFu12Uu7wdUHCNHBQOSJMcIxyZfY0VS2ZcsTEv6XJgkffk44pX1cjzzkduy
	 SYD7/xmI1/d5w==
Received: from [100.113.186.2] (cola.collaboradmins.com [195.201.22.229])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by madrid.collaboradmins.com (Postfix) with ESMTPSA id B8B6D378205D;
	Thu, 20 Jun 2024 08:01:18 +0000 (UTC)
Message-ID: <a7317981-8690-4d45-81b6-cc6a63c459e0@collabora.com>
Date: Thu, 20 Jun 2024 10:01:18 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 3/3] dt-bindings: mailbox: mediatek: Avoid clock-names on
 MT8188 GCE
To: Conor Dooley <conor@kernel.org>
Cc: krzk+dt@kernel.org, mturquette@baylibre.com, sboyd@kernel.org,
 robh@kernel.org, conor+dt@kernel.org, matthias.bgg@gmail.com,
 jassisinghbrar@gmail.com, garmin.chang@mediatek.com,
 houlong.wei@mediatek.com, Jason-ch.Chen@mediatek.com, amergnat@baylibre.com,
 Elvis.Wang@mediatek.com, linux-clk@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org,
 kernel@collabora.com
References: <20240619085322.66716-1-angelogioacchino.delregno@collabora.com>
 <20240619085322.66716-3-angelogioacchino.delregno@collabora.com>
 <20240619-sleeve-citable-a3dc10e5cd4f@spud>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Content-Language: en-US
In-Reply-To: <20240619-sleeve-citable-a3dc10e5cd4f@spud>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240620_010124_552099_6C297ED8 
X-CRM114-Status: GOOD (  16.58  )
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

Il 19/06/24 19:49, Conor Dooley ha scritto:
> On Wed, Jun 19, 2024 at 10:53:22AM +0200, AngeloGioacchino Del Regno wrote:
>> Add mediatek,mt8188-gce to the list of compatibles for which the
>> clock-names property is not required.
> 
> Because, I assume, it has some internal clock? Why do either of these
> things have no clock? Doesn't the internal logic require one?
> 

Because there's no gce0/gce1 clock, there's only an infracfg_AO clock that is
for one GCE instance, hence there's no need to require clock-names.

I can't remove the clock-names requirement from the older compatibles though,
because the (sorry about this word) driver (eh..) gets the clock by name for
the single GCE SoCs...

...and here comes a self-NACK for this commit, I have to fix the driver and
then stop requiring clock-names on all compatibles, instead of having this
ugly nonsense.

Self-note: gce0/gce1 clocks lookup was implemented in the driver but never
used and never added to the binding - luckily.

Sorry Conor, I just acknowledged that there's a better way of doing that.

Thank you for making me re-read this stuff, I'll send the proper changes
later today, driver change + binding change in a separate series.

As for the other two commits in this series, completely unrelated to GCE,
those are still fine, and are fixing dtbs_check warnings.

Cheers,
Angelo

>>
>> Fixes: f2b53c295620 ("dt-bindings: mailbox: mediatek,gce-mailbox: add mt8188 compatible name")
>> Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
>> ---
>>   .../devicetree/bindings/mailbox/mediatek,gce-mailbox.yaml     | 4 +++-
>>   1 file changed, 3 insertions(+), 1 deletion(-)
>>
>> diff --git a/Documentation/devicetree/bindings/mailbox/mediatek,gce-mailbox.yaml b/Documentation/devicetree/bindings/mailbox/mediatek,gce-mailbox.yaml
>> index cef9d7601398..55d4c34aa4b4 100644
>> --- a/Documentation/devicetree/bindings/mailbox/mediatek,gce-mailbox.yaml
>> +++ b/Documentation/devicetree/bindings/mailbox/mediatek,gce-mailbox.yaml
>> @@ -62,7 +62,9 @@ allOf:
>>           properties:
>>             compatible:
>>               contains:
>> -              const: mediatek,mt8195-gce
>> +              enum:
>> +                - mediatek,mt8188-gce
>> +                - mediatek,mt8195-gce
>>       then:
>>         required:
>>           - clock-names
>> -- 
>> 2.45.2
>>


