Return-Path: <SRS0=u2zk=MW=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-14.7 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=unavailable autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 432A2C4338F
	for <linux-mediatek@archiver.kernel.org>; Fri, 30 Jul 2021 16:26:08 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 07CF360F00
	for <linux-mediatek@archiver.kernel.org>; Fri, 30 Jul 2021 16:26:08 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 07CF360F00
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=1yg2KlVvIXk5GscNO3ypY6oHQyPX/yIGrlcV+iZzUEA=; b=TMoPls0umHEosG
	W1FjU1oMf3lOhNFx8G/Iab5McVrcBLYoWYPkSePbrTErxTLARQT1HKivyocesswRMMLyT26KqcD0E
	uxTWDRm2TnrP3tZFE12xHX1NfM8SzD8O/q2Kz/BzLEcBKU1PsuUEe+b2v6q6klIcaNe7oSrxvNKVv
	sKCBzhfMv0raz2sCOud8YsB9PBzV3+oN8lR59MENzW81O8XVUpSr5MwdS9LHW/Y0wdXvRJDgy0Ig2
	rR7PJbPQrgi+QNltgz7FD9OSaPv9irAjrC745mx+D5DUgzM8dlHgOrWnosaavwcMXIKjgTpw/omFK
	VuBWlB8vLIWzCSULVh4Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1m9VKe-009Uf4-K7; Fri, 30 Jul 2021 16:25:56 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1m9VKK-009UWi-Fr; Fri, 30 Jul 2021 16:25:37 +0000
Received: by mail.kernel.org (Postfix) with ESMTPSA id 2C34361042;
 Fri, 30 Jul 2021 16:25:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1627662336;
 bh=sA63E+oqJJ7UWdv9uF5sfRhQ4j6Gx9VX+xOpdEdo6h0=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=jS9BFccOPTpKkCjJFTCBO88F3DMk2jMCRhK5QLV98IdkyJEYmWlVu2687SC1u+k/Y
 fjZbpEiAHibvKnttArOqEu2LzesWS7xeTlvTq4jNS30COCDt8qjQzLOSTtSWv/Aa0x
 XtwrqpL6Kx+8m3x1IBYfsNOo256Uu5JRBU6r8bgZcjlC/rk7Nf+qlKOb9EobGPA1Gb
 S6NAsJnD9lbiirauTk8rFXJIlvRXyXNDo1Ch4G+ZeHoLIaesAidiGp91wZIGcDdtde
 Nn4tjlBX4lTDcO5FVG8L4+Tpa1FKXmGqpH6Cwyh07jM2tNIcwbkQqjLVrYEITzrOer
 GxNFMn8eJKapQ==
Received: by mail-ej1-f54.google.com with SMTP id gs8so17701297ejc.13;
 Fri, 30 Jul 2021 09:25:36 -0700 (PDT)
X-Gm-Message-State: AOAM532pwmN3yB3Xe3JLUJBGMjm6i6MkhiY6kfOa1arNApz5IvJ/05QU
 PsyDQsIMwgKi5Qjaxg6x1osgrg731Y+vwuMfpg==
X-Google-Smtp-Source: ABdhPJzUHXufwkXoss/77m4sQYQ/EZIV/apB3ArXywXGuhy8awJUzO6fvBpnf0vnZmbGVPevzW+1OUX0QTzvPondd38=
X-Received: by 2002:a17:906:2497:: with SMTP id
 e23mr3371194ejb.194.1627662334694; 
 Fri, 30 Jul 2021 09:25:34 -0700 (PDT)
MIME-Version: 1.0
References: <1627459111-2907-1-git-send-email-chunfeng.yun@mediatek.com>
 <1627459111-2907-9-git-send-email-chunfeng.yun@mediatek.com>
In-Reply-To: <1627459111-2907-9-git-send-email-chunfeng.yun@mediatek.com>
From: Chun-Kuang Hu <chunkuang.hu@kernel.org>
Date: Sat, 31 Jul 2021 00:25:23 +0800
X-Gmail-Original-Message-ID: <CAAOTY__fG3Q9RGfONw4kmgdAnxuZ4bAbD9PaggPSPyfB+5p==A@mail.gmail.com>
Message-ID: <CAAOTY__fG3Q9RGfONw4kmgdAnxuZ4bAbD9PaggPSPyfB+5p==A@mail.gmail.com>
Subject: Re: [PATCH 9/9] phy: phy-mtk-mipi-dsi: convert to
 devm_platform_ioremap_resource
To: Chunfeng Yun <chunfeng.yun@mediatek.com>
Cc: Vinod Koul <vkoul@kernel.org>, Rob Herring <robh+dt@kernel.org>, 
 Chun-Kuang Hu <chunkuang.hu@kernel.org>, Kishon Vijay Abraham I <kishon@ti.com>,
 Philipp Zabel <p.zabel@pengutronix.de>,
 Matthias Brugger <matthias.bgg@gmail.com>, 
 Linux ARM <linux-arm-kernel@lists.infradead.org>, 
 "moderated list:ARM/Mediatek SoC support" <linux-mediatek@lists.infradead.org>,
 linux-phy@lists.infradead.org, 
 DTML <devicetree@vger.kernel.org>, linux-kernel <linux-kernel@vger.kernel.org>,
 DRI Development <dri-devel@lists.freedesktop.org>,
 Eddie Hung <eddie.hung@mediatek.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210730_092536_611536_1CDC5B3E 
X-CRM114-Status: GOOD (  15.11  )
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
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

SGksIENodW5mZW5nOgoKQ2h1bmZlbmcgWXVuIDxjaHVuZmVuZy55dW5AbWVkaWF0ZWsuY29tPiDm
lrwgMjAyMeW5tDfmnIgyOOaXpSDpgLHkuIkg5LiL5Y2IMzo1OeWvq+mBk++8mgo+Cj4gVXNlIGRl
dm1fcGxhdGZvcm1faW9yZW1hcF9yZXNvdXJjZSB0byBzaW1wbGlmeSBjb2RlCgpBY2tlZC1ieTog
Q2h1bi1LdWFuZyBIdSA8Y2h1bmt1YW5nLmh1QGtlcm5lbC5vcmc+Cgo+Cj4gU2lnbmVkLW9mZi1i
eTogQ2h1bmZlbmcgWXVuIDxjaHVuZmVuZy55dW5AbWVkaWF0ZWsuY29tPgo+IC0tLQo+ICBkcml2
ZXJzL3BoeS9tZWRpYXRlay9waHktbXRrLW1pcGktZHNpLmMgfCA3ICsrLS0tLS0KPiAgMSBmaWxl
IGNoYW5nZWQsIDIgaW5zZXJ0aW9ucygrKSwgNSBkZWxldGlvbnMoLSkKPgo+IGRpZmYgLS1naXQg
YS9kcml2ZXJzL3BoeS9tZWRpYXRlay9waHktbXRrLW1pcGktZHNpLmMgYi9kcml2ZXJzL3BoeS9t
ZWRpYXRlay9waHktbXRrLW1pcGktZHNpLmMKPiBpbmRleCA2MWM5NDJmYmY0YTEuLjI4YWQ5NDAz
YzQ0MSAxMDA2NDQKPiAtLS0gYS9kcml2ZXJzL3BoeS9tZWRpYXRlay9waHktbXRrLW1pcGktZHNp
LmMKPiArKysgYi9kcml2ZXJzL3BoeS9tZWRpYXRlay9waHktbXRrLW1pcGktZHNpLmMKPiBAQCAt
MTMwLDcgKzEzMCw2IEBAIHN0YXRpYyBpbnQgbXRrX21pcGlfdHhfcHJvYmUoc3RydWN0IHBsYXRm
b3JtX2RldmljZSAqcGRldikKPiAgewo+ICAgICAgICAgc3RydWN0IGRldmljZSAqZGV2ID0gJnBk
ZXYtPmRldjsKPiAgICAgICAgIHN0cnVjdCBtdGtfbWlwaV90eCAqbWlwaV90eDsKPiAtICAgICAg
IHN0cnVjdCByZXNvdXJjZSAqbWVtOwo+ICAgICAgICAgY29uc3QgY2hhciAqcmVmX2Nsa19uYW1l
Owo+ICAgICAgICAgc3RydWN0IGNsayAqcmVmX2NsazsKPiAgICAgICAgIHN0cnVjdCBjbGtfaW5p
dF9kYXRhIGNsa19pbml0ID0gewo+IEBAIC0xNDgsMTEgKzE0Nyw5IEBAIHN0YXRpYyBpbnQgbXRr
X21pcGlfdHhfcHJvYmUoc3RydWN0IHBsYXRmb3JtX2RldmljZSAqcGRldikKPgo+ICAgICAgICAg
bWlwaV90eC0+ZHJpdmVyX2RhdGEgPSBvZl9kZXZpY2VfZ2V0X21hdGNoX2RhdGEoZGV2KTsKPgo+
IC0gICAgICAgbWVtID0gcGxhdGZvcm1fZ2V0X3Jlc291cmNlKHBkZXYsIElPUkVTT1VSQ0VfTUVN
LCAwKTsKPiAtICAgICAgIG1pcGlfdHgtPnJlZ3MgPSBkZXZtX2lvcmVtYXBfcmVzb3VyY2UoZGV2
LCBtZW0pOwo+IC0gICAgICAgaWYgKElTX0VSUihtaXBpX3R4LT5yZWdzKSkgewo+ICsgICAgICAg
bWlwaV90eC0+cmVncyA9IGRldm1fcGxhdGZvcm1faW9yZW1hcF9yZXNvdXJjZShwZGV2LCAwKTsK
PiArICAgICAgIGlmIChJU19FUlIobWlwaV90eC0+cmVncykpCj4gICAgICAgICAgICAgICAgIHJl
dHVybiBQVFJfRVJSKG1pcGlfdHgtPnJlZ3MpOwo+IC0gICAgICAgfQo+Cj4gICAgICAgICByZWZf
Y2xrID0gZGV2bV9jbGtfZ2V0KGRldiwgTlVMTCk7Cj4gICAgICAgICBpZiAoSVNfRVJSKHJlZl9j
bGspKSB7Cj4gLS0KPiAyLjE4LjAKPgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX18KTGludXgtbWVkaWF0ZWsgbWFpbGluZyBsaXN0CkxpbnV4LW1lZGlhdGVr
QGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9s
aXN0aW5mby9saW51eC1tZWRpYXRlawo=
