Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5EEEDC48BF8
	for <linux-mediatek@archiver.kernel.org>; Thu, 22 Feb 2024 05:03:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Date:To:From:
	Subject:References:In-Reply-To:Content-Transfer-Encoding:MIME-Version:
	Content-Type:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=enf5/IVeYMNDehryU/3ZMg5SHL/howmfENfbcpvNnmk=; b=ncSYNvmp/G3e57e+9bgZ7qhtV4
	WI8RXz82shrcYPzpJjPlK2JPkvD8ufITEDs3dM6T9Ng3BPBgmLJCdAkVPMxYxMQl0BDuj1wvxGbjx
	D5zV1niD5z1IqrrKcxVnvCxMnFZCuBcU2WdvgoM5/QxvgR5G5PNo6gS1Wj5VUJ6CYVkJO2zjIp8mu
	muS6di8Kum6z/h44/ORhHyf+eKO8kpCH0mf+gDb1IY1NGVQ4WwlNy03uCvKaPkaYo8HoJQ0kIOE1A
	bN6uYhvaOzPH2/sTJcQz0nOmZk8+p9gdaW5MP65AZ+2YxYx5nTx3I59WJTCgy2Uq2cWMtWaVdhPqU
	7HPMGcPQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rd1Eb-00000003XhL-02WR;
	Thu, 22 Feb 2024 05:03:01 +0000
Received: from sin.source.kernel.org ([145.40.73.55])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rd1EN-00000003XcE-0hLB;
	Thu, 22 Feb 2024 05:02:48 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id 0F80DCE122F;
	Thu, 22 Feb 2024 05:02:45 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 378C0C433C7;
	Thu, 22 Feb 2024 05:02:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1708578164;
	bh=enf5/IVeYMNDehryU/3ZMg5SHL/howmfENfbcpvNnmk=;
	h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
	b=mpRDZKFVhs6qq0cVBPIlcNZghwLUnUYC1rxX7vmacx8Y3v/pkQDJxTsNAlldvyMZP
	 8//EOfUgh7X+wP12JmRYQM1u0pEHA3Lez/2ESA7R4jaLIU5uv8LCMpSa/UPHmvcRCR
	 JeO/hknX6obZzSlV+6KDt11PN6EPVRTBkgNIx7BYH129SVLoipcmgdICjrkraulWeS
	 1ussSgqmGFK9OUjWkXL303IvmmR6226pFhiieYZQq414mwtN9L2XPCMijjrhDOlEO0
	 Z0C3iNRHEB1F6zaytWwPijSKXiMueVN0rHSl/DqdInQuHQTqfbKFTQ6kpRuc5pzzsA
	 n3VDKX+JHRVTQ==
Message-ID: <e82d900ea88e0b63f14b0042677269d5.sboyd@kernel.org>
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20240201182409.39878-2-linux@fw-web.de>
References: <20240201182409.39878-1-linux@fw-web.de> <20240201182409.39878-2-linux@fw-web.de>
Subject: Re: [PATCH v4 1/2] dt-bindings: reset: mediatek: add MT7988 infracfg reset IDs
From: Stephen Boyd <sboyd@kernel.org>
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, Conor Dooley <conor+dt@kernel.org>, Frank Wunderlich <linux@fw-web.de>, Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Matthias Brugger <matthias.bgg@gmail.com>, Michael Turquette <mturquette@baylibre.com>, Philipp Zabel <p.zabel@pengutronix.de>, Rob Herring <robh+dt@kernel.org>
Date: Wed, 21 Feb 2024 21:02:42 -0800
User-Agent: alot/0.10
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240221_210247_468511_C3779263 
X-CRM114-Status: UNSURE (   7.36  )
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
Cc: devicetree@vger.kernel.org, Sam Shih <sam.shih@mediatek.com>, Daniel Golle <daniel@makrotopia.org>, linux-kernel@vger.kernel.org, Conor Dooley <conor.dooley@microchip.com>, linux-mediatek@lists.infradead.org, linux-clk@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

Quoting Frank Wunderlich (2024-02-01 10:24:08)
> From: Frank Wunderlich <frank-w@public-files.de>
>=20
> Add reset constants for using as index in driver and dts.
>=20
> Value is starting again from 0 because resets are used in another device
> than existing constants.
>=20
> Signed-off-by: Frank Wunderlich <frank-w@public-files.de>
> Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collab=
ora.com>
> Acked-by: Conor Dooley <conor.dooley@microchip.com>
> ---

Applied to clk-next

