Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BEC26C25B4E
	for <linux-mediatek@archiver.kernel.org>; Fri, 20 Jan 2023 11:16:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=FF1ywf4sSRyVQGi2pPIOQY9r6cElJ3WI7Nmk6WdnxZY=; b=OfA3MF5EhArv/xzZ5fBDVwD+MO
	YZkUXvjMkmbVuI4yvfLDaiw02I+1AYb2RZ/SnnMEWGZoCMVQi8ebXGYJDk3QDancSB2oYBK8wvbRJ
	okMHv1VL9tA8GVTv3WqCBpZMBBahCrnMjiOn2D2BWvfEMsDr0OQdDTJmmkWgbeOWT7PNDSWpHjpDJ
	MajaAo12a/tsCB3PBusTdivAvTGsJEvY86QvqiF/X8wHJr4UfXVPb6Ga4dC6sdnSp7RA7u1eZZZTp
	i66oAOl3EagtU0NdtgF6IFBMTzaMBkhjKhdpVZMcX6YNizMJgrSOty85pW6EwzJHC6kmqRm233nSO
	27FvWPvw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pIpNB-009yZS-BH; Fri, 20 Jan 2023 11:15:53 +0000
Received: from madras.collabora.co.uk ([46.235.227.172])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pIpMl-009yNz-Px; Fri, 20 Jan 2023 11:15:29 +0000
Received: from [192.168.1.100] (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits))
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id E1AB96602D25;
	Fri, 20 Jan 2023 11:15:24 +0000 (GMT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1674213325;
	bh=pk0IDna2rdFOCASraCLd7evCkGbMHFk7ARo77hGlbMo=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=K2MOTQvLN7GOlV57FsPI26ZCkig6YDHIcebXCASlOI+Dtrp0mjLBJCY6iy95WiFvl
	 1mnskzibbi3R6xOjsgp1d8CLmRCYv94hF8xjwpcWPQ0xSHRc90X2XsfYNBxL+HZuJ3
	 IJ+qtg9RzoV6K81BA87zEV9pQWcsZEKN2ysjtGynroVr7hYF2hsqD4Q5JC6iAltSmB
	 xwnSWQrafRZ0QtcA/Psi//KI3ntUbP0OInTF52KXaU44UkekjRDP3Wge9BUTRne+Lg
	 EV8p4arvjD/f0WjC8EAc6Qb+OW7TF5akWw32mYkdQbtjYvMMTaMzk/G/cqgeFLTnfI
	 QftUW5bfliLTw==
Message-ID: <8f7bda23-7063-d2ff-9b5d-b1604052a502@collabora.com>
Date: Fri, 20 Jan 2023 12:15:23 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.0
Subject: Re: [PATCH v3 2/3] iommu/sound: Use component_match_add_of helper
Content-Language: en-US
To: Sean Anderson <sean.anderson@seco.com>, David Airlie <airlied@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 dri-devel@lists.freedesktop.org
Cc: linux-kernel@vger.kernel.org, Mark Brown <broonie@kernel.org>,
 Jaroslav Kysela <perex@perex.cz>, Joerg Roedel <joro@8bytes.org>,
 Liam Girdwood <lgirdwood@gmail.com>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 Robin Murphy <robin.murphy@arm.com>, Takashi Iwai <tiwai@suse.com>,
 Will Deacon <will@kernel.org>, Yong Wu <yong.wu@mediatek.com>,
 alsa-devel@alsa-project.org, iommu@lists.linux.dev,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org
References: <20230119191040.1637739-1-sean.anderson@seco.com>
 <20230119191040.1637739-3-sean.anderson@seco.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
In-Reply-To: <20230119191040.1637739-3-sean.anderson@seco.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230120_031528_330781_31508F37 
X-CRM114-Status: UNSURE (   8.14  )
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

Il 19/01/23 20:10, Sean Anderson ha scritto:
> Convert users of component_match_add_release with component_release_of
> and component_compare_of to component_match_add_of.
> 
> Signed-off-by: Sean Anderson <sean.anderson@seco.com>
> Acked-by: Mark Brown <broonie@kernel.org>


Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>



