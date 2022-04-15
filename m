Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B5C36C433EF
	for <linux-mediatek@archiver.kernel.org>; Fri, 15 Apr 2022 04:06:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:CC
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=q9C24SbcsskAWujPDMLunaFrI7DdDqi2shVxsEjwvoE=; b=VtgWTm49BX8GM6
	ojl9OAufrk6Oj/HLa+qIGluwMqt7880ZTkaBUsPkzi//4YCH22cGOLmhhHnxfYt6cuHF0Qz6nRitZ
	0ZimEx37B28b58v+DyAuvhdGhMwo/WSC8w6QgSqmwE/jgHJ4MNGpY0k6++DHLE9pgDdrMkZaA95T7
	0z8HAQYo9dzBwwnpuYfT5t5RL3+PXUxpZ8bdY6UL3ppfL/ntqpAFZoBt5nVGsuwXilqTkbufA2gSz
	j4qVCcDtFWiGFj2VF1w7P3Xh1WIZlZ+yImPdpr2uuKBqUAFSlM3HF9kNbm4+Dr2+EGZxzVtGIw4vp
	gNXayPHnKn0S6Mb/8k5g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nfDDq-008KAS-KO; Fri, 15 Apr 2022 04:06:14 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nfDDe-008K7w-Mp; Fri, 15 Apr 2022 04:06:04 +0000
X-UUID: 983f7661f1214cc9b751060f26eab5b6-20220414
X-UUID: 983f7661f1214cc9b751060f26eab5b6-20220414
Received: from mtkcas67.mediatek.inc [(172.29.193.45)] by mailgw01.mediatek.com
 (envelope-from <alice.chao@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 1439622034; Thu, 14 Apr 2022 21:05:57 -0700
Received: from mtkmbs10n1.mediatek.inc (172.21.101.34) by
 MTKMBS62N2.mediatek.inc (172.29.193.42) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Thu, 14 Apr 2022 21:05:55 -0700
Received: from mtkcas11.mediatek.inc (172.21.101.40) by
 mtkmbs10n1.mediatek.inc (172.21.101.34) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.2.792.15; Fri, 15 Apr 2022 12:05:53 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by mtkcas11.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via
 Frontend Transport; Fri, 15 Apr 2022 12:05:53 +0800
From: Alice Chao <alice.chao@mediatek.com>
To: <jejb@linux.ibm.com>, <martin.petersen@oracle.com>,
 <matthias.bgg@gmail.com>, <linux-scsi@vger.kernel.org>,
 <linux-kernel@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
 <linux-mediatek@lists.infradead.org>
CC: <stanley.chu@mediatek.com>, <peter.wang@mediatek.com>,
 <chun-hung.wu@mediatek.com>, <alice.chao@mediatek.com>,
 <powen.kao@mediatek.com>, <cc.chou@mediatek.com>,
 <chaotian.jing@mediatek.com>, <jiajie.hao@mediatek.com>,
 <qilin.tan@mediatek.com>, <lin.gui@mediatek.com>, <yanxu.wei@mediatek.com>,
 <wsd_upstream@mediatek.com>
Subject: [PATCH v3 1/1] scsi: Fix racing between dev init and dev reset
Date: Fri, 15 Apr 2022 12:04:47 +0800
Message-ID: <20220415040446.26451-2-alice.chao@mediatek.com>
X-Mailer: git-send-email 2.18.0
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220414_210602_791308_741D83D8 
X-CRM114-Status: GOOD (  10.52  )
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

RGV2aWNlIHJlc2V0IHRocmVhZCB1c2VzIGtvYmplY3RfdWV2ZW50X2VudigpIHRvIGdldCBrb2Jq
LnBhcmVudCwgYW5kIGl0CmFjZXMgd2l0aCBkZXZpY2UgaW5pdCB0aHJlYWQgd2hpY2ggY2FsbHMg
ZGV2aWNlX2FkZCgpIHRvIGFkZCBrb2JqLnBhcmVudApiZWZvcmUga29iamVjdF91ZXZlbnRfZW52
KCkuCgpEZXZpY2UgaW5pdCBjYWxsOiAgICAgICAgICAgRGV2aWNlIHJlc2V0IGNhbGw6CiBzY3Np
X3Byb2JlX2FuZF9hZGRfbHVuKCkgICAgc2NzaV9ldnRfdGhyZWFkKCkKICBzY3NpX2FkZF9sdW4o
KSAgICAgICAgICAgICBzY3NpX2V2dF9lbWl0KCkKICAgc2NzaV9zeXNmc19hZGRfc2RldigpICAg
ICAga29iamVjdF91ZXZlbnRfZW52KCkgLy9nZXQga29iai5wYXJlbnQKICAgIHNjc2lfdGFyZ2V0
X2FkZCgpICAgICAgICAgICBrb2JqZWN0X2dldF9wYXRoKCkKICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgbGVuID0gZ2V0X2tvYmpfcGF0aF9sZW5ndGggKCkgLy8gbGVuPTEgYmVjYXVz
ZSBwYXJlbnQgaGFzbid0IGNyZWF0ZWQgeWV0CiAgICBkZXZpY2VfYWRkKCkgLy8gYWRkIGtvYmou
cGFyZW50CiAgICAgIGtvYmplY3RfdWV2ZW50X2VudigpCiAgICAgICBrb2JqZWN0X2dldF9wYXRo
KCkgICAgICAgICBwYXRoID0ga3phbGxvYygpCiAgICAgICAgZmlsbF9rb2JqX3BhdGgoKSAgICAg
ICAgICAgZmlsbF9rb2JqX3BhdGgoKSAvLyAtLWxlbmd0aDsgbGVuZ3RoIC09IGN1ciBpcyBhIG5l
Z2F0aXZlIHZhbHVlCiAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIG1lbWNweShw
YXRoICsgbGVuZ3RoLCBrb2JqZWN0X25hbWUocGFyZW50KSwgY3VyKTsgLy8gc2xhYiBPT0IhCgpB
Ym92ZSBiYWNrdHJhY2UgZGVzY3JpYmVzIHRoZSBwcm9ibGVtLCBkZXZpY2UgcmVzZXQgdGhyZWFk
IHdpbGwgZ2V0IHdyb25nCmtvYmoucGFyZW50IHdoZW4gZGV2aWNlIGluaXQgdGhyZWFkIGRpZG7i
gJl0IGFkZCBrb2JqLnBhcmVudCB5ZXQuIFdoZW4gdGhpcwpyYWNpbmcgaGFwcGVuZWQsIGl0IHRy
aWdnZXJzIHRoZSBhIEtBU0FOIGR1bXAgb24gdGhlIGZpbmFsIGl0ZXJhdGlvbjoKCkJVRzogS0FT
QU46IHNsYWItb3V0LW9mLWJvdW5kcyBpbiBrb2JqZWN0X2dldF9wYXRoKzB4ZjgvMHgxYjgKV3Jp
dGUgb2Ygc2l6ZSAxMSBhdCBhZGRyIGZmZmZmZjgwZDZiYjk0ZjUgYnkgdGFzayBrd29ya2VyLzM6
MS81OAo8c25pcD4KQ2FsbCB0cmFjZToKIF9fa2FzYW5fcmVwb3J0KzB4MTI0LzB4MWM4CiBrYXNh
bl9yZXBvcnQrMHg1NC8weDg0CiBrYXNhbl9jaGVja19yYW5nZSsweDIwMC8weDIwOAogbWVtY3B5
KzB4YjgvMHhmMAoga29iamVjdF9nZXRfcGF0aCsweGY4LzB4MWI4CiBrb2JqZWN0X3VldmVudF9l
bnYrMHgyMjgvMHhhODgKIHNjc2lfZXZ0X3RocmVhZCsweDJkMC8weDViMAogcHJvY2Vzc19vbmVf
d29yaysweDU3MC8weGY5NAogd29ya2VyX3RocmVhZCsweDdjYy8weGY4MAoga3RocmVhZCsweDJj
NC8weDM4OAoKVGhlc2UgdHdvIGpvYnMgYXJlIHNjaGVkdWxlZCBhc3luY2hyb25vdXNseSwgd2Ug
Y2FuJ3QgZ3VhcmFudGVlZCB0aGF0CmtvYmoucGFyZW50IHdpbGwgYmUgY3JlYXRlZCBpbiBkZXZp
Y2UgaW5pdCB0aHJlYWQgYmVmb3JlIGRldmljZSByZXNldAp0aHJlYWQgY2FsbHMga29iamVjdF9n
ZXRfcGF0aCgpLgoKVG8gcmVzb2x2ZSB0aGUgcmFjaW5nIGlzc3VlIGJldHdlZW4gZGV2aWNlIGlu
aXQgdGhyZWFkIGFuZCBkZXZpY2UgcmVzZXQKdGhyZWFkLCB3ZSB1c2Ugd2FpdF9ldmVudCgpIGlu
IHNjc2lfZXZ0X2VtaXQoKSB0byB3YWl0IGZvciBkZXZpY2VfYWRkKCkKdG8gY29tcGxldGUgdGhl
IGNyZWF0aW9uIG9mIGtvYmoucGFyZW50LgoKRGV2aWNlIGluaXQgY2FsbDogICAgICAgICAgICAg
ICAgRGV2aWNlIHJlc2V0IGNhbGw6CnVmc2hjZF9hc3luY19zY2FuKCkgICAgICAgICAgICAgIHNj
c2lfZXZ0X3RocmVhZCgpCiBzY3NpX3NjYW5faG9zdCgpICAgICAgICAgICAgICAgICBzY3NpX2V2
dF9lbWl0KCkgPC0gYWRkIHdhaXRfZXZlbnQoKQogIGRvX3Njc2lfc2Nhbl9ob3N0KCkgPC0gYWRk
IHdha2VfdXAoKQogICBzY3NpX3NjYW5faG9zdF9zZWxlY3RlZCgpCiAgICBzY3NpX3NjYW5fY2hh
bm5lbCgpCiAgICAgc2NzaV9wcm9iZV9hbmRfYWRkX2x1bigpCiAgICAgIHNjc2lfdGFyZ2V0X2Fk
ZCgpCiAgICAgICBkZXZpY2VfYWRkKCkgLy8gYWRkIGtvYmoucGFyZW50CiAgICAgICAga29iamVj
dF91ZXZlbnRfZW52KCkKICAgICAgICAga29iamVjdF9nZXRfcGF0aCgpCiAgICAgICAgICBmaWxs
X2tvYmpfcGF0aCgpCiAgZG9fc2Nhbl9hc3luYygpIDwtIHdha2VfdXAoKSAgICAga29iamVjdF91
ZXZlbnRfZW52KCkgLy8gYWRkIGtvYmoucGFyZW50CiAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgIGtvYmplY3RfZ2V0X3BhdGgoKSAvLyBnZXQgdmFsaWQga29iai5wYXJlbnQKICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIGZpbGxfa29ial9wYXRoKCkKCkFmdGVy
IHdlIGFkZCB3YWtlX3VwIGF0IGRvX3Njc2lfc2Nhbl9ob3N0KCkgaW4gZGV2aWNlIGluaXQgdGhy
ZWFkLCB3ZSBjYW4KZW5zdXJlIHRoYXQgZGV2aWNlIHJlc2V0IHRocmVhZCB3aWxsIGdldCBrb2Jq
ZWN0IGFmdGVyIGRldmljZSBpbml0IHRocmVhZApmaW5pc2hlcyBhZGRpbmcgcGFyZW50LgoKU2ln
bmVkLW9mZi1ieTogQWxpY2UgQ2hhbyA8YWxpY2UuY2hhb0BtZWRpYXRlay5jb20+CgotLS0KCkNo
YW5nZSBzaW5jZSB2MgotQ2hhbmdlIGNvbW1pdDogRGVzY3JpYmVzIHRoZSBwcmVibGVtIGZpcnN0
IGFuZCB0aGVuIHRoZSBzb2x1dGlvbi4KLUFkZCBjb21taXQ6IEFkZCBLQVNBTiBlcnJvciBsb2cu
CgotLS0KIGRyaXZlcnMvc2NzaS9zY3NpX2xpYi5jICB8IDEgKwogZHJpdmVycy9zY3NpL3Njc2lf
c2Nhbi5jIHwgMSArCiAyIGZpbGVzIGNoYW5nZWQsIDIgaW5zZXJ0aW9ucygrKQoKZGlmZiAtLWdp
dCBhL2RyaXZlcnMvc2NzaS9zY3NpX2xpYi5jIGIvZHJpdmVycy9zY3NpL3Njc2lfbGliLmMKaW5k
ZXggMGE3MGFhNzYzYTk2Li5hYmY5YTcxZWQ3N2MgMTAwNjQ0Ci0tLSBhL2RyaXZlcnMvc2NzaS9z
Y3NpX2xpYi5jCisrKyBiL2RyaXZlcnMvc2NzaS9zY3NpX2xpYi5jCkBAIC0yNDYxLDYgKzI0NjEs
NyBAQCBzdGF0aWMgdm9pZCBzY3NpX2V2dF9lbWl0KHN0cnVjdCBzY3NpX2RldmljZSAqc2Rldiwg
c3RydWN0IHNjc2lfZXZlbnQgKmV2dCkKIAkJYnJlYWs7CiAJY2FzZSBTREVWX0VWVF9QT1dFUl9P
Tl9SRVNFVF9PQ0NVUlJFRDoKIAkJZW52cFtpZHgrK10gPSAiU0RFVl9VQT1QT1dFUl9PTl9SRVNF
VF9PQ0NVUlJFRCI7CisJCXdhaXRfZXZlbnQoc2Rldi0+aG9zdC0+aG9zdF93YWl0LCBzZGV2LT5z
ZGV2X2dlbmRldi5rb2JqLnBhcmVudCAhPSBOVUxMKTsKIAkJYnJlYWs7CiAJZGVmYXVsdDoKIAkJ
LyogZG8gbm90aGluZyAqLwpkaWZmIC0tZ2l0IGEvZHJpdmVycy9zY3NpL3Njc2lfc2Nhbi5jIGIv
ZHJpdmVycy9zY3NpL3Njc2lfc2Nhbi5jCmluZGV4IGY0ZTZjNjhhYzk5ZS4uNDMxZjIyOWFjNDM1
IDEwMDY0NAotLS0gYS9kcml2ZXJzL3Njc2kvc2NzaV9zY2FuLmMKKysrIGIvZHJpdmVycy9zY3Np
L3Njc2lfc2Nhbi5jCkBAIC0xOTA0LDYgKzE5MDQsNyBAQCBzdGF0aWMgdm9pZCBkb19zY3NpX3Nj
YW5faG9zdChzdHJ1Y3QgU2NzaV9Ib3N0ICpzaG9zdCkKIAl9IGVsc2UgewogCQlzY3NpX3NjYW5f
aG9zdF9zZWxlY3RlZChzaG9zdCwgU0NBTl9XSUxEX0NBUkQsIFNDQU5fV0lMRF9DQVJELAogCQkJ
CVNDQU5fV0lMRF9DQVJELCAwKTsKKwkJd2FrZV91cCgmc2hvc3QtPmhvc3Rfd2FpdCk7CiAJfQog
fQogCi0tIAoyLjE4LjAKCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fXwpMaW51eC1tZWRpYXRlayBtYWlsaW5nIGxpc3QKTGludXgtbWVkaWF0ZWtAbGlzdHMu
aW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZv
L2xpbnV4LW1lZGlhdGVrCg==
