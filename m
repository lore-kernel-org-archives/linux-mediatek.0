Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 38F2DC433F5
	for <linux-mediatek@archiver.kernel.org>; Wed, 16 Mar 2022 08:50:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=nD51NytjDK/jWba76uqUm9AJ7PZ6L9G27A8OAhkJ4to=; b=c1KW5414AT7IC9
	BsW+Q6InG9AvhbpORkxGZpxX9BCjd8im5/N4it2YcoPNz9pxWwGezqAuBTQOpOeM3TH7uCte1pDIV
	6Tk18zkZJbviIMhW8oaI5i7cSXWddONAgE/k+DqJkF970LV8yZIEDUkRlWTbEaCgny5eUIvEwjMOi
	/Wvzup7iomCdJO4sOL+4Nw9JVWXHHtPVHcagjJJRdi1+Bs0VAsmVDMGJ7oS9N7a0czph4uh3IRgIQ
	TTUl7DY6j+QhXDk2vAVTkXB4tQMGvt3jMCk+KfI5y8ytdFolouHRFBysD09hX+oIlNacNuA2gh/jg
	MoZvDpDoUoWd9OIovLnw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nUPMD-00CDu8-WA; Wed, 16 Mar 2022 08:50:14 +0000
Received: from bhuna.collabora.co.uk ([46.235.227.227])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nUPLv-00CDnX-Av; Wed, 16 Mar 2022 08:49:57 +0000
Received: from [127.0.0.1] (localhost [127.0.0.1])
 (Authenticated sender: kholk11) with ESMTPSA id 8E38B1F42733
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1647420594;
 bh=tB66TbykoyRuCQTUG/BUm2gTEb/zfXeS1QShvZrZ3cI=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=l2KY2+et+JM2EnehlF7yfh95/xSJPPuKCNqM/xv645c16tLUeTYamXldQSlTtLAvU
 wYIN4rsjnhZzKivS5TxpaFSpUfVN/ZwxNzEU/Dx1ql2IECazOa08zyEiwvv01dnIw3
 cXExk3h7CqAd+0QbodnNAVtNs5xcFZj0RjXBHE24RUIbVPE2oUqd62UuZ+3Ne9t2/g
 PEW8xv3C+gKUNQqjm7Hsp1FcG+F4poCz7K+Xyfihb+juAya2nuoU5WQ9rUncH2iBsj
 S2bRfbY9shy8YfLRGO/bGNUbr304a/Jo4KmDbcKRCFCcCWa2wwUQegz5CyI71bNEFs
 70P5mzh/6xWTw==
Message-ID: <6d599c20-0331-d19b-5d20-27a3d3e63533@collabora.com>
Date: Wed, 16 Mar 2022 09:49:51 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.1
Subject: Re: [PATCH v1 0/4] dt-bindings: pinctrl: mt8192: Add missing wrapping
 node and properties
Content-Language: en-US
To: =?UTF-8?B?TsOtY29sYXMgRi4gUi4gQS4gUHJhZG8=?= <nfraprado@collabora.com>,
 Linus Walleij <linus.walleij@linaro.org>, Rob Herring <robh+dt@kernel.org>
Cc: kernel@collabora.com, Matthias Brugger <matthias.bgg@gmail.com>,
 Sean Wang <sean.wang@mediatek.com>, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-gpio@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-mediatek@lists.infradead.org
References: <20220315211936.442708-1-nfraprado@collabora.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
In-Reply-To: <20220315211936.442708-1-nfraprado@collabora.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220316_014955_544126_E07E96F0 
X-CRM114-Status: GOOD (  12.98  )
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

SWwgMTUvMDMvMjIgMjI6MTksIE7DrWNvbGFzIEYuIFIuIEEuIFByYWRvIGhhIHNjcml0dG86Cj4g
Cj4gVGhpcyBzZXJpZXMgYWRkcyB0aGUgd3JhcHBpbmcgbm9kZSBmb3IgcGlubXV4IG5vZGVzIHRo
YXQgd2FzIG1pc3NpbmcgaW4KPiB0aGUgbXQ4MTkyLXBpbmN0cmwgZHQtYmluZGluZyBhcyB3ZWxs
IGFzIGEgY291cGxlIG90aGVyIG1pc3NpbmcKPiBwcm9wZXJ0aWVzLgo+IAo+IAo+IE7DrWNvbGFz
IEYuIFIuIEEuIFByYWRvICg0KToKPiAgICBkdC1iaW5kaW5nczogcGluY3RybDogbXQ4MTkyOiBB
ZGQgd3JhcHBpbmcgbm9kZSBmb3IgcGluIGNvbmZpZ3VyYXRpb25zCj4gICAgZHQtYmluZGluZ3M6
IHBpbmN0cmw6IG10ODE5MjogQWRkIG1lZGlhdGVrLGRyaXZlLXN0cmVuZ3RoLWFkdiBwcm9wZXJ0
eQo+ICAgIGR0LWJpbmRpbmdzOiBwaW5jdHJsOiBtdDgxOTI6IEFkZCBtZWRpYXRlayxwdWxsLXVw
LWFkdiBwcm9wZXJ0eQo+ICAgIGR0LWJpbmRpbmdzOiBwaW5jdHJsOiBtdDgxOTI6IEFkZCBncGlv
LWxpbmUtbmFtZXMgcHJvcGVydHkKPiAKPiAgIC4uLi9iaW5kaW5ncy9waW5jdHJsL3BpbmN0cmwt
bXQ4MTkyLnlhbWwgICAgICB8IDE1NSArKysrKysrKysrKy0tLS0tLS0KPiAgIDEgZmlsZSBjaGFu
Z2VkLCA5OCBpbnNlcnRpb25zKCspLCA1NyBkZWxldGlvbnMoLSkKPiAKCkhlbGxvIG1haW50YWlu
ZXJzLAphZGRpbmcgY29udGV4dCB0byB0aGlzIHNlcmllcy4KCldlIGFyZSBpbiB0aGUgcHJvY2Vz
cyBvZiB1cHN0cmVhbWluZyBtdDgxOTItYXN1cmFkYSBkZXZpY2UgdHJlZXMgYW5kIGR1cmluZwp0
aGUgY2xlYW51cCBwcm9jZXNzIGFuZCBpbnRlcm5hbCBwZWVyLXJldmlldyBvZiB0aG9zZSwgd2Ug
aGF2ZSBmb3VuZCBhbmQgZml4ZWQKdGhvc2UgaXNzdWVzIG9uIHRoZSBkdC1iaW5kaW5ncyBmb3Ig
cGluY3RybC1tdDgxOTIgd2l0aCB0aGlzIHBhdGNoIHNlcmllcy4KCkJlZm9yZSBzdWJtaXR0aW5n
IHRoZSBzZXJpZXMgdGhhdCBpbnRyb2R1Y2VzIHRoZSBkZXZpY2UtdHJlZXMgZm9yIHRob3NlIG1h
Y2hpbmVzCndlIG5lZWQgc29tZSBtb3JlIHRoaW5ncyBpbiBtdDgxOTIuZHRzaSwgd2hpY2ggYXJl
IGluIHRoZSBwcm9jZXNzIG9mIGJlaW5nCnVwc3RyZWFtZWQgYnkgTWVkaWFUZWsgKGN1cnJlbnRs
eSBhdCB2MyBbMV0gLSB0aGF0IG5lZWRzIHNtYWxsIGNoYW5nZXMsIGJ1dCB3ZQpleHBlY3QgdjQg
dG8gYmUgZmluYWxseSBvaykuCgpGb3IgdGhpcyByZWFzb24sIHdlIGFyZSBzdWJtaXR0aW5nIGR0
LWJpbmRpbmdzIGZpeGVzIG5vdywgYXMgdG8gaGF2ZSBhIHJlYWR5Cmdyb3VuZCBiZWZvcmUgc3Vi
bWl0dGluZyB0aGUgYWZvcmVtZW50aW9uZWQgZGV2aWNlLXRyZWVzIChmb3Igd2hpY2gsIHdlIGFu
eXdheQpuZWVkIHRvIHdhaXQgYSBsaXR0bGUsIGFzIGp1c3QgbWVudGlvbmVkKS4KClsxXTogaHR0
cHM6Ly9sb3JlLmtlcm5lbC5vcmcvYWxsLzIwMjIwMzA0MTMwODA5LjEyOTI0LTEtYWxsZW4ta2gu
Y2hlbmdAbWVkaWF0ZWsuY29tLwoKQ2hlZXJzLApBbmdlbG8KCl9fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fCkxpbnV4LW1lZGlhdGVrIG1haWxpbmcgbGlzdApM
aW51eC1tZWRpYXRla0BsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQu
b3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtbWVkaWF0ZWsK
