Return-Path: <SRS0=zNLT=LW=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.9 required=3.0 tests=BAYES_00,
	CHARSET_FARAWAY_HEADER,DKIMWL_WL_HIGH,DKIM_SIGNED,DKIM_VALID,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,MISSING_HEADERS,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 13708C49EA3
	for <linux-mediatek@archiver.kernel.org>; Mon, 28 Jun 2021 11:01:48 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id A8ACD61A2B
	for <linux-mediatek@archiver.kernel.org>; Mon, 28 Jun 2021 11:01:47 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org A8ACD61A2B
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=hisilicon.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:References:
	Message-ID:Date:Subject:From:Reply-To:To:Cc:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=6duUSigSUcg0gnhN0wzNyxZYIomHaUCpP4sIJG5lFd0=; b=3PsF1+vACI8vaL
	hqrTjqUWyoNULFAL1+mrlpAg0tl0ZJRjnpGmbkguo9nQPuyZxRZ7cBkod35WmDZB6eIuVUgqvsntc
	5mjhBDbogJfW8xXUjlXANXyGcwDK0kuNm332SEjgDC9z5AJxJ701tESzlsAZ0ikha2+xnO5JYYkSG
	mArIcDufX+oJGEgjCpmJlI5MpA6X0Qef2auQeAjNYI597x0TuYX8SgFCAlK8qcKdxcqGD7ipryArR
	tPUbWDQshwkuj9VGh8LQs6dwROlXj6j/4ow0ebVDNPQjJHAXn0er0w9F0k1WO7sM+JoVTQA9DTmDv
	BhnwL0xQXtTrN9tyfyvQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1lxp1B-007i7h-Qe; Mon, 28 Jun 2021 11:01:33 +0000
Received: from szxga01-in.huawei.com ([45.249.212.187])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1lw19l-00ASLI-Ar; Wed, 23 Jun 2021 11:34:59 +0000
Received: from dggeme758-chm.china.huawei.com (unknown [172.30.72.54])
 by szxga01-in.huawei.com (SkyGuard) with ESMTP id 4G91Lt2MrkzZhXG;
 Wed, 23 Jun 2021 19:31:50 +0800 (CST)
Received: from dggeme759-chm.china.huawei.com (10.3.19.105) by
 dggeme758-chm.china.huawei.com (10.3.19.104) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id
 15.1.2176.2; Wed, 23 Jun 2021 19:34:50 +0800
Received: from dggeme759-chm.china.huawei.com ([10.8.81.151]) by
 dggeme759-chm.china.huawei.com ([10.8.81.151]) with mapi id 15.01.2176.012;
 Wed, 23 Jun 2021 19:34:50 +0800
From: "tiantao (H)" <tiantao6@hisilicon.com>
Subject: =?gb2312?B?tPC4tDogW1BBVENIIHYyIDAyLzIyXSBkcm0vaGlibWM6IENhbGwgZHJtX2ly?=
 =?gb2312?Q?q=5Funinstall()_unconditionally?=
Thread-Topic: [PATCH v2 02/22] drm/hibmc: Call drm_irq_uninstall()
 unconditionally
Thread-Index: AQHXZ3BTceWJbDn8OEasIrWUx4ImYqsheBbQ
Date: Wed, 23 Jun 2021 11:34:50 +0000
Message-ID: <f64f8ee5ca4a4dd3a67fe64a89feabe8@hisilicon.com>
References: <20210622141002.11590-1-tzimmermann@suse.de>
 <20210622141002.11590-3-tzimmermann@suse.de>
In-Reply-To: <20210622141002.11590-3-tzimmermann@suse.de>
Accept-Language: zh-CN, en-US
Content-Language: zh-CN
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [10.40.188.144]
MIME-Version: 1.0
X-CFilter-Loop: Reflected
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210623_043457_790154_37AA1E19 
X-CRM114-Status: UNSURE (   8.56  )
X-CRM114-Notice: Please train this message.
X-Mailman-Approved-At: Mon, 28 Jun 2021 04:01:33 -0700
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
Content-Type: text/plain; charset="gb2312"
Content-Transfer-Encoding: base64
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

DQoNCi0tLS0t08q8/tStvP4tLS0tLQ0Kt6K8/sjLOiBUaG9tYXMgWmltbWVybWFubiBbbWFpbHRv
OnR6aW1tZXJtYW5uQHN1c2UuZGVdIA0Kt6LLzcqxvOQ6IDIwMjHE6jbUwjIyyNUgMjI6MTANCsrV
vP7IyzogZGFuaWVsQGZmd2xsLmNoOyBhaXJsaWVkQGxpbnV4LmllOyBhbGV4YW5kZXIuZGV1Y2hl
ckBhbWQuY29tOyBjaHJpc3RpYW4ua29lbmlnQGFtZC5jb207IFhpbmh1aS5QYW5AYW1kLmNvbTsg
amFtZXMucWlhbi53YW5nQGFybS5jb207IGxpdml1LmR1ZGF1QGFybS5jb207IG1paGFpbC5hdGFu
YXNzb3ZAYXJtLmNvbTsgYnJpYW4uc3RhcmtleUBhcm0uY29tOyBtYWFydGVuLmxhbmtob3JzdEBs
aW51eC5pbnRlbC5jb207IG1yaXBhcmRAa2VybmVsLm9yZzsgaW5raS5kYWVAc2Ftc3VuZy5jb207
IGp5MDkyMi5zaGltQHNhbXN1bmcuY29tOyBzdzAzMTIua2ltQHNhbXN1bmcuY29tOyBreXVuZ21p
bi5wYXJrQHNhbXN1bmcuY29tOyBrcnp5c3p0b2Yua296bG93c2tpQGNhbm9uaWNhbC5jb207IHhp
bmxpYW5nLmxpdUBsaW5hcm8ub3JnOyB0aWFudGFvIChIKSA8dGlhbnRhbzZAaGlzaWxpY29uLmNv
bT47IGpvaG4uc3R1bHR6QGxpbmFyby5vcmc7IGtvbmd4aW53ZWkgKEEpIDxrb25nLmtvbmd4aW53
ZWlAaGlzaWxpY29uLmNvbT47IENoZW5mZW5nIChwdWNrKSA8cHVjay5jaGVuQGhpc2lsaWNvbi5j
b20+OyBsYXVyZW50aXUucGFsY3VAb3NzLm54cC5jb207IGwuc3RhY2hAcGVuZ3V0cm9uaXguZGU7
IHAuemFiZWxAcGVuZ3V0cm9uaXguZGU7IHNoYXduZ3VvQGtlcm5lbC5vcmc7IHMuaGF1ZXJAcGVu
Z3V0cm9uaXguZGU7IGtlcm5lbEBwZW5ndXRyb25peC5kZTsgZmVzdGV2YW1AZ21haWwuY29tOyBs
aW51eC1pbXhAbnhwLmNvbTsgY2h1bmt1YW5nLmh1QGtlcm5lbC5vcmc7IG1hdHRoaWFzLmJnZ0Bn
bWFpbC5jb207IGJza2VnZ3NAcmVkaGF0LmNvbTsgdG9tYmFAa2VybmVsLm9yZzsgaGpjQHJvY2st
Y2hpcHMuY29tOyBoZWlrb0BzbnRlY2guZGU7IGJlbmphbWluLmdhaWduYXJkQGxpbmFyby5vcmc7
IHlhbm5pY2suZmVydHJlQGZvc3Muc3QuY29tOyBwaGlsaXBwZS5jb3JudUBmb3NzLnN0LmNvbTsg
bWNvcXVlbGluLnN0bTMyQGdtYWlsLmNvbTsgYWxleGFuZHJlLnRvcmd1ZUBmb3NzLnN0LmNvbTsg
d2Vuc0Bjc2llLm9yZzsgamVybmVqLnNrcmFiZWNAZ21haWwuY29tOyB0aGllcnJ5LnJlZGluZ0Bn
bWFpbC5jb207IGpvbmF0aGFuaEBudmlkaWEuY29tOyBqeXJpLnNhcmhhQGlraS5maTsgZW1tYUBh
bmhvbHQubmV0OyBsaW51eC1ncmFwaGljcy1tYWludGFpbmVyQHZtd2FyZS5jb207IHphY2tyQHZt
d2FyZS5jb207IGh5dW4ua3dvbkB4aWxpbnguY29tOyBsYXVyZW50LnBpbmNoYXJ0QGlkZWFzb25i
b2FyZC5jb207IG1pY2hhbC5zaW1la0B4aWxpbnguY29tDQqzrcvNOiBhbWQtZ2Z4QGxpc3RzLmZy
ZWVkZXNrdG9wLm9yZzsgZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZzsgbGludXgtYXJt
LWtlcm5lbEBsaXN0cy5pbmZyYWRlYWQub3JnOyBsaW51eC1zYW1zdW5nLXNvY0B2Z2VyLmtlcm5l
bC5vcmc7IGxpbnV4LW1lZGlhdGVrQGxpc3RzLmluZnJhZGVhZC5vcmc7IG5vdXZlYXVAbGlzdHMu
ZnJlZWRlc2t0b3Aub3JnOyBsaW51eC1yb2NrY2hpcEBsaXN0cy5pbmZyYWRlYWQub3JnOyBsaW51
eC1zdG0zMkBzdC1tZC1tYWlsbWFuLnN0b3JtcmVwbHkuY29tOyBsaW51eC1zdW54aUBsaXN0cy5s
aW51eC5kZXY7IGxpbnV4LXRlZ3JhQHZnZXIua2VybmVsLm9yZzsgVGhvbWFzIFppbW1lcm1hbm4g
PHR6aW1tZXJtYW5uQHN1c2UuZGU+DQrW98ziOiBbUEFUQ0ggdjIgMDIvMjJdIGRybS9oaWJtYzog
Q2FsbCBkcm1faXJxX3VuaW5zdGFsbCgpIHVuY29uZGl0aW9uYWxseQ0KDQpSZW1vdmUgdGhlIGNo
ZWNrIGFyb3VuZCBkcm1faXJxX3VuaW5zdGFsbCgpLiBUaGUgc2FtZSB0ZXN0IGlzIGRvbmUgYnkg
dGhlIGZ1bmN0aW9uIGludGVybmFsbHkuIFRoZSB0ZXN0ZWQgc3RhdGUgaW4gaXJxX2VuYWJsZWQg
aXMgY29uc2lkZXJlZCBvYnNvbGV0ZSBhbmQgc2hvdWxkIG5vdCBiZSB1c2VkIGJ5IEtNUyBkcml2
ZXJzLg0KDQpTaWduZWQtb2ZmLWJ5OiBUaG9tYXMgWmltbWVybWFubiA8dHppbW1lcm1hbm5Ac3Vz
ZS5kZT4NCi0tLQ0KIGRyaXZlcnMvZ3B1L2RybS9oaXNpbGljb24vaGlibWMvaGlibWNfZHJtX2Ry
di5jIHwgMyArLS0NCiAxIGZpbGUgY2hhbmdlZCwgMSBpbnNlcnRpb24oKyksIDIgZGVsZXRpb25z
KC0pDQoNCkFja2VkLWJ5OiBUaWFuIFRhbyA8dGlhbnRhbzZAaGlzaWxpY29uLmNvbT4NCg0KZGlm
ZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9oaXNpbGljb24vaGlibWMvaGlibWNfZHJtX2Rydi5j
IGIvZHJpdmVycy9ncHUvZHJtL2hpc2lsaWNvbi9oaWJtYy9oaWJtY19kcm1fZHJ2LmMNCmluZGV4
IGY0YmM1Mzg2NTc0YS4uZjhlZjcxMWJiZTVkIDEwMDY0NA0KLS0tIGEvZHJpdmVycy9ncHUvZHJt
L2hpc2lsaWNvbi9oaWJtYy9oaWJtY19kcm1fZHJ2LmMNCisrKyBiL2RyaXZlcnMvZ3B1L2RybS9o
aXNpbGljb24vaGlibWMvaGlibWNfZHJtX2Rydi5jDQpAQCAtMjUzLDggKzI1Myw3IEBAIHN0YXRp
YyBpbnQgaGlibWNfdW5sb2FkKHN0cnVjdCBkcm1fZGV2aWNlICpkZXYpICB7DQogCWRybV9hdG9t
aWNfaGVscGVyX3NodXRkb3duKGRldik7DQogDQotCWlmIChkZXYtPmlycV9lbmFibGVkKQ0KLQkJ
ZHJtX2lycV91bmluc3RhbGwoZGV2KTsNCisJZHJtX2lycV91bmluc3RhbGwoZGV2KTsNCiANCiAJ
cGNpX2Rpc2FibGVfbXNpKHRvX3BjaV9kZXYoZGV2LT5kZXYpKTsNCiANCi0tDQoyLjMyLjANCg0K
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTGludXgtbWVk
aWF0ZWsgbWFpbGluZyBsaXN0CkxpbnV4LW1lZGlhdGVrQGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0
cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1tZWRpYXRlawo=
