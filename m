Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EF43BC433FE
	for <linux-mediatek@archiver.kernel.org>; Thu,  5 May 2022 08:17:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=kfgSHJ6iNY/yAV8kNbzZkg2WK+EVSksWwnKtscHPZhE=; b=RdNBMwoSwxtGLx
	UaGUhLv+oM03qFtGKs4kxLMNqpd3shrGCQsS9N/lo7hgbsXq06yrlRPBiwKT4G6SPh4+qXV1XVeXW
	YguMX8cJCdnxCfMEH0L+udyyY0gWtQqXqPBsfTX/fvKPjW6+ONB2XTszAnF07F4sB2IRKo0R5N+MF
	Zv4Bc590fT7XRpCi9B8fqJHoNbG2guYJXz8pw9KIswqwyYApn2sx3E0O6OhJGLU6VCUR4eC1Y3hg8
	79rOjjRXKgoqY3rQ7GYDK6UGS1Vji20dni2fvOdlCqsRQsgupGQhq0GBBOkoChKNKn6shERMO9a2V
	e0Gl5XkC82ouFqdbHbag==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nmWfi-00EcrF-3G; Thu, 05 May 2022 08:17:14 +0000
Received: from bhuna.collabora.co.uk ([46.235.227.227])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nmWfX-00EcmT-Oc; Thu, 05 May 2022 08:17:05 +0000
Received: from [127.0.0.1] (localhost [127.0.0.1])
 (Authenticated sender: kholk11) with ESMTPSA id 7C2B51F40639
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1651738622;
 bh=DltpyffxGCnMttOdjwga03qATyZuSIFzMUFN/jjVMRY=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=nThj+bzMWjxKwTmt2qlJ/+Owd47RE6aBL+lcRlbqO+6Q8laog1VGiax1adHrqQ2UG
 ohHy7GxJ8lXqaDdtBfTaqIqdsx6gB0RdnwitY+sB9EFsJU5X0Zyk0tOwGcUzWJB7fN
 XFVA7pWnLXDFWtciW5JvD0XcOl5V0j/8NMr1W2rHcd9GXUEZQ+Fyu4wcnYygDSfLJU
 LD9XrPpU9hR8B6C163mWihj7O0ccB7v4shL4Ind7r0/KHeMVe8r78+wImo4V0RZDWO
 ykRhYsU/zneisYpPwb0aW3aEbDMh0A53YS2tYscUvh0135amNgGhlI0qmQSaPfJqf+
 BzmEvbz+JNBqA==
Message-ID: <0b77cc7d-0595-504c-ab35-2850840dbdaf@collabora.com>
Date: Thu, 5 May 2022 10:16:59 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
Subject: Re: [PATCH v2] arm64: dts: mt8192: Follow binding order for SCP
 registers
Content-Language: en-US
To: =?UTF-8?B?TsOtY29sYXMgRi4gUi4gQS4gUHJhZG8=?= <nfraprado@collabora.com>,
 Matthias Brugger <matthias.bgg@gmail.com>
Cc: kernel@collabora.com, Allen-KH Cheng <allen-kh.cheng@mediatek.com>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Rob Herring <robh+dt@kernel.org>, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-mediatek@lists.infradead.org
References: <20220504214516.2957504-1-nfraprado@collabora.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
In-Reply-To: <20220504214516.2957504-1-nfraprado@collabora.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220505_011703_966395_E126E99C 
X-CRM114-Status: UNSURE (   8.47  )
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

SWwgMDQvMDUvMjIgMjM6NDUsIE7DrWNvbGFzIEYuIFIuIEEuIFByYWRvIGhhIHNjcml0dG86Cj4g
VGhlIGR0LWJpbmRpbmcgZm9yIFNDUCBkb2N1bWVudHMgdGhlIHJlZy1uYW1lcyBvcmRlciBhcyBz
cmFtLCBjZmcsCj4gbDF0Y20uIFVwZGF0ZSB0aGUgU0NQIG5vZGUgb24gdGhlIG10ODE5MiBkZXZp
Y2V0cmVlIHRvIGZvbGxvdyB0aGF0Cj4gb3JkZXIsIHdoaWNoIGdldHMgcmlkIG9mIGEgZHRic19j
aGVjayB3YXJuaW5nLiBUaGlzIGRvZXNuJ3QgY2hhbmdlIGFueQo+IGJlaGF2aW9yIHNpbmNlIHRo
ZSBTQ1AgZHJpdmVyIGFjY2Vzc2VzIHRoZSBtZW1vcnkgcmVnaW9ucyB0aHJvdWdoIHRoZQo+IG5h
bWVzIGFueXdheS4KPiAKPiBGaXhlczogYzYzNTU2ZWM2YmZlICgiYXJtNjQ6IGR0czogbXQ4MTky
OiBBZGQgU0NQIG5vZGUiKQo+IFNpZ25lZC1vZmYtYnk6IE7DrWNvbGFzIEYuIFIuIEEuIFByYWRv
IDxuZnJhcHJhZG9AY29sbGFib3JhLmNvbT4KCk5vdywgdGhhdCdzIHBlcmZlY3QhIFRoYW5rcyEK
ClJldmlld2VkLWJ5OiBBbmdlbG9HaW9hY2NoaW5vIERlbCBSZWdubyA8YW5nZWxvZ2lvYWNjaGlu
by5kZWxyZWdub0Bjb2xsYWJvcmEuY29tPgoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fCkxpbnV4LW1lZGlhdGVrIG1haWxpbmcgbGlzdApMaW51eC1tZWRp
YXRla0BsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxt
YW4vbGlzdGluZm8vbGludXgtbWVkaWF0ZWsK
