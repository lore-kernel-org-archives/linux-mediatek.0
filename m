Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 38C9A606A31C
	for <linux-mediatek@archiver.kernel.org>; Wed, 18 Nov 2026 03:12:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=AoYfAY7k;
	dkim=fail reason="signature verification failed" (2048-bit key, unprotected) header.d=infradead.org header.i=@infradead.org header.a=rsa-sha256 header.s=desiato.20200630 header.b=kplm6YYE;
	dkim=pass (2048-bit key) header.d=ite.com.tw header.i=@ite.com.tw header.a=rsa-sha256 header.s=dkim header.b=PC3l/eCL
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:In-Reply-To:References:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=wfv7QEGo+wzGR5SC4MmODpuDqg+DpTMk5gcJUBNyPqo=; b=AoYfAY7k6q/lPji9XXcmm4VfmV
	GIxl3dndJaGmC28sbKF4/aSzDEcH5skgzC0XC+fVmc96Ni2d9MrKZ6aeykECeC/tCn08TefkSvMdn
	l0sgt6PScFhiIOD9fyNpOOVwu7ZpR3CnE6RJZWrs7fK+H5n3gDsnUdP6dNNskCLLK2+BY6nSUJGft
	dIrHVoXggbvPokS87YeTiCk3WNzFf7p2pwOJYs3BMv6yCxCqcSMspR31u/Ugjn9ojObo0petkQhW5
	bFeXMG9zuXu5zuXRRx2RliH16aKN80dxvmtpUSxnUmzhn8HHAMqAYSRGix6Ixf1gFG1cj9eah/bjQ
	XbWZHwLQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xTW6F-00000007bHy-2t5I;
	Wed, 18 Nov 2026 03:12:43 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xTW6E-00000007bHp-1DiI;
	Wed, 18 Nov 2026 03:12:42 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=MIME-Version:Content-Transfer-Encoding
	:Content-Type:In-Reply-To:References:Message-ID:Date:Subject:CC:To:From:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=wfv7QEGo+wzGR5SC4MmODpuDqg+DpTMk5gcJUBNyPqo=; b=kplm6YYEq+DB7rHU0xtRtnL4E7
	2u0bNpUQny1wUNBsjvPkXt8V7OxppytaKGO6OrSaQvf2cK/O5MFoqfAgWOgGEm1FyVndEC7i4x5UC
	CYd+MPKGV3O2nZutvufO+nXu497twVOR3P4fUyyrX8gMPa9Nxejn9RzwyFXPFUTdzbGkSX/2RCWzZ
	PrNte0XjUSAUxFgbRbJ5jn26jYF7KoRPLBAGm4IedQylRQJiZziITnvnE0wkKUB/8YZMZdE9pLgyC
	tm4LtZnJrMswTAttnezx5HjrecYBzVIS17bpMQFMrftF47CwaocpFSv6P5uiV7g+cLa1BayHzoGBY
	DG0qBRIw==;
Received: from [219.87.157.213] (helo=ironport.ite.com.tw)
	by desiato.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xTW66-0000000Fbkb-3Bp3;
	Wed, 18 Nov 2026 03:12:37 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=ite.com.tw; s=dkim;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=wfv7QEGo+wzGR5SC4MmODpuDqg+DpTMk5gcJUBNyPqo=;
  b=PC3l/eCLjEoNe4QWPF55sBqPyZ+ExyVqbsLbzysPEO2kPIvGpxpKcYwW
   WpnL/0h3RonkzmjhFrDMobM5/7bTqW1pZFQrGTMoyhY5eFrVrFJLW6Pbp
   8Qnc/+VpC7sZiJ5LqI0+IGcgdOG44D+VIaBl4QP0fsSbq+tdvcvB73hvV
   dksokiIJtJDjiI8FusYzWUBQY1lfPWJ2vbfD6ZZV0of6JjjpAh16oFh+2
   SJ9hQfbQKNbwJsSVvfrExP4ltih7qI6PainT6vftNIH28s82oDY7rJ6dZ
   aDV6ML2iX/kSnFoCm+5uRNkq73UOSfacl8uU0/cFH5TN/sKXIsiZD8XwW
   w==;
X-CSE-ConnectionGUID: 68dO5pZITKeqhx4uCEAlkQ==
X-CSE-MsgGUID: roNQFr7WQne9tU1LTsgGbA==
Received: from unknown (HELO mse.ite.com.tw) ([192.168.35.30])
  by ironport.ite.com.tw with ESMTP; 18 Nov 2026 11:12:18 +0800
Received: from tpemail1.internal.ite.com.tw (TPEMAIL1.internal.ite.com.tw [192.168.15.58])
	by mse.ite.com.tw with ESMTP id 6AI3CF3l027672;
	Wed, 18 Nov 2026 11:12:15 +0800 (+08)
	(envelope-from Hermes.Wu@ite.com.tw)
Received: from TPEMAIL1.internal.ite.com.tw (192.168.15.58) by
 TPEMAIL1.internal.ite.com.tw (192.168.15.58) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46; Wed, 18 Nov 2026 11:12:14 +0800
Received: from TPEMAIL1.internal.ite.com.tw ([fe80::63c1:9095:c5a6:3291]) by
 TPEMAIL1.internal.ite.com.tw ([fe80::63c1:9095:c5a6:3291%3]) with mapi id
 15.02.2562.046; Wed, 18 Nov 2026 11:12:14 +0800
From: <Hermes.Wu@ite.com.tw>
To: <daniel@makrotopia.org>, <luca.ceresoli@bootlin.com>
CC: <andrzej.hajda@intel.com>, <neil.armstrong@linaro.org>, <rfoss@kernel.org>,
        <Laurent.pinchart@ideasonboard.com>, <jonas@kwiboo.se>,
        <jernej.skrabec@gmail.com>, <maarten.lankhorst@linux.intel.com>,
        <mripard@kernel.org>, <tzimmermann@suse.de>, <airlied@gmail.com>,
        <simona@ffwll.ch>, <matthias.bgg@gmail.com>,
        <angelogioacchino.delregno@collabora.com>, <allen.chen@ite.com.tw>,
        <treapking@chromium.org>, <wenst@chromium.org>,
        <dri-devel@lists.freedesktop.org>, <linux-kernel@vger.kernel.org>,
        <linux-arm-kernel@lists.infradead.org>,
        <linux-mediatek@lists.infradead.org>
Subject: RE: [PATCH v8 08/14] drm/bridge: it6505: avoid division by zero in
 audio FS debug print
Thread-Topic: [PATCH v8 08/14] drm/bridge: it6505: avoid division by zero in
 audio FS debug print
Thread-Index: AQHddahmDGCOZ1R9702oMT4TMp7f/bczKViw
Date: Wed, 18 Nov 2026 03:12:14 +0000
Message-ID: <9485b4a86b124cc3a528ca147609bf4c@ite.com.tw>
References: <cover.1790552614.git.daniel@makrotopia.org>
 <26ee2c94c42fb09c081201071cb5730c96c8c25b.1790552614.git.daniel@makrotopia.org>
 <179251509978.78870.2485132679226608837.b4-review@b4>
 <179481904178.211952.8076269834336042526@makrotopia.org>
In-Reply-To: <179481904178.211952.8076269834336042526@makrotopia.org>
Accept-Language: zh-TW, en-US
Content-Language: zh-TW
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-tm-snts-smtp: E32998829987CCBDFA23848B7A003E0AABE1484F47372397C254447335C1D6192002:8
Content-Type: text/plain; charset="big5"
Content-Transfer-Encoding: base64
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-MAIL: mse.ite.com.tw 6AI3CF3l027672
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261118_031235_350625_5ECAB0D9 
X-CRM114-Status: GOOD (  16.65  )
X-Spam-Score: 1.1 (+)
X-BeenThere: linux-mediatek@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-mediatek.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-mediatek/>
List-Post: <mailto:linux-mediatek@lists.infradead.org>
List-Help: <mailto:linux-mediatek-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mediatek>,
 <mailto:linux-mediatek-request@lists.infradead.org?subject=subscribe>
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
X-Spam-Status: No, score=-5.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS autolearn=no autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

SGkgRGFuaWVsLCBMdWNhLA0KDQpPbiBNb24sIE5vdiAxNiwgMjAyNiBhdCAwODo1NjoxOEFNICsw
MDAwLCBEYW5pZWwgR29sbGUgd3JvdGU6DQo+IE9uIFR1ZSwgT2N0IDIwLCAyMDI2IGF0IDA2OjUx
OjM5UE0gKzAyMDAsIEx1Y2EgQ2VyZXNvbGkgd3JvdGU6DQo+ID4gSWYgeW91IGNvdWxkIHNoYXJl
IHdoYXQgdGhhdCByZWdpc3RlciBpcyBmb3IsIGl0IHdvdWxkIHByb2JhYmx5IGFuc3dlciBzb21l
DQo+ID4gb2YgdGhvc2UgcXVlc3Rpb25zLg0KPg0KPiBJIGRvbid0IGhhdmUgZG9jdW1lbnRhdGlv
biBmb3IgaXQgZWl0aGVyLCBhbmQgd2l0aCBJVEUgZ29uZSB0aGVyZSBpcw0KPiBub2JvZHkgbGVm
dCB0byBhc2suDQoNClJFR19BVURJT19JTlBVVF9GUkVRICgweEJFKSBpcyBhIHJlYWQtb25seSBp
bnB1dCBhdWRpbyBmcmVxdWVuY3kNCmNvdW50ZXIuIFRoZSBkcml2ZXIgdXNlcyBpdCB0byBjaGVj
ayB3aGV0aGVyIHRoZSBJMlMgQkNMSyBpcw0KcHJlc2VudCBhbmQgY2hhbmdpbmcsIGkuZS4gd2hl
dGhlciB0aGVyZSBpcyBhdWRpbyBpbnB1dC4NCg0KPiBBcyBmb3IgdGhlIGxvZ2dpbmcsIEkgZG9u
J3QgdGhpbmsgaXQgaXMgd29ydGggYW4gZXh0cmEgaTJjIHJlYWQgYW5kIGENCj4gZGl2aXNpb24g
aW4gdGhlIGVuYWJsZSBwYXRoLCBzbyBpbiB2OSBJJ2xsIGRyb3AgdGhlIHJlYWQgYW5kIHRoZQ0K
PiBwcmludCBmcm9tIGl0NjUwNV9lbmFibGVfYXVkaW8oKSBpbnN0ZWFkIG9mIGd1YXJkaW5nIHRo
ZSBkaXZpc2lvbi4NCg0KRmluZSB3aXRoIHVzLCB0aGUgdmFsdWUgaXMgb25seSBpbmZvcm1hdGlv
bmFsIHRoZXJlLg0KDQpCZXN0IHJlZ2FyZHMsDQpIZXJtZXMNCg==

