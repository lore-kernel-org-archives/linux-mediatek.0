Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CA391C433EF
	for <linux-mediatek@archiver.kernel.org>; Sat, 14 May 2022 02:12:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:From:
	References:CC:To:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=cAnolO+N3WkVN885cSAqTgc6qDP8EO2NIm+ytNfKS8g=; b=HV1HECQMRAQtv7J8LUf0QYXyCe
	LsSbTxtjEKvsUM/o42+GxhiZUwt+31re1n4xOqDwkmFPFQNFNBNH14nFmGNdNJVoVdkXY0R3idBGF
	H/Juqp1TwQguORasWheL2MLdk4uU0CuWBtLE5/0cxx1iuVDiFNdhInsLH2eZ15JxLg8eE//JslEgD
	XfoJnw6Tanmtz2wsEyHKavbazHSt0KL1gS5Gfk6xR33B/KO9DsKKUbFRLa81grAaFhJ6OvcNBSt+B
	bPnk5K61ltOFFoI80HDiuOJydGQ5pG3C27rwBvaMnFlFwdz6PIuWr6UW+ntOndiI4SEOp0mxgDORe
	QxJaq3MQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nphG7-000Y2a-Uk; Sat, 14 May 2022 02:11:55 +0000
Received: from szxga02-in.huawei.com ([45.249.212.188])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nphFw-000Y0R-F9; Sat, 14 May 2022 02:11:46 +0000
Received: from dggpemm500023.china.huawei.com (unknown [172.30.72.53])
 by szxga02-in.huawei.com (SkyGuard) with ESMTP id 4L0TTF0NSQzGpXB;
 Sat, 14 May 2022 10:08:49 +0800 (CST)
Received: from dggpemm500007.china.huawei.com (7.185.36.183) by
 dggpemm500023.china.huawei.com (7.185.36.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.24; Sat, 14 May 2022 10:11:39 +0800
Received: from [10.174.178.174] (10.174.178.174) by
 dggpemm500007.china.huawei.com (7.185.36.183) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.24; Sat, 14 May 2022 10:11:39 +0800
Subject: Re: [PATCH -next 1/2] i2c: mt7621: fix missing
 clk_disable_unprepare() on error in mtk_i2c_probe()
To: Christophe JAILLET <christophe.jaillet@wanadoo.fr>,
 <linux-kernel@vger.kernel.org>, <linux-mediatek@lists.infradead.org>,
 <linux-arm-kernel@lists.infradead.org>, <linux-i2c@vger.kernel.org>
CC: <matthias.bgg@gmail.com>, <sr@denx.de>, <wsa@the-dreams.de>
References: <20220513100819.2711845-1-yangyingliang@huawei.com>
 <0fa271ed-e61e-4415-a78f-b2dee74b2f98@wanadoo.fr>
From: Yang Yingliang <yangyingliang@huawei.com>
Message-ID: <4958c580-bcdb-c4bf-7669-b4ced4c2ec2f@huawei.com>
Date: Sat, 14 May 2022 10:11:38 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:68.0) Gecko/20100101
 Thunderbird/68.7.0
MIME-Version: 1.0
In-Reply-To: <0fa271ed-e61e-4415-a78f-b2dee74b2f98@wanadoo.fr>
Content-Language: en-US
X-Originating-IP: [10.174.178.174]
X-ClientProxiedBy: dggems706-chm.china.huawei.com (10.3.19.183) To
 dggpemm500007.china.huawei.com (7.185.36.183)
X-CFilter-Loop: Reflected
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220513_191144_725371_7052F572 
X-CRM114-Status: GOOD (  13.00  )
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

Ck9uIDIwMjIvNS8xNCAwOjE1LCBDaHJpc3RvcGhlIEpBSUxMRVQgd3JvdGU6Cj4gTGUgMTMvMDUv
MjAyMiDDoCAxMjowOCwgWWFuZyBZaW5nbGlhbmcgYSDDqWNyaXTCoDoKPj4gRml4IHRoZSBtaXNz
aW5nIGNsa19kaXNhYmxlX3VucHJlcGFyZSgpIGJlZm9yZSByZXR1cm4KPj4gZnJvbSBtdGtfaTJj
X3Byb2JlKCkgaW4gdGhlIGVycm9yIGhhbmRsaW5nIGNhc2UuCj4+Cj4+IEZpeGVzOiBkMDQ5MTNl
YzVmODkgKCJpMmM6IG10NzYyMTogQWRkIE1lZGlhVGVrIE1UNzYyMS83NjI4Lzc2ODggSTJDIAo+
PiBkcml2ZXIiKQo+PiBTaWduZWQtb2ZmLWJ5OiBZYW5nIFlpbmdsaWFuZyA8eWFuZ3lpbmdsaWFu
Z0BodWF3ZWkuY29tPgo+PiAtLS0KPj4gwqAgZHJpdmVycy9pMmMvYnVzc2VzL2kyYy1tdDc2MjEu
YyB8IDggKysrKysrLS0KPj4gwqAgMSBmaWxlIGNoYW5nZWQsIDYgaW5zZXJ0aW9ucygrKSwgMiBk
ZWxldGlvbnMoLSkKPj4KPj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvaTJjL2J1c3Nlcy9pMmMtbXQ3
NjIxLmMgCj4+IGIvZHJpdmVycy9pMmMvYnVzc2VzL2kyYy1tdDc2MjEuYwo+PiBpbmRleCA0NWZl
NGE3ZmUwYzAuLmYxMTdjM2Q5Y2ExOSAxMDA2NDQKPj4gLS0tIGEvZHJpdmVycy9pMmMvYnVzc2Vz
L2kyYy1tdDc2MjEuYwo+PiArKysgYi9kcml2ZXJzL2kyYy9idXNzZXMvaTJjLW10NzYyMS5jCj4+
IEBAIC0zMDQsNyArMzA0LDggQEAgc3RhdGljIGludCBtdGtfaTJjX3Byb2JlKHN0cnVjdCBwbGF0
Zm9ybV9kZXZpY2UgCj4+ICpwZGV2KQo+PiDCoCDCoMKgwqDCoMKgIGlmIChpMmMtPmJ1c19mcmVx
ID09IDApIHsKPj4gwqDCoMKgwqDCoMKgwqDCoMKgIGRldl93YXJuKGkyYy0+ZGV2LCAiY2xvY2st
ZnJlcXVlbmN5IDAgbm90IHN1cHBvcnRlZFxuIik7Cj4+IC3CoMKgwqDCoMKgwqDCoCByZXR1cm4g
LUVJTlZBTDsKPj4gK8KgwqDCoMKgwqDCoMKgIHJldCA9IC1FSU5WQUw7Cj4+ICvCoMKgwqDCoMKg
wqDCoCBnb3RvIGVycl9kaXNhYmxlX2NsazsKPj4gwqDCoMKgwqDCoCB9Cj4+IMKgIMKgwqDCoMKg
wqAgYWRhcCA9ICZpMmMtPmFkYXA7Cj4+IEBAIC0zMjIsMTAgKzMyMywxMyBAQCBzdGF0aWMgaW50
IG10a19pMmNfcHJvYmUoc3RydWN0IHBsYXRmb3JtX2RldmljZSAKPj4gKnBkZXYpCj4+IMKgIMKg
wqDCoMKgwqAgcmV0ID0gaTJjX2FkZF9hZGFwdGVyKGFkYXApOwo+PiDCoMKgwqDCoMKgIGlmIChy
ZXQgPCAwKQo+PiAtwqDCoMKgwqDCoMKgwqAgcmV0dXJuIHJldDsKPj4gK8KgwqDCoMKgwqDCoMKg
IGdvdG8gZXJyX2Rpc2FibGVfY2xrOwo+PiDCoCDCoMKgwqDCoMKgIGRldl9pbmZvKCZwZGV2LT5k
ZXYsICJjbG9jayAldSBrSHpcbiIsIGkyYy0+YnVzX2ZyZXEgLyAxMDAwKTsKPgo+IEhpLAo+Cj4g
c2hvdWxkJ250IHdlIGhhdmUgYToKPiDCoMKgwqDCoHJldHVybiAwOwo+IGhlcmU/Cj4KPiBvdGhl
cndpc2Ugd2Ugd2lsbCBjYWxsIGNsa19kaXNhYmxlX3VucHJlcGFyZSgpIGV2ZW4gb24gdGhlIG5v
cm1hbCBwYXRoLgpZZXMsIEkgbWlzc2VkIHRoYXQuCgpUaGFua3MsCllhbmcKPgo+IENKCj4KPj4g
wqAgK2Vycl9kaXNhYmxlX2NsazoKPj4gK8KgwqDCoCBjbGtfZGlzYWJsZV91bnByZXBhcmUoaTJj
LT5jbGspOwo+PiArCj4+IMKgwqDCoMKgwqAgcmV0dXJuIHJldDsKPj4gwqAgfQo+Cj4gLgoKX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTGludXgtbWVkaWF0
ZWsgbWFpbGluZyBsaXN0CkxpbnV4LW1lZGlhdGVrQGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDov
L2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1tZWRpYXRlawo=
