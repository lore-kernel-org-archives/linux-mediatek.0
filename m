Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9C51AD26D70
	for <linux-mediatek@archiver.kernel.org>; Fri,  9 Jan 2026 16:31:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=L/RbSJSKXBhaXJeMQUoZiZUf/Lpx97n5lCjhw1lv7B8=; b=i/dpOJCsAnBvdacI0JHRkhjXTU
	zrFi36TzYYouTFb0/uNEn4lt4O3Wo9+a/VI7t5mWbDj9iQ5x4NfJmeM0hsJ/yPg4xcFdIxw6vJHkU
	tQxI6nODhM9ZugrNzCSq+9w/I07nDzrhc4FXg9se9SYzdzX8o8I54OQJFabG8gPQLDl0zSXLw2CyS
	j98rDusN1/QjRQ0TLUuDSNK8YqTG1nQQ78bl1VOz/Fk+wyvIWSi4TRHBdPdDsS2RQWe+hC9LwIGpU
	d7x2RUD+6jjYio/GPpJTZuyRgWdgV0ulJazJS/IsqAG4kKRstHvtAn7AUTC704XWHJSaLjDdG9ps7
	vsCAZzKg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1veFO9-00000002cxk-0f9U;
	Fri, 09 Jan 2026 16:31:01 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1veFO6-00000002cwd-0hb1;
	Fri, 09 Jan 2026 16:30:59 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 0265840B92;
	Fri,  9 Jan 2026 16:30:57 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 41805C4CEF1;
	Fri,  9 Jan 2026 16:30:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1767976256;
	bh=2nnt/RAhlgbAIoBNQy+A3kflDIjfGtjH4Wnd7s6M8kw=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=UyAC+vU+9kTM3F3DIAqpZNoxKIwucU61mm4w4acu6wPdZG7r3KXTf8HeOpkdj4eT8
	 avvUauUPHyg68/2LA3Xl+TzZxH25duQUw1H63Je8lBAUqmDmHqpzt0tqgqDNWCMC1H
	 ds/RhaB9n3WWX56kWMvXJvqBobLFe6qmJajCyT4+OjsWEavKJa8pzRfPGafbkJEkzY
	 fm4n26h+V5sPrnpKu5jiPEjYxxBUg6xyzmFkf4W+Vis6i/rUU6u7nU7lL2GOqYAEad
	 EBuYTTXUcrYHXFNoY4X25KQSF0bFI2xj3nmJryqjMkhB0Ten4BA+rKKakvWQa1+ouk
	 gPv38Zj3aMlRA==
Message-ID: <3905bda3-169f-45d8-bdec-c199f226d45f@kernel.org>
Date: Fri, 9 Jan 2026 18:30:49 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 11/13] interconnect: mediatek: Add support for MediaTek
 MT8196 EMI ICC
To: Nicolas Frattaroli <nicolas.frattaroli@collabora.com>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Matthias Brugger
 <matthias.bgg@gmail.com>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 Henry Chen <henryc.chen@mediatek.com>
Cc: kernel@collabora.com, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org, linux-pm@vger.kernel.org
References: <20251124-mt8196-dvfsrc-v2-0-d9c1334db9f3@collabora.com>
 <20251124-mt8196-dvfsrc-v2-11-d9c1334db9f3@collabora.com>
From: Georgi Djakov <djakov@kernel.org>
Content-Language: en-US
In-Reply-To: <20251124-mt8196-dvfsrc-v2-11-d9c1334db9f3@collabora.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260109_083058_231584_9FA76245 
X-CRM114-Status: GOOD (  10.43  )
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

On 11/24/25 1:07 PM, Nicolas Frattaroli wrote:
> From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
> 
> Add a new driver with data to register the External Memory
> Interface (EMI) Interconnect on the MediaTek MT8196 Chromebook
> SoC.
> 
> Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
> Signed-off-by: Nicolas Frattaroli <nicolas.frattaroli@collabora.com>

The interconnect patches look good to me and there is no build dependency,
so i picked them. On a side note, we recently added support for dynamic
node ids in the framework, so maybe switch to that in the future.

Thanks!
Georgi

> ---
>   drivers/interconnect/mediatek/Kconfig  |   7 +
>   drivers/interconnect/mediatek/Makefile |   1 +
>   drivers/interconnect/mediatek/mt8196.c | 383 +++++++++++++++++++++++++++++++++
>   3 files changed, 391 insertions(+)
> 

