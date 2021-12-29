Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 113A3C433F5
	for <linux-mediatek@archiver.kernel.org>; Wed, 29 Dec 2021 19:54:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=1EqeLZw/ByLlk8M4GhB4O5BK17AExzMltUvx/DIo1XA=; b=DI6HLZzOpOcZLi
	zwlhW1leeolFtUHiR7AJqvhlWs/8pynm8usDaFRIj9Hf7hQUQKcje82lQTWdsFBGNiab7HnkF8jIZ
	sRmUXSTStl+31yYtux4X9A8Zit31j7pRgpB34Wxsvpyq2ioz3kIf/CMAhoEc8Cu0Vm3/g39xlcXrN
	+0oPb0l9rwZ5tzxeW3m1Z8yMAcWJ/zNY2KJo5yemDZOqJUYt8s+i9NnJovC++ekZQ1AVDPnmxmJm6
	1O4EHAJ60tDgBIqjCfGLUNpkGzaAgQ0W9vw9mBAxiYsSbrizFJEpbpDTlw8bhqr0z8fyIEPbUcUh2
	WaEvRsVqPRYFP2OombWA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1n2f1g-003Mzx-Ac; Wed, 29 Dec 2021 19:54:20 +0000
Received: from mail-wr1-x42c.google.com ([2a00:1450:4864:20::42c])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1n2f1T-003Mxo-O3; Wed, 29 Dec 2021 19:54:09 +0000
Received: by mail-wr1-x42c.google.com with SMTP id i22so46312946wrb.13;
 Wed, 29 Dec 2021 11:54:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=AYgJm3Z1tSR5Siv29G2UYY7I4ntAQELIfBcvNqWFS10=;
 b=l5HwBAha+7bZs3VnX23PMnXJbhjgGcH+jbQ4Wvz4T9QfZzs7v/NoE4FeHJenRY/Ma6
 lVqoQAzOYNa85ePDghrThFWQcgyybgbHMDigMdnmtgFNh5bwjc1fwKYoFiAmQE0d2YPL
 nFjoW5JWa22OJ6aPNfbqpXWmGt5fSsRah2vdTaOXY53vdPJ/d6QzqmUESgaO1g/7XE03
 Ssa6EWbNiEIpLeH4hlYeG1mtJx2hmRzxCCX7hWo099eB+ekJf1gWP8RBL4GD/rbvjQmf
 LnCX62F6doa2/TL3jjzglIM002CHoadx5YqmNhWMLAPE0X59LmqNzGMPOOQ4GqMvOBfl
 g21Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=AYgJm3Z1tSR5Siv29G2UYY7I4ntAQELIfBcvNqWFS10=;
 b=Cjd2U7b7O8jY+KpX92f9/73V5F55uDHp42/CI0XhcM4bLG3PUU06R+6Arc9mt+pWOF
 GEUR9j9ASYDCnljWdzS/iikPk33wf7aVE8T6kLIZ3gBgwAf9lskGSWGpgM8JQHIHvXMA
 AiLiaFqWEmx3zkriCmkfAxpsXNGbGvNdnju1bkvfhmsyW3z1E+2cZQZPOzFafvUOvQ0O
 bdXZmWpSMLof7N231SunPkQ8RZ8POmFwFVLMDVm+bcNcFdx+xpW4S4liNLtY/zKkzcx0
 Gzc78ZvPxud3ha8Tmvw7Wj474E9nPaa2XTYheTmCIDra2FMIDCUHOhvnQqbDm26rGOYK
 uu4Q==
X-Gm-Message-State: AOAM5316aQnPwVJgN3l82tCrRiOqhBZ12sazTS/VNtBpZ6cMYWMTjeNX
 jITM/PRzbPGrPRDt4PPblSkR0gwl5PhfTw==
X-Google-Smtp-Source: ABdhPJxOKg6B9uBEFM9ZKGS0/B/51ZCestKZbdkcWcnACIJ5hkWYEOz6EqO4BL5FZSh//Tu1CtlhzA==
X-Received: by 2002:a5d:64a1:: with SMTP id m1mr21524523wrp.503.1640807646252; 
 Wed, 29 Dec 2021 11:54:06 -0800 (PST)
Received: from [192.168.2.177] ([207.188.161.251])
 by smtp.gmail.com with ESMTPSA id x8sm24420551wmj.44.2021.12.29.11.54.05
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 29 Dec 2021 11:54:05 -0800 (PST)
Message-ID: <0b0f0f81-cabe-aef2-e453-2caa2985b96b@gmail.com>
Date: Wed, 29 Dec 2021 20:54:05 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.2.0
Subject: Re: [PATCH] arm64: defconfig: Enable MT6397 RTC
Content-Language: en-US
To: =?UTF-8?B?TsOtY29sYXMgRi4gUi4gQS4gUHJhZG8=?= <nfraprado@collabora.com>
Cc: linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, 
 linux-kernel@vger.kernel.org, kernel@collabora.com
References: <20211217162445.876034-1-nfraprado@collabora.com>
From: Matthias Brugger <matthias.bgg@gmail.com>
In-Reply-To: <20211217162445.876034-1-nfraprado@collabora.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211229_115407_833493_70BCD0B5 
X-CRM114-Status: GOOD (  15.14  )
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

CgpPbiAxNy8xMi8yMDIxIDE3OjI0LCBOw61jb2xhcyBGLiBSLiBBLiBQcmFkbyB3cm90ZToKPiBU
aGUgTVQ2Mzk3IFJUQyBpcyBwYXJ0IG9mIHRoZSBNZWRpYXRlayBNVDYzOTcgUE1JQywgd2hpY2gg
aXMgcHJlc2VudCBpbgo+IHRoZSBtdDgxNzMtZWxtIGJhc2UgYm9hcmQuCj4gCj4gVGhlIGRyaXZl
ciBmb3IgdGhlIFBNSUMgaXMgYWxyZWFkeSBlbmFibGVkIHRocm91Z2ggQ09ORklHX01GRF9NVDYz
OTcsIHNvCj4gZW5hYmxlIGp1c3QgdGhlIGRyaXZlciBmb3IgdGhlIFJUQy4KPiAKCkFwcGxpZWQg
dG8gdjUuMTctdG1wL2RlZmNvbmZpZwoKVGhhbmtzCgo+IFNpZ25lZC1vZmYtYnk6IE7DrWNvbGFz
IEYuIFIuIEEuIFByYWRvIDxuZnJhcHJhZG9AY29sbGFib3JhLmNvbT4KPiAtLS0KPiAgIGFyY2gv
YXJtNjQvY29uZmlncy9kZWZjb25maWcgfCAxICsKPiAgIDEgZmlsZSBjaGFuZ2VkLCAxIGluc2Vy
dGlvbigrKQo+IAo+IGRpZmYgLS1naXQgYS9hcmNoL2FybTY0L2NvbmZpZ3MvZGVmY29uZmlnIGIv
YXJjaC9hcm02NC9jb25maWdzL2RlZmNvbmZpZwo+IGluZGV4IGYyZTJiOWJkZDcwMi4uNzZiZDM0
MjIzMjc3IDEwMDY0NAo+IC0tLSBhL2FyY2gvYXJtNjQvY29uZmlncy9kZWZjb25maWcKPiArKysg
Yi9hcmNoL2FybTY0L2NvbmZpZ3MvZGVmY29uZmlnCj4gQEAgLTkyNyw2ICs5MjcsNyBAQCBDT05G
SUdfUlRDX0RSVl9URUdSQT15Cj4gICBDT05GSUdfUlRDX0RSVl9TTlZTPW0KPiAgIENPTkZJR19S
VENfRFJWX0lNWF9TQz1tCj4gICBDT05GSUdfUlRDX0RSVl9YR0VORT15Cj4gK0NPTkZJR19SVENf
RFJWX01UNjM5Nz1tCj4gICBDT05GSUdfRE1BREVWSUNFUz15Cj4gICBDT05GSUdfRE1BX0JDTTI4
MzU9eQo+ICAgQ09ORklHX0RNQV9TVU42ST1tCj4gCgpfX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fXwpMaW51eC1tZWRpYXRlayBtYWlsaW5nIGxpc3QKTGludXgt
bWVkaWF0ZWtAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9t
YWlsbWFuL2xpc3RpbmZvL2xpbnV4LW1lZGlhdGVrCg==
