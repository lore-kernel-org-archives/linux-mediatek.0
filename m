Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 94BFBC4332F
	for <linux-mediatek@archiver.kernel.org>; Thu,  7 Apr 2022 17:00:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:Subject:From:References:Cc:To:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=QvSKNQoTolu6pdvvEuGqQxCh9fiUyH16mu0vtbRJ294=; b=3/BMItP3MINLVq
	2xxe4LZcHMHvAi6R2ilYC8INPaJo86o9ILISbyXze9ic0kw253Qk1GSgr0BoulFCfJm2sgV9av3/f
	HNO+k1zMcVdXIbtTno+xzg/6FwSZQMrfLl5e+Pwidpt16jclYM0qZcLP2lODMAA5dPoDRVKyGUb8I
	6IMEjWS94E6WzM9u43KMsbMFOtEm0mbLqHw+fl0SSn/fTLw4WRuK6+w+EaVXBA/unlFGhW+t1NmPp
	2SxkOqoyg2+62JGdJZy9m4vxmwR2e34ok5lDgdPpyD+3MfEmXJsrhMQhk/MTIwRb8IDg6kfiiz+1u
	sliEkf5s+FSFzHjrnuEw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ncVUX-00DG4N-Hq; Thu, 07 Apr 2022 17:00:17 +0000
Received: from nbd.name ([2a01:4f8:221:3d45::2])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1ncVUA-00DFvR-EC; Thu, 07 Apr 2022 16:59:56 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=nbd.name;
 s=20160729; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:Subject:
 From:References:Cc:To:MIME-Version:Date:Message-ID:Sender:Reply-To:Content-ID
 :Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:
 Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe
 :List-Post:List-Owner:List-Archive;
 bh=o3qoOir9WAPGzi1sWnNPLakfeNGwPLGP2JcLR4qBR0w=; b=MuioKSfFuI7blzwCV/6wb+YekZ
 ZxFLRKdEmgFHBL5G5EjD8gQ7NqEpdI5RH75hyyi5Lx+Qpo/ZHjbVyA8sOLM81+Cf/jnhuNTEqrUMV
 AKRzPBibxD304idWTvyCsPVM59NiEmQMfnURAJfh2CAAQpBDkCnXgKqwp0Bbiz2WY6Zs=;
Received: from p200300daa70ef2000000000000000451.dip0.t-ipconnect.de
 ([2003:da:a70e:f200::451] helo=nf.local)
 by ds12 with esmtpsa (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.89) (envelope-from <nbd@nbd.name>)
 id 1ncVU3-0005oz-2F; Thu, 07 Apr 2022 18:59:47 +0200
Message-ID: <15c8aab5-41b7-4d25-4b4c-98536bc197fc@nbd.name>
Date: Thu, 7 Apr 2022 18:59:46 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:91.0)
 Gecko/20100101 Thunderbird/91.7.0
Content-Language: en-US
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
 Arnd Bergmann <arnd@arndb.de>
Cc: Networking <netdev@vger.kernel.org>, Rob Herring <robh+dt@kernel.org>,
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
 <08883cf4-27b9-30bf-bd27-9391b763417c@nbd.name>
 <750c1f9e-6a53-16d5-390e-f9f81fa23afd@linaro.org>
From: Felix Fietkau <nbd@nbd.name>
Subject: Re: [PATCH v2 04/14] dt-bindings: arm: mediatek: document WED binding
 for MT7622
In-Reply-To: <750c1f9e-6a53-16d5-390e-f9f81fa23afd@linaro.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220407_095954_709308_A38FE8C6 
X-CRM114-Status: GOOD (  10.28  )
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


On 06.04.22 10:57, Krzysztof Kozlowski wrote:
> Thanks for clarification. I still wonder about the missing drivers as I
> responded to your second bindings:
> https://lore.kernel.org/all/20220405195755.10817-1-nbd@nbd.name/T/#m6d108c644f0c05cd12c05e56abe2ef75760c6cef
> 
> Both of these compatibles - WED and PCIe - are not actually used. Now
> everything is done inside your Ethernet driver which pokes WED and
> PCIe-mirror address space via regmap/syscon.
> 
> Separate bindings might have sense if WED/PCIe mirror were ever
> converted to real drivers.I think in terms of hardware description it makes more sense to have 
separate nodes, even if the implementation uses them in one driver at 
the moment.

- Felix

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
