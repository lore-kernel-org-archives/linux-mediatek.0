Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9EACFD2A52C
	for <linux-mediatek@archiver.kernel.org>; Wed, 16 Oct 2024 15:42:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Subject:Message-Id:
	References:In-Reply-To:Cc:To:From:MIME-Version:Content-Transfer-Encoding:
	Content-Type:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Fg3CpUrkJ3oexhf4ADUo2Et/SRVO9cENFfLqfG+CTUE=; b=3Th+si4PZ9QBN0Sk4GU7SqXIyH
	e4S0BnoMhQ2XPKdnCcFVyh2J1okci7ylzOcod/U65pSLucdAM2nBuI9c22/qy8spL3lYkryAeFQ9T
	knAqF9F7I6CZ2WWdip65CWSX083G7Yu4jIIlsBgnHvhwq1vvOLashw6bnYAR5ZXspsVEB51RXBlJ2
	y5I9upceFkbhI7EjnHasaWhDyx6yy09J3/ZO2fqVpQeOMJsHWfp+VXu+/Lr8KRTbi+G+e9h380Tx6
	cUAxAnvF/w7RYqd/QYIRXta+7RFB0VMo/BYau7904zJLha7NBKicwdW8XaidmkcPKxSZBC16HvHLC
	oZVlGHBw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t16AD-0000000CHoI-2XIj;
	Wed, 16 Oct 2024 15:42:17 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t166c-0000000CHCx-1R7a;
	Wed, 16 Oct 2024 15:38:35 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 6C91B5C5D3F;
	Wed, 16 Oct 2024 15:38:29 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4502EC4CEC7;
	Wed, 16 Oct 2024 15:38:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1729093113;
	bh=dFW8u8wREC5V/rE4CPEL3TXXHyVXddI7PBsgSDXHwTM=;
	h=Date:From:To:Cc:In-Reply-To:References:Subject:From;
	b=I6ZyP12hU9L6hiBtylHFmizE+cd2yG3IZLUQTA3nmpFMGeAdr02jM6p0dMcfaklMs
	 Vf9+YyPNTy2j1ZkKaIKGnCG/wD7TzTD7meVPIU5kT5tO0tM5s3kcmqRP+BQRADvwGP
	 UpC5ncTZ1BKst5FUFa2lkvY8h+TM1F1S6U1yMRAFinzR/GjUEBUteaqwJxr4XNi4kx
	 TqFv6KMho9uPIPS0+W21HQesrR3TaB3JqQjXqfT6GasoXsIbmyMxSg+BU6bZu26UAi
	 dke3/kEzJNQ62V8oJFGkfWI5udhRBN+frLhNIgrZpcqM/7/al+RDl4W+o3/dbKFx75
	 m/l1Lmi7OQojA==
Date: Wed, 16 Oct 2024 10:38:32 -0500
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
From: "Rob Herring (Arm)" <robh@kernel.org>
To: =?utf-8?q?N=C3=ADcolas_F=2E_R=2E_A=2E_Prado?= <nfraprado@collabora.com>
Cc: kernel@collabora.com, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, 
 Jianguo Zhang <jianguo.zhang@mediatek.com>, 
 Hsuan-Yu Lin <shane.lin@canonical.com>, 
 fanyi zhang <fanyi.zhang@mediatek.com>, netdev@vger.kernel.org, 
 Macpaul Lin <macpaul.lin@mediatek.com>, Conor Dooley <conor+dt@kernel.org>, 
 Matthias Brugger <matthias.bgg@gmail.com>, devicetree@vger.kernel.org, 
 linux-mediatek@lists.infradead.org, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Richard Cochran <richardcochran@gmail.com>, 
 Pablo Sun <pablo.sun@mediatek.com>
In-Reply-To: <20241015-genio700-eth-v1-0-16a1c9738cf4@collabora.com>
References: <20241015-genio700-eth-v1-0-16a1c9738cf4@collabora.com>
Message-Id: <172909289110.1676363.14494745221795348933.robh@kernel.org>
Subject: Re: [PATCH 0/2] Enable Ethernet on the Genio 700 EVK board
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241016_083834_455466_D5AF9A23 
X-CRM114-Status: GOOD (  13.75  )
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


On Tue, 15 Oct 2024 14:15:00 -0400, Nícolas F. R. A. Prado wrote:
> The patches in this series add the ethernet node on mt8188 and enable it
> on the Genio 700 EVK board.
> 
> The changes were picked up from the downstream branch at
> https://git.launchpad.net/~canonical-kernel/ubuntu/+source/linux-mtk/+git/jammy,
> cleaned up and split into two commits.
> 
> Signed-off-by: Nícolas F. R. A. Prado <nfraprado@collabora.com>
> ---
> Nícolas F. R. A. Prado (2):
>       arm64: dts: mediatek: mt8188: Add ethernet node
>       arm64: dts: mediatek: mt8390-genio-700-evk: Enable ethernet
> 
>  arch/arm64/boot/dts/mediatek/mt8188.dtsi           | 95 ++++++++++++++++++++++
>  .../boot/dts/mediatek/mt8390-genio-700-evk.dts     | 25 ++++++
>  2 files changed, 120 insertions(+)
> ---
> base-commit: 7f773fd61baa9b136faa5c4e6555aa64c758d07c
> change-id: 20241015-genio700-eth-252304da766c
> 
> Best regards,
> --
> Nícolas F. R. A. Prado <nfraprado@collabora.com>
> 
> 


My bot found new DTB warnings on the .dts files added or changed in this
series.

Some warnings may be from an existing SoC .dtsi. Or perhaps the warnings
are fixed by another series. Ultimately, it is up to the platform
maintainer whether these warnings are acceptable or not. No need to reply
unless the platform maintainer has comments.

If you already ran DT checks and didn't see these error(s), then
make sure dt-schema is up to date:

  pip3 install dtschema --upgrade


New warnings running 'make CHECK_DTBS=y mediatek/mt8390-genio-700-evk.dtb' for 20241015-genio700-eth-v1-0-16a1c9738cf4@collabora.com:

arch/arm64/boot/dts/mediatek/mt8390-genio-700-evk.dtb: jpeg-decoder@1a040000: iommus: [[118, 685], [118, 686], [118, 690], [118, 691], [118, 692], [118, 693]] is too long
	from schema $id: http://devicetree.org/schemas/media/mediatek-jpeg-decoder.yaml#






