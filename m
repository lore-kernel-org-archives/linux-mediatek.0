Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CD59EC433F5
	for <linux-mediatek@archiver.kernel.org>; Mon, 23 May 2022 10:23:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=gZObb79Dt3zmu2GJeMqyLMQRPp5+3M9nVVooDZy9RUA=; b=upFJ8MZmHXUvq7
	cjTCcYVGeGXhFG0aZngupplvWW9QvTLle0Y58Wx9OphtLG/wx1jqn4bHjVg8eK2NO87vkHecxOvQP
	0B78gLfgqB9VviuxaoqbiRRGFaJjJ2l4lU7s5UUKYLLXBrH97hu1tNQcqs3upvyrtFjMANoykGDMH
	tBD4SxDaPqmQ9LFstrobP+KnDoKekRoTzO2Jl8Q8L121l1miYiwKoTCrrV4mLMEs9iZW9b44y9jS8
	FQUA7XS4jhhNJNaidLxY4fiJuN6Wur6LxtdQSo21L9x5J4XKuIvI7Fj7c6bu26dFr3IF4nqw+290O
	hmsK8QDLlZiu85wwd0zA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nt5DV-003CnN-Q6; Mon, 23 May 2022 10:23:13 +0000
Received: from bhuna.collabora.co.uk ([46.235.227.227])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nt40k-002gxZ-E9; Mon, 23 May 2022 09:05:59 +0000
Received: from [127.0.0.1] (localhost [127.0.0.1])
 (Authenticated sender: kholk11) with ESMTPSA id E49261F426EC
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1653296756;
 bh=oHX6Oa0zn9w/29wsm4kiFu/0J+uT7hELazl/urkOVls=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=ZtLnLgxN9JOdZHJx0bXUekgWwX/E90i174BSK9Gx0h8X26u45N91FSZZyupj3qoAZ
 ZTppOG2uRkrdGlz5THIUaV0Q0854xONUmU/g8wo0jqA9o1K6Gy0OpqWm1UQPSrCIWE
 NWKRVq8T7UH4n7lJmCCoA+l9Z8ZbxbMvB+M5LZPUzbFNF5gqoM9C9sYZw3k+h8lGz5
 hWeTUhhAbn5Lk2p/KbeHtjwYH0BRTw1+QbbQe3i/UojawbQP1pUUtpzX5v0D3ymk8v
 EBvcHI6D+aYhyZSClqGrmmaL6q7qoxWiH+rlcKVg2w68e/+zM6kiIM80fkdpYynPvc
 MBfrOjeuK1jVw==
Message-ID: <be340e39-ffd4-63ec-ec91-ea4f7a475650@collabora.com>
Date: Mon, 23 May 2022 11:05:53 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.0
Subject: Re: [PATCH v8 17/19] dt-bindings: reset: mediatek: Add infra_ao reset
 index for MT8186
Content-Language: en-US
To: Rex-BC Chen <rex-bc.chen@mediatek.com>, mturquette@baylibre.com,
 sboyd@kernel.org, matthias.bgg@gmail.com, robh+dt@kernel.org,
 krzysztof.kozlowski+dt@linaro.org
Cc: p.zabel@pengutronix.de, nfraprado@collabora.com,
 chun-jie.chen@mediatek.com, wenst@chromium.org, runyang.chen@mediatek.com,
 linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
 linux-clk@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org,
 Project_Global_Chrome_Upstream_Group@mediatek.com
References: <20220523060056.24396-1-rex-bc.chen@mediatek.com>
 <20220523060056.24396-18-rex-bc.chen@mediatek.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
In-Reply-To: <20220523060056.24396-18-rex-bc.chen@mediatek.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220523_020558_702731_348F60C8 
X-CRM114-Status: UNSURE (   6.23  )
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
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

SWwgMjMvMDUvMjIgMDg6MDAsIFJleC1CQyBDaGVuIGhhIHNjcml0dG86Cj4gVG8gc3VwcG9ydCBy
ZXNldCBvZiBpbmZyYV9hbywgYWRkIHRoZSBpbmRleCBvZiBpbmZyYV9hbyByZXNldCBvZgo+IHRo
ZXJtYWwvc3ZzIGZvciBNVDgxODYuCj4gCj4gU2lnbmVkLW9mZi1ieTogUmV4LUJDIENoZW4gPHJl
eC1iYy5jaGVuQG1lZGlhdGVrLmNvbT4KPiBBY2tlZC1ieTogUm9iIEhlcnJpbmcgPHJvYmhAa2Vy
bmVsLm9yZz4KPiBSZXZpZXdlZC1ieTogTsOtY29sYXMgRi4gUi4gQS4gUHJhZG8gPG5mcmFwcmFk
b0Bjb2xsYWJvcmEuY29tPgo+IFRlc3RlZC1ieTogTsOtY29sYXMgRi4gUi4gQS4gUHJhZG8gPG5m
cmFwcmFkb0Bjb2xsYWJvcmEuY29tPgoKUmV4LCBzb3JyeSBidXQgeW91J3ZlIHByb2JhYmx5IG1p
c3VuZGVyc3Rvb2QgTmljb2xhcycgVGVzdGVkLWJ5Li4uIGhlIGhhcwp0ZXN0ZWQgdGhlc2Ugb24g
TVQ4MTkyLCBzbyBoaXMgVC1iIHRhZyBpcyBub3QgYXBwbGljYWJsZSB0byBNVDgxODYsIE1UODE5
NS4KCkFueXdheToKClJldmlld2VkLWJ5OiBBbmdlbG9HaW9hY2NoaW5vIERlbCBSZWdubyA8YW5n
ZWxvZ2lvYWNjaGluby5kZWxyZWdub0Bjb2xsYWJvcmEuY29tPgoKCl9fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCkxpbnV4LW1lZGlhdGVrIG1haWxpbmcgbGlz
dApMaW51eC1tZWRpYXRla0BsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRl
YWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtbWVkaWF0ZWsK
