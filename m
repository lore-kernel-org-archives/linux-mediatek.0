Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B3C00C54E5D
	for <linux-mediatek@archiver.kernel.org>; Mon, 18 Mar 2024 13:02:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=bAu2yFQ9XYGhPb6HiB8uMF5Ul/C5kQswWx8qdnbtFXU=; b=YoqGViWW1d5MHLg2MzwTmwsm5Q
	ShA2UG8/pmIvZZ+EiGp2RZctQx3Monazg8o8KNQI3jNp3OKH1XXR81R5n6S8wiOIXQqG494ymQ6vT
	h4j34RgHSTyE3P+r8Kwblowv8jqcwNC7wcKgVboEibYmVzxPgohuWNFdK2gzbwUpT5aOqJXo5rVqc
	ICS0BMEY1JuO6wVnE0eCAYobQ8rpAW9PHvhtTqUx91Q9ZqEtHjDdjVfiYgm+kp8jOr5GHAIE5W4RW
	1V3w4SPGrjIKncpRfNggHZ44jczEOCD+mS0jsIT93X2jhyUNto6DyXmJuQahpEkokgj1MAsTtNlMB
	JKyJdKLg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rmCd6-00000008aX4-1h6I;
	Mon, 18 Mar 2024 13:02:16 +0000
Received: from mail-qk1-x72a.google.com ([2607:f8b0:4864:20::72a])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rmCd2-00000008aVd-1URP;
	Mon, 18 Mar 2024 13:02:13 +0000
Received: by mail-qk1-x72a.google.com with SMTP id af79cd13be357-789ddcd57f4so260909485a.2;
        Mon, 18 Mar 2024 06:02:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1710766930; x=1711371730; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=bAu2yFQ9XYGhPb6HiB8uMF5Ul/C5kQswWx8qdnbtFXU=;
        b=mgBA2aReH8nZ8N1F54XS+2jNUyjF8/ayqT6eGHMdEQ/iaXfCHhD+vGlawwDdMqYGYT
         /83pDvQ7bnArx8YT0WNmhMmqWKuBEVuAMFBIPX4cCrfpE6VzbjiwNw8cT3C/yXNb8/Rb
         N6EQ7bNkzDZWowbmM8KqJxY7KBfBpt12w5Nn6DIzI3Kl4bA/mJZfn2wWhuIXftzZcYq8
         nLqE6nEXj8agzobPrGqKip3gG1zsGwK8q+JENcSBepyjJnOmUok/Y2rMIyk8tDjrDAbb
         0kEhwQOBgT83H0rxElnnTFt0zfCDustmaB/FnmIsE+CrjPJpInypnJfQw8cTr9sd4F0G
         ZlBQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1710766930; x=1711371730;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=bAu2yFQ9XYGhPb6HiB8uMF5Ul/C5kQswWx8qdnbtFXU=;
        b=AlHJvChidWEIvBwopf8Aob1f642jbtQLMVL62PSei7SF5isnJrFl8iyfdTAjyoG5pH
         T1x84oA76/eUpFIYCz0eo4bmTBIUJdDMNprNQPKA9+pMBEEoxkZPfRg39Uj2uZKsOEhf
         6VL26VlOuOCbcwPY5L/XjLTh03JyPBsRmZjO+VqW6llacOJtHqcdfneMMMxd3wKoqX2J
         zMJhq5CO5EEdrHDpC3KeyFxNEYz/51YzJjMMuEDzK7euE/lrG/2bzEscZIS+3HFBLv2T
         gtObpqmpPmcWbDtkDfn/Rg9rM0jpVKmzLU3vCJaiAKFLir6mtHqrrRX21BRrnAth+VUl
         kt4A==
X-Forwarded-Encrypted: i=1; AJvYcCXfTQzi19YO3mbS/6hjiPF+tZN3gM/YnSntpgUOxQ4nvioWvmCtwoTzGfusgIKknFYgZVpfuUQBD9+ICC0DVUVHCQaeEadpzjx3x7IhBsRc1jIZsWMCI7SxfiMp9tnqJdrF8hOR0TyNuyglbAAiUnKXnUQWebM7xsc=
X-Gm-Message-State: AOJu0YwaEAkvKpcDV5F9r4zRoQn3y8X7UnGyB5bQaJ8PZCqaN37quQQE
	VEHqb992dBOPQsID3c79Ou+bxvFPgMbsp8laZor+cLXxVzpKtnh2
X-Google-Smtp-Source: AGHT+IHrWlXV9bK21Sik7/qiUxl9oaGP19J0sKYrEwO0Nqr+fk5XL4r39r3fx6ierCbsJFqivBtFmA==
X-Received: by 2002:a0c:e8c6:0:b0:690:f57c:b65c with SMTP id m6-20020a0ce8c6000000b00690f57cb65cmr11723077qvo.23.1710766930033;
        Mon, 18 Mar 2024 06:02:10 -0700 (PDT)
Received: from [192.168.1.3] (ip68-4-215-93.oc.oc.cox.net. [68.4.215.93])
        by smtp.gmail.com with ESMTPSA id r1-20020a056214212100b006906adc8aa2sm5248974qvc.102.2024.03.18.06.02.07
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 18 Mar 2024 06:02:09 -0700 (PDT)
Message-ID: <71dd200a-0306-4baa-abab-6e6906aeef2a@gmail.com>
Date: Mon, 18 Mar 2024 06:02:06 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/2] arm64: dts: mediatek: mt7622: set PHY address of
 MT7531 switch to 0x1f
Content-Language: en-US
To: =?UTF-8?B?QXLEsW7DpyDDnE5BTA==?= <arinc.unal@arinc9.com>,
 Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>, Matthias Brugger
 <matthias.bgg@gmail.com>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: mithat.guner@xeront.com, erkin.bozoglu@xeront.com,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org
References: <20240314-for-mediatek-mt7531-phy-address-v1-0-52f58db01acd@arinc9.com>
 <20240314-for-mediatek-mt7531-phy-address-v1-1-52f58db01acd@arinc9.com>
 <94e3d09a-e6a4-4808-bc29-3f494b65e170@gmail.com>
 <62d128f1-11ac-4669-90ff-e9cdd0ec5bd9@arinc9.com>
From: Florian Fainelli <f.fainelli@gmail.com>
Autocrypt: addr=f.fainelli@gmail.com; keydata=
 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
 HGuUuzv+GKZ6nsysJw==
In-Reply-To: <62d128f1-11ac-4669-90ff-e9cdd0ec5bd9@arinc9.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240318_060212_427892_06E90696 
X-CRM114-Status: GOOD (  19.34  )
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



On 3/16/2024 12:43 AM, Arınç ÜNAL wrote:
> On 15.03.2024 20:26, Florian Fainelli wrote:
>> On 3/14/24 05:20, Arınç ÜNAL via B4 Relay wrote:
>>> From: Arınç ÜNAL <arinc.unal@arinc9.com>
>>>
>>> The MT7531 switch listens on PHY address 0x1f on an MDIO bus. I've 
>>> got two
>>> findings that support this. There's no bootstrapping option to change 
>>> the
>>> PHY address of the switch. The Linux driver hardcodes 0x1f as the PHY
>>> address of the switch. So the reg property on the device tree is 
>>> currently
>>> ignored by the Linux driver.
>>>
>>> Therefore, describe the correct PHY address on boards that have this
>>> switch.
>>
>> Can we call it a pseudo PHY to use a similar terminology as what is 
>> done through drivers/net/dsa/{bcm_sf2,b53}*?
>>
>> This is not a real PHY as in it has no actual transceiver/digital 
>> signal processing logic, this is a piece of logic that snoops for MDIO 
>> transactions at that specific address and lets you access the switch's 
>> internal register as if it was a MDIO device.
> 
> I can get behind calling the switch a psuedo-PHY in the context of MDIO.
> However, as described on "22.2.4.5.5 PHYAD (PHY Address)" of "22.2.4.5
> Management frame structure" of the active standard IEEE Std 802.3™‐2022,
> the field is called "PHY Address". The patch log doesn't give an identifier
> as to what a switch is in the context of MDIO. Only that it listens on a
> certain PHY address which the term complies with IEEE Std 802.3™‐2022.
> 
> So I don't see an improvement to be made on the patch log. Feel free to
> elaborate further.

I would just s/PHY/MDIO bus address/ since that is simply more generic, 
but if it is not written as-is in the spec, then I won't fight it much 
more than I already did.
-- 
Florian

