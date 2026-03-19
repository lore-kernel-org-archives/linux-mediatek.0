Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2A8671091916
	for <linux-mediatek@archiver.kernel.org>; Thu, 19 Mar 2026 20:28:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:Content-Type:
	References:In-Reply-To:Date:Cc:To:From:Subject:Message-ID:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ieXBhtwQioe8uOOGkxVAKRyCV34NjX4e7tdgyCREHoQ=; b=vcYyq0uxzWFjaREf8Nlxo3QkrJ
	cpRh+QFDeOWHG8qgg4UZss9Forc/fyLvj50ASpLl4gEfCn1nohYyjiFfwuwjIZQWcSOTHozR3yLEm
	HJhMoMqCRV03tdshtG6P9pBBN8yVP9/6EMwokGMQsfO/puCLiFL7KkZpbkTWjfBe/rZxfPa/Kuws5
	A+RH6KavMzpSVSlJlnVH3BQrs2rzJCIXoWUmpeOjEJk/DzI5HnoWbTWsWPp+fqmVhmtDA3P7EL3iC
	27k7zmrev3AzF9AlDgkXVH1svnrQYxWujyBs7e1Cx7lm4Uc6cCT48gFiWhLMbm/StlqoQpsGIqc+D
	vYq4DLNg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w3JyL-0000000BXDy-3Zmn;
	Thu, 19 Mar 2026 20:28:01 +0000
Received: from mail-qk1-x730.google.com ([2607:f8b0:4864:20::730])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w3JyI-0000000BXCs-2Bhb
	for linux-mediatek@lists.infradead.org;
	Thu, 19 Mar 2026 20:28:00 +0000
Received: by mail-qk1-x730.google.com with SMTP id af79cd13be357-8cd8dbf4f2eso146599585a.2
        for <linux-mediatek@lists.infradead.org>; Thu, 19 Mar 2026 13:27:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ndufresne-ca.20230601.gappssmtp.com; s=20230601; t=1773952077; x=1774556877; darn=lists.infradead.org;
        h=mime-version:user-agent:autocrypt:references:in-reply-to:date:cc:to
         :from:subject:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=ieXBhtwQioe8uOOGkxVAKRyCV34NjX4e7tdgyCREHoQ=;
        b=GHB4N23nA3edRF5gw8L+4gVJ54bpvPa0Bp4tuZlljXfSlImeJzGkIRWmYqwV+3Z1ZJ
         2idj36zVLtr3kXcJHhMol4ojgCWFQAE110B2xdq02JgBxjb914Mbv/ab8lm1w2nhPHxH
         6In7cstnXmm2jZVX1ouGrODHiciMw2R+UVptkV2CMSk2nPw4YxFKf608dsG+N2kVwzjn
         aO0rEMA/roA3HtIJ8X/hBZQ0K6GEG9KokxIPiQ6FsUNTQ7+cEpPujJpelCo9GSLiHXad
         JFMt5x8ieY1XLRB/gsQ2+lqKni9SK9FvGoAW3PKqVHe34LKbMgTLPNpL02AL/sCoHjzJ
         AFSg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773952077; x=1774556877;
        h=mime-version:user-agent:autocrypt:references:in-reply-to:date:cc:to
         :from:subject:message-id:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ieXBhtwQioe8uOOGkxVAKRyCV34NjX4e7tdgyCREHoQ=;
        b=qhZEx3vpXYNKmrRjM6GedM8oyKaDXe5eDnzHzSuIdtqJ0gyfj74oeaCjOnxvPpfHsm
         KHHddEVCSewbrXOfis0694OLL4dnf42fT326Kbv3WvXV+Ar3yDcK8EuB1+XMc1oxjL9c
         h83j5/AzZ5/3lblhhE2JS5SztCFAq5+Y1RS0LdXwM1ewMKsxLJYOlDPwHbaaC21tERe6
         WH3eJNq+xnOfLdtW8EpXAwKeYhq/1UznE6LS8sYhDfxzP6xX3yMdMbFqBFj+rK4SLKPY
         A2XdgVYCat4KHrXYoM0Vy+ftT8+iGs/AMCdpeBkX1QNGetUqZXiw78CtG2uBG5pDTy/6
         vpYg==
X-Forwarded-Encrypted: i=1; AJvYcCWzEJm54uhoDE4y8RtoDaz2NmyWLopxrqVqwAlLsuJIgND3uosP4Wkxc+p9zOWkQIHJegGq0Z65JVAQXnCvOQ==@lists.infradead.org
X-Gm-Message-State: AOJu0YyObCSjcYdCEcTi+6X23liO6N5vBY6WeE+A9ktfUsBputUjglYS
	kNMxEN/NPzJpcDJrCc1ThwhOXGx4GuEHvWqJw/xJQE89rTRx2BpsbSv9z/Kk/ydxgFc=
X-Gm-Gg: ATEYQzyTkVNWjEpwa6bpXdsKpMlppWDWDT4a5hEZuHbCn0uAJs5PhniQKRxZrOqedtL
	xAZnMOucNjb7S8y6GkC6pOaFYBBU8GDZABuQcxrwpHX3PL9utB8IsyovebMzDsb0o36R2Tpjbo7
	/snbdSifn4w0/1js6grtAKyDChMxhjKj1xAUHB+mn40XvioCoJ69USRYkPZPLUAT7/SWKDyvNOg
	8xZci66Cgl4ywY0tEyguIqOpR53BQHmcn0CjNyjM9zX9C7DPjloBaDob510AUTqbhSHqbHoRm23
	4KRtDEkUJwfXc7k5+O4T+gwCixzSqjIe0EtFNKymde5sT9bSCpsyxzbWUp45CN/hKXy36+WgPdS
	oBITMwrsfd8j6PD/JaOkteo2mFcq35Un0gxzcnADLZIFv/i9zCjSikyDYiTDOUeqi0KTEd6gU0/
	pSTg/6OqQmUC2NDvADb3CqjmCUbny+
X-Received: by 2002:a05:620a:4489:b0:8cd:a801:cb1f with SMTP id af79cd13be357-8cfc7f48d36mr97810985a.35.1773952077194;
        Thu, 19 Mar 2026 13:27:57 -0700 (PDT)
Received: from ?IPv6:2606:6d00:11:b76d::5ac? ([2606:6d00:11:b76d::5ac])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-8cfc8fb9c10sm12702585a.19.2026.03.19.13.27.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 19 Mar 2026 13:27:56 -0700 (PDT)
Message-ID: <b6b9e336662fece0fc9e2aa132b7cbe02de38885.camel@ndufresne.ca>
Subject: Re: [PATCH] media: mtk-jpeg: fix use-after-free in release path due
 to uncancelled work
From: Nicolas Dufresne <nicolas@ndufresne.ca>
To: Fan Wu <fanwu01@zju.edu.cn>, bin.liu@mediatek.com, mchehab@kernel.org, 
	matthias.bgg@gmail.com, angelogioacchino.delregno@collabora.com
Cc: irui.wang@mediatek.com, kyrie.wu@mediatek.com, hverkuil@kernel.org, 
	linux-media@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org
Date: Thu, 19 Mar 2026 16:27:54 -0400
In-Reply-To: <20260304031934.147483-1-fanwu01@zju.edu.cn>
References: <20260304031934.147483-1-fanwu01@zju.edu.cn>
Autocrypt: addr=nicolas@ndufresne.ca; prefer-encrypt=mutual;
 keydata=mDMEaCN2ixYJKwYBBAHaRw8BAQdAM0EHepTful3JOIzcPv6ekHOenE1u0vDG1gdHFrChD
 /e0J05pY29sYXMgRHVmcmVzbmUgPG5pY29sYXNAbmR1ZnJlc25lLmNhPoicBBMWCgBEAhsDBQsJCA
 cCAiICBhUKCQgLAgQWAgMBAh4HAheABQkJZfd1FiEE7w1SgRXEw8IaBG8S2UGUUSlgcvQFAmibrjo
 CGQEACgkQ2UGUUSlgcvQlQwD/RjpU1SZYcKG6pnfnQ8ivgtTkGDRUJ8gP3fK7+XUjRNIA/iXfhXMN
 abIWxO2oCXKf3TdD7aQ4070KO6zSxIcxgNQFtDFOaWNvbGFzIER1ZnJlc25lIDxuaWNvbGFzLmR1Z
 nJlc25lQGNvbGxhYm9yYS5jb20+iJkEExYKAEECGwMFCwkIBwICIgIGFQoJCAsCBBYCAwECHgcCF4
 AWIQTvDVKBFcTDwhoEbxLZQZRRKWBy9AUCaCyyxgUJCWX3dQAKCRDZQZRRKWBy9ARJAP96pFmLffZ
 smBUpkyVBfFAf+zq6BJt769R0al3kHvUKdgD9G7KAHuioxD2v6SX7idpIazjzx8b8rfzwTWyOQWHC
 AAS0LU5pY29sYXMgRHVmcmVzbmUgPG5pY29sYXMuZHVmcmVzbmVAZ21haWwuY29tPoiZBBMWCgBBF
 iEE7w1SgRXEw8IaBG8S2UGUUSlgcvQFAmibrGYCGwMFCQll93UFCwkIBwICIgIGFQoJCAsCBBYCAw
 ECHgcCF4AACgkQ2UGUUSlgcvRObgD/YnQjfi4+L8f4fI7p1pPMTwRTcaRdy6aqkKEmKsCArzQBAK8
 bRLv9QjuqsE6oQZra/RB4widZPvphs78H0P6NmpIJ
Content-Type: multipart/signed; micalg="pgp-sha512";
	protocol="application/pgp-signature"; boundary="=-lxOLEeh3tHLuJ4rdm5bO"
User-Agent: Evolution 3.58.3 (3.58.3-1.fc43) 
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260319_132758_590151_82359FAF 
X-CRM114-Status: GOOD (  19.58  )
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
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org


--=-lxOLEeh3tHLuJ4rdm5bO
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: base64

TGUgbWVyY3JlZGkgMDQgbWFycyAyMDI2IMOgIDAzOjE5ICswMDAwLCBGYW4gV3UgYSDDqWNyaXTC
oDoKPiBUaGUgbXRrX2pwZWdfcmVsZWFzZSgpIGZ1bmN0aW9uIGZyZWVzIHRoZSBjb250ZXh0IHN0
cnVjdHVyZSAoY3R4KSB3aXRob3V0Cj4gZmlyc3QgY2FuY2VsbGluZyBhbnkgcGVuZGluZyBvciBy
dW5uaW5nIHdvcmsgaW4gY3R4LT5qcGVnX3dvcmsuIFRoaXMKPiBjcmVhdGVzIGEgcmFjZSB3aW5k
b3cgd2hlcmUgdGhlIHdvcmtxdWV1ZSBjYWxsYmFjayBtYXkgc3RpbGwgYmUgYWNjZXNzaW5nCj4g
dGhlIGNvbnRleHQgbWVtb3J5IGFmdGVyIGl0IGhhcyBiZWVuIGZyZWVkLgo+IAo+IFJhY2UgY29u
ZGl0aW9uOgo+IAo+IMKgwqDCoCBDUFUgMCAocmVsZWFzZSnCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoCBDUFUgMSAod29ya3F1ZXVlKQo+IMKgwqDCoCAtLS0tLS0tLS0tLS0t
LS0twqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIC0tLS0tLS0tLS0tLS0tLS0t
LQo+IMKgwqDCoCBjbG9zZSgpCj4gwqDCoMKgwqDCoCBtdGtfanBlZ19yZWxlYXNlKCkKPiDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgIG10a19qcGVnZW5jX3dvcmtlcigpCj4gwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqAgY3R4ID0gd29yay0+ZGF0YQo+IMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIC8vIGFjY2Vz
c2luZyBjdHgKPiAKPiDCoMKgwqDCoMKgwqDCoCBrZnJlZShjdHgpwqAgLy8gZnJlZWQhCj4gwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqAgYWNjZXNzIGN0eMKgIC8vIFVBRiEKPiAKPiBUaGUgd29yayBp
cyBxdWV1ZWQgdmlhIHF1ZXVlX3dvcmsoKSBkdXJpbmcgSlBFRyBlbmNvZGUvZGVjb2RlIG9wZXJh
dGlvbnMKPiAodmlhIG10a19qcGVnX2RldmljZV9ydW4pLiBJZiB0aGUgZGV2aWNlIGlzIGNsb3Nl
ZCB3aGlsZSB3b3JrIGlzIHBlbmRpbmcKPiBvciBydW5uaW5nLCB0aGUgd29yayBoYW5kbGVyIHdp
bGwgYWNjZXNzIGZyZWVkIG1lbW9yeS4KPiAKPiBGaXggdGhpcyBieSBjYWxsaW5nIGNhbmNlbF93
b3JrX3N5bmMoKSBCRUZPUkUgYWNxdWlyaW5nIHRoZSBtdXRleC4gVGhpcwo+IG9yZGVyaW5nIGlz
IGNyaXRpY2FsOiBpZiBjYW5jZWxfd29ya19zeW5jKCkgaXMgY2FsbGVkIGFmdGVyIG11dGV4X2xv
Y2soKSwKPiBhbmQgdGhlIHdvcmsgaGFuZGxlciBhbHNvIHRyaWVzIHRvIGFjcXVpcmUgdGhlIHNh
bWUgbXV0ZXgsIGl0IHdvdWxkIGNhdXNlCj4gYSBkZWFkbG9jay4KPiAKPiBOb3RlOiBUaGUgb3Bl
biBlcnJvciBwYXRoIGRvZXMgTk9UIG5lZWQgY2FuY2VsX3dvcmtfc3luYygpIGJlY2F1c2UKPiBJ
TklUX1dPUksoKSBvbmx5IGluaXRpYWxpemVzIHRoZSB3b3JrIHN0cnVjdHVyZSAtIGl0IGRvZXMg
bm90IHNjaGVkdWxlCj4gaXQuIFdvcmsgaXMgb25seSBzY2hlZHVsZWQgbGF0ZXIgZHVyaW5nIGlv
Y3RsIG9wZXJhdGlvbnMuCj4gCj4gRml4ZXM6IDVmYjFjMjM2MWU1NiAoIm10ay1qcGVnZW5jOiBh
ZGQganBlZyBlbmNvZGUgd29ya2VyIGludGVyZmFjZSIpCj4gU2lnbmVkLW9mZi1ieTogRmFuIFd1
IDxmYW53dTAxQHpqdS5lZHUuY24+CgpSZXZpZXdlZC1ieTogTmljb2xhcyBEdWZyZXNuZSA8bmlj
b2xhcy5kdWZyZXNuZUBjb2xsYWJvcmEuY29tPgoKPiAtLS0KPiDCoGRyaXZlcnMvbWVkaWEvcGxh
dGZvcm0vbWVkaWF0ZWsvanBlZy9tdGtfanBlZ19jb3JlLmMgfCAxICsKPiDCoDEgZmlsZSBjaGFu
Z2VkLCAxIGluc2VydGlvbigrKQo+IAo+IGRpZmYgLS1naXQgYS9kcml2ZXJzL21lZGlhL3BsYXRm
b3JtL21lZGlhdGVrL2pwZWcvbXRrX2pwZWdfY29yZS5jIGIvZHJpdmVycy9tZWRpYS9wbGF0Zm9y
bS9tZWRpYXRlay9qcGVnL210a19qcGVnX2NvcmUuYwo+IGluZGV4IGMwMTEyNGEzNDlmNi4uOGM2
ODQ3NTZkNWZjIDEwMDY0NAo+IC0tLSBhL2RyaXZlcnMvbWVkaWEvcGxhdGZvcm0vbWVkaWF0ZWsv
anBlZy9tdGtfanBlZ19jb3JlLmMKPiArKysgYi9kcml2ZXJzL21lZGlhL3BsYXRmb3JtL21lZGlh
dGVrL2pwZWcvbXRrX2pwZWdfY29yZS5jCj4gQEAgLTEyMDIsNiArMTIwMiw3IEBAIHN0YXRpYyBp
bnQgbXRrX2pwZWdfcmVsZWFzZShzdHJ1Y3QgZmlsZSAqZmlsZSkKPiDCoAlzdHJ1Y3QgbXRrX2pw
ZWdfZGV2ICpqcGVnID0gdmlkZW9fZHJ2ZGF0YShmaWxlKTsKPiDCoAlzdHJ1Y3QgbXRrX2pwZWdf
Y3R4ICpjdHggPSBtdGtfanBlZ19maWxlX3RvX2N0eChmaWxlKTsKPiDCoAo+ICsJY2FuY2VsX3dv
cmtfc3luYygmY3R4LT5qcGVnX3dvcmspOwo+IMKgCW11dGV4X2xvY2soJmpwZWctPmxvY2spOwo+
IMKgCXY0bDJfbTJtX2N0eF9yZWxlYXNlKGN0eC0+ZmgubTJtX2N0eCk7Cj4gwqAJdjRsMl9jdHJs
X2hhbmRsZXJfZnJlZSgmY3R4LT5jdHJsX2hkbCk7Cg==


--=-lxOLEeh3tHLuJ4rdm5bO
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQTvDVKBFcTDwhoEbxLZQZRRKWBy9AUCabxcSwAKCRDZQZRRKWBy
9Kv5AP4qHemcfNFtM1PoQcuuolb7kFnIioH+wVCWJdCrdmbLIAD+LYg4aFIcaLL2
Nr2+VTGkn6ryMeS4088D/Kp/7VyN4wQ=
=EhsS
-----END PGP SIGNATURE-----

--=-lxOLEeh3tHLuJ4rdm5bO--

