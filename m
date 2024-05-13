Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6A457C25B74
	for <linux-mediatek@archiver.kernel.org>; Mon, 13 May 2024 14:35:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Message-ID:MIME-Version:
	Content-Type:Content-Transfer-Encoding:Subject:Cc:To:From:Date:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=PFnpTfOL55B98whOBYqeX5GtqS8lO3C48yZIUQx7zyc=; b=fc6vRWS+XtQRmg2GBOAKgC2aW3
	J0mE4KzJ59ISIhBhHrf66nUPK8RKfDTILK03pjr25VUYgCvc1GJfp0XKERmD9Fv48NSkIfGwXQIyF
	quMlXWqTycS78xXqY7MEhnaALzqqpQFfD1fyxE2ImuIfvk9jISUeKp4ztq/xo7i+LUhSohjZrvaHA
	k6qRGij0IMQczbos+zArBK0403L2dj1dPsUCnkJ+NKHdiQFaI/3Ln4W2g5cbY13quT5gteVqifIeZ
	oA29+hY35JPXVzmzJONJXiDmn9Kz2lX7hXZ5KVS8TInKrJMvYMz0sBvVcbyJvmtCq61/E2wymlsUx
	YD9rV3FA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s6Wlm-0000000DCw1-3hGH;
	Mon, 13 May 2024 14:35:14 +0000
Received: from m16.mail.163.com ([220.197.31.4])
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s6Wlj-0000000DCu7-3qQb
	for linux-mediatek@lists.infradead.org;
	Mon, 13 May 2024 14:35:13 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=Date:From:Subject:Content-Type:MIME-Version:
	Message-ID; bh=9nzg/fErxEjKWjyhShJtIW1S2P310lBM8cdNG0yqw2E=; b=S
	q//C1p7vO9sEZTIzIOaq5C79zEs67w1lOgXscsJi2RfqBaGaAGTChO1TTrjDwk0i
	bWm1rtp0gHw2qnFB9fQo4WdclAZpvefL0GX30KgT3oVok01B8IDg+Hc4S0J98bqZ
	0ZVOpEWhGclYEweVc9mJIgCJy40l3qa3zUAw7ry9UY=
Received: from congei42$163.com ( [159.226.94.118] ) by
 ajax-webmail-wmsvr-40-139 (Coremail) ; Mon, 13 May 2024 22:34:45 +0800
 (CST)
X-Originating-IP: [159.226.94.118]
Date: Mon, 13 May 2024 22:34:45 +0800 (CST)
From: sicong <congei42@163.com>
To: nbd@nbd.name, lorenzo@kernel.org, ryder.lee@mediatek.com, 
	shayne.chen@mediatek.com, sean.wang@mediatek.com, kvalo@kernel.org, 
	matthias.bgg@gmail.com, angelogioacchino.delregno@collabora.com
Cc: linux-wireless@vger.kernel.org, linux-mediatek@lists.infradead.org
Subject: [PATCH v1] wifi: mt76: mt7615: fix null pointer dereference bug
X-Priority: 3
X-Mailer: Coremail Webmail Server Version XT5.0.14 build 20230109(dcb5de15)
 Copyright (c) 2002-2024 www.mailtech.cn 163com
X-NTES-SC: AL_Qu2aB/qav0Aj4yOdYOkfm0YUj+44Wsa4uvgk2YJeOpt4jBHo2yEbXHxAJUH3z96DCxCKmxuUSSZ39+txcKNgZYAKsjYvNC++oOzKkizu8n3qqQ==
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset=GBK
MIME-Version: 1.0
Message-ID: <6206228d.bdee.18f72609cf4.Coremail.congei42@163.com>
X-Coremail-Locale: zh_CN
X-CM-TRANSID: _____wD3f8MFJUJmWPQkAA--.696W
X-CM-SenderInfo: 5frqwvrlusqiywtou0bp/1tbizQfd8mV4HLKD6AAKs3
X-Coremail-Antispam: 1U5529EdanIXcx71UUUUU7vcSsGvfC2KfnxnUU==
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240513_073512_452830_EB19B77C 
X-CRM114-Status: UNSURE (   6.54  )
X-CRM114-Notice: Please train this message.
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

RnVuY3Rpb24gbXQ3NjE1X2NvcmVkdW1wX3dvcmsgd2lsbCBjYWxsIHZ6YWxsb2MgdG8gYWxsb2Nh
dGUgYSBsYXJnZSBhbW91bnQKb2YgbWVtb3J5IHNwYWNlLCB0aGUgc2l6ZSBvZiB3aGljaCBpcyAx
MzAwS0IuIFRoZXJlIHNob3VsZCBiZSBhIG51bGwKcG9pbnRlciBjaGVjayBhZnRlciB2emFsbG9j
LiBPdGhlcndpc2UsIHdoZW4gdGhlIG1lbW9yeSBhbGxvY2F0aW9uIGZhaWxzCmFuZCByZXR1cm5z
IE5VTEwsIHRoZSBmdW5jdGlvbiB3aWxsIGNhdXNlIGtlcm5lbCBjcmFzaC4KCkZpeGVzOiBkZTc5
MTA5ODQ1OWQgKCJ3aWZpOiBtdDc2OiBtdDc2MTU6IGZpeCBudWxsIHBvaW50ZXIgZGVyZWZlcmVu
Y2UgYnVnIikKU2lnbmVkLW9mZi1ieTogU2ljb25nIEh1YW5nIDxjb25nZWk0MkAxNjMuY29tPgot
LS0KIGRyaXZlcnMvbmV0L3dpcmVsZXNzL21lZGlhdGVrL210NzYvbXQ3NjE1L21hYy5jIHwgMyAr
KysKIDEgZmlsZSBjaGFuZ2VkLCAzIGluc2VydGlvbnMoKykKCmRpZmYgLS1naXQgYS9kcml2ZXJz
L25ldC93aXJlbGVzcy9tZWRpYXRlay9tdDc2L210NzYxNS9tYWMuYyBiL2RyaXZlcnMvbmV0L3dp
cmVsZXNzL21lZGlhdGVrL210NzYvbXQ3NjE1L21hYy5jCmluZGV4IDdiYTc4OTgzNGU4ZC4uMDRl
YjUyOTA0NTIwIDEwMDY0NAotLS0gYS9kcml2ZXJzL25ldC93aXJlbGVzcy9tZWRpYXRlay9tdDc2
L210NzYxNS9tYWMuYworKysgYi9kcml2ZXJzL25ldC93aXJlbGVzcy9tZWRpYXRlay9tdDc2L210
NzYxNS9tYWMuYwpAQCAtMjM0MSw2ICsyMzQxLDkgQEAgdm9pZCBtdDc2MTVfY29yZWR1bXBfd29y
ayhzdHJ1Y3Qgd29ya19zdHJ1Y3QgKndvcmspCiAJfQogCiAJZHVtcCA9IHZ6YWxsb2MoTVQ3Nl9D
T05OQUNfQ09SRURVTVBfU1opOworCWlmKCFkdW1wKQorCQlyZXR1cm47CisKIAlkYXRhID0gZHVt
cDsKIAogCXdoaWxlICh0cnVlKSB7Ci0tIAoyLjM0LjE=

