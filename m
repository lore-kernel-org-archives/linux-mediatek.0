Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 794E0C433F5
	for <linux-mediatek@archiver.kernel.org>; Wed,  6 Apr 2022 08:32:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=lxXjo+3V4nx/dNF+4NuzDLt/Am568J0J5rqx4ianNGo=; b=n1QFaaBmcTGRzy
	ZjMhxpP2MQV5g+m1RU+4/fqKBT4Dgg0CW1mEc2SsOCWfetPI5xm0DT02C1QZq6tfvtPmRFCpDSIvc
	FKxhpueyCt02FzigAzMpMsd9nN3K4JrqK8iCdf6MllWDwhYVzqevQFXJRZ9daYufeaEah1dnTuqDF
	bnn965Y5Ww0VuBctuRqytBqhCQyS2DWPxYIvSsT71udvzWe5QZL5ukBgwxtnU/2mtlCGz9ZwLFzoE
	3j9p1F+VwSePN3oOuXjG+rbA6zowmO06sI7XwSfoAsVD1wyvu8sHwkgPEkCGNGf7Gs4/qzmk6X3iC
	PJdQQ/VjDUvYXVginiBQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nc15n-004jZS-7R; Wed, 06 Apr 2022 08:32:43 +0000
Received: from nbd.name ([2a01:4f8:221:3d45::2])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nc15Q-004jSF-GK; Wed, 06 Apr 2022 08:32:22 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=nbd.name;
 s=20160729; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:
 References:Cc:To:Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=9xt0369dhM7VBOgA77yxeIwkTj0Hpid2gN2MW5LI3oo=; b=LZmSgaDdhGWPzS7AFEj8yCE24S
 5jtuV7po7iIM1SI3fgqX0lmSNmiWaMI6X4Hujy0wUAdj3OzCK6osprWGo/NxsY2TNRlHWFJruD966
 lsf8d9G0WJ85l6ntJ0YQh/jaBvGBk/tsr5ppdw+cdNXpEl707vUKrc51miM0AYsL7xpk=;
Received: from p200300daa70ef200456864e8b8d10029.dip0.t-ipconnect.de
 ([2003:da:a70e:f200:4568:64e8:b8d1:29] helo=nf.local)
 by ds12 with esmtpsa (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.89) (envelope-from <nbd@nbd.name>)
 id 1nc15K-00040V-QC; Wed, 06 Apr 2022 10:32:14 +0200
Message-ID: <08883cf4-27b9-30bf-bd27-9391b763417c@nbd.name>
Date: Wed, 6 Apr 2022 10:32:14 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:91.0)
 Gecko/20100101 Thunderbird/91.7.0
Subject: Re: [PATCH v2 04/14] dt-bindings: arm: mediatek: document WED binding
 for MT7622
Content-Language: en-US
To: Arnd Bergmann <arnd@arndb.de>
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
 Networking <netdev@vger.kernel.org>, Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 "David S. Miller" <davem@davemloft.net>, Jakub Kicinski <kuba@kernel.org>,
 Paolo Abeni <pabeni@redhat.com>, Lorenzo Bianconi <lorenzo@kernel.org>,
 DTML <devicetree@vger.kernel.org>,
 Linux ARM <linux-arm-kernel@lists.infradead.org>,
 "moderated list:ARM/Mediatek SoC..." <linux-mediatek@lists.infradead.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
References: <20220405195755.10817-1-nbd@nbd.name>
 <20220405195755.10817-5-nbd@nbd.name>
 <d0bffa9a-0ea6-0f59-06b2-7eef3c746de1@linaro.org>
 <e3ea7381-87e3-99e1-2277-80835ec42f15@nbd.name>
 <CAK8P3a1A6QYajv_HTw79HjiJ8CN6YPeKXc_X3ZFD83pdOqVTkQ@mail.gmail.com>
From: Felix Fietkau <nbd@nbd.name>
In-Reply-To: <CAK8P3a1A6QYajv_HTw79HjiJ8CN6YPeKXc_X3ZFD83pdOqVTkQ@mail.gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220406_013220_808648_F8B22DDD 
X-CRM114-Status: GOOD (  20.52  )
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

On 06.04.22 10:29, Arnd Bergmann wrote:
> On Wed, Apr 6, 2022 at 10:18 AM Felix Fietkau <nbd@nbd.name> wrote:
>> On 06.04.22 10:09, Krzysztof Kozlowski wrote:
>> > On 05/04/2022 21:57, Felix Fietkau wrote:
>> >> From: Lorenzo Bianconi <lorenzo@kernel.org>
>> >>
>> >> Document the binding for the Wireless Ethernet Dispatch core on the MT7622
>> >> SoC, which is used for Ethernet->WLAN offloading
>> >> Add related info in mediatek-net bindings.
>> >>
>> >> Signed-off-by: Lorenzo Bianconi <lorenzo@kernel.org>
>> >> Signed-off-by: Felix Fietkau <nbd@nbd.name>
>> >
>> > Thank you for your patch. There is something to discuss/improve.
>> >
>> >> ---
>> >>  .../arm/mediatek/mediatek,mt7622-wed.yaml     | 50 +++++++++++++++++++
>> >>  .../devicetree/bindings/net/mediatek-net.txt  |  2 +
>> >>  2 files changed, 52 insertions(+)
>> >>  create mode 100644 Documentation/devicetree/bindings/arm/mediatek/mediatek,mt7622-wed.yaml
>> >
>> > Don't store drivers in arm directory. See:
>> > https://lore.kernel.org/linux-devicetree/YkJa1oLSEP8R4U6y@robh.at.kernel.org/
>> >
>> > Isn't this a network offload engine? If yes, then probably it should be
>> > in "net/".
>> It's not a network offload engine by itself. It's a SoC component that
>> connects to the offload engine and controls a MTK PCIe WLAN device,
>> intercepting interrupts and DMA rings in order to be able to inject
>> packets coming in from the offload engine.
>> Do you think it still belongs in net, or maybe in soc instead?
> 
> I think it belongs into drivers/net/. Presumably this has some kind of
> user interface to configure which packets are forwarded? I would not
> want to maintain that in a SoC driver as this clearly needs to communicate
> with both of the normal network devices in some form.
The WLAN driver attaches to WED in order to deal with the intercepted 
DMA rings, but other than that, WED itself has no user configuration.
Offload is controlled by the PPE code in the ethernet driver (which is 
already upstream), and WED simply provides a destination port for PPE, 
which allows packets to flow to the wireless device.

- Felix

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
