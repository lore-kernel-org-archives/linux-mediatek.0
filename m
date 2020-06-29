Return-Path: <SRS0=EINh=AK=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.5 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,URIBL_BLOCKED,
	USER_AGENT_SANE_2 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 41A0FC433E0
	for <linux-mediatek@archiver.kernel.org>; Mon, 29 Jun 2020 01:49:05 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 104A62072D
	for <linux-mediatek@archiver.kernel.org>; Mon, 29 Jun 2020 01:49:05 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="zzqc8BMj";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b="Ji6sqIqU"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 104A62072D
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Date:To:From:
	Subject:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=J4zdnMbG/HAVaw+lA79+QPqDT3sBfjKfAk9Lo9JzNZA=; b=zzqc8BMjYaK+EuuYEgubCTpFw
	XyK0ssyTCfoQe2R1nW3dYwyaDUxv0HX3WVvGaactJhrWRCttxq48pX2AmH0AHL+YhCIwkZ/HlAD93
	NMT8sxZvMffpjrQ3uTBUz7S2WHyaUoZYvZr46LOjR9DLDywNy4pqE1SNAzU+0zGGnDb+nOmLRQRYu
	GJJ01zbZ7L41mLvbUgaY9LvxE4DDmqnl+xajdO5ETk5IN7S4a+jbpf4BPoxcJOSnCAcxRKhtQoo04
	kAZsfJwdgoP4Cw72yWYWT/rC2K/0TG3qCCqyKmUjoKFhcfsHHv4PMW9wfI3IZPrfCt72B3M9gJYk/
	ngitsdJOg==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jpiub-0002FL-V3; Mon, 29 Jun 2020 01:48:46 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jpiuY-0002Ek-QR; Mon, 29 Jun 2020 01:48:44 +0000
X-UUID: bb380526cca140c1b1218ccae6191838-20200628
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:MIME-Version:Content-Type:References:In-Reply-To:Date:CC:To:From:Subject:Message-ID;
 bh=mHQn5XmDpgJs5qFDU8hAACPxe8v4rKbaKOCTw7e63mM=; 
 b=Ji6sqIqUTPA68GxFSNlWWD8pZs/dENeDEu/2rW7Rf0MulW5RrY45t52jr3dBN73HgBt8upnpGaC0mFpRxH3n3V1NvtzI6qtn59zwk7czEJyrZPW7/b3o545nR0PLz+ukHs5D6GHwCFZv1ol5Pbny8MiMrthNpu2FL55+6UI5Ayc=;
X-UUID: bb380526cca140c1b1218ccae6191838-20200628
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw01.mediatek.com
 (envelope-from <chunfeng.yun@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLS)
 with ESMTP id 242508469; Sun, 28 Jun 2020 17:48:36 -0800
Received: from MTKMBS32N2.mediatek.inc (172.27.4.72) by
 MTKMBS62N2.mediatek.inc (172.29.193.42) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Sun, 28 Jun 2020 18:48:33 -0700
Received: from MTKCAS32.mediatek.inc (172.27.4.184) by MTKMBS32N2.mediatek.inc
 (172.27.4.72) with Microsoft SMTP Server (TLS) id 15.0.1497.2;
 Mon, 29 Jun 2020 09:48:30 +0800
Received: from [10.17.3.153] (10.17.3.153) by MTKCAS32.mediatek.inc
 (172.27.4.170) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Mon, 29 Jun 2020 09:48:29 +0800
Message-ID: <1593395293.3798.3.camel@mhfsdcap03>
Subject: Re: usb: mtu3: Checking initialisation of the variable
 =?UTF-8?Q?=E2=80=9Cmep=E2=80=9D?= in two functions
From: Chunfeng Yun <chunfeng.yun@mediatek.com>
To: Markus Elfring <Markus.Elfring@web.de>
Date: Mon, 29 Jun 2020 09:48:13 +0800
In-Reply-To: <8efdb7aa-1188-e94a-3075-ab1dd30768bb@web.de>
References: <8efdb7aa-1188-e94a-3075-ab1dd30768bb@web.de>
X-Mailer: Evolution 3.10.4-0ubuntu2 
MIME-Version: 1.0
X-TM-SNTS-SMTP: 762530C185AC44AB10E0841002A5BE6820B6CDB3BFA860D26BD2569CB5C9AB4A2000:8
X-MTK: N
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
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, linux-usb@vger.kernel.org,
 kernel-janitors@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>,
 linux-mediatek@lists.infradead.org, Matthias Brugger <matthias.bgg@gmail.com>,
 Colin Ian
 King <colin.king@canonical.com>, linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

SGksDQpPbiBTYXQsIDIwMjAtMDYtMjcgYXQgMTQ6MjggKzAyMDAsIE1hcmt1cyBFbGZyaW5nIHdy
b3RlOg0KPiBIZWxsbywNCj4gDQo+IEEgc291cmNlIGNvZGUgYW5hbHlzaXMgYXBwcm9hY2ggYnkg
dGhlIG1lYW5zIG9mIHRoZSBzZW1hbnRpYyBwYXRjaCBsYW5ndWFnZQ0KPiAoQ29jY2luZWxsZSBz
b2Z0d2FyZSkgcG9pbnRlZCBhbiBpbXBsZW1lbnRhdGlvbiBkZXRhaWwgb3V0IGZvciBmdXJ0aGVy
DQo+IGRldmVsb3BtZW50IGNvbnNpZGVyYXRpb25zLg0KPiANCj4gVGhlIGZ1bmN0aW9ucyDigJxt
dHUzX2dhZGdldF9lcF9zZXRfaGFsdOKAnSBhbmQg4oCcbXR1M19nYWRnZXRfZXBfc2V0X3dlZGdl
4oCdIGNoZWNrDQo+IGF0IHRoZSBiZWdpbm5pbmcgaWYgdGhlIGlucHV0IHBhcmFtZXRlciDigJxl
cOKAnSBpcyBhIG51bGwgcG9pbnRlci4NCj4gVGhlIGVycm9yIGNvZGUg4oCcLUVJTlZBTOKAnSB3
aWxsIGJlIHJldHVybmVkIHRoZW4uDQo+IGh0dHBzOi8vZ2l0Lmtlcm5lbC5vcmcvcHViL3NjbS9s
aW51eC9rZXJuZWwvZ2l0L3RvcnZhbGRzL2xpbnV4LmdpdC90cmVlL2RyaXZlcnMvdXNiL210dTMv
bXR1M19nYWRnZXQuYz9pZD0xNTkwYTJlMWM2ODFiMDk5MWJkNDJjOTkyY2FiZmQzODBlMDMzOGYy
I24zNzENCj4gaHR0cHM6Ly9lbGl4aXIuYm9vdGxpbi5jb20vbGludXgvdjUuNy4yL3NvdXJjZS9k
cml2ZXJzL3VzYi9tdHUzL210dTNfZ2FkZ2V0LmMjTDM3MQ0KPiANCj4gQ2FuIGl0IGJlIG5pY2Vy
IHRvIGFzc2lnbiB0aGUgdmFyaWFibGUg4oCcbWVw4oCdIG9ubHkgYWZ0ZXIgYSBzdWNjZXNzZnVs
IGNoZWNrDQo+IGluc3RlYWQgb2YgYW4gaW5pdGlhbGlzYXRpb24gYmVmb3JlPw0KWWVzLCBJJ2xs
IGZpeCBpdCwgdGhhbmtzIGEgbG90DQoNCj4gDQo+IFJlZ2FyZHMsDQo+IE1hcmt1cw0KDQpfX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpMaW51eC1tZWRpYXRl
ayBtYWlsaW5nIGxpc3QKTGludXgtbWVkaWF0ZWtAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8v
bGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LW1lZGlhdGVrCg==
