Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B8A4AC433EF
	for <linux-mediatek@archiver.kernel.org>; Tue,  3 May 2022 14:19:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=kNbkhUUsOg+qafJTriERo8az6VV54s/5PpdQ6KovPMk=; b=Y4GvCqWzqtP3sf
	11ScHxIT/ejIIpCij91JymzwpVJHSDGs7XrRnAJ46H4RUbUqiuvifBEplqoqZ5T2JQvqoLiFZ+kvV
	5dG2tU9mSxBQIM4O3djH9di0lnbDTtyrxvVtrPlel0yF/xsEC6I8xTq+XZYLX8qVhfFimiL1/q8qm
	EcZ0q6IvQGYsEjm7QcdktmGNKbpdftG8HaWY3rpjnQZDpuFn9lMPlUwosKaTf8dMquBAbz7o8mmi0
	hUxy5FaEOBIrROuOy4981u/YmUkeAWC8k0pjgJlLLArw1jTm76ILwIIz+9h1WfztTud4yy4ONJqI9
	I4Wxh1D2Zzgv9M10eiVQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nltMh-006DVJ-To; Tue, 03 May 2022 14:18:59 +0000
Received: from bhuna.collabora.co.uk ([46.235.227.227])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nltMP-006DIF-0P; Tue, 03 May 2022 14:18:42 +0000
Received: from [127.0.0.1] (localhost [127.0.0.1])
 (Authenticated sender: kholk11) with ESMTPSA id D4B381F43BCC
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1651587519;
 bh=tdv2h2YB7zXn+XefewHbbfpKCqa1mzg1E2iD1t5Fl0Q=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=W/X2MZsTr5pSE6d87lpmbCbBlJC9AMs64S21CzIf3kd2N/0cR07RkdqQ8c1rOjCr7
 GWa59KAOqnXJRQOUvDSwkMRr0s9D0TbhacQJjMQZSjy3ZYz9mVtrMgJ3eKGF58mWDS
 ygmQz1eLM80QUkZxErkCqhtwBMTSROdyODJzCbCvpii961xIzSelnbE1kwTU+JGQGX
 YPeTiHtz20KhkJLlact+A2AOMpJQzL4IVMq/vP9+7KCyvBwkq5WVeFI8/SoaRndo0k
 xjnl7B9fvC0D57pMzgYrphqtVwRhtz8RfFmXdXjnCib9wEFKQCU0xzhu62pMJgkVzq
 Xitg5vdLU9OZw==
Message-ID: <9a6ad743-b8c8-9ac1-824e-63295d03498a@collabora.com>
Date: Tue, 3 May 2022 16:18:36 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
Subject: Re: [PATCH v2 2/2] dt-bindings: remoteproc: mediatek: Add optional
 memory-region to mtk,scp
Content-Language: en-US
To: Rob Herring <robh@kernel.org>,
 =?UTF-8?B?TsOtY29sYXMgRi4gUi4gQS4gUHJhZG8=?= <nfraprado@collabora.com>
Cc: Rob Herring <robh+dt@kernel.org>, linux-mediatek@lists.infradead.org,
 Mathieu Poirier <mathieu.poirier@linaro.org>, linux-kernel@vger.kernel.org,
 devicetree@vger.kernel.org, Matthias Brugger <matthias.bgg@gmail.com>,
 linux-arm-kernel@lists.infradead.org,
 Bjorn Andersson <bjorn.andersson@linaro.org>,
 linux-remoteproc@vger.kernel.org, Tinghan Shen <tinghan.shen@mediatek.com>,
 kernel@collabora.com, Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
References: <20220502192420.2548512-1-nfraprado@collabora.com>
 <20220502192420.2548512-3-nfraprado@collabora.com>
 <YnE5Sq8H6juQHpbM@robh.at.kernel.org>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
In-Reply-To: <YnE5Sq8H6juQHpbM@robh.at.kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220503_071841_230132_94027532 
X-CRM114-Status: GOOD (  12.48  )
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

SWwgMDMvMDUvMjIgMTY6MTYsIFJvYiBIZXJyaW5nIGhhIHNjcml0dG86Cj4gT24gTW9uLCAwMiBN
YXkgMjAyMiAxNToyNDoyMCAtMDQwMCwgTsOtY29sYXMgRi4gUi4gQS4gUHJhZG8gd3JvdGU6Cj4+
IFRoZSBTQ1AgY28tcHJvY2Vzc29yIGNhbiBvcHRpb25hbGx5IGJlIHBhc3NlZCBhIHJlc2VydmVk
IG1lbW9yeSByZWdpb24KPj4gdG8gdXNlLiBBZGQgdGhpcyBwcm9wZXJ0eSBpbiB0aGUgZHQtYmlu
ZGluZy4KPj4KPj4gU2lnbmVkLW9mZi1ieTogTsOtY29sYXMgRi4gUi4gQS4gUHJhZG8gPG5mcmFw
cmFkb0Bjb2xsYWJvcmEuY29tPgo+Pgo+PiAtLS0KPj4gSSBsZWZ0IG91dCBBbmdlbG8ncyBSLWIg
c2luY2Ugb2YgdGhlIDMgbGluZXMgaW4gdGhlIHBhdGNoIGZyb20gdjEsIG9ubHkKPj4gMSBpcyBs
ZWZ0Lgo+Pgo+PiBDaGFuZ2VzIGluIHYyOgo+PiAtIERyb3BwZWQgdHlwZSBhbmQgZGVzY3JpcHRp
b24gc2luY2UgaXQncyBhIHdlbGwta25vd24gcHJvcGVydHkKPj4gLSBTZXQgbWF4SXRlbXMgdG8g
MQo+Pgo+PiAgIERvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9yZW1vdGVwcm9jL210
ayxzY3AueWFtbCB8IDMgKysrCj4+ICAgMSBmaWxlIGNoYW5nZWQsIDMgaW5zZXJ0aW9ucygrKQo+
Pgo+IAo+IEFja2VkLWJ5OiBSb2IgSGVycmluZyA8cm9iaEBrZXJuZWwub3JnPgoKClJldmlld2Vk
LWJ5OiBBbmdlbG9HaW9hY2NoaW5vIERlbCBSZWdubyA8YW5nZWxvZ2lvYWNjaGluby5kZWxyZWdu
b0Bjb2xsYWJvcmEuY29tPgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX18KTGludXgtbWVkaWF0ZWsgbWFpbGluZyBsaXN0CkxpbnV4LW1lZGlhdGVrQGxpc3Rz
LmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5m
by9saW51eC1tZWRpYXRlawo=
