Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1BD9CC77B61
	for <linux-mediatek@archiver.kernel.org>; Thu, 13 Apr 2023 07:09:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Message-ID:MIME-Version:
	Content-Type:Content-Transfer-Encoding:References:In-Reply-To:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=SrWcNxMdNnmNL1YNAZ1BoqdUY6ZiX/ulM0Bs6YCWDrs=; b=nQxpkGNGGrksg2+ZRBAOrDNCMb
	xByvVPtjN2PN2fP9Th21vlud7C0htpzTgqZOsObUVD0Gd+iHbtVxC5PV6+EfkZNwaJK9pw+Mhcp3O
	MnewVOkuFRMIkLeRASF9BaKHcB5I/+mqG2RIb0hBUEupfqeiaEBBKShnw/S2Mj7m78OtfNOkHhiG8
	H3/UBCxIz7+pHMJObyUnVx7xNWBSyPA5KCS0JuNnP0n952VsmU/sAZnvLqmlOBEDaoYD2hp6wks5k
	nWzKXGU37tcr2ZJKdk4frhaPP7t9EYn3dcaGcFcE2OMj278kA+t/3dfuqvUlNkJgBlDAVRNwnTyZL
	U2zGk4+w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pmr4s-005E7R-1L;
	Thu, 13 Apr 2023 07:09:06 +0000
Received: from mail.hust.edu.cn ([202.114.0.240] helo=hust.edu.cn)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pmr4p-005E5r-0Q;
	Thu, 13 Apr 2023 07:09:05 +0000
Received: from ziqin_l$hust.edu.cn ( [172.16.0.254] ) by ajax-webmail-app2
 (Coremail) ; Thu, 13 Apr 2023 15:08:34 +0800 (GMT+08:00)
X-Originating-IP: [172.16.0.254]
Date: Thu, 13 Apr 2023 15:08:34 +0800 (GMT+08:00)
X-CM-HeaderCharset: UTF-8
From: =?UTF-8?B?5YiY57Sr55C0?= <ziqin_l@hust.edu.cn>
To: "Matthias Brugger" <matthias.bgg@gmail.com>, 
	"AngeloGioacchino Del Regno" <angelogioacchino.delregno@collabora.com>
Cc: "Dongliang Mu" <dzm91@hust.edu.cn>, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, 
	linux-mediatek@lists.infradead.org
Subject: Re: [PATCH] soc: mediatek: mtk-svs: change the function
 IS_ERR_OR_NULL() to IS_ERR()
X-Priority: 3
X-Mailer: Coremail Webmail Server Version XT5.0.14 build 20220802(cbd923c5)
 Copyright (c) 2002-2023 www.mailtech.cn hust
In-Reply-To: <20230406024200.3126080-1-ziqin_l@hust.edu.cn>
References: <20230406024200.3126080-1-ziqin_l@hust.edu.cn>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset=UTF-8
MIME-Version: 1.0
Message-ID: <1b48b0ec.3b004.1877971d059.Coremail.ziqin_l@hust.edu.cn>
X-Coremail-Locale: zh_CN
X-CM-TRANSID: GQEQrABnSU5yqjdk_XmWAg--.41327W
X-CM-SenderInfo: bgsqjjiyqwkmo6kx23oohg3hdfq/1tbiAQoAEl7Em5AGOAAAs2
X-Coremail-Antispam: 1Ur529EdanIXcx71UUUUU7IcSsGvfJ3iIAIbVAYjsxI4VWUCw
	CS07vEb4IE77IF4wCS07vE1I0E4x80FVAKz4kxMIAIbVAFxVCaYxvI4VCIwcAKzIAtYxBI
	daVFxhVjvjDU=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230413_000903_550488_113465A9 
X-CRM114-Status: GOOD (  10.82  )
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
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

cGluZz8KCiJaaXFpbiBMaXUiIDx6aXFpbl9sQGh1c3QuZWR1LmNuPuWGmemBk++8mgo+IG52bWVt
X2NlbGxfZ2V0KCkgd2lsbCByZXR1cm4gYW4gRVJSX1BUUigpIG9uIGVycm9yIG9yIGEgdmFsaWQg
cG9pbnRlciB0byBhDQo+IHN0cnVjdCBudm1lbV9jZWxsIGJ1dCB3b24ndCByZXR1cm4gTlVMTCwg
dGhlIGNoZWNrIGZ1bmN0aW9uIHNob3VsZCBiZQ0KPiBJU19FUlIoKSBpbnN0ZWFkIG9mIElTX0VS
Ul9PUl9OVUxMKCkNCj4gDQo+IFNpZ25lZC1vZmYtYnk6IFppcWluIExpdSA8emlxaW5fbEBodXN0
LmVkdS5jbj4NCj4gUmV2aWV3ZWQtYnk6IERvbmdsaWFuZyBNdSA8ZHptOTFAaHVzdC5lZHUuY24+
DQo+IC0tLQ0KPiAgZHJpdmVycy9zb2MvbWVkaWF0ZWsvbXRrLXN2cy5jIHwgMiArLQ0KPiAgMSBm
aWxlIGNoYW5nZWQsIDEgaW5zZXJ0aW9uKCspLCAxIGRlbGV0aW9uKC0pDQo+IA0KPiBkaWZmIC0t
Z2l0IGEvZHJpdmVycy9zb2MvbWVkaWF0ZWsvbXRrLXN2cy5jIGIvZHJpdmVycy9zb2MvbWVkaWF0
ZWsvbXRrLXN2cy5jDQo+IGluZGV4IGE3ZWIwMTliNTE1Ny4uODEyN2ZiNmQ1ODdiIDEwMDY0NA0K
PiAtLS0gYS9kcml2ZXJzL3NvYy9tZWRpYXRlay9tdGstc3ZzLmMNCj4gKysrIGIvZHJpdmVycy9z
b2MvbWVkaWF0ZWsvbXRrLXN2cy5jDQo+IEBAIC0xNzI2LDcgKzE3MjYsNyBAQCBzdGF0aWMgaW50
IHN2c19nZXRfZWZ1c2VfZGF0YShzdHJ1Y3Qgc3ZzX3BsYXRmb3JtICpzdnNwLA0KPiAgCXN0cnVj
dCBudm1lbV9jZWxsICpjZWxsOw0KPiAgDQo+ICAJY2VsbCA9IG52bWVtX2NlbGxfZ2V0KHN2c3At
PmRldiwgbnZtZW1fY2VsbF9uYW1lKTsNCj4gLQlpZiAoSVNfRVJSX09SX05VTEwoY2VsbCkpIHsN
Cj4gKwlpZiAoSVNfRVJSKGNlbGwpKSB7DQo+ICAJCWRldl9lcnIoc3ZzcC0+ZGV2LCAibm8gXCIl
c1wiPyAlbGRcbiIsDQo+ICAJCQludm1lbV9jZWxsX25hbWUsIFBUUl9FUlIoY2VsbCkpOw0KPiAg
CQlyZXR1cm4gUFRSX0VSUihjZWxsKTsNCj4gLS0gDQo+IDIuMjUuMQ0K

