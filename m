Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C9941C624B4
	for <linux-mediatek@archiver.kernel.org>; Thu, 23 Nov 2023 17:18:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=4uuYv4ivuEW0QNa8dUnLLuSPDWYlT69BIfr2llFRLnY=; b=INNXf6HtGe1eoWCRnuvTjdht82
	Hg3Q5GEVVCaZY6FuZQUXH34O3W9ErX/r7muvq5KJOiDj7S5p5f0OXCe2Br+OThmbS1e4vHN1z/tPY
	J3xUDpa3taZra4ZPTgHUXOyTPdgyiE0qR6/6LaQQnI0329ydbLA4Hf18r5CDHT7GgnMS660Iu9gYB
	kezmitJVlSU6G1RbVLlvERmOW0K5xXkmt2/dgqQx88e4dKxyVEMrpRI1gEhZZnegMbYx6b/JLz6aS
	Yu9cMQA/YIdzROJPJSHmUvv4QlXU3nsmFnK12URzgIW4oLgUo1o6tGeo3GiC8HyJihuGOJY2g7NhJ
	qptvzYWQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1r6DLb-005OXp-22;
	Thu, 23 Nov 2023 17:18:39 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1r6DLY-005OVv-18;
	Thu, 23 Nov 2023 17:18:37 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 1B92F62272;
	Thu, 23 Nov 2023 17:18:35 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4B6FEC433C9;
	Thu, 23 Nov 2023 17:18:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1700759914;
	bh=4uuYv4ivuEW0QNa8dUnLLuSPDWYlT69BIfr2llFRLnY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=VciWPKaDUoyUh1FepWZVBgnEAvCej2jGYm2TSGV21kR6rxT2wHdKYHWulmTMoEseV
	 QJusH27Z2ZudBxQ1B7xUrUc9F4ScACAMaLstO7vxgwRI77pW+krMbgdRx0Rrp9b8Q1
	 PNEsnqINMuYcAspPMGU0UN0hwXfgGqIxek4NNPZ/xITtRw2uXqBEuyw7S+v9NBAcFo
	 L0HW1CeTZJra/bOWhtwwHUl9sKInrZ7VuduC4xYij7KkMbxYpWUawG84Z046Kzoo14
	 R4WVMicENkQ6N3XbwHcxg/0VgPHaVVXdNT7du6iXWx1pXsOn8M4QQRqCGmpN4EhRX6
	 VePnpFLDsd0nQ==
Date: Thu, 23 Nov 2023 17:18:28 +0000
From: Conor Dooley <conor@kernel.org>
To: Michael Walle <mwalle@kernel.org>
Cc: Chun-Kuang Hu <chunkuang.hu@kernel.org>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Chunfeng Yun <chunfeng.yun@mediatek.com>,
	Vinod Koul <vkoul@kernel.org>,
	Kishon Vijay Abraham I <kishon@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Jitao Shi <jitao.shi@mediatek.com>,
	Xinlei Lee <xinlei.lee@mediatek.com>,
	dri-devel@lists.freedesktop.org, linux-mediatek@lists.infradead.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, linux-phy@lists.infradead.org
Subject: Re: [PATCH 1/4] dt-bindings: display: mediatek: dsi: add compatible
 for MediaTek MT8195
Message-ID: <20231123-wipe-starch-741e674c1f54@spud>
References: <20231123133749.2030661-1-mwalle@kernel.org>
 <20231123133749.2030661-2-mwalle@kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="gjaPXcNp/j7dUovY"
Content-Disposition: inline
In-Reply-To: <20231123133749.2030661-2-mwalle@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231123_091836_441104_5DB7EBBC 
X-CRM114-Status: UNSURE (   9.58  )
X-CRM114-Notice: Please train this message.
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


--gjaPXcNp/j7dUovY
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Nov 23, 2023 at 02:37:46PM +0100, Michael Walle wrote:
> Add the compatible string for MediaTek MT8195 SoC, using the same DSI
> block as the MT8183.
>=20
> Signed-off-by: Michael Walle <mwalle@kernel.org>

Acked-by: Conor Dooley <conor.dooley@microchip.com>

--gjaPXcNp/j7dUovY
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZV+JYwAKCRB4tDGHoIJi
0k5mAQDNhAGJgE8ZQcNenl97mgSMbjnMQQZT1j8Z6HsCMI1JeQEAm8dsDuvsCcp8
mPJKmSYIoy4Aes//J8lAQpbhat4N6wY=
=3Y9w
-----END PGP SIGNATURE-----

--gjaPXcNp/j7dUovY--

