Return-Path: <SRS0=Z+8g=2H=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.2 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,UNPARSEABLE_RELAY,USER_AGENT_SANE_2 autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3CD9FC43603
	for <linux-mediatek@archiver.kernel.org>; Tue, 17 Dec 2019 02:42:19 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 08C442176D
	for <linux-mediatek@archiver.kernel.org>; Tue, 17 Dec 2019 02:42:19 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="FwuB4JPl";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b="tUU4wRLl"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 08C442176D
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Date:To:From:Subject:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=pnzwkKPkznbpTB9bum26MX9YTV2RsK11EuaOl1Nl4Qg=; b=FwuB4JPlVj+79E
	kuilFOTHT24xc+5OtHeKT61RiSZdV/PR+9o1g3A3WJ26CiMNmpoTWBIe8Y5Pmae7TahpCYz9SXb/A
	OgisfUvmUWYGRD32lgqJmzezvjbuDQFyvaGDt1KKVF8tG1lpQu2NPOZxSc6eJVLhbKPNpvOwEBxO8
	OX4RKsH+g69hqCiqLQx4P8Bn9HWUV1rxy4df1UXZFUzJ7znJ7EDjDn9tbj1R0Ee5aBXrTV6yL8hGL
	7dbcgBsQnkhnr5VTlvZq/uqSO9rArFVgO0Qe97PNh2BJwjs0Cwf4i/pfN5pwe6Ml/TX97zviti/co
	K0VzDa8YhA9rvadHirWA==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1ih2oP-0008Bo-DP; Tue, 17 Dec 2019 02:42:13 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1ih2oC-0007xS-MX; Tue, 17 Dec 2019 02:42:01 +0000
X-UUID: 394b883a50ab494186f3faefd2c3360c-20191216
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:MIME-Version:Content-Type:References:In-Reply-To:Date:CC:To:From:Subject:Message-ID;
 bh=N+05xpbfbBBsqYnJvXRE+vaAOXzjbDGQ8cCAfKizY18=; 
 b=tUU4wRLlIcFo/H7h4mkm8bqg5/Ig1tVI8yH8tnRZZQ9iy8zVRv7xKIb8P64FbVk9oGIpGDucGmKYT/7qYAg0U9XMOpbGcrVIvD+4B+Nt7bj19bMtmSx5/rU52hY6/cfrvTzq2A2odp3ULZial+ib91yizF+WhZ3yMUVNqFzPdaQ=;
X-UUID: 394b883a50ab494186f3faefd2c3360c-20191216
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw01.mediatek.com
 (envelope-from <jitao.shi@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLS)
 with ESMTP id 1072558578; Mon, 16 Dec 2019 18:41:58 -0800
Received: from mtkmbs05n1.mediatek.inc (172.21.101.15) by
 MTKMBS62N1.mediatek.inc (172.29.193.41) with Microsoft SMTP Server (TLS) id
 15.0.1395.4; Mon, 16 Dec 2019 18:42:14 -0800
Received: from MTKCAS36.mediatek.inc (172.27.4.186) by mtkmbs05n1.mediatek.inc
 (172.21.101.15) with Microsoft SMTP Server (TLS) id 15.0.1395.4;
 Tue, 17 Dec 2019 10:41:38 +0800
Received: from [10.16.6.141] (172.27.4.253) by MTKCAS36.mediatek.inc
 (172.27.4.170) with Microsoft SMTP Server id 15.0.1395.4 via Frontend
 Transport; Tue, 17 Dec 2019 10:41:34 +0800
Message-ID: <1576550522.19567.1.camel@mszsdaap41>
Subject: Re: [PATCH v2 1/2] pwm: fine tune pwm-mtk-disp clock control flow
From: Jitao Shi <jitao.shi@mediatek.com>
To: Uwe =?ISO-8859-1?Q?Kleine-K=F6nig?= <u.kleine-koenig@pengutronix.de>
Date: Tue, 17 Dec 2019 10:42:02 +0800
In-Reply-To: <20191216081843.yxe3vm674jwurwri@pengutronix.de>
References: <20191216070123.114719-1-jitao.shi@mediatek.com>
 <20191216070123.114719-2-jitao.shi@mediatek.com>
 <20191216081843.yxe3vm674jwurwri@pengutronix.de>
X-Mailer: Evolution 3.10.4-0ubuntu2 
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20191216_184200_743538_44DF7C82 
X-CRM114-Status: UNSURE (   9.96  )
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
Cc: linux-pwm@vger.kernel.org, linux-kernel@vger.kernel.org,
 CK Hu <ck.hu@mediatek.com>, sj.huang@mediatek.com,
 Thierry Reding <thierry.reding@gmail.com>, linux-mediatek@lists.infradead.org,
 Matthias Brugger <matthias.bgg@gmail.com>,
 linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

T24gTW9uLCAyMDE5LTEyLTE2IGF0IDA5OjE4ICswMTAwLCBVd2UgS2xlaW5lLUvDtm5pZyB3cm90
ZToNCj4gSGVsbG8sDQo+IA0KPiBPbiBNb24sIERlYyAxNiwgMjAxOSBhdCAwMzowMToyMlBNICsw
ODAwLCBKaXRhbyBTaGkgd3JvdGU6DQo+ID4gTWF0Y2ggcHdtIGNsb2NrIHdoZW4gc3VzcGVuZCBh
bmQgcmVzdW1lLg0KPiA+IFByZXBhcmUgYW5kIGVuYWJsZSBkaXNwX3B3bSBjbG9jayB3aGVuIGRp
c3BfcHdtIGVuYWJsZS4NCj4gPiBEaXNhYmxlIGFuZCB1bnByZXBhcmUgZGlzcF9wd20gY2xvY2sg
d2hlbiBkaXNwX3B3bSBkaXNhYmxlLg0KPiANCj4gQXNzdW1pbmcgeW91IGNhdGNoZWQgYWxsIGNs
b2NrIG9wZXJhdGlvbnMgKEkgZGlkbid0IGNoZWNrKSwgdGhlIHBhdGNoDQo+IGxvb2tzIGZpbmUu
IFRoZSBjb21taXQgbG9nIGNvdWxkIGhvd2V2ZXIgYmUgaW1wcm92ZWQuIEFkZGl0aW9uYWwgdG8N
Cj4gZGVzY3JpYmluZyB3aGF0IHRoZSBwYXRjaCBkb2VzLCBzb21lIHdvcmRzIGFib3V0IHRoZSBt
b3RpdmF0aW9uIHdvdWxkIGJlDQo+IGdvb2QuIERvZXMgdGhpcyBmaXggYSBidWc/IElzIGl0IHRv
IHNhdmUgc29tZSBwb3dlciB3aGlsZSB0aGUgUFdNIGlzbid0DQo+IGluIHVzZT8NCj4gDQo+IEJl
c3QgcmVnYXJkcw0KPiBVd2UNCj4gDQoNCkknbGwgdXBkYXRlIHRoZSBjb21taXQgbXNnIG5leHQg
dmVyc2lvbi4NCg0KVGhhbmtzIGZvciB5b3VyIHJldmlldy4NCg0KQmVzdCBSZWdhcmRzDQpKaXRh
bw0KX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTGludXgt
bWVkaWF0ZWsgbWFpbGluZyBsaXN0CkxpbnV4LW1lZGlhdGVrQGxpc3RzLmluZnJhZGVhZC5vcmcK
aHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1tZWRpYXRl
awo=
