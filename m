Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E9661C433EF
	for <linux-mediatek@archiver.kernel.org>; Thu, 16 Dec 2021 18:30:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=9OezzVhelTJHy/Gwj/u+wX+aRh7+YxInDtAON7aqMPc=; b=zug5QXRqawkJ9F
	lpAKCh9Fj/zGVSyfpxy+IhJ2F43qbksXG55zCocdTnTa8ezAuej/mYqQIL20oLi+Id/wSLGbNLKN+
	txWapI6Fcq7FrFX7Wv0FV8/5eIaSJqudBQ28IcWkSntYQSOkDjHvEFFfJ0Fdlqhq98HmAT67SUncX
	G3Led0IlRXOBt1noAqeem4r+h5etE9ypQy2JBq2/XWBChXVN3q7rrN/nCnVT9Ka0BxyoCrEhbNAQg
	H7ovOZoWgzNvv1bggKDPWlYE7eX3fpHNqalGh51v0np8drG648CenAUZwzEvGFCxjAcLBcHG/WMRK
	80nOgTlOBFaGj+n/18hw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mxvVw-0077t3-FN; Thu, 16 Dec 2021 18:30:00 +0000
Received: from mail-lj1-x22e.google.com ([2a00:1450:4864:20::22e])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mxvVR-0077gi-H6
 for linux-mediatek@lists.infradead.org; Thu, 16 Dec 2021 18:29:33 +0000
Received: by mail-lj1-x22e.google.com with SMTP id i63so39872355lji.3
 for <linux-mediatek@lists.infradead.org>; Thu, 16 Dec 2021 10:29:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=KVa7XRjdQTQQ+NHVe7KA6uaTzA6Zt7dgnU51Cr/arDU=;
 b=DvqnCNlGIVWTdXMQTfWTbX+P7/GCCoWVTp336sZp9LGWx1XowYFz2wjhc/+tgOZguA
 Tr6GSml0dR1myMW/Ve2wcssnvMkmO+JVg3lFnZmM9CZR3mszPyp9stqC4dG5ejrEf8WL
 pW1+yz10ocQOKxKRb6VMOLDZUNRFHBUd1iDsc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=KVa7XRjdQTQQ+NHVe7KA6uaTzA6Zt7dgnU51Cr/arDU=;
 b=Z2s2W0bQPWCYQYV5eUpbvdEIXxucw/lXrnzsjTAJNXkAinQ1dmbArrhWAMEHVz9o9n
 As3BA4zrJdQHHaFwwRusIvFLxoXgfujUWBzSr2LA8YZtZwfVHgV0mQ5UREMqBPsM8vnc
 SAvf48iiQhzazyR3uG9j3/E/Hky9Bp7CF4Ph3Gqr4Us+B7wXkxoeWgfOmCYUJO+um0yj
 /XoRqYciDRCA86f7XBCpUoZKcayrPOE7VNsQUFhea9hgfuyzWRXLLDW943eeHlVnNltn
 qCLfY6HSj/2uWxvCeiEy3xooaMcgPLQbO26KeSe6uQOEnI7uVDkiQxVx7A/UMivSUdde
 ZNyQ==
X-Gm-Message-State: AOAM533nEfNF2ckEUn58SRvVjKeVyCJEedTac5PxJbJn3TpXFdhW+UJt
 uwhsA5vnArdSBbJjbx+71BymgY3+13LQeZS7VSkyiQ==
X-Google-Smtp-Source: ABdhPJw6LfqHGyB0ofB0fkrEV7zVM3ILMEfGUIWtLIfHpPovC9NhM0H8L41hVX+jM18mzDXtiFkEVi2hYqEMvJ1vqQU=
X-Received: by 2002:a2e:b947:: with SMTP id 7mr16919685ljs.89.1639679366471;
 Thu, 16 Dec 2021 10:29:26 -0800 (PST)
MIME-Version: 1.0
References: <20211022172413.195559-1-markyacoub@chromium.org>
 <20211026011318.GF2515@art_vandelay>
 <CAJUqKUopyQEyLh7w32UnHfUJv0nNUoE_PHAdkEj8JOnkhVqbbQ@mail.gmail.com>
 <CAAOTY_84K_xCQE-H8zxWfBhn4kQF_kPsmaqDuRr8w2E4rti3QA@mail.gmail.com>
 <CAJUqKUrCibOCjPca_YaLpF2_zsb-85CbKbrs9KyGqWwGrWOGyg@mail.gmail.com>
 <CAAOTY_-b=F+moHec9sx_o5jv7XhfSd9A2crHsWGtzBdRSoiwHw@mail.gmail.com>
In-Reply-To: <CAAOTY_-b=F+moHec9sx_o5jv7XhfSd9A2crHsWGtzBdRSoiwHw@mail.gmail.com>
From: Mark Yacoub <markyacoub@chromium.org>
Date: Thu, 16 Dec 2021 13:29:15 -0500
Message-ID: <CAJUqKUo2JzASTeVbiP7bAzDKqMYsJGQ5h9=b=9Y8D9z3Xj-YMw@mail.gmail.com>
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
X-CRM114-CacheID: sfid-20211216_102929_652459_5DA930A1 
X-CRM114-Status: GOOD (  28.58  )
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

VGhpcyBtYWtlcyBzZW5zZS4gVGhhbmtzIGZvciBwb2ludGluZyB0aGF0IG91dCBJIHdhc24ndCBh
d2FyZSBvZiBpdC4KSSdsbCB0YWtlIGEgY2xvc2VyIGxvb2sgYW5kIHRyeSB0byBjb21lIHVwIHdp
dGggc29tZXRoaW5nIGJldHRlci4KClRoYW5rcyBDaHVuLUt1YW5nIQoKT24gVGh1LCBEZWMgMTYs
IDIwMjEgYXQgMTE6NTMgQU0gQ2h1bi1LdWFuZyBIdSA8Y2h1bmt1YW5nLmh1QGtlcm5lbC5vcmc+
IHdyb3RlOgo+Cj4gSGksIE1hcms6Cj4KPiBNYXJrIFlhY291YiA8bWFya3lhY291YkBjaHJvbWl1
bS5vcmc+IOaWvCAyMDIx5bm0MTLmnIgxNuaXpSDpgLHlm5sg5LiK5Y2IMToyNeWvq+mBk++8mgo+
ID4KPiA+IE9uIFdlZCwgRGVjIDE1LCAyMDIxIGF0IDExOjE0IEFNIENodW4tS3VhbmcgSHUgPGNo
dW5rdWFuZy5odUBrZXJuZWwub3JnPiB3cm90ZToKPiA+ID4KPiA+ID4gSGksIE1hcms6Cj4gPiA+
Cj4gPiA+IE1hcmsgWWFjb3ViIDxtYXJreWFjb3ViQGNocm9taXVtLm9yZz4g5pa8IDIwMjHlubQx
MuaciDE05pelIOmAseS6jCDkuIvljYgxMToxM+Wvq+mBk++8mgo+ID4gPiA+Cj4gPiA+ID4gSGV5
IENLLCBjYW4gd2UgaGF2ZSB0aGlzIG1lcmdlZD8KPiA+ID4gPiBUaGFuayB5b3UhCj4gPiA+ID4K
PiA+ID4gPiBPbiBNb24sIE9jdCAyNSwgMjAyMSBhdCA5OjEzIFBNIFNlYW4gUGF1bCA8c2VhbkBw
b29ybHkucnVuPiB3cm90ZToKPiA+ID4gPiA+Cj4gPiA+ID4gPiBPbiBGcmksIE9jdCAyMiwgMjAy
MSBhdCAwMToyNDowM1BNIC0wNDAwLCBNYXJrIFlhY291YiB3cm90ZToKPiA+ID4gPiA+ID4gRnJv
bTogTWFyayBZYWNvdWIgPG1hcmt5YWNvdWJAY2hyb21pdW0ub3JnPgo+ID4gPiA+ID4gPgo+ID4g
PiA+ID4gPiBbV2h5XQo+ID4gPiA+ID4gPiBDcmVhdGluZyB0aGUgcHJvcCB1c2VzIFVOS05PV04g
YXMgdGhlIGluaXRpYWwgdmFsdWUsIHdoaWNoIGlzIG5vdCBhCj4gPiA+ID4gPiA+IHN1cHBvcnRl
ZCB2YWx1ZSBpZiB0aGUgcHJvcHMgaXMgdG8gYmUgc3VwcG9ydGVkLgo+ID4gPiA+ID4gPgo+ID4g
PiA+ID4gPiBbSG93XQo+ID4gPiA+ID4gPiBTZXQgdGhlIHBhbmVsIG9yaWVudGF0aW9uIGRlZmF1
bHQgdmFsdWUgdG8gTk9STUFMIHJpZ2h0IGFmdGVyIGNyZWF0aW5nCj4gPiA+ID4gPiA+IHRoZSBw
cm9wLgo+ID4gPiA+ID4KPiA+ID4gPiA+IFJldmlld2VkLWJ5OiBTZWFuIFBhdWwgPHNlYW5wYXVs
QGNocm9taXVtLm9yZz4KPiA+ID4gPiA+Cj4gPiA+ID4gPiA+Cj4gPiA+ID4gPiA+IFRlc3RlZCBv
biBKYWN1enppKE1USykKPiA+ID4gPiA+ID4gRml4ZXMgSUdUQGttc19wcm9wZXJ0aWVzQGdldF9w
cm9wZXJ0aWVzLXNhbml0eS17YXRvbWljLG5vbi1hdG9taWN9Cj4gPiA+ID4gPiA+Cj4gPiA+ID4g
PiA+IFNpZ25lZC1vZmYtYnk6IE1hcmsgWWFjb3ViIDxtYXJreWFjb3ViQGNocm9taXVtLm9yZz4K
PiA+ID4gPiA+ID4gLS0tCj4gPiA+ID4gPiA+ICBkcml2ZXJzL2dwdS9kcm0vbWVkaWF0ZWsvbXRr
X2RzaS5jIHwgMiArKwo+ID4gPiA+ID4gPiAgMSBmaWxlIGNoYW5nZWQsIDIgaW5zZXJ0aW9ucygr
KQo+ID4gPiA+ID4gPgo+ID4gPiA+ID4gPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL21l
ZGlhdGVrL210a19kc2kuYyBiL2RyaXZlcnMvZ3B1L2RybS9tZWRpYXRlay9tdGtfZHNpLmMKPiA+
ID4gPiA+ID4gaW5kZXggMGFkNzE1NzY2MGFmYS4uYjdjMjUyOGE4ZjQxYyAxMDA2NDQKPiA+ID4g
PiA+ID4gLS0tIGEvZHJpdmVycy9ncHUvZHJtL21lZGlhdGVrL210a19kc2kuYwo+ID4gPiA+ID4g
PiArKysgYi9kcml2ZXJzL2dwdS9kcm0vbWVkaWF0ZWsvbXRrX2RzaS5jCj4gPiA+ID4gPiA+IEBA
IC0xMDM5LDYgKzEwMzksOCBAQCBzdGF0aWMgaW50IG10a19kc2lfZW5jb2Rlcl9pbml0KHN0cnVj
dCBkcm1fZGV2aWNlICpkcm0sIHN0cnVjdCBtdGtfZHNpICpkc2kpCj4gPiA+ID4gPiA+ICAgICAg
ICAgICAgICAgRFJNX0VSUk9SKCJVbmFibGUgdG8gaW5pdCBwYW5lbCBvcmllbnRhdGlvblxuIik7
Cj4gPiA+ID4gPiA+ICAgICAgICAgICAgICAgZ290byBlcnJfY2xlYW51cF9lbmNvZGVyOwo+ID4g
PiA+ID4gPiAgICAgICB9Cj4gPiA+ID4gPiA+ICsgICAgIGRybV9jb25uZWN0b3Jfc2V0X3BhbmVs
X29yaWVudGF0aW9uKGRzaS0+Y29ubmVjdG9yLAo+ID4gPiA+ID4gPiArICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICBEUk1fTU9ERV9QQU5FTF9PUklFTlRBVElPTl9OT1JN
QUwpOwo+ID4gPgo+ID4gPiBJbiBkcm1fY29ubmVjdG9yX3NldF9wYW5lbF9vcmllbnRhdGlvbigp
IFsxXSwgSSBmaW5kIHRoYXQgdGhlCj4gPiA+IG9yaWVudGF0aW9uIGNvdWxkIGJlIHNldCBvbmx5
IG9uY2UuIE9uY2UgeW91IHNldCBpdCB0byBub3JtYWwsIGl0Cj4gPiA+IGNvdWxkIG5vdCBiZSBz
ZXQgdG8gb3RoZXIgb3JpZW50YXRpb24uIFJpZ2h0Pwo+ID4gPgo+ID4gSGVsbG8sCj4gPiBZZWFo
IHRoaXMgbG9va3MgdHJ1ZSwgYW5kIG1ha2VzIHNlbnNlIGFjY29yZGluZyB0byB0aGUgZG9jdW1l
bnRhdGlvbjoKPiA+IGh0dHBzOi8vMDEub3JnL2xpbnV4Z3JhcGhpY3MvZ2Z4LWRvY3MvZHJtL2dw
dS9kcm0ta21zLmh0bWwjOn46dGV4dD1vbmUlMjBzdGFuZGFyZGl6ZWQlMjBwcm9wZXJ0eSUzQS0s
cGFuZWwlMjBvcmllbnRhdGlvbiUzQSwtT24lMjBzb21lJTIwZGV2aWNlcwo+ID4KPiA+IFBhbmVs
IG9yaWVudGF0aW9uIGhhcyB0byBkbyB3aXRoIHRoZSBob3cgdGhlIGhhcmR3YXJlIGlzIG1vdW50
ZWQsIGluCj4gPiBjb250cmFzdCB3aXRoIHRoZSBSb3RhdGlvbiBwcm9wZXJ0eS4gQWxsIHRoZSBI
VyB3ZSBoYXZlIHJpZ2h0IG5vdyBoYXMKPiA+IGEgbm9ybWFsIHBhbmVsIG9yaWVudGF0aW9uIHNv
IGl0IG1ha2VzIHNlbnNlIHRvIGJlIHNldCB0aGlzIHdheS4gQW1vbmcKPgo+IE1hbnkgZXZpZGVu
Y2UgWzFdLCBbMl0sIFszXSwgc2hvdyB0aGF0IENocm9tZWJvb2sgcGxhbiB0byBoYXZlIG90aGVy
Cj4gb3JpZW50YXRpb24gb24gbXQ4MTgzLCBzbyBJIHRoaW5rIHlvdSBzaG91bGQgY29uc2lkZXIg
dGhpcy4KPgo+IFsxXSBodHRwczovL3BhdGNod29yay5rZXJuZWwub3JnL3Byb2plY3QvbGludXgt
bWVkaWF0ZWsvcGF0Y2gvMjAyMTA0MDkwNDUzMTQuMzQyMDczMy0yLWhzaW55aUBjaHJvbWl1bS5v
cmcvCj4gWzJdIGh0dHBzOi8vZ2l0Lmtlcm5lbC5vcmcvcHViL3NjbS9saW51eC9rZXJuZWwvZ2l0
L3RvcnZhbGRzL2xpbnV4LmdpdC90cmVlL2RyaXZlcnMvZ3B1L2RybS9wYW5lbC9wYW5lbC1ib2Ut
dHYxMDF3dW0tbmw2LmM/aD12NS4xNi1yYzUjbjE0NzQKPiBbM10gaHR0cHM6Ly9naXQua2VybmVs
Lm9yZy9wdWIvc2NtL2xpbnV4L2tlcm5lbC9naXQvdG9ydmFsZHMvbGludXguZ2l0L3RyZWUvYXJj
aC9hcm02NC9ib290L2R0cy9tZWRpYXRlay9tdDgxODMta3VrdWkta3JhbmUtc2t1MTc2LmR0cz9o
PXY1LjE2LXJjNSNuMjIKPgo+IFJlZ2FyZHMsCj4gQ2h1bi1LdWFuZy4KPgo+Cj4KPiA+IG90aGVy
IGRyaXZlcnMsIHBhbmVsIG9yaWVudGF0aW9uIGlzIGFsd2F5cyBzZXQgcmlnaHQgYWZ0ZXIgdGhl
Cj4gPiBwcm9wZXJ0eSBpcyBpbml0aWFsaXplZC4KPiA+Cj4gPiA+IFsxXSBodHRwczovL2dpdC5r
ZXJuZWwub3JnL3B1Yi9zY20vbGludXgva2VybmVsL2dpdC90b3J2YWxkcy9saW51eC5naXQvdHJl
ZS9kcml2ZXJzL2dwdS9kcm0vZHJtX2Nvbm5lY3Rvci5jP2g9djUuMTYtcmM1I24yMzAyCj4gPiA+
Cj4gPiA+IFJlZ2FyZHMsCj4gPiA+IENodW4tS3VhbmcuCj4gPiA+Cj4gPiA+ID4gPiA+Cj4gPiA+
ID4gPiA+ICAgICAgIGRybV9jb25uZWN0b3JfYXR0YWNoX2VuY29kZXIoZHNpLT5jb25uZWN0b3Is
ICZkc2ktPmVuY29kZXIpOwo+ID4gPiA+ID4gPgo+ID4gPiA+ID4gPiAtLQo+ID4gPiA+ID4gPiAy
LjMzLjAuMTA3OS5nNmU3MDc3OGRjOS1nb29nCj4gPiA+ID4gPiA+Cj4gPiA+ID4gPgo+ID4gPiA+
ID4gLS0KPiA+ID4gPiA+IFNlYW4gUGF1bCwgU29mdHdhcmUgRW5naW5lZXIsIEdvb2dsZSAvIENo
cm9taXVtIE9TCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
XwpMaW51eC1tZWRpYXRlayBtYWlsaW5nIGxpc3QKTGludXgtbWVkaWF0ZWtAbGlzdHMuaW5mcmFk
ZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4
LW1lZGlhdGVrCg==
