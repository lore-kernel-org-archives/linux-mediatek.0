Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6C4D0C433FE
	for <linux-mediatek@archiver.kernel.org>; Fri, 15 Apr 2022 06:31:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:CC
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=IKnRxladElaPJN9OHY8GBMu9YVHw0Df4yLOnqk3Ldes=; b=bqn+tvstDFDuwe
	GlYhgLUjzUNK1n0DsoPl+WUrOGy3NPuy7dhBqHviDoVlvOhd3VpYk1GyVlFgz6rsXVt69RYZ9Irlf
	MEOk+CRJhJxT9vs8FakO9W+OfRSkNKbONA+UizsBaiDMjHjZhULBPu4541fko/ssacqwsMdBgDbvb
	tmOxeBMm/pldfS42xk5Vj/NwDtRaYGGU+McwSmz/ZgpK7g4uau+FRqXIFDag32f1C3UESGBs/qaww
	KF0lo18qtGFgZqqSogv4sva48xKaziHDb0/ZBv0HaLax6xp8dSKKBGqBloSg3Sv083QHTX7TxFRmV
	5YF+ZryuDyvx+4kd6HRQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nfFUU-0090YD-84; Fri, 15 Apr 2022 06:31:34 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nfFEP-008v8d-Ak; Fri, 15 Apr 2022 06:14:59 +0000
X-UUID: aa6c3386d51143d381ccd729d0a7f719-20220414
X-UUID: aa6c3386d51143d381ccd729d0a7f719-20220414
Received: from mtkcas68.mediatek.inc [(172.29.94.19)] by mailgw01.mediatek.com
 (envelope-from <alice.chao@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 64160130; Thu, 14 Apr 2022 23:14:53 -0700
Received: from mtkmbs10n2.mediatek.inc (172.21.101.183) by
 MTKMBS62DR.mediatek.inc (172.29.94.18) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Thu, 14 Apr 2022 23:14:51 -0700
Received: from mtkcas10.mediatek.inc (172.21.101.39) by
 mtkmbs10n2.mediatek.inc (172.21.101.183) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id 15.2.792.3; 
 Fri, 15 Apr 2022 14:14:50 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by mtkcas10.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via
 Frontend Transport; Fri, 15 Apr 2022 14:14:50 +0800
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
Subject: [PATCH v4 1/1] scsi: Fix racing between dev init and dev reset
Date: Fri, 15 Apr 2022 14:12:44 +0800
Message-ID: <20220415061243.30229-2-alice.chao@mediatek.com>
X-Mailer: git-send-email 2.18.0
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220414_231457_467380_CFEBB2C9 
X-CRM114-Status: GOOD (  10.58  )
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
LnBhcmVudCwgYW5kIGl0CnJhY2VzIHdpdGggZGV2aWNlIGluaXQgdGhyZWFkIHdoaWNoIGNhbGxz
IGRldmljZV9hZGQoKSB0byBhZGQga29iai5wYXJlbnQKYmVmb3JlIGtvYmplY3RfdWV2ZW50X2Vu
digpLgoKRGV2aWNlIGluaXQgY2FsbDogICAgICAgICAgIERldmljZSByZXNldCBjYWxsOgogc2Nz
aV9wcm9iZV9hbmRfYWRkX2x1bigpICAgIHNjc2lfZXZ0X3RocmVhZCgpCiAgc2NzaV9hZGRfbHVu
KCkgICAgICAgICAgICAgc2NzaV9ldnRfZW1pdCgpCiAgIHNjc2lfc3lzZnNfYWRkX3NkZXYoKSAg
ICAgIGtvYmplY3RfdWV2ZW50X2VudigpIC8vZ2V0IGtvYmoucGFyZW50CiAgICBzY3NpX3Rhcmdl
dF9hZGQoKSAgICAgICAgICAga29iamVjdF9nZXRfcGF0aCgpCiAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgIGxlbiA9IGdldF9rb2JqX3BhdGhfbGVuZ3RoICgpIC8vIGxlbj0xIGJlY2F1
c2UgcGFyZW50IGhhc24ndCBjcmVhdGVkIHlldAogICAgZGV2aWNlX2FkZCgpIC8vIGFkZCBrb2Jq
LnBhcmVudAogICAgICBrb2JqZWN0X3VldmVudF9lbnYoKQogICAgICAga29iamVjdF9nZXRfcGF0
aCgpICAgICAgICAgcGF0aCA9IGt6YWxsb2MoKQogICAgICAgIGZpbGxfa29ial9wYXRoKCkgICAg
ICAgICAgIGZpbGxfa29ial9wYXRoKCkgLy8gLS1sZW5ndGg7IGxlbmd0aCAtPSBjdXIgaXMgYSBu
ZWdhdGl2ZSB2YWx1ZQogICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBtZW1jcHko
cGF0aCArIGxlbmd0aCwga29iamVjdF9uYW1lKHBhcmVudCksIGN1cik7IC8vIHNsYWIgT09CIQoK
QWJvdmUgYmFja3RyYWNlIGRlc2NyaWJlcyB0aGUgcHJvYmxlbSwgZGV2aWNlIHJlc2V0IHRocmVh
ZCB3aWxsIGdldCB3cm9uZwprb2JqLnBhcmVudCB3aGVuIGRldmljZSBpbml0IHRocmVhZCBkaWRu
4oCZdCBhZGQga29iai5wYXJlbnQgeWV0LiBXaGVuIHRoaXMKcmFjaW5nIGhhcHBlbmVkLCBpdCB0
cmlnZ2VycyB0aGUgYSBLQVNBTiBkdW1wIG9uIHRoZSBmaW5hbCBpdGVyYXRpb246CgpCVUc6IEtB
U0FOOiBzbGFiLW91dC1vZi1ib3VuZHMgaW4ga29iamVjdF9nZXRfcGF0aCsweGY4LzB4MWI4Cldy
aXRlIG9mIHNpemUgMTEgYXQgYWRkciBmZmZmZmY4MGQ2YmI5NGY1IGJ5IHRhc2sga3dvcmtlci8z
OjEvNTgKPHNuaXA+CkNhbGwgdHJhY2U6CiBfX2thc2FuX3JlcG9ydCsweDEyNC8weDFjOAoga2Fz
YW5fcmVwb3J0KzB4NTQvMHg4NAoga2FzYW5fY2hlY2tfcmFuZ2UrMHgyMDAvMHgyMDgKIG1lbWNw
eSsweGI4LzB4ZjAKIGtvYmplY3RfZ2V0X3BhdGgrMHhmOC8weDFiOAoga29iamVjdF91ZXZlbnRf
ZW52KzB4MjI4LzB4YTg4CiBzY3NpX2V2dF90aHJlYWQrMHgyZDAvMHg1YjAKIHByb2Nlc3Nfb25l
X3dvcmsrMHg1NzAvMHhmOTQKIHdvcmtlcl90aHJlYWQrMHg3Y2MvMHhmODAKIGt0aHJlYWQrMHgy
YzQvMHgzODgKClRoZXNlIHR3byBqb2JzIGFyZSBzY2hlZHVsZWQgYXN5bmNocm9ub3VzbHksIHdl
IGNhbid0IGd1YXJhbnRlZWQgdGhhdAprb2JqLnBhcmVudCB3aWxsIGJlIGNyZWF0ZWQgaW4gZGV2
aWNlIGluaXQgdGhyZWFkIGJlZm9yZSBkZXZpY2UgcmVzZXQKdGhyZWFkIGNhbGxzIGtvYmplY3Rf
Z2V0X3BhdGgoKS4KClRvIHJlc29sdmUgdGhlIHJhY2luZyBpc3N1ZSBiZXR3ZWVuIGRldmljZSBp
bml0IHRocmVhZCBhbmQgZGV2aWNlIHJlc2V0CnRocmVhZCwgd2UgdXNlIHdhaXRfZXZlbnQoKSBp
biBzY3NpX2V2dF9lbWl0KCkgdG8gd2FpdCBmb3IgZGV2aWNlX2FkZCgpCnRvIGNvbXBsZXRlIHRo
ZSBjcmVhdGlvbiBvZiBrb2JqLnBhcmVudC4KCkRldmljZSBpbml0IGNhbGw6ICAgICAgICAgICAg
ICAgIERldmljZSByZXNldCBjYWxsOgp1ZnNoY2RfYXN5bmNfc2NhbigpICAgICAgICAgICAgICBz
Y3NpX2V2dF90aHJlYWQoKQogc2NzaV9zY2FuX2hvc3QoKSAgICAgICAgICAgICAgICAgc2NzaV9l
dnRfZW1pdCgpIDwtIGFkZCB3YWl0X2V2ZW50KCkKICBkb19zY3NpX3NjYW5faG9zdCgpIDwtIGFk
ZCB3YWtlX3VwKCkKICAgc2NzaV9zY2FuX2hvc3Rfc2VsZWN0ZWQoKQogICAgc2NzaV9zY2FuX2No
YW5uZWwoKQogICAgIHNjc2lfcHJvYmVfYW5kX2FkZF9sdW4oKQogICAgICBzY3NpX3RhcmdldF9h
ZGQoKQogICAgICAgZGV2aWNlX2FkZCgpIC8vIGFkZCBrb2JqLnBhcmVudAogICAgICAgIGtvYmpl
Y3RfdWV2ZW50X2VudigpCiAgICAgICAgIGtvYmplY3RfZ2V0X3BhdGgoKQogICAgICAgICAgZmls
bF9rb2JqX3BhdGgoKQogIC8vIGNhbGwgd2FrZV91cCgpIGFmdGVyIHNjc2lfc2Nhbl9ob3N0X3Nl
bGVjdGVkIGlzIGRvbmUKICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBrb2JqZWN0
X3VldmVudF9lbnYoKSAvLyBhZGQga29iai5wYXJlbnQKICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAga29iamVjdF9nZXRfcGF0aCgpIC8vIGdldCB2YWxpZCBrb2JqLnBhcmVudAog
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgZmlsbF9rb2JqX3BhdGgoKQoKQWZ0
ZXIgd2UgYWRkIHdha2VfdXAgYXQgZG9fc2NzaV9zY2FuX2hvc3QoKSBpbiBkZXZpY2UgaW5pdCB0
aHJlYWQsIHdlIGNhbgplbnN1cmUgdGhhdCBkZXZpY2UgcmVzZXQgdGhyZWFkIHdpbGwgZ2V0IGtv
YmplY3QgYWZ0ZXIgZGV2aWNlIGluaXQgdGhyZWFkCmZpbmlzaGVzIGFkZGluZyBwYXJlbnQuCgpT
aWduZWQtb2ZmLWJ5OiBBbGljZSBDaGFvIDxhbGljZS5jaGFvQG1lZGlhdGVrLmNvbT4KCi0tLQoK
Q2hhbmdlIGluIHY0Ci1DaGFuZ2UgY29tbWl0OiBDaGFuZ2UgY2FsbCBzdGFjayBkZXNjcmlwdGlv
bi4KCkNoYW5nZSBpbiB2MwotQ2hhbmdlIGNvbW1pdDogRGVzY3JpYmUgdGhlIHByZWJsZW0gZmly
c3QgYW5kIHRoZW4gdGhlIHNvbHV0aW9uLgotQWRkIGNvbW1pdDogQWRkIEtBU0FOIGVycm9yIGxv
Zy4KCkNoYW5nZSBpbiB2MgotUmVtb3ZlIENoYW5nZS1JZC4KCi0tLQogZHJpdmVycy9zY3NpL3Nj
c2lfbGliLmMgIHwgMSArCiBkcml2ZXJzL3Njc2kvc2NzaV9zY2FuLmMgfCAxICsKIDIgZmlsZXMg
Y2hhbmdlZCwgMiBpbnNlcnRpb25zKCspCgpkaWZmIC0tZ2l0IGEvZHJpdmVycy9zY3NpL3Njc2lf
bGliLmMgYi9kcml2ZXJzL3Njc2kvc2NzaV9saWIuYwppbmRleCAwYTcwYWE3NjNhOTYuLmFiZjlh
NzFlZDc3YyAxMDA2NDQKLS0tIGEvZHJpdmVycy9zY3NpL3Njc2lfbGliLmMKKysrIGIvZHJpdmVy
cy9zY3NpL3Njc2lfbGliLmMKQEAgLTI0NjEsNiArMjQ2MSw3IEBAIHN0YXRpYyB2b2lkIHNjc2lf
ZXZ0X2VtaXQoc3RydWN0IHNjc2lfZGV2aWNlICpzZGV2LCBzdHJ1Y3Qgc2NzaV9ldmVudCAqZXZ0
KQogCQlicmVhazsKIAljYXNlIFNERVZfRVZUX1BPV0VSX09OX1JFU0VUX09DQ1VSUkVEOgogCQll
bnZwW2lkeCsrXSA9ICJTREVWX1VBPVBPV0VSX09OX1JFU0VUX09DQ1VSUkVEIjsKKwkJd2FpdF9l
dmVudChzZGV2LT5ob3N0LT5ob3N0X3dhaXQsIHNkZXYtPnNkZXZfZ2VuZGV2LmtvYmoucGFyZW50
ICE9IE5VTEwpOwogCQlicmVhazsKIAlkZWZhdWx0OgogCQkvKiBkbyBub3RoaW5nICovCmRpZmYg
LS1naXQgYS9kcml2ZXJzL3Njc2kvc2NzaV9zY2FuLmMgYi9kcml2ZXJzL3Njc2kvc2NzaV9zY2Fu
LmMKaW5kZXggZjRlNmM2OGFjOTllLi40MzFmMjI5YWM0MzUgMTAwNjQ0Ci0tLSBhL2RyaXZlcnMv
c2NzaS9zY3NpX3NjYW4uYworKysgYi9kcml2ZXJzL3Njc2kvc2NzaV9zY2FuLmMKQEAgLTE5MDQs
NiArMTkwNCw3IEBAIHN0YXRpYyB2b2lkIGRvX3Njc2lfc2Nhbl9ob3N0KHN0cnVjdCBTY3NpX0hv
c3QgKnNob3N0KQogCX0gZWxzZSB7CiAJCXNjc2lfc2Nhbl9ob3N0X3NlbGVjdGVkKHNob3N0LCBT
Q0FOX1dJTERfQ0FSRCwgU0NBTl9XSUxEX0NBUkQsCiAJCQkJU0NBTl9XSUxEX0NBUkQsIDApOwor
CQl3YWtlX3VwKCZzaG9zdC0+aG9zdF93YWl0KTsKIAl9CiB9CiAKLS0gCjIuMTguMAoKCl9fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCkxpbnV4LW1lZGlhdGVr
IG1haWxpbmcgbGlzdApMaW51eC1tZWRpYXRla0BsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9s
aXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtbWVkaWF0ZWsK
