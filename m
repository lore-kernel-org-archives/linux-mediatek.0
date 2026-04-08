Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B5BF81073CAE
	for <linux-mediatek@archiver.kernel.org>; Wed,  8 Apr 2026 13:03:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=9pcOpxN6Pac/tfrhcOWSMi5MFBcz5khZMRo0IAJMCeo=; b=wW3J8f11mLyA2z1KlEqP1J3cIR
	oB9yDC/o7+K3YV9JQzSKxtCYY1gNHfGSRMubmm5aCstpZhKTo+n3koRnOR+KQJrDKqij+LUZAFThp
	G5W0NMyu+2rwftqhlFvB5xtATJSHQ196KANKz7YdwdOpOmDTmDNOdSyWwLpbpUTHdCujJUZS3gfjJ
	AwtQDlZ9atdBI49ILMiBn3YS/JTb/5QDe6iK2xm8U5FyaOi5hbiGwRsDpVoeUkUuKwXHYyifJcLpz
	Zd1GQdQhpVKtt19cYbND3U9P/KEBm0L+l2jnupdsO2jVPKkP3VHHyZhR1ds2edTTghu0zEm3D45Js
	iVhlPLgA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wASYr-00000008suR-2SZF;
	Wed, 08 Apr 2026 13:03:13 +0000
Received: from mail.cjdns.fr ([5.135.140.105])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wASYp-00000008su5-0xMh
	for linux-mediatek@lists.infradead.org;
	Wed, 08 Apr 2026 13:03:12 +0000
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 89F2D1EED5B;
	Wed,  8 Apr 2026 15:03:01 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cjdns.fr; s=dkim;
	t=1775653384; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:content-language:in-reply-to:references;
	bh=9pcOpxN6Pac/tfrhcOWSMi5MFBcz5khZMRo0IAJMCeo=;
	b=Ed8aRzW/e1aT4ydmqhyP1mUMg8ps7n1rXRRmiSpwoXICBp/n/BNXrs8iMawxYIwi1hfGM9
	4gAk915TNFF7pCYUJUl72JgONkS0X2uirHkxU0ieP98iXO93PrwaJL3ichDIusGjuEY5u2
	isyh0WwO7fN4Cdg/eFHAG9BEH/xb9emtX5m4XdvtO4hkGrXwVpRGP5vv8oALUEa8/oZgcF
	GxizstQ2rw6OxzT/WRpXf0pQQTvulrgT6bg38lvANHOSiMUi+I0EsHL5qmotO/VJfruJbF
	szOAHbvYwSdGLyHFJAS0ymKriK+j+99G91mLf7/lTPvQJxoEfC3oHq/En71Veg==
Message-ID: <32cd3283-b3f8-4a3c-abda-39a1423f68ca@cjdns.fr>
Date: Wed, 8 Apr 2026 15:03:00 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird Beta
Subject: Re: [PATCH v4 1/2] dt-bindings: PCI: mediatek: Add support for EcoNet
 EN7528
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: linux-pci@vger.kernel.org, linux-mips@vger.kernel.org,
 naseefkm@gmail.com, ryder.lee@mediatek.com, helgaas@kernel.org,
 lpieralisi@kernel.org, kwilczynski@kernel.org, mani@kernel.org,
 robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
 matthias.bgg@gmail.com, angelogioacchino.delregno@collabora.com,
 ansuelsmth@gmail.com, linux-mediatek@lists.infradead.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20260404182854.2183651-1-cjd@cjdns.fr>
 <20260404182854.2183651-2-cjd@cjdns.fr>
 <20260405-phenomenal-messy-shark-bdefbd@quoll>
Content-Language: en-US
From: Caleb James DeLisle <cjd@cjdns.fr>
In-Reply-To: <20260405-phenomenal-messy-shark-bdefbd@quoll>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260408_060311_468769_6D97200D 
X-CRM114-Status: UNSURE (   7.78  )
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


On 05/04/2026 09:03, Krzysztof Kozlowski wrote:
> On Sat, Apr 04, 2026 at 06:28:53PM +0000, Caleb James DeLisle wrote:
>> Introduce EcoNet EN7528 SoC compatible in MediaTek PCIe controller
>> binding.
>>
>> EcoNet PCIe controller has the same configuration model as
>> Mediatek v2 but is initialized more similarly to an MT7621
>> PCIe.
>>
> <form letter>
> This is a friendly reminder during the review process.
>
> It looks like you received a tag and forgot to add it.
>
Whoops, that was a failed-to-press-save error, thanks for catching it, I 
will update in a few days after waiting for any additional commentary.


Caleb


The missing line:

Acked-by: Conor Dooley <conor.dooley@microchip.com>


