Return-Path: <SRS0=E1wD=MX=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.5 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,
	URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 53920C4338F
	for <linux-mediatek@archiver.kernel.org>; Sat, 31 Jul 2021 02:18:06 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 0C2DF60F46
	for <linux-mediatek@archiver.kernel.org>; Sat, 31 Jul 2021 02:18:05 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 0C2DF60F46
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:CC
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=dyt1+jTbLQSvDTuEZnjZ1yFcoI+RwQVdu2aMrQnZd9I=; b=rhl95eAyIAOtNM
	HMqSFGrhli/hzV1OWTz86XWdJOasS3yYf6FbK4QHfnv1AVGrlHaDoyZ0N9emtnfn8nmbxUu+VyYoq
	CDHe/AArxRMRYB8iP3WRnHzml3OVcV0HX9DqenLgD0jIWHcjlvmS6ifSMU7A7kKuzLUq7SgK11aZm
	kqTRA/+cUs4T6K4u2qhLiLMrx1B7HqF8YKknAZ+HNMrlXhzvEu4MKF23FTuQMCDa4t9s53Oj8+wWd
	R6AIgYrJMsXXvNFEzJiCS8bME1cTd4hINk6gi5T6CKNP6cHVQ4j8TlEjPPBEUS/lYZW2gfuHYB7xF
	68Ax4gV/np9n3m38bx7g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1m9eZK-00AkZf-9D; Sat, 31 Jul 2021 02:17:42 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1m9eZG-00AkZ9-1O
 for linux-mediatek@lists.infradead.org; Sat, 31 Jul 2021 02:17:40 +0000
X-UUID: c519ffb68cc7432484c0a0de8d4ba61f-20210730
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:Message-ID:Date:Subject:CC:To:From;
 bh=2uKRFPayNGkXadG8vVCANzq7vJL5MeDSDQQeojWO0og=; 
 b=P8trn4AiPKNvlqm9o97/XS+2Vz70LD3ENeR6NXOQl9VL+QNVxORYqWHBDoJ/VhEqQuINZfDZX0YiVxHrDCP0J29ILExrDqyxhHXa6+YlLx7qx43whhrPabJYawEl0wizuLOwVrONhyABvVN/EffM7iFM2G0W/k7WyjI2sSgLnvs=;
X-UUID: c519ffb68cc7432484c0a0de8d4ba61f-20210730
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw01.mediatek.com
 (envelope-from <ryder.lee@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 1294813483; Fri, 30 Jul 2021 19:17:33 -0700
Received: from mtkmbs05n2.mediatek.inc (172.21.101.140) by
 MTKMBS62DR.mediatek.inc (172.29.94.18) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Fri, 30 Jul 2021 19:17:31 -0700
Received: from mtkcas11.mediatek.inc (172.21.101.40) by
 mtkmbs05n2.mediatek.inc (172.21.101.140) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Sat, 31 Jul 2021 10:17:30 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by mtkcas11.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via
 Frontend Transport; Sat, 31 Jul 2021 10:17:30 +0800
From: Ryder Lee <ryder.lee@mediatek.com>
To: Felix Fietkau <nbd@nbd.name>
CC: Lorenzo Bianconi <lorenzo.bianconi@redhat.com>, Shayne Chen
 <shayne.chen@mediatek.com>, Evelyn Tsai <evelyn.tsai@mediatek.com>,
 <linux-wireless@vger.kernel.org>, <linux-mediatek@lists.infradead.org>, "Ben
 Greear" <greearb@candelatech.com>, Ryder Lee <ryder.lee@mediatek.com>
Subject: [PATCH v4 1/2] mt76: mt7915: fix hwmon temp sensor mem use-after-free
Date: Sat, 31 Jul 2021 10:17:27 +0800
Message-ID: <9f5b0cf6c4296d3a9e78a95516cf26d1db4baba9.1627696765.git.ryder.lee@mediatek.com>
X-Mailer: git-send-email 2.18.0
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210730_191738_139060_EB692E89 
X-CRM114-Status: GOOD (  11.74  )
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

RnJvbTogQmVuIEdyZWVhciA8Z3JlZWFyYkBjYW5kZWxhdGVjaC5jb20+DQoNCldpdGhvdXQgdGhp
cyBjaGFuZ2UsIGdhcmJhZ2UgaXMgc2VlbiBpbiB0aGUgaHdtb24gbmFtZQ0KYW5kIHNlbnNvcnMg
b3V0cHV0IGZvciBtdDc5MTUgaXMgZ2FyYmxlZC4NCg0KV2l0aCB0aGUgY2hhbmdlOg0KDQptdDc5
MTUtcGNpLTE0MDANCkFkYXB0ZXI6IFBDSSBhZGFwdGVyDQp0ZW1wMTogICAgICAgICs0OS4wwrBD
DQoNCkZpeGVzOiBkNjkzODI1MWJiNWIgKG10NzY6IG10NzkxNTogYWRkIHRoZXJtYWwgc2Vuc29y
IGRldmljZSBzdXBwb3J0KQ0KU2lnbmVkLW9mZi1ieTogQmVuIEdyZWVhciA8Z3JlZWFyYkBjYW5k
ZWxhdGVjaC5jb20+DQpTaWduZWQtb2ZmLWJ5OiBSeWRlciBMZWUgPHJ5ZGVyLmxlZUBtZWRpYXRl
ay5jb20+DQotLS0NCnY0OiAgU2ltcGxpZnkgZmxvdy4NCnYzOiAgQWRkICdmaXhlcycgdGFnIHRv
IGFpZCBiYWNrcG9ydHMuDQotLS0NCiBkcml2ZXJzL25ldC93aXJlbGVzcy9tZWRpYXRlay9tdDc2
L210NzkxNS9pbml0LmMgfCAxMCArKysrKy0tLS0tDQogMSBmaWxlIGNoYW5nZWQsIDUgaW5zZXJ0
aW9ucygrKSwgNSBkZWxldGlvbnMoLSkNCg0KZGlmZiAtLWdpdCBhL2RyaXZlcnMvbmV0L3dpcmVs
ZXNzL21lZGlhdGVrL210NzYvbXQ3OTE1L2luaXQuYyBiL2RyaXZlcnMvbmV0L3dpcmVsZXNzL21l
ZGlhdGVrL210NzYvbXQ3OTE1L2luaXQuYw0KaW5kZXggNzdjNzQ4NmQ2YTVjLi5hMWI5ZTFiM2Y3
MDAgMTAwNjQ0DQotLS0gYS9kcml2ZXJzL25ldC93aXJlbGVzcy9tZWRpYXRlay9tdDc2L210Nzkx
NS9pbml0LmMNCisrKyBiL2RyaXZlcnMvbmV0L3dpcmVsZXNzL21lZGlhdGVrL210NzYvbXQ3OTE1
L2luaXQuYw0KQEAgLTE1NSwxMyArMTU1LDEzIEBAIHN0YXRpYyB2b2lkIG10NzkxNV91bnJlZ2lz
dGVyX3RoZXJtYWwoc3RydWN0IG10NzkxNV9waHkgKnBoeSkNCiAJdGhlcm1hbF9jb29saW5nX2Rl
dmljZV91bnJlZ2lzdGVyKHBoeS0+Y2Rldik7DQogfQ0KIA0KLXN0YXRpYyBpbnQgbXQ3OTE1X3Ro
ZXJtYWxfaW5pdChzdHJ1Y3QgbXQ3OTE1X3BoeSAqcGh5KQ0KK3N0YXRpYyBpbnQgbXQ3OTE1X3Ro
ZXJtYWxfaW5pdChzdHJ1Y3QgbXQ3OTE1X3BoeSAqcGh5LCBjb25zdCBjaGFyICpwcmVmaXgpDQog
ew0KIAlzdHJ1Y3Qgd2lwaHkgKndpcGh5ID0gcGh5LT5tdDc2LT5ody0+d2lwaHk7DQogCXN0cnVj
dCB0aGVybWFsX2Nvb2xpbmdfZGV2aWNlICpjZGV2Ow0KIAlzdHJ1Y3QgZGV2aWNlICpod21vbjsN
CiANCi0JY2RldiA9IHRoZXJtYWxfY29vbGluZ19kZXZpY2VfcmVnaXN0ZXIod2lwaHlfbmFtZSh3
aXBoeSksIHBoeSwNCisJY2RldiA9IHRoZXJtYWxfY29vbGluZ19kZXZpY2VfcmVnaXN0ZXIocHJl
Zml4LCBwaHksDQogCQkJCQkgICAgICAgJm10NzkxNV90aGVybWFsX29wcyk7DQogCWlmICghSVNf
RVJSKGNkZXYpKSB7DQogCQlpZiAoc3lzZnNfY3JlYXRlX2xpbmsoJndpcGh5LT5kZXYua29iaiwg
JmNkZXYtPmRldmljZS5rb2JqLA0KQEAgLTE3NSw3ICsxNzUsNyBAQCBzdGF0aWMgaW50IG10Nzkx
NV90aGVybWFsX2luaXQoc3RydWN0IG10NzkxNV9waHkgKnBoeSkNCiAJCXJldHVybiAwOw0KIA0K
IAlod21vbiA9IGRldm1faHdtb25fZGV2aWNlX3JlZ2lzdGVyX3dpdGhfZ3JvdXBzKCZ3aXBoeS0+
ZGV2LA0KLQkJCQkJCSAgICAgICB3aXBoeV9uYW1lKHdpcGh5KSwgcGh5LA0KKwkJCQkJCSAgICAg
ICBwcmVmaXgsIHBoeSwNCiAJCQkJCQkgICAgICAgbXQ3OTE1X2h3bW9uX2dyb3Vwcyk7DQogCWlm
IChJU19FUlIoaHdtb24pKQ0KIAkJcmV0dXJuIFBUUl9FUlIoaHdtb24pOw0KQEAgLTQwMyw3ICs0
MDMsNyBAQCBzdGF0aWMgaW50IG10NzkxNV9yZWdpc3Rlcl9leHRfcGh5KHN0cnVjdCBtdDc5MTVf
ZGV2ICpkZXYpDQogCWlmIChyZXQpDQogCQlnb3RvIGVycm9yOw0KIA0KLQlyZXQgPSBtdDc5MTVf
dGhlcm1hbF9pbml0KHBoeSk7DQorCXJldCA9IG10NzkxNV90aGVybWFsX2luaXQocGh5LCBLQlVJ
TERfTU9ETkFNRSAiLWV4dCIpOw0KIAlpZiAocmV0KQ0KIAkJZ290byBlcnJvcjsNCiANCkBAIC04
NTMsNyArODUzLDcgQEAgaW50IG10NzkxNV9yZWdpc3Rlcl9kZXZpY2Uoc3RydWN0IG10NzkxNV9k
ZXYgKmRldikNCiAJaWYgKHJldCkNCiAJCXJldHVybiByZXQ7DQogDQotCXJldCA9IG10NzkxNV90
aGVybWFsX2luaXQoJmRldi0+cGh5KTsNCisJcmV0ID0gbXQ3OTE1X3RoZXJtYWxfaW5pdCgmZGV2
LT5waHksIEtCVUlMRF9NT0ROQU1FKTsNCiAJaWYgKHJldCkNCiAJCXJldHVybiByZXQ7DQogDQot
LSANCjIuMjkuMg0KX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X18KTGludXgtbWVkaWF0ZWsgbWFpbGluZyBsaXN0CkxpbnV4LW1lZGlhdGVrQGxpc3RzLmluZnJh
ZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51
eC1tZWRpYXRlawo=
