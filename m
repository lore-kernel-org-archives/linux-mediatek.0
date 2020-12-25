Return-Path: <SRS0=56RK=F5=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,
	URIBL_BLOCKED,USER_AGENT_SANE_2 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 57686C433DB
	for <linux-mediatek@archiver.kernel.org>; Fri, 25 Dec 2020 05:23:38 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id CD6F222AAA
	for <linux-mediatek@archiver.kernel.org>; Fri, 25 Dec 2020 05:23:37 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org CD6F222AAA
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Date:To:From:
	Subject:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=N0DcyTEhR7Seox2LRRlsZiPoVztoiFK7D1mRW+/CCpY=; b=Zc78HWLS3T+nNRUUOMA+5/kbM
	lM0fPNiLL/SyNZL9x6rGIOeXYvBhjVFLLukOz5zz4asa2NF0Zkywq29wFoPBSAUhw00nkwXrUbJNT
	NI8DcrfxsRak9nqcmtn6j6bDXDMnWtuhgU2bIRx2CmSxx4L1J78/GeOArhpRzZxDftvCEQfYC0wHo
	ZWDUsGUAhGPg6E6pLvtILDeu0Bi678ougYnzteJkZgZeWNn8fzMcTEZHTP1ZtTx2jvCmmdFZo5zyK
	Hht+XjS30AK132H1MDNcnHTHu2i3oMhPhDddj5rRKpn58JyhR+OPc8tuOh1aVU1avS6/G0HM6cQGj
	4lUC0pUqA==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1ksfZS-0004CN-KB; Fri, 25 Dec 2020 05:23:22 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1ksfZO-0004BA-CD; Fri, 25 Dec 2020 05:23:19 +0000
X-UUID: 91f59820c3354e17b18e3b61f863f85b-20201224
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:MIME-Version:Content-Type:References:In-Reply-To:Date:CC:To:From:Subject:Message-ID;
 bh=KgeZmFxf9ZEZvqNx6WjQdn790TCyZKDbfVixiX7OE0Q=; 
 b=r48Sr84TREdx1GVg9DtFCzW2dS5AIEd6OsYrjToU+ncMYWegwIdPCshccYvsGSW4EtCVjKNYicB3w4V1wojpQ0jRfADWMCkNBybYCkP+3mT9citywl+p2ljYXz2puaXdYJKwAD4jQP8ArI9DbzrPWJipSauNlf63EAIvPtPQtR8=;
X-UUID: 91f59820c3354e17b18e3b61f863f85b-20201224
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw02.mediatek.com
 (envelope-from <henryc.chen@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 901886118; Thu, 24 Dec 2020 21:23:10 -0800
Received: from MTKMBS02N2.mediatek.inc (172.21.101.101) by
 MTKMBS62N1.mediatek.inc (172.29.193.41) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Thu, 24 Dec 2020 21:14:06 -0800
Received: from mtkcas11.mediatek.inc (172.21.101.40) by
 mtkmbs02n2.mediatek.inc (172.21.101.101) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Fri, 25 Dec 2020 13:14:04 +0800
Received: from [172.21.77.4] (172.21.77.4) by mtkcas11.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Fri, 25 Dec 2020 13:14:04 +0800
Message-ID: <1608873245.24775.2.camel@mtksdaap41>
Subject: Re: [PATCH V6 03/13] soc: mediatek: add driver for dvfsrc support
From: Henry Chen <henryc.chen@mediatek.com>
To: Chun-Kuang Hu <chunkuang.hu@kernel.org>
Date: Fri, 25 Dec 2020 13:14:05 +0800
In-Reply-To: <CAAOTY__whne=DuaSv4rOv8f1qTebjqDOVjD5YGYw6eBkkWKmUw@mail.gmail.com>
References: <1608790134-27425-1-git-send-email-henryc.chen@mediatek.com>
 <1608790134-27425-4-git-send-email-henryc.chen@mediatek.com>
 <CAAOTY__whne=DuaSv4rOv8f1qTebjqDOVjD5YGYw6eBkkWKmUw@mail.gmail.com>
X-Mailer: Evolution 3.10.4-0ubuntu2 
MIME-Version: 1.0
X-TM-SNTS-SMTP: F345F721F12B5EE58BF45EC2F3987B08119EA1B5D0B332A9788DD00BA98585C62000:8
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201225_002318_667500_8D2DD29B 
X-CRM114-Status: GOOD (  14.24  )
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
Cc: Mark Rutland <mark.rutland@arm.com>, Nicolas Boichat <drinkcat@google.com>,
 DTML <devicetree@vger.kernel.org>, James Liao <jamesjj.liao@mediatek.com>,
 linux-pm@vger.kernel.org, linux-kernel <linux-kernel@vger.kernel.org>,
 Rob Herring <robh+dt@kernel.org>, Stephen Boyd <swboyd@chromium.org>, Fan
 Chen <fan.chen@mediatek.com>, Mark Brown <broonie@kernel.org>,
 Ryan Case <ryandcase@chromium.org>, Arvin Wang <arvin.wang@mediatek.com>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 "moderated list:ARM/Mediatek SoC support" <linux-mediatek@lists.infradead.org>,
 Georgi Djakov <georgi.djakov@linaro.org>,
 Linux ARM <linux-arm-kernel@lists.infradead.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

T24gVGh1LCAyMDIwLTEyLTI0IGF0IDIyOjMzICswODAwLCBDaHVuLUt1YW5nIEh1IHdyb3RlOg0K
SGkgQ0ssDQo+IEhpLCBIZW5yeToNCj4gDQo+IEhlbnJ5IENoZW4gPGhlbnJ5Yy5jaGVuQG1lZGlh
dGVrLmNvbT4g5pa8IDIwMjDlubQxMuaciDI05pelIOmAseWbmyDkuIvljYgyOjA55a+r6YGT77ya
DQo+ID4NCj4gPiBBZGQgZHZmc3JjIGRyaXZlciBmb3IgTVQ2ODczL01UODE4My9NVDgxOTINCj4g
DQo+IFNlcGFyYXRlIHRoaXMgcGF0Y2ggZm9yIGVhY2ggU29DLg0KT0ssIHRoYW5rcy4NCkhlbnJ5
DQo+IA0KPiBSZWdhcmRzLA0KPiBDaHVuLUt1YW5nLg0KPiANCj4gPg0KPiA+IFNpZ25lZC1vZmYt
Ynk6IEhlbnJ5IENoZW4gPGhlbnJ5Yy5jaGVuQG1lZGlhdGVrLmNvbT4NCj4gPiAtLS0NCj4gPiAg
ZHJpdmVycy9zb2MvbWVkaWF0ZWsvS2NvbmZpZyAgICAgICAgICAgIHwgIDEyICsNCj4gPiAgZHJp
dmVycy9zb2MvbWVkaWF0ZWsvTWFrZWZpbGUgICAgICAgICAgIHwgICAxICsNCj4gPiAgZHJpdmVy
cy9zb2MvbWVkaWF0ZWsvbXRrLWR2ZnNyYy5jICAgICAgIHwgNTM4ICsrKysrKysrKysrKysrKysr
KysrKysrKysrKysrKysrDQo+ID4gIGluY2x1ZGUvbGludXgvc29jL21lZGlhdGVrL210a19kdmZz
cmMuaCB8ICAzNSArKysNCj4gPiAgNCBmaWxlcyBjaGFuZ2VkLCA1ODYgaW5zZXJ0aW9ucygrKQ0K
PiA+ICBjcmVhdGUgbW9kZSAxMDA2NDQgZHJpdmVycy9zb2MvbWVkaWF0ZWsvbXRrLWR2ZnNyYy5j
DQo+ID4gIGNyZWF0ZSBtb2RlIDEwMDY0NCBpbmNsdWRlL2xpbnV4L3NvYy9tZWRpYXRlay9tdGtf
ZHZmc3JjLmgNCj4gPg0KDQpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fXwpMaW51eC1tZWRpYXRlayBtYWlsaW5nIGxpc3QKTGludXgtbWVkaWF0ZWtAbGlzdHMu
aW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZv
L2xpbnV4LW1lZGlhdGVrCg==
