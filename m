Return-Path: <SRS0=4wrq=4P=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.3 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_SANE_1 autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9B689C4BA24
	for <linux-mediatek@archiver.kernel.org>; Thu, 27 Feb 2020 12:33:32 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 6EE272468E
	for <linux-mediatek@archiver.kernel.org>; Thu, 27 Feb 2020 12:33:32 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="A/xHc8UV"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 6EE272468E
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=KnEEFxIIBXahpBslgsSiEstuFtatGB0b5MY6hCiDHSY=; b=A/xHc8UVH2r99E
	4q0ydhwsuwuKUkOKg8//PX57qz5AkuINHm5vZzcMK/QkJQVsZrfwdHW/1C4Iu3tMR5yZAJiPyvOOz
	TRY2+cvxnRIfPAoQd9QQjIuBnkVfQG/l0CP8uPFyTmDw4Q2Bn3pYrkUsGXQ92WXA083UTrRN2EiGy
	3xd0MY0WHOh/JPSgKQR+Veh1mlAt5MijxOzrmHbrQRs4UVIP/9m8ot3LNmsj215n3Cwq1iEZJOekp
	Ra+r/FT+T7wVukE//yckE/1M6HaH1a3NVIg/XWUd8T2OZ5+1VVX6LHW2m8jtSTIsF5Xj/sR7TaCUp
	/DtsXQ3asUjWlhWYCRZg==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1j7ILz-0006pc-Gd; Thu, 27 Feb 2020 12:33:23 +0000
Received: from metis.ext.pengutronix.de ([2001:67c:670:201:290:27ff:fe1d:cc33])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1j7ILw-0006oj-JO
 for linux-mediatek@lists.infradead.org; Thu, 27 Feb 2020 12:33:22 +0000
Received: from pty.hi.pengutronix.de ([2001:67c:670:100:1d::c5])
 by metis.ext.pengutronix.de with esmtps
 (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <ukl@pengutronix.de>)
 id 1j7ILr-00083D-5Z; Thu, 27 Feb 2020 13:33:15 +0100
Received: from ukl by pty.hi.pengutronix.de with local (Exim 4.89)
 (envelope-from <ukl@pengutronix.de>)
 id 1j7ILq-0005l7-Ir; Thu, 27 Feb 2020 13:33:14 +0100
Date: Thu, 27 Feb 2020 13:33:14 +0100
From: Uwe =?iso-8859-1?Q?Kleine-K=F6nig?= <u.kleine-koenig@pengutronix.de>
To: Sam Shih <sam.shih@mediatek.com>
Subject: Re: [PATCH 1/1] pwm: mediatek: add longer period support
Message-ID: <20200227123314.mkg6jqai64b3paxw@pengutronix.de>
References: <1582789610-23133-1-git-send-email-sam.shih@mediatek.com>
 <1582789610-23133-2-git-send-email-sam.shih@mediatek.com>
 <20200227080450.rkvwfjx6vikn5ls3@pengutronix.de>
 <1582797590.25607.10.camel@mtksdccf07>
 <20200227105244.orwitjst3wzoqcsq@pengutronix.de>
 <1582806427.27775.1.camel@mtksdccf07>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <1582806427.27775.1.camel@mtksdccf07>
User-Agent: NeoMutt/20170113 (1.7.2)
X-SA-Exim-Connect-IP: 2001:67c:670:100:1d::c5
X-SA-Exim-Mail-From: ukl@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de);
 SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-mediatek@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200227_043320_639006_C1C34318 
X-CRM114-Status: GOOD (  11.78  )
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
 Thierry Reding <thierry.reding@gmail.com>, linux-mediatek@lists.infradead.org,
 John Crispin <john@phrozen.org>, Matthias Brugger <matthias.bgg@gmail.com>,
 linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

SGVsbG8gU2FtLAoKT24gVGh1LCBGZWIgMjcsIDIwMjAgYXQgMDg6Mjc6MDdQTSArMDgwMCwgU2Ft
IFNoaWggd3JvdGU6Cj4gPiA+IAo+ID4gPiArIC8qIFRoZSBwd20gc291cmNlIGNsb2NrIGNhbiBi
ZSBkaXZpZGVkIGJ5IDJeY2xrZGl2LiBXaGVuIHRoZSBjbGtzZWwgICsKPiA+ID4gKiBiaXQgaXMg
c2V0IHRvIDEsIFRoZSBmaW5hbCBjbG9jayBvdXRwdXQgbmVlZHMgdG8gYmUgZGl2aWRlZCBieSBh
biArICAqCj4gPiA+IGV4dHJhIDE2MjUuCj4gPiA+ICsgICovCj4gPiAKPiA+IEknZCB3cml0ZToK
PiA+IAo+ID4gVGhlIHNvdXJjZSBjbG9jayBpcyBkaXZpZGVkIGJ5IDJeY2xrZGl2IG9yIGlmZiB0
aGUgY2xrc2VsIGJpdCBpcyBzZXQgYnkKPiA+IDJeY2xrZGl2ICsgMTYyNS4KPiA+IAo+IAo+IEdy
ZWF0LCB0aGUgY29tbWVudCBpcyBzaG9ydCBhbmQgY2xlYXIuIAo+IEJ1dCBtYXliZSBjaGFuZ2Ug
4oCcMl5jbGtkaXYgKyAxNjI14oCdIHRvIOKAnHRoZSBwcm9kdWN0IG9mIDJeY2xrZGl2IGFuZCAx
NjI14oCdCj4gaXMgY2xlYXJlciA/CgpXcml0aW5nIGEgZm9ybXVsYSBpbiB3b3JkcyBpc24ndCBo
ZWxwZnVsLiBJZiBteSBmb3JtdWxhIHdhcyB3cm9uZyB1c2UKdGhlIHJpZ2h0IG9uZS4gSSB3cm90
ZQoKCTJeY2xrZGl2ICsgMTYyNQoKKHdoaWNoIGltcGxpY2l0bHkgbWVhbnMgKDJeY2xrZGl2KSAr
IDE2MjUpLCBpZiB0aGlzIGlzIHdyb25nIHdyaXRlCgoJMl5jbGtkaXYgKiAxNjI1CgpvciB3aGF0
ZXZlciBpcyB0aGUgcmlnaHQgb25lIHRoZW4uIEFuZCB1c2UgcGFyZW50aGVzaXMgaWYgeW91IGRv
dWJ0CmNsZWFybmVzcy4KCkJlc3QgcmVnYXJkcwpVd2UKCi0tIApQZW5ndXRyb25peCBlLksuICAg
ICAgICAgICAgICAgICAgICAgICAgICAgfCBVd2UgS2xlaW5lLUvDtm5pZyAgICAgICAgICAgIHwK
SW5kdXN0cmlhbCBMaW51eCBTb2x1dGlvbnMgICAgICAgICAgICAgICAgIHwgaHR0cHM6Ly93d3cu
cGVuZ3V0cm9uaXguZGUvIHwKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fCkxpbnV4LW1lZGlhdGVrIG1haWxpbmcgbGlzdApMaW51eC1tZWRpYXRla0BsaXN0
cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGlu
Zm8vbGludXgtbWVkaWF0ZWsK
