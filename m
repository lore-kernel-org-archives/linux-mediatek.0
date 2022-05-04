Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 858B8C433F5
	for <linux-mediatek@archiver.kernel.org>; Wed,  4 May 2022 08:22:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=GrhRyY+54eX6CFzbqycGM8ovXfJNulVWrDqgitIUgwY=; b=1nvmP8kGJC1Ey7
	6MICHRySpmuniqPe9APKvlCRGKRPv+Tzq/f7ztWyNnoAuyRdXQmu22onA1ddETEojQrvJ7tkN0b8/
	IYXq9fU9sgqaomLdRaXAChDJLvEKJegL4dbajhU54wGlSkdDC0wx6Pj5oggqbdFLnZ781a2O2ZtqC
	J2/rZ8RzKv979PwgmdeFo95ei5SCuTXmxVqJFn+TAUIZNNIs+mbvANY+0smW5r9uKX3jjQ0+cQZ3K
	sVUQN2ynXWep+zrtdVDaXq/toLhCbBlsZo8Lgn9q4Wi6BrxnqfUMk/okv1t+oArv588b9Hx72k5fL
	ids4KAiJWKKYi9ms/fsQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nmAGw-009Uak-Vc; Wed, 04 May 2022 08:22:11 +0000
Received: from bhuna.collabora.co.uk ([46.235.227.227])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nmAGg-009UPU-3c; Wed, 04 May 2022 08:21:56 +0000
Received: from [127.0.0.1] (localhost [127.0.0.1])
 (Authenticated sender: kholk11) with ESMTPSA id D09521F44426
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1651652512;
 bh=wLY3OPe2cPx9sjjXymFeSQ30btBG+lIdXmj7Vs9jaaA=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=WvOUWCBy881OxEE4xdYZk3bLRUDSJr5QL3FgWhIW/X8GzYC5cdFJydQ1fnFh+N8xv
 IhoRIq5l/L+PjirhfyF7X+u+zaQENLaG1+0RySMzPAz4vUpwNr5JMTgpCqToCAY8d4
 ZsYOUifC9FNl8qzwFaPOlPR2Xug87YGpn7cy/BOlJcYGt7FuRJylGDeOEUvhZ+qzx6
 RYCgaCH3p/ZcEI4piCqTl2nTdmDbbL3IFzWNNbKhs7W+qvcv5SJR0Lj4oUY0S5Qhi1
 cKgjHI9Vy6bzeBMuNypwrwoZvBvlIyxS14E0q1LHNAUJ4lWJ149VNxs74cb4vEGfVk
 2trn26fQwWucA==
Message-ID: <73a52782-ba8b-2ef6-2044-1ceaad17d31c@collabora.com>
Date: Wed, 4 May 2022 10:21:49 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
Subject: Re: [PATCH v3 1/2] dt-bindings: remoteproc: mediatek: Make l1tcm reg
 optional for mtk,scp
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
References: <20220503211114.2656099-1-nfraprado@collabora.com>
 <20220503211114.2656099-2-nfraprado@collabora.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
In-Reply-To: <20220503211114.2656099-2-nfraprado@collabora.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220504_012154_332336_EF211273 
X-CRM114-Status: GOOD (  18.43  )
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

SWwgMDMvMDUvMjIgMjM6MTEsIE7DrWNvbGFzIEYuIFIuIEEuIFByYWRvIGhhIHNjcml0dG86Cj4g
VGhlIFNDUCBoYXMgdGhyZWUgbWVtb3J5IHJlZ2lvbnM6IHNyYW0sIGNmZyBhbmQgbDF0Y20uIFdo
aWxlIHRoZSBmaXJzdAo+IHR3byBhcmUgcmVxdWlyZWQsIGwxdGNtIGlzIG9wdGlvbmFsLiBGaXgg
dGhlIGR0LWJpbmRpbmcgc28gdGhhdCBpdCBjYW4KPiBiZSBvbWl0dGVkIGFuZCB1cGRhdGUgdGhl
IGRlc2NyaXB0aW9uLiBUaGlzIGdldHMgcmlkIG9mIGR0YnNfY2hlY2sKPiB3YXJuaW5ncyBmb3Ig
ZGV2aWNldHJlZXMgd2hlcmUgdGhlIGwxdGNtIHJlZyBpcyBtaXNzaW5nIGxpa2UgbXQ4MTgzLgo+
IAo+IFNpZ25lZC1vZmYtYnk6IE7DrWNvbGFzIEYuIFIuIEEuIFByYWRvIDxuZnJhcHJhZG9AY29s
bGFib3JhLmNvbT4KClJldmlld2VkLWJ5OiBBbmdlbG9HaW9hY2NoaW5vIERlbCBSZWdubyA8YW5n
ZWxvZ2lvYWNjaGluby5kZWxyZWdub0Bjb2xsYWJvcmEuY29tPgoKPiAKPiAtLS0KPiAKPiBDaGFu
Z2VzIGluIHYzOgo+IC0gTWFkZSB0aGUgY2ZnIHJlZyByZXF1aXJlZCBhZ2Fpbi4gQWZ0ZXIgbG9v
a2luZyBhZ2FpbiBpbnRvIHRoZSBtdGstc2NwCj4gICAgZHJpdmVyLCBvbmx5IGwxdGNtIGlzIG9w
dGlvbmFsLgo+IC0gQWRkZWQgbWVudGlvbiB0aGF0IGEgZHRic19jaGVjayB3YXJuaW5nIGdldHMg
Zml4ZWQgYnkgcGF0Y2ggaW4gY29tbWl0Cj4gICAgbWVzc2FnZS4KPiAKPiAgIERvY3VtZW50YXRp
b24vZGV2aWNldHJlZS9iaW5kaW5ncy9yZW1vdGVwcm9jL210ayxzY3AueWFtbCB8IDYgKysrKy0t
Cj4gICAxIGZpbGUgY2hhbmdlZCwgNCBpbnNlcnRpb25zKCspLCAyIGRlbGV0aW9ucygtKQo+IAo+
IGRpZmYgLS1naXQgYS9Eb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3MvcmVtb3RlcHJv
Yy9tdGssc2NwLnlhbWwgYi9Eb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3MvcmVtb3Rl
cHJvYy9tdGssc2NwLnlhbWwKPiBpbmRleCA4MjNhMjM2MjQyZGUuLmVlZWE4NDM3OWExZSAxMDA2
NDQKPiAtLS0gYS9Eb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3MvcmVtb3RlcHJvYy9t
dGssc2NwLnlhbWwKPiArKysgYi9Eb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3MvcmVt
b3RlcHJvYy9tdGssc2NwLnlhbWwKPiBAQCAtMjMsMTEgKzIzLDEzIEBAIHByb3BlcnRpZXM6Cj4g
ICAKPiAgICAgcmVnOgo+ICAgICAgIGRlc2NyaXB0aW9uOgo+IC0gICAgICBTaG91bGQgY29udGFp
biB0aGUgYWRkcmVzcyByYW5nZXMgZm9yIG1lbW9yeSByZWdpb25zIFNSQU0sIENGRywgYW5kCj4g
LSAgICAgIEwxVENNLgo+ICsgICAgICBTaG91bGQgY29udGFpbiB0aGUgYWRkcmVzcyByYW5nZXMg
Zm9yIG1lbW9yeSByZWdpb25zIFNSQU0sIENGRywgYW5kLAo+ICsgICAgICBvcHRpb25hbGx5LCBM
MVRDTS4KPiArICAgIG1pbkl0ZW1zOiAyCj4gICAgICAgbWF4SXRlbXM6IDMKPiAgIAo+ICAgICBy
ZWctbmFtZXM6Cj4gKyAgICBtaW5JdGVtczogMgo+ICAgICAgIGl0ZW1zOgo+ICAgICAgICAgLSBj
b25zdDogc3JhbQo+ICAgICAgICAgLSBjb25zdDogY2ZnCgoKCgpfX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fXwpMaW51eC1tZWRpYXRlayBtYWlsaW5nIGxpc3QK
TGludXgtbWVkaWF0ZWtAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFk
Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LW1lZGlhdGVrCg==
