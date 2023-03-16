Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 66B98C7618A
	for <linux-mediatek@archiver.kernel.org>; Thu, 16 Mar 2023 19:56:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=1RCt5SMHlCLzai9nDrxImMSmlQdxkZfxHtVaCzlVb2M=; b=2kTn9UXoyIlmif25AbsrSfdhS1
	Lb9UDHDLS/Qug8q6TxwOp+uQgnZH2XaeIpDrSrOQPISllqoQyQhZKD9fkLgPQ4n7KQmmQ9kRAOxKX
	IdCFVGQXwMix4JfwNopTuvlUQdkvbd/fXpstQkJIvs1tx3AGF8m+1Io4uageKtDrzmxejVg5Tyqfd
	Q8NXJE7Davcda216YJUZc50M7fA7LOmKGocXxkG7eS/q/gEmEL58kCkEOpIIApZwhn9jCRQ2HllLS
	JhYq72LLSkdMwfj7SZcxK3nVWFwpazS3TIO8OkfIFk4vQhMUdkGDUigaMlvlxbIsB7Zb2odw/Swny
	nQoiniIA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pctiD-00HRFa-0b;
	Thu, 16 Mar 2023 19:56:33 +0000
Received: from ams.source.kernel.org ([145.40.68.75])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pcti7-00HRDC-2G;
	Thu, 16 Mar 2023 19:56:29 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.source.kernel.org (Postfix) with ESMTPS id 4ADC5B82345;
	Thu, 16 Mar 2023 19:56:26 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 65BB3C433D2;
	Thu, 16 Mar 2023 19:56:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1678996585;
	bh=Mjf/KOZq0pMQaPecTwlIVOhjm3xmKHBctWt8QlLAcHc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=F8Ktkl4li+H+BQcTVPzIZ4gDRSy0viZroe8cQ0NMtigOoqSBfULZ1Qc8ttdNt55EK
	 veK5RsBcVhhfiU4YK1If2w4nj8cZC+JwWCagbY/0xq/K4qZH/jNaY12hyOJOB8HUMo
	 M2ZlEtZf2zWH3cFBv02XSmIb2Cd5sH6pJsGcQrrRfUHivtbWn0K4VaSamYjqa3J46V
	 7kHDzq+BmNPjzIp5CdQLP2VPMMWPQIRM2B+tNcwO0FA3s1td9fIPomkN1TFC6t+/tC
	 T2XZ5OmZNoYqBXKfFeR88gxWmJlIcqWpy2Fvr82SomCkVlYULxZVwhOPeArFsJm2L/
	 5FWGREUZ83rWQ==
Date: Thu, 16 Mar 2023 20:56:21 +0100
From: Wolfram Sang <wsa@kernel.org>
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc: Benson Leung <bleung@chromium.org>, Guenter Roeck <groeck@chromium.org>,
	Qii Wang <qii.wang@mediatek.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Andreas =?utf-8?Q?F=C3=A4rber?= <afaerber@suse.de>,
	Manivannan Sadhasivam <mani@kernel.org>,
	Ard Biesheuvel <ardb@kernel.org>,
	Michal Simek <michal.simek@xilinx.com>, linux-i2c@vger.kernel.org,
	chrome-platform@lists.linux.dev, linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	linux-actions@lists.infradead.org
Subject: Re: [PATCH 2/5] i2c: owl: drop of_match_ptr for ID table
Message-ID: <ZBN0ZfrNlf7OvhBP@shikoro>
Mail-Followup-To: Wolfram Sang <wsa@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
	Benson Leung <bleung@chromium.org>,
	Guenter Roeck <groeck@chromium.org>,
	Qii Wang <qii.wang@mediatek.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Andreas =?utf-8?Q?F=C3=A4rber?= <afaerber@suse.de>,
	Manivannan Sadhasivam <mani@kernel.org>,
	Ard Biesheuvel <ardb@kernel.org>,
	Michal Simek <michal.simek@xilinx.com>, linux-i2c@vger.kernel.org,
	chrome-platform@lists.linux.dev, linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	linux-actions@lists.infradead.org
References: <20230311111658.251951-1-krzysztof.kozlowski@linaro.org>
 <20230311111658.251951-2-krzysztof.kozlowski@linaro.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="XGyxLH46S7knRnsx"
Content-Disposition: inline
In-Reply-To: <20230311111658.251951-2-krzysztof.kozlowski@linaro.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230316_125628_048984_617B819E 
X-CRM114-Status: GOOD (  11.64  )
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


--XGyxLH46S7knRnsx
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Sat, Mar 11, 2023 at 12:16:55PM +0100, Krzysztof Kozlowski wrote:
> The driver can match only via the DT table so the table should be always
> used and the of_match_ptr does not have any sense (this also allows ACPI
> matching via PRP0001, even though it might not be relevant here).
>=20
>   drivers/i2c/busses/i2c-owl.c:510:34: error: =E2=80=98owl_i2c_of_match=
=E2=80=99 defined but not used [-Werror=3Dunused-const-variable=3D]
>=20
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Applied to for-next, thanks!


--XGyxLH46S7knRnsx
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmQTdGUACgkQFA3kzBSg
KbboYA//Z5E08lbBDwpJ6X1vQt8t3Z2sDrHAfPePOJDVRBs0Npo+1i7Vemp2/AJX
RpRq7CjTyxrzi/NVHBAoUi0vT91RNVtqvLcxy3hLQ+REdLdNub+90blP0nFmp0Bj
cGSyDIZD3HQBBVAJqCKuQMcB8wd0eCdx3GzEjkWUHWS8iyRIOTRH6ucdOpwyoy1s
1qkc6zbB+ZReGZ5ULiLO4qOH4LWoLX/i44O/BTcvoqN2Ulel+x29rGSVxmopX5ua
L91VWKMdFaAvZ2xIbw9jc+esWJbZT8YOBecavdgTaFnB6fqNgkXPuyoK3PLiFCHh
Fvnl8KxFMuHZh7Cuf8bMywY62Ru7iIruDkUSVMTCYs7n4Gu7fZD8pozyxum3J0DG
wVwZuPZufXXO3WZpGlLUda8gqINkJVoS3ewTViAl5JLfm/CTsnesnYwcoHjApgR6
y9jIHq8K6/vzUhUjsUbe5hNMKlpMAQlyIUNgiEyXcIf14qxPpDeoMN47gJVS1aTI
/ADxL+JSzuq6yfFaRW7CgaLiVpEy5uU/qpH7H3+EQmxkNsXr1ia/fGbuaTA/rPZJ
N17o73EN7ue1VfhuLFXsNPSOvczHBnblwR27rjNMGwbIpWXYI1zX7AANFwOWY+Q6
MpoJZiQucgdQHlCv/qxiPQD2u+ru6OYth8Q/HAI668MquQQ5i0w=
=vj+r
-----END PGP SIGNATURE-----

--XGyxLH46S7knRnsx--

