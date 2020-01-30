Return-Path: <SRS0=00t5=3T=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.2 required=3.0 tests=DKIMWL_WL_HIGH,
	DKIM_ADSP_CUSTOM_MED,DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,
	URIBL_DBL_ABUSE_MALW autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2BBE3C33C9E
	for <linux-mediatek@archiver.kernel.org>; Thu, 30 Jan 2020 12:04:28 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id F05D52082E
	for <linux-mediatek@archiver.kernel.org>; Thu, 30 Jan 2020 12:04:27 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="tYjjjr2u";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=google.com header.i=@google.com header.b="lBAEJadw"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org F05D52082E
Authentication-Results: mail.kernel.org; dmarc=fail (p=reject dis=none) header.from=google.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=hglJvD+6WduTR+EEJnmZ3MI7Vs7W4KFjUqOpGcN1wJ0=; b=tYjjjr2uduzIVF
	zoAbyeQAQEVq+9OPHKqlHG+vG7+BXEkFm46BHG2UHrOpHUdHNPb1njLbMt1n064AlMquz7cQws860
	OOhhos9Wg0OSO4lM16YErCl5PTQAH+SgmKRvwFUMFDeviYeqqyEmdbs9Q1zzk8cojfVcKSj13Vmju
	8a9JETOKXSjS5zg5b9xDBKfAmklYS2LnQ6t9epS77aSFI2XnhGl+pql4ZNqHVpYSkgqj7/8diWolh
	3TzSwIWpZvsBAA4SilSdL1bbmFKCNwBpmu8knqp1H8ngoocKyj81wx119kywmVrJFUB8GqiVKGWaf
	2Dxi/x6gld1rBQww+yvA==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1ix8YS-0001TO-Vz; Thu, 30 Jan 2020 12:04:16 +0000
Received: from mail-wr1-x442.google.com ([2a00:1450:4864:20::442])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1ix8YP-0001SA-Vv
 for linux-mediatek@lists.infradead.org; Thu, 30 Jan 2020 12:04:15 +0000
Received: by mail-wr1-x442.google.com with SMTP id j104so3709497wrj.7
 for <linux-mediatek@lists.infradead.org>; Thu, 30 Jan 2020 04:04:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=Z8G2nDx9WHWYROzn/JgZ7wxgI6aKyyxtEyWYfcNEyQU=;
 b=lBAEJadw9ZYvQXQKdOzKpPzGlzoNVuJ5v8r8CqV5/4dLEX7pFlppZxDhGBnNKS8zJg
 1IJwI77FK7BfCt9DDChKiDlwctdHUiVGETSyISB3XQQJBNGEDuxVYjn9LtrQiWYzxSNH
 zUdyFclHkqpFZRR+FU7uX+I3wwLNkMZcXpc4xrfNB5p3DBKq3NweyhsZsb3QlVj10odu
 hORYJTmrEE9gI7xsMKDJIo9QTM6UDA5sxrjuJngvotZQUW3/YGh0Szgt1S/P7xw9lUi0
 oPi+6NGbist1gFAXJY4BfF7OAyI7oaItgjviiYZUuWG/eCOFpeZPNJxgfkyNQpJRyTXp
 eDwg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=Z8G2nDx9WHWYROzn/JgZ7wxgI6aKyyxtEyWYfcNEyQU=;
 b=jaTNYl+IJBgCzx9Pm96LldkrT35eGiDSX67O/2UNuQicmadzG6Iwxs+fvXIuV2X89G
 8KpS42kNqebk+/7Ra+kknvyeL6n7LmUB4hiLWfviY7Rt2zzCqBnLKvYjFbl6q+XymoZ7
 2bbg9SDCoNPTp7eU2hQqBtQfmpPurjVaiVEhyHrUjUf69qid6l+/K8VN1+J0ZLgwfei2
 5WQEuxlf2e7Q/IGgOdv6/wdj/LqLWq01vHm+2uSh7Sq7O6cvfmZEiXwdQeMWarLu4g/a
 BRP0EYSSYiw7Z/rUWztVDkptPNgL4YbqxMT9AorzcxQ0lywRcH6RwEjc6/3RNhDiwssV
 2jBA==
X-Gm-Message-State: APjAAAVyxaEargoO/z8NUxnIyGsXcUeS8OuCxumVihGGqI4ZbNzEbgmi
 WJUPFLj/g8azrpqmKOdHHawQRSi4LoSb9HfBjN/l2w==
X-Google-Smtp-Source: APXvYqwzASac9mf2NAyJJfGelmUOl6rbaq8jYO/hT2mN6eGFmrIjyX5UL8P3rGADCUKdS4lGkDRtA6WFVE3c6ViZLoo=
X-Received: by 2002:a5d:550f:: with SMTP id b15mr2806269wrv.196.1580385849232; 
 Thu, 30 Jan 2020 04:04:09 -0800 (PST)
MIME-Version: 1.0
References: <20200130064430.17198-1-walter-zh.wu@mediatek.com>
In-Reply-To: <20200130064430.17198-1-walter-zh.wu@mediatek.com>
From: Alexander Potapenko <glider@google.com>
Date: Thu, 30 Jan 2020 13:03:58 +0100
Message-ID: <CAG_fn=X_jSUJXD932z9oN5hBa--n3Qct4zrjzGaPtb2MwJye7A@mail.gmail.com>
Subject: Re: [PATCH v3] lib/stackdepot: Fix global out-of-bounds in stackdepot
To: Walter Wu <walter-zh.wu@mediatek.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200130_040414_055284_3414FAC7 
X-CRM114-Status: GOOD (  20.56  )
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
Cc: Kate Stewart <kstewart@linuxfoundation.org>,
 wsd_upstream <wsd_upstream@mediatek.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 LKML <linux-kernel@vger.kernel.org>, linux-mediatek@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org, Josh Poimboeuf <jpoimboe@redhat.com>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 Thomas Gleixner <tglx@linutronix.de>, Dmitry Vyukov <dvyukov@google.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

T24gVGh1LCBKYW4gMzAsIDIwMjAgYXQgNzo0NCBBTSBXYWx0ZXIgV3UgPHdhbHRlci16aC53dUBt
ZWRpYXRlay5jb20+IHdyb3RlOgoKSGkgV2FsdGVyLAoKPiBJZiB0aGUgZGVwb3RfaW5kZXggPSBT
VEFDS19BTExPQ19NQVhfU0xBQlMgLSAyIGFuZCBuZXh0X3NsYWJfaW5pdGVkID0gMCwKPiB0aGVu
IGl0IHdpbGwgY2F1c2UgYXJyYXkgb3V0LW9mLWJvdW5kcyBhY2Nlc3MsIHNvIHRoYXQgd2Ugc2hv
dWxkIG1vZGlmeQo+IHRoZSBkZXRlY3Rpb24gdG8gYXZvaWQgdGhpcyBhcnJheSBvdXQtb2YtYm91
bmRzIGJ1Zy4KPgo+IEFzc3VtZSBkZXBvdF9pbmRleCA9IFNUQUNLX0FMTE9DX01BWF9TTEFCUyAt
IDMKPiBDb25zaWRlciBmb2xsb3dpbmcgY2FsbCBmbG93IHNlcXVlbmNlOgo+Cj4gc3RhY2tfZGVw
b3Rfc2F2ZSgpCj4gICAgZGVwb3RfYWxsb2Nfc3RhY2soKQo+ICAgICAgIGlmICh1bmxpa2VseShk
ZXBvdF9pbmRleCArIDEgPj0gU1RBQ0tfQUxMT0NfTUFYX1NMQUJTKSkgLy9wYXNzCj4gICAgICAg
ZGVwb3RfaW5kZXgrKyAgLy9kZXBvdF9pbmRleCA9IFNUQUNLX0FMTE9DX01BWF9TTEFCUyAtIDIK
PiAgICAgICBpZiAoZGVwb3RfaW5kZXggKyAxIDwgU1RBQ0tfQUxMT0NfTUFYX1NMQUJTKSAvL2Vu
dGVyCj4gICAgICAgICAgc21wX3N0b3JlX3JlbGVhc2UoJm5leHRfc2xhYl9pbml0ZWQsIDApOyAv
L25leHRfc2xhYl9pbml0ZWQgPSAwCj4gICAgICAgaW5pdF9zdGFja19zbGFiKCkKPiAgICAgICAg
ICBpZiAoc3RhY2tfc2xhYnNbZGVwb3RfaW5kZXhdID09IE5VTEwpIC8vZW50ZXIgYW5kIGV4aXQK
Pgo+IHN0YWNrX2RlcG90X3NhdmUoKQo+ICAgIGRlcG90X2FsbG9jX3N0YWNrKCkKPiAgICAgICBp
ZiAodW5saWtlbHkoZGVwb3RfaW5kZXggKyAxID49IFNUQUNLX0FMTE9DX01BWF9TTEFCUykpIC8v
cGFzcwo+ICAgICAgIGRlcG90X2luZGV4KysgIC8vZGVwb3RfaW5kZXggPSBTVEFDS19BTExPQ19N
QVhfU0xBQlMgLSAxCj4gICAgICAgaW5pdF9zdGFja19zbGFiKCZwcmVhbGxvYykKPiAgICAgICAg
ICBzdGFja19zbGFic1tkZXBvdF9pbmRleCArIDFdICAvL2hlcmUgZ2V0IGdsb2JhbCBvdXQtb2Yt
Ym91bmRzCj4KPiBDYzogRG1pdHJ5IFZ5dWtvdiA8ZHZ5dWtvdkBnb29nbGUuY29tPgo+IENjOiBN
YXR0aGlhcyBCcnVnZ2VyIDxtYXR0aGlhcy5iZ2dAZ21haWwuY29tPgo+IENjOiBUaG9tYXMgR2xl
aXhuZXIgPHRnbHhAbGludXRyb25peC5kZT4KPiBDYzogQWxleGFuZGVyIFBvdGFwZW5rbyA8Z2xp
ZGVyQGdvb2dsZS5jb20+Cj4gQ2M6IEpvc2ggUG9pbWJvZXVmIDxqcG9pbWJvZUByZWRoYXQuY29t
Pgo+IENjOiBLYXRlIFN0ZXdhcnQgPGtzdGV3YXJ0QGxpbnV4Zm91bmRhdGlvbi5vcmc+Cj4gQ2M6
IEdyZWcgS3JvYWgtSGFydG1hbiA8Z3JlZ2toQGxpbnV4Zm91bmRhdGlvbi5vcmc+Cj4gQ2M6IEth
dGUgU3Rld2FydCA8a3N0ZXdhcnRAbGludXhmb3VuZGF0aW9uLm9yZz4KPiBTaWduZWQtb2ZmLWJ5
OiBXYWx0ZXIgV3UgPHdhbHRlci16aC53dUBtZWRpYXRlay5jb20+Cj4gLS0tCj4gY2hhbmdlcyBp
biB2MjoKPiBtb2RpZnkgY2FsbCBmbG93IHNlcXVlbmNlIGFuZCBwcmVjb25kaXRvbgo+Cj4gY2hh
bmdlcyBpbiB2MzoKPiBhZGQgc29tZSByZXZpZXdlcnMKPiAtLS0KPiAgbGliL3N0YWNrZGVwb3Qu
YyB8IDIgKy0KPiAgMSBmaWxlIGNoYW5nZWQsIDEgaW5zZXJ0aW9uKCspLCAxIGRlbGV0aW9uKC0p
Cj4KPiBkaWZmIC0tZ2l0IGEvbGliL3N0YWNrZGVwb3QuYyBiL2xpYi9zdGFja2RlcG90LmMKPiBp
bmRleCBlZDcxN2RkMDhmZjMuLjdlOGExNWU0MTYwMCAxMDA2NDQKPiAtLS0gYS9saWIvc3RhY2tk
ZXBvdC5jCj4gKysrIGIvbGliL3N0YWNrZGVwb3QuYwo+IEBAIC0xMDYsNyArMTA2LDcgQEAgc3Rh
dGljIHN0cnVjdCBzdGFja19yZWNvcmQgKmRlcG90X2FsbG9jX3N0YWNrKHVuc2lnbmVkIGxvbmcg
KmVudHJpZXMsIGludCBzaXplLAo+ICAgICAgICAgcmVxdWlyZWRfc2l6ZSA9IEFMSUdOKHJlcXVp
cmVkX3NpemUsIDEgPDwgU1RBQ0tfQUxMT0NfQUxJR04pOwo+Cj4gICAgICAgICBpZiAodW5saWtl
bHkoZGVwb3Rfb2Zmc2V0ICsgcmVxdWlyZWRfc2l6ZSA+IFNUQUNLX0FMTE9DX1NJWkUpKSB7Cj4g
LSAgICAgICAgICAgICAgIGlmICh1bmxpa2VseShkZXBvdF9pbmRleCArIDEgPj0gU1RBQ0tfQUxM
T0NfTUFYX1NMQUJTKSkgewo+ICsgICAgICAgICAgICAgICBpZiAodW5saWtlbHkoZGVwb3RfaW5k
ZXggKyAyID49IFNUQUNLX0FMTE9DX01BWF9TTEFCUykpIHsKCkkgZG9uJ3QgdGhpbmsgdGhpcyBp
cyB0aGUgcmlnaHQgd2F5IHRvIGZpeCB0aGUgcHJvYmxlbS4KWW91J3JlIGJhc2ljYWxseSB0aHJv
d2luZyBhd2F5IHRoZSBsYXN0IGVsZW1lbnQgb2Ygc3RhY2tfc2xhYnNbXSwgYXMKd2Ugd29uJ3Qg
YWxsb2NhdGUgYW55dGhpbmcgZnJvbSBpdC4KCkhvdyBhYm91dCB3ZSBzZXQgfG5leHRfc2xhYl9p
bml0ZWR8IHRvIDEgaGVyZToKCmRpZmYgLS1naXQgYS9saWIvc3RhY2tkZXBvdC5jIGIvbGliL3N0
YWNrZGVwb3QuYwppbmRleCAyZTdkMjIzMmVkM2MuLjk0M2E1MWViNzQ2ZCAxMDA2NDQKLS0tIGEv
bGliL3N0YWNrZGVwb3QuYworKysgYi9saWIvc3RhY2tkZXBvdC5jCkBAIC0xMDUsNiArMTA1LDgg
QEAgc3RhdGljIGJvb2wgaW5pdF9zdGFja19zbGFiKHZvaWQgKipwcmVhbGxvYykKICAgICAgICAg
ICAgICAgIHJldHVybiB0cnVlOwogICAgICAgIGlmIChzdGFja19zbGFic1tkZXBvdF9pbmRleF0g
PT0gTlVMTCkgewogICAgICAgICAgICAgICAgc3RhY2tfc2xhYnNbZGVwb3RfaW5kZXhdID0gKnBy
ZWFsbG9jOworICAgICAgICAgICAgICAgaWYgKGRlcG90X2luZGV4ICsgMSA9PSBTVEFDS19BTExP
Q19NQVhfU0xBQlMpCisgICAgICAgICAgICAgICAgICAgICAgIHNtcF9zdG9yZV9yZWxlYXNlKCZu
ZXh0X3NsYWJfaW5pdGVkLCAxKTsKICAgICAgICB9IGVsc2UgewogICAgICAgICAgICAgICAgc3Rh
Y2tfc2xhYnNbZGVwb3RfaW5kZXggKyAxXSA9ICpwcmVhbGxvYzsKICAgICAgICAgICAgICAgIC8q
CgpUaGlzIHdpbGwgZW5zdXJlIHdlIHdvbid0IGJlIHByZWFsbG9jYXRpbmcgcGFnZXMgb25jZSB8
ZGVwb3RfaW5kZXh8CnJlYWNoZXMgdGhlIGxhc3QgZWxlbWVudCwgYW5kIHdlIHdvbid0IGF0dGVt
cHQgdG8gd3JpdGUgdGhvc2UgcGFnZXMKYW55d2hlcmUgZWl0aGVyLgoKQ291bGQgeW91IHBsZWFz
ZSBjaGVjayBpZiB0aGlzIGZpeGVzIHRoZSBwcm9ibGVtIGZvciB5b3U/Cgo+ICAgICAgICAgICAg
ICAgICAgICAgICAgIFdBUk5fT05DRSgxLCAiU3RhY2sgZGVwb3QgcmVhY2hlZCBsaW1pdCBjYXBh
Y2l0eSIpOwo+ICAgICAgICAgICAgICAgICAgICAgICAgIHJldHVybiBOVUxMOwo+ICAgICAgICAg
ICAgICAgICB9Cj4gLS0KPiAyLjE4LjAKCgoKLS0gCkFsZXhhbmRlciBQb3RhcGVua28KU29mdHdh
cmUgRW5naW5lZXIKCkdvb2dsZSBHZXJtYW55IEdtYkgKRXJpa2EtTWFubi1TdHJhw59lLCAzMwo4
MDYzNiBNw7xuY2hlbgoKR2VzY2jDpGZ0c2bDvGhyZXI6IFBhdWwgTWFuaWNsZSwgSGFsaW1haCBE
ZUxhaW5lIFByYWRvClJlZ2lzdGVyZ2VyaWNodCB1bmQgLW51bW1lcjogSGFtYnVyZywgSFJCIDg2
ODkxClNpdHogZGVyIEdlc2VsbHNjaGFmdDogSGFtYnVyZwoKX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX18KTGludXgtbWVkaWF0ZWsgbWFpbGluZyBsaXN0Ckxp
bnV4LW1lZGlhdGVrQGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5v
cmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1tZWRpYXRlawo=
