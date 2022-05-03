Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2C1D1C433F5
	for <linux-mediatek@archiver.kernel.org>; Tue,  3 May 2022 12:26:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=8ZipcYLJzAFTm+4rgxfashK4JRvhNl62llkWh8oFKWw=; b=YJCSxgZYBJXxUn
	aJDG9wYeekCgMNIOEE2MfrZQ6ViuUny0fs8Wuw7vni517vQGyIffMS5rnI+iSMKiRHUc1cTGhNL0N
	nWWo/kVSK8vasNGybBYiSZoiY9TVlEEvt9xLF70sUMdkYfbkmIixKmbrTq5ChFwz5A9fRzaArznkR
	K5VoLOYU6xmnXRGXLSD65deFP5GQBLk6eVsuY4FhJ4mSF/8VPLjzYVelwd6fhRNyBqg+hzr5Nkrc9
	5pUv502WToUD5qxmMMtn/an2upNbgKRqQCmZeoRRVRSnQU9r2JZ/j0W4SSFX22PGm9mw572RATn3g
	AfvO5E7UlVj1Kw1FJy1Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nlrc7-005lxS-TD; Tue, 03 May 2022 12:26:47 +0000
Received: from bhuna.collabora.co.uk ([46.235.227.227])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nlrbo-005lnx-AN; Tue, 03 May 2022 12:26:29 +0000
Received: from [127.0.0.1] (localhost [127.0.0.1])
 (Authenticated sender: kholk11) with ESMTPSA id 917831F441C3
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1651580779;
 bh=LlBmjlHQSS35SPjCWj3dgSTZw3msR7REos5gfSK3Ax4=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=PkOtHZLorH/YOUjW9gqgLkQUauN4xvNqLdgUWSJ9SQdywZy/6df1mU500jZoYGG7e
 KWnMdgSZ+lwUMfVn+eWt/o7ztBSpNIO4yRiskjKgtKRpuqu1tCVCfpKE07ztDkXutw
 sAHYPgIA84KFaDD4KAW62ToiVORvcjtAC/Pgs9FFFVV/culsbUX+8Rhx6z9vHe3Nmx
 5YF7/L7wfKuEQGn742MYzKXe/MKmV4MXIBIMQl5R+gIZCGdEy+BdpZgevj732oEUdS
 /ravPbw/cVWQnX6RRdu9OzUfRukuaGNkSeTXEm33+ZrPqL4T05yme0tyeJ6xlFhK9v
 GWvKLIr0i0PrA==
Message-ID: <4bf2343b-3760-6ebf-7463-0b25fe9d942e@collabora.com>
Date: Tue, 3 May 2022 14:26:15 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
Subject: Re: [PATCH 1/2] dt-bindings: remoteproc: mediatek: Fix optional
 reg-names for mtk,scp
Content-Language: en-US
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
 =?UTF-8?B?TsOtY29sYXMgRi4gUi4gQS4gUHJhZG8=?= <nfraprado@collabora.com>,
 Bjorn Andersson <bjorn.andersson@linaro.org>
Cc: kernel@collabora.com,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Mathieu Poirier <mathieu.poirier@linaro.org>,
 Matthias Brugger <matthias.bgg@gmail.com>, Rob Herring <robh+dt@kernel.org>,
 Tinghan Shen <tinghan.shen@mediatek.com>, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-mediatek@lists.infradead.org, linux-remoteproc@vger.kernel.org
References: <20220429211111.2214119-1-nfraprado@collabora.com>
 <20220429211111.2214119-2-nfraprado@collabora.com>
 <a95fc4a9-af6b-e2c2-ef41-df9742d393de@linaro.org>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
In-Reply-To: <a95fc4a9-af6b-e2c2-ef41-df9742d393de@linaro.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220503_052628_536057_02F62574 
X-CRM114-Status: GOOD (  18.73  )
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

SWwgMDMvMDUvMjIgMTQ6MTksIEtyenlzenRvZiBLb3psb3dza2kgaGEgc2NyaXR0bzoKPiBPbiAy
OS8wNC8yMDIyIDIzOjExLCBOw61jb2xhcyBGLiBSLiBBLiBQcmFkbyB3cm90ZToKPj4gVGhlIFND
UCBoYXMgdGhyZWUgbWVtb3J5IHJlZ2lvbnM6IHNyYW0sIGwxdGNtIGFuZCBjZmcuIE9ubHkgc3Jh
bSBpcwo+PiByZXF1aXJlZCwgdGhlIG90aGVyIHR3byBhcmUgb3B0aW9uYWwuIEZpeCB0aGUgZHQt
YmluZGluZyBzbyB0aGF0IHRoZQo+PiBvcHRpb25hbCByZWdpb25zIGNhbiBiZSBvbWl0dGVkIGFu
ZCBwYXNzZWQgaW4gYW55IG9yZGVyLgo+IAo+IE5vLCBjYW5ub3QgYmUgcGFzc2VkIGluIGFueSBv
cmRlci4KPiAKPj4KPj4gQWxzbyBhZGQgdGhlIG1pc3NpbmcgbWluSXRlbXMgdG8gdGhlIHJlZyBw
cm9wZXJ0eSBhbmQgdXBkYXRlIHRoZQo+PiBkZXNjcmlwdGlvbi4KPj4KPj4gU2lnbmVkLW9mZi1i
eTogTsOtY29sYXMgRi4gUi4gQS4gUHJhZG8gPG5mcmFwcmFkb0Bjb2xsYWJvcmEuY29tPgo+Pgo+
PiAtLS0KPj4KPj4gICAuLi4vZGV2aWNldHJlZS9iaW5kaW5ncy9yZW1vdGVwcm9jL210ayxzY3Au
eWFtbCAgICAgIHwgMTIgKysrKysrKysrLS0tCj4+ICAgMSBmaWxlIGNoYW5nZWQsIDkgaW5zZXJ0
aW9ucygrKSwgMyBkZWxldGlvbnMoLSkKPj4KPj4gZGlmZiAtLWdpdCBhL0RvY3VtZW50YXRpb24v
ZGV2aWNldHJlZS9iaW5kaW5ncy9yZW1vdGVwcm9jL210ayxzY3AueWFtbCBiL0RvY3VtZW50YXRp
b24vZGV2aWNldHJlZS9iaW5kaW5ncy9yZW1vdGVwcm9jL210ayxzY3AueWFtbAo+PiBpbmRleCA4
MjNhMjM2MjQyZGUuLmVjOWRkZWI2Y2EyYyAxMDA2NDQKPj4gLS0tIGEvRG9jdW1lbnRhdGlvbi9k
ZXZpY2V0cmVlL2JpbmRpbmdzL3JlbW90ZXByb2MvbXRrLHNjcC55YW1sCj4+ICsrKyBiL0RvY3Vt
ZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9yZW1vdGVwcm9jL210ayxzY3AueWFtbAo+PiBA
QCAtMjQsMTQgKzI0LDIwIEBAIHByb3BlcnRpZXM6Cj4+ICAgICByZWc6Cj4+ICAgICAgIGRlc2Ny
aXB0aW9uOgo+PiAgICAgICAgIFNob3VsZCBjb250YWluIHRoZSBhZGRyZXNzIHJhbmdlcyBmb3Ig
bWVtb3J5IHJlZ2lvbnMgU1JBTSwgQ0ZHLCBhbmQKPj4gLSAgICAgIEwxVENNLgo+PiArICAgICAg
TDFUQ00uIE9ubHkgU1JBTSBpcyByZXF1aXJlZCwgd2hpbGUgQ0ZHIGFuZCBMMVRDTSBhcmUgb3B0
aW9uYWwuCj4+ICsgICAgbWluSXRlbXM6IDEKPj4gICAgICAgbWF4SXRlbXM6IDMKPj4gICAKPj4g
ICAgIHJlZy1uYW1lczoKPj4gKyAgICBtaW5JdGVtczogMQo+PiAgICAgICBpdGVtczoKPj4gICAg
ICAgICAtIGNvbnN0OiBzcmFtCj4+IC0gICAgICAtIGNvbnN0OiBjZmcKPj4gLSAgICAgIC0gY29u
c3Q6IGwxdGNtCj4+ICsgICAgICAtIGVudW06Cj4+ICsgICAgICAgICAgLSBsMXRjbQo+PiArICAg
ICAgICAgIC0gY2ZnCj4+ICsgICAgICAtIGVudW06Cj4+ICsgICAgICAgICAgLSBsMXRjbQo+PiAr
ICAgICAgICAgIC0gY2ZnCj4gCj4gVGhpcyBhbGxvd3MgdGhlbSBpbiBhbnkgY29tYmluYXRpb24g
d2hpY2ggaXMgbm90IHdoYXQgd2Ugd2FudC4gSWYgYm90aAo+IGFyZSBvcHRpb25hbCBhbmQgYm90
aCBjYW4gYXBwZWFyLCB0aGVuIGxhc3Qgc2hvdWxkIGJlIGEgY29uc3Q6bDF0Y20uCj4gCj4gQmVz
dCByZWdhcmRzLAo+IEtyenlzenRvZgoKTmljb2xhcywgSSB0aGluayB0aGF0IHlvdSB3ZXJlbid0
IGNsZWFyIGFib3V0IHdoYXQgeW91J3JlIHRyeWluZyB0byBzb2x2ZSB3aXRoIHRoaXMKY29tbWl0
IGluIHRoZSBkZXNjcmlwdGlvbi4KCkkgcmVtZW1iZXIgeW91IGhhZCB0aGlzIGtpbmQgb2YgaW5z
dGFuY2UsIGJ1dCBJIGRvbid0IHJlYWxseSByZW1lbWJlciBpZiBpdCB3YXMKYWJvdXQgbXRrLHNj
cCBvciAoYW5kPykgc29tZXRoaW5nIGVsc2UuLi4uIHNvLi4uLiBhcmUgeW91IHRyeWluZyB0byBm
aXggaXNzdWVzCndpdGggZGV2aWNldHJlZXMgZGVjbGFyaW5nCgoJcmVnLW5hbWVzID0gInNyYW0i
LCAibDF0Y20iOyA/CgpXYXMgdGhpcyBnaXZpbmcgZHRic19jaGVjayBlcnJvcnM/CgpDaGVlcnMs
CkFuZ2VsbwoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18K
TGludXgtbWVkaWF0ZWsgbWFpbGluZyBsaXN0CkxpbnV4LW1lZGlhdGVrQGxpc3RzLmluZnJhZGVh
ZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1t
ZWRpYXRlawo=
