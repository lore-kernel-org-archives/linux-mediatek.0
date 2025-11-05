Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 46CF5CCFA07
	for <linux-mediatek@archiver.kernel.org>; Wed,  5 Nov 2025 09:14:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Date:Message-Id:Subject:
	References:In-Reply-To:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Zc+9+hTIs1OZSxLrflx1dy+rP5rwK/Pg8JKVK5p11BU=; b=SeGruAUfjJRims
	+kVKcft/fjtg8YWnGo8VCyNCvC3AEhGUMqvebeIsn4Y39PyLTyIliH2x3qsVHrAJ9bHd7E98hw3+S
	RblPSpuQ1vf8JP/awWvak9z4yxXWNVebxQY2AKIu4NVhuioxT5XqUTknSv8ulK1a4WKCpiI02l9KC
	diqtxqnzn8Jd3nbShSAyWrcDWDg76rDGVafT51UAjq167H1Q8aaQMDgrQ7qmTQQyiZI1JXG8a/sOj
	Jxi9ek4b+2qXECIer/g8bE+BGd1TsRmDiVnyvP98H9jTYw61Ct7SN1j4qeAz0EWZIYP5jRNHeQW2S
	goCT0Z9/qpLaQw55b7AQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vGZbE-0000000DMOQ-0IM0;
	Wed, 05 Nov 2025 09:14:40 +0000
Received: from bali.collaboradmins.com ([2a01:4f8:201:9162::2])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vGZbA-0000000DMNc-36cl;
	Wed, 05 Nov 2025 09:14:38 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1762334073;
	bh=qWtgovMFKiTMTHDBfS7Kxt4dQ9VFI2F4oQIKhJkL1jY=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=Z//sTn5cgHw750Qw6GxY5XREnvUNETEmFkS3svN8Y+59h7+pZt88kiAHz/G47pffY
	 QWaL2k7AHtjnpXrcMuvUJqv1R2UfglFDV0dt7hIV43tH2gG/gmimBSOhOYSf1rhc4D
	 dR065+SV4njc+oxNiFXJ8noBKGMa0MWKU/IO+E4/0VN23bslViMB7F4DT2pR7ETsyk
	 mJOD9Tvt8Ypt4kfd1WeubJp/2wjUTpX3cq2+JFCe3yKG8JztHPrn5IOOjw0Aaq9Onb
	 vxUjSm7DB7XyxM9sLF2A+aMrod/lsSZGURl17/u7pyApgFa9CJKTOtX5AoJPeI+1jL
	 IZUUIETtm/gSg==
Received: from IcarusMOD.eternityproject.eu (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id C2B6A17E128C;
	Wed,  5 Nov 2025 10:14:32 +0100 (CET)
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Jassi Brar <jassisinghbrar@gmail.com>, 
 Chun-Kuang Hu <chunkuang.hu@kernel.org>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>, 
 Jason-JH Lin <jason-jh.lin@mediatek.com>
In-Reply-To: <20251031155838.1650833-1-jason-jh.lin@mediatek.com>
References: <20251031155838.1650833-1-jason-jh.lin@mediatek.com>
Subject: Re: (subset) [PATCH 0/9] Add GCE support for MT8196 (series 1/4)
Message-Id: <176233407273.17051.14832672768529226895.b4-ty@collabora.com>
Date: Wed, 05 Nov 2025 10:14:32 +0100
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.14.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251105_011436_963661_E3CFDEE6 
X-CRM114-Status: UNSURE (   9.08  )
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
Cc: Jason-jh Lin <jason-jh.lin@mediatek.corp-partner.google.com>, devicetree@vger.kernel.org, Moudy Ho <moudy.ho@mediatek.com>, Xiandong Wang <xiandong.wang@mediatek.com>, Singo Chang <singo.chang@mediatek.com>, Chen-yu Tsai <wenst@chromium.org>, linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org, Nicolas Dufresne <nicolas@ndufresne.ca>, Project_Global_Chrome_Upstream_Group@mediatek.com, Paul-PL Chen <paul-pl.chen@mediatek.com>, Nancy Lin <nancy.lin@mediatek.com>, linux-mediatek@lists.infradead.org, Sirius Wang <sirius.wang@mediatek.com>, Matthias Brugger <matthias.bgg@gmail.com>, linux-arm-kernel@lists.infradead.org, linux-media@vger.kernel.org
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On Fri, 31 Oct 2025 23:56:28 +0800, Jason-JH Lin wrote:
> From: Jason-jh Lin <jason-jh.lin@mediatek.corp-partner.google.com>
> 
> This series adds initial support for the MediaTek MT8196 GCE in the CMDQ
> driver, including related API changes for new hardware requirements.
> 
> Series application order:
>   1. [Fixes] Refine DMA address handling for the command buffer
>   - https://lore.kernel.org/all/20251022171847.379470-1-jason-jh.lin@mediatek.com/
>   2. [Series 1/4] Add GCE support for MT8196 and update CMDQ APIs (this series)
>   3. [Series 2/4] Migrate subsystems to new CMDQ APIs
>   4. [Series 3/4] Remove shift_pa from CMDQ jump functions
>   5. [Series 4/4] Remove deprecated CMDQ APIs
> 
> [...]

Applied to v6.18-next/dts64, thanks!

[1/9] arm64: dts: mediatek: Add GCE header for MT8196
      commit: 355531a5ffd9e26f4d87ab34015c679e32d60e3c

Cheers,
Angelo



