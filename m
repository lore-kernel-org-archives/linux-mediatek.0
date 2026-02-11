Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8C237ECD6EA
	for <linux-mediatek@archiver.kernel.org>; Wed, 11 Feb 2026 21:11:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Subject:Message-Id:
	References:In-Reply-To:To:Cc:From:MIME-Version:Content-Transfer-Encoding:
	Content-Type:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=bPPRhkitxlK//gTZRRsF5v2yRH8onuqOKwbqxx2J0AM=; b=IYam4Kf/e1zIBJeQFTlp9wDylq
	y+6/TqwO/cgw9MiK8mDteknJrobrxsVYP48qUkfF8E23CZ3aICQ9pcvloZ0qhg6mV8U8ZS7UI/Ig5
	YygzwQgYu7raTdIprY6rg2BkJsUjhhZGHTImyXQa9x3S6BQELXc9pqHGZiOFsBce9K+sUBRkROeei
	sv00sArs3OJwjqGNvFy0bCksyqciVZiWYnR55sW9/1SVi2osOH5D1Bb9gkFWi1gjeLK9/OsNCidBg
	aQ/w85RQvcqnh564WahVyTDZPvsj66haQkv2Qd1W72WnMbmXh+YFhgpkgSd0UP77MDVvSSSZE7vv+
	DkLpyQmw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vqHUM-000000013ph-2xBg;
	Wed, 11 Feb 2026 21:11:10 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vqHUI-000000013pE-3cpP
	for linux-mediatek@lists.infradead.org;
	Wed, 11 Feb 2026 21:11:07 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id CBB7E60018;
	Wed, 11 Feb 2026 21:11:05 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 634A3C4CEF7;
	Wed, 11 Feb 2026 21:11:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1770844265;
	bh=8BS0HjUZ2c2XIa09Dyj75cOKCDZd5+HLlSJGloTMoCY=;
	h=Date:From:Cc:To:In-Reply-To:References:Subject:From;
	b=sJdIJGOTEcR/pVqdOis0U72NT3kdqQiTVivMV3Hp6+Tnh4gEBuJ9M7ecacD8kDUlC
	 E4QnwLkF51qxA7SmFEAznZ6BzdzjSZ0Q/crsmMSPffPLjN452hh3zS54otYqgbOpeQ
	 emHeajY+TaK6mydY0JQ/Uq4DbYrQ8zG0iwXY7TTHUQR7yJ9vOxMZMq9nvxyxhrluhO
	 FnAJzM+J6LqNleggYWSC+Y+UNJhUuLdh5vwh0f2muWC95RiLaiEv9l3J2x5eWLb6LU
	 unUz5DQtVL3SlJjkZtO0vnZaKhihHmazKyc6oYTylesJGcq5511qbCN4fMrTinond4
	 /XrYo3gHB16bA==
Date: Wed, 11 Feb 2026 15:11:04 -0600
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
From: "Rob Herring (Arm)" <robh@kernel.org>
Cc: linux-wireless@vger.kernel.org, linux-mediatek@lists.infradead.org, 
 Allen Ye <allen.ye@mediatek.com>, Felix Fietkau <nbd@nbd.name>, 
 devicetree@vger.kernel.org
To: Ryder Lee <ryder.lee@mediatek.com>
In-Reply-To: <4111ba0734fc7818f899db0bea08e3428eb536d5.1770836705.git.ryder.lee@mediatek.com>
References: <8fa8ec500b3d4de7b1966c6887f1dfbe5c46a54c.1770836705.git.ryder.lee@mediatek.com>
 <4111ba0734fc7818f899db0bea08e3428eb536d5.1770836705.git.ryder.lee@mediatek.com>
Message-Id: <177084426457.3906539.9556948985092789939.robh@kernel.org>
Subject: Re: [PATCH v4 2/2] dt-bindings: net: wireless: mt76: clarify
 backoff limit usage
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


On Wed, 11 Feb 2026 11:14:30 -0800, Ryder Lee wrote:
> Clarify the usage of path backoff limit properties in mt76 binding.
> Add explicit documentation for old generation (mt7915, mt7916, mt7981,
> mt7986) and new generation (mt7990, mt7992, mt7996) devices, including
> the difference in beamforming and non-beamforming entries.
> 
> Rephrase the paths-ru/paths-ru-bf description to reflect the actual
> usage.
> 
> Co-developed-by: Allen Ye <allen.ye@mediatek.com>
> Signed-off-by: Allen Ye <allen.ye@mediatek.com>
> Signed-off-by: Ryder Lee <ryder.lee@mediatek.com>
> ---
> v1-v3: none
> 
> v4:
> - revise commit message
> - use PCI id as the compatible string to replace "connac2/3"
> ---
>  .../bindings/net/wireless/mediatek,mt76.yaml  | 21 +++++++++++++++++++
>  1 file changed, 21 insertions(+)
> 

My bot found errors running 'make dt_binding_check' on your patch:

yamllint warnings/errors:
./Documentation/devicetree/bindings/net/wireless/mediatek,mt76.yaml:30:23: [error] missing starting space in comment (comments)
./Documentation/devicetree/bindings/net/wireless/mediatek,mt76.yaml:31:23: [error] missing starting space in comment (comments)
./Documentation/devicetree/bindings/net/wireless/mediatek,mt76.yaml:32:23: [error] missing starting space in comment (comments)
./Documentation/devicetree/bindings/net/wireless/mediatek,mt76.yaml:33:23: [error] missing starting space in comment (comments)
./Documentation/devicetree/bindings/net/wireless/mediatek,mt76.yaml:34:23: [error] missing starting space in comment (comments)

dtschema/dtc warnings/errors:

doc reference errors (make refcheckdocs):

See https://patchwork.kernel.org/project/devicetree/patch/4111ba0734fc7818f899db0bea08e3428eb536d5.1770836705.git.ryder.lee@mediatek.com

The base for the series is generally the latest rc1. A different dependency
should be noted in *this* patch.

If you already ran 'make dt_binding_check' and didn't see the above
error(s), then make sure 'yamllint' is installed and dt-schema is up to
date:

pip3 install dtschema --upgrade

Please check and re-submit after running the above command yourself. Note
that DT_SCHEMA_FILES can be set to your schema file to speed up checking
your schema. However, it must be unset to test all examples with your schema.


