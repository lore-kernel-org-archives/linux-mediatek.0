Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A869CC433F5
	for <linux-mediatek@archiver.kernel.org>; Mon,  2 May 2022 08:41:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=WBtq55lxUj1SwtPl+CZ30g4EES8vYAS4cl2s2UzwDE8=; b=fbxVgX6JKujS0i
	GnkhwpBrxWi6cn68zcdlFs6W959LAMd3xeInPK04RbOLzmJ9hwLQl8gzTAZKJAvcGPaQkQGWeFJ1J
	c9ODnkfoyM5GzQ6s6DbhYkDEYJvIUgk58VrNJFqJtLBkyXxFvYNQxexwAqfINWVCd3ez5wSPbdwt7
	6o4Lkb949uDiFhZ1ka1qDWEZ10oF2CMDc550Ycok7vPBWHZ0frZVJB+tkcYz7R57v+Mh5u13HtIxw
	Dxhcz1JM5OZ+PGBAImZRxYgRXlZG7hXRNOifkZpq5OjMHxeldn+6gY9OOvQhz2EeO7UNj5i3bQeWJ
	QLm1ftMK/H5Q17Kww37A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nlRc0-000Q2Y-VB; Mon, 02 May 2022 08:40:56 +0000
Received: from bhuna.collabora.co.uk ([46.235.227.227])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nlRbg-000PsR-HO; Mon, 02 May 2022 08:40:38 +0000
Received: from [127.0.0.1] (localhost [127.0.0.1])
 (Authenticated sender: kholk11) with ESMTPSA id A72391F403D6
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1651480835;
 bh=D8YJoc2PcRQjfbBcH+ipLbCMGp+67jgyWRLQdA5wU+s=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=eZD9I7wAOF04f5zspCYpe65S9Eff6SOO/P1vrulREbaNgS3u4xjfQwNN0Xg9jfUWl
 u/hph2fpECj1BcIARGI8l++FijaIqEPW/EFarfvY0FApsLceAotL2mk9o1SFZl4AF9
 uD07tMnmYx2dZa6qNVx9CSeSJlhqSOWTrE0G6aB+uKTmi34TocvgUAJRD5R6cGpDyJ
 3PxGoeqkD2ulgsLtZgX2v9VNhBI3KLZmB3UrKRSb3DCw5BbncAq782jJFNSkXI9Iup
 s7T3rKRFYC5kT5+WVi6EIKc1alhQikleCHWrxe0i1Fpvi4DNXA7UVLY1Pp5ZtVEEeA
 0SKIEJlkNE8oQ==
Message-ID: <0b7101ec-96a2-cb02-7026-aa706dfef4cf@collabora.com>
Date: Mon, 2 May 2022 10:40:32 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
Subject: Re: [PATCH 2/2] dt-bindings: remoteproc: mediatek: Add optional
 memory-region to mtk,scp
Content-Language: en-US
To: =?UTF-8?B?TsOtY29sYXMgRi4gUi4gQS4gUHJhZG8=?= <nfraprado@collabora.com>,
 Bjorn Andersson <bjorn.andersson@linaro.org>
Cc: kernel@collabora.com,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Mathieu Poirier <mathieu.poirier@linaro.org>,
 Matthias Brugger <matthias.bgg@gmail.com>, Rob Herring <robh+dt@kernel.org>,
 Tinghan Shen <tinghan.shen@mediatek.com>, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-mediatek@lists.infradead.org, linux-remoteproc@vger.kernel.org
References: <20220429211111.2214119-1-nfraprado@collabora.com>
 <20220429211111.2214119-3-nfraprado@collabora.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
In-Reply-To: <20220429211111.2214119-3-nfraprado@collabora.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220502_014036_782053_0996B116 
X-CRM114-Status: UNSURE (   7.68  )
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

SWwgMjkvMDQvMjIgMjM6MTEsIE7DrWNvbGFzIEYuIFIuIEEuIFByYWRvIGhhIHNjcml0dG86Cj4g
VGhlIFNDUCBjby1wcm9jZXNzb3IgY2FuIG9wdGlvbmFsbHkgYmUgcGFzc2VkIGEgcmVzZXJ2ZWQg
bWVtb3J5IHJlZ2lvbgo+IHRvIHVzZS4gQWRkIHRoaXMgcHJvcGVydHkgaW4gdGhlIGR0LWJpbmRp
bmcuCj4gCj4gU2lnbmVkLW9mZi1ieTogTsOtY29sYXMgRi4gUi4gQS4gUHJhZG8gPG5mcmFwcmFk
b0Bjb2xsYWJvcmEuY29tPgoKUmV2aWV3ZWQtYnk6IEFuZ2Vsb0dpb2FjY2hpbm8gRGVsIFJlZ25v
IDxhbmdlbG9naW9hY2NoaW5vLmRlbHJlZ25vQGNvbGxhYm9yYS5jb20+CgoKX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTGludXgtbWVkaWF0ZWsgbWFpbGlu
ZyBsaXN0CkxpbnV4LW1lZGlhdGVrQGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmlu
ZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1tZWRpYXRlawo=
