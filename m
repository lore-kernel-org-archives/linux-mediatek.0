Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C20DFC433F5
	for <linux-mediatek@archiver.kernel.org>; Mon, 23 May 2022 08:56:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=53vuJGSkK9ztXdIAxLlNyx+SzFyKfdAwR4fK8GK/Qng=; b=rVNcgBjgytNbYc
	wDDPLqlDxAN2AL7QK1snBitmtoNsnEDxspxdshV9Yt9IBKi9VLQrH8G/yM4E1fge/i4e3CXNedBJT
	JNqSOODVTuJ6uu4uvd2KwOfgaj5wCSGfEcJq8B2cP7/TCxxe3Df5Ba6oJtfsGdF0oiRNgT8fhuBgU
	D2+9WLP0cYBdvoFFVvz+l66FtchJrO6npRcK/A3tLQVfRoMhw7lKgK/iWsK7q5mHaLADY9KRaNlTg
	bwmKnJDmCW3E0qV05TWv7OBNRlFaU76UK73ivVhQu9WdcKaEDy0hBBadossyaB542zejCNI7Gp/Z0
	Q1klr6xPoQ6UQQgcpLzw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nt3r6-002bz5-KE; Mon, 23 May 2022 08:56:00 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nt2oX-002A7b-UD; Mon, 23 May 2022 07:49:18 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:Content-Type
 :MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From:
 Sender:Reply-To:Content-ID:Content-Description;
 bh=oD55bzEcDdi+6ahoQD0yeIhKN6BFoo9aBtTRqRTGg+0=; b=nbeV92lMeHrsEKi9bBM1QeeC0Q
 ZCzmZIAfHTdyvvkteQ6MP/WhdxoLAmICQOpo9v0Vy+1UH1tIdLOb/sjkBrnH8lg0/Tp9l7DcbJDG1
 YXMcMZAw/LuIysCwFScLjrx6QJP0geh3POOgdFWUPUI9Zc9GXUGKLb/MFSpSrvBZn3+0K1djgS660
 mkXfEEGf1JM8FfkkWjoSfai6KW6wyiaLZ7b5HGv8FEHx3H8ZhNgemCnmmjZTJ1iA4RpfWJsIaIpVT
 6zCSngSP8BYVbN9SvpXgelKccA/JNokcmDyTjYlQ9/rFDmbxehnY5I91b5rPQDJlPH/XL9AU7zd65
 6QBifiVQ==;
Received: from mailgw01.mediatek.com ([216.200.240.184])
 by desiato.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nt1Hj-000syV-S1; Mon, 23 May 2022 06:11:23 +0000
X-UUID: 289575f365864c989fa06b0406840028-20220522
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.5, REQID:87f72b76-a346-4e54-87a2-3f947b53a3eb, OB:0,
 LO
 B:0,IP:0,URL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,RULE:Release_Ham,ACTI
 ON:release,TS:0
X-CID-META: VersionHash:2a19b09, CLOUDID:c2f93e7a-5ef6-470b-96c9-bdb8ced32786,
 C
 OID:IGNORED,Recheck:0,SF:nil,TC:nil,Content:0,EDM:-3,IP:nil,URL:0,File:nil
 ,QS:0,BEC:nil
X-UUID: 289575f365864c989fa06b0406840028-20220522
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw01.mediatek.com
 (envelope-from <rex-bc.chen@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 583699046; Sun, 22 May 2022 23:10:52 -0700
Received: from mtkmbs07n1.mediatek.inc (172.21.101.16) by
 MTKMBS62N1.mediatek.inc (172.29.193.41) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Sun, 22 May 2022 23:01:01 -0700
Received: from mtkcas11.mediatek.inc (172.21.101.40) by
 mtkmbs07n1.mediatek.inc (172.21.101.16) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Mon, 23 May 2022 14:00:59 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by mtkcas11.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via
 Frontend Transport; Mon, 23 May 2022 14:00:59 +0800
From: Rex-BC Chen <rex-bc.chen@mediatek.com>
To: <mturquette@baylibre.com>, <sboyd@kernel.org>, <matthias.bgg@gmail.com>,
 <robh+dt@kernel.org>, <krzysztof.kozlowski+dt@linaro.org>
CC: <p.zabel@pengutronix.de>, <angelogioacchino.delregno@collabora.com>,
 <nfraprado@collabora.com>, <chun-jie.chen@mediatek.com>,
 <wenst@chromium.org>, <runyang.chen@mediatek.com>,
 <linux-kernel@vger.kernel.org>, <devicetree@vger.kernel.org>,
 <linux-clk@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
 <linux-mediatek@lists.infradead.org>,
 <Project_Global_Chrome_Upstream_Group@mediatek.com>, Rex-BC Chen
 <rex-bc.chen@mediatek.com>
Subject: [PATCH v8 13/19] dt-bindings: reset: mediatek: Add infra_ao reset
 index for MT8192/MT8195
Date: Mon, 23 May 2022 14:00:50 +0800
Message-ID: <20220523060056.24396-14-rex-bc.chen@mediatek.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <20220523060056.24396-1-rex-bc.chen@mediatek.com>
References: <20220523060056.24396-1-rex-bc.chen@mediatek.com>
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220523_071120_745421_90C51211 
X-CRM114-Status: UNSURE (   8.46  )
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
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

VG8gc3VwcG9ydCByZXNldCBvZiBpbmZyYV9hbywgYWRkIHRoZSBpbmRleCBvZiBpbmZyYV9hbyBy
ZXNldCBvZgp0aGVybWFsL3N2cy9wY2VpIGZvciBNVDgxOTIgYW5kIHRoZXJtYWwvc3ZzIGZvciBN
VDgxOTUuCgpTaWduZWQtb2ZmLWJ5OiBSZXgtQkMgQ2hlbiA8cmV4LWJjLmNoZW5AbWVkaWF0ZWsu
Y29tPgpBY2tlZC1ieTogS3J6eXN6dG9mIEtvemxvd3NraSA8a3J6eXN6dG9mLmtvemxvd3NraUBs
aW5hcm8ub3JnPgpSZXZpZXdlZC1ieTogQW5nZWxvR2lvYWNjaGlubyBEZWwgUmVnbm8gPGFuZ2Vs
b2dpb2FjY2hpbm8uZGVscmVnbm9AY29sbGFib3JhLmNvbT4KUmV2aWV3ZWQtYnk6IE7DrWNvbGFz
IEYuIFIuIEEuIFByYWRvIDxuZnJhcHJhZG9AY29sbGFib3JhLmNvbT4KVGVzdGVkLWJ5OiBOw61j
b2xhcyBGLiBSLiBBLiBQcmFkbyA8bmZyYXByYWRvQGNvbGxhYm9yYS5jb20+Ci0tLQogaW5jbHVk
ZS9kdC1iaW5kaW5ncy9yZXNldC9tdDgxOTItcmVzZXRzLmggfCA4ICsrKysrKysrCiBpbmNsdWRl
L2R0LWJpbmRpbmdzL3Jlc2V0L210ODE5NS1yZXNldHMuaCB8IDYgKysrKysrCiAyIGZpbGVzIGNo
YW5nZWQsIDE0IGluc2VydGlvbnMoKykKCmRpZmYgLS1naXQgYS9pbmNsdWRlL2R0LWJpbmRpbmdz
L3Jlc2V0L210ODE5Mi1yZXNldHMuaCBiL2luY2x1ZGUvZHQtYmluZGluZ3MvcmVzZXQvbXQ4MTky
LXJlc2V0cy5oCmluZGV4IDc2NGNhOTkxMGZhOS4uMTJlMjA4N2M5MGEzIDEwMDY0NAotLS0gYS9p
bmNsdWRlL2R0LWJpbmRpbmdzL3Jlc2V0L210ODE5Mi1yZXNldHMuaAorKysgYi9pbmNsdWRlL2R0
LWJpbmRpbmdzL3Jlc2V0L210ODE5Mi1yZXNldHMuaApAQCAtNyw2ICs3LDcgQEAKICNpZm5kZWYg
X0RUX0JJTkRJTkdTX1JFU0VUX0NPTlRST0xMRVJfTVQ4MTkyCiAjZGVmaW5lIF9EVF9CSU5ESU5H
U19SRVNFVF9DT05UUk9MTEVSX01UODE5MgogCisvKiBUT1BSR1UgcmVzZXRzICovCiAjZGVmaW5l
IE1UODE5Ml9UT1BSR1VfTU1fU1dfUlNUCQkJCQkxCiAjZGVmaW5lIE1UODE5Ml9UT1BSR1VfTUZH
X1NXX1JTVAkJCQkyCiAjZGVmaW5lIE1UODE5Ml9UT1BSR1VfVkVOQ19TV19SU1QJCQkJMwpAQCAt
MzAsNCArMzEsMTEgQEAKIC8qIE1NU1lTIHJlc2V0cyAqLwogI2RlZmluZSBNVDgxOTJfTU1TWVNf
U1cwX1JTVF9CX0RJU1BfRFNJMAkJCTE1CiAKKy8qIElORlJBIHJlc2V0cyAqLworI2RlZmluZSBN
VDgxOTJfSU5GUkFfUlNUMF9USEVSTV9DVFJMX1NXUlNUCQkwCisjZGVmaW5lIE1UODE5Ml9JTkZS
QV9SU1QyX1BFWFRQX1BIWV9TV1JTVAkJMQorI2RlZmluZSBNVDgxOTJfSU5GUkFfUlNUM19USEVS
TV9DVFJMX1BUUF9TV1JTVAkyCisjZGVmaW5lIE1UODE5Ml9JTkZSQV9SU1Q0X1BDSUVfVE9QX1NX
UlNUCQkzCisjZGVmaW5lIE1UODE5Ml9JTkZSQV9SU1Q0X1RIRVJNX0NUUkxfTUNVX1NXUlNUCTQK
KwogI2VuZGlmICAvKiBfRFRfQklORElOR1NfUkVTRVRfQ09OVFJPTExFUl9NVDgxOTIgKi8KZGlm
ZiAtLWdpdCBhL2luY2x1ZGUvZHQtYmluZGluZ3MvcmVzZXQvbXQ4MTk1LXJlc2V0cy5oIGIvaW5j
bHVkZS9kdC1iaW5kaW5ncy9yZXNldC9tdDgxOTUtcmVzZXRzLmgKaW5kZXggYTI2YmNjYzhiOTU3
Li4wYjE5MzdmMTRiMzYgMTAwNjQ0Ci0tLSBhL2luY2x1ZGUvZHQtYmluZGluZ3MvcmVzZXQvbXQ4
MTk1LXJlc2V0cy5oCisrKyBiL2luY2x1ZGUvZHQtYmluZGluZ3MvcmVzZXQvbXQ4MTk1LXJlc2V0
cy5oCkBAIC03LDYgKzcsNyBAQAogI2lmbmRlZiBfRFRfQklORElOR1NfUkVTRVRfQ09OVFJPTExF
Ul9NVDgxOTUKICNkZWZpbmUgX0RUX0JJTkRJTkdTX1JFU0VUX0NPTlRST0xMRVJfTVQ4MTk1CiAK
Ky8qIFRPUFJHVSByZXNldHMgKi8KICNkZWZpbmUgTVQ4MTk1X1RPUFJHVV9DT05OX01DVV9TV19S
U1QgICAgICAgICAgMAogI2RlZmluZSBNVDgxOTVfVE9QUkdVX0lORlJBX0dSU1RfU1dfUlNUICAg
ICAgICAxCiAjZGVmaW5lIE1UODE5NV9UT1BSR1VfQVBVX1NXX1JTVCAgICAgICAgICAgICAgIDIK
QEAgLTI2LDQgKzI3LDkgQEAKIAogI2RlZmluZSBNVDgxOTVfVE9QUkdVX1NXX1JTVF9OVU0gICAg
ICAgICAgICAgICAxNgogCisvKiBJTkZSQSByZXNldHMgKi8KKyNkZWZpbmUgTVQ4MTk1X0lORlJB
X1JTVDBfVEhFUk1fQ1RSTF9TV1JTVCAgICAgMAorI2RlZmluZSBNVDgxOTVfSU5GUkFfUlNUM19U
SEVSTV9DVFJMX1BUUF9TV1JTVCAxCisjZGVmaW5lIE1UODE5NV9JTkZSQV9SU1Q0X1RIRVJNX0NU
UkxfTUNVX1NXUlNUIDIKKwogI2VuZGlmICAvKiBfRFRfQklORElOR1NfUkVTRVRfQ09OVFJPTExF
Ul9NVDgxOTUgKi8KLS0gCjIuMTguMAoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fCkxpbnV4LW1lZGlhdGVrIG1haWxpbmcgbGlzdApMaW51eC1tZWRpYXRl
a0BsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4v
bGlzdGluZm8vbGludXgtbWVkaWF0ZWsK
