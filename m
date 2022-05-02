Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D0534C433EF
	for <linux-mediatek@archiver.kernel.org>; Mon,  2 May 2022 08:36:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ucs0RMkiSTZfgWQh8Iq4RmShBZCgwYCooClkuaxnZIs=; b=FiTsLEaDvSyrGm
	YPjZCHicSqSfYAAeXUJuS8K3y/L9+TbNEkRUKm014bjbMaWIdqx4fdUUGnSQCLdJhCtxCf5Rc9bKy
	PSao566JgAp5mvHBAJP5b7s+Vo9zymGM1msz/fWwi4tqXDJ1+ySo7ggPfbFMfIDqT34Z1AHuebRxJ
	8nbFhWdTQqkzsgJDjfVd6OPUZ/hhmaIDMxm1lY6fKcmuDo+yJDn/45tLUMHO+TXfD9yaJJVr/ZCyZ
	JoGSHx2Y7vq/okP/oE+qu0kucqJUsDtgX4HWXCq6SktBuAErwe3kvNq/5MNlmKZsvgKnHtYYWzf2+
	7P8s1dvRCfND2aKXA7PQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nlRXK-000O5f-H0; Mon, 02 May 2022 08:36:06 +0000
Received: from bhuna.collabora.co.uk ([46.235.227.227])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nlRX4-000Ny8-Jw; Mon, 02 May 2022 08:35:52 +0000
Received: from [127.0.0.1] (localhost [127.0.0.1])
 (Authenticated sender: kholk11) with ESMTPSA id E4C091F43168
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1651480545;
 bh=YK5wEWWh4YB18B3xRcTLM7iC/xzpNYQAc6MMPQjZcL4=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=d4iomLv7VXVraLDf9rRyQDMz8zbCBQKO0YEGXzQgzurDCIBs4jZKnKVKSXEfuiNQe
 lEJuO5CaN1vCLqDm9OgjPddNB2b4AgvNB4Neinbx4lzTfYu4aKLzm6mqyCmiO4uiAH
 SrkNHK0Mw78sj0fo+xu30tQy37IV+Y20KJzR09ifZB/lllbbzZrg2Z8m+LLJ19al+c
 Wlwz609I5ckr7OWkhLnuXZ/BAhzM8fry87sg0k3fe3mXyoqDH/Sb0eRMx0VWI3VOhs
 yJBK9avsEaHV3pe1D9xx2Wwk55i6zwKF8EDeZutPYsh78ZpjfPLbzqywdOgv6hiiE0
 lHTRyzRwproGg==
Message-ID: <520ebc55-448f-c23e-ee1d-bbf0d46e6fb7@collabora.com>
Date: Mon, 2 May 2022 10:35:41 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
Subject: Re: [PATCH] arm64: dts: mediatek: Add fallback compatible for
 mt8192's flash
Content-Language: en-US
To: =?UTF-8?B?TsOtY29sYXMgRi4gUi4gQS4gUHJhZG8=?= <nfraprado@collabora.com>,
 Matthias Brugger <matthias.bgg@gmail.com>
Cc: kernel@collabora.com,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Rob Herring <robh+dt@kernel.org>, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-mediatek@lists.infradead.org
References: <20220429195745.2203461-1-nfraprado@collabora.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
In-Reply-To: <20220429195745.2203461-1-nfraprado@collabora.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220502_013550_928832_20F47608 
X-CRM114-Status: UNSURE (   9.29  )
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

SWwgMjkvMDQvMjIgMjE6NTcsIE7DrWNvbGFzIEYuIFIuIEEuIFByYWRvIGhhIHNjcml0dG86Cj4g
VGhlIGR0LWJpbmRpbmcgZm9yIE1lZGlhdGVrJ3MgU1BJIE5PUiBmbGFzaCBjb250cm9sbGVyIGV4
cGVjdHMgYSBtdDgxNzMKPiBmYWxsYmFjayBjb21wYXRpYmxlIGZvciBtdDgxOTIsIHNvIGFkZCBp
dCBpbiBtdDgxOTIuZHRzaS4KPiAKPiBUaGUgZHJpdmVyIGFscmVhZHkgc2V0cyBjdXN0b20gZGF0
YSBiYXNlZCBvbiB0aGUgbXQ4MTkyIGNvbXBhdGlibGUsIHNvCj4gdGhpcyBmYWxsYmFjayBjb21w
YXRpYmxlIHdvbid0IGJlIHVzZWQgYW5kIGlzIGFkZGVkIHB1cmVseSB0byBzdXBwcmVzcwo+IHRo
ZSBkdC1iaW5kaW5nIHdhcm5pbmcuCj4gCj4gU2lnbmVkLW9mZi1ieTogTsOtY29sYXMgRi4gUi4g
QS4gUHJhZG8gPG5mcmFwcmFkb0Bjb2xsYWJvcmEuY29tPgoKUmV2aWV3ZWQtYnk6IEFuZ2Vsb0dp
b2FjY2hpbm8gRGVsIFJlZ25vIDxhbmdlbG9naW9hY2NoaW5vLmRlbHJlZ25vQGNvbGxhYm9yYS5j
b20+CgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTGlu
dXgtbWVkaWF0ZWsgbWFpbGluZyBsaXN0CkxpbnV4LW1lZGlhdGVrQGxpc3RzLmluZnJhZGVhZC5v
cmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1tZWRp
YXRlawo=
