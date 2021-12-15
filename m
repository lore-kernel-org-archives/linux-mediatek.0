Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 490F5C433F5
	for <linux-mediatek@archiver.kernel.org>; Wed, 15 Dec 2021 17:25:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=09Asx/N792C0ZhP6jyWkfwo1D5lEIcQImfi4Z/HdNtU=; b=QpwjbyCrD9dpuY
	lEJ4MmpBBtDs2smc1pSYnVBmFqBq/ZTgV0SLLdktubnk3xb3KkTY2mT8MtCt9EGs7jT4Gye6K7f90
	/QOFHZVlIE3PNhOaaUEuC/XD9kHUwUO4KM/EZkYQkQ2yeCtdTnWiCN6Li0jxE2j6vSAksgRNn582I
	yhdywov0KxtMoaNXhZJPbt+Mcq9CMxfV35uvx/fYSHKRo0n9S58rv345p2S/dqm96tYhEyzg1idEw
	LbuglTyR5UIz0b0o3PEzsg2DrzRqyzysC1+Zl2ojXvjWKthCsKOO/fxKpqhAD77wFbQMbV1WU7J7+
	xLrKDZFD9abkvIK4KnGA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mxY22-00252o-0S; Wed, 15 Dec 2021 17:25:34 +0000
Received: from mail-lf1-x136.google.com ([2a00:1450:4864:20::136])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mxY1l-0024va-1x
 for linux-mediatek@lists.infradead.org; Wed, 15 Dec 2021 17:25:19 +0000
Received: by mail-lf1-x136.google.com with SMTP id l22so44471491lfg.7
 for <linux-mediatek@lists.infradead.org>; Wed, 15 Dec 2021 09:25:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=Ru1QL2NBcOaL08U8KTJ8X+cObMY1RMiyv3ZA0fT6+tc=;
 b=NR1IRP7NBuHpjy3NNtMcQtDrQeD4PxJvs2bqCI4hudQOXKBccGAg80rzb7VJTpUgKj
 b7Bp+VIFxZ1rqSd77PsBDV7klG9eUd3MurAAwSlG5r1DquTsvSnoKtfYPeZcEXouJWtA
 G52s1P4JbdQ81xsrDlSW58wYsOKxsMMQ9xqwo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=Ru1QL2NBcOaL08U8KTJ8X+cObMY1RMiyv3ZA0fT6+tc=;
 b=T2d/ds3GQ6tmB1sH6l5pmHimvw3wp5LUm7bXkqoeVdEXX0IUZt/ciRNKg6dveyQ4mC
 9C+kS5q7uu/t/VGs4I11ic1EIrbJg4RzgNb4LNeJEOcmVb5zM0DTSU838IZq4J1ldEfy
 osXodzTdZS5d6qMHL837O1pf9i9aux7ttvmZRFa/lvUJXHwxUCtZ5ehpF5mTGpTD4ryM
 gK5h7GWRwMgiGh5VGnPRyw1HofsGBITzXmjJ3WADiLRRtsp7p02xk8JAMz0NRGyrUM4w
 IZwJ43dE+XUeSVCcF+h/kJbaQs6x2Cao9A8LYT3dSwryHCjt/y0VZTkiwdwF12OSwPj7
 1ZfQ==
X-Gm-Message-State: AOAM530F329n/S3DX2WCVLugliLRQZGr9KHKDdpt9H6ozV67cTVGQgf1
 95uYLe0you5PmqNdkcxX7Qv9a988j2gx9/0DU+g3zQ==
X-Google-Smtp-Source: ABdhPJznEJza5b1lb+va724WlFIkZtOElqFWZGL/mIh6Ux79XpFZA9BLaQf0YiyCn/PejWZESk08SwEHLgkNYSPRTxQ=
X-Received: by 2002:a19:7417:: with SMTP id v23mr10778310lfe.19.1639589114100; 
 Wed, 15 Dec 2021 09:25:14 -0800 (PST)
MIME-Version: 1.0
References: <20211022172413.195559-1-markyacoub@chromium.org>
 <20211026011318.GF2515@art_vandelay>
 <CAJUqKUopyQEyLh7w32UnHfUJv0nNUoE_PHAdkEj8JOnkhVqbbQ@mail.gmail.com>
 <CAAOTY_84K_xCQE-H8zxWfBhn4kQF_kPsmaqDuRr8w2E4rti3QA@mail.gmail.com>
In-Reply-To: <CAAOTY_84K_xCQE-H8zxWfBhn4kQF_kPsmaqDuRr8w2E4rti3QA@mail.gmail.com>
From: Mark Yacoub <markyacoub@chromium.org>
Date: Wed, 15 Dec 2021 12:25:02 -0500
Message-ID: <CAJUqKUrCibOCjPca_YaLpF2_zsb-85CbKbrs9KyGqWwGrWOGyg@mail.gmail.com>
Subject: Re: [PATCH] mediatek: Set default value for Panel Orientation
 connector prop.
To: Chun-Kuang Hu <chunkuang.hu@kernel.org>
Cc: Sean Paul <sean@poorly.run>, 
 "moderated list:ARM/Mediatek SoC support" <linux-mediatek@lists.infradead.org>,
 Sean Paul <seanpaul@chromium.org>, 
 Mark Yacoub <markyacoub@google.com>, Philipp Zabel <p.zabel@pengutronix.de>, 
 David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>, 
 Matthias Brugger <matthias.bgg@gmail.com>,
 DRI Development <dri-devel@lists.freedesktop.org>, 
 Linux ARM <linux-arm-kernel@lists.infradead.org>, 
 linux-kernel <linux-kernel@vger.kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211215_092517_157472_76D0DAF0 
X-CRM114-Status: GOOD (  24.54  )
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

T24gV2VkLCBEZWMgMTUsIDIwMjEgYXQgMTE6MTQgQU0gQ2h1bi1LdWFuZyBIdSA8Y2h1bmt1YW5n
Lmh1QGtlcm5lbC5vcmc+IHdyb3RlOgo+Cj4gSGksIE1hcms6Cj4KPiBNYXJrIFlhY291YiA8bWFy
a3lhY291YkBjaHJvbWl1bS5vcmc+IOaWvCAyMDIx5bm0MTLmnIgxNOaXpSDpgLHkuowg5LiL5Y2I
MTE6MTPlr6vpgZPvvJoKPiA+Cj4gPiBIZXkgQ0ssIGNhbiB3ZSBoYXZlIHRoaXMgbWVyZ2VkPwo+
ID4gVGhhbmsgeW91IQo+ID4KPiA+IE9uIE1vbiwgT2N0IDI1LCAyMDIxIGF0IDk6MTMgUE0gU2Vh
biBQYXVsIDxzZWFuQHBvb3JseS5ydW4+IHdyb3RlOgo+ID4gPgo+ID4gPiBPbiBGcmksIE9jdCAy
MiwgMjAyMSBhdCAwMToyNDowM1BNIC0wNDAwLCBNYXJrIFlhY291YiB3cm90ZToKPiA+ID4gPiBG
cm9tOiBNYXJrIFlhY291YiA8bWFya3lhY291YkBjaHJvbWl1bS5vcmc+Cj4gPiA+ID4KPiA+ID4g
PiBbV2h5XQo+ID4gPiA+IENyZWF0aW5nIHRoZSBwcm9wIHVzZXMgVU5LTk9XTiBhcyB0aGUgaW5p
dGlhbCB2YWx1ZSwgd2hpY2ggaXMgbm90IGEKPiA+ID4gPiBzdXBwb3J0ZWQgdmFsdWUgaWYgdGhl
IHByb3BzIGlzIHRvIGJlIHN1cHBvcnRlZC4KPiA+ID4gPgo+ID4gPiA+IFtIb3ddCj4gPiA+ID4g
U2V0IHRoZSBwYW5lbCBvcmllbnRhdGlvbiBkZWZhdWx0IHZhbHVlIHRvIE5PUk1BTCByaWdodCBh
ZnRlciBjcmVhdGluZwo+ID4gPiA+IHRoZSBwcm9wLgo+ID4gPgo+ID4gPiBSZXZpZXdlZC1ieTog
U2VhbiBQYXVsIDxzZWFucGF1bEBjaHJvbWl1bS5vcmc+Cj4gPiA+Cj4gPiA+ID4KPiA+ID4gPiBU
ZXN0ZWQgb24gSmFjdXp6aShNVEspCj4gPiA+ID4gRml4ZXMgSUdUQGttc19wcm9wZXJ0aWVzQGdl
dF9wcm9wZXJ0aWVzLXNhbml0eS17YXRvbWljLG5vbi1hdG9taWN9Cj4gPiA+ID4KPiA+ID4gPiBT
aWduZWQtb2ZmLWJ5OiBNYXJrIFlhY291YiA8bWFya3lhY291YkBjaHJvbWl1bS5vcmc+Cj4gPiA+
ID4gLS0tCj4gPiA+ID4gIGRyaXZlcnMvZ3B1L2RybS9tZWRpYXRlay9tdGtfZHNpLmMgfCAyICsr
Cj4gPiA+ID4gIDEgZmlsZSBjaGFuZ2VkLCAyIGluc2VydGlvbnMoKykKPiA+ID4gPgo+ID4gPiA+
IGRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vbWVkaWF0ZWsvbXRrX2RzaS5jIGIvZHJpdmVy
cy9ncHUvZHJtL21lZGlhdGVrL210a19kc2kuYwo+ID4gPiA+IGluZGV4IDBhZDcxNTc2NjBhZmEu
LmI3YzI1MjhhOGY0MWMgMTAwNjQ0Cj4gPiA+ID4gLS0tIGEvZHJpdmVycy9ncHUvZHJtL21lZGlh
dGVrL210a19kc2kuYwo+ID4gPiA+ICsrKyBiL2RyaXZlcnMvZ3B1L2RybS9tZWRpYXRlay9tdGtf
ZHNpLmMKPiA+ID4gPiBAQCAtMTAzOSw2ICsxMDM5LDggQEAgc3RhdGljIGludCBtdGtfZHNpX2Vu
Y29kZXJfaW5pdChzdHJ1Y3QgZHJtX2RldmljZSAqZHJtLCBzdHJ1Y3QgbXRrX2RzaSAqZHNpKQo+
ID4gPiA+ICAgICAgICAgICAgICAgRFJNX0VSUk9SKCJVbmFibGUgdG8gaW5pdCBwYW5lbCBvcmll
bnRhdGlvblxuIik7Cj4gPiA+ID4gICAgICAgICAgICAgICBnb3RvIGVycl9jbGVhbnVwX2VuY29k
ZXI7Cj4gPiA+ID4gICAgICAgfQo+ID4gPiA+ICsgICAgIGRybV9jb25uZWN0b3Jfc2V0X3BhbmVs
X29yaWVudGF0aW9uKGRzaS0+Y29ubmVjdG9yLAo+ID4gPiA+ICsgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgIERSTV9NT0RFX1BBTkVMX09SSUVOVEFUSU9OX05PUk1BTCk7
Cj4KPiBJbiBkcm1fY29ubmVjdG9yX3NldF9wYW5lbF9vcmllbnRhdGlvbigpIFsxXSwgSSBmaW5k
IHRoYXQgdGhlCj4gb3JpZW50YXRpb24gY291bGQgYmUgc2V0IG9ubHkgb25jZS4gT25jZSB5b3Ug
c2V0IGl0IHRvIG5vcm1hbCwgaXQKPiBjb3VsZCBub3QgYmUgc2V0IHRvIG90aGVyIG9yaWVudGF0
aW9uLiBSaWdodD8KPgpIZWxsbywKWWVhaCB0aGlzIGxvb2tzIHRydWUsIGFuZCBtYWtlcyBzZW5z
ZSBhY2NvcmRpbmcgdG8gdGhlIGRvY3VtZW50YXRpb246Cmh0dHBzOi8vMDEub3JnL2xpbnV4Z3Jh
cGhpY3MvZ2Z4LWRvY3MvZHJtL2dwdS9kcm0ta21zLmh0bWwjOn46dGV4dD1vbmUlMjBzdGFuZGFy
ZGl6ZWQlMjBwcm9wZXJ0eSUzQS0scGFuZWwlMjBvcmllbnRhdGlvbiUzQSwtT24lMjBzb21lJTIw
ZGV2aWNlcwoKUGFuZWwgb3JpZW50YXRpb24gaGFzIHRvIGRvIHdpdGggdGhlIGhvdyB0aGUgaGFy
ZHdhcmUgaXMgbW91bnRlZCwgaW4KY29udHJhc3Qgd2l0aCB0aGUgUm90YXRpb24gcHJvcGVydHku
IEFsbCB0aGUgSFcgd2UgaGF2ZSByaWdodCBub3cgaGFzCmEgbm9ybWFsIHBhbmVsIG9yaWVudGF0
aW9uIHNvIGl0IG1ha2VzIHNlbnNlIHRvIGJlIHNldCB0aGlzIHdheS4gQW1vbmcKb3RoZXIgZHJp
dmVycywgcGFuZWwgb3JpZW50YXRpb24gaXMgYWx3YXlzIHNldCByaWdodCBhZnRlciB0aGUKcHJv
cGVydHkgaXMgaW5pdGlhbGl6ZWQuCgo+IFsxXSBodHRwczovL2dpdC5rZXJuZWwub3JnL3B1Yi9z
Y20vbGludXgva2VybmVsL2dpdC90b3J2YWxkcy9saW51eC5naXQvdHJlZS9kcml2ZXJzL2dwdS9k
cm0vZHJtX2Nvbm5lY3Rvci5jP2g9djUuMTYtcmM1I24yMzAyCj4KPiBSZWdhcmRzLAo+IENodW4t
S3VhbmcuCj4KPiA+ID4gPgo+ID4gPiA+ICAgICAgIGRybV9jb25uZWN0b3JfYXR0YWNoX2VuY29k
ZXIoZHNpLT5jb25uZWN0b3IsICZkc2ktPmVuY29kZXIpOwo+ID4gPiA+Cj4gPiA+ID4gLS0KPiA+
ID4gPiAyLjMzLjAuMTA3OS5nNmU3MDc3OGRjOS1nb29nCj4gPiA+ID4KPiA+ID4KPiA+ID4gLS0K
PiA+ID4gU2VhbiBQYXVsLCBTb2Z0d2FyZSBFbmdpbmVlciwgR29vZ2xlIC8gQ2hyb21pdW0gT1MK
Cl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCkxpbnV4LW1l
ZGlhdGVrIG1haWxpbmcgbGlzdApMaW51eC1tZWRpYXRla0BsaXN0cy5pbmZyYWRlYWQub3JnCmh0
dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtbWVkaWF0ZWsK
