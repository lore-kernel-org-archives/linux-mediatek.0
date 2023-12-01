Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C2F91C4167B
	for <linux-mediatek@archiver.kernel.org>; Fri,  1 Dec 2023 16:46:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=bWNWTh4zM4mt62Xk2PwSANGoZfcmXMpCNGICYA3qX4I=; b=DwhWQ8UQWvnAcPj+dP6egp8T5A
	9pie3KNLlmkQ+eFcxcvib1wngzm6fKSUmk/QCVhgGOPwEiVn9rbEK6ZWVWsfMJhnIlHm4x01nC6mG
	qNmJKrrqURCwHYOWc990oxj+9vCcqWlUZhaAYfuQijsGbDSIOxfA8pllvRohVqqvP4RBHzP3lOjJf
	J3lvLo+qGYIpWYbw9Lmnh0olsQnSJVTi7Zbuk0z59SZdiOe0vFHPcMJJ8gVr8MLmb2PszzHVYYoXl
	538kC1YVmy4SLx65f8zP+C2hT50JGPOrBXKZFGL6UgwgnmlUlbou1G/NQT29p3hhrDjLpeTLxbLOq
	hfyFrBdQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1r96en-00EF8g-1W;
	Fri, 01 Dec 2023 16:46:25 +0000
Received: from ams.source.kernel.org ([2604:1380:4601:e00::1])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1r96eh-00EF5X-2n;
	Fri, 01 Dec 2023 16:46:22 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by ams.source.kernel.org (Postfix) with ESMTP id 89528B84806;
	Fri,  1 Dec 2023 16:46:18 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 48D10C433C9;
	Fri,  1 Dec 2023 16:46:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1701449177;
	bh=LFxpOweV7KVhHEesZpu+S1zzkJsuWf07I3KrLAutqs8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=GqkLVWvE/Dk4oW6RsREi2JzmNu2WivSa24e+YqDv01BLNe8eoLZDQjCrMDPRHBHF1
	 Jii8aN5YItrcg7bA7JLNwLNT7B1F36xrV1lTG++opE+eW2yQz0IyV/kxTjtdWe6uKl
	 spmKDScf9fbukaDmt3BQXmuhsOjrOhRu939AKtI7l1vl8bfYQ2yvW+0bPj/v7Atvl6
	 mZYCT5WpQ8iPjNeX7ENlYjz4S0rZFGhnuh2gEr71DfpSJQM1af1s0gfv+waNnG47Fh
	 j8kC4t5PbGm8QvtaKSw1vqZJFw5O0UDXbjxPl1iufsqn7y5vQOykysZWCpLftzWpma
	 68wXM0zVIan1Q==
Date: Fri, 1 Dec 2023 16:46:09 +0000
From: Conor Dooley <conor@kernel.org>
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc: Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org, Andrew Davis <afd@ti.com>,
	Andrew Lunn <andrew@lunn.ch>, Arnd Bergmann <arnd@arndb.de>,
	Bjorn Andersson <andersson@kernel.org>,
	Chen-Yu Tsai <wens@kernel.org>,
	Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Heiko Stuebner <heiko@sntech.de>, Jonathan Corbet <corbet@lwn.net>,
	Konrad Dybcio <konrad.dybcio@linaro.org>,
	Michal Simek <michal.simek@amd.com>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Nishanth Menon <nm@ti.com>, Olof Johansson <olof@lixom.net>,
	=?utf-8?B?UmFmYcWCIE1pxYJlY2tp?= <zajec5@gmail.com>,
	linux-rockchip@lists.infradead.org,
	linux-samsung-soc@vger.kernel.org,
	linux-amlogic@lists.infradead.org, linux-arm-msm@vger.kernel.org,
	workflows@vger.kernel.org, linux-doc@vger.kernel.org
Subject: Re: [PATCH v3] docs: dt-bindings: add DTS Coding Style document
Message-ID: <20231201-thrive-gully-5260ab07b352@spud>
References: <20231125184422.12315-1-krzysztof.kozlowski@linaro.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="MfDi0fzK8bz3SQxU"
Content-Disposition: inline
In-Reply-To: <20231125184422.12315-1-krzysztof.kozlowski@linaro.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231201_084620_089641_1CA7F7B5 
X-CRM114-Status: GOOD (  10.17  )
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


--MfDi0fzK8bz3SQxU
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Sat, Nov 25, 2023 at 07:44:22PM +0100, Krzysztof Kozlowski wrote:
> +Indentation
> +-----------
> +
> +1. Use indentation according to :ref:`codingstyle`.

One thing Jonathan mentioned before to me was to drop this :ref: stuff.
| > +:ref:`devicetree-abi` more information on the ABI.
|=20
| ...can just be written as "Please see
| Documentation/devicetree/bindings/ABI.rst".  The cross-reference link
| will be generated as expected, and readers of the plain-text docs don't
| have to go grepping to find the reference.
https://lore.kernel.org/all/87bki23rbx.fsf@meer.lwn.net/

Apparently the doc generation scripting can automagically do the right
thing here:
https://docs.kernel.org/process/maintainer-soc.html#devicetree-abi-stability

Cheers,
Conor.

--MfDi0fzK8bz3SQxU
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZWoN0QAKCRB4tDGHoIJi
0j9wAQDnyvYZgmaO0R7WxLXB+G3r+OjlxJNGnsVe1AuYO3IFJAD7BhbA4vqCT0nw
+WHXQA71Ia5T1lkozqxKhBUILq7PPAw=
=V0a1
-----END PGP SIGNATURE-----

--MfDi0fzK8bz3SQxU--

