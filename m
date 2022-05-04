Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7E7B6C4332F
	for <linux-mediatek@archiver.kernel.org>; Wed,  4 May 2022 08:11:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=RreJ8UOvPur53hEqsbxeLa/6VFOGWnUcAm+LYD0SB1E=; b=f4fQw16yhspq+A
	fnati69NcdJnHXwtQKsM2OowN9TJ+h+dMcvgX5c8fFqoKCAC9aGM8n/KjlyBDT3gkI9WDaL9OpIQn
	NBXE9wcb6SkJ2lFYJ0MRte22bNDSJKTruGOVW7xYUTD5fyVwWMOooeZQNQAbUTJ3X3Yn8x0qBfICa
	K2i+xUd99wRf8SyAi3MzF/3Nxg/Bq0e9YVpix0XTPjwuYAZ3Mn7FQAfohz4k60/2UtJhsJFQm2fte
	Tbz+OeVNujUP68TwtecDvEdxRUvyKHo8ZHfL0KMpIcRvd76dnF2II/YkdI1xWVa+HrAz0VkxsGRpZ
	7tWT9R01PvmyZFNne2Eg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nmA6J-009QL6-95; Wed, 04 May 2022 08:11:11 +0000
Received: from bhuna.collabora.co.uk ([46.235.227.227])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nmA69-009QIS-6G; Wed, 04 May 2022 08:11:02 +0000
Received: from [127.0.0.1] (localhost [127.0.0.1])
 (Authenticated sender: kholk11) with ESMTPSA id F2F821F43F34
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1651651859;
 bh=/jiZgVApvYyURKtaMltQCHC5vAnx+PmRgNJz/ENPruU=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=JcO/T9fmxesXuqmiI6lT/hvrrsBu0JKyDlpiOKBYugj0SO9wGtNrDasM/4dKi6Jk7
 Gc+/pyCdaj3tY0M8kxGsLHWm5xR/bBhRtFZ/2rxsPohMQPSebWR+/8CnHrZC3YWi9x
 jCTsltQcpeQEtvp3YpBTTX9DxQqEUbCToNIGPDHpjHpUteaaq3ogmjElAFiE3vLmHZ
 DmHIwqDJAeRvnW7vAi6Beao400bkL/S9C/5UDqfWxI/2Af1tj0jeLGvnDKkki5+nf6
 n/GVMOzOGQ+Dd6fVf0VuoQjOcpAzVTJAfr+lKoIvpBxSRj1K/yo7r0kNh00jFBi+3m
 5Qyev2BJjEo6w==
Message-ID: <8e0435e0-d871-c278-3362-d349cbd1f7c8@collabora.com>
Date: Wed, 4 May 2022 10:10:56 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
Subject: Re: [PATCH] arm64: dts: mt8192: Follow binding order for SCP registers
Content-Language: en-US
To: =?UTF-8?B?TsOtY29sYXMgRi4gUi4gQS4gUHJhZG8=?= <nfraprado@collabora.com>,
 Matthias Brugger <matthias.bgg@gmail.com>
Cc: kernel@collabora.com,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Rob Herring <robh+dt@kernel.org>, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-mediatek@lists.infradead.org
References: <20220503212531.2657870-1-nfraprado@collabora.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
In-Reply-To: <20220503212531.2657870-1-nfraprado@collabora.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220504_011101_399773_DD410238 
X-CRM114-Status: UNSURE (   9.27  )
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

SWwgMDMvMDUvMjIgMjM6MjUsIE7DrWNvbGFzIEYuIFIuIEEuIFByYWRvIGhhIHNjcml0dG86Cj4g
VGhlIGR0LWJpbmRpbmcgZm9yIFNDUCBkb2N1bWVudHMgdGhlIHJlZy1uYW1lcyBvcmRlciBhcyBz
cmFtLCBjZmcsCj4gbDF0Y20uIFVwZGF0ZSB0aGUgU0NQIG5vZGUgb24gdGhlIG10ODE5MiBkZXZp
Y2V0cmVlIHRvIGZvbGxvdyB0aGF0Cj4gb3JkZXIsIHdoaWNoIGdldHMgcmlkIG9mIGEgZHRic19j
aGVjayB3YXJuaW5nLiBUaGlzIGRvZXNuJ3QgY2hhbmdlIGFueQo+IGJlaGF2aW9yIHNpbmNlIHRo
ZSBTQ1AgZHJpdmVyIGFjY2Vzc2VzIHRoZSBtZW1vcnkgcmVnaW9ucyB0aHJvdWdoIHRoZQo+IG5h
bWVzIGFueXdheS4KPiAKPiBTaWduZWQtb2ZmLWJ5OiBOw61jb2xhcyBGLiBSLiBBLiBQcmFkbyA8
bmZyYXByYWRvQGNvbGxhYm9yYS5jb20+CgpOaWMsIHlvdSBuZWVkIGEgRml4ZXM6IHRhZyBvbiB0
aGlzIGNvbW1pdCwgcGxlYXNlIGFkZCBpdCBhbmQgc2VuZCBhIHYyIQoKQ2hlZXJzIQoKCl9fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCkxpbnV4LW1lZGlhdGVr
IG1haWxpbmcgbGlzdApMaW51eC1tZWRpYXRla0BsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9s
aXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtbWVkaWF0ZWsK
