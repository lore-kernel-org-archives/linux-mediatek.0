Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D9F6CC433F5
	for <linux-mediatek@archiver.kernel.org>; Thu,  7 Apr 2022 16:32:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=WHVoNVFLoEbqsoJ3Utte00Jcj1XCjCFRtuLYxEQFfTw=; b=qgdF5AxSd6UnLc
	dZvDogUhSXAZn9T4CY6Z2u1+26Su+EpJZ80UNhTKAo5VppJkd2NZtGH4AimTvxQWOoview1MQYmbt
	IBKKkxDEnSqcCdt/048q65JzpPR1C0WGkaNfCUtFf+DpsKYkvh0I5gNzj/arJqEv1xVp1oNDfq36x
	ove9VULd+CrhmgUqWEAFOdn3xEAP3uYMzTeY1vssQmNS/qgXnnxXU9nHZpgtclXtsl04Wg9uv8qs8
	vsMr2SPUfGCyY9qJrItKi8piZNMjZ3Z3X20eihvurDdVtln9HTQuuO9/IKmJpDc/gDRVa/6Zjyo58
	qWGPp1k5RMqf1Eg/64Pw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ncV3i-00D5aJ-M0; Thu, 07 Apr 2022 16:32:34 +0000
Received: from nbd.name ([2a01:4f8:221:3d45::2])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1ncUjF-00Cy6e-Ow; Thu, 07 Apr 2022 16:11:27 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=nbd.name;
 s=20160729; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:
 References:Cc:To:Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=8ilOzeEpMGnqmcxm5ACkIhP+cfoDdajkjlKSouIG/qg=; b=h3DD6AtKVrCXay15nFo1Hm2b9S
 1LO7hycjezhdpT3vtU9MCsyOM/K4Z1SVW+wZIuBsTllbvCmGDd9V6xrjTeHsdxOC4rFm/UQTA5p8t
 5QqDxhQWdzdeuGi5oxFQS+BwmvIHf/X11kMCr30FIazWpeX45qK+nZozHAvhmPNkJrJ4=;
Received: from p200300daa70ef20069621b7d3c575442.dip0.t-ipconnect.de
 ([2003:da:a70e:f200:6962:1b7d:3c57:5442] helo=nf.local)
 by ds12 with esmtpsa (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.89) (envelope-from <nbd@nbd.name>)
 id 1ncUip-0003Lb-Od; Thu, 07 Apr 2022 18:11:00 +0200
Message-ID: <7ee0b60b-a931-357e-7d88-ee2fd04f6902@nbd.name>
Date: Thu, 7 Apr 2022 18:10:56 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:91.0)
 Gecko/20100101 Thunderbird/91.7.0
Subject: Re: [PATCH v2 04/14] dt-bindings: arm: mediatek: document WED binding
 for MT7622
Content-Language: en-US
To: Andrew Lunn <andrew@lunn.ch>
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
 netdev@vger.kernel.org, Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 "David S. Miller" <davem@davemloft.net>, Jakub Kicinski <kuba@kernel.org>,
 Paolo Abeni <pabeni@redhat.com>, Lorenzo Bianconi <lorenzo@kernel.org>,
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org
References: <20220405195755.10817-1-nbd@nbd.name>
 <20220405195755.10817-5-nbd@nbd.name>
 <d0bffa9a-0ea6-0f59-06b2-7eef3c746de1@linaro.org>
 <e3ea7381-87e3-99e1-2277-80835ec42f15@nbd.name> <Yk8IXno6sjkHVf4g@lunn.ch>
From: Felix Fietkau <nbd@nbd.name>
In-Reply-To: <Yk8IXno6sjkHVf4g@lunn.ch>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220407_091126_203290_A0F66F29 
X-CRM114-Status: UNSURE (   9.51  )
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On 07.04.22 17:50, Andrew Lunn wrote:
>> > Isn't this a network offload engine? If yes, then probably it should be
>> > in "net/".
>> It's not a network offload engine by itself. It's a SoC component that
>> connects to the offload engine and controls a MTK PCIe WLAN device,
>> intercepting interrupts and DMA rings in order to be able to inject packets
>> coming in from the offload engine.
> 
> Hi Felix
> 
> Maybe turn the question around. Can it be used for something other
> than networking? If not, then somewhere under net seems reasonable.
I'm fine with moving this to net.

- Felix

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
