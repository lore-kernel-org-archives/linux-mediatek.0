Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 655EAC433F5
	for <linux-mediatek@archiver.kernel.org>; Mon,  9 May 2022 10:51:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Tk2lgb1qTTTyaHeXC4LscbdPz3rihCYqXNp+nkf90Lc=; b=WIvMa36wX5emuH
	v1N1K+VV3JDz5lDCe228hKfdGx6duvomHWvwlexOcOn8hSp5netZk+6Wv4WaeGVADwOYoziEGHO6D
	FyMWpDDWNVBlvv/yc0OgdscOTI2nAIodcBjW6JIByzDSESxuadbFFP4WXfg5gQBAllewFGn0znd38
	ncNpt2g+x5KhLhOJbAe4E2KX9n0O9Jc5mSlfxFFkjZ80NpgiiFw3ndoz3u6rPiDLsR6zcp2o8BiqD
	rKOF63abM+KmMDN5WHD25XA9pMhrXmDxtriUSQWiw9bLtfgTUaGNvzdWbCUDWZ/xPtZ2y+7Q76caE
	VOOlj38N3MCQAD5p4ylg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1no0yh-00Dsvn-86; Mon, 09 May 2022 10:50:59 +0000
Received: from bhuna.collabora.co.uk ([46.235.227.227])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1no0yM-00DsiN-LI; Mon, 09 May 2022 10:50:40 +0000
Received: from [127.0.0.1] (localhost [127.0.0.1])
 (Authenticated sender: kholk11) with ESMTPSA id 341A21F43B9C
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1652093437;
 bh=MIuLmVe6TIzgT754hZGMYSoOyD19xD3PkF1IXcgoh98=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=MaHkG/E3YW6LJ0G4SAtovaqL+jdNBJVE7a3iT0Iu++K4sfapfWhqcY5cd+EZQZ27y
 Ix+vNnxkEsWHplam96f531sR+hi1mAfSJmaWeZZwumwaL0LqXAEg01wFCvsX7V2UqP
 da0oJ+fb2xi8Ff8KGf3utMwi7s/1Wn8IbkI1R9eBH/aiJ2ReDRQm1dUgxi1FRIzA1+
 k7aOXbcYKAgy7KgwXBMme94SXNGKXIE3oH68474nZ+sw1kjQMLKkGxGLjksK+8eyk9
 kSvfIcy8xIdcRhbz4pWKX1dpug9cAiF7pnmLnnBMksfdu9TNixAiUJ1q0zX5U/V6KS
 tGBvfTnFh9vUw==
Message-ID: <85fcdcd0-e7c5-5192-9113-c69f9c3a6385@collabora.com>
Date: Mon, 9 May 2022 12:50:33 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.0
Subject: Re: [PATCH v2 3/3] dt-bindings: mediatek: add ethdr definition for
 mt8195
Content-Language: en-US
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
 Rex-BC Chen <rex-bc.chen@mediatek.com>,
 "robh+dt@kernel.org" <robh+dt@kernel.org>,
 "krzysztof.kozlowski+dt@linaro.org" <krzysztof.kozlowski+dt@linaro.org>,
 "chunkuang.hu@kernel.org" <chunkuang.hu@kernel.org>,
 "p.zabel@pengutronix.de" <p.zabel@pengutronix.de>
Cc: "airlied@linux.ie" <airlied@linux.ie>,
 "matthias.bgg@gmail.com" <matthias.bgg@gmail.com>,
 =?UTF-8?B?SmFzb24tSkggTGluICjmnpfnnb/npaUp?= <Jason-JH.Lin@mediatek.com>,
 =?UTF-8?B?TmFuY3kgTGluICjmnpfmrKPonqIp?= <Nancy.Lin@mediatek.com>,
 "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "linux-mediatek@lists.infradead.org" <linux-mediatek@lists.infradead.org>,
 "linux-arm-kernel@lists.infradead.org"
 <linux-arm-kernel@lists.infradead.org>,
 Project_Global_Chrome_Upstream_Group
 <Project_Global_Chrome_Upstream_Group@mediatek.com>
References: <20220509044302.27878-1-rex-bc.chen@mediatek.com>
 <20220509044302.27878-4-rex-bc.chen@mediatek.com>
 <46bc32df-e4e8-ac47-426d-8056714f0d5c@linaro.org>
 <5462209c5afb0a638ed777ec1829bb2717c8d76e.camel@mediatek.com>
 <98505974-afad-9639-d4f2-814097b0523b@linaro.org>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
In-Reply-To: <98505974-afad-9639-d4f2-814097b0523b@linaro.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220509_035038_847346_70471FB4 
X-CRM114-Status: GOOD (  13.25  )
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

SWwgMDkvMDUvMjIgMTI6NDQsIEtyenlzenRvZiBLb3psb3dza2kgaGEgc2NyaXR0bzoKPiBPbiAw
OS8wNS8yMDIyIDEwOjU0LCBSZXgtQkMgQ2hlbiB3cm90ZToKPj4+PiArICAgIHNvYyB7Cj4+Pj4g
KyAgICAgICAgI2FkZHJlc3MtY2VsbHMgPSA8Mj47Cj4+Pj4gKyAgICAgICAgI3NpemUtY2VsbHMg
PSA8Mj47Cj4+Pj4gKwo+Pj4+ICsgICAgICAgIGRpc3BfZXRoZHJAMWMxMTQwMDAgewo+Pj4KPj4+
IE5vIHVuZGVyc2NvcmVzIGluIG5vZGUgbmFtZS4gR2VuZXJpYyBub2RlIG5hbWVzLCBzbyBkaXNw
bGF5LQo+Pj4gY29udHJvbGxlcj8KPj4+Cj4+Cj4+IE9LLCB3ZSB3aWxsIGNoYW5nZSB0aGUgbm9k
ZSBuYW1lIHRvIGV0aGRyIGxpa2UgaW4gZHRzCj4+IGxpa2UgdGhpczoKPj4gZXRoZHIwOiBldGhk
ckAxYzExNDAwMCB7Cj4+IC4uLgo+PiB9Cj4gCj4gSXMgImV0aGRyIiBhIGdlbmVyaWMgbmFtZT8g
SXMgaXQgYW4gYWJicmV2aWF0aW9uIG9mICJFbmVyZ3lUcmFjZeKEoiBIaWdoCj4gRHluYW1pYyBS
YW5nZSI/IElmIHllcywgaXQgYWxzbyBsb29rcyBzcGVjaWZpYyB0byBUZXhhcyBJbnN0cnVtZW50
cy4uLgo+IAo+IEJlc3QgcmVnYXJkcywKPiBLcnp5c3p0b2YKCgpUaGF0J3MgbWVkaWF0ZWstZHJt
LCBhbmQgdGhpcyByZWZlcnMgdG8gdGhlIEhEUiBibG9jayBpbiB0aGUgZGlzcGxheSBJUC4uLgoK
VGhvdWdoLCBJIGhhdmUgbm8gaWRlYSBvZiB3aGF0ICJFVCIgc3RhbmRzIGZvciBpbiAiRVRIRFIi
LCBzbywgaXQgd291bGQgYmUKZGVmaW5pdGVseSBuaWNlIGlmIE1lZGlhVGVrIGNhbiB3cml0ZSB0
aGUgbWVhbmluZyBpbiB0aGUgZGVzY3JpcHRpb24sIGxpa2UKCmRlc2NyaXB0aW9uOgogICBFVEhE
UiAoRT8/PyBUPz8/IEhpZ2ggRHluYW1pYyBSYW5nZSkgaXMgZGVzaWduZWQgZm9yIEhEUiB2aWRl
byBhbmQgLi4uYmxhaAoKQ2hlZXJzLApBbmdlbG8KCl9fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fCkxpbnV4LW1lZGlhdGVrIG1haWxpbmcgbGlzdApMaW51eC1t
ZWRpYXRla0BsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21h
aWxtYW4vbGlzdGluZm8vbGludXgtbWVkaWF0ZWsK
