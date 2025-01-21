Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AB4E7C02182
	for <linux-mediatek@archiver.kernel.org>; Tue, 21 Jan 2025 17:26:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=S3W7a9VUjLLF7r1+nzcT41cJzX0iut4Kv6V0hvau/Ok=; b=xgoxuIvMD4GZbyozJtWPyBCpJy
	lQEUDrEQnAiDIbNWkBGWnApguX3oS0oZs9pRkfa5DUekNFuJW7s7TZsjvgoS+98Gb5Uox9VNvrwWs
	A/XNFK18ZYhcDNGvXOdiae7zxNS0WFNNObNPazzp57BBVHhsOJB8ZE05jqOjw+GqwbkpvChnvNq8t
	ZocjS1sK3RGSwkduWx2o7si+jYoXBYWinc7rKp+1g1JHD6z528sIApb94CKl/IQnvLAS98lVxNajg
	svGBkvFr1rvGkxSRuH3DeJmXMZ1I6ZpBKG+66YkF7/EfRjSO4ZWhLkyZ+LMdiGLHHR1vq6jiUmTeA
	qTa8JsGg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1taI1G-00000008TH8-2qIT;
	Tue, 21 Jan 2025 17:26:30 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1taHzz-00000008T7i-01ep;
	Tue, 21 Jan 2025 17:25:12 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 227745C4A8B;
	Tue, 21 Jan 2025 17:24:28 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D646DC4CEDF;
	Tue, 21 Jan 2025 17:25:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1737480308;
	bh=S3W7a9VUjLLF7r1+nzcT41cJzX0iut4Kv6V0hvau/Ok=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=deGKfUGw/ZU86f8kQ56115ihAYlfj/xC/2OsTd60Tf9VQse+n7Qh8lA6w//xdYtPI
	 7TeARxhNzyiB3tXaP+hHCeXxlaw037M4XIvJ1pUl0CPaZQGaMjAr7Arsd1HjBg5byU
	 YoCqRv0vM6+Mo186lfv/AsHSIXQEgtKfCwzFpTion+WbRx5YajmcMPrWZWMw1jO+H6
	 G4IUXmyCDHu6InHsWlfA9i7vlI4aKxguy+rrUsVXNIS17DfrdmWBW0S0BZrDv8Vomd
	 gXbHy5f6qM2Pv76spGxPOyn1ri9n69ul84Fr5+tp9IGttFQxkkqkyeRys7LW/KVIJc
	 FFXQ6UwI2Y1gA==
Date: Tue, 21 Jan 2025 17:25:03 +0000
From: Conor Dooley <conor@kernel.org>
To: Chunfeng Yun <chunfeng.yun@mediatek.com>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Rob Herring <robh@kernel.org>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	Mathias Nyman <mathias.nyman@intel.com>, linux-usb@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 2/4] dt-bindings: usb: mtu3: add support mt8196
Message-ID: <20250121-monotone-almost-6783e9b84c79@spud>
References: <20250121145008.22936-1-chunfeng.yun@mediatek.com>
 <20250121145008.22936-2-chunfeng.yun@mediatek.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="JmWqviSEfWIjwwOl"
Content-Disposition: inline
In-Reply-To: <20250121145008.22936-2-chunfeng.yun@mediatek.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250121_092511_092537_4812F7DE 
X-CRM114-Status: GOOD (  11.30  )
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


--JmWqviSEfWIjwwOl
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Jan 21, 2025 at 10:50:06PM +0800, Chunfeng Yun wrote:
> There are three USB controllers on mt8196, each controller's wakeup
> control is different, add some specific versions for them, and add
> compatilbe for mt8196.
>=20
> Signed-off-by: Chunfeng Yun <chunfeng.yun@mediatek.com>

Acked-by: Conor Dooley <conor.dooley@microchip.com>

--JmWqviSEfWIjwwOl
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZ4/YbwAKCRB4tDGHoIJi
0i7jAQCavjjyh+Qpp+QoqcLU0QVGsL9cjBas1QZbQvg6DipQEwEA+jjel9pmIqcl
5rxZsQgBc1z2KT8MvA2RTt9FTHXj0gc=
=yG5o
-----END PGP SIGNATURE-----

--JmWqviSEfWIjwwOl--

