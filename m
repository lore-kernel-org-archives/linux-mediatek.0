Return-Path: <SRS0=+xT1=ZE=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.6 required=3.0 tests=CHARSET_FARAWAY_HEADER,
	DKIMWL_WL_HIGH,DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A4B96C43331
	for <linux-mediatek@archiver.kernel.org>; Tue, 12 Nov 2019 14:36:36 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 759E120674
	for <linux-mediatek@archiver.kernel.org>; Tue, 12 Nov 2019 14:36:36 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="EnFUwmpg"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 759E120674
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=unisoc.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:References:
	Message-ID:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=lJE/hHqpxR3a7kVcnfyRKVA8cJA99xVcq6JRi5Wr0gI=; b=EnFUwmpgWJbhIG
	+6DbiQgR0EXgKlnCFRcL2ydkvCdAVI1dtd+HTPFbHl4cLQkqi/6bQxp6k5laBz/Fx+0zE5cYYsSiu
	w1eeAeiP7Jxqn10KUPLZpGsQi8xCbKojdHoYlyufwS7Zwi9/Lu5kroskP8TUShkenP1a1tBWdUNJc
	U5s95f/j0U3HiXJTtsS5kJuDbYQZ/Og6s2OJFa+DuK3LVGtUkGm5NwASuTGgt70korYXfigaNj1Yg
	gqxddokAF188F8fgntfGW4nl5/8RuT4KetqIczlLm64fYy7hFTQSMGT7sUdV2MdzrAXaEGdu3bfbS
	aSolTSFW7DeYsWjLtuEA==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1iUXHX-0003Nj-Tn; Tue, 12 Nov 2019 14:36:35 +0000
Received: from mx1.unisoc.com ([222.66.158.135] helo=SHSQR01.spreadtrum.com)
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1iUXHS-0003K2-Qy; Tue, 12 Nov 2019 14:36:34 +0000
Received: from ig2.spreadtrum.com (bjmbx02.spreadtrum.com [10.0.64.8])
 by SHSQR01.spreadtrum.com with ESMTPS id xACEZi85075277
 (version=TLSv1 cipher=AES256-SHA bits=256 verify=NO);
 Tue, 12 Nov 2019 22:35:44 +0800 (CST)
 (envelope-from lvqiang.huang@unisoc.com)
Received: from BJMBX01.spreadtrum.com (10.0.64.7) by BJMBX02.spreadtrum.com
 (10.0.64.8) with Microsoft SMTP Server (TLS) id 15.0.847.32; Tue, 12 Nov 2019
 22:35:39 +0800
Received: from BJMBX01.spreadtrum.com ([fe80::54e:9a:129d:fac7]) by
 BJMBX01.spreadtrum.com ([fe80::54e:9a:129d:fac7%16]) with mapi id
 15.00.0847.030; Tue, 12 Nov 2019 22:35:39 +0800
From: =?gb2312?B?u8bCwMe/IChMdnFpYW5nIEh1YW5nKQ==?= <lvqiang.huang@unisoc.com>
To: Mark-PK Tsai <mark-pk.tsai@mediatek.com>
Subject: Re: [PATCH] ARM: fix race in for_each_frame
Thread-Topic: [PATCH] ARM: fix race in for_each_frame
Thread-Index: AQHVmV2AMhVdltuogk6mbCoumJ6bbKeHmizY
Date: Tue, 12 Nov 2019 14:35:38 +0000
Message-ID: <64C83867-31FA-4243-A0EB-018AE9A83ACB@unisoc.com>
References: <20191112132937.19335-1-mark-pk.tsai@mediatek.com>
In-Reply-To: <20191112132937.19335-1-mark-pk.tsai@mediatek.com>
Accept-Language: zh-CN, en-US
Content-Language: zh-CN
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
MIME-Version: 1.0
X-MAIL: SHSQR01.spreadtrum.com xACEZi85075277
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20191112_063631_966376_68D0C49C 
X-CRM114-Status: GOOD (  10.44  )
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
Cc: "kstewart@linuxfoundation.org" <kstewart@linuxfoundation.org>,
 "alix.wu@mediatek.com" <alix.wu@mediatek.com>,
 =?gb2312?B?s/6298C0IChFbmxhaSBDaHUp?= <enlai.chu@unisoc.com>,
 "eddy.lin@mediatek.com" <eddy.lin@mediatek.com>,
 "gregkh@linuxfoundation.org" <gregkh@linuxfoundation.org>,
 "yj.chiang@mediatek.com" <yj.chiang@mediatek.com>,
 "phil.chang@mediatek.com" <phil.chang@mediatek.com>,
 "linux@armlinux.org.uk" <linux@armlinux.org.uk>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "linux-mediatek@lists.infradead.org" <linux-mediatek@lists.infradead.org>,
 "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>,
 "matthias.bgg@gmail.com" <matthias.bgg@gmail.com>,
 "tglx@linutronix.de" <tglx@linutronix.de>, "info@metux.net" <info@metux.net>,
 "mike-sl.lin@mediatek.com" <mike-sl.lin@mediatek.com>,
 "allison@lohutok.net" <allison@lohutok.net>
Content-Type: text/plain; charset="gb2312"
Content-Transfer-Encoding: base64
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

RGVhciBNYXJrLA0KVGhhbmtzIGEgbG90IGZvciB0aGUgcmVwbHkuIA0KDQpBcyBzYWlkIGluIGxh
c3QgcmVwbHksIHN2X3BjIGNhbiBiZSBhIG1vZHVsZSB0ZXh0LCB0aGVuIG1vcmUgY2hlY2sgbmVl
ZGVkLg0KDQpBbmQgYmVzaWRlIGNyYXNoIGF0IDEwMDMsIHdlIG1heSBhbHNvIGdldCBjcmFzaCBh
dCAxMDAxLCB0aGUgZnJhbWUgaXMgaW52YWxpZC4gKFRoZSBsYXN0IHN2X3B2IGlzIHZhbGlkIGFu
ZCBzdl9mcmFtZSBpcyBpbnZhbGlkKSwgdGhlbiBtb3JlIGNoZWNrIG5lZWRlZC4gDQoNCkFuZCB3
ZSBvZnRlbiBzaG93X2RhdGEgYXJvdW5kIHRoZSBnZW5lcmFsIHByb3Bvc2FsIHJlZ2lzdGVycyB3
aGVuIGtlcm5lbCBjcmFzaC4gV2hlbiB0aGV5IGNvbnRhaW4gYW4gYWRkcmVzcyBtYXBwaW5nIGZv
ciBhIGh3IHJlZ2lzdGVyIGJ1dCBjYW6hr3QgYWNjZXNzIGJlY2F1c2UgY2xvY2sgZ2F0ZWQsIGl0
IHdpbGwgY3Jhc2ggYWdhaW4gYmVjYXVzZSBkb19iYWQoKSBpcyBpbnZvbHZlZC4gKGNvbnRpbnVv
dXMgY3Jhc2ggaW4gYXJtIGFuZCBoYW5nIGF0IGRpZV9sb2NrIGluIGFybTY0KQ0KDQpTbywgd2h5
IG5vdCBjaGVjayB0aGUgX19leF90YWJsZSBpbiBkb19iYWQoKSA/DQoNCj4g1NogMjAxOcTqMTHU
wjEyyNWjrDIxOjMxo6xNYXJrLVBLIFRzYWkgPG1hcmstcGsudHNhaUBtZWRpYXRlay5jb20+INC0
tcCjug0KPiANCj4gVGhlIHN2X3BjLCB3aGljaCBpcyBzYXZlZCBpbiB0aGUgc3RhY2ssIG1heSBi
ZSBhbiBpbnZhbGlkIGFkZHJlc3MNCj4gaWYgdGhlIHRhcmdldCB0aHJlYWQgaXMgcnVubmluZyBv
biBhbm90aGVyIHByb2Nlc3NvciBpbiB0aGUgbWVhbnRpbWUuDQo+IEl0IHdpbGwgY2F1c2Uga2Vy
bmVsIGNyYXNoIGF0IGBsZHIgcjIsIFtzdl9wYywgIy00XWAuDQo+IA0KPiBDaGVjayBpZiBzdl9w
YyBpcyB2YWxpZCBiZWZvcmUgdXNlIGl0IGxpa2UgdW53aW5kX2ZyYW1lIGluDQo+IGFyY2gvYXJt
L2tlcm5lbC91bndpbmQuYy4NCj4gDQo+IFNpZ25lZC1vZmYtYnk6IE1pa2UtU0wgTGluIDxtaWtl
LXNsLmxpbkBtZWRpYXRlay5jb20+DQo+IFNpZ25lZC1vZmYtYnk6IE1hcmstUEsgVHNhaSA8bWFy
ay1way50c2FpQG1lZGlhdGVrLmNvbT4NCj4gLS0tDQo+IGFyY2gvYXJtL2xpYi9iYWNrdHJhY2Uu
UyB8IDUgKysrKysNCj4gMSBmaWxlIGNoYW5nZWQsIDUgaW5zZXJ0aW9ucygrKQ0KPiANCj4gZGlm
ZiAtLWdpdCBhL2FyY2gvYXJtL2xpYi9iYWNrdHJhY2UuUyBiL2FyY2gvYXJtL2xpYi9iYWNrdHJh
Y2UuUw0KPiBpbmRleCA1ODI5MjUyMzhkNjUuLjg0ZjA2MzgxYmJmYiAxMDA2NDQNCj4gLS0tIGEv
YXJjaC9hcm0vbGliL2JhY2t0cmFjZS5TDQo+ICsrKyBiL2FyY2gvYXJtL2xpYi9iYWNrdHJhY2Uu
Uw0KPiBAQCAtNjQsNiArNjQsMTEgQEAgZm9yX2VhY2hfZnJhbWU6ICAgIHRzdCAgICBmcmFtZSwg
bWFzayAgICAgICAgQCBDaGVjayBmb3IgYWRkcmVzcyBleGNlcHRpb25zDQo+ICAgICAgICBzdWIg
ICAgc3ZfcGMsIHN2X3BjLCBvZmZzZXQgICAgQCBDb3JyZWN0IFBDIGZvciBwcmVmZXRjaGluZw0K
PiAgICAgICAgYmljICAgIHN2X3BjLCBzdl9wYywgbWFzayAgICBAIG1hc2sgUEMvTFIgZm9yIHRo
ZSBtb2RlDQo+IA0KPiArICAgICAgICBtb3YgICAgcjAsIHN2X3BjDQo+ICsgICAgICAgIGJsICAg
IGtlcm5lbF90ZXh0X2FkZHJlc3MgICAgQCBjaGVjayBpZiBzdl9wYyBpcyB2YWxpZA0KPiArICAg
ICAgICBjbXAgICAgcjAsICMwICAgICAgICAgICAgQCBpZiBzdl9wYyBpcyBub3Qga2VybmVsIHRl
eHQNCj4gKyAgICAgICAgYmVxICAgIDEwMDZmICAgICAgICAgICAgQCBhZGRyZXNzLCBhYm9ydCBi
YWNrdHJhY2UNCj4gKw0KPiAxMDAzOiAgICAgICAgbGRyICAgIHIyLCBbc3ZfcGMsICMtNF0gICAg
QCBpZiBzdG1mZCBzcCEsIHthcmdzfSBleGlzdHMsDQo+ICAgICAgICBsZHIgICAgcjMsIC5MZHNp
KzQgICAgICAgIEAgYWRqdXN0IHNhdmVkICdwYycgYmFjayBvbmUNCj4gICAgICAgIHRlcSAgICBy
MywgcjIsIGxzciAjMTEgICAgICAgIEAgaW5zdHJ1Y3Rpb24NCj4gLS0gDQo+IDIuMTguMA0KDQoN
Cj09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09
PT09PT09PT09PT09PT09PT09PT0NClRoaXMgZW1haWwgKGluY2x1ZGluZyBpdHMgYXR0YWNobWVu
dHMpIGlzIGludGVuZGVkIG9ubHkgZm9yIHRoZSBwZXJzb24gb3IgZW50aXR5IHRvIHdoaWNoIGl0
IGlzIGFkZHJlc3NlZCBhbmQgbWF5IGNvbnRhaW4gaW5mb3JtYXRpb24gdGhhdCBpcyBwcml2aWxl
Z2VkLCBjb25maWRlbnRpYWwgb3Igb3RoZXJ3aXNlIHByb3RlY3RlZCBmcm9tIGRpc2Nsb3N1cmUu
IFVuYXV0aG9yaXplZCB1c2UsIGRpc3NlbWluYXRpb24sIGRpc3RyaWJ1dGlvbiBvciBjb3B5aW5n
IG9mIHRoaXMgZW1haWwgb3IgdGhlIGluZm9ybWF0aW9uIGhlcmVpbiBvciB0YWtpbmcgYW55IGFj
dGlvbiBpbiByZWxpYW5jZSBvbiB0aGUgY29udGVudHMgb2YgdGhpcyBlbWFpbCBvciB0aGUgaW5m
b3JtYXRpb24gaGVyZWluLCBieSBhbnlvbmUgb3RoZXIgdGhhbiB0aGUgaW50ZW5kZWQgcmVjaXBp
ZW50LCBvciBhbiBlbXBsb3llZSBvciBhZ2VudCByZXNwb25zaWJsZSBmb3IgZGVsaXZlcmluZyB0
aGUgbWVzc2FnZSB0byB0aGUgaW50ZW5kZWQgcmVjaXBpZW50LCBpcyBzdHJpY3RseSBwcm9oaWJp
dGVkLiBJZiB5b3UgYXJlIG5vdCB0aGUgaW50ZW5kZWQgcmVjaXBpZW50LCBwbGVhc2UgZG8gbm90
IHJlYWQsIGNvcHksIHVzZSBvciBkaXNjbG9zZSBhbnkgcGFydCBvZiB0aGlzIGUtbWFpbCB0byBv
dGhlcnMuIFBsZWFzZSBub3RpZnkgdGhlIHNlbmRlciBpbW1lZGlhdGVseSBhbmQgcGVybWFuZW50
bHkgZGVsZXRlIHRoaXMgZS1tYWlsIGFuZCBhbnkgYXR0YWNobWVudHMgaWYgeW91IHJlY2VpdmVk
IGl0IGluIGVycm9yLiBJbnRlcm5ldCBjb21tdW5pY2F0aW9ucyBjYW5ub3QgYmUgZ3VhcmFudGVl
ZCB0byBiZSB0aW1lbHksIHNlY3VyZSwgZXJyb3ItZnJlZSBvciB2aXJ1cy1mcmVlLiBUaGUgc2Vu
ZGVyIGRvZXMgbm90IGFjY2VwdCBsaWFiaWxpdHkgZm9yIGFueSBlcnJvcnMgb3Igb21pc3Npb25z
LiANCrG+08q8/rywxuS4vbz+vt/T0LGjw9zQ1NbKo6zK3Leowsmxo7uksru1w9C5wrajrL32t6LL
zbj4sb7Tyrz+y/nWuMzYtqjK1bz+yMuho9HPvfu3x76tytrIqMq508OhotD7tKuhoreisry78ri0
1saxvtPKvP678sbkxNrI3aGjyPS3x7jDzNi2qMrVvP7Iy6Osx+vO8NTEtsGhori01sahoiDKudPD
u/LF+8K2sb7Tyrz+tcTIzrrOxNrI3aGjyPTO88rVsb7Tyrz+o6zH67TTz7XNs9bQ08C+w9DUyb6z
/bG+08q8/rywy/nT0Li9vP6jrLKi0tS72Li008q8/rXEt73Kvby0v8y45taqt6K8/sjLoaPO3reo
saPWpLulwarN+M2o0MW8sMqxoaKwssiroaLO3s7zu/K3wLa+oaO3orz+yMu21MjOus607cKpvvmy
u7PQtaPU8MjOoaMNCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fCkxpbnV4LW1lZGlhdGVrIG1haWxpbmcgbGlzdApMaW51eC1tZWRpYXRla0BsaXN0cy5pbmZy
YWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGlu
dXgtbWVkaWF0ZWsK
