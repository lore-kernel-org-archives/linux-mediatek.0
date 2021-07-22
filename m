Return-Path: <SRS0=Khw4=MO=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-18.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,
	URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A4313C6377A
	for <linux-mediatek@archiver.kernel.org>; Thu, 22 Jul 2021 01:48:15 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 3DE026120A
	for <linux-mediatek@archiver.kernel.org>; Thu, 22 Jul 2021 01:48:15 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 3DE026120A
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:CC
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=0wYUZiDWqCOzpdEs3afN2Zfjd4SUQxnSThuuFcfFc/Q=; b=rYJ318voUIWw/y
	Ecd9C1Ls0d3Z/ycvQh1VVj4emzjWAcAdyDHLsnMT6c9oAaPG3l5Pa8fGPyid/KPcN6P7AzJoszPpK
	QvDSSD0/h+ppRAvpIG3GdUVGYglwCvTh4nGZenSl6K+Tv27TySEL1p8BVVrCb7AZtQ+XINAR8F8I5
	+LyWCnXi/k1NOL3eRtml5DM5boi43C3CKMH9fuwLziw2IM3Ah2S/4JcOU1cJUG0dfkcOvgXwFvzpX
	Hl9wEk8jrU0hhCvJmoL1UqEq78RE3nbBduelkN1jb1/iJQcfGSOM8ien8nHCL1G2MzMgiSuNiXFSM
	IVku0CA9ZmcyWXBQOZTw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1m6Noe-00HXIS-2U; Thu, 22 Jul 2021 01:48:00 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1m6Nob-00HXH1-DZ; Thu, 22 Jul 2021 01:47:59 +0000
X-UUID: d52b45643f37496a97677d455ebb7966-20210721
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:Message-ID:Date:Subject:CC:To:From;
 bh=dfzy9XPHbpCrBrsQRcmjXDpmS15Qi1YSXXTCdTyIePA=; 
 b=XbxQw9V5PylpGjZEMui2Ctq0BdK12baSODr3SLydeHz+9A0uPGg7S0uPixdyNQXB6WUra9ia6ady8NSzeNG1zH3DRVRT8BRDz4F6Pan480FpxkpIdjf0uclctZsFWlsX4POQeHPXwhJ+9GxxP+ctu9OB1t4vMoUMLyf2Bs77xqo=;
X-UUID: d52b45643f37496a97677d455ebb7966-20210721
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw02.mediatek.com
 (envelope-from <jason-jh.lin@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 898910576; Wed, 21 Jul 2021 18:47:51 -0700
Received: from MTKMBS02N2.mediatek.inc (172.21.101.101) by
 MTKMBS62DR.mediatek.inc (172.29.94.18) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Wed, 21 Jul 2021 18:47:49 -0700
Received: from mtkcas07.mediatek.inc (172.21.101.84) by
 mtkmbs02n2.mediatek.inc (172.21.101.101) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Thu, 22 Jul 2021 09:47:47 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by mtkcas07.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via
 Frontend Transport; Thu, 22 Jul 2021 09:47:47 +0800
From: jason-jh.lin <jason-jh.lin@mediatek.com>
To: Chun-Kuang Hu <chunkuang.hu@kernel.org>, Matthias Brugger
 <matthias.bgg@gmail.com>, Maxime Ripard <maxime@cerno.tech>
CC: Philipp Zabel <p.zabel@pengutronix.de>, David Airlie <airlied@linux.ie>,
 Daniel Vetter <daniel@ffwll.ch>, <ville.syrjala@linux.intel.com>, "Thomas
 Zimmermann" <tzimmermann@suse.de>, <dri-devel@lists.freedesktop.org>,
 <linux-mediatek@lists.infradead.org>, <linux-arm-kernel@lists.infradead.org>, 
 <linux-kernel@vger.kernel.org>, <hsinyi@chromium.org>,
 <seanpaul@chromium.org>, <enric.balletbo@collabora.com>,
 <jason-jh.lin@mediatek.com>, <nancy.lin@mediatek.com>,
 <singo.chang@mediatek.com>, <David-YH.Chiu@mediatek.com>
Subject: [PATCH v4] drm/mediatek: Fix cursor plane didn't update
Date: Thu, 22 Jul 2021 09:47:43 +0800
Message-ID: <20210722014743.8377-1-jason-jh.lin@mediatek.com>
X-Mailer: git-send-email 2.18.0
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210721_184757_515881_114DC7AE 
X-CRM114-Status: GOOD (  14.99  )
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

VGhlIGN1cnNvciBwbGFuZSBzaG91bGQgdXNlIHRoZSBjdXJyZW50IHBsYW5lIHN0YXRlIGluIGF0
b21pY19hc3luY191cGRhdGUNCmJlY2F1c2UgaXQgd291bGQgbm90IGJlIHRoZSBuZXcgcGxhbmUg
c3RhdGUgaW4gdGhlIGdsb2JhbCBhdG9taWMgc3RhdGUNCnNpbmNlIF9zd2FwX3N0YXRlIGhhcHBl
bmVkIHdoZW4gdGhvc2UgaG9vayBhcmUgcnVuLg0KDQpGaXggY3Vyc29yIHBsYW5lIGlzc3VlIGJ5
IGJlbG93IG1vZGlmaWNhdGlvbjoNCjEuIFJlbW92ZSBwbGFuZV9oZWxwZXJfZnVuY3MtPmF0b21p
Y191cGRhdGUocGxhbmUsIHN0YXRlKSBpbg0KICAgbXRrX2RybV9jcnRjX2FzeW5jX3VwZGF0ZS4N
CjIuIEFkZCBtdGtfZHJtX3VwZGF0ZV9uZXdfc3RhdGUgaW4gdG8gbXRrX3BsYW5lX2F0b21pY19h
c3luY191cGRhdGUgdG8NCiAgIHVwZGF0ZSB0aGUgY3Vyc29yIHBsYW5lIGJ5IGN1cnJlbnQgcGxh
bmUgc3RhdGUgaG9vayBhbmQgdXBkYXRlDQogICBvdGhlcnMgcGxhbmUgYnkgdGhlIG5ld19zdGF0
ZS4NCg0KRml4ZXM6IDM3NDE4YmYxNGMxMyAoImRybTogVXNlIHN0YXRlIGhlbHBlciBpbnN0ZWFk
IG9mIHRoZSBwbGFuZSBzdGF0ZSBwb2ludGVyIikNClNpZ25lZC1vZmYtYnk6IGphc29uLWpoLmxp
biA8amFzb24tamgubGluQG1lZGlhdGVrLmNvbT4NClRlc3RlZC1ieTogRW5yaWMgQmFsbGV0Ym8g
aSBTZXJyYSA8ZW5yaWMuYmFsbGV0Ym9AY29sbGFib3JhLmNvbT4NCi0tLQ0KICBDaGFuZ2UgaW4g
djQ6DQogIC0gRml4IGNvbXBpbGUgd2FybmluZzoNCiAgICAuLi9kcml2ZXJzL2dwdS9kcm0vbWVk
aWF0ZWsvbXRrX2RybV9jcnRjLmM6NTc4OjM5OiB3YXJuaW5nOiB1bnVzZWQNCiAgICB2YXJpYWJs
ZSDigJhwbGFuZV9oZWxwZXJfZnVuY3PigJkgWy1XdW51c2VkLXZhcmlhYmxlDQotLS0NCiBkcml2
ZXJzL2dwdS9kcm0vbWVkaWF0ZWsvbXRrX2RybV9jcnRjLmMgIHwgIDMgLS0NCiBkcml2ZXJzL2dw
dS9kcm0vbWVkaWF0ZWsvbXRrX2RybV9wbGFuZS5jIHwgNjAgKysrKysrKysrKysrKystLS0tLS0t
LS0tDQogMiBmaWxlcyBjaGFuZ2VkLCAzNCBpbnNlcnRpb25zKCspLCAyOSBkZWxldGlvbnMoLSkN
Cg0KZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9tZWRpYXRlay9tdGtfZHJtX2NydGMuYyBi
L2RyaXZlcnMvZ3B1L2RybS9tZWRpYXRlay9tdGtfZHJtX2NydGMuYw0KaW5kZXggNDBkZjJjODIz
MTg3Li41MTUzMTU1MDVlM2IgMTAwNjQ0DQotLS0gYS9kcml2ZXJzL2dwdS9kcm0vbWVkaWF0ZWsv
bXRrX2RybV9jcnRjLmMNCisrKyBiL2RyaXZlcnMvZ3B1L2RybS9tZWRpYXRlay9tdGtfZHJtX2Ny
dGMuYw0KQEAgLTUzMiwxMyArNTMyLDEwIEBAIHZvaWQgbXRrX2RybV9jcnRjX2FzeW5jX3VwZGF0
ZShzdHJ1Y3QgZHJtX2NydGMgKmNydGMsIHN0cnVjdCBkcm1fcGxhbmUgKnBsYW5lLA0KIAkJCSAg
ICAgICBzdHJ1Y3QgZHJtX2F0b21pY19zdGF0ZSAqc3RhdGUpDQogew0KIAlzdHJ1Y3QgbXRrX2Ry
bV9jcnRjICptdGtfY3J0YyA9IHRvX210a19jcnRjKGNydGMpOw0KLQljb25zdCBzdHJ1Y3QgZHJt
X3BsYW5lX2hlbHBlcl9mdW5jcyAqcGxhbmVfaGVscGVyX2Z1bmNzID0NCi0JCQlwbGFuZS0+aGVs
cGVyX3ByaXZhdGU7DQogDQogCWlmICghbXRrX2NydGMtPmVuYWJsZWQpDQogCQlyZXR1cm47DQog
DQotCXBsYW5lX2hlbHBlcl9mdW5jcy0+YXRvbWljX3VwZGF0ZShwbGFuZSwgc3RhdGUpOw0KIAlt
dGtfZHJtX2NydGNfdXBkYXRlX2NvbmZpZyhtdGtfY3J0YywgZmFsc2UpOw0KIH0NCiANCmRpZmYg
LS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vbWVkaWF0ZWsvbXRrX2RybV9wbGFuZS5jIGIvZHJpdmVy
cy9ncHUvZHJtL21lZGlhdGVrL210a19kcm1fcGxhbmUuYw0KaW5kZXggYjU1ODJkY2Y1NjRjLi5l
NmRjYjM0ZDMwNTIgMTAwNjQ0DQotLS0gYS9kcml2ZXJzL2dwdS9kcm0vbWVkaWF0ZWsvbXRrX2Ry
bV9wbGFuZS5jDQorKysgYi9kcml2ZXJzL2dwdS9kcm0vbWVkaWF0ZWsvbXRrX2RybV9wbGFuZS5j
DQpAQCAtMTEwLDYgKzExMCwzNSBAQCBzdGF0aWMgaW50IG10a19wbGFuZV9hdG9taWNfYXN5bmNf
Y2hlY2soc3RydWN0IGRybV9wbGFuZSAqcGxhbmUsDQogCQkJCQkJICAgdHJ1ZSwgdHJ1ZSk7DQog
fQ0KIA0KK3N0YXRpYyB2b2lkIG10a19wbGFuZV91cGRhdGVfbmV3X3N0YXRlKHN0cnVjdCBkcm1f
cGxhbmVfc3RhdGUgKm5ld19zdGF0ZSwNCisJCQkJICAgICAgIHN0cnVjdCBtdGtfcGxhbmVfc3Rh
dGUgKm10a19wbGFuZV9zdGF0ZSkNCit7DQorCXN0cnVjdCBkcm1fZnJhbWVidWZmZXIgKmZiID0g
bmV3X3N0YXRlLT5mYjsNCisJc3RydWN0IGRybV9nZW1fb2JqZWN0ICpnZW07DQorCXN0cnVjdCBt
dGtfZHJtX2dlbV9vYmogKm10a19nZW07DQorCXVuc2lnbmVkIGludCBwaXRjaCwgZm9ybWF0Ow0K
KwlkbWFfYWRkcl90IGFkZHI7DQorDQorCWdlbSA9IGZiLT5vYmpbMF07DQorCW10a19nZW0gPSB0
b19tdGtfZ2VtX29iaihnZW0pOw0KKwlhZGRyID0gbXRrX2dlbS0+ZG1hX2FkZHI7DQorCXBpdGNo
ID0gZmItPnBpdGNoZXNbMF07DQorCWZvcm1hdCA9IGZiLT5mb3JtYXQtPmZvcm1hdDsNCisNCisJ
YWRkciArPSAobmV3X3N0YXRlLT5zcmMueDEgPj4gMTYpICogZmItPmZvcm1hdC0+Y3BwWzBdOw0K
KwlhZGRyICs9IChuZXdfc3RhdGUtPnNyYy55MSA+PiAxNikgKiBwaXRjaDsNCisNCisJbXRrX3Bs
YW5lX3N0YXRlLT5wZW5kaW5nLmVuYWJsZSA9IHRydWU7DQorCW10a19wbGFuZV9zdGF0ZS0+cGVu
ZGluZy5waXRjaCA9IHBpdGNoOw0KKwltdGtfcGxhbmVfc3RhdGUtPnBlbmRpbmcuZm9ybWF0ID0g
Zm9ybWF0Ow0KKwltdGtfcGxhbmVfc3RhdGUtPnBlbmRpbmcuYWRkciA9IGFkZHI7DQorCW10a19w
bGFuZV9zdGF0ZS0+cGVuZGluZy54ID0gbmV3X3N0YXRlLT5kc3QueDE7DQorCW10a19wbGFuZV9z
dGF0ZS0+cGVuZGluZy55ID0gbmV3X3N0YXRlLT5kc3QueTE7DQorCW10a19wbGFuZV9zdGF0ZS0+
cGVuZGluZy53aWR0aCA9IGRybV9yZWN0X3dpZHRoKCZuZXdfc3RhdGUtPmRzdCk7DQorCW10a19w
bGFuZV9zdGF0ZS0+cGVuZGluZy5oZWlnaHQgPSBkcm1fcmVjdF9oZWlnaHQoJm5ld19zdGF0ZS0+
ZHN0KTsNCisJbXRrX3BsYW5lX3N0YXRlLT5wZW5kaW5nLnJvdGF0aW9uID0gbmV3X3N0YXRlLT5y
b3RhdGlvbjsNCit9DQorDQogc3RhdGljIHZvaWQgbXRrX3BsYW5lX2F0b21pY19hc3luY191cGRh
dGUoc3RydWN0IGRybV9wbGFuZSAqcGxhbmUsDQogCQkJCQkgIHN0cnVjdCBkcm1fYXRvbWljX3N0
YXRlICpzdGF0ZSkNCiB7DQpAQCAtMTI2LDggKzE1NSwxMCBAQCBzdGF0aWMgdm9pZCBtdGtfcGxh
bmVfYXRvbWljX2FzeW5jX3VwZGF0ZShzdHJ1Y3QgZHJtX3BsYW5lICpwbGFuZSwNCiAJcGxhbmUt
PnN0YXRlLT5zcmNfaCA9IG5ld19zdGF0ZS0+c3JjX2g7DQogCXBsYW5lLT5zdGF0ZS0+c3JjX3cg
PSBuZXdfc3RhdGUtPnNyY193Ow0KIAlzd2FwKHBsYW5lLT5zdGF0ZS0+ZmIsIG5ld19zdGF0ZS0+
ZmIpOw0KLQluZXdfcGxhbmVfc3RhdGUtPnBlbmRpbmcuYXN5bmNfZGlydHkgPSB0cnVlOw0KIA0K
KwltdGtfcGxhbmVfdXBkYXRlX25ld19zdGF0ZShuZXdfc3RhdGUsIG5ld19wbGFuZV9zdGF0ZSk7
DQorCXdtYigpOyAvKiBNYWtlIHN1cmUgdGhlIGFib3ZlIHBhcmFtZXRlcnMgYXJlIHNldCBiZWZv
cmUgdXBkYXRlICovDQorCW5ld19wbGFuZV9zdGF0ZS0+cGVuZGluZy5hc3luY19kaXJ0eSA9IHRy
dWU7DQogCW10a19kcm1fY3J0Y19hc3luY191cGRhdGUobmV3X3N0YXRlLT5jcnRjLCBwbGFuZSwg
c3RhdGUpOw0KIH0NCiANCkBAIC0xODksMTQgKzIyMCw4IEBAIHN0YXRpYyB2b2lkIG10a19wbGFu
ZV9hdG9taWNfdXBkYXRlKHN0cnVjdCBkcm1fcGxhbmUgKnBsYW5lLA0KIAlzdHJ1Y3QgZHJtX3Bs
YW5lX3N0YXRlICpuZXdfc3RhdGUgPSBkcm1fYXRvbWljX2dldF9uZXdfcGxhbmVfc3RhdGUoc3Rh
dGUsDQogCQkJCQkJCQkJICAgcGxhbmUpOw0KIAlzdHJ1Y3QgbXRrX3BsYW5lX3N0YXRlICptdGtf
cGxhbmVfc3RhdGUgPSB0b19tdGtfcGxhbmVfc3RhdGUobmV3X3N0YXRlKTsNCi0Jc3RydWN0IGRy
bV9jcnRjICpjcnRjID0gbmV3X3N0YXRlLT5jcnRjOw0KLQlzdHJ1Y3QgZHJtX2ZyYW1lYnVmZmVy
ICpmYiA9IG5ld19zdGF0ZS0+ZmI7DQotCXN0cnVjdCBkcm1fZ2VtX29iamVjdCAqZ2VtOw0KLQlz
dHJ1Y3QgbXRrX2RybV9nZW1fb2JqICptdGtfZ2VtOw0KLQl1bnNpZ25lZCBpbnQgcGl0Y2gsIGZv
cm1hdDsNCi0JZG1hX2FkZHJfdCBhZGRyOw0KIA0KLQlpZiAoIWNydGMgfHwgV0FSTl9PTighZmIp
KQ0KKwlpZiAoIW5ld19zdGF0ZS0+Y3J0YyB8fCBXQVJOX09OKCFuZXdfc3RhdGUtPmZiKSkNCiAJ
CXJldHVybjsNCiANCiAJaWYgKCFuZXdfc3RhdGUtPnZpc2libGUpIHsNCkBAIC0yMDQsMjQgKzIy
OSw3IEBAIHN0YXRpYyB2b2lkIG10a19wbGFuZV9hdG9taWNfdXBkYXRlKHN0cnVjdCBkcm1fcGxh
bmUgKnBsYW5lLA0KIAkJcmV0dXJuOw0KIAl9DQogDQotCWdlbSA9IGZiLT5vYmpbMF07DQotCW10
a19nZW0gPSB0b19tdGtfZ2VtX29iaihnZW0pOw0KLQlhZGRyID0gbXRrX2dlbS0+ZG1hX2FkZHI7
DQotCXBpdGNoID0gZmItPnBpdGNoZXNbMF07DQotCWZvcm1hdCA9IGZiLT5mb3JtYXQtPmZvcm1h
dDsNCi0NCi0JYWRkciArPSAobmV3X3N0YXRlLT5zcmMueDEgPj4gMTYpICogZmItPmZvcm1hdC0+
Y3BwWzBdOw0KLQlhZGRyICs9IChuZXdfc3RhdGUtPnNyYy55MSA+PiAxNikgKiBwaXRjaDsNCi0N
Ci0JbXRrX3BsYW5lX3N0YXRlLT5wZW5kaW5nLmVuYWJsZSA9IHRydWU7DQotCW10a19wbGFuZV9z
dGF0ZS0+cGVuZGluZy5waXRjaCA9IHBpdGNoOw0KLQltdGtfcGxhbmVfc3RhdGUtPnBlbmRpbmcu
Zm9ybWF0ID0gZm9ybWF0Ow0KLQltdGtfcGxhbmVfc3RhdGUtPnBlbmRpbmcuYWRkciA9IGFkZHI7
DQotCW10a19wbGFuZV9zdGF0ZS0+cGVuZGluZy54ID0gbmV3X3N0YXRlLT5kc3QueDE7DQotCW10
a19wbGFuZV9zdGF0ZS0+cGVuZGluZy55ID0gbmV3X3N0YXRlLT5kc3QueTE7DQotCW10a19wbGFu
ZV9zdGF0ZS0+cGVuZGluZy53aWR0aCA9IGRybV9yZWN0X3dpZHRoKCZuZXdfc3RhdGUtPmRzdCk7
DQotCW10a19wbGFuZV9zdGF0ZS0+cGVuZGluZy5oZWlnaHQgPSBkcm1fcmVjdF9oZWlnaHQoJm5l
d19zdGF0ZS0+ZHN0KTsNCi0JbXRrX3BsYW5lX3N0YXRlLT5wZW5kaW5nLnJvdGF0aW9uID0gbmV3
X3N0YXRlLT5yb3RhdGlvbjsNCisJbXRrX3BsYW5lX3VwZGF0ZV9uZXdfc3RhdGUobmV3X3N0YXRl
LCBtdGtfcGxhbmVfc3RhdGUpOw0KIAl3bWIoKTsgLyogTWFrZSBzdXJlIHRoZSBhYm92ZSBwYXJh
bWV0ZXJzIGFyZSBzZXQgYmVmb3JlIHVwZGF0ZSAqLw0KIAltdGtfcGxhbmVfc3RhdGUtPnBlbmRp
bmcuZGlydHkgPSB0cnVlOw0KIH0NCi0tIA0KMi4xOC4wDQpfX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fXwpMaW51eC1tZWRpYXRlayBtYWlsaW5nIGxpc3QKTGlu
dXgtbWVkaWF0ZWtAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9y
Zy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LW1lZGlhdGVrCg==
