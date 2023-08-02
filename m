Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C9230C001E0
	for <linux-mediatek@archiver.kernel.org>; Wed,  2 Aug 2023 11:32:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:In-Reply-To:
	From:References:Cc:To:Subject:MIME-Version:Date:Message-ID:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=7I9L6yyTsIG8sjyONcyZaSV0J5UVP4PnaTFoHvVwaw8=; b=MJpg05k42l83IsKR8tVSdn7Hvu
	tVm6DsAV3PVAzPTVw6zqwFnnxkIpQGwP7imCkwFZc40T0bbGAEjJmtaXpOyLazfp2Xe5yKyZOi87W
	TeBeWN6hAtptW+2DD7b8GyNh7kW1tAI704VQQH5y3GK812I97/zTB5tFlCOfKNpOvsRAfKWy5w9Rs
	S6FtZm1EMBkwd3M2XvOCDpc3eTjVJQfK81kIJ1pfAKeooK59dGWZe4PeVTf8vV4IzLik3vtjnxQli
	LYXz8zMx7SO6Vh4HPpr5Fq470HiQ39Zwm51LnmTZV15hebRGLU8DkNpkEZR9NYcVUmn0Th7WC1TpK
	BYNEyP4A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qRA5Z-004o2o-1g;
	Wed, 02 Aug 2023 11:32:25 +0000
Received: from madras.collabora.co.uk ([2a00:1098:0:82:1000:25:2eeb:e5ab])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qRA5V-004o0n-0g;
	Wed, 02 Aug 2023 11:32:23 +0000
Received: from [192.168.0.116] (unknown [109.229.201.16])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: david.heidelberg)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id 6725366003B0;
	Wed,  2 Aug 2023 12:32:15 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1690975936;
	bh=7I9L6yyTsIG8sjyONcyZaSV0J5UVP4PnaTFoHvVwaw8=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=EGNPzrq4j26eIRJbvmeGBhm31XfGovIIgPJw2xvmM6zrw8y1Qt6xfgbPajhlQSjef
	 f2qN4LTLkSrUgBC4tz3H5jPCtznpZiIYggK/TuueJC0lVvZ8lm/Wx+75YZpjNCVW9h
	 1DBjoatZcBS2GHcPmOxZL5V3pzIQ9rqPWMw6oG0eyZaKZg8DIUye7pouNeUac157Go
	 02QayArhkBzXe/FD5hW/uLAsby9t/uAfs+vuaz65nTaPxuZz7JCQDZcklkGxn0m5rb
	 xqF21nW6WqgfV7Ct6MGllwH64Zxk9RYUhp2foSa4uVw4zQd+MqoiyaJkXfXYGrmYaB
	 DVCnzIevz40VA==
Message-ID: <338ed966-0337-16e0-3758-55ede0e2ea0d@collabora.com>
Date: Wed, 2 Aug 2023 14:32:12 +0300
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v10] drm: Add initial ci/ subdirectory
To: =?UTF-8?B?SnVhbiBBLiBTdcOhcmV6?= <jasuarez@igalia.com>,
 Maira Canal <mcanal@igalia.com>, Helen Koike <helen.koike@collabora.com>,
 dri-devel@lists.freedesktop.org, eric@igalia.com
Cc: emma@anholt.net, linux-doc@vger.kernel.org,
 linux-amlogic@lists.infradead.org, jbrunet@baylibre.com,
 robdclark@google.com, corbet@lwn.net, khilman@baylibre.com,
 sergi.blanch.torne@collabora.com, gustavo.padovan@collabora.com,
 linux-rockchip@lists.infradead.org, daniels@collabora.com,
 martin.blumenstingl@googlemail.com, robclark@freedesktop.org,
 anholt@google.com, linux-mediatek@lists.infradead.org, mripard@kernel.org,
 matthias.bgg@gmail.com, linux-arm-kernel@lists.infradead.org,
 angelogioacchino.delregno@collabora.com, neil.armstrong@linaro.org,
 guilherme.gallo@collabora.com, linux-kernel@vger.kernel.org,
 tzimmermann@suse.de
References: <20230720152737.102382-1-helen.koike@collabora.com>
 <52d1d9e5-00c8-2260-57fc-310cc2f712fd@igalia.com>
 <ad029e1c-8f00-9f5e-e25a-957b3f70c385@collabora.com>
 <ef84ccedbf880c8605688f26ebedc04046c1dd78.camel@igalia.com>
Content-Language: en-US
From: David Heidelberg <david.heidelberg@collabora.com>
Autocrypt: addr=david.heidelberg@collabora.com; keydata=
 xjMEYlvLOxYJKwYBBAHaRw8BAQdA5CoWEzz4igpwK4h6lK6ZformRk84+ymcfkGNPwqEeILN
 MURhdmlkIEhlaWRlbGJlcmcgPGRhdmlkLmhlaWRlbGJlcmdAY29sbGFib3JhLmNvbT7ClgQT
 FggAPhYhBEo7kSl22BK0F1Np/mn1Z4YcHsAUBQJiW8s7AhsDBQkFo5qABQsJCAcCBhUKCQgL
 AgQWAgMBAh4BAheAAAoJEGn1Z4YcHsAU84kBAK5YqSWAOuIumAqgWvke6BEsaIGWGQzXSuKj
 er/TXuFuAQCwc9ITSVXWWTSpdFt2+4z7Wch8tIGlbIFcS9dCFddwCc44BGJbyzsSCisGAQQB
 l1UBBQEBB0AEk7jXEwDApGOwMH/X0UAPBH8Y3isjxhNMjpyRcnl2CwMBCAfCfgQYFggAJhYh
 BEo7kSl22BK0F1Np/mn1Z4YcHsAUBQJiW8s7AhsMBQkFo5qAAAoJEGn1Z4YcHsAU0PEA/j0Y
 uAOKJCnnwrkf3ozPP0sutA5bojoARwcIaZKO/zvIAP9PwTC9DGLg+8LJm7m2Lyf0LxLA8FXD
 wueLHBdwHg6zAQ==
In-Reply-To: <ef84ccedbf880c8605688f26ebedc04046c1dd78.camel@igalia.com>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------gZ4q2nvi1ImwMXIXleAIN9mH"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230802_043221_595967_643A026E 
X-CRM114-Status: GOOD (  22.73  )
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

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--------------gZ4q2nvi1ImwMXIXleAIN9mH
Content-Type: multipart/mixed; boundary="------------FfDTAhzj7y6MRLROQfvQYWPK";
 protected-headers="v1"
From: David Heidelberg <david.heidelberg@collabora.com>
To: =?UTF-8?B?SnVhbiBBLiBTdcOhcmV6?= <jasuarez@igalia.com>,
 Maira Canal <mcanal@igalia.com>, Helen Koike <helen.koike@collabora.com>,
 dri-devel@lists.freedesktop.org, eric@igalia.com
Cc: emma@anholt.net, linux-doc@vger.kernel.org,
 linux-amlogic@lists.infradead.org, jbrunet@baylibre.com,
 robdclark@google.com, corbet@lwn.net, khilman@baylibre.com,
 sergi.blanch.torne@collabora.com, gustavo.padovan@collabora.com,
 linux-rockchip@lists.infradead.org, daniels@collabora.com,
 martin.blumenstingl@googlemail.com, robclark@freedesktop.org,
 anholt@google.com, linux-mediatek@lists.infradead.org, mripard@kernel.org,
 matthias.bgg@gmail.com, linux-arm-kernel@lists.infradead.org,
 angelogioacchino.delregno@collabora.com, neil.armstrong@linaro.org,
 guilherme.gallo@collabora.com, linux-kernel@vger.kernel.org,
 tzimmermann@suse.de
Message-ID: <338ed966-0337-16e0-3758-55ede0e2ea0d@collabora.com>
Subject: Re: [PATCH v10] drm: Add initial ci/ subdirectory
References: <20230720152737.102382-1-helen.koike@collabora.com>
 <52d1d9e5-00c8-2260-57fc-310cc2f712fd@igalia.com>
 <ad029e1c-8f00-9f5e-e25a-957b3f70c385@collabora.com>
 <ef84ccedbf880c8605688f26ebedc04046c1dd78.camel@igalia.com>
In-Reply-To: <ef84ccedbf880c8605688f26ebedc04046c1dd78.camel@igalia.com>

--------------FfDTAhzj7y6MRLROQfvQYWPK
Content-Type: multipart/mixed; boundary="------------Ehh4rGbkOREHlVohl5eVMsUV"

--------------Ehh4rGbkOREHlVohl5eVMsUV
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64

T24gMzEvMDcvMjAyMyAxMDozOCwgSnVhbiBBLiBTdcOhcmV6IHdyb3RlOg0KPiBPbiBTYXQs
IDIwMjMtMDctMjkgYXQgMTI6MDggKzAzMDAsIERhdmlkIEhlaWRlbGJlcmcgd3JvdGU6DQo+
PiBIZWxsbyBNYWlyYSwNCj4+DQo+PiBSZWdhcmRpbmcgdGhlIHNlY29uZCBxdWVzdGlvbiBh
Ym91dCBWM0QgYW5kIFYzRFY6IGluIHRoZSBNZXNhM0QgQ0ksIHdlDQo+PiBjdXJyZW50bHkg
dXNlIGRvd25zdHJlYW0ga2VybmVscywgc28gd2UgZG9uJ3QgYnVpbGQgdGhlIGtlcm5lbCBm
b3INCj4+IFJhc3BiZXJyeSBQaS4NCj4+DQo+Pg0KPj4NCj4NCj4gQk1fQk9PVEZTIG9wdGlv
biBjYW4gcG9pbnQgdG8gYSBsaW5rIHRhcmJhbGwgY29udGFpbmluZyBhbiBhbHRlcm5hdGl2
ZSANCj4ga2VybmVsIHRvIHVzZSBpbnN0ZWFkIG9mIGRvd25zdHJlYW0gb25lLg0KPg0KPiBU
aGUgb25seSBkcmF3YmFjayBpcyB0aGF0IHRoaXMgdGFyYmFsbCBtdXN0IGJlIGFuIGFscmVh
ZHkgY29tcGlsZWQgDQo+IGtlcm5lbDsgaXQgd29uJ3QgY29tcGlsZSBpdC4NCkl0IHdvdWxk
IGJlIGdyZWF0IGlmIHlvdSBjb3VsZCBmaWxsIGluIG1pc3Npbmcga2VybmVsIGNvbmZpZyBv
cHRpb25zIGZvciANCm1hY2hpbmVzIHlvdSB1c2UgZm9yIFYzRChWKSBpbg0KdGhlIGBrZXJu
ZWwvY29uZmlncy9tZXNhKi5jb25maWdgIHdpdGhpbiB0aGUgYGdmeC1jaS9MaW51eCByZXBv
c2l0b3J5IA0KKHRoZSBjb25maWcgZmlsZXMgaGVyZSBvcmlnaW4gZnJvbSB0aGVyZSkuDQoN
CklmIHRoZSBjb21waWxlZCBrZXJuZWwgd2lsbCB3b3JrIG9uIFJQaXMsIHRoZW4gdGhlIG5l
eHQgc3RlcCB3b3VsZCBiZSANCmFkZGluZyBrZXJuZWwgZm9ybWF0DQphbmQgRFRCIG5hbWVz
IHRvIHRoZSBgc3JjL2Jyb2FkY29tL2NpL2dpdGxhYi1jaS55bWxgIGluIHRoZSBNZXNhIA0K
cmVwb3NpdG9yeSBzbyB0aGF0IHlvdSBjYW4gdXNlIG15IE1lc2EgZHJhZnQgTVIgWzFdDQp0
byBxdWlja2x5IHRlc3QgaWYgeW91ciBqb2JzIHdvdWxkIHdvcmsgd2l0aCB0aGUgbWFpbmxp
bmUga2VybmVsIGFuZCBhbnkgDQpvdGhlciBib2FyZCB0aGF0IHdvbid0IGJyZWFrIGR1ZSB0
byB5b3VyIGNoYW5nZXMuDQoNCldoZW4gdGhpcyBpbnRlZ3JhdGlvbiBpcyBkb25lIOKAkiBp
dCdzIGVhc3kgdG8gcnVuIGRybS1jaSB0ZXN0aW5nIG9uIHRoZXNlIA0KbWFjaGluZXMuDQoN
CkRhdmlkDQoNClsxXSBodHRwczovL2dpdGxhYi5mcmVlZGVza3RvcC5vcmcvbWVzYS9tZXNh
Ly0vbWVyZ2VfcmVxdWVzdHMvMjM1NjMNCg0KDQo+DQo+PiBIb3dldmVyLCBJJ3ZlIGJlZW4g
dGhpbmtpbmcgYWJvdXQgdGhlIHBvc3NpYmlsaXR5IG9mIGFkZGluZyBhbiBvdmVycmlkZQ0K
Pj4gZm9yIHRoZSBrZXJuZWwgZnJvbSBhbiBleHRlcm5hbCBzb3VyY2UgdG8gb3VyIENJLiBU
aGlzIHdheSwgd2UgY2FuIGFsc28NCj4+IHRlc3Qgd2l0aCBhIHByb3ZpZGVkIGtlcm5lbCBh
bmQgb3ZlcnJpZGUgdGhlIGRlZmF1bHQgb3B0aW9uIG9mIHVzaW5nIHRoZQ0KPj4gZG93bnN0
cmVhbSBrZXJuZWwgb24gUmFzcGJlcnJ5IFBpLg0KPj4NCj4+IElmIHdlIHByb2NlZWQgd2l0
aCB0aGlzLCBpdCB3b3VsZCBiZSBzZW5zaWJsZSB0byBpbmNsdWRlIFYzRCogb3B0aW9ucyBp
bg0KPj4gb3VyIGtlcm5lbCBidWlsZHMuDQo+Pg0KPj4gSSdtIGluY2x1ZGluZyBKdWFuIGFu
ZCBFcmljIGZvciB0aGVpciBpbnB1dCBvbiB0aGlzIHRvcGljLg0KPj4NCj4+DQo+DQo+IFRo
ZSBpZGVhIHNvdW5kcyBncmVhdC4gQXJlbid0IHdlIGFscmVhZHkgY29tcGlsaW5nIGtlcm5l
bHMgZm9yIG90aGVyIA0KPiBoYXJkd2FyZT8gTWF5YmUgd2UgY2FuIGluY2x1ZGUgc3BlY2lm
aWMgdmVyc2lvbnMgZm9yIFJwaS4NCj4NCj4gSi5BLg0KPg0KLS0gDQpEYXZpZCBIZWlkZWxi
ZXJnDQpDb25zdWx0YW50IFNvZnR3YXJlIEVuZ2luZWVyDQoNCkNvbGxhYm9yYSBMdGQuDQpQ
bGF0aW51bSBCdWlsZGluZywgU3QgSm9obidzIElubm92YXRpb24gUGFyaywgQ2FtYnJpZGdl
IENCNCAwRFMsIFVLDQpSZWdpc3RlcmVkIGluIEVuZ2xhbmQgJiBXYWxlcywgbm8uIDU1MTM3
MTgNCg0K
--------------Ehh4rGbkOREHlVohl5eVMsUV
Content-Type: application/pgp-keys; name="OpenPGP_0x69F567861C1EC014.asc"
Content-Disposition: attachment; filename="OpenPGP_0x69F567861C1EC014.asc"
Content-Description: OpenPGP public key
Content-Transfer-Encoding: quoted-printable

-----BEGIN PGP PUBLIC KEY BLOCK-----

xjMEYlvLOxYJKwYBBAHaRw8BAQdA5CoWEzz4igpwK4h6lK6ZformRk84+ymcfkGN
PwqEeILNMURhdmlkIEhlaWRlbGJlcmcgPGRhdmlkLmhlaWRlbGJlcmdAY29sbGFi
b3JhLmNvbT7ClgQTFggAPhYhBEo7kSl22BK0F1Np/mn1Z4YcHsAUBQJiW8s7AhsD
BQkFo5qABQsJCAcCBhUKCQgLAgQWAgMBAh4BAheAAAoJEGn1Z4YcHsAU84kBAK5Y
qSWAOuIumAqgWvke6BEsaIGWGQzXSuKjer/TXuFuAQCwc9ITSVXWWTSpdFt2+4z7
Wch8tIGlbIFcS9dCFddwCc44BGJbyzsSCisGAQQBl1UBBQEBB0AEk7jXEwDApGOw
MH/X0UAPBH8Y3isjxhNMjpyRcnl2CwMBCAfCfgQYFggAJhYhBEo7kSl22BK0F1Np
/mn1Z4YcHsAUBQJiW8s7AhsMBQkFo5qAAAoJEGn1Z4YcHsAU0PEA/j0YuAOKJCnn
wrkf3ozPP0sutA5bojoARwcIaZKO/zvIAP9PwTC9DGLg+8LJm7m2Lyf0LxLA8FXD
wueLHBdwHg6zAQ=3D=3D
=3DOQS+
-----END PGP PUBLIC KEY BLOCK-----

--------------Ehh4rGbkOREHlVohl5eVMsUV--

--------------FfDTAhzj7y6MRLROQfvQYWPK--

--------------gZ4q2nvi1ImwMXIXleAIN9mH
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEARYIAB0WIQRKO5EpdtgStBdTaf5p9WeGHB7AFAUCZMo+vAAKCRBp9WeGHB7A
FNQcAP4oF5UtDxrYf/MIQwqiHByXB05UlH51Of8QA584U++zsAEA/jWhcpOj2YXI
9hirWMneCsvShLQ3XdS9DufpQRQifgg=
=Vn8P
-----END PGP SIGNATURE-----

--------------gZ4q2nvi1ImwMXIXleAIN9mH--

