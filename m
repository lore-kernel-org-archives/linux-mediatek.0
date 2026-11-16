Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1D0D6606A323
	for <linux-mediatek@archiver.kernel.org>; Mon, 16 Nov 2026 19:39:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=tlSWHuS2
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=tb0Yt+co2HSyPMP/gmGUN3MHhQtM2v+tCYbEj1zzeMQ=; b=tlSWHuS20aYsvn
	CKOjSWiqW33+fyAhNRczLU2PzdDeWV5826L4uAszPp35Y2SZGPE2ZBrHRmpW3NDuLiPbgyRvuzN2W
	dKtRi9Qgr3NY8rbw9SdwOEq1+tBQ+rskv3hJFz+5ViIaRBXuGxocakWc1Z/88KsEqx6FlrYoxRlkr
	qe4aWv61IzAniX5IRp6rayTqWLatR77zMw00FWwZZGfu2ZmS+Z7lmaJuudCu+H/UBsdB97cSai84w
	P96oJHhx3tZUxBk0OFjd8TpOEBBB/0J31K4GffuGaHE9zwt18a6IjPvmtBdpK9sfyy153qw8ZrIIc
	jeL1MBN8HfGqsqQkiSwQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xT2Y8-00000003mgs-1n8E;
	Mon, 16 Nov 2026 19:39:32 +0000
Received: from nbd.name ([46.4.11.11])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xT2Y5-00000003mgI-2Hrg
	for linux-mediatek@lists.infradead.org;
	Mon, 16 Nov 2026 19:39:30 +0000
Received: from [2a04:4540:1403:e6fc:39d9:16d5:775d:5525]
	by ds12 with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256
	(Exim 4.96)
	(envelope-from <john@phrozen.org>)
	id 1xT2Xy-004L5b-1e;
	Mon, 16 Nov 2026 20:39:22 +0100
Message-ID: <e20f708f-ebfe-4dc0-a64c-1590fdf608f3@phrozen.org>
Date: Mon, 16 Nov 2026 20:39:21 +0100
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 5/7] dt-bindings: pinctrl: airoha: add AN7589
To: Conor Dooley <conor@kernel.org>
Cc: Lorenzo Bianconi <lorenzo@kernel.org>, Lee Jones <lee@kernel.org>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Linus Walleij <linusw@kernel.org>,
 Bartosz Golaszewski <brgl@kernel.org>, Ahmed Naseef <naseefkm@gmail.com>,
 Benjamin Larsson <benjamin.larsson@genexis.eu>,
 Christian Marangi <ansuelsmth@gmail.com>, devicetree@vger.kernel.org,
 lei.dong@airoha.com, Linqi.zhang@airoha.com, linux-gpio@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-mediatek@lists.infradead.org,
 mfd@lists.linux.dev, Mikhail Kshevetskiy <mikhail.kshevetskiy@iopsys.eu>,
 Rajeev.kumar@airoha.com, upstream@airoha.com, Weifeng.xu@airoha.com,
 zhengping.zhang@airoha.com
References: <20261112185941.1316112-1-john@phrozen.org>
 <20261112185941.1316112-6-john@phrozen.org>
 <20261113-fame-smock-6ea3b8fadcd0@spud>
 <b94ed5e4-cb80-4e05-9964-bb08a61aa1fd@phrozen.org>
 <20261116-resolved-riot-c6a310bb2d8c@spud>
Content-Language: en-GB
From: John Crispin <john@phrozen.org>
In-Reply-To: <20261116-resolved-riot-c6a310bb2d8c@spud>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261116_113929_591931_95539E12 
X-CRM114-Status: GOOD (  22.31  )
X-Spam-Score: -1.9 (-)
X-BeenThere: linux-mediatek@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-mediatek.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-mediatek/>
List-Post: <mailto:linux-mediatek@lists.infradead.org>
List-Help: <mailto:linux-mediatek-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mediatek>,
 <mailto:linux-mediatek-request@lists.infradead.org?subject=subscribe>
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
X-Spam-Status: No, score=-5.4 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1
	autolearn=no autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Hi Conor,

The largest users are EN7523 pcm_spi 14, AN7563 pnand 17, AN7583
pnand 17, EN7528 pnand 17, EN7581 pnand 17 and AN7589 emmc 12 (these
numbers are based on a hackish "grep foo | bar", so they might be
slightly off).

I copied and modified what the other AN/EN bindings do. These set the
limit to the pin count of the SoC: EN7523 38, AN7563 38, AN7583 53,
EN7528 50, EN7581 58. Your call really, I do not mind either way. I can
send a v4 and then a follow up series cleaning up the existing bindings
as well.

        John

On 16.11.26 19:15, Conor Dooley wrote:
> On Mon, Nov 16, 2026 at 06:47:27PM +0100, John Crispin wrote:
>> On Fri, Nov 13, 2026 at 05:40:42PM +0000, Conor Dooley wrote:
>>> As Lee requested, please split this out. Two patches, maybe even three.
>>
>> Agreed. v3 splits it into three patches.
>>
>>> Do we even need a child node here? If all this node does is
>>> gpio/pinctrl, why can the driver not bind directly to this node?
>>>
>>> What else does it do that warrants being a syscon?
>>
>> The block also holds the PWM controller. Its registers interleave with
>> the GPIO ones. The PWM series adds it as a second child, as on the
>> EN7581. That series has a depency on this one so I have not posted it yet.
>>
>>> Otherwise, there should only be one. uart1 and uart2 should have
>>> different nodes.
>>
>> Agreed. v3 sets maxItems to 1. Only pcm_spi and pcie keep more, as
>> their groups carry different signals of one device.
>>
>>> So here, maxItems should be 1 for similar reasons.
>>
>> Agreed, v3 does this for i2c too.
>>
>>> I'm also curious about why this goes up to 74. None of the functions
>>> have 74 pins, surely?
>>
>> A conf node can set the same config on any set of pins. 74 is all the
>> pins. The EN7581 binding does the same with 58.
> 
> A difference in philosophy I guess - I would be grouping the pins in the
> config node by user. So that there would be something like
> 
> spi1-stuff {
> 	spi1-function {
> 		function = spi
> 		group = spi1
> 	}
> 
> 	spi1-config1 {
> 		pins = 1, 2
> 		config1
> 		config2
> 	}
> 
> 	spi2-config2 {
> 		pins = 3
> 		config1
> 	}
> }
> 
> spi {
> 	pinctrl-0 = spi1-function, spi-config1, spi-config2
> }
> 
> or
> 
> spi {
> 	pinctrl-0 = spi1-stuff
> }
> 
> IMO, having config nodes covering more than one "feature" doesn't really
> make sense, as you'd end up with something like:
> 
> spi1-function {
> 	function = spi
> 	group = spi1
> }
> 
> all-config1-config2 {
> 	pins = 1, 2, 4, 5
> 	config1
> 	config2
> }
> 
> all-config1 {
> 	pins = 3
> 	config1
> }
> 
> which kinda falls apart I think when a node can request a setting for
> pins that are not part of it (in this case, that's pins 4 and 5)
> 
> spi {
> 	pinctrl-0 = spi1-function, all-config1, all-config1-config2
> }
> 
> So my opinion is that the max number of items should be the size of the
> largest peripheral.
> 
> What's the largest actual user on the 7581?
> 		
>>
>> v3 will follow shortly.
>>
>>         John
>>
>>


