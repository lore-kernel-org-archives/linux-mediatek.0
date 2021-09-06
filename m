Return-Path: <SRS0=cnxW=N4=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.1 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A03BFC433FE
	for <linux-mediatek@archiver.kernel.org>; Mon,  6 Sep 2021 07:18:38 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 6787260F21
	for <linux-mediatek@archiver.kernel.org>; Mon,  6 Sep 2021 07:18:38 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 6787260F21
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:CC
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=fDzhbz/rEerzFSu1ubu1/WW76TIYs1b1omxnp0z2Z1o=; b=AL7dW20/+bkIy6
	qHxIeDi1tnWqyv9EPDEuZyNC+R23MSKjHTClCa2VxsKTrs92KfBJmjtCvgJYOPTMqUK8x4NlnnCTK
	35WwYANYftng8hX/R0hH/OCr3eYJ5DyTwo2fir8idIOmYy5E7blLomABqQe1kaOF4A2OZmg6+CxV6
	RHuBnneEVBuJ8tPN5uZdaZFJ4CMceejaRI09NM1NisYWP7l8p+z1WlYfcPxi2R25kybKAJh2iG4Uf
	i7H+tksu69tTBjeHWy6kzV914Qi/8yb1+jzpZl6j21VREnWU/lxU583TB2Xt3FXmnQYiXl4D8vcZO
	WzMj4+m2McWM9+wq5XOg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mN8td-00HYnP-KK; Mon, 06 Sep 2021 07:18:25 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mN8r7-00HXOw-N6; Mon, 06 Sep 2021 07:15:52 +0000
X-UUID: 4174b04dc032444595c6e665f07f1650-20210906
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:Message-ID:Date:Subject:CC:To:From;
 bh=Pu3j0ZOLLC2MeJ2R7bons8FS5QPedmxYJ5fGiwKUvy4=; 
 b=MWjQYG1srADWS4yoSW9Sl4KqzKJBPMLszJVqNrE1/2oF60pEYOSkYhxP69+dct3d7ISbs9S4v5YJ9caW2bEMYqhxLKu7yCPYWSnSijA8fvj4naxAeqAGHRBAfkfEpKl1UCFPfH2Uag8yk9fc3VBbPJo7NRv2EpYOoPx6P4m18Hw=;
X-UUID: 4174b04dc032444595c6e665f07f1650-20210906
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw02.mediatek.com
 (envelope-from <nancy.lin@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 71349040; Mon, 06 Sep 2021 00:15:43 -0700
Received: from mtkmbs07n1.mediatek.inc (172.21.101.16) by
 MTKMBS62N1.mediatek.inc (172.29.193.41) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Mon, 6 Sep 2021 00:15:41 -0700
Received: from MTKCAS06.mediatek.inc (172.21.101.30) by
 mtkmbs07n1.mediatek.inc (172.21.101.16) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Mon, 6 Sep 2021 15:15:40 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by MTKCAS06.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via
 Frontend Transport; Mon, 6 Sep 2021 15:15:40 +0800
From: Nancy.Lin <nancy.lin@mediatek.com>
To: CK Hu <ck.hu@mediatek.com>
CC: Chun-Kuang Hu <chunkuang.hu@kernel.org>, Philipp Zabel
 <p.zabel@pengutronix.de>, David Airlie <airlied@linux.ie>, Daniel Vetter
 <daniel@ffwll.ch>, Rob Herring <robh+dt@kernel.org>, Matthias Brugger
 <matthias.bgg@gmail.com>, "jason-jh . lin" <jason-jh.lin@mediatek.com>,
 "Nancy . Lin" <nancy.lin@mediatek.com>, Yongqiang Niu
 <yongqiang.niu@mediatek.com>, <dri-devel@lists.freedesktop.org>,
 <linux-mediatek@lists.infradead.org>, <devicetree@vger.kernel.org>,
 <linux-kernel@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
 <singo.chang@mediatek.com>, <srv_heupstream@mediatek.com>
Subject: [PATCH v5 00/16] Add MediaTek SoC DRM (vdosys1) support for mt8195
Date: Mon, 6 Sep 2021 15:15:23 +0800
Message-ID: <20210906071539.12953-1-nancy.lin@mediatek.com>
X-Mailer: git-send-email 2.18.0
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210906_001549_851805_F3952173 
X-CRM114-Status: GOOD (  14.83  )
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

VGhlIGhhcmR3YXJlIHBhdGggb2YgdmRvc3lzMSB3aXRoIERQVHggb3V0cHV0IG5lZWQgdG8gZ28g
dGhyb3VnaCBieSBzZXZlcmFsIG1vZHVsZXMsIHN1Y2ggYXMsIE9WTF9BREFQVE9SIGFuZCBNRVJH
RS4NCg0KQWRkIERSTSBhbmQgdGhlc2UgbW9kdWxlcyBzdXBwb3J0IGJ5IHRoZSBwYXRjaGVzIGJl
bG93Og0KDQpDaGFuZ2VzIGluIHY1Og0KLSBhZGQgbW1zeXMgcmVzZXQgY29udHJvbGxlciByZWZl
cmVuY2UuDQoNCkNoYW5nZXMgaW4gdjQ6DQotIHVzZSBtZXJnZSBjb21tb24gZHJpdmVyIGZvciBt
ZXJnZTF+NC4NCi0gcmVmaW5lIG92bF9hZGFwdG9yIHJkbWEgZHJpdmVyLg0KLSB1c2Ugb3ZsX2Fk
YXB0b3IgZGRwX2NvbXAgZnVuY3Rpb24gaW5zdGVhZCBvZiBldGhkci4NCi0gbW9kaWZ5IGZvciBy
ZXZpZXdlcidzIGNvbW1lbnQgaW4gdjMuDQoNCkNoYW5nZXMgaW4gdjM6DQotIG1vZGlmeSBmb3Ig
cmV2aWV3ZXIncyBjb21tZW50IGluIHYyLg0KLSBhZGQgdmRvc3lzMSAyIHBpeGVscyBhbGlnbiBs
aW1pdC4NCi0gYWRkIG1peGVyIG9kZCBvZmZzZXQgc3VwcG9ydC4NCg0KQ2hhbmdlcyBpbiB2MjoN
Ci0gTWVyZ2UgUFNFVURPX09WTCBhbmQgRVRIRFIgaW50byBvbmUgRFJNIGNvbXBvbmVudC4NCi0g
QWRkIG1tc3lzIGNvbmZpZyBBUEkgZm9yIHZkb3N5czEgaGFyZHdhcmUgc2V0dGluZy4NCi0gQWRk
IG1tc3lzIHJlc2V0IGNvbnRyb2wgdXNpbmcgbGludXggcmVzZXQgZnJhbWV3b3JrLg0KDQpTaWdu
ZWQtb2ZmLWJ5OiBOYW5jeS5MaW4gPG5hbmN5LmxpbkBtZWRpYXRlay5jb20+DQoNClRoaXMgc2Vy
aWVzIGFyZSBiYXNlZCBvbiB0aGUgZm9sbG93aW5nIHBhdGNoOg0KWzFdIGFybTY0OiBkdHM6IEFk
ZCBNZWRpYXRlayBTb0MgTVQ4MTk1IGFuZCBldmFsdWF0aW9uIGJvYXJkIGR0cyBhbmQgTWFrZWZp
bGUNCiAgICBodHRwczovL3BhdGNod29yay5rZXJuZWwub3JnL3Byb2plY3QvbGludXgtbWVkaWF0
ZWsvcGF0Y2gvMjAyMTA2MDEwNzUzNTAuMzE1MTUtMi1zZWl5YS53YW5nQG1lZGlhdGVrLmNvbS8N
ClsyXSBhcm02NDogZHRzOiBtdDgxOTU6IGFkZCBJT01NVSBhbmQgc21pIG5vZGVzDQogICAgaHR0
cHM6Ly9wYXRjaHdvcmsua2VybmVsLm9yZy9wcm9qZWN0L2xpbnV4LW1lZGlhdGVrL3BhdGNoLzIw
MjEwNjE1MTczMjMzLjI2NjgyLTE1LXRpbmdoYW4uc2hlbkBtZWRpYXRlay5jb20vDQpbM10gWzAx
LzI0XSBkdC1iaW5kaW5nczogbWVkaWF0ZWs6IG10ODE5NTogQWRkIGJpbmRpbmcgZm9yIE1NIElP
TU1VDQogICAgaHR0cHM6Ly9wYXRjaHdvcmsua2VybmVsLm9yZy9wcm9qZWN0L2xpbnV4LW1lZGlh
dGVrL3BhdGNoLzIwMjEwNjMwMDIzNTA0LjE4MTc3LTIteW9uZy53dUBtZWRpYXRlay5jb20vDQpb
NF0gQWRkIGdjZSBzdXBwb3J0IGZvciBtdDgxOTUNCiAgICBodHRwczovL3BhdGNod29yay5rZXJu
ZWwub3JnL3Byb2plY3QvbGludXgtbWVkaWF0ZWsvbGlzdC8/c2VyaWVzPTUzNzA2OQ0KWzVdIEFk
ZCBNZWRpYVRlayBTb0MgRFJNICh2ZG9zeXMwKSBzdXBwb3J0IGZvciBtdDgxOTUNCiAgICBodHRw
czovL3BhdGNod29yay5rZXJuZWwub3JnL3Byb2plY3QvbGludXgtbWVkaWF0ZWsvbGlzdC8/c2Vy
aWVzPTUzNzIyNQ0KWzZdIFt2OCwxLzJdIGR0LWJpbmRpbmdzOiByZXNldDogbXQ4MTk1OiBhZGQg
dG9wcmd1IHJlc2V0LWNvbnRyb2xsZXIgaGVhZGVyIGZpbGUNCiAgICBodHRwczovL3BhdGNod29y
ay5rZXJuZWwub3JnL3Byb2plY3QvbGludXgtbWVkaWF0ZWsvcGF0Y2gvMjAyMTA4MDYwMjM2MDYu
MTY4NjctMi1DaHJpc3RpbmUuWmh1QG1lZGlhdGVrLmNvbS8NCls3XSBbdjMsMi83XcKgZHQtYmlu
ZGluZ3M6IG1lZGlhdGVrOiBBZGQgI3Jlc2V0LWNlbGxzIHRvIG1tc3lzIHN5c3RlbSBjb250cm9s
bGVyDQogICAgaHR0cHM6Ly9wYXRjaHdvcmsua2VybmVsLm9yZy9wcm9qZWN0L2xpbnV4LW1lZGlh
dGVrL3BhdGNoLzIwMjEwODI1MTIyNjEzLnYzLjIuSTNmN2YxYzlhOGU0NmJlMDdkMTc1N2RkZjRl
MDA5NzUzNWYzYTdkNDFAY2hhbmdlaWQvDQpbOF0gW3YzLDYvN10gc29jOiBtZWRpYXRlazogbW1z
eXM6IEFkZCByZXNldCBjb250cm9sbGVyIHN1cHBvcnQNCiAgICBodHRwczovL3BhdGNod29yay5r
ZXJuZWwub3JnL3Byb2plY3QvbGludXgtbWVkaWF0ZWsvcGF0Y2gvMjAyMTA4MjUxMjI2MTMudjMu
Ni5JMTVlMjQxOTE0MWE2OWIyZTVjN2U3MDBjMzRkOTJhNjlkZjQ3ZTA0ZEBjaGFuZ2VpZC8NCg0K
TmFuY3kuTGluICgxNik6DQogIGR0LWJpbmRpbmdzOiBtZWRpYXRlazogYWRkIHZkb3N5czEgUkRN
QSBkZWZpbml0aW9uIGZvciBtdDgxOTUNCiAgZHQtYmluZGluZ3M6IG1lZGlhdGVrOiBhZGQgdmRv
c3lzMSBNRVJHRSBwcm9wZXJ0eSBmb3IgbXQ4MTk1DQogIGR0LWJpbmRpbmdzOiBtZWRpYXRlazog
YWRkIGV0aGRyIGRlZmluaXRpb24gZm9yIG10ODE5NQ0KICBkdC1iaW5kaW5nczogcmVzZXQ6IG10
ODE5NTogYWRkIHZkb3N5czEgcmVzZXQgY29udHJvbCBiaXQNCiAgYXJtNjQ6IGR0czogbXQ4MTk1
OiBhZGQgZGlzcGxheSBub2RlIGZvciB2ZG9zeXMxDQogIHNvYzogbWVkaWF0ZWs6IGFkZCBtdGst
bW1zeXMgc3VwcG9ydCBmb3IgbXQ4MTk1IHZkb3N5czENCiAgc29jOiBtZWRpYXRlazogYWRkIG10
ay1tbXN5cyBjb25maWcgQVBJIGZvciBtdDgxOTUgdmRvc3lzMQ0KICBzb2M6IG1lZGlhdGVrOiBh
ZGQgY21kcSBzdXBwb3J0IG9mIG10ay1tbXN5cyBjb25maWcgQVBJIGZvciBtdDgxOTUNCiAgICB2
ZG9zeXMxDQogIHNvYzogbWVkaWF0ZWs6IG1tc3lzOiBtb2RpZnkgcmVzZXQgY29udHJvbGxlciBm
b3IgTVQ4MTk1IHZkb3N5czENCiAgc29jOiBtZWRpYXRlazogYWRkIG10ay1tdXRleCBzdXBwb3J0
IGZvciBtdDgxOTUgdmRvc3lzMQ0KICBkcm0vbWVkaWF0ZWs6IGFkZCBkaXNwbGF5IE1EUCBSRE1B
IHN1cHBvcnQgZm9yIE1UODE5NQ0KICBkcm0vbWVkaWF0ZWs6IGFkZCBkaXNwbGF5IG1lcmdlIGFw
aSBzdXBwb3J0IGZvciBNVDgxOTUNCiAgZHJtL21lZGlhdGVrOiBhZGQgRVRIRFIgc3VwcG9ydCBm
b3IgTVQ4MTk1DQogIGRybS9tZWRpYXRlazogYWRkIG92bF9hZGFwdG9yIHN1cHBvcnQgZm9yIE1U
ODE5NQ0KICBkcm0vbWVkaWF0ZWs6IG1vZGlmeSBtZWRpYXRlay1kcm0gZm9yIG10ODE5NSBtdWx0
aSBtbXN5cyBzdXBwb3J0DQogIGRybS9tZWRpYXRlazogYWRkIG1lZGlhdGVrLWRybSBvZiB2ZG9z
eXMxIHN1cHBvcnQgZm9yIE1UODE5NQ0KDQogLi4uL2Rpc3BsYXkvbWVkaWF0ZWsvbWVkaWF0ZWss
ZXRoZHIueWFtbCAgICAgIHwgMTQ0ICsrKysrKw0KIC4uLi9kaXNwbGF5L21lZGlhdGVrL21lZGlh
dGVrLG1kcC1yZG1hLnlhbWwgICB8ICA3NyArKysrDQogLi4uL2Rpc3BsYXkvbWVkaWF0ZWsvbWVk
aWF0ZWssbWVyZ2UueWFtbCAgICAgIHwgICAzICsNCiBhcmNoL2FybTY0L2Jvb3QvZHRzL21lZGlh
dGVrL210ODE5NS5kdHNpICAgICAgfCAyMjEgKysrKysrKysrDQogZHJpdmVycy9ncHUvZHJtL21l
ZGlhdGVrL01ha2VmaWxlICAgICAgICAgICAgIHwgICA1ICstDQogZHJpdmVycy9ncHUvZHJtL21l
ZGlhdGVrL210a19kaXNwX2Rydi5oICAgICAgIHwgIDI5ICsrDQogZHJpdmVycy9ncHUvZHJtL21l
ZGlhdGVrL210a19kaXNwX21lcmdlLmMgICAgIHwgIDc4ICsrKy0NCiAuLi4vZ3B1L2RybS9tZWRp
YXRlay9tdGtfZGlzcF9vdmxfYWRhcHRvci5jICAgfCA0MDggKysrKysrKysrKysrKysrKysNCiBk
cml2ZXJzL2dwdS9kcm0vbWVkaWF0ZWsvbXRrX2RybV9jcnRjLmMgICAgICAgfCAgMjUgKy0NCiBk
cml2ZXJzL2dwdS9kcm0vbWVkaWF0ZWsvbXRrX2RybV9jcnRjLmggICAgICAgfCAgIDMgKy0NCiBk
cml2ZXJzL2dwdS9kcm0vbWVkaWF0ZWsvbXRrX2RybV9kZHBfY29tcC5jICAgfCAgMTUgKw0KIGRy
aXZlcnMvZ3B1L2RybS9tZWRpYXRlay9tdGtfZHJtX2RkcF9jb21wLmggICB8ICAgMSArDQogZHJp
dmVycy9ncHUvZHJtL21lZGlhdGVrL210a19kcm1fZHJ2LmMgICAgICAgIHwgMzc3ICsrKysrKysr
KysrKystLS0NCiBkcml2ZXJzL2dwdS9kcm0vbWVkaWF0ZWsvbXRrX2RybV9kcnYuaCAgICAgICAg
fCAgIDkgKy0NCiBkcml2ZXJzL2dwdS9kcm0vbWVkaWF0ZWsvbXRrX2V0aGRyLmMgICAgICAgICAg
fCA0MjQgKysrKysrKysrKysrKysrKysrDQogZHJpdmVycy9ncHUvZHJtL21lZGlhdGVrL210a19l
dGhkci5oICAgICAgICAgIHwgIDI1ICsrDQogZHJpdmVycy9ncHUvZHJtL21lZGlhdGVrL210a19t
ZHBfcmRtYS5jICAgICAgIHwgMzAxICsrKysrKysrKysrKysNCiBkcml2ZXJzL2dwdS9kcm0vbWVk
aWF0ZWsvbXRrX21kcF9yZG1hLmggICAgICAgfCAgMzcgKysNCiBkcml2ZXJzL3NvYy9tZWRpYXRl
ay9tdDgxOTUtbW1zeXMuaCAgICAgICAgICAgfCAxOTkgKysrKysrKysNCiBkcml2ZXJzL3NvYy9t
ZWRpYXRlay9tdGstbW1zeXMuYyAgICAgICAgICAgICAgfCAgNzYgKysrLQ0KIGRyaXZlcnMvc29j
L21lZGlhdGVrL210ay1tbXN5cy5oICAgICAgICAgICAgICB8ICAxMSArDQogZHJpdmVycy9zb2Mv
bWVkaWF0ZWsvbXRrLW11dGV4LmMgICAgICAgICAgICAgIHwgMjcwICsrKysrKy0tLS0tDQogaW5j
bHVkZS9kdC1iaW5kaW5ncy9yZXNldC9tdDgxOTUtcmVzZXRzLmggICAgIHwgIDEyICsNCiBpbmNs
dWRlL2xpbnV4L3NvYy9tZWRpYXRlay9tdGstbW1zeXMuaCAgICAgICAgfCAgMjIgKw0KIDI0IGZp
bGVzIGNoYW5nZWQsIDI1NzQgaW5zZXJ0aW9ucygrKSwgMTk4IGRlbGV0aW9ucygtKQ0KIGNyZWF0
ZSBtb2RlIDEwMDY0NCBEb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3MvZGlzcGxheS9t
ZWRpYXRlay9tZWRpYXRlayxldGhkci55YW1sDQogY3JlYXRlIG1vZGUgMTAwNjQ0IERvY3VtZW50
YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9kaXNwbGF5L21lZGlhdGVrL21lZGlhdGVrLG1kcC1y
ZG1hLnlhbWwNCiBjcmVhdGUgbW9kZSAxMDA2NDQgZHJpdmVycy9ncHUvZHJtL21lZGlhdGVrL210
a19kaXNwX292bF9hZGFwdG9yLmMNCiBjcmVhdGUgbW9kZSAxMDA2NDQgZHJpdmVycy9ncHUvZHJt
L21lZGlhdGVrL210a19ldGhkci5jDQogY3JlYXRlIG1vZGUgMTAwNjQ0IGRyaXZlcnMvZ3B1L2Ry
bS9tZWRpYXRlay9tdGtfZXRoZHIuaA0KIGNyZWF0ZSBtb2RlIDEwMDY0NCBkcml2ZXJzL2dwdS9k
cm0vbWVkaWF0ZWsvbXRrX21kcF9yZG1hLmMNCiBjcmVhdGUgbW9kZSAxMDA2NDQgZHJpdmVycy9n
cHUvZHJtL21lZGlhdGVrL210a19tZHBfcmRtYS5oDQoNCi0tIA0KMi4xOC4wDQpfX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpMaW51eC1tZWRpYXRlayBtYWls
aW5nIGxpc3QKTGludXgtbWVkaWF0ZWtAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMu
aW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LW1lZGlhdGVrCg==
