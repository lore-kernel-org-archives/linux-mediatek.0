Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 19F8FC27C4F
	for <linux-mediatek@archiver.kernel.org>; Tue, 18 Jun 2024 06:22:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:In-Reply-To:
	From:References:Cc:To:Subject:MIME-Version:Date:Message-ID:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=lrIEYL8C56enjDZz6hyG7L9syLSFkPNkc7tWSgvmSHQ=; b=mi97gr/RDY3KbBN09cqmwdpOg3
	1AUFbUm6hPzDRd3S4ohLiWw9WWBPetz4+dVedN+afyo595Vky7/eEgXxHGXZMPeeLM9Y4T9AmoKrg
	DgsETvDfEeUG+U9Kmp58Ug8/9tGoPjBPmXo9KWjpLsgXJSYBGeWZ8fi42E9ndMx5nmRFWoSA3AZQN
	IOoWC0QGTcNSSz6yIh0r9OB6E0lSkpY/0pBfjR3Z0vBDgP2mTlZMG590fm1L1+KMuj1XSMf2YrabM
	VxceDQRBq7VbAsisaZavnTxgnvTSg1a1jbR3ZV1AcYKLaugKj86OoECt9o2JBsDF8Z+KxaNWv9od6
	u3ntCVxw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sJSEg-0000000DmvF-2UYJ;
	Tue, 18 Jun 2024 06:22:30 +0000
Received: from orthanc.universe-factory.net ([104.238.176.138])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sJSEb-0000000Dmtn-3nmB;
	Tue, 18 Jun 2024 06:22:27 +0000
Received: from [IPV6:2001:19f0:6c01:100::2] (unknown [IPv6:2001:19f0:6c01:100::2])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by orthanc.universe-factory.net (Postfix) with ESMTPSA id 44C041F917;
	Tue, 18 Jun 2024 08:22:20 +0200 (CEST)
Message-ID: <2ea4d24a-c345-463a-8160-2675b8339d79@universe-factory.net>
Date: Tue, 18 Jun 2024 08:22:19 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH net-next v2 1/2] net: dsa: mt7530: factor out bridge
 join/leave logic
Content-Language: en-US-large
To: =?UTF-8?B?QXLEsW7DpyDDnE5BTA==?= <arinc.unal@arinc9.com>,
 Daniel Golle <daniel@makrotopia.org>, DENG Qingfang <dqfext@gmail.com>,
 Sean Wang <sean.wang@mediatek.com>
Cc: Andrew Lunn <andrew@lunn.ch>, Florian Fainelli <f.fainelli@gmail.com>,
 Vladimir Oltean <olteanv@gmail.com>, "David S. Miller"
 <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>,
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 netdev@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org
References: <378bc964b49f9e9954336e99009932ac22bfe172.1718603656.git.mschiffer@universe-factory.net>
 <555b23dc-e054-426b-a26b-6313f260064f@arinc9.com>
From: Matthias Schiffer <mschiffer@universe-factory.net>
Autocrypt: addr=mschiffer@universe-factory.net; keydata=
 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
 cQqe8eRmcdNdqWSiJQ8VLoI=
In-Reply-To: <555b23dc-e054-426b-a26b-6313f260064f@arinc9.com>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------PBONYVPojjQ4770kAfxrJe0Q"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240617_232226_112394_3AB6F950 
X-CRM114-Status: GOOD (  13.11  )
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
--------------PBONYVPojjQ4770kAfxrJe0Q
Content-Type: multipart/mixed; boundary="------------txyx4cF6yZe4kJ3yCDKE6l7V";
 protected-headers="v1"
From: Matthias Schiffer <mschiffer@universe-factory.net>
To: =?UTF-8?B?QXLEsW7DpyDDnE5BTA==?= <arinc.unal@arinc9.com>,
 Daniel Golle <daniel@makrotopia.org>, DENG Qingfang <dqfext@gmail.com>,
 Sean Wang <sean.wang@mediatek.com>
Cc: Andrew Lunn <andrew@lunn.ch>, Florian Fainelli <f.fainelli@gmail.com>,
 Vladimir Oltean <olteanv@gmail.com>, "David S. Miller"
 <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>,
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 netdev@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org
Message-ID: <2ea4d24a-c345-463a-8160-2675b8339d79@universe-factory.net>
Subject: Re: [PATCH net-next v2 1/2] net: dsa: mt7530: factor out bridge
 join/leave logic
References: <378bc964b49f9e9954336e99009932ac22bfe172.1718603656.git.mschiffer@universe-factory.net>
 <555b23dc-e054-426b-a26b-6313f260064f@arinc9.com>
In-Reply-To: <555b23dc-e054-426b-a26b-6313f260064f@arinc9.com>

--------------txyx4cF6yZe4kJ3yCDKE6l7V
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64

T24gMTgvMDYvMjAyNCAwNjo0OCwgQXLEsW7DpyDDnE5BTCB3cm90ZToNCj4gT24gMTcvMDYv
MjAyNCAyMS4zMCwgTWF0dGhpYXMgU2NoaWZmZXIgd3JvdGU6DQo+PiBBcyBwcmVwYXJhdGlv
biBmb3IgaW1wbGVtZW50aW5nIGJyaWRnZSBwb3J0IGlzb2xhdGlvbiwgbW92ZSB0aGUgbG9n
aWMgdG8NCj4+IGFkZCBhbmQgcmVtb3ZlIGJpdHMgaW4gdGhlIHBvcnQgbWF0cml4IGludG8g
YSBuZXcgaGVscGVyDQo+PiBtdDc1MzBfdXBkYXRlX3BvcnRfbWVtYmVyKCksIHdoaWNoIGlz
IGNhbGxlZCBmcm9tDQo+PiBtdDc1MzBfcG9ydF9icmlkZ2Vfam9pbigpIGFuZCBtdDc1MzBf
cG9ydF9icmlkZ2VfbGVhdmUoKS4NCj4+DQo+PiBObyBmdW5jdGlvbmFsIGNoYW5nZSBpbnRl
bmRlZC4NCj4+DQo+PiBTaWduZWQtb2ZmLWJ5OiBNYXR0aGlhcyBTY2hpZmZlciA8bXNjaGlm
ZmVyQHVuaXZlcnNlLWZhY3RvcnkubmV0Pg0KPiANCj4gSSBzZWUgdGhhdCBteSByZXZpZXcg
b2YgdGhlIHByZXZpb3VzIHZlcnNpb24gb2YgdGhpcyBwYXRjaCB3YXMgY29tcGxldGVseQ0K
PiBpZ25vcmVkLiBXaHk/DQo+IA0KPiBBcsSxbsOnDQoNClVnaCwgSSBzb21laG93IG92ZXJs
b29rZWQgdGhlIHJldmlldyBtYWlsIGZvciB0aGlzIHBhdGNoLiBTb3JyeSBhYm91dCB0aGF0
LCANCndpbGwgYWRkcmVzcyB5b3VyIGNvbW1lbnRzIGluIHYzLg0KDQpNYXR0aGlhcw0K

--------------txyx4cF6yZe4kJ3yCDKE6l7V--

--------------PBONYVPojjQ4770kAfxrJe0Q
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature.asc"

-----BEGIN PGP SIGNATURE-----

wsF5BAABCAAjFiEEZmTnvaa2aYgexS51Fu8/ZMsgHZwFAmZxJ5sFAwAAAAAACgkQFu8/ZMsgHZxZ
MBAAwVv09Oyw7RiI9OdMTQ2qiWblrcBsTGNOtODWHL+GsMJPAph5Yc0pAbKuVZdK2tjKLNQEV/4P
Jcq08YNPSZuyB6Wm30puzUMHzzPU4y0awx13/RDVWdjULq54XzXL0E0IauE/41RdoW1N97gmMqi2
5+ZHCcJ55PyxTMdrQ8J4ihNRjrC4q5/60Hpw+5pkCGVlq2fwUxM363bVBiGnrbwCEkEAOGhoQXIT
a+38Xg977kJEhecqnVoJltR3pFomDtvttjozxN1L8RGZBVpvSpKUjg72FeLVg9VtOYs+vHjbx2zD
oEO4FBf83P2ZYA0W+PqQJAVrxHLlZtf65cvLqYFG1c06+w/Ulzuz0M+sgdWJh2sd5F4pMsproFVE
zdsNVEJn7Mf4VOgviHyemyBGD4qVuRdVCjhmpI2QhmJxs3ZQ0S4tsJO5j9+Nj68Y/f09f2d9XaFj
akYXLzJBt6rNjcPH1L1izdPU0TRNNKiTXjxJbVXMRlLxqI5DFbKEqKE3HPwyLExbdN3/ZX8FgHCm
I4iIR6pjfJxQ3mqIVA0FygHS4CkkdEPJmR5npI+KJmAHEis/SGJLxmKBmEmsOUQZzhgqKJVFKtak
QTvMlOK1tfOoJf9WzHKXujRg/+qNe1eLZUfNAAiNSZXnzfVXSxgNwtT5DSOS1oMl58SLi65fCB6r
W6E=
=RCWV
-----END PGP SIGNATURE-----

--------------PBONYVPojjQ4770kAfxrJe0Q--

