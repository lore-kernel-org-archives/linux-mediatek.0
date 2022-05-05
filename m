Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3BF6EC433EF
	for <linux-mediatek@archiver.kernel.org>; Thu,  5 May 2022 08:08:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=LJhyBzGg8OOWXRKYnSl3j2CwBQlzyMwUGe53lE6lA9s=; b=fFn1IEM5p2APHj
	yqp1oikvH8Gdcm9fxPoEoHDYp4JaEIt5a0Kr8hjQS7YCveggfWEicHYQFKD7l0M4Di4IfUfl31mVN
	UYjRUDTUIpsCJSVE+qiLynUf/xw+KFu9lYHVIQVBfPCLXjtoy0S7UJnxkw2xVEMzIWUA9EmxBPqeb
	Bptpoko4ZYdbHiYqsLVqCRqGUP3tGtYN7tNtkDCOVhGkwFoaMlCV4sBFFf92ThjWw8rt0nAMHCVN6
	NujFLRA97CtkH18YKBOyKaJh2qPAI8PrLfWZ8NSR/8kZ/DE+tx2VezEGuk+Xofzqb5Ao3/ctDa2SJ
	lIi1F3OovWn9wgc9+BVw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nmWXP-00EaFj-Fv; Thu, 05 May 2022 08:08:39 +0000
Received: from bhuna.collabora.co.uk ([46.235.227.227])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nmWXD-00EaBH-Qk; Thu, 05 May 2022 08:08:29 +0000
Received: from [127.0.0.1] (localhost [127.0.0.1])
 (Authenticated sender: kholk11) with ESMTPSA id E73021F44D6A
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1651738103;
 bh=Sx0JTutas4/a5URHaHdUEVftBTpjpG3kAugSQyvFlOk=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=LQP40dxFDRXce8lfztccxf30KUdLwEI7Biw7WJFTVQgsdDbNckjKld2YhLoBNGUFK
 6oiSh0nR9Xfnfbzk/jr6ze4TO3H0+DqXEUSKRQPakdjJeaG4ckhTKy9NBwbOVYL7Rz
 75B5Sarx4ocMBfhtUMYwULroMzHxA1GU5xiW71rPLvmdS8+Nb3IVHiMdvyuR1N54lA
 8CKd8fB/xfvNwcgZqG6z1VjuSIdQFmHsVfj3TRNZlUY4/F4ra07cYNlwfAXCukg8J5
 X4Obi7f66sRUcI/xgAb4Y3SaJM2Yu8CnQ9wkG3c5C6d0oOM60j5N3/znbWeNql2KFQ
 K5ftZZVV6WFrw==
Message-ID: <4826c824-40ce-5726-ed95-5be069233ca7@collabora.com>
Date: Thu, 5 May 2022 10:08:20 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
Subject: Re: [PATCH 1/3] ASoC: dt-bindings: mediatek: mt8192: Add i2s-share
 properties
Content-Language: en-US
To: =?UTF-8?B?TsOtY29sYXMgRi4gUi4gQS4gUHJhZG8=?= <nfraprado@collabora.com>,
 Mark Brown <broonie@kernel.org>
Cc: kernel@collabora.com, Jiaxin Yu <jiaxin.yu@mediatek.com>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Liam Girdwood <lgirdwood@gmail.com>,
 Matthias Brugger <matthias.bgg@gmail.com>, Rob Herring <robh+dt@kernel.org>,
 Shane Chien <shane.chien@mediatek.com>, alsa-devel@alsa-project.org,
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, linux-mediatek@lists.infradead.org
References: <20220429203039.2207848-1-nfraprado@collabora.com>
 <20220429203039.2207848-2-nfraprado@collabora.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
In-Reply-To: <20220429203039.2207848-2-nfraprado@collabora.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220505_010828_117661_7C7AE8FC 
X-CRM114-Status: GOOD (  18.49  )
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

SWwgMjkvMDQvMjIgMjI6MzAsIE7DrWNvbGFzIEYuIFIuIEEuIFByYWRvIGhhIHNjcml0dG86Cj4g
VGhlIE1lZGlhdGVrIEFGRSBQQ00gY29udHJvbGxlciBmb3IgTVQ4MTkyIGFsbG93cyBzaGFyaW5n
IG9mIGFuIEkyUyBidXMKPiBiZXR3ZWVuIHR3byBidXNzZXMuIEFkZCBhIHBhdHRlcm4gZm9yIHRo
ZXNlIHByb3BlcnRpZXMgaW4gdGhlCj4gZHQtYmluZGluZy4KPiAKPiBTaWduZWQtb2ZmLWJ5OiBO
w61jb2xhcyBGLiBSLiBBLiBQcmFkbyA8bmZyYXByYWRvQGNvbGxhYm9yYS5jb20+Cj4gLS0tCj4g
Cj4gICBEb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3Mvc291bmQvbXQ4MTkyLWFmZS1w
Y20ueWFtbCB8IDUgKysrKysKPiAgIDEgZmlsZSBjaGFuZ2VkLCA1IGluc2VydGlvbnMoKykKPiAK
PiBkaWZmIC0tZ2l0IGEvRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL3NvdW5kL210
ODE5Mi1hZmUtcGNtLnlhbWwgYi9Eb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3Mvc291
bmQvbXQ4MTkyLWFmZS1wY20ueWFtbAo+IGluZGV4IDdhMjViYzliODA2MC4uNWIwM2M4ZGJmMzE4
IDEwMDY0NAo+IC0tLSBhL0RvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9zb3VuZC9t
dDgxOTItYWZlLXBjbS55YW1sCj4gKysrIGIvRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRp
bmdzL3NvdW5kL210ODE5Mi1hZmUtcGNtLnlhbWwKPiBAQCAtNTQsNiArNTQsMTEgQEAgcHJvcGVy
dGllczoKPiAgICAgICAgIC0gY29uc3Q6IGF1ZF9pbmZyYV9jbGsKPiAgICAgICAgIC0gY29uc3Q6
IGF1ZF9pbmZyYV8yNm1fY2xrCj4gICAKPiArcGF0dGVyblByb3BlcnRpZXM6Cj4gKyAgIl5pMnNb
MC0zNS05XS1zaGFyZSQiOgo+ICsgICAgZGVzY3JpcHRpb246IE5hbWUgb2YgdGhlIEkyUyBidXMg
dGhhdCBpcyBzaGFyZWQgd2l0aCB0aGlzIGJ1cwo+ICsgICAgcGF0dGVybjogIl5JMlNbMC0zNS05
XSQiCj4gKwo+ICAgcmVxdWlyZWQ6Cj4gICAgIC0gY29tcGF0aWJsZQo+ICAgICAtIGludGVycnVw
dHMKPiAKClRoZSBvbmx5IG90aGVyIHdheSBvZiBkb2luZyB0aGlzIHdvdWxkIGJlIHRvIGNvbXBs
aWNhdGUgdGhpcyBpbiB0aGUgZHJpdmVyCnNvIHRoYXQgd2UgY2FuIGRvIHNvbWV0aGluZyBsaWtl
CgoiaTJzLXNoYXJlID0gPDAgMj4iOyAgaW5zdGVhZCBvZiAgaTJzMC1zaGFyZSA9ICJJMlMyIjsK
Ci4uLmFuZCBJIGRvbid0IHRoaW5rIHRoYXQgdGhpcyB3b3VsZCBiZSBhbnkgbW9yZSBzdHJhaWdo
dGZvcndhcmQgdGhhbiB0aGUKcHJvdmlkZWQgd2F5LgoKVGhlcmUncyBhbiBpbXByb3ZlbWVudCB0
aGF0IHdlIGNhbiBkbyB0byB0aGF0IHBhdHRlcm4gZGVzY3JpcHRpb24gdGhvdWdoLAp3aGljaCB3
b3VsZCBiZSBleHBsYWluaW5nIHRoYXQgZGVjbGFyaW5nICdpMnMwLXNoYXJlID0gIkkyUzIiJyBt
ZWFucyB0aGF0CkkyUzIncyBkYXRhIHBpbiB3aWxsIGJlIHVzZWQgYXMgREFUQS1PVVQsIHdoaWxl
IGkyczAgaXMgREFUQS1JTi4KCkFub3RoZXIgdGhpbmcgdGhhdCBjb21lcyB0byBtaW5kIGhlcmUg
aXMgdGhhdCB0aGlzIGlzIGEgTWVkaWFUZWsgc3BlY2lmaWMKcHJvcGVydHkgYW5kICpub3QqIGEg
Z2VuZXJpYyBvbmUsIHdoaWNoIG1lYW5zIHRoYXQgYm90aCB0aGUgZHJpdmVyIGFuZAp0aGlzIGJp
bmRpbmcgc2hvdWxkIGJlIGZpeGVkIHRvIGdldCBhICJtZWRpYXRlaywiIHByZWZpeCwgc28sIHRo
aXMgcHJvcGVydHkKc2hvdWxkIC0gaW4gcmVhbGl0eSAtIGJlICJtZWRpYXRlayxpMnNbMC0zNS05
XS1zaGFyZSIgaW5zdGVhZC4KCkkgdGhpbmsgdGhhdCBldmVyeW9uZSBhZ3JlZXMgYWJvdXQgdGhh
dCwgYnV0IGxldCdzIHNlZSB3aGF0IHRoZSBvdGhlcnMgc2F5LgoKQ2hlZXJzLApBbmdlbG8KCl9f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCkxpbnV4LW1lZGlh
dGVrIG1haWxpbmcgbGlzdApMaW51eC1tZWRpYXRla0BsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6
Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtbWVkaWF0ZWsK
