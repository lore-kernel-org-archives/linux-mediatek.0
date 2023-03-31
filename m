Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2DDF6C76196
	for <linux-mediatek@archiver.kernel.org>; Fri, 31 Mar 2023 14:22:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	MIME-Version:Message-ID:In-Reply-To:Date:References:Subject:To:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Xwds8ZrVSpFIBcfvnEaYHbVLDeX4k2smXaERO+dzMgU=; b=Z353dvOn28lOq/BXKUxCwhLrWr
	0Fv0aJrC3vcKuORKWV+MQUfwXL9e6W2X7RLYlJ7IIA1Noc3I4RN52ZmpnGE2MR01wsQEtJjHIaWRQ
	kj/wbMiMXdB3ehBSenVnMoqN3kOv+pgx2nXt/CdVMOz7PBNgR7zx0wjzEDJKc6ao0sJEX2q4CNDy5
	xQ3TeU29cnhCFE0n1UW5XeeG4hfPXqipr4kHlGRyD29nb9vBfHkFWcfydQL2rStkCHKlx3YUu6pfb
	gnd/prjWoWCuhrZdfz/4Q+sOgiZ7hPFJPRVY61YmF63+WcLMy+DTvanGzHLk6z08oI/XKwhWUe/K/
	a6HV39zw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1piFeR-007fhv-2H;
	Fri, 31 Mar 2023 14:22:47 +0000
Received: from ams.source.kernel.org ([2604:1380:4601:e00::1])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1piFeI-007ffv-2z;
	Fri, 31 Mar 2023 14:22:41 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.source.kernel.org (Postfix) with ESMTPS id 11CA3B82FF7;
	Fri, 31 Mar 2023 14:22:37 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6CBBBC433D2;
	Fri, 31 Mar 2023 14:22:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1680272555;
	bh=MHkM9TprN3NwvT6HN9545BzVvFD+owTbBH/IsXQsX5w=;
	h=From:To:Cc:Subject:References:Date:In-Reply-To:From;
	b=qKlVOjhZGRXjf4tcrMX2X7Srp0RIS8N9dH8195060p1VxMUbCXsuxm5OfMa92viS2
	 UvPWQ8a2CdzmSbyxkwx1axNqY+6IJbj5+6YTKGVzI1CgYFODf7rjbrwp472dopDHm8
	 W2D8/ZJjojt7k2HSGqs3Hjk79V5vnzuTP48ySOOZs32Hd6YMQNgZIh45Nvj4CT3+/4
	 YHyh1IzqPtrH/D+NCNqKozX++K/LSJnEDOr4+noFwMqm0Nt/2xhybEP3s8iw3ZHGpk
	 QlWRyQK/sQEgioVYSbpRufwFmrunBzFA+jOgOBtuVuVrdBno2zig1ouVG/bpvAp31R
	 y8SUXTxFdmSNA==
From: Kalle Valo <kvalo@kernel.org>
To: Matthias Brugger <matthias.bgg@gmail.com>
Subject: Re: [PATCH v2] dt-bindings: mt76: add active-low property for led
References: <20230207133504.21826-1-linux@fw-web.de>
	<7aa132aa-d2fe-e2a1-a2a7-97321a74165c@linaro.org>
	<8a6d8107-436a-1b13-3799-59fa75c59635@gmail.com>
Date: Fri, 31 Mar 2023 17:22:27 +0300
In-Reply-To: <8a6d8107-436a-1b13-3799-59fa75c59635@gmail.com> (Matthias
	Brugger's message of "Thu, 30 Mar 2023 19:09:19 +0200")
Message-ID: <87r0t5atlo.fsf@kernel.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/26.1 (gnu/linux)
MIME-Version: 1.0
Content-Type: text/plain
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230331_072239_129365_D5FAC30B 
X-CRM114-Status: GOOD (  12.96  )
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
Cc: devicetree@vger.kernel.org, Ryder Lee <ryder.lee@mediatek.com>, netdev@vger.kernel.org, Sean Wang <sean.wang@mediatek.com>, linux-wireless@vger.kernel.org, Eric Dumazet <edumazet@google.com>, Rob Herring <robh+dt@kernel.org>, linux-kernel@vger.kernel.org, Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>, Paolo Abeni <pabeni@redhat.com>, linux-mediatek@lists.infradead.org, Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Jakub Kicinski <kuba@kernel.org>, Frank Wunderlich <linux@fw-web.de>, Shayne Chen <shayne.chen@mediatek.com>, Lorenzo Bianconi <lorenzo@kernel.org>, "David S. Miller" <davem@davemloft.net>, linux-arm-kernel@lists.infradead.org, Felix Fietkau <nbd@nbd.name>
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

Matthias Brugger <matthias.bgg@gmail.com> writes:

> On 07/02/2023 14:36, Krzysztof Kozlowski wrote:
>> On 07/02/2023 14:35, Frank Wunderlich wrote:
>>> From: Frank Wunderlich <frank-w@public-files.de>
>>>
>>> LEDs can be in low-active mode, driver already supports it, but
>>> documentation is missing. Add documentation for the dt property.
>>>
>>> Signed-off-by: Frank Wunderlich <frank-w@public-files.de>\
>>
>>
>> Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
>>
>
> Can you take that through your tree or are fine if I take it through mine?

It would be safest if Felix can take this to his tree, less conflicts
the better.

-- 
https://patchwork.kernel.org/project/linux-wireless/list/

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches

