Return-Path: <SRS0=yMRY=6U=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.2 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 216B8C28CBC
	for <linux-mediatek@archiver.kernel.org>; Wed,  6 May 2020 13:01:26 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id E0260206DD
	for <linux-mediatek@archiver.kernel.org>; Wed,  6 May 2020 13:01:25 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="W9sv4qqo";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=mg.codeaurora.org header.i=@mg.codeaurora.org header.b="IVUWaCYZ"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org E0260206DD
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:Content-Type:
	Content-Transfer-Encoding:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:From:
	References:To:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=U7lusaNfTFcjQpODx2F+TbWfWn1lN6I2wIRV5TvS5SU=; b=W9sv4qqoZtOuaFPU45oL2LoDc
	i5C7t+TuCNDLy/UuxNWj7Jrh45k3pBOcjPpWSVaZLmo7JcrL7QSPkeC5LEAv8iP4hCqZrJENCK96o
	PKyvrjV+Gya6AbyjWFHch4SWj4zqxnNFQHxpDD6aSba6ovEtyytShYdzr4c6293ms5Rw98UxJtG0y
	3twr0HrTbvIPAkdAXxZNL8eI3Vub24a98GYLSvSJ72CwZLfsM/XRgo/5eIm6G7O8XzO/7OZ5ypJc9
	IhF3LxTpmtD1XJGwfzi+vfaIh/QQ9Gq53k2jfQ24ul2gWm4/r2WJjc/ZJorEka2C3Hdqgqq0EhW+X
	SXCDrv3pg==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jWJfp-0006Yb-B1; Wed, 06 May 2020 13:01:17 +0000
Received: from mail26.static.mailgun.info ([104.130.122.26])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jWJff-0006Qe-OB
 for linux-mediatek@lists.infradead.org; Wed, 06 May 2020 13:01:13 +0000
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org;
 q=dns/txt; 
 s=smtp; t=1588770072; h=Content-Transfer-Encoding: Content-Type:
 In-Reply-To: MIME-Version: Date: Message-ID: From: References: Cc: To:
 Subject: Sender; bh=EEVpYpqQ1QRwHdkwdt5mqy1ieqOZLEZitiAbr0eLLME=;
 b=IVUWaCYZ+WLuAqzq1QbiemRI3rX6I118ERgAHXFctKNGnCkEumENhMTR9eepOS/A8ts8hIda
 ZPfHx5zhkiWwV0eLEKC6fKNBkzA5ouUOFeiHRMgyTOcOgeq2aTRMEEWxVXC624wLC+V8EGi4
 6Q0+nc/A+TsUIlqD6mF5IeNoxMU=
X-Mailgun-Sending-Ip: 104.130.122.26
X-Mailgun-Sid: WyI0ZDIyMyIsICJsaW51eC1tZWRpYXRla0BsaXN0cy5pbmZyYWRlYWQub3JnIiwgImJlOWU0YSJd
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171])
 by mxa.mailgun.org with ESMTP id 5eb2b4e8.7f8aaeb0d8f0-smtp-out-n01;
 Wed, 06 May 2020 13:00:24 -0000 (UTC)
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
 id 018EBC44BFA; Wed,  6 May 2020 13:00:20 +0000 (UTC)
Received: from [192.168.43.57] (unknown [27.59.131.204])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested) (Authenticated sender: vbadigan)
 by smtp.codeaurora.org (Postfix) with ESMTPSA id B9225C433BA;
 Wed,  6 May 2020 13:00:07 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org B9225C433BA
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org;
 dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org;
 spf=none smtp.mailfrom=vbadigan@codeaurora.org
Subject: Re: [PATCH v5 1/5] mmc: core: Extend mmc_of_parse() to parse CQE
 bindings
To: Chun-Hung Wu <chun-hung.wu@mediatek.com>, mirq-linux@rere.qmqm.pl,
 Jonathan Hunter <jonathanh@nvidia.com>, Al Cooper <alcooperx@gmail.com>,
 Adrian Hunter <adrian.hunter@intel.com>,
 Florian Fainelli <f.fainelli@gmail.com>,
 bcm-kernel-feedback-list@broadcom.com, Andy Gross <agross@kernel.org>,
 Bjorn Andersson <bjorn.andersson@linaro.org>,
 Michal Simek <michal.simek@xilinx.com>,
 Thierry Reding <thierry.reding@gmail.com>,
 Chaotian Jing <chaotian.jing@mediatek.com>,
 Ulf Hansson <ulf.hansson@linaro.org>, Rob Herring <robh+dt@kernel.org>,
 Mark Rutland <mark.rutland@arm.com>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 Linus Walleij <linus.walleij@linaro.org>, Pavel Machek <pavel@ucw.cz>,
 Kate Stewart <kstewart@linuxfoundation.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 Pan Bian <bianpan2016@163.com>, Thomas Gleixner <tglx@linutronix.de>,
 Allison Randal <allison@lohutok.net>, Mathieu Malaterre <malat@debian.org>,
 Stanley Chu <stanley.chu@mediatek.com>,
 Kuohong Wang <kuohong.wang@mediatek.com>, Yong Mao <yong.mao@mediatek.com>
References: <1588031768-23677-1-git-send-email-chun-hung.wu@mediatek.com>
 <1588031768-23677-2-git-send-email-chun-hung.wu@mediatek.com>
From: Veerabhadrarao Badiganti <vbadigan@codeaurora.org>
Message-ID: <9bc2454f-0b42-e256-7927-2564b56f369f@codeaurora.org>
Date: Wed, 6 May 2020 18:30:04 +0530
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.7.0
MIME-Version: 1.0
In-Reply-To: <1588031768-23677-2-git-send-email-chun-hung.wu@mediatek.com>
Content-Language: en-US
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200506_060112_110779_CA127AE0 
X-CRM114-Status: GOOD (  18.14  )
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
Cc: devicetree@vger.kernel.org, wsd_upstream@mediatek.com,
 linux-arm-msm@vger.kernel.org, linux-mmc@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-mediatek@lists.infradead.org,
 linux-tegra@vger.kernel.org, kernel-team@android.com,
 linux-arm-kernel@lists.infradead.org
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

Ck9uIDQvMjgvMjAyMCA1OjI2IEFNLCBDaHVuLUh1bmcgV3Ugd3JvdGU6Cj4gUGFyc2UgQ1FFIGJp
bmRpbmdzICJzdXBwb3J0cy1jcWUiIGFuZCAiZGlzYWJsZS1jcWUtZGNtZCIKPiBpbiBtbWNfb2Zf
cGFyc2UoKS4KPgo+IFNpZ25lZC1vZmYtYnk6IENodW4tSHVuZyBXdSA8Y2h1bi1odW5nLnd1QG1l
ZGlhdGVrLmNvbT4KPiAtLS0KPiAgIGRyaXZlcnMvbW1jL2NvcmUvaG9zdC5jIHwgNSArKysrKwo+
ICAgMSBmaWxlIGNoYW5nZWQsIDUgaW5zZXJ0aW9ucygrKQo+Cj4gZGlmZiAtLWdpdCBhL2RyaXZl
cnMvbW1jL2NvcmUvaG9zdC5jIGIvZHJpdmVycy9tbWMvY29yZS9ob3N0LmMKPiBpbmRleCBjODc2
ODcyLi40NzUyMWM2IDEwMDY0NAo+IC0tLSBhL2RyaXZlcnMvbW1jL2NvcmUvaG9zdC5jCj4gKysr
IGIvZHJpdmVycy9tbWMvY29yZS9ob3N0LmMKPiBAQCAtMzAyLDYgKzMwMiwxMSBAQCBpbnQgbW1j
X29mX3BhcnNlKHN0cnVjdCBtbWNfaG9zdCAqaG9zdCkKPiAgIAkJaG9zdC0+Y2FwczIgfD0gTU1D
X0NBUDJfTk9fU0Q7Cj4gICAJaWYgKGRldmljZV9wcm9wZXJ0eV9yZWFkX2Jvb2woZGV2LCAibm8t
bW1jIikpCj4gICAJCWhvc3QtPmNhcHMyIHw9IE1NQ19DQVAyX05PX01NQzsKPiArCWlmIChkZXZp
Y2VfcHJvcGVydHlfcmVhZF9ib29sKGRldiwgInN1cHBvcnRzLWNxZSIpKQo+ICsJCWhvc3QtPmNh
cHMyIHw9IE1NQ19DQVAyX0NRRTsKClRoaXMgY2hhbmdlIGlzIGJyZWFraW5nIGVtbWMgZHJpdmVy
IG9uIHFjb20gcGxhdGZvcm1zIHdoZXJlIHRoaXMgZHQgCnByb3BlcnR5IGlzIGRlZmluZWQuCgpb
wqDCoMKgIDEuNTQzNDUzXcKgIGNxaGNpX2RlYWN0aXZhdGUrMHhjLzB4MzgKW8KgwqDCoCAxLjU0
NTYyN13CoCBzZGhjaV9tc21fcmVzZXQrMHg0MC8weDU4ClvCoMKgwqAgMS41NDk0NDddwqAgc2Ro
Y2lfZG9fcmVzZXQrMHg0OC8weDdjClvCoMKgwqAgMS41NTMxODBdwqAgX19zZGhjaV9yZWFkX2Nh
cHMrMHg3Yy8weDIxNApbwqDCoMKgIDEuNTU2OTEzXcKgIHNkaGNpX3NldHVwX2hvc3QrMHg1OC8w
eGNlOApbwqDCoMKgIDEuNTYwOTA1XcKgIHNkaGNpX21zbV9wcm9iZSsweDU4OC8weDhhNApbwqDC
oMKgIDEuNTY0OTAwXcKgIHBsYXRmb3JtX2Rydl9wcm9iZSsweDRjLzB4YjAKClNvLCB3ZSBjYW50
IGhhdmUgdGhpcyBmbGFnIGRlZmluZWQgYmVmb3JlIHNkaGNpX3NldHVwX2hvc3QoKS4KCkkgd2ls
bCBoYXZlIHRvIGNsZWFyIHRoaXMgY2FwIGFuZCByZS1lbmFibGUgaXQgaW4gb3VyIGluaXRpYWxp
emF0aW9uLgoKPiArCWlmICghZGV2aWNlX3Byb3BlcnR5X3JlYWRfYm9vbChkZXYsICJkaXNhYmxl
LWNxZS1kY21kIikpIHsKPiArCQlob3N0LT5jYXBzMiB8PSBNTUNfQ0FQMl9DUUVfRENNRDsKPiAr
CX0KPiAgIAo+ICAgCS8qIE11c3QgYmUgYWZ0ZXIgIm5vbi1yZW1vdmFibGUiIGNoZWNrICovCj4g
ICAJaWYgKGRldmljZV9wcm9wZXJ0eV9yZWFkX3UzMihkZXYsICJmaXhlZC1lbW1jLWRyaXZlci10
eXBlIiwgJmRydl90eXBlKSA9PSAwKSB7CgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fXwpMaW51eC1tZWRpYXRlayBtYWlsaW5nIGxpc3QKTGludXgtbWVkaWF0
ZWtAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFu
L2xpc3RpbmZvL2xpbnV4LW1lZGlhdGVrCg==
