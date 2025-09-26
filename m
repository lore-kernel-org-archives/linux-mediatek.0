Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C5107CAC5AE
	for <linux-mediatek@archiver.kernel.org>; Fri, 26 Sep 2025 14:55:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=YlHLkEbSJhpN8X8CBqIKJC8pNsm9nxHoaFK6d+v92AY=; b=WHlzUb6Kr/QTFltxOYspBCjhjk
	JG1N8Ud7mTFRH4OrxU6/bBSByPnrahD+LTW/C0E/x4x9Tzara/ri84HK4i/1fhEJO9nWO8AFyMtT5
	z920mUGYK1CrCGQ2BAlLUN6/iPaYobLIaxNrHCGY92KOFfdCrHogtxbWk0Hg+z4dpJL/On6wIxrrw
	GFPQQ7iKMkyxom/aCnXfmqyOqcJLLwfdbxS8zcELbdEoN0R0tWLCo26bvImB6MacABYfOG+k2+9f1
	zxXzO7G/iXo06WsqD66d0OpQgFh06IczkO8DGUhl2bqx9iSiLSf61RU6g1x5n8jkmvT1ljGMlWZIt
	4ETbT06g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v29rM-00000002BgI-2jJI;
	Fri, 26 Sep 2025 14:55:44 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v29rK-00000002BfW-14mm;
	Fri, 26 Sep 2025 14:55:43 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id AFEE6403A3;
	Fri, 26 Sep 2025 14:55:41 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7740BC4CEF4;
	Fri, 26 Sep 2025 14:55:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1758898541;
	bh=8gj65qVHmn8vegx9eirL41njLH2RQUiHZwCiJ5RZXJA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=VsIMOILFvZt3zXiMnd+saoKFhSWh5zztX+Vkpu8GCGi2SCm9njFLFhSnDPSmZNwfv
	 SYleGKAfg2B6nSMO8jJOkRwZp/YHbS3Dr++PLIQK9xXPglOmsI0R5WQNP2dlWAPC4M
	 CeYuH+O4NbFWXni5LxPXR2/gc+hdGL1MGw2FeR0+dBAJxE0z96ICowzveFhLAzoCCQ
	 caFPk/ln35737kfe6I5VenX7KEpnjhPImpeJLdZsFbaPNnPu1+BwId6SjWg1PLHdN6
	 XmdlDWwHpw9tCsGkQIr52V/rybBVS936X3o7QcSxbt5TXrYmxM61F4u9YpWu1twaIP
	 71oqhq8XgRDeg==
Date: Fri, 26 Sep 2025 09:55:40 -0500
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Christian Marangi <ansuelsmth@gmail.com>
Cc: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	"David S. Miller" <davem@davemloft.net>,
	linux-arm-kernel@lists.infradead.org,
	John Crispin <john@phrozen.org>, linux-mediatek@lists.infradead.org,
	linux-watchdog@vger.kernel.org,
	Herbert Xu <herbert@gondor.apana.org.au>,
	Felix Fietkau <nbd@nbd.name>, Conor Dooley <conor+dt@kernel.org>,
	linux-crypto@vger.kernel.org,
	Matthias Brugger <matthias.bgg@gmail.com>,
	linux-kernel@vger.kernel.org, Guenter Roeck <linux@roeck-us.net>,
	Wim Van Sebroeck <wim@linux-watchdog.org>,
	devicetree@vger.kernel.org,
	Krzysztof Kozlowski <krzk+dt@kernel.org>
Subject: Re: [PATCH v3 3/4] dt-bindings: arm64: dts: airoha: Add AN7583
 compatible
Message-ID: <175889851158.762885.9694825397072529711.robh@kernel.org>
References: <20250925164038.13987-1-ansuelsmth@gmail.com>
 <20250925164038.13987-4-ansuelsmth@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250925164038.13987-4-ansuelsmth@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250926_075542_315541_60AAA518 
X-CRM114-Status: GOOD (  11.83  )
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


On Thu, 25 Sep 2025 18:40:36 +0200, Christian Marangi wrote:
> Add Airoha AN7583 compatible to the list of enum for Airoha Supported
> SoCs.
> 
> Signed-off-by: Christian Marangi <ansuelsmth@gmail.com>
> ---
>  Documentation/devicetree/bindings/arm/airoha.yaml | 4 ++++
>  1 file changed, 4 insertions(+)
> 


Please add Acked-by/Reviewed-by tags when posting new versions. However,
there's no need to repost patches *only* to add the tags. The upstream
maintainer will do that for acks received on the version they apply.

If a tag was not added on purpose, please state why and what changed.

Missing tags:

Acked-by: Rob Herring (Arm) <robh@kernel.org>




