Return-Path: <SRS0=bfHw=F4=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-14.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3F1FCC433E0
	for <linux-mediatek@archiver.kernel.org>; Thu, 24 Dec 2020 00:26:35 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id DCAC122517
	for <linux-mediatek@archiver.kernel.org>; Thu, 24 Dec 2020 00:26:34 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org DCAC122517
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:In-Reply-To:
	References:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=1q0HLVM3F2aFhPsnl8z5Tdx5QmTqt8SNnkSOnQkDeBA=; b=dHKkv5/G91qH5ZtQQX8GOseZy
	fJj/wudouGbXg35sz2Xjg8FxQZTH+r8vOKp54v8Fp3+8LO1DdFh8Led9obrYGlPMePZyh7rUrY3I9
	AWR6Zi4E3HwNA+yinzbqFNWAiokF5HQP/4W42TJXwrzeJMROfu5DSoJyBshB6SzMbKd9Yfx5nCCjK
	7MlsRcz4EybH3JLHsZbIqGfKKVo1VnDSWUj2JxA8Tk5LkJMRjcsYie/T9mV5YcYnU5QsSnbLA145B
	XcuuzzudvgFWn/ZXaw5gtQu/jnvwXyvCqIBd8G2DmusQ96Ntd+0saw2wQoIHf9h8o3JfXGs7vqKa2
	u/7APSrdw==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1ksESV-0007MW-5C; Thu, 24 Dec 2020 00:26:23 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1ksESR-0007LQ-7C; Thu, 24 Dec 2020 00:26:20 +0000
Received: by mail.kernel.org (Postfix) with ESMTPSA id 297A422571;
 Thu, 24 Dec 2020 00:26:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1608769578;
 bh=+M1lbUD+xDyopTVHLmYYy1DiKuckD477//1o2Xyfiqw=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=cKqiFBnxBW/9Bca97FAi1dcq6zuWkUDK5KTqyNJJYToD9qDlYHLqjxIf3T3O3j8Z1
 hH8LnScihsM2eV5YFubNpuxC3pCfVzMqw8GHVAHTH4pfCX7CVpIu83qcigSQoRUgqW
 ZGXBj+7Xd9RtSvAZAi4NHUrNFtWHkOhbqZ2pwkzV/B0DECWfc0bTFXFeN26BsGUWEh
 a6l+emj6+FYeIir6UsyMicd8IAMrJA59rQdBzUmV8nUOWRSDHSLXC6nV/eZaNQjh6N
 4wAQQdH/BKR0ZqdstdMtsGpp/TEUhk3DG+KMl9jzywT95PxoYEcmy1YqK1VNASXcr3
 SiVOZINXicgpg==
Received: by mail-ej1-f41.google.com with SMTP id g20so1453980ejb.1;
 Wed, 23 Dec 2020 16:26:18 -0800 (PST)
X-Gm-Message-State: AOAM530OlilwVdIKFyisTwKiOLYbGNPfqwOQT/iAPsx29fPpjG00PYyP
 p2pfZLRKM0h1mW6UUwKpOROuY7m/kDjDPFGHng==
X-Google-Smtp-Source: ABdhPJwHsZgd5LttS8qKUOjhkwe51JqlcqeCFHvZ1o3TseXFh+pQSS88Zda/jJ4iP9Ets0/7uIN1pA2BZBfIGgUn228=
X-Received: by 2002:a17:906:ae4e:: with SMTP id
 lf14mr26974962ejb.310.1608769576689; 
 Wed, 23 Dec 2020 16:26:16 -0800 (PST)
MIME-Version: 1.0
References: <20201216093012.24406-1-chunfeng.yun@mediatek.com>
 <20201216093012.24406-7-chunfeng.yun@mediatek.com>
In-Reply-To: <20201216093012.24406-7-chunfeng.yun@mediatek.com>
From: Chun-Kuang Hu <chunkuang.hu@kernel.org>
Date: Thu, 24 Dec 2020 08:26:05 +0800
X-Gmail-Original-Message-ID: <CAAOTY_85gH4T2=aziG=Ts7+0iO=dHWEYvVCbMTJ_SY0phyDjKw@mail.gmail.com>
Message-ID: <CAAOTY_85gH4T2=aziG=Ts7+0iO=dHWEYvVCbMTJ_SY0phyDjKw@mail.gmail.com>
Subject: Re: [PATCH v4 07/11] dt-bindings: phy: convert MIPI DSI PHY binding
 to YAML schema
To: Chunfeng Yun <chunfeng.yun@mediatek.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201223_192619_712299_DEE549A5 
X-CRM114-Status: GOOD (  21.22  )
X-BeenThere: linux-mediatek@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <linux-mediatek.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mediatek>, 
 <mailto:linux-mediatek-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mediatek/>
List-Post: <mailto:linux-mediatek@lists.infradead.org>
List-Help: <mailto:linux-mediatek-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mediatek>, 
 <mailto:linux-mediatek-request@lists.infradead.org?subject=subscribe>
Cc: Chun-Kuang Hu <chunkuang.hu@kernel.org>, Min Guo <min.guo@mediatek.com>,
 Philipp Zabel <p.zabel@pengutronix.de>, DTML <devicetree@vger.kernel.org>,
 David Airlie <airlied@linux.ie>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, linux-usb@vger.kernel.org,
 linux-kernel <linux-kernel@vger.kernel.org>,
 DRI Development <dri-devel@lists.freedesktop.org>,
 Kishon Vijay Abraham I <kishon@ti.com>,
 Serge Semin <Sergey.Semin@baikalelectronics.ru>, Vinod Koul <vkoul@kernel.org>,
 Rob Herring <robh+dt@kernel.org>,
 "moderated list:ARM/Mediatek SoC support" <linux-mediatek@lists.infradead.org>,
 Daniel Vetter <daniel@ffwll.ch>, netdev@vger.kernel.org,
 Matthias Brugger <matthias.bgg@gmail.com>, Jakub Kicinski <kuba@kernel.org>,
 Stanley Chu <stanley.chu@mediatek.com>,
 "David S . Miller" <davem@davemloft.net>,
 Linux ARM <linux-arm-kernel@lists.infradead.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

SGksIENodW5mZW5nOgoKQ2h1bmZlbmcgWXVuIDxjaHVuZmVuZy55dW5AbWVkaWF0ZWsuY29tPiDm
lrwgMjAyMOW5tDEy5pyIMTbml6Ug6YCx5LiJIOS4i+WNiDU6MzDlr6vpgZPvvJoKPgo+IENvbnZl
cnQgTUlQSSBEU0kgUEhZIGJpbmRpbmcgdG8gWUFNTCBzY2hlbWEgbWVkaWF0ZWssZHNpLXBoeS55
YW1sCj4KClJldmlld2VkLWJ5OiBDaHVuLUt1YW5nIEh1IDxjaHVua3VhbmcuaHVAa2VybmVsLm9y
Zz4KCj4gQ2M6IENodW4tS3VhbmcgSHUgPGNodW5rdWFuZy5odUBrZXJuZWwub3JnPgo+IENjOiBQ
aGlsaXBwIFphYmVsIDxwLnphYmVsQHBlbmd1dHJvbml4LmRlPgo+IFNpZ25lZC1vZmYtYnk6IENo
dW5mZW5nIFl1biA8Y2h1bmZlbmcueXVuQG1lZGlhdGVrLmNvbT4KPiAtLS0KPiB2NDoKPiAgIDEu
IGFkZCBtYWludGFpbmVyIFBoaWxpcHAgYWRkIHN1cHBvcnQgbXQ4MTgzIHN1Z2dlc3RlZCBieSBD
aHVuLUt1YW5nCj4gICAyLiB1c2Uga2V5d29yZCBtdWx0aXBsZU9mIHN1Z2dlc3RlZCBieSBSb2IK
PiAgIDMuIGZpeCB0eXBvIG9mICdNSVBJJyBpbiB0aXRsZQo+Cj4gdjM6IG5ldyBwYXRjaAo+IC0t
LQo+ICAuLi4vZGlzcGxheS9tZWRpYXRlay9tZWRpYXRlayxkc2kudHh0ICAgICAgICAgfCAxOCAr
LS0tCj4gIC4uLi9iaW5kaW5ncy9waHkvbWVkaWF0ZWssZHNpLXBoeS55YW1sICAgICAgICB8IDg1
ICsrKysrKysrKysrKysrKysrKysKPiAgMiBmaWxlcyBjaGFuZ2VkLCA4NiBpbnNlcnRpb25zKCsp
LCAxNyBkZWxldGlvbnMoLSkKPiAgY3JlYXRlIG1vZGUgMTAwNjQ0IERvY3VtZW50YXRpb24vZGV2
aWNldHJlZS9iaW5kaW5ncy9waHkvbWVkaWF0ZWssZHNpLXBoeS55YW1sCj4KPiBkaWZmIC0tZ2l0
IGEvRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL2Rpc3BsYXkvbWVkaWF0ZWsvbWVk
aWF0ZWssZHNpLnR4dCBiL0RvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9kaXNwbGF5
L21lZGlhdGVrL21lZGlhdGVrLGRzaS50eHQKPiBpbmRleCBmMDZmMjRkNDA1YTUuLjgyMzhhODY2
ODZiZSAxMDA2NDQKPiAtLS0gYS9Eb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3MvZGlz
cGxheS9tZWRpYXRlay9tZWRpYXRlayxkc2kudHh0Cj4gKysrIGIvRG9jdW1lbnRhdGlvbi9kZXZp
Y2V0cmVlL2JpbmRpbmdzL2Rpc3BsYXkvbWVkaWF0ZWsvbWVkaWF0ZWssZHNpLnR4dAo+IEBAIC0y
MiwyMyArMjIsNyBAQCBSZXF1aXJlZCBwcm9wZXJ0aWVzOgo+ICBNSVBJIFRYIENvbmZpZ3VyYXRp
b24gTW9kdWxlCj4gID09PT09PT09PT09PT09PT09PT09PT09PT09PT0KPgo+IC1UaGUgTUlQSSBU
WCBjb25maWd1cmF0aW9uIG1vZHVsZSBjb250cm9scyB0aGUgTUlQSSBELVBIWS4KPiAtCj4gLVJl
cXVpcmVkIHByb3BlcnRpZXM6Cj4gLS0gY29tcGF0aWJsZTogIm1lZGlhdGVrLDxjaGlwPi1taXBp
LXR4Igo+IC0tIHRoZSBzdXBwb3J0ZWQgY2hpcHMgYXJlIG10MjcwMSwgNzYyMywgbXQ4MTczIGFu
ZCBtdDgxODMuCj4gLS0gcmVnOiBQaHlzaWNhbCBiYXNlIGFkZHJlc3MgYW5kIGxlbmd0aCBvZiB0
aGUgY29udHJvbGxlcidzIHJlZ2lzdGVycwo+IC0tIGNsb2NrczogUExMIHJlZmVyZW5jZSBjbG9j
awo+IC0tIGNsb2NrLW91dHB1dC1uYW1lczogbmFtZSBvZiB0aGUgb3V0cHV0IGNsb2NrIGxpbmUg
dG8gdGhlIERTSSBlbmNvZGVyCj4gLS0gI2Nsb2NrLWNlbGxzOiBtdXN0IGJlIDwwPjsKPiAtLSAj
cGh5LWNlbGxzOiBtdXN0IGJlIDwwPi4KPiAtCj4gLU9wdGlvbmFsIHByb3BlcnRpZXM6Cj4gLS0g
ZHJpdmUtc3RyZW5ndGgtbWljcm9hbXA6IGFkanVzdCBkcml2aW5nIGN1cnJlbnQsIHNob3VsZCBi
ZSAzMDAwIH4gNjAwMC4gQW5kCj4gLSAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgdGhlIHN0ZXAgaXMgMjAwLgo+IC0tIG52bWVtLWNlbGxzOiBBIHBoYW5k
bGUgdG8gdGhlIGNhbGlicmF0aW9uIGRhdGEgcHJvdmlkZWQgYnkgYSBudm1lbSBkZXZpY2UuIElm
Cj4gLSAgICAgICAgICAgICAgIHVuc3BlY2lmaWVkIGRlZmF1bHQgdmFsdWVzIHNoYWxsIGJlIHVz
ZWQuCj4gLS0gbnZtZW0tY2VsbC1uYW1lczogU2hvdWxkIGJlICJjYWxpYnJhdGlvbi1kYXRhIgo+
ICtTZWUgcGh5L21lZGlhdGVrLGRzaS1waHkueWFtbAo+Cj4gIEV4YW1wbGU6Cj4KPiBkaWZmIC0t
Z2l0IGEvRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL3BoeS9tZWRpYXRlayxkc2kt
cGh5LnlhbWwgYi9Eb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3MvcGh5L21lZGlhdGVr
LGRzaS1waHkueWFtbAo+IG5ldyBmaWxlIG1vZGUgMTAwNjQ0Cj4gaW5kZXggMDAwMDAwMDAwMDAw
Li43MWQ0YWNlYTFmNjYKPiAtLS0gL2Rldi9udWxsCj4gKysrIGIvRG9jdW1lbnRhdGlvbi9kZXZp
Y2V0cmVlL2JpbmRpbmdzL3BoeS9tZWRpYXRlayxkc2ktcGh5LnlhbWwKPiBAQCAtMCwwICsxLDg1
IEBACj4gKyMgU1BEWC1MaWNlbnNlLUlkZW50aWZpZXI6IChHUEwtMi4wLW9ubHkgT1IgQlNELTIt
Q2xhdXNlKQo+ICsjIENvcHlyaWdodCAoYykgMjAyMCBNZWRpYVRlawo+ICslWUFNTCAxLjIKPiAr
LS0tCj4gKyRpZDogaHR0cDovL2RldmljZXRyZWUub3JnL3NjaGVtYXMvcGh5L21lZGlhdGVrLGRz
aS1waHkueWFtbCMKPiArJHNjaGVtYTogaHR0cDovL2RldmljZXRyZWUub3JnL21ldGEtc2NoZW1h
cy9jb3JlLnlhbWwjCj4gKwo+ICt0aXRsZTogTWVkaWFUZWsgTUlQSSBEaXNwbGF5IFNlcmlhbCBJ
bnRlcmZhY2UgKERTSSkgUEhZIGJpbmRpbmcKPiArCj4gK21haW50YWluZXJzOgo+ICsgIC0gQ2h1
bi1LdWFuZyBIdSA8Y2h1bmt1YW5nLmh1QGtlcm5lbC5vcmc+Cj4gKyAgLSBQaGlsaXBwIFphYmVs
IDxwLnphYmVsQHBlbmd1dHJvbml4LmRlPgo+ICsgIC0gQ2h1bmZlbmcgWXVuIDxjaHVuZmVuZy55
dW5AbWVkaWF0ZWsuY29tPgo+ICsKPiArZGVzY3JpcHRpb246IFRoZSBNSVBJIERTSSBQSFkgc3Vw
cG9ydHMgdXAgdG8gNC1sYW5lIG91dHB1dC4KPiArCj4gK3Byb3BlcnRpZXM6Cj4gKyAgJG5vZGVu
YW1lOgo+ICsgICAgcGF0dGVybjogIl5kc2ktcGh5QFswLTlhLWZdKyQiCj4gKwo+ICsgIGNvbXBh
dGlibGU6Cj4gKyAgICBlbnVtOgo+ICsgICAgICAtIG1lZGlhdGVrLG10MjcwMS1taXBpLXR4Cj4g
KyAgICAgIC0gbWVkaWF0ZWssbXQ3NjIzLW1pcGktdHgKPiArICAgICAgLSBtZWRpYXRlayxtdDgx
NzMtbWlwaS10eAo+ICsgICAgICAtIG1lZGlhdGVrLG10ODE4My1taXBpLXR4Cj4gKwo+ICsgIHJl
ZzoKPiArICAgIG1heEl0ZW1zOiAxCj4gKwo+ICsgIGNsb2NrczoKPiArICAgIGl0ZW1zOgo+ICsg
ICAgICAtIGRlc2NyaXB0aW9uOiBQTEwgcmVmZXJlbmNlIGNsb2NrCj4gKwo+ICsgIGNsb2NrLW91
dHB1dC1uYW1lczoKPiArICAgIG1heEl0ZW1zOiAxCj4gKwo+ICsgICIjcGh5LWNlbGxzIjoKPiAr
ICAgIGNvbnN0OiAwCj4gKwo+ICsgICIjY2xvY2stY2VsbHMiOgo+ICsgICAgY29uc3Q6IDAKPiAr
Cj4gKyAgbnZtZW0tY2VsbHM6Cj4gKyAgICBtYXhJdGVtczogMQo+ICsgICAgZGVzY3JpcHRpb246
IEEgcGhhbmRsZSB0byB0aGUgY2FsaWJyYXRpb24gZGF0YSBwcm92aWRlZCBieSBhIG52bWVtIGRl
dmljZSwKPiArICAgICAgaWYgdW5zcGVjaWZpZWQsIGRlZmF1bHQgdmFsdWVzIHNoYWxsIGJlIHVz
ZWQuCj4gKwo+ICsgIG52bWVtLWNlbGwtbmFtZXM6Cj4gKyAgICBpdGVtczoKPiArICAgICAgLSBj
b25zdDogY2FsaWJyYXRpb24tZGF0YQo+ICsKPiArICBkcml2ZS1zdHJlbmd0aC1taWNyb2FtcDoK
PiArICAgIGRlc2NyaXB0aW9uOiBhZGp1c3QgZHJpdmluZyBjdXJyZW50Cj4gKyAgICBtdWx0aXBs
ZU9mOiAyMDAKPiArICAgIG1pbmltdW06IDIwMDAKPiArICAgIG1heGltdW06IDYwMDAKPiArICAg
IGRlZmF1bHQ6IDQ2MDAKPiArCj4gK3JlcXVpcmVkOgo+ICsgIC0gY29tcGF0aWJsZQo+ICsgIC0g
cmVnCj4gKyAgLSBjbG9ja3MKPiArICAtIGNsb2NrLW91dHB1dC1uYW1lcwo+ICsgIC0gIiNwaHkt
Y2VsbHMiCj4gKyAgLSAiI2Nsb2NrLWNlbGxzIgo+ICsKPiArYWRkaXRpb25hbFByb3BlcnRpZXM6
IGZhbHNlCj4gKwo+ICtleGFtcGxlczoKPiArICAtIHwKPiArICAgICNpbmNsdWRlIDxkdC1iaW5k
aW5ncy9jbG9jay9tdDgxNzMtY2xrLmg+Cj4gKyAgICBkc2ktcGh5QDEwMjE1MDAwIHsKPiArICAg
ICAgICBjb21wYXRpYmxlID0gIm1lZGlhdGVrLG10ODE3My1taXBpLXR4IjsKPiArICAgICAgICBy
ZWcgPSA8MHgxMDIxNTAwMCAweDEwMDA+Owo+ICsgICAgICAgIGNsb2NrcyA9IDwmY2xrMjZtPjsK
PiArICAgICAgICBjbG9jay1vdXRwdXQtbmFtZXMgPSAibWlwaV90eDBfcGxsIjsKPiArICAgICAg
ICBkcml2ZS1zdHJlbmd0aC1taWNyb2FtcCA9IDw0MDAwPjsKPiArICAgICAgICBudm1lbS1jZWxs
cz0gPCZtaXBpX3R4X2NhbGlicmF0aW9uPjsKPiArICAgICAgICBudm1lbS1jZWxsLW5hbWVzID0g
ImNhbGlicmF0aW9uLWRhdGEiOwo+ICsgICAgICAgICNjbG9jay1jZWxscyA9IDwwPjsKPiArICAg
ICAgICAjcGh5LWNlbGxzID0gPDA+Owo+ICsgICAgfTsKPiArCj4gKy4uLgo+IC0tCj4gMi4xOC4w
Cj4KCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCkxpbnV4
LW1lZGlhdGVrIG1haWxpbmcgbGlzdApMaW51eC1tZWRpYXRla0BsaXN0cy5pbmZyYWRlYWQub3Jn
Cmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtbWVkaWF0
ZWsK
