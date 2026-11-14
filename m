Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 302FC606A333
	for <linux-mediatek@archiver.kernel.org>; Sat, 14 Nov 2026 13:28:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=LYsteVhZ;
	dkim=pass (1024-bit key, unprotected) header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=wBAQqr1U
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:References:In-Reply-To:To:
	Subject:Message-ID:From:Content-Transfer-Encoding:Content-Type:Date:
	MIME-Version:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=gT8R01frXqoIJvl9RGVpwuWi3b4gIIdQyqgCn7ucTZU=; b=LYsteVhZL7i6n/eCBYolFs07Nb
	0w2jxW7IKzmlgf3E5h6JYHTRhC9YSYLBoCOP78CXyEPU5KnGkyo+6LnIZ/NNdj1YALh2YMJQ3/kCE
	PdwZI0I0qPA3fAVzOhmK9Strzb2MNMtOlwdYT4QGs5vAawKDGpsQIfWGiNUKm1MhIkvKouxD1Jos1
	kkVHa7QtQa64PtTg+ie8+WKjW85JAuxj7FV2iNYuz/U5uYPgQ9yND/XM3p24m2ZwbPHMzgSwC/L2T
	HMdDn0jKgCCgSeGjBcF0z+KlCvY40a7canF3Z0qvXoa/CbKhmi9qERIvjaPdJUciQ3+RCE2j8Tg1I
	pQBa0W1A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xSDnY-0000000G76Z-3gZs;
	Sat, 14 Nov 2026 13:28:04 +0000
Received: from out-42.mta1.migadu.com ([95.215.58.42] helo=mta1.migadu.com)
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xSDnV-0000000G75Y-2vrP
	for linux-mediatek@lists.infradead.org;
	Sat, 14 Nov 2026 13:28:03 +0000
X-Envelope-To: linux-mediatek@lists.infradead.org
DKIM-Signature: a=rsa-sha256; bh=gT8R01frXqoIJvl9RGVpwuWi3b4gIIdQyqgCn7ucTZU=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1794662879; v=1; x=1795267679;
 b=wBAQqr1UDyU3stJVqU9DxG5eszmFIcq3qH+qxe9rHQHOh5WReHXL0sIEpiKTocxXHc/h852W
 Lv3v8ViWLsm8tfk8hsFZHv4fR78V47Jh8u7Es8iS50eMsSSsv83DbT+K8PeMZoV4iX9kMV5i5bk
 mE0u9rxlrzjmKBPSHY2Lj8Pw=
X-Envelope-To: linux-mediatek@lists.infradead.org
Received: by smtp.migadu.com with ESMTPS id 8b8a5b5b05980967;
	Sat, 14 Nov 2026 13:27:59 +0000
X-Mizu-Trace-ID: 8b8a5b5b05980967
X-Migadu-Flow: FLOW_OUT
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Date: Sat, 14 Nov 2026 13:27:58 +0000
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
From: "Frank Wunderlich" <frank.wunderlich@linux.dev>
Message-ID: <4427785e421caa5ceba5b64ceb7c7e4cfdb607ec@linux.dev>
TLS-Required: No
Subject: Re: [PATCH net-next v20 00/15] net: pcs: Introduce support for
 fwnode PCS
To: "Christian Marangi" <ansuelsmth@gmail.com>, "Maxime Chevallier"
 <maxime.chevallier@bootlin.com>, "Andrew Lunn" <andrew+netdev@lunn.ch>,
 "David S. Miller" <davem@davemloft.net>, "Eric Dumazet"
 <edumazet@kernel.org>, "Jakub Kicinski" <kuba@kernel.org>, "Paolo Abeni"
 <pabeni@redhat.com>, "Rob Herring" <robh@kernel.org>, "Krzysztof
 Kozlowski" <krzk+dt@kernel.org>, "Conor Dooley" <conor+dt@kernel.org>,
 "Simon Horman" <horms@kernel.org>, "Jonathan Corbet" <corbet@lwn.net>,
 "Shuah Khan" <skhan@linuxfoundation.org>, "Randy Dunlap"
 <rdunlap@infradead.org>, "Lorenzo Bianconi" <lorenzo@kernel.org>, "Heiner
 Kallweit" <hkallweit1@gmail.com>, "Russell King" <linux@armlinux.org.uk>,
 "Philipp Zabel" <p.zabel@pengutronix.de>, "Nathan Chancellor"
 <nathan@kernel.org>, "Nick Desaulniers" <ndesaulniers@google.com>, "Bill
 Wendling" <morbo@google.com>, "Justin Stitt" <justinstitt@google.com>,
 netdev@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org,
 llvm@lists.linux.dev
In-Reply-To: <20261114104426.235620-1-ansuelsmth@gmail.com>
References: <20261114104426.235620-1-ansuelsmth@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261114_052802_256168_919B1C9E 
X-CRM114-Status: UNSURE (   5.68  )
X-CRM114-Notice: Please train this message.
X-Spam-Score: -2.8 (--)
X-BeenThere: linux-mediatek@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-mediatek.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-mediatek/>
List-Post: <mailto:linux-mediatek@lists.infradead.org>
List-Help: <mailto:linux-mediatek-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mediatek>,
 <mailto:linux-mediatek-request@lists.infradead.org?subject=subscribe>
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
X-Spam-Status: No, score=-5.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS autolearn=no autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Am 14. November 2026 um 11:43 schrieb "Christian Marangi":
>=20
>=20This series introduce a most awaited feature that is correctly
> provide PCS with fwnode without having to use specific export symbol
> and additional handling of PCS in phylink.
>=20
>=20At times there were 2 different implementation (this and the one
> from Sean) but Sean agreed that this can be picked and used in favor
> of his implementation as long as his case with race condition is
> correctly handled.
Hi Christian

Thank you very much for taking care of this!

sorry for html mail (have not found setting to force to text in
linux.dev webmailer - if someone knows it please tell me).

@netdev maintainers:
is this now in shape enough to getting merged? or which part needs to be =
changed?

Some boards (e.g. mt7988a based) are stalled because not having network s=
upport
yet in last 2 LTS kernels due to this part is unclear/missing.

regards Frank

