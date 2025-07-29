Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0CDA4C87FCA
	for <linux-mediatek@archiver.kernel.org>; Tue, 29 Jul 2025 21:05:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Dm0B5M26cYOXX5KrUOLsQ5vTboaxWnLdzB6XMUX6uWQ=; b=LdaNOth6WqKr+LuKzRuoUiaDMf
	uWkgEG7XrqN37kYdeDiQY/YzisbuH2XUvPMH9EXn+MzMeWExmUZihdPDm8H0rbiWxfSvntpsaydV0
	kLpmlWp71RYPy5toTU0Xun6kBy+LqWnWldwZnY7DunkkZwoZPhrxKc7DKh4IcDoQIr4KuFhq5Mrb0
	eMPaIT/SWZacOgWXPlqGmmBxQR4xRT8Z23cKOugmu23AidHziDS60N/GdtzVe+R7iR3ZErhRN8ZtC
	czCoB2PBeIWHg2P+8yYNemXDCc7/ZulbgJAMDjv6TXaa3mRGl3q2mAt2yI68amzE6fzXrxe2tEmDe
	mBpLEyxg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ugrVa-0000000061d-2pHe;
	Tue, 29 Jul 2025 21:05:14 +0000
Received: from mail-io1-xd30.google.com ([2607:f8b0:4864:20::d30])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ugrUW-000000005vy-2Kgw
	for linux-mediatek@lists.infradead.org;
	Tue, 29 Jul 2025 21:04:10 +0000
Received: by mail-io1-xd30.google.com with SMTP id ca18e2360f4ac-88120243d9cso124093639f.2
        for <linux-mediatek@lists.infradead.org>; Tue, 29 Jul 2025 14:04:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=riscstar-com.20230601.gappssmtp.com; s=20230601; t=1753823047; x=1754427847; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Dm0B5M26cYOXX5KrUOLsQ5vTboaxWnLdzB6XMUX6uWQ=;
        b=dFdIbH5gogXF6xXMPc3TMFOk9CfGXq7rWaOt40Emd+FdAUmHjAloOR3wsSsUNIQGr8
         tE1gMpgTtTlRaI8V8hxg8KYjkGRYOAa6JWMYlLnG+jrsu1UL6GbjrwonVEE9wIAmVTX0
         KIRFMYhke/csbeQLtUT244Q5ogWwix6vLVu/+YWK9IKoKPbIXxxAXPbcra7my2RyDqhG
         h1kOJSDPaEj8X/FlLCCNNBjmfArxAvYqvl06Xeb9NDovi7XCXnqJRrvrtv+pnZrInIS5
         8yZaKY5nMfG/p/cdnFezQLm3IsFivvwncpLnKVUFYlPOy89j5/dK4PhhxVGocnG7YmwN
         jyrw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753823047; x=1754427847;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Dm0B5M26cYOXX5KrUOLsQ5vTboaxWnLdzB6XMUX6uWQ=;
        b=TXolLj2eQoPfh0QxK/PqmtWnCwO14l/Y2Z/PMISW1izQnkmPDqpBP4Mye2AT29HGAg
         ZA8mGGxpSFLlFPnfO7WRzWCah67ezmUDHoZ2dm/qzRqtr58TYfwVpEmeXVyPtsDnT0Br
         yXnLwi1YlXiqYi6B114McI3dfehjcJ5L6kBblLhjKOA9XhwKOzpSPnzxLwcK35LiPRki
         SjwtxsmWDXCVB+8POZcuqu3YPQu31VFVZSax3ltaHbZQNuj6VlXeKHNJiA9/f1iDhrmO
         K4TknNO8rDniHhkYWrqj0EAyrswyJKzzgQc26VZxsotr/n6qSDLhjtoUT+PhHJh5p72u
         eDOg==
X-Forwarded-Encrypted: i=1; AJvYcCWjMQiY57P7p9+S+9P+PqOu/sPO2M2ZvLLPQ3vF5bODIx/Mw2RUh6AyEkPuB2revky/P23G6lTR2Gyy8gYwCw==@lists.infradead.org
X-Gm-Message-State: AOJu0Yytkucoi8wBJD+oOYvgSnjoKj3ddlYl9SO9EpCCoEevpd4P0EkP
	UNvY5kZGRho8sAST37KMszQ3zON8WxbRwOIAuImyXR8moWZ8fcmXPCj/Ra31IT2WQr0=
X-Gm-Gg: ASbGncuDnUl1qqXuiBZnsaQEtqy+XXX9PYse6LLh1K6xX3LzPqSY5Q91pJ41hzcFBLw
	fF+mr/Vt8pG7b5kAgJ9YCKNLiXHr+cfSRBUnbB+5GzwyI2Qpv9xmvGfsJGWHzHblgDo8AkxZRTK
	HyJ/zI+Z2G2LTMduiObKKEKCAmo0mfYhioQWl733drpEmiYfqH4sMxJ7D/slkBs/qbOEbM1ikCK
	1IRGndvGSNC1MhpP7i4LnAie4fzJedlSYNJtlwaLJDBFH6mvVx3UXmsHJu6GO2zXp1ysEcOo2Xf
	i2p/fLe0WTa12TrlevLFBVGzppRdQuworchO8Qyz4/Vf8eYr2bfife6S+P+a7XcuYoz9QCo9TgS
	GgVwueTkBBV7LGQKNf2/xWMEkK+rc0Ds19t/30LzYK26v8E3sj2Jj1BIpaT6HEQ==
X-Google-Smtp-Source: AGHT+IEYsNZGToVFKqEpDm8h8KviUj+EbfOPDQ9fzvNi2gdCmg29FQdC20eQLL41P+j0nBILREZn0w==
X-Received: by 2002:a05:6602:7501:b0:879:c9db:cbf0 with SMTP id ca18e2360f4ac-881374c295emr155676739f.2.1753823047163;
        Tue, 29 Jul 2025 14:04:07 -0700 (PDT)
Received: from [172.22.22.28] (c-73-228-159-35.hsd1.mn.comcast.net. [73.228.159.35])
        by smtp.gmail.com with ESMTPSA id 8926c6da1cb9f-508c91f1dcfsm2827976173.47.2025.07.29.14.04.05
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 29 Jul 2025 14:04:06 -0700 (PDT)
Message-ID: <5c3f9f10-6a9d-45b4-80c0-09402b35bf47@riscstar.com>
Date: Tue, 29 Jul 2025 16:04:05 -0500
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] dt-bindings: serial: 8250: allow "main" and "uart" as
 clock names
To: Conor Dooley <conor@kernel.org>, Yixun Lan <dlan@gentoo.org>
Cc: gregkh@linuxfoundation.org, jirislaby@kernel.org, robh@kernel.org,
 krzk+dt@kernel.org, conor+dt@kernel.org, matthias.bgg@gmail.com,
 angelogioacchino.delregno@collabora.com, lkundrak@v3.sk,
 devicetree@vger.kernel.org, linux-serial@vger.kernel.org,
 spacemit@lists.linux.dev, linux-mediatek@lists.infradead.org,
 linux-riscv@lists.infradead.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, kernel test robot <lkp@intel.com>
References: <20250728220002.599554-1-elder@riscstar.com>
 <20250728225319-GYA900803@gentoo>
 <20250729-reshuffle-contented-e6def76b540b@spud>
Content-Language: en-US
From: Alex Elder <elder@riscstar.com>
In-Reply-To: <20250729-reshuffle-contented-e6def76b540b@spud>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250729_140408_662122_5F2508E7 
X-CRM114-Status: GOOD (  19.60  )
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

On 7/29/25 12:54 PM, Conor Dooley wrote:
> On Tue, Jul 29, 2025 at 06:53:19AM +0800, Yixun Lan wrote:
>> Hi Alex,
>>
>> On 17:00 Mon 28 Jul     , Alex Elder wrote:
>>> There are two compatible strings defined in "8250.yaml" that require
>>> two clocks to be specified, along with their names:
>>>    - "spacemit,k1-uart", used in "spacemit/k1.dtsi"
>>>    - "nxp,lpc1850-uart", used in "lpc/lpc18xx.dtsi"
>>>
>>> When only one clock is used, the name is not required.  However there
>>> are two places that do specify a name:
>>>    - In "mediatek/mt7623.dtsi", the clock for the "mediatek,mtk-btif"
>>>      compatible serial device is named "main"
>>>    - In "qca/ar9132.dtsi", the clock for the "ns8250" compatible
>>>      serial device is named "uart"
>>>
>>> In commit d2db0d7815444 ("dt-bindings: serial: 8250: allow clock 'uartclk'
>>> and 'reg' for nxp,lpc1850-uart"), Frank Li added the restriction that two
>>> named clocks be used for the NXP platform mentioned above.  Extend that
>>> so that the two named clocks used by the SpacemiT platform are similarly
>>> restricted.
>>>
>>> Add "main" and "uart" as allowed names when a single clock is specified.
>>>
>>> Fixes: 2c0594f9f0629 ("dt-bindings: serial: 8250: support an optional second clock")
>>> Reported-by: kernel test robot <lkp@intel.com>
>>> Closes: https://lore.kernel.org/oe-kbuild-all/202507160314.wrC51lXX-lkp@intel.com/
>>> Signed-off-by: Alex Elder <elder@riscstar.com>
>>> ---
>>>   .../devicetree/bindings/serial/8250.yaml      | 19 ++++++++++++++-----
>>>   1 file changed, 14 insertions(+), 5 deletions(-)
>>>
>>> diff --git a/Documentation/devicetree/bindings/serial/8250.yaml b/Documentation/devicetree/bindings/serial/8250.yaml
>>> index e46bee8d25bf0..cef52ebd8f7da 100644
>>> --- a/Documentation/devicetree/bindings/serial/8250.yaml
>>> +++ b/Documentation/devicetree/bindings/serial/8250.yaml
>>> @@ -61,11 +61,17 @@ allOf:
>>>               - const: uartclk
>>>               - const: reg
>> ..
>>>       else:
>> would it be better to drop this 'else', and moving following 'if' block
>> to the same level with "nxp,lpc1850-uart"?
>>
>> the reason here would avoid too many indentions if add more constraint in
>> the future if other SoC uart need different clock-names..
> 
> I agree, it's more typical to do it that way I think to boot.
> 
> Also, why is there a k1/lpc conditional bit that is not part of the
> allOf in addition to the bits in the allOf? Can that get merged with the
> allOf please?

Are you talking about the blank line here?

     then:
       oneOf:
         - required: [ clock-frequency ]
         - required: [ clocks ]
                            <------ this blank line
   - if:
       properties:
         compatible:
           contains:
             const: nxp,lpc1850-uart
     then:

I didn't notice that before.  It got inserted with commit
d2db0d7815444 ("dt-bindings: serial: 8250: allow clock
'uartclk' and 'reg' for nxp,lpc1850-uart").

If so, yes I'll remove that as well when I update the patch to
get rid of the else as Yixun suggests.

Greg won't take this for a couple weeks so I'll hold off sending
v2 for a while.

					-Alex


