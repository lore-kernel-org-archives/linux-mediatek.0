Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 88F8F1091916
	for <linux-mediatek@archiver.kernel.org>; Thu, 19 Mar 2026 20:26:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:Content-Type:
	References:In-Reply-To:Date:Cc:To:From:Subject:Message-ID:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=0EG1mGn2kxG0H8cSWyUCSFvDfHZ0uJ0D9oamMM5Wir8=; b=x06zzMj/cvPb9FOi65K+OcBGne
	PHAlvW6MgKqPShdEz3EfrQ80Dw8FZs8XfAWDGg9fadX74fY5TYWOGAxMj0VpvkXrpRqc0Xjc+cPer
	TPX8l9lGmgJ0I/p7M+p7UGLSUt5dgn0vGkF4U39R+QZ4Wllob7kOMDhsydgevfED1nIx0FEcJxvUk
	l9R81p/hT3erQToKngWmWU3KOzjW8Ce1rW9RD94MDevZ4rUbAn+7fD7svQFAPlJ0CZbbLH4mhUNfo
	eKqHDQtqBDmZqYs/pIAVmKXk8iYm7f7yqjf6mXli+mRr1tSbWx4JFk3+x48EwC6fMIiadg7jKKtz8
	fjWjHXTA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w3JwP-0000000BWzd-1Ibu;
	Thu, 19 Mar 2026 20:26:01 +0000
Received: from mail-qk1-x72e.google.com ([2607:f8b0:4864:20::72e])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w3JwK-0000000BWyd-2PrD
	for linux-mediatek@lists.infradead.org;
	Thu, 19 Mar 2026 20:26:00 +0000
Received: by mail-qk1-x72e.google.com with SMTP id af79cd13be357-8c70b5594f4so162831385a.1
        for <linux-mediatek@lists.infradead.org>; Thu, 19 Mar 2026 13:25:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ndufresne-ca.20230601.gappssmtp.com; s=20230601; t=1773951955; x=1774556755; darn=lists.infradead.org;
        h=mime-version:user-agent:autocrypt:references:in-reply-to:date:cc:to
         :from:subject:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=0EG1mGn2kxG0H8cSWyUCSFvDfHZ0uJ0D9oamMM5Wir8=;
        b=thmP9ZtdVAQnNjyclbCmGkT8fzqU68nJP/LS6JKq1F/z3523vLvjkXNK8xQrlMcO+E
         wMwk21Ut58UejsSnmBUrcruA33zxPVl7Og1JIOuhO1LGWNqOqCsffX1NKmEoN0mSd1pZ
         M0aNPElwAQ+y+GMD4u5tQtleSv/eznrP1NfbgIkeHIm+tUN5MLiuEdYptzbN8oVDWrn3
         u2x6KGH58EkMieGcIc4d3FT1sen9XQA/VdyvFFcQY21eFIkbdL/9XAIOZOCMVBMgmdsS
         +raa/+rs00v772XHBFz/1yWSgi1l8ODOOyQ5+RUmTyCMUiuvjNyp+CjrM3GdqRUNOWCe
         ST4A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773951955; x=1774556755;
        h=mime-version:user-agent:autocrypt:references:in-reply-to:date:cc:to
         :from:subject:message-id:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=0EG1mGn2kxG0H8cSWyUCSFvDfHZ0uJ0D9oamMM5Wir8=;
        b=Dzsg4ItNenynU2YbZgN7TgL4upBTUxs022qrNBXxUYOfZJoUalF8zwII/Ur9tsCcv3
         tTFHGU2Y42crV8OMiPNZ5JAjMcoS79AGQJ/547L/I1Zh+s70fTecRd4SEnlMU+zJ4ehr
         S6WElSKHgIjVFms1onDUdKiWuvuJGjWFyObKFYAy+NrcXrT6+Oi3AHHddP0Li9mu+sAT
         nAraeZdgUyiTZ10yeNmByYKHiBt/YQZDw3WrtEqRb53mPcZDBfW7f9yPU3Ki2NdmuZ+b
         SgnbUhkdmeJD9mStr5pBubdppsjT2PPlRbVbhJi6LR+McbPoKHagwJqWbRLk8jynacWl
         9h3w==
X-Forwarded-Encrypted: i=1; AJvYcCVkA+Ji6SweYmxFo7+usPUJcr8fFePpahGz6hEHEI2GF/8LLXo3cO/CraCnIIs4PleLGDrdcHzmyifksCFRMw==@lists.infradead.org
X-Gm-Message-State: AOJu0YzihLuLCpSsC9rdDCcb/s5pWKHxuIA9p6xS/LoqdSzMJfiXLv4E
	0ZvusrtT/Gzl4DxAagGF8XeqBFtm0oN9OcyUswAzptIo1wbwOSwvzejZtBL2+PAQJHw=
X-Gm-Gg: ATEYQzxTSp5ZvdtG2F7WtjzqFN9LAuG9WAvQetDQ82+7ekKx5XFnQ183Ztm6sbSZQZC
	oT4ztR5wJBsYzYKiY9UfEZEQAExiHBDkRoX8O2lYgwHGX+JpLeNeQ9Vkl7LkiE1nBOZ0jgVdMfS
	7lszQ7lwcNzDJ4qWkdcR3FSQiArvoY/JPF/eu+xQOdS2poLqqY8LhBFFq4nSI9LesiCaWBlPZE7
	nPtCaj0oj0ouO9EPynEWhWsEtPqjS1+k1gDZ/tS6NcS5so8NruhnB5HXfwDAzHWPeiN5xoUXstW
	2aptp+tVJscJ5PblA2ES/+ZTVps2PHItTTlV+JecqG78yNAGb59J/YEV7k/9WsuHVZyp42y1QyO
	NNn4/fyOCatMNn3sdbC4fcKVXU+DLatX4WJB6iX7JAuoe3H0+4eZV3H7GK20DTSDKqfgMSoNloi
	Ej6BKZh+8O9iqUIWyRKX5iKiUSePc+
X-Received: by 2002:a05:620a:25cb:b0:8cd:9142:ed6c with SMTP id af79cd13be357-8cfc795a3aemr110705385a.1.1773951955162;
        Thu, 19 Mar 2026 13:25:55 -0700 (PDT)
Received: from ?IPv6:2606:6d00:11:b76d::5ac? ([2606:6d00:11:b76d::5ac])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-8cfc8fbe4edsm11003185a.20.2026.03.19.13.25.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 19 Mar 2026 13:25:54 -0700 (PDT)
Message-ID: <9816ad4b43c67b3e4dd779b44f5ee0d7d09d5ecd.camel@ndufresne.ca>
Subject: Re: [PATCH] media: mtk-jpeg: fix use-after-free in release path due
 to uncancelled work
From: Nicolas Dufresne <nicolas@ndufresne.ca>
To: Fan Wu <fanwu01@zju.edu.cn>, bin.liu@mediatek.com, mchehab@kernel.org, 
	matthias.bgg@gmail.com, angelogioacchino.delregno@collabora.com
Cc: irui.wang@mediatek.com, kyrie.wu@mediatek.com, hverkuil@kernel.org, 
	linux-media@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org
Date: Thu, 19 Mar 2026 16:25:52 -0400
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
	protocol="application/pgp-signature"; boundary="=-Fr5ososJn9zdO55z0gpD"
User-Agent: Evolution 3.58.3 (3.58.3-1.fc43) 
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260319_132556_629606_A036FDC8 
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


--=-Fr5ososJn9zdO55z0gpD
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


--=-Fr5ososJn9zdO55z0gpD
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQTvDVKBFcTDwhoEbxLZQZRRKWBy9AUCabxb0QAKCRDZQZRRKWBy
9MsFAQCQeJjdR5w3hB/AAU/cM8jUtrK2jP1cB1pJtx3YrdQDZgD+NwcbZU9Z0Exl
7VAkWg98FEyqc9733fs0ajNBFsNqMgM=
=Rhr7
-----END PGP SIGNATURE-----

--=-Fr5ososJn9zdO55z0gpD--

