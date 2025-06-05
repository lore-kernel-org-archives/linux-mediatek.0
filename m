Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3F0BEC5B543
	for <linux-mediatek@archiver.kernel.org>; Thu,  5 Jun 2025 23:51:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Type:MIME-Version:References:Message-ID:Subject:To:From:Date:Reply-To
	:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=cr+K9fucicfn2CYUDinJHBaNUSA0IsCWffQRF+dMoVI=; b=kP7YONw7Nym7+p+8y3GjaHCVNh
	PDW0uNObFNKryagMyVjGTve51KrVRuKlT8jrgtzcDA1u7EFBjKIWZH5pxXOfr/UHKk381UjbCeevX
	N1+tHGRAETRP4Ji+gXACfQ/xL+m/DrwWV7fh+CXrzPhvTXwhJ6K+4gsDnt99/UPiRysTOFznS7A/H
	KOfIvvzOjzhvHQqNHcr+B81+LDeJ9gr33S9wUG+7fBlgJ2LC2j9zu7lpdHKgajrR9oZvQZOrAy48N
	16jZeeLX/Jg+eCH3ZkiaYoKiVeagZvJnPvgTpGmVmw6HGhwlcrIWCxBusmvix7oqn4MwDyfeSLbNJ
	tTGrEiIA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uNKMg-0000000GoEL-38YZ;
	Thu, 05 Jun 2025 23:51:18 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uNKKV-0000000Go7D-3M2O;
	Thu, 05 Jun 2025 23:49:03 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id E656D6154E;
	Thu,  5 Jun 2025 23:49:02 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 591DEC4CEE7;
	Thu,  5 Jun 2025 23:49:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1749167342;
	bh=g2l0xw2YqveNWEewJqmbBDGNV3httJi1IBdHEF4xqNY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=KIKNNcukSh03Z7tTG2B00Jbxsd9ShCS5ns2E1k/Q5BwUymKAeEZH+mSPgY3tXmluX
	 AHJq0j4RP0gZZdHRIcULT+Ajc0A7O7RVVfrxg8QcTjnAoH7nXht7KwVgdr+QC+voq9
	 mmD4zhiUWtnUiNfyqxLhPG/A7BBjP0SvtJPilvlwuJclyWqzSEXCbRki5UTWB1Tela
	 SgClrATKsUvE1vgTfUrERdWEj2YBLpEaHJrjFIrvoQTtJuD8DWt7+cvRgEtLU7znLh
	 BojgW4+O3py0R3wiG4CtIT935bFg752YtPArEg7qjVACgjhbe9tX+KBEa8VsfgjbH5
	 aDSUGiLvExMgQ==
Date: Thu, 5 Jun 2025 18:49:00 -0500
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Frank Wunderlich <linux@fw-web.de>
Subject: Re: [PATCH v2] dt-bindings: interconnect: add mt7988-cci compatible
Message-ID: <174916733838.3486621.4521189465385649614.robh@kernel.org>
References: <20250531112425.10525-1-linux@fw-web.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250531112425.10525-1-linux@fw-web.de>
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
Cc: devicetree@vger.kernel.org, Conor Dooley <conor+dt@kernel.org>, linux-pm@vger.kernel.org, linux-kernel@vger.kernel.org, Chanwoo Choi <cw00.choi@samsung.com>, Kyungmin Park <kyungmin.park@samsung.com>, MyungJoo Ham <myungjoo.ham@samsung.com>, linux-mediatek@lists.infradead.org, Johnson Wang <johnson.wang@mediatek.com>, Matthias Brugger <matthias.bgg@gmail.com>, Georgi Djakov <djakov@kernel.org>, Jia-Wei Chang <jia-wei.chang@mediatek.com>, Krzysztof Kozlowski <krzk+dt@kernel.org>, linux-arm-kernel@lists.infradead.org, AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org


On Sat, 31 May 2025 13:24:23 +0200, Frank Wunderlich wrote:
> From: Frank Wunderlich <frank-w@public-files.de>
> 
> Add compatible for Mediatek MT7988 SoC with mediatek,mt8183-cci fallback
> which is taken by driver.
> 
> Signed-off-by: Frank Wunderlich <frank-w@public-files.de>
> ---
> v2:
> - no RFC
> - drop "items" as sugested by conor
> ---
>  .../bindings/interconnect/mediatek,cci.yaml           | 11 ++++++++---
>  1 file changed, 8 insertions(+), 3 deletions(-)
> 

Acked-by: Rob Herring (Arm) <robh@kernel.org>


