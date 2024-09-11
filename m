Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E568FEE4995
	for <linux-mediatek@archiver.kernel.org>; Wed, 11 Sep 2024 11:26:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=jc9gYcUcp5vQnmFINTwhZEaI0mHlk7/CzyjZ7SDbDmY=; b=YBvbJRYYjzZv8+fXDcTGDpCRzT
	mLU8AJEZJccen8TNG0jnqocwK2PyzzYlYfruPZCrHitf+x1evavykUWurBBI9saifPs4+3LD0TR8w
	9Hp/wS9Mttlw/pZ1cRk80fW7a9Wdks3i5hkq7FvYf4Xmq93N/XNrgnXmkuFgQ89iwIPAqoBaUWsmA
	26ALxD0EUzdQ8npM6Q1VqGJsac5jnwSoxWlepq7MTWL8XlV5vLfYnNqNQ+L2xCPJJGbNUqHDYsMKg
	EHwZV6iDBcBid3KNRCa7gHGY0LrQjLKuqdppj6AhzZSU67idiAjAKbkGkWxTd4Qz4Kcql7Vt9i0Fl
	OrHs/DXg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1soLUR-00000009HoN-2cfD;
	Wed, 11 Sep 2024 11:26:27 +0000
Received: from a7-28.smtp-out.eu-west-1.amazonses.com ([54.240.7.28])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1soLSP-00000009HLT-2Fyr;
	Wed, 11 Sep 2024 11:24:23 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=4232tfv5ebdrjdwkr5zzm7kytdkokgug; d=collabora.com; t=1726053857;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:In-Reply-To:Content-Type:Content-Transfer-Encoding;
	bh=RMpu566YYspzP9NcOkcHAFQ/BsitzMN8+Vu1+ORfENY=;
	b=LRLf2EKPY8/zZATtOTbG4Yryele6y6nUp8cTng1kY16vrISF0Yhrr6NTVtK+Vgdm
	R9RNRxPr4OzzjvVa2koxj5Jjsk59ALqR2yaGFmHyy5qpT0TiVHDwWTvR9D1d+ieWZjZ
	hTFyiRx+ScdhinW0uaTL2K3tM0bxHpktQ7qcbImz98wH8rCL7aWecdzFICwvMIP6Upy
	5dznvwVkWDUzMlvBcDZbVkxssWZCzLGhhOb6vac6AHV5ttKMackeOjsaXHdleq50WxB
	8j8liImGQmqaO9hq1+RjYpVr0WMnfJPn1QjJnKIavNqUj/cws48SreJbJ790lh7GDha
	IMWPCUHiRQ==
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=uku4taia5b5tsbglxyj6zym32efj7xqv; d=amazonses.com; t=1726053857;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:In-Reply-To:Content-Type:Content-Transfer-Encoding:Feedback-ID;
	bh=RMpu566YYspzP9NcOkcHAFQ/BsitzMN8+Vu1+ORfENY=;
	b=REU56YHkf3SsQya5foYO2CxYuo7HgLZ9gvwqbqwP2Cja2SLQ3cR/c6A6DoG1ubG0
	ZnSNMqNXm5ue/JIcV9wp9pPBFC1GdV1eXPuQDvhp5QAmBNWAhX3126vW3LpBgzCrGKl
	f1et3Rj2cP6svl3MFVZL8/XPCXhgrcxtty7dGwrY=
Message-ID: <01020191e0d3b9ef-b15d5d4b-c167-48ff-b34d-ed3cc10b3555-000000@eu-west-1.amazonses.com>
Date: Wed, 11 Sep 2024 11:24:17 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 3/8] arm64: dts: mediatek: mt8188: Add CPU performance
 controller for CPUFreq
To: Fei Shao <fshao@chromium.org>, Matthias Brugger <matthias.bgg@gmail.com>
Cc: Conor Dooley <conor+dt@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Rob Herring <robh@kernel.org>, devicetree@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	linux-mediatek@lists.infradead.org
References: <20240911105131.4094027-1-fshao@chromium.org>
 <20240911105131.4094027-4-fshao@chromium.org>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Content-Language: en-US
In-Reply-To: <20240911105131.4094027-4-fshao@chromium.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Feedback-ID: ::1.eu-west-1.YpP9ZbxnARFfy3Cb5pfsLd/pdsXBCNK0KEM7HforL4k=:AmazonSES
X-SES-Outgoing: 2024.09.11-54.240.7.28
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240911_042421_925009_ABCB4A9D 
X-CRM114-Status: UNSURE (   4.85  )
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

Il 11/09/24 12:51, Fei Shao ha scritto:
> Add performance controller node and performance-domains properties for
> CPUFreq support on MT8188 SoC.
> 
> Signed-off-by: Fei Shao <fshao@chromium.org>

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>



