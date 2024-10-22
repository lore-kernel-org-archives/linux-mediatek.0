Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8B253D2C56C
	for <linux-mediatek@archiver.kernel.org>; Tue, 22 Oct 2024 15:22:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=uYn+tMG4GVqqfOwDPzHIelPhxrPgAsAwaL9m76ws128=; b=seruicSqqhlXhoP9d1jXAfXUrs
	ybCtiZv6/jzPcRRiAz5xZ6oTe2fLfiHlHizq+bt6vYYRdfCQC6cECN1Wlfks4qgFLdwE/s+M7RsPU
	mnV9Tc003H/NjVy23FWY6F21KVrrjRgFGLKIYOfmWsBycISoXHiedrX1ml+fwEUkqa2c+6m2oBzfk
	uU0DFupJ8fhxKjWm3gH5kpJRI/rpewYYTYTsU8e81sxCf3zBoKnxAgWzmAcwXJZRX/60yU+Lzm9mH
	PeYmRlekVxThMhtFsqJv21T4ELAk6OVZMoLHTzMWunPVCYtKAFOXJpqh/SEtPGKYRCD9Hse+nkdn5
	bZD1UYCA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t3Gi8-0000000BER6-4ALe;
	Tue, 22 Oct 2024 15:22:17 +0000
Received: from bali.collaboradmins.com ([2a01:4f8:201:9162::2])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t3Ggc-0000000BEDo-1HZa;
	Tue, 22 Oct 2024 15:20:43 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1729610439;
	bh=TwfpQeZmZ+rcslK8qsLTLEO2Zb35RXe/CpYrY92DukQ=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=Z9BmMrqz50fGNS5L5EZg84WndU6dfFmORLG4UVGVhYyaoAwMPcXrxeZ77dd0FUVcx
	 ndhCjwhf5loUo7eoYwmiLdKFW3QATT5aFJAwwy0IPYV8ZYJ9uJQNh0p+DFF94ktRhk
	 gNYY05w7PF217d5S1cf0TwBwGXbv+JUnRXbVbPEIyZ1zdWsMeYgdLpsEq5peKgOOOW
	 hrEgnGteGgmLxghAwZEVNQOG3slilWGwzbXqcP9KqaWbgmuPrdfiSqgzz7m1AbO7yM
	 342Cl26waHV8rgqYG96HoiwLQHouMe8aoEjRSF/DqlACsG8ztoMpxdAowqz9MDqb0/
	 n3U0o10WfBU1w==
Received: from [192.168.1.100] (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id CBB1B17E362C;
	Tue, 22 Oct 2024 17:20:38 +0200 (CEST)
Message-ID: <74f0a0ac-4236-45d4-bd1b-327227341230@collabora.com>
Date: Tue, 22 Oct 2024 17:20:38 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 4/6] mfd: mt6397: Add initial support for MT6328
To: Yassine Oudjana <yassine.oudjana@gmail.com>
Cc: Dmitry Torokhov <dmitry.torokhov@gmail.com>, Rob Herring
 <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Sen Chu <sen.chu@mediatek.com>,
 Sean Wang <sean.wang@mediatek.com>, Macpaul Lin <macpaul.lin@mediatek.com>,
 Lee Jones <lee@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>,
 Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
 jason-ch chen <Jason-ch.Chen@mediatek.com>,
 Chen Zhong <chen.zhong@mediatek.com>, Flora Fu <flora.fu@mediatek.com>,
 Alexandre Mergnat <amergnat@baylibre.com>,
 Yassine Oudjana <y.oudjana@protonmail.com>, linux-input@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-pm@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org
References: <20241018081050.23592-1-y.oudjana@protonmail.com>
 <20241018081050.23592-5-y.oudjana@protonmail.com>
 <9fbe6e8e-623a-4c8c-b6ea-c3aea8a5a56d@collabora.com>
 <CENPLS.CE17IF58CL3J@gmail.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Content-Language: en-US
In-Reply-To: <CENPLS.CE17IF58CL3J@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241022_082042_537376_0C502446 
X-CRM114-Status: GOOD (  15.84  )
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

Il 21/10/24 16:39, Yassine Oudjana ha scritto:
> 
> On Mon, Oct 21 2024 at 15:24:54 +02:00:00, AngeloGioacchino Del Regno 
> <angelogioacchino.delregno@collabora.com> wrote:
>> Il 18/10/24 10:10, Yassine Oudjana ha scritto:
>>> From: Yassine Oudjana <y.oudjana@protonmail.com>
>>>
>>> The MT6328 PMIC is commonly used with the MT6735 SoC. Add initial
>>> support for this PMIC.
>>>
>>> Signed-off-by: Yassine Oudjana <y.oudjana@protonmail.com>
>>
>> You're sending this from another email... and you have to add or change the signoff
>> to the other email....
> 
> I was using that email for a while to send patches but then I started having issues 
> with it so I switched to the current email. Since I already had the old email in a 
> few places in MAINTAINERS and I was always signing off with it I kept doing so 
> while sending with the new email. I had this conversation with another maintainer 
> when I first switched and they suggested that I add the From tag with the same 
> email as the signoff, and I've been doing that ever since and it has been fine.
> 

Fine then :-)

Cheers,
Angelo

