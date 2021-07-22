Return-Path: <SRS0=Khw4=MO=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-18.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 90DEEC63793
	for <linux-mediatek@archiver.kernel.org>; Thu, 22 Jul 2021 06:25:54 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 637D2610CC
	for <linux-mediatek@archiver.kernel.org>; Thu, 22 Jul 2021 06:25:54 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 637D2610CC
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=ravnborg.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=r8YFR86GnIo3agqb4ZekYdBpz0L9X/TrPDcBHJZumLs=; b=uJXwutZPnNJgFl
	GyoqD3HdPGGEDiVrPtwb92p3K/EzYcVmQ1p3Snwu/zkT8HH6N0PQxBL8ezs8wj/fPt+oebOnNLX4u
	XO+2AZvzyM96gV2uhmFm1s3ZlTt42//Uom/IsWLmef5ZmMwwKj1TErOwu3k7zjtQZ8ycYP2Enhn6M
	VXd1N23BXc5pDajmGvmLDDjf1TGNBDGLGxkKfzjMmjEpaAiIoAAlEAmM8drBMtUyEu2GGP+FhAhAN
	RHQtw9DDvtYwK6GAUpNawB8NE/q6QsU4joUJAp03fXdo9WFe3/qmEKznTsqUfi70ZLfTzjNP4JVuM
	8Ka5J2It0v57koU8WI9A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1m6S9O-000MNm-6P; Thu, 22 Jul 2021 06:25:42 +0000
Received: from mx1.smtp.larsendata.com ([91.221.196.215])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1m6S6u-000L1K-V5
 for linux-mediatek@lists.infradead.org; Thu, 22 Jul 2021 06:23:12 +0000
Received: from mail01.mxhotel.dk (mail01.mxhotel.dk [91.221.196.236])
 by mx1.smtp.larsendata.com (Halon) with ESMTPS
 id 49a34d20-eab5-11eb-9082-0050568c148b;
 Thu, 22 Jul 2021 06:23:11 +0000 (UTC)
Received: from saturn.lan (80-162-45-141-cable.dk.customer.tdc.net
 [80.162.45.141])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 (Authenticated sender: sam@ravnborg.org)
 by mail01.mxhotel.dk (Postfix) with ESMTPSA id 13542194B25;
 Thu, 22 Jul 2021 08:23:24 +0200 (CEST)
X-Report-Abuse-To: abuse@mxhotel.dk
From: Sam Ravnborg <sam@ravnborg.org>
To: dri-devel@lists.freedesktop.org
Cc: Sam Ravnborg <sam@ravnborg.org>, Andrzej Hajda <a.hajda@samsung.com>,
 Chun-Kuang Hu <chunkuang.hu@kernel.org>,
 Dafna Hirschfeld <dafna.hirschfeld@collabora.com>,
 Daniel Vetter <daniel@ffwll.ch>, David Airlie <airlied@linux.ie>,
 Jernej Skrabec <jernej.skrabec@gmail.com>, Jonas Karlman <jonas@kwiboo.se>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 Maxime Ripard <mripard@kernel.org>,
 Neil Armstrong <narmstrong@baylibre.com>,
 Philipp Zabel <p.zabel@pengutronix.de>,
 Robert Foss <robert.foss@linaro.org>,
 Thomas Zimmermann <tzimmermann@suse.de>
Subject: [PATCH v1 7/7] drm/todo: Add bridge related todo items
Date: Thu, 22 Jul 2021 08:22:46 +0200
Message-Id: <20210722062246.2512666-8-sam@ravnborg.org>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20210722062246.2512666-1-sam@ravnborg.org>
References: <20210722062246.2512666-1-sam@ravnborg.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210721_232309_216895_7F42A0FB 
X-CRM114-Status: GOOD (  18.21  )
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
b3IgY3JlYXRpb24gdG8gZGlzcGxheSBkcml2ZXJzCgpTaWduZWQtb2ZmLWJ5OiBTYW0gUmF2bmJv
cmcgPHNhbUByYXZuYm9yZy5vcmc+CkNjOiBMYXVyZW50IFBpbmNoYXJ0IDxsYXVyZW50LnBpbmNo
YXJ0QGlkZWFzb25ib2FyZC5jb20+CkNjOiBNYWFydGVuIExhbmtob3JzdCA8bWFhcnRlbi5sYW5r
aG9yc3RAbGludXguaW50ZWwuY29tPgpDYzogTWF4aW1lIFJpcGFyZCA8bXJpcGFyZEBrZXJuZWwu
b3JnPgpDYzogVGhvbWFzIFppbW1lcm1hbm4gPHR6aW1tZXJtYW5uQHN1c2UuZGU+CkNjOiBEYXZp
ZCBBaXJsaWUgPGFpcmxpZWRAbGludXguaWU+CkNjOiBEYW5pZWwgVmV0dGVyIDxkYW5pZWxAZmZ3
bGwuY2g+Ci0tLQogRG9jdW1lbnRhdGlvbi9ncHUvdG9kby5yc3QgfCA0NyArKysrKysrKysrKysr
KysrKysrKysrKysrKysrKysrKysrKysrKwogMSBmaWxlIGNoYW5nZWQsIDQ3IGluc2VydGlvbnMo
KykKCmRpZmYgLS1naXQgYS9Eb2N1bWVudGF0aW9uL2dwdS90b2RvLnJzdCBiL0RvY3VtZW50YXRp
b24vZ3B1L3RvZG8ucnN0CmluZGV4IDEyZTYxODY5OTM5ZS4uMGVkMWY0OWRmNzNlIDEwMDY0NAot
LS0gYS9Eb2N1bWVudGF0aW9uL2dwdS90b2RvLnJzdAorKysgYi9Eb2N1bWVudGF0aW9uL2dwdS90
b2RvLnJzdApAQCAtNDc3LDYgKzQ3Nyw1MyBAQCBDb250YWN0OiBUaG9tYXMgWmltbWVybWFubiA8
dHppbW1lcm1hbm5Ac3VzZS5kZT4sIENocmlzdGlhbiBLw7ZuaWcsIERhbmllbCBWZXR0ZQogCiBM
ZXZlbDogSW50ZXJtZWRpYXRlCiAKK0Ryb3AgdXNlIG9mIGRlcHJlY2F0ZWQgY2FsbGJhY2tzIGlu
IGJyaWRnZSBkcml2ZXJzCistLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLQorCismc3RydWN0IGRybV9icmlkZ2VfZnVuY3MgY29udGFpbnMgYSBudW1iZXIg
b2YgZGVwcmVjYXRlZCBvcGVyYXRpb25zCit3aGljaCB1c2UgY2FuIGJlIHJlcGxhY2VkIGJ5IHRo
ZSBhdG9taWMgdmFyaWFudHMuCisKKyogcHJlX2VuYWJsZSA9PiBhdG9taWNfcHJlX2VuYWJsZQor
KiBlbmFibGUgPT4gYXRvbWljX2VuYWJsZQorKiBkaXNhYmxlID0+IGF0b21pY19kaXNhYmxlCisq
IHBvc3RfZGlzYWJsZSA9PiBhdG9taWNfcG9zdF9kaXNhYmxlCisKK1RoZSBhYm92ZSBhcmUgaW4g
bW9zdCBjYXNlcyBhIHNpbXBsZSBhZGp1c3RtZW50IG9mIHRoZSBhcmd1bWVudHMgYW5kIG5hbWVz
LgorCisqIG1vZGVfc2V0IGlzIG5vIGxvbmdlciByZXF1aXJlZCBhbmQgdGhlIGltcGxlbWVudGF0
aW9uIHNoYWxsIGJlIG1lcmdlZAorICB3aXRoIGF0b21pY19lbmFibGUuCisKKyogbW9kZV9maXh1
cCA9PiBhdG9taWNfY2hlY2sKKyAgbW9kZV9maXh1cCgpIHdhcyBjcmVhdGVkIGEgbG9uZyB0aW1l
IGFnbywgd2hlbiB3ZSB3ZXJlIHN1cHBvc2VkIHRvIGhhdmUKKyAgYSBzaW5nbGUgYnJpZGdlIGF0
IHRoZSBvdXRwdXQgb2YgdGhlIENSVEMuIFRoZSBicmlkZ2UgY291bGQgdGhlbiBpbnN0cnVjdAor
ICB0aGUgQ1JUQyB0byBvdXRwdXQgYSBkaWZmZXJlbnQgbW9kZSB0aGFuIHdoYXQgdGhlIGRpc3Bs
YXkgcmVxdWlyZXMuCisgIE5vdyB0aGF0IHdlIGhhdmUgc3VwcG9ydCBmb3IgbXVsdGlwbGUgYnJp
ZGdlcywgaXQncyBub3QgYXMgc3RyYWlnaHRmb3J3YXJkLAorICBhbmQgd2UndmUgc28gZmFyIGp1
c3QgcHJldGVuZGVkIHRvIGlnbm9yZSB0aGUgcHJvYmxlbS4gVGhlIC5tb2RlX2ZpeHVwKCkKKyAg
b3BlcmF0aW9uIGlzIHVzZWQgYW5kIGFidXNlZCwgYW5kIGp1c3QgdGVsbGluZyBwZW9wbGUgdG8g
dXNlIC5hdG9taWNfY2hlY2soKQorICB3aWxsIGxpa2VseSBtYWtlIHRoaW5ncyB3b3JzZSBhcyB0
aGF0IG9wZXJhdGlvbiBoYXMgYWNjZXNzIHRvIHRoZSBmdWxsIGF0b21pYworICBjb21taXQgYW5k
IGNhbiBhbHRlciB0aGUgbW9kZSBvZiBwcmV0dHkgbXVjaCBhbnl0aGluZy4gV2UgbmVlZCB0byBk
ZWZpbmUgY2xlYXIKKyAgc2VtYW50aWNzIGZvciAuYXRvbWljX2NoZWNrKCkgaW4gYnJpZGdlcy4K
KworCitDb250YWN0OiBTYW0gUmF2bmJvcmcgPHNhbUByYXZuYm9yZy5vcmc+LCBMYXVyZW50IFBp
bmNoYXJ0IDxsYXVyZW50LnBpbmNoYXJ0QGlkZWFzb25ib2FyZC5jb20+CisKK0xldmVsOiBCZWdp
bm5lciBvciBpbnRlcm1lZGlhdGUgKGRlcGVuZGluZyBvbiB0aGUgZHJpdmVyKQorCitNb3ZlIGNv
bm5lY3RvciBjcmVhdGlvbiB0byBkaXNwbGF5IGRyaXZlcnMKKy0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLQorCitXaXRoIHRoZSBpbnRyb2R1Y3Rpb24gb2YgY2hhaW5l
ZCBicmlkZ2VzIHRoZSBjcmVhdGlvbiBvZiBjb25uZWN0b3JzIGFyZSBtb3ZlZCB0byB0aGUKK2Rp
c3BsYXkgZHJpdmVycy4gVGhlIGZsYWcgRFJNX0JSSURHRV9BVFRBQ0hfTk9fQ09OTkVDVE9SIGlz
IHVzZWQgdG8gc2lnbmFsIHRvIHRoZSBicmlkZ2UKK2RyaXZlciB0aGF0IG5vIGNvbm5lY3RvciBz
aGFsbCBiZSBjcmVhdGVkIGFuZCB0aGF0IHRoZSBkaXNwbGF5IGRyaXZlciB3aWxsIHRha2UgY2Fy
ZS4KK0Rpc3BsYXkgZHJpdmVycyB3aWxsIGluIG1vc3QgY2FzZXMgYmUgYWJsZSB0byB1dGlsaXNl
IGRybV9icmlkZ2VfY29ubmVjdG9yX2luaXQoKSBmb3IgYWxsCit0aGUgbG9naWMuCisKK1RoaXMg
dGFzayByZXF1aXJlcyBhbGwgYnJpZGdlIGRyaXZlcnMgdG8gc3VwcG9ydCBvcHRpb25hbCBvciBu
byBjb25uZWN0b3IgY3JlYXRpb24gYW5kIGFsbAorZGlzcGxheSBkcml2ZXJzIHVzaW5nIGJyaWRn
ZXMgdG8gc3VwcG9ydCBjcmVhdGluZyB0aGUgY29ubmVjdG9yLgorCitDb250YWN0OiBTYW0gUmF2
bmJvcmcgPHNhbUByYXZuYm9yZy5vcmc+LCBicmlkZ2UgbWFpbnRhaW5lcnMsIGRyaXZlciBtYWlu
dGFpbmVyCisKK0xldmVsOiBJbnRlcm1lZGlhdGUgb3IgYWR2YW5jZWQgKGRlcGVuZGluZyBvbiB0
aGUgZHJpdmVyKQogCiBDb3JlIHJlZmFjdG9yaW5ncwogPT09PT09PT09PT09PT09PT0KLS0gCjIu
MzAuMgoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCkxp
bnV4LW1lZGlhdGVrIG1haWxpbmcgbGlzdApMaW51eC1tZWRpYXRla0BsaXN0cy5pbmZyYWRlYWQu
b3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtbWVk
aWF0ZWsK
