Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E8A1DCFC500
	for <linux-mediatek@archiver.kernel.org>; Mon, 14 Oct 2024 07:13:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Type:MIME-Version:References:Message-ID:Subject:To:From:Date:Reply-To
	:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=6Qm6g/aQQBlLKhCbBTFxLRwcvRp63FrhJMqEiW7jVwQ=; b=POv0ywcnzKoU1yAO/QsABRM0GQ
	RIGeBlrqJ66JHXh859L0vYSV2bjfjo7Cql+Xr4KpAY0ElupgGijCW1ToMdYa/cIZaYWAwEHpsmkLk
	aPeMeWlWAZoTKaGsdX0Ye3dywM7lBbKv2CPSgwDziQ0GgbDDy5oNHi8NEyyve6uvgQaPn84kRkoPO
	HZ6ZWsHxbLO0UQnAvMwP65cF49MOGUYQw9ZSKAJsEwNokdRsz16jQ1JBiCPg3uC8oW5lY7ec/9p+9
	B99jKGZ3tz4CjnwVNVGQ8JMuaGn6usZLEcm8qBLiWLcKcFX9C3VSDbeIM5/rM4n6ffg54LX7glVpN
	a3P23Big==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t0FGw-000000040nn-3DJ8;
	Mon, 14 Oct 2024 07:13:42 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t0FEB-000000040Ix-2L2d;
	Mon, 14 Oct 2024 07:10:52 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 7AC4D5C569B;
	Mon, 14 Oct 2024 07:10:46 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B0F02C4CECE;
	Mon, 14 Oct 2024 07:10:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1728889850;
	bh=FJBw7ZIUo2NEVgH4S4KSccbKhXWxyCD67qRXO3xAU7Q=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=r1n09hrqqJiEuQhiatvDTOrzixrB9dCraf3ef+ILClbjfwsBa6VfGe+EG59mVBDdm
	 m8kF4J8tbv/p02MdqGLvsm9EfacOjWMhuL4KQ1AymCZVlZ9lHLqiJYclF0BVtFWVqv
	 qwGCzTo3lCxroZ6YAHm1UhwZv3r41fkn+sHopuDAY806I26FW0uniT9oY/ZERb9PP6
	 YYwq/D1UZ280sV54pLedGqD18xCICokr+2/8nGrgxWaWTkXvPNyaBP/BAntXEZK0zW
	 nzjpg5EQ0J0jSTo33Nk5/shKkvPCqBGhBXJnpJzgP56+QaZWARGN/ruYQXiXJ6MmiO
	 XVhJPXBY3xMtQ==
Date: Mon, 14 Oct 2024 09:10:46 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Frank Wunderlich <linux@fw-web.de>
Subject: Re: [PATCH v4 1/2] dt-bindings: mmc: mtk-sd: Add mt7988 SoC
Message-ID: <l4t7pgiuvnqb4dcpr6w7mmjkb2mvu5x3fdmid7txoi2gl6vv4h@75roixcfbamz>
References: <20241012143826.7690-1-linux@fw-web.de>
 <20241012143826.7690-2-linux@fw-web.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20241012143826.7690-2-linux@fw-web.de>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241014_001051_662828_446365A5 
X-CRM114-Status: GOOD (  10.25  )
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
Cc: Rob Herring <robh@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Wenbin Mei <wenbin.mei@mediatek.com>, john@phrozen.org, linux-mmc@vger.kernel.org, Ulf Hansson <ulf.hansson@linaro.org>, linux-kernel@vger.kernel.org, eladwf@gmail.com, devicetree@vger.kernel.org, linux-mediatek@lists.infradead.org, linux-arm-kernel@lists.infradead.org, daniel@makrotopia.org, Matthias Brugger <matthias.bgg@gmail.com>, Krzysztof Kozlowski <krzk+dt@kernel.org>, ansuelsmth@gmail.com, Chaotian Jing <chaotian.jing@mediatek.com>, AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On Sat, Oct 12, 2024 at 04:38:22PM +0200, Frank Wunderlich wrote:
> From: Frank Wunderlich <frank-w@public-files.de>
> 
> Add binding definitions for mmc on MT7988 SoC.
> 
> Signed-off-by: Frank Wunderlich <frank-w@public-files.de>
> ---
> v4:
> - drop minitems because of errors
> v3:
> - fixed minItems on clock-names too
> v2:
> - fixed minItems to 4
> ---
>  .../devicetree/bindings/mmc/mtk-sd.yaml       | 22 +++++++++++++++++++
>  1 file changed, 22 insertions(+)

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Best regards,
Krzysztof


