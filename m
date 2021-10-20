Return-Path: <SRS0=QBiq=PI=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A84C2C433EF
	for <linux-mediatek@archiver.kernel.org>; Wed, 20 Oct 2021 18:22:50 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 62C7660EFE
	for <linux-mediatek@archiver.kernel.org>; Wed, 20 Oct 2021 18:22:50 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 62C7660EFE
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=ravnborg.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=FXOSXJJ6Ivifbyq50zoAWvPDnKYo0bZrbaUiRKb3F6Y=; b=Sn7nKPVoAYh4xa
	hZVYHX5PqR1/zXT/+7hT1NlBnKDe6hnUs57IjtgPaSnvwiugVD0lBtJN7FlbJqjaBcFlL3c0a9TCk
	d49Gi81SncVl4rbfw0LttNmwNP08FfgYUau+R+qtV9nzy1ZZUeaI2y8LI8ziv5jjxd1vwbew4hCxE
	WArRqc2qE4f0NJU5klNvbp5ovK7jHejfX6srnXZF8/S8LO2XDdhuVrU/f+E0LINjqejufSvFFrqx0
	kri+xixpudR586w5JnAbFGeUSbM6LElBkdqJA4zYJqkiA5hKpgYBtJCwcvBSMH5jywqCpriYaBFOF
	fFZI6/6DLLWz/ieBGcOA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mdGEZ-005Qzb-V0; Wed, 20 Oct 2021 18:22:39 +0000
Received: from mx2.smtp.larsendata.com ([91.221.196.228])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mdGBO-005P6B-Hp
 for linux-mediatek@lists.infradead.org; Wed, 20 Oct 2021 18:19:28 +0000
Received: from mail01.mxhotel.dk (mail01.mxhotel.dk [91.221.196.236])
 by mx2.smtp.larsendata.com (Halon) with ESMTPS
 id 461401bb-31d2-11ec-ac3c-0050568cd888;
 Wed, 20 Oct 2021 18:19:33 +0000 (UTC)
Received: from saturn.localdomain (80-162-45-141-cable.dk.customer.tdc.net
 [80.162.45.141])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 (Authenticated sender: sam@ravnborg.org)
 by mail01.mxhotel.dk (Postfix) with ESMTPSA id E9595194B6F;
 Wed, 20 Oct 2021 20:19:19 +0200 (CEST)
X-Report-Abuse-To: abuse@mxhotel.dk
From: Sam Ravnborg <sam@ravnborg.org>
To: dri-devel@lists.freedesktop.org
Cc: Andrzej Hajda <andrzej.hajda@intel.com>,
 Chun-Kuang Hu <chunkuang.hu@kernel.org>,
 Dafna Hirschfeld <dafna.hirschfeld@collabora.com>,
 Daniel Vetter <daniel@ffwll.ch>, David Airlie <airlied@linux.ie>,
 Enric Balletbo i Serra <enric.balletbo@collabora.com>,
 Jernej Skrabec <jernej.skrabec@gmail.com>,
 Jitao Shi <jitao.shi@mediatek.com>, Jonas Karlman <jonas@kwiboo.se>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 Maxime Ripard <mripard@kernel.org>,
 Neil Armstrong <narmstrong@baylibre.com>,
 Philip Chen <philipchen@chromium.org>,
 Philipp Zabel <p.zabel@pengutronix.de>,
 Robert Foss <robert.foss@linaro.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, Sam Ravnborg <sam@ravnborg.org>,
 Maxime Ripard <maxime@cerno.tech>
Subject: [PATCH v2 7/7] drm/todo: Add bridge related todo items
Date: Wed, 20 Oct 2021 20:19:01 +0200
Message-Id: <20211020181901.2114645-8-sam@ravnborg.org>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20211020181901.2114645-1-sam@ravnborg.org>
References: <20211020181901.2114645-1-sam@ravnborg.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211020_111922_782069_54C3819A 
X-CRM114-Status: GOOD (  18.07  )
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

LSBkZXByZWNhdGVkIGNhbGxiYWNrcyBpbiBkcm1fYnJpZGdlX2Z1bmNzCi0gbW92ZSBjb25uZWN0
b3IgY3JlYXRpb24gdG8gZGlzcGxheSBkcml2ZXJzCgp2MjoKICAtIFVwZGF0ZWQgZGVzY3JpcHRp
b25zIGluIHRvZG8ucnN0CgpTaWduZWQtb2ZmLWJ5OiBTYW0gUmF2bmJvcmcgPHNhbUByYXZuYm9y
Zy5vcmc+CkFja2VkLWJ5OiBNYXhpbWUgUmlwYXJkIDxtYXhpbWVAY2Vybm8udGVjaD4KQ2M6IExh
dXJlbnQgUGluY2hhcnQgPGxhdXJlbnQucGluY2hhcnRAaWRlYXNvbmJvYXJkLmNvbT4KQ2M6IE1h
YXJ0ZW4gTGFua2hvcnN0IDxtYWFydGVuLmxhbmtob3JzdEBsaW51eC5pbnRlbC5jb20+CkNjOiBN
YXhpbWUgUmlwYXJkIDxtcmlwYXJkQGtlcm5lbC5vcmc+CkNjOiBUaG9tYXMgWmltbWVybWFubiA8
dHppbW1lcm1hbm5Ac3VzZS5kZT4KQ2M6IERhdmlkIEFpcmxpZSA8YWlybGllZEBsaW51eC5pZT4K
Q2M6IERhbmllbCBWZXR0ZXIgPGRhbmllbEBmZndsbC5jaD4KLS0tCiBEb2N1bWVudGF0aW9uL2dw
dS90b2RvLnJzdCB8IDQ5ICsrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrCiAx
IGZpbGUgY2hhbmdlZCwgNDkgaW5zZXJ0aW9ucygrKQoKZGlmZiAtLWdpdCBhL0RvY3VtZW50YXRp
b24vZ3B1L3RvZG8ucnN0IGIvRG9jdW1lbnRhdGlvbi9ncHUvdG9kby5yc3QKaW5kZXggNjBkMWQ3
ZWUwNzE5Li4xN2MwM2U3YzQxZTUgMTAwNjQ0Ci0tLSBhL0RvY3VtZW50YXRpb24vZ3B1L3RvZG8u
cnN0CisrKyBiL0RvY3VtZW50YXRpb24vZ3B1L3RvZG8ucnN0CkBAIC00NjMsNiArNDYzLDU1IEBA
IENvbnRhY3Q6IFRob21hcyBaaW1tZXJtYW5uIDx0emltbWVybWFubkBzdXNlLmRlPiwgQ2hyaXN0
aWFuIEvDtm5pZywgRGFuaWVsIFZldHRlCiAKIExldmVsOiBJbnRlcm1lZGlhdGUKIAorRHJvcCB1
c2Ugb2YgZGVwcmVjYXRlZCBvcGVyYXRpb25zIGluIGJyaWRnZSBkcml2ZXJzCistLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLQorCismc3RydWN0IGRybV9i
cmlkZ2VfZnVuY3MgY29udGFpbnMgYSBudW1iZXIgb2YgZGVwcmVjYXRlZCBvcGVyYXRpb25zCit3
aGljaCB1c2UgY2FuIGJlIHJlcGxhY2VkIGJ5IHRoZSBhdG9taWMgdmFyaWFudHMuCisKK1RoZSBm
b2xsb3dpbmcgaXMgbW9yZSBvciBsZXNzIDE6MSByZXBsYWNlbWVudHMgd2hpdCB0aGUgYXJndW1l
bnRzCithbmQgbmFtZXMgYWRqdXN0ZWQ6CisqIHByZV9lbmFibGUgPT4gYXRvbWljX3ByZV9lbmFi
bGUKKyogZW5hYmxlID0+IGF0b21pY19lbmFibGUKKyogZGlzYWJsZSA9PiBhdG9taWNfZGlzYWJs
ZQorKiBwb3N0X2Rpc2FibGUgPT4gYXRvbWljX3Bvc3RfZGlzYWJsZQorCisqIG1vZGVfc2V0IGlz
IG5vIGxvbmdlciByZXF1aXJlZCBhbmQgdGhlIGltcGxlbWVudGF0aW9uIHNoYWxsIGJlIG1lcmdl
ZAorICB3aXRoIGF0b21pY19lbmFibGUuCisKKyogbW9kZV9maXh1cCA9PiBhdG9taWNfY2hlY2sK
KyAgbW9kZV9maXh1cCgpIHdhcyBjcmVhdGVkIGEgbG9uZyB0aW1lIGFnbywgd2hlbiB3ZSB3ZXJl
IHN1cHBvc2VkIHRvIGhhdmUKKyAgYSBzaW5nbGUgYnJpZGdlIGF0IHRoZSBvdXRwdXQgb2YgdGhl
IENSVEMuIFRoZSBicmlkZ2UgY291bGQgdGhlbiBpbnN0cnVjdAorICB0aGUgQ1JUQyB0byBvdXRw
dXQgYSBkaWZmZXJlbnQgbW9kZSB0aGFuIHdoYXQgdGhlIGRpc3BsYXkgcmVxdWlyZXMuCisgIE5v
dyB0aGF0IHdlIGhhdmUgc3VwcG9ydCBmb3IgbXVsdGlwbGUgYnJpZGdlcywgaXQncyBub3QgYXMg
c3RyYWlnaHRmb3J3YXJkLAorICBhbmQgd2UndmUgc28gZmFyIGp1c3QgcHJldGVuZGVkIHRvIGln
bm9yZSB0aGUgcHJvYmxlbS4gVGhlIC5tb2RlX2ZpeHVwKCkKKyAgb3BlcmF0aW9uIGlzIHVzZWQg
YW5kIGFidXNlZCwgYW5kIGp1c3QgdGVsbGluZyBwZW9wbGUgdG8gdXNlIC5hdG9taWNfY2hlY2so
KQorICB3aWxsIGxpa2VseSBtYWtlIHRoaW5ncyB3b3JzZSBhcyB0aGF0IG9wZXJhdGlvbiBoYXMg
YWNjZXNzIHRvIHRoZSBmdWxsIGF0b21pYworICBjb21taXQgYW5kIGNhbiBhbHRlciB0aGUgbW9k
ZSBvZiBwcmV0dHkgbXVjaCBhbnl0aGluZy4gV2UgbmVlZCB0byBkZWZpbmUgY2xlYXIKKyAgc2Vt
YW50aWNzIGZvciAuYXRvbWljX2NoZWNrKCkgaW4gYnJpZGdlcy4KKworCitDb250YWN0OiBicmlk
Z2UgbWFpbnRhaW5lcnMsIFNhbSBSYXZuYm9yZyA8c2FtQHJhdm5ib3JnLm9yZz4sCisgICAgICAg
ICBMYXVyZW50IFBpbmNoYXJ0IDxsYXVyZW50LnBpbmNoYXJ0QGlkZWFzb25ib2FyZC5jb20+CisK
K0xldmVsOiBCZWdpbm5lciBvciBpbnRlcm1lZGlhdGUgKGRlcGVuZGluZyBvbiB0aGUgZHJpdmVy
KQorCitNb3ZlIGNvbm5lY3RvciBjcmVhdGlvbiB0byBkaXNwbGF5IGRyaXZlcnMKKy0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLQorCitXaXRoIHRoZSBpbnRyb2R1Y3Rp
b24gb2YgY2hhaW5lZCBicmlkZ2VzIHRoZSBjcmVhdGlvbiBvZiBjb25uZWN0b3JzIGFyZSBtb3Zl
ZAordG8gdGhlIGRpc3BsYXkgZHJpdmVycy4gVGhlIGZsYWcgRFJNX0JSSURHRV9BVFRBQ0hfTk9f
Q09OTkVDVE9SIGlzIHVzZWQgdG8KK3NpZ25hbCB0byB0aGUgYnJpZGdlIGRyaXZlciB0aGF0IG5v
IGNvbm5lY3RvciBzaGFsbCBiZSBjcmVhdGVkIGFuZCB0aGF0IHRoZQorZGlzcGxheSBkcml2ZXIg
d2lsbCB0YWtlIGNhcmUuIERpc3BsYXkgZHJpdmVycyB3aWxsIGluIG1vc3QgY2FzZXMgYmUgYWJs
ZSB0bwordXRpbGlzZSBkcm1fYnJpZGdlX2Nvbm5lY3Rvcl9pbml0KCkgZm9yIGFsbCB0aGUgbG9n
aWMuCisKK1N0ZXAgMSBpcyB0byBoYXZlIGFsbCBicmlkZ2UgZHJpdmVycyBzdXBwb3J0aW5nIERS
TV9CUklER0VfQVRUQUNIX05PX0NPTk5FQ1RPUi4KK1N0ZXAgMiBpcyB0byBtb3ZlIGNvbm5lY3Rv
ciBjcmVhdGlvbiB0byBhbGwgcmVsZXZhbnQgZGlzcGxheSBkcml2ZXJzLCB1dGlsaXppbmcKK3Ro
ZSBkcm1fYnJpZGdlX2Nvbm5lY3RvciB3aGVyZSBwb3NzaWJsZS4KKworQ29udGFjdDogU2FtIFJh
dm5ib3JnIDxzYW1AcmF2bmJvcmcub3JnPiwgYnJpZGdlIGFuZC9vciBkcml2ZXIgbWFpbnRhaW5l
cihzKQorCitMZXZlbDogSW50ZXJtZWRpYXRlIG9yIGFkdmFuY2VkIChkZXBlbmRpbmcgb24gdGhl
IGRyaXZlcikKIAogQ29yZSByZWZhY3RvcmluZ3MKID09PT09PT09PT09PT09PT09Ci0tIAoyLjMw
LjIKCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpMaW51
eC1tZWRpYXRlayBtYWlsaW5nIGxpc3QKTGludXgtbWVkaWF0ZWtAbGlzdHMuaW5mcmFkZWFkLm9y
ZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LW1lZGlh
dGVrCg==
