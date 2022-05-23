Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4B4EBC433F5
	for <linux-mediatek@archiver.kernel.org>; Mon, 23 May 2022 10:12:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=26vB13hJoAaCoKDijWIdKastbNJhHFT1l0VUHr71A84=; b=GhtTOkP9Gos+SV
	4Xz+lPhCtsPDCH4BY0TZC3/6Gu8QTliPMoZCxXygv0BsFmAmeVX3Va++3EP9PAQ6ITvvGtAFt45kk
	vIxQCyns+9YlXI4hKIi/2ZvoFRuB2YIBjf5Q4JKbM8+NtV8PmSyygO9WewJokNuMwtwdizoqJq/z9
	fEWLrBt9Puql44YnAfJ8jqIBEsdSWi6OSCSAGoloBg67aiho8CeyXTd4uSVron5B3Eorf3QnJ3Q9w
	xXidwX6EJMNpFNIbuS0aRoXmfAqfoh3knswEt0TcvQDVekZ+un8VO1lBAJbV5nooutuH6L/qlP1AN
	d8AiwHmCWPtXk06N9YcA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nt52Y-0038By-Cs; Mon, 23 May 2022 10:11:54 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nt2oZ-002AAA-LF; Mon, 23 May 2022 07:49:19 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:Content-Type
 :MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From:
 Sender:Reply-To:Content-ID:Content-Description;
 bh=JvvJbqHyEgIfYk/hEoBJOLp/+fRr0SOqnQa7rBF2NVc=; b=LXx0luT8tFwFKkcuPg4ad8VErg
 TKWh5NTqTJ5TwscGymWSx4pfLUPuqxSvDAIOpEgEsjYQqa3DQ1YxYMFo6qCuXRzqVYM86qvGyNstf
 coCz1So4qypEOIBUSUSATpYB4/WBPDsUG7PB5GdCBva8yqH0Ic4Gi1o5ON0SsI+sXoFa85BL0k8x8
 dNaJ5lwgdqeFvrxjL6XU50VW6SaOnQ5ncjGLuyZlicXfU9p4GrxF/93+yKpJRegZKH7rb0oo7B9oZ
 2WxL+fCK5khiTLQXNkYVfFOyZcPwPLb2lefjCddCJq09WPNOcHgEz0fmMyNQ2PC8vJhtIXJcQyQln
 0IZLL0Bw==;
Received: from mailgw01.mediatek.com ([216.200.240.184])
 by desiato.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nt1Hj-000syU-S1; Mon, 23 May 2022 06:11:23 +0000
X-UUID: f175ea6ad71d472da8e403c666d8e62a-20220522
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.5, REQID:e31b9d7e-978a-425c-a219-eb2064da2260, OB:0,
 LO
 B:0,IP:0,URL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,RULE:Release_Ham,ACTI
 ON:release,TS:0
X-CID-META: VersionHash:2a19b09, CLOUDID:b0f93e7a-5ef6-470b-96c9-bdb8ced32786,
 C
 OID:IGNORED,Recheck:0,SF:nil,TC:nil,Content:0,EDM:-3,IP:nil,URL:0,File:nil
 ,QS:0,BEC:nil
X-UUID: f175ea6ad71d472da8e403c666d8e62a-20220522
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw01.mediatek.com
 (envelope-from <rex-bc.chen@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 2060297352; Sun, 22 May 2022 23:10:52 -0700
Received: from mtkmbs07n1.mediatek.inc (172.21.101.16) by
 MTKMBS62N1.mediatek.inc (172.29.193.41) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Sun, 22 May 2022 23:01:03 -0700
Received: from mtkcas11.mediatek.inc (172.21.101.40) by
 mtkmbs07n1.mediatek.inc (172.21.101.16) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Mon, 23 May 2022 14:01:00 +0800
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
Subject: [PATCH v8 17/19] dt-bindings: reset: mediatek: Add infra_ao reset
 index for MT8186
Date: Mon, 23 May 2022 14:00:54 +0800
Message-ID: <20220523060056.24396-18-rex-bc.chen@mediatek.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <20220523060056.24396-1-rex-bc.chen@mediatek.com>
References: <20220523060056.24396-1-rex-bc.chen@mediatek.com>
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220523_071120_850276_8CDC2D48 
X-CRM114-Status: UNSURE (   8.60  )
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
ZXNldCBvZgp0aGVybWFsL3N2cyBmb3IgTVQ4MTg2LgoKU2lnbmVkLW9mZi1ieTogUmV4LUJDIENo
ZW4gPHJleC1iYy5jaGVuQG1lZGlhdGVrLmNvbT4KQWNrZWQtYnk6IFJvYiBIZXJyaW5nIDxyb2Jo
QGtlcm5lbC5vcmc+ClJldmlld2VkLWJ5OiBOw61jb2xhcyBGLiBSLiBBLiBQcmFkbyA8bmZyYXBy
YWRvQGNvbGxhYm9yYS5jb20+ClRlc3RlZC1ieTogTsOtY29sYXMgRi4gUi4gQS4gUHJhZG8gPG5m
cmFwcmFkb0Bjb2xsYWJvcmEuY29tPgotLS0KIGluY2x1ZGUvZHQtYmluZGluZ3MvcmVzZXQvbXQ4
MTg2LXJlc2V0cy5oIHwgNSArKysrKwogMSBmaWxlIGNoYW5nZWQsIDUgaW5zZXJ0aW9ucygrKQoK
ZGlmZiAtLWdpdCBhL2luY2x1ZGUvZHQtYmluZGluZ3MvcmVzZXQvbXQ4MTg2LXJlc2V0cy5oIGIv
aW5jbHVkZS9kdC1iaW5kaW5ncy9yZXNldC9tdDgxODYtcmVzZXRzLmgKaW5kZXggNWY4NTAzNzBj
NDJjLi4yZTkwMjljMjJmMzggMTAwNjQ0Ci0tLSBhL2luY2x1ZGUvZHQtYmluZGluZ3MvcmVzZXQv
bXQ4MTg2LXJlc2V0cy5oCisrKyBiL2luY2x1ZGUvZHQtYmluZGluZ3MvcmVzZXQvbXQ4MTg2LXJl
c2V0cy5oCkBAIC03LDYgKzcsNyBAQAogI2lmbmRlZiBfRFRfQklORElOR1NfUkVTRVRfQ09OVFJP
TExFUl9NVDgxODYKICNkZWZpbmUgX0RUX0JJTkRJTkdTX1JFU0VUX0NPTlRST0xMRVJfTVQ4MTg2
CiAKKy8qIFRPUFJHVSByZXNldHMgKi8KICNkZWZpbmUgTVQ4MTg2X1RPUFJHVV9JTkZSQV9TV19S
U1QJCQkJMAogI2RlZmluZSBNVDgxODZfVE9QUkdVX01NX1NXX1JTVAkJCQkJMQogI2RlZmluZSBN
VDgxODZfVE9QUkdVX01GR19TV19SU1QJCQkJMgpAQCAtMzMsNCArMzQsOCBAQAogLyogTU1TWVMg
cmVzZXRzICovCiAjZGVmaW5lIE1UODE4Nl9NTVNZU19TVzBfUlNUX0JfRElTUF9EU0kwCQkJMTkK
IAorLyogSU5GUkEgcmVzZXRzICovCisjZGVmaW5lIE1UODE4Nl9JTkZSQV9USEVSTUFMX0NUUkxf
UlNUCQkJMAorI2RlZmluZSBNVDgxODZfSU5GUkFfUFRQX0NUUkxfUlNUCQkJCTEKKwogI2VuZGlm
ICAvKiBfRFRfQklORElOR1NfUkVTRVRfQ09OVFJPTExFUl9NVDgxODYgKi8KLS0gCjIuMTguMAoK
Cl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCkxpbnV4LW1l
ZGlhdGVrIG1haWxpbmcgbGlzdApMaW51eC1tZWRpYXRla0BsaXN0cy5pbmZyYWRlYWQub3JnCmh0
dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtbWVkaWF0ZWsK
