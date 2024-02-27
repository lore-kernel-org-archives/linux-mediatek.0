Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7C762C5478C
	for <linux-mediatek@archiver.kernel.org>; Tue, 27 Feb 2024 13:05:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=KY+xX7/FQphnhI3Eu0p1lGR7gGb9hy02qhv8ovAJVz4=; b=OaNH/+GMptpyrcks2aQ4OF3djv
	aKTYtbn9wiH+Nb75zilZyXzoYClYv2rhkhXzrQ7XFKKYWIiUwU2OpeXXZD4Ml57vEIabselg5Hgot
	J0FhtMM34ypeZGm6WivpDumUPMdf2JZ8Mm323oHHoG3RA6/mZdH+JcNUkW369KNjYGxNhCWhf3V+G
	58WN7Xm5UIyyx7vdG8JXWskHNm/xXoI0SBFfntbJ39CKqfRzsmws/sDXvrkLAOu+pmleC/1ME3bF/
	FmSz5Bd/oM8+gbL5xWkAwFxM8DHh3rpbFzaSSWPQDQym2IPiSNpU/959+Qb+wsQBtUFLkaH6BsOeK
	OEEL42ug==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rex9A-00000005JYa-3pIs;
	Tue, 27 Feb 2024 13:05:24 +0000
Received: from madrid.collaboradmins.com ([2a00:1098:ed:100::25])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rex8w-00000005JU7-45po;
	Tue, 27 Feb 2024 13:05:12 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1709039109;
	bh=4+xxXJpIxETTFxPp8LblvziN3QS7LhnD/JQ2E4D5Zqg=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=sUUKc/rQ0hMdw8Aa8wMkhPSpJ+yWBRrgN/MMLgfJdSTKdfEWllF6QGgmfxFM3pGX6
	 ptDx7Aiog9e7OJk4qYHvgThWqZ21TxZlxPMkeWUQcn8eQ59G/c8oFi3/vmnnwAuet6
	 0m9yPQ/ggGEBhRZMAN/09vD2rds3tvQOlbjeeJ4UhrOEWcwaDcPynKI076Wu9M1cjI
	 ceqa7YA5gEZcS5ixc9+/0mEJxWVfF0cGQqZ4p5LsTArsFc5UWTKv1GLfpdzHo+cpc1
	 CHUP+eVEYfqPafqj5jsY/8a3YNn4YITTveVnLxu7VuVRKmD0ood+mTKtMHzne2WmLZ
	 FRBzMAOW/S5Kg==
Received: from [100.113.186.2] (cola.collaboradmins.com [195.201.22.229])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by madrid.collaboradmins.com (Postfix) with ESMTPSA id 27C4F37820CC;
	Tue, 27 Feb 2024 13:05:08 +0000 (UTC)
Message-ID: <6ea5e5b5-13d9-4c3d-b8fd-4948824e5051@collabora.com>
Date: Tue, 27 Feb 2024 14:05:07 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/2] usb: misc: onboard_usb_hub: Add support for TI
 TUSB8020B
Content-Language: en-US
To: Macpaul Lin <macpaul.lin@mediatek.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>, Matthias Kaehlcke <mka@chromium.org>,
 Matthias Brugger <matthias.bgg@gmail.com>, linux-usb@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org
Cc: Bear Wang <bear.wang@mediatek.com>, Pablo Sun <pablo.sun@mediatek.com>,
 Macpaul Lin <macpaul@gmail.com>, Chunfeng Yun <chunfeng.yun@mediatek.com>,
 Yow-shin Liou <yow-shin.liou@mediatek.com>,
 MediaTek Chromebook Upstream
 <Project_Global_Chrome_Upstream_Group@mediatek.com>,
 Chen-Yu Tsai <wenst@chromium.org>
References: <20240227090228.22156-1-macpaul.lin@mediatek.com>
 <20240227090228.22156-2-macpaul.lin@mediatek.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
In-Reply-To: <20240227090228.22156-2-macpaul.lin@mediatek.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240227_050511_195838_3B14F459 
X-CRM114-Status: UNSURE (   7.81  )
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

Il 27/02/24 10:02, Macpaul Lin ha scritto:
> The TI TUSB8020B is a 2-port USB 3.0 hub. Add support for
> this hub in the driver in order to bring up reset, and supply
> dependencies.
> 
> Power-up: Issue a GPIO reset (GRSTz) 3ms after VDD and VDD33 stabilize.
> 
> Signed-off-by: Macpaul Lin <macpaul.lin@mediatek.com>

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>



