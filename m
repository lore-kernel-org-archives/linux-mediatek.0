Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9FF35606A334
	for <linux-mediatek@archiver.kernel.org>; Wed, 18 Nov 2026 18:16:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=a84vqIz7;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=F59HeLYI
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=AgvyBS167J9o9WMsntkjSQWj0co7IV9m4kMQjrmygoc=; b=a84vqIz7YOloEhutmiIYdQH7Nw
	kxB6o9//dL0mb8LIjxiHy06jwWpIJ9QhNLZ9RP+ybu2S/Sq1n7l4iYx5y0Fz/i5uS6BFkmE3OZYfP
	lAbiBLf+9/N7HgqrWFC7IeviCpYBppNBhFL0VeoJeUYtl7+TDW0nBaOwzsvcDc54vy6GRLI5hlKro
	StUOBMCK/QY1hiGAUVCsSo/etvXNppaLSfmgBTIT3Ws08lkQbZMNHB+2WD7wztHaD29Mt7lYsImNc
	8yYsLsXB2PC+GYiayuFqAwbpVDwQIlMQocQBuh+5M6usm2REKn+rG/fqJPfByzrt+EryX+BpQoA/9
	uQTsWmWQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xTkCX-00000009sEV-43Fs;
	Wed, 18 Nov 2026 18:16:09 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xTkCX-00000009sEE-0qzk
	for linux-mediatek@lists.infradead.org;
	Wed, 18 Nov 2026 18:16:09 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id C299863692;
	Wed, 18 Nov 2026 18:16:07 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4B7D71F000C4;
	Wed, 18 Nov 2026 18:16:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795025767;
	bh=AgvyBS167J9o9WMsntkjSQWj0co7IV9m4kMQjrmygoc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=F59HeLYIOMBBqRGRNp11oQeN4a8t+lEOI6pdExKhBa7fyN8QScDx18oAY/9AH32QY
	 U1TjpKzXDhTQmEai9zsigG2yocTzhhuRqhFZFbf/hRo6uMbmv71PRfnNzf+37N9a9w
	 8LBr4V0QUThF6Yt3o/Nvd0alDq0PDaBAOGxVQYAzjXH9PhTHnJCgFC2c7/PvbW4qk2
	 5n34YafiqOpI0dGykE3v3fUi0aXxFBBRlOPMN+QkYhDOlInMG3ARldYhU5XzebCQqL
	 x3zuJN/p6DB8FIigaCTSres2DDwnuUpeYFyzCjvmdXhsy35cCHGHeNAuBR9pSr43I5
	 qeybfxFyCdepw==
Date: Wed, 18 Nov 2026 18:16:01 +0000
From: Conor Dooley <conor@kernel.org>
To: John Crispin <john@phrozen.org>
Cc: Lorenzo Bianconi <lorenzo@kernel.org>, Lee Jones <lee@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Linus Walleij <linusw@kernel.org>,
	Bartosz Golaszewski <brgl@kernel.org>,
	Ahmed Naseef <naseefkm@gmail.com>,
	Benjamin Larsson <benjamin.larsson@genexis.eu>,
	Christian Marangi <ansuelsmth@gmail.com>,
	devicetree@vger.kernel.org, lei.dong@airoha.com,
	Linqi.zhang@airoha.com, linux-gpio@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-mediatek@lists.infradead.org,
	mfd@lists.linux.dev,
	Mikhail Kshevetskiy <mikhail.kshevetskiy@iopsys.eu>,
	Rajeev.kumar@airoha.com, upstream@airoha.com, Weifeng.xu@airoha.com,
	zhengping.zhang@airoha.com
Subject: Re: [PATCH v3 7/9] dt-bindings: mfd: airoha: add AN7589 GPIO system
 controller
Message-ID: <20261118-shivering-urgency-89e5f5fcffd1@spud>
References: <20261116174854.342912-1-john@phrozen.org>
 <20261116174854.342912-8-john@phrozen.org>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="F8a/VxOGV5xQY5G+"
Content-Disposition: inline
In-Reply-To: <20261116174854.342912-8-john@phrozen.org>
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
X-Spam-Status: No, score=-10.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

--F8a/VxOGV5xQY5G+
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Acked-by: Conor Dooley <conor.dooley@microchip.com>
pw-bot: not-applicable

--F8a/VxOGV5xQY5G+
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCav3rYQAKCRB4tDGHoIJi
0uNJAPwJrnE8yRWxo2INvgOoRvj+xPEYFt39rdXS3Vnp+W7xYgEA5zgtlPrc+VEr
HaNNsN7ajr7Ua95/5diMW6s1RWEqWQw=
=G4rh
-----END PGP SIGNATURE-----

--F8a/VxOGV5xQY5G+--

