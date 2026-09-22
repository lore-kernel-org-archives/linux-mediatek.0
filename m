Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7DDAAC982FF
	for <linux-mediatek@archiver.kernel.org>; Tue, 22 Sep 2026 11:45:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=B9E+tSiE5gamJRa3nnskUrcmfwBD9MSKvbBFMXab1FU=; b=KzYm/xrU2nqnHtqLy3DsDfMvk5
	6KT37Go7IjCeGuGJ3hKOSc0ZXqSLjvoVWIXyAlovKM5xHpBI7n6lbrhct0wN7fW9MRqaCHbaRtRxl
	bIyfXRnXUAIEhnPF7MXWSCEorcfgdH1oUWlvwRi4IsCro1FnkzWitaSUN+QOx4bj0dVKBPKtgPmON
	lxbxRtbHObNkHB2HHKHwPwo/SXCpVR1uTdcYdc6Ox3ATVLXt9ie2p3ZW3cbk602S72pbvevoIP9mB
	3CqSTwooeYG8VlhLDHO4A7Ruyf5KRsGrN1bIQXOjbL7y7FJDhyzeswFtmQbbdM43OstA7J/LSWqtn
	tWplYOkw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x8yvy-00000005E1j-1PX2;
	Tue, 22 Sep 2026 11:45:14 +0000
Received: from bali.collaboradmins.com ([2a01:4f8:201:9162::2])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x8yvn-00000005Drl-2sxG;
	Tue, 22 Sep 2026 11:45:04 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1790077501;
	bh=AHja0yD4FyL0JwKbB6XFciBZB94zl2qabSHyLFZXFVE=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=aItl/kePLT0RGvrMpaIGUQWlm29K+JRifvpDPls512jxIZHkYVWWrqAGnDLB/BpAl
	 LnlA3EscDtfZQVru+fs7Q6ZR7jpbUrVDggMZ0exEc5hqSPpVhFlNW3a474fw7kQrdK
	 2xSAqhT1Arhj0EJoFXWOBjDrdBIdK6GZmNLSitWU6jkvawSuaqjNWSnOchPr9iJ510
	 3o6WfToEEPFKE2C3H2wJo60feQnQpNMj9iOtwVuvotEDWMuWSOeGeC96h+LNA8+3VP
	 h1k+6aZ5+2SQ6rOcF/dpUgHnHKGz44Q/k7tC3WgH3Pj0UP0Mi3jYiqQd9xHUmVCCpA
	 Iq4NPK7d6ZSLA==
Received: from [100.64.1.21] (unknown [100.64.1.21])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange x25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id E8A9817E05F4;
	Tue, 22 Sep 2026 13:45:00 +0200 (CEST)
Message-ID: <113f8bb3-2f50-43c6-b552-8bcd22b41dd5@collabora.com>
Date: Tue, 22 Sep 2026 13:45:00 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] dt-bindings: mfd: mediatek: Allow MT6357 ADC
To: "Rob Herring (Arm)" <robh@kernel.org>, Lee Jones <lee@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>,
 Flora Fu <flora.fu@mediatek.com>, Alexandre Mergnat <amergnat@baylibre.com>
Cc: mfd@lists.linux.dev, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org
References: <20260921232632.3131680-1-robh@kernel.org>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Content-Language: en-US
In-Reply-To: <20260921232632.3131680-1-robh@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260922_044503_881813_9C674B91 
X-CRM114-Status: UNSURE (   6.30  )
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

On 9/22/26 01:26, Rob Herring (Arm) wrote:
> MT6357 PMIC nodes can contain an adc child using the MT6359 AUXADC
> binding. Add the child node reference so the ADC subnode is evaluated
> instead of rejected.
> 
> Assisted-by: LLM
> Signed-off-by: Rob Herring (Arm) <robh@kernel.org>

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>


