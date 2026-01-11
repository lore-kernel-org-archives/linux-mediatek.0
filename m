Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7A55DD2502F
	for <linux-mediatek@archiver.kernel.org>; Sun, 11 Jan 2026 13:37:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=GyrKJz6PMKwk5qm2HTkDflwTnAv1RI+K3notTIpruY0=; b=2m2MdYop8p4YAkk3yVHNSDR7mW
	OW0Ns00BxWUSUMwMoBSZRZOOrtekbs8h7oceR8kaTxHi0R4S3vxRE6+t4KT65vvYA1ALEBTcjvCKP
	/r5fkeRFnUN0TTdeSovfVMz5iIFeUL6hysCla7nJu9KV+1GLexj+YJ6lkyx+t2pfEH/gDhyAjrcLn
	rd5GkW0oUR+LfKQHEjl9OpQ/Wc7HLAdDqFWCGRRMW9FSycYm4SMW+bLmjWRQyNQr6rXgQYEPLgWSQ
	0g9BMKt9NusRfIJKBcrtgqgro/3wa0Ds/atuAISTHXXGIpUHfsZEZcn9WHxuUMWlj7MGZifHFFYe7
	Ogy9Y4AA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vevcv-00000004GEc-3KXC;
	Sun, 11 Jan 2026 13:37:05 +0000
Received: from mx4.wp.pl ([212.77.101.12])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vevct-00000004GDu-1tqG
	for linux-mediatek@lists.infradead.org;
	Sun, 11 Jan 2026 13:37:04 +0000
Received: (wp-smtpd smtp.wp.pl 13958 invoked from network); 11 Jan 2026 14:36:53 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=wp.pl; s=20241105;
          t=1768138613; bh=GyrKJz6PMKwk5qm2HTkDflwTnAv1RI+K3notTIpruY0=;
          h=Subject:To:Cc:From;
          b=CUf/UaTedZOach20SFWH5Rs2F6kFXyWzcq6gxSvgPcDtMvWxO495Z5hRJRNxdQDsB
           rI56nFeVub6DBMVw6Eg1bw4iOvFMjCLzVunmpqYzebB4ZsqjY3e6jkFCw3RvT+L8Tp
           GitqJ0go56cUnEXOh4lUB0tCbFdKBtSgB5VMWXXZa93VFzfX+NwmTgrJxSqThgvXp4
           J7EOBF1vNH7J4I0P91c9Gto3rh1RBeX70lV6YsDK5T6YqyqdhOW13s/en5H2no+QE+
           PYREkxQzh+hBW97oqXHiAM/3HGbpWKXGhUBgAo5V1F/GfM60WQxlOT9o6Q8Ir4X0+v
           rN8y7m9wMVJtQ==
Received: from 83.5.241.112.ipv4.supernova.orange.pl (HELO [192.168.3.246]) (olek2@wp.pl@[83.5.241.112])
          (envelope-sender <olek2@wp.pl>)
          by smtp.wp.pl (WP-SMTPD) with TLS_AES_256_GCM_SHA384 encrypted SMTP
          for <krzk@kernel.org>; 11 Jan 2026 14:36:53 +0100
Message-ID: <d7ab5be3-8502-407c-baf6-714ac3a89cb7@wp.pl>
Date: Sun, 11 Jan 2026 14:36:52 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 1/3] dt-bindings: crypto: eip93: add clock gate and
 reset line
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: benjamin.larsson@genexis.eu, chester.a.unal@arinc9.com,
 davem@davemloft.net, angelogioacchino.delregno@collabora.com,
 ansuelsmth@gmail.com, conor+dt@kernel.org, herbert@gondor.apana.org.au,
 krzk+dt@kernel.org, matthias.bgg@gmail.com, robh@kernel.org,
 sergio.paracuellos@gmail.com, tsbogend@alpha.franken.de,
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-crypto@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-mediatek@lists.infradead.org, linux-mips@vger.kernel.org
References: <20260102155341.3682013-1-olek2@wp.pl>
 <20260103-sweet-micro-manul-12eaee@quoll>
Content-Language: en-US
From: Aleksander Jan Bajkowski <olek2@wp.pl>
In-Reply-To: <20260103-sweet-micro-manul-12eaee@quoll>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-WP-MailID: 2fd5ca6ba679e5b337689a6786cb36fe
X-WP-AV: skaner antywirusowy Poczty Wirtualnej Polski
X-WP-SPAM: NO 0000008 [4Zuy]                               
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260111_053703_674484_42B40AD5 
X-CRM114-Status: GOOD (  10.71  )
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

Hi Krzysztof,

On 1/3/26 15:11, Krzysztof Kozlowski wrote:
> On Fri, Jan 02, 2026 at 04:47:33PM +0100, Aleksander Jan Bajkowski wrote:
>> Add the clock gate and reset line, both of which are available
>> on the Airoha AN7581.
>>
>> Signed-off-by: Aleksander Jan Bajkowski <olek2@wp.pl>
>> ---
>> v3:
>> - introduce patch
>> ---
>>   .../crypto/inside-secure,safexcel-eip93.yaml       | 14 ++++++++++++++
>>   1 file changed, 14 insertions(+)
>>
>> diff --git a/Documentation/devicetree/bindings/crypto/inside-secure,safexcel-eip93.yaml b/Documentation/devicetree/bindings/crypto/inside-secure,safexcel-eip93.yaml
>> index 997bf9717f9e..c6c99c08dc68 100644
>> --- a/Documentation/devicetree/bindings/crypto/inside-secure,safexcel-eip93.yaml
>> +++ b/Documentation/devicetree/bindings/crypto/inside-secure,safexcel-eip93.yaml
>> @@ -48,20 +48,34 @@ properties:
>>     interrupts:
>>       maxItems: 1
>>   
>> +  clocks:
>> +    maxItems: 1
>> +
>> +  resets:
>> +    maxItems: 1
>> +
>>   required:
>>     - compatible
>>     - reg
>>     - interrupts
>> +  - clocks
>> +  - resets
> That's ABI break without explanation in the commit msg.
>
I think that the reset line and clock gate are available on all SoCs
with this IP Core. Should the reset line and clock gate only be
required for newly added SoCs, and remain optional for existing ones?

Best regards,
Aleksander


