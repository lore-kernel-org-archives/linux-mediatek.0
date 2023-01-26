Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A8911C54E94
	for <linux-mediatek@archiver.kernel.org>; Thu, 26 Jan 2023 08:48:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=6XW3Vuje/2r1Ueg4IAqdcZXSVe0LdzfnkCN8Ymnppl8=; b=n3mZ+x6JRe7s6Yk2kr5pcCTg3U
	AaaMv0kAQu6UpdXIFjU2ZK6/Utt2mrilwILLkrS+sJTidEv3o8yNl9kmnmqMZCg/0SehxHgS5orEw
	eRQdqtQfmc3qSqJ5KHep1uH/oX5Enc8z8zr4duFWJY9mQKBzeeMHLj246rH17ngClfgyVM1AaMZdu
	XBGBYkv0q2IxG6dDzrCKAL3t0EbAl+KzNwGMQ3f1kOkTVvsXHV4ZneFkVtB+v+A5lgX8KmyQvb5en
	Yhs20KpelKjYSWt+Piq3kFbyowyak/hggORbQXnJtEks2NcAQMhPkWggU4gj86jNQsiI24EKciLPQ
	O62p8pdw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pKxw4-00A63w-Ko; Thu, 26 Jan 2023 08:48:44 +0000
Received: from madras.collabora.co.uk ([46.235.227.172])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pKxpi-00A3XJ-88; Thu, 26 Jan 2023 08:42:11 +0000
Received: from [192.168.1.100] (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits))
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id 71FB86602D35;
	Thu, 26 Jan 2023 08:42:03 +0000 (GMT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1674722524;
	bh=OfAPBok58TgU/BxsU4JJcG3QhWdeaE/H5dGq/rET2eg=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=cIhElz/Zhd0YyetKRKGQehx+Rpn4FpYtDupY/Q3iQ5mlCug8Gp5/FMBvHJGZAeuC6
	 YgUTaKz6xI4GwKahM9Qds8vb8/YfciGj1ODgGqThbKxT5QOEC3YGlOhEuipeqIc2Jm
	 A98cZD4zuOVkfBt611XcgCClEfQoSzrx37tLyQQkx4e/zdST0AMMaxphPrpOuqO3qR
	 0BSzG7Y/DAhholiJSIZzkTGpnj/nUo2SUftJuxGU5bjOOMfwePaxSXtq28NtfBQrCs
	 JMTjqbqLxzETvIOknl0hB+Fx2PYP7kijAMwAtNSJwAltmrlUQU6ZXQ3BIBYFVMVXvr
	 6EbcvjV8crCBw==
Message-ID: <1684cd8a-5766-0bcb-3301-ce517d39c370@collabora.com>
Date: Thu, 26 Jan 2023 09:42:00 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.0
Subject: Re: [PATCH v1 0/6] MediaTek Frequency Hopping: MT6795/8173/92/95
Content-Language: en-US
To: Stephen Boyd <sboyd@kernel.org>, mturquette@baylibre.com
Cc: robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org,
 matthias.bgg@gmail.com, edward-jw.yang@mediatek.com,
 johnson.wang@mediatek.com, wenst@chromium.org, miles.chen@mediatek.com,
 chun-jie.chen@mediatek.com, rex-bc.chen@mediatek.com,
 jose.exposito89@gmail.com, linux-clk@vger.kernel.org,
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org,
 kernel@collabora.com
References: <20221222155147.158837-1-angelogioacchino.delregno@collabora.com>
 <5036f36916e12429d6f853049a2e5836.sboyd@kernel.org>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
In-Reply-To: <5036f36916e12429d6f853049a2e5836.sboyd@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230126_004210_549014_4777FFAF 
X-CRM114-Status: GOOD (  11.82  )
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

Il 26/01/23 03:07, Stephen Boyd ha scritto:
> Quoting AngeloGioacchino Del Regno (2022-12-22 07:51:41)
>> This series adds support for Frequency Hopping (FHCTL) on more MediaTek
>> SoCs, specifically, MT6795, MT8173, MT8192 and MT8195.
>>
>> In order to support older platforms like MT6795 and MT8173 it was
>> necessary to add a new register layout that is ever-so-slightly
>> different from the one that was previously introduced for MT8186.
>>
>> Since the new layout refers to older SoCs, the one valid for MT8186
>> and newer SoCs was renamed to be a "v2" layout, while the new one
>> for older chips gets the "v1" name.
>>
>> Note: These commits won't change any behavior unless FHCTL gets
>>        explicitly enabled and configured in devicetrees.
> 
> Can you resend this? It conflicts with your latest cleanup series.

Right. Sorry about forgetting to update this one - will rebase and
resend today.

Thanks!
Angelo

