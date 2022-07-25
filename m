Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1FE9FC433EF
	for <linux-mediatek@archiver.kernel.org>; Mon, 25 Jul 2022 08:14:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=iBboTJFQ7hCZwgJddqH0AXJSkkgr91M4+fhDz84UcRY=; b=mHawaboWhb6OmQU3uR9gCQZ4l3
	4wq644P6HmDTtPJ7wfr1ytVOTUWbQYJwuhq+/hCGxxA4NFx/M0M7FDLk8nUUBi23I24gUzkyY6CY6
	hIsMLWFjpaeY1lHQXgSwcSFCGxbJkksAnltPNumn6zOMxV4x73zG3lum+pYPG8oTlXwDRlhkLJ5yo
	ENJthZtCMPACaoL0GnPqjZeNrP+kcZKMtMLmj2N/6YMPmUYcJT94z8AiaCe3MKszcO0ng3Fhil8VO
	i3n9c4H3eO6v/PWDhAcz7xNMqgMXZx3LSKj4HuU8ATjUa6wHeNHYKm1iSMm0IWVVI8kxb4CE8NFHH
	DtjEiBeg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oFtEL-006fuw-PF; Mon, 25 Jul 2022 08:14:21 +0000
Received: from madras.collabora.co.uk ([46.235.227.172])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oFtE5-006fhq-1g; Mon, 25 Jul 2022 08:14:10 +0000
Received: from [192.168.1.100] (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits))
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id 6B1B066015BF;
	Mon, 25 Jul 2022 09:14:01 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1658736842;
	bh=PpK61lKZbKQpFNRPAxrKTr/Fd+0s6I0u9aP/BeZ2hl4=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=aa4Lg2jdBb+mlYqsi3WUQi05qZ5Cl2mEGYIREWjW1FxdXvG8viLlXax10wz8RJbBG
	 +qOPiWFFYAiXS1/AAFgLjgwMqNlNnczTbRfqN8YzLBvc36mwHB4mLM8qvWYPR51GnO
	 4Bvg+rR1wUyVDNC3Y4iDtv8SecdX5Y5OvRIiFiYRur/FGcoYLrm4+FUNrA59qRmXQt
	 QYV16K9yheqLG39HyHdXTW9jsSriDEJkglprwQdqtp1yZi9kIBVU/ybGwT27Atz9G+
	 l2iB90RbrlL1ICh6x75vtltK1hbEJvizevzOU0om5uD1xQczrKPWcXmoj8DS5n1Hbg
	 bMUMI9zE8cQIQ==
Message-ID: <6d6d05cf-9c56-a29a-64cd-1de62c530167@collabora.com>
Date: Mon, 25 Jul 2022 10:13:58 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PATCH v6 4/8] dt-bindings: clock: mediatek: Add clock driver
 bindings for MT6795
Content-Language: en-US
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>, sboyd@kernel.org
Cc: mturquette@baylibre.com, robh+dt@kernel.org,
 krzysztof.kozlowski+dt@linaro.org, matthias.bgg@gmail.com,
 p.zabel@pengutronix.de, y.oudjana@protonmail.com, jason-jh.lin@mediatek.com,
 ck.hu@mediatek.com, fparent@baylibre.com, rex-bc.chen@mediatek.com,
 tinghan.shen@mediatek.com, ikjn@chromium.org, miles.chen@mediatek.com,
 sam.shih@mediatek.com, wenst@chromium.org, bgolaszewski@baylibre.com,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org,
 linux-clk@vger.kernel.org, konrad.dybcio@somainline.org,
 marijn.suijten@somainline.org, martin.botka@somainline.org,
 ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org,
 paul.bouchara@somainline.org, kernel@collabora.com
References: <20220722090609.52364-1-angelogioacchino.delregno@collabora.com>
 <20220722090609.52364-5-angelogioacchino.delregno@collabora.com>
 <8d656940-567f-d8ea-8cb1-4ca37dde3e0c@linaro.org>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
In-Reply-To: <8d656940-567f-d8ea-8cb1-4ca37dde3e0c@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220725_011405_268310_876E851B 
X-CRM114-Status: GOOD (  12.10  )
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

Il 23/07/22 22:45, Krzysztof Kozlowski ha scritto:
> On 22/07/2022 11:06, AngeloGioacchino Del Regno wrote:
>> Add the bindings for the clock drivers of the MediaTek Helio X10
>> MT6795 SoC.
>>
>> Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
>> ---
>>   .../bindings/clock/mediatek,mt6795-clock.yaml | 66 +++++++++++++++++++
>>   .../clock/mediatek,mt6795-sys-clock.yaml      | 54 +++++++++++++++
>>   2 files changed, 120 insertions(+)
>>   create mode 100644 Documentation/devicetree/bindings/clock/mediatek,mt6795-clock.yaml
>>   create mode 100644 Documentation/devicetree/bindings/clock/mediatek,mt6795-sys-clock.yaml
> 
> You already got a review tag, didn't you? In v5?
> 
> 

I'm sorry, yes I got Rob's review tag in v5 and I somehow forgot to add
it to v6 :-(

Should I send a v7 for adding back the tag?

Angelo

