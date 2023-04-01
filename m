Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3F2D4C76196
	for <linux-mediatek@archiver.kernel.org>; Sat,  1 Apr 2023 00:05:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Date:To:Cc:From:Subject:
	References:In-Reply-To:Content-Transfer-Encoding:MIME-Version:Content-Type:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=3//4N+H2zlixopS/q0L8VFKmvqbCUxU8rRPQOQsTbuM=; b=OhkFLvIR82LRcC+Q50G7s3kVy7
	ZbguLKFsI0LWkEshHu5TYqONGTCUk8qGw4IkQmpgpDQj1llTnhbIDJreQ9leSqg6XyYUVs14KaFxG
	1cjqR2aGJto02df5+xL1RH+RHrFpfhHXG17RrD92IepyW3LufgRtkKD+76Ac+xYE8g34Tme77JCKy
	qePq2GJ5/TWND+HXZZ2DUNT64brXEE/GkhsraRXk7l8EI3KxTJpJZaI2iCzq+oZfTpxkhY8liH/ce
	AXc/90UNwQ9uwLOL/UhBPjAr5bN7+GuEMGpGQxb5MP/V7bDc0/nBS4oj+jpLzSg638z8Gs4bwcYlK
	04rl28YA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1piOkK-009Gfu-2V;
	Sat, 01 Apr 2023 00:05:28 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1piOjt-009GIy-0b;
	Sat, 01 Apr 2023 00:05:01 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Date:To:Cc:From:Subject:References:
	In-Reply-To:Content-Transfer-Encoding:MIME-Version:Content-Type:Message-ID:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=3//4N+H2zlixopS/q0L8VFKmvqbCUxU8rRPQOQsTbuM=; b=rRdju39EsPuF8IfSYEeIfsEkhW
	C44eje8SHofUBnVYIbs3g4rmX8h6Sbe0PY/7fI2ds2EDGmW4s5dTMopqE9KC2ocvX2GhHoKM/X+GH
	RJeX+waCwOItCAdNdykZIbPAHebUXeqOHSwaXTLoP491sLTclRPSE48LM4fHpgtt/kHtbvXs/oO/c
	yRoa8mrCxKpMN3xKwnmhe8hnOla5v2v3fDVoKoYqsaSjIjhO/EqbYwkQBapBtXLe2+v78CQouHKtg
	D+Mbu3jvho+Njqs07HfbgxomjN27zw77jn1mmj/PveSpJ8poOox8OJ1xD0u6U3b5yxdMDX+8+Ahu9
	d9pJbeaA==;
Received: from dfw.source.kernel.org ([139.178.84.217])
	by desiato.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1piOjh-007shi-0D;
	Sat, 01 Apr 2023 00:04:57 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id DE93E62CAD;
	Sat,  1 Apr 2023 00:04:43 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 418A2C433EF;
	Sat,  1 Apr 2023 00:04:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1680307483;
	bh=3//4N+H2zlixopS/q0L8VFKmvqbCUxU8rRPQOQsTbuM=;
	h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
	b=mscJ8ew9usNFwpGhzdTCCGf/vkuF0G4yTO8HGaaAKCiMlOt50hr83+J6KeWN8UorQ
	 bXjgS/7zTQDnpBAe4rHQIF9FlVvEXNKyn8rPOOjuJ4lSbT5IC2i5LhHenTAyEjhWW9
	 fffKzsCmnaxPYgK2aigMZ0kS+l+4zwR7pIj+DHsDThJUKL4UrTi+3cte3Xo7dge/fK
	 xmpOkOsVZ/mPPRF1rB4WhMn6Akgg4dObK7jNjOWoiXA/ka/QouWHzkIdLpmaYcIY2K
	 1GSWPBvEZdhzbFsUHhPnpMIuh5teFYvzPe1YdOm3xNsf65lmqTKwtKvym5pt7vg93n
	 myEkv7nEmjdkw==
Message-ID: <a0380b0ee4fd7ffd4ce99a973e344a7f.sboyd@kernel.org>
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20230331123621.16167-17-Garmin.Chang@mediatek.com>
References: <20230331123621.16167-1-Garmin.Chang@mediatek.com> <20230331123621.16167-17-Garmin.Chang@mediatek.com>
Subject: Re: [PATCH v8 16/19] clk: mediatek: Add MT8188 vppsys1 clock support
From: Stephen Boyd <sboyd@kernel.org>
Cc: Project_Global_Chrome_Upstream_Group@mediatek.com, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, linux-mediatek@lists.infradead.org, linux-clk@vger.kernel.org, netdev@vger.kernel.org, Garmin.Chang <Garmin.Chang@mediatek.com>
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, Garmin.Chang <Garmin.Chang@mediatek.com>, Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Matthias Brugger <matthias.bgg@gmail.com>, Michael Turquette <mturquette@baylibre.com>, Richard Cochran <richardcochran@gmail.com>, Rob Herring <robh+dt@kernel.org>
Date: Fri, 31 Mar 2023 17:04:41 -0700
User-Agent: alot/0.10
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230401_010449_727771_955AB1BD 
X-CRM114-Status: UNSURE (   7.13  )
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

Quoting Garmin.Chang (2023-03-31 05:36:18)
> Add MT8188 vppsys1 clock controller which provides clock gate
> controller for Video Processor Pipe.
>=20
> Signed-off-by: Garmin.Chang <Garmin.Chang@mediatek.com>
> Reviewed-by: Matthias Brugger <matthias.bgg@gmail.com>
> Reviewed-by: Chen-Yu Tsai <wenst@chromium.org>
> Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collab=
ora.com>
> ---

Applied to clk-next

