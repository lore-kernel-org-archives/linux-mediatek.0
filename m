Return-Path: <SRS0=e3uk=FV=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BB268C4361B
	for <linux-mediatek@archiver.kernel.org>; Thu, 17 Dec 2020 10:18:03 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 220D623899
	for <linux-mediatek@archiver.kernel.org>; Thu, 17 Dec 2020 10:18:03 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 220D623899
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=ite.com.tw
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:References:Message-ID:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=iZPdHxgj0pd6tYOfjJ4qKlo5StoET8uepNbrk0znoIo=; b=E5+DotMKEymp844VIgkejeRWP
	XsejMsPnPusbVAPnaBoZ2N19gGe09nZTUQJt0i63FV/IVHyCg/EwspNeS4/hTjLgq/fD6VKcUqH5H
	ykDtcTh/n1W+emMX3kQ07p/jIXfGTLvpfPifavsugNC12ySNRVeozTYRbpEsjh0+vpxvsMUjF+uNf
	DPhNG9bhJf4LV/aE1wAoSqSbxqt37lQatMUs/8pTnpun2ScpSM4rhlzSrVKaPgKOh3ube1JQITSDz
	9owtDH0HXCqMmAbaMXSDWvqidKr04shE+J666lfVBLg6bIcOijeqSLwvjenc5Iz0QSFP/jDFE6HBj
	ZdYEix3hQ==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kpqM4-00013z-AL; Thu, 17 Dec 2020 10:17:52 +0000
Received: from 60-251-196-230.hinet-ip.hinet.net ([60.251.196.230]
 helo=ironport.ite.com.tw)
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kpqLz-00010W-8Y; Thu, 17 Dec 2020 10:17:49 +0000
IronPort-SDR: QG24yfAsjfeNtckUD1JP48yVAI/mWh3Ou+653xk2bw473IjP931h9WtQgM9h48tZqIpxXz+aHV
 rJz7vH1MqUwQ==
Received: from unknown (HELO mse.ite.com.tw) ([192.168.35.30])
 by ironport.ite.com.tw with ESMTP; 17 Dec 2020 18:17:39 +0800
Received: from CSBMAIL1.internal.ite.com.tw (csbmail1.internal.ite.com.tw
 [192.168.65.58]) by mse.ite.com.tw with ESMTP id 0BHAHXwi011831;
 Thu, 17 Dec 2020 18:17:33 +0800 (GMT-8)
 (envelope-from allen.chen@ite.com.tw)
Received: from CSBMAIL1.internal.ite.com.tw (192.168.65.58) by
 CSBMAIL1.internal.ite.com.tw (192.168.65.58) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id
 15.1.1713.5; Thu, 17 Dec 2020 18:17:33 +0800
Received: from CSBMAIL1.internal.ite.com.tw ([fe80::2cba:f37c:ac09:f33f]) by
 CSBMAIL1.internal.ite.com.tw ([fe80::2cba:f37c:ac09:f33f%22]) with mapi id
 15.01.1713.004; Thu, 17 Dec 2020 18:17:33 +0800
From: <allen.chen@ite.com.tw>
To: <mathieutournier@gmail.com>
Subject: RE: [PATCH v6] drm/bridge: add it6505 driver
Thread-Topic: [PATCH v6] drm/bridge: add it6505 driver
Thread-Index: AQHW09kDeNVHdtyQH0m9AQl+m0+RXan5ifSAgAF7uVA=
Date: Thu, 17 Dec 2020 10:17:33 +0000
Message-ID: <d056de706f244ef68121f1ca275f9dfa@ite.com.tw>
References: <3F164009-1941-4980-A704-A35EAE3EDAB1@hxcore.ol>
 <CABWh7Q-j57g_vcTx29Po_L8t_nnOMNjUvYdzbuGsFz-xsmV7AQ@mail.gmail.com>
In-Reply-To: <CABWh7Q-j57g_vcTx29Po_L8t_nnOMNjUvYdzbuGsFz-xsmV7AQ@mail.gmail.com>
Accept-Language: en-US
Content-Language: zh-TW
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [192.168.70.104]
x-tm-snts-smtp: 83C1934D75706A74833661191BBC425129E4A12CD44046931B732A017E5019F22000:8
MIME-Version: 1.0
X-MAIL: mse.ite.com.tw 0BHAHXwi011831
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201217_051747_730802_B7DF2F32 
X-CRM114-Status: UNSURE (   5.81  )
X-CRM114-Notice: Please train this message.
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
Cc: Kenneth.Hung@ite.com.tw, jitao.shi@mediatek.com, Jau-Chih.Tseng@ite.com.tw,
 airlied@linux.ie, jonas@kwiboo.se, jernej.skrabec@siol.net,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 narmstrong@baylibre.com, a.hajda@samsung.com, Hermes.Wu@ite.com.tw,
 linux-mediatek@lists.infradead.org, Laurent.pinchart@ideasonboard.com,
 pihsun@chromium.org, matthias.bgg@gmail.com, yllin@google.com,
 linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

SGkgTWF0aGlldQ0KDQpGb3IgZ29vZ2xlIHJlZmVyZW5jZSBkZXNpZ24obXQ4MTgzK2l0NjUwNSks
IHRoZSBtYXhpbXVtIDk1MDAwa0h6IGlzIGRlcGVuZHMgb24gbXQ4MTgzIHJlcXVpcmVtZW50Lg0K
DQotLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQ0KRnJvbTogTWF0aGlldSBUb3VybmllciBbbWFp
bHRvOm1hdGhpZXV0b3VybmllckBnbWFpbC5jb21dIA0KU2VudDogVGh1cnNkYXksIERlY2VtYmVy
IDE3LCAyMDIwIDI6NDcgQU0NClRvOiBBbGxlbiBDaGVuICjpmbPmn4/lrocpDQpDYzogSmF1LUNo
aWggVHNlbmcgKOabvuaYreaZuik7IEtlbm5ldGggSHVuZyAo5rSq5a625YCrKTsgTGF1cmVudC5w
aW5jaGFydEBpZGVhc29uYm9hcmQuY29tOyBhLmhhamRhQHNhbXN1bmcuY29tOyBhaXJsaWVkQGxp
bnV4LmllOyBkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnOyBIZXJtZXMgV3UgKOWQs+S9
s+Wujyk7IGplcm5lai5za3JhYmVjQHNpb2wubmV0OyBqaXRhby5zaGlAbWVkaWF0ZWsuY29tOyBq
b25hc0Brd2lib28uc2U7IGxpbnV4LWFybS1rZXJuZWxAbGlzdHMuaW5mcmFkZWFkLm9yZzsgbGlu
dXgta2VybmVsQHZnZXIua2VybmVsLm9yZzsgbGludXgtbWVkaWF0ZWtAbGlzdHMuaW5mcmFkZWFk
Lm9yZzsgbWF0dGhpYXMuYmdnQGdtYWlsLmNvbTsgbmFybXN0cm9uZ0BiYXlsaWJyZS5jb207IHBp
aHN1bkBjaHJvbWl1bS5vcmc7IHlsbGluQGdvb2dsZS5jb20NClN1YmplY3Q6IFJlOiBbUEFUQ0gg
djZdIGRybS9icmlkZ2U6IGFkZCBpdDY1MDUgZHJpdmVyDQoNCkhpIEFsbGVuLg0KDQpBcyBpdDY1
MDUgaXMgY29tcGF0aWJsZSB3aXRoIERpc3BsYXlQb3J0IDEuMWEsDQpTaG91bGQgRFBJX1BJWEVM
X0NMS19NQVggYmUgMTY1IDAwMCBpbnN0ZWFkIG9mIDk1IDAwMCBraHogPw0KVGhpcyB3b3VsZCBw
ZXJtaXQgMTA4MHAgc3VwcG9ydCwgYXMgaXQgbWF5IGJlIHN1cHBvcnRlZC4NCg0KTWF0aGlldQ0K
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTGludXgtbWVk
aWF0ZWsgbWFpbGluZyBsaXN0CkxpbnV4LW1lZGlhdGVrQGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0
cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1tZWRpYXRlawo=
