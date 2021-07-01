Return-Path: <SRS0=jcdg=LZ=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,
	UNWANTED_LANGUAGE_BODY,USER_AGENT_SANE_2 autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 263FEC11F69
	for <linux-mediatek@archiver.kernel.org>; Thu,  1 Jul 2021 02:14:05 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id EF01961418
	for <linux-mediatek@archiver.kernel.org>; Thu,  1 Jul 2021 02:14:04 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org EF01961418
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Date:CC:To:From:Subject:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=UfLvyHLEzGNXoZuYF/8qhsm/xwnmDV0iNY8Qmz7PkTo=; b=1LQz2n0VBo/3xc
	KLB+8dz17XnKlEUXXW+H2wzSFFJagLbdONcKQnpfsd+qeOtA/XietGqkLwHZDyy+3CyJEbWyfQNcR
	tvjue3RK09ehzuqsuhZctgyhaXaArPojBxtG3+T5+Gy1C4LjdA9NM89CPksDLXqAAuLguO49A8DON
	3jhwECSoiJgzLADkeSINZuN9DAJMMEvGhF+4wOMnUeojYXnyQbvTRm1hIE7ROyOArnn7qqUdUQ/cB
	Ti0gg5d2/EZWJlhg7janYV9K/GdRtMd3jlwU1Ne979Pa+UPwyvNYX273lIssZUUBJ817yKUhFcWkM
	hB99mBq3PBgHaWO9jYrQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1lymDB-00FsFP-Tj; Thu, 01 Jul 2021 02:13:53 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1lymD7-00FsEp-O9; Thu, 01 Jul 2021 02:13:52 +0000
X-UUID: 4ce7a494cc944e17bce32198972105b9-20210630
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:MIME-Version:Content-Type:References:In-Reply-To:Date:CC:To:From:Subject:Message-ID;
 bh=AcP3gEPnP4tM/McdpWeWTQWUaen+Pk00C+pKqpN58ew=; 
 b=WPjcmcCy3Z+FlUS3crGm4RaOeqb0/DKyr4SUzxhFSVY7EkVAhXcOEs1+r4KHxmpOmY+/UzHHIVH1oCPLdULSFHiE+WRkbg8VseJmHVqJZjwA9FOjO9BVDrslb0Pho5NzAVAqrFI/RcripT7IEVC4aF4ZMhMtgm0Gvwf7LyH2e1g=;
X-UUID: 4ce7a494cc944e17bce32198972105b9-20210630
Received: from mtkcas67.mediatek.inc [(172.29.193.45)] by mailgw02.mediatek.com
 (envelope-from <chun-jie.chen@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 1865682984; Wed, 30 Jun 2021 19:13:43 -0700
Received: from MTKMBS07N2.mediatek.inc (172.21.101.141) by
 MTKMBS62DR.mediatek.inc (172.29.94.18) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Wed, 30 Jun 2021 19:13:40 -0700
Received: from mtkcas11.mediatek.inc (172.21.101.40) by
 mtkmbs07n2.mediatek.inc (172.21.101.141) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Thu, 1 Jul 2021 10:13:39 +0800
Received: from mtksdccf07 (172.21.84.99) by mtkcas11.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Thu, 1 Jul 2021 10:13:39 +0800
Message-ID: <da0db357ac7e41ca6ec2007eccccbb465049cd01.camel@mediatek.com>
Subject: Re: [v11 01/19] dt-bindings: ARM: Mediatek: Add new document
 bindings of MT8192 clock
From: Chun-Jie Chen <chun-jie.chen@mediatek.com>
To: Chun-Kuang Hu <chunkuang.hu@kernel.org>
CC: Matthias Brugger <matthias.bgg@gmail.com>, Stephen Boyd
 <sboyd@kernel.org>, Nicolas Boichat <drinkcat@chromium.org>, Rob Herring
 <robh+dt@kernel.org>, Linux ARM <linux-arm-kernel@lists.infradead.org>,
 linux-kernel <linux-kernel@vger.kernel.org>, "moderated list:ARM/Mediatek SoC
 support" <linux-mediatek@lists.infradead.org>, <linux-clk@vger.kernel.org>,
 DTML <devicetree@vger.kernel.org>, srv_heupstream
 <srv_heupstream@mediatek.com>,
 <Project_Global_Chrome_Upstream_Group@mediatek.com>
Date: Thu, 1 Jul 2021 10:13:39 +0800
In-Reply-To: <CAAOTY_8SgZ5SN9Q0nfL_jQVTbB7ZDqgoGFRkKe8+QJwUi55Hew@mail.gmail.com>
References: <20210630132804.20436-1-chun-jie.chen@mediatek.com>
 <20210630132804.20436-2-chun-jie.chen@mediatek.com>
 <CAAOTY_8SgZ5SN9Q0nfL_jQVTbB7ZDqgoGFRkKe8+QJwUi55Hew@mail.gmail.com>
X-Mailer: Evolution 3.28.5-0ubuntu0.18.04.2 
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210630_191349_830723_C0A0415C 
X-CRM114-Status: GOOD (  12.88  )
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

T24gV2VkLCAyMDIxLTA2LTMwIGF0IDIyOjMwICswODAwLCBDaHVuLUt1YW5nIEh1IHdyb3RlOg0K
PiBIaSwgQ2h1bi1KaWU6DQo+IA0KPiBDaHVuLUppZSBDaGVuIDxjaHVuLWppZS5jaGVuQG1lZGlh
dGVrLmNvbT4g5pa8IDIwMjHlubQ25pyIMzDml6Ug6YCx5LiJIOS4i+WNiDk6MzDlr6vpgZPvvJoN
Cj4gPiANCj4gPiBUaGlzIHBhdGNoIGFkZHMgdGhlIG5ldyBiaW5kaW5nIGRvY3VtZW50YXRpb24g
Zm9yIHN5c3RlbSBjbG9jaw0KPiA+IGFuZCBmdW5jdGlvbmFsIGNsb2NrIG9uIE1lZGlhdGVrIE1U
ODE5Mi4NCj4gPiANCj4gPiBTaWduZWQtb2ZmLWJ5OiBDaHVuLUppZSBDaGVuIDxjaHVuLWppZS5j
aGVuQG1lZGlhdGVrLmNvbT4NCj4gPiBSZXZpZXdlZC1ieTogUm9iIEhlcnJpbmcgPHJvYmhAa2Vy
bmVsLm9yZz4NCj4gPiAtLS0NCj4gDQo+IFtzbmlwXQ0KPiANCj4gPiArDQo+ID4gKyAgLSB8DQo+
ID4gKyAgICBtbXN5czogY2xvY2stY29udHJvbGxlckAxNDAwMDAwMCB7DQo+IA0KPiBtbXN5cyBp
cyBhIHN5c3RlbSBjb250cm9sbGVyIHJhdGhlciB0aGFuIGNsb2NrIGNvbnRyb2xsZXIsIGlzbid0
IGl0Pw0KPiANCj4gUmVnYXJkcywNCj4gQ2h1bi1LdWFuZy4NCj4gDQo+ID4gKyAgICAgICAgY29t
cGF0aWJsZSA9ICJtZWRpYXRlayxtdDgxOTItbW1zeXMiOw0KPiA+ICsgICAgICAgIHJlZyA9IDww
eDE0MDAwMDAwIDB4MTAwMD47DQo+ID4gKyAgICAgICAgI2Nsb2NrLWNlbGxzID0gPDE+Ow0KPiA+
ICsgICAgfTsNCj4gPiArDQoNClRoYW5rcyBmb3IgeW91IHJlbWluZGVyLCBJIHdpbGwgbW92ZSBt
bXN5cyB0byBzeXN0ZW0gY2xvY2sgY29udHJvbGxlci4NCg0KQmVzdCBSZWdhcmRzLA0KQ2h1bi1K
aWUNCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCkxpbnV4
LW1lZGlhdGVrIG1haWxpbmcgbGlzdApMaW51eC1tZWRpYXRla0BsaXN0cy5pbmZyYWRlYWQub3Jn
Cmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtbWVkaWF0
ZWsK
