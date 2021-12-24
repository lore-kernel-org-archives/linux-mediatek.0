Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7862EC433F5
	for <linux-mediatek@archiver.kernel.org>; Fri, 24 Dec 2021 09:27:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:From:
	References:Cc:To:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Gg1QTvDwmbA2Z02nkBLX0e4kvj+DvcvLwJPijLm35+0=; b=eH0UXtQACrpzrXqHVx7IEjB2rS
	Ol4FmquDZINtgQKfhpLSbHFEF2oNCl0C0zAenSzpEtogqXjIAFEOAc/sv6mkKu4ZxyA9vvqZEm5D6
	0ZXU3Sx3WmkSrTJ/wehnUx+w7+px1IgCQNgfn2/jMJ/AIlE7+k1R7qErRHiEpb+gRaDbK6mvysXsR
	lr64239PSbEYNV0SYTZ/NHLR4wyT9rm55J5mCJ39Ie4VWxW1j4DzxvpYjf/zqtCHW4S2cikurD/lz
	63qBS7MR11Vl8BEZr/KntiuDD+Z7uYbzdSrV0ez6D0VF4Z6sD+Epg/fDCxXS7daBb1T5qP9/PIc0R
	+0JjRWBA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1n0grI-00E0N0-8N; Fri, 24 Dec 2021 09:27:28 +0000
Received: from relay05.th.seeweb.it ([5.144.164.166])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1n0grF-00E0K2-5l
 for linux-mediatek@lists.infradead.org; Fri, 24 Dec 2021 09:27:27 +0000
Received: from IcarusMOD.eternityproject.eu (unknown [2.237.20.237])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by m-r2.th.seeweb.it (Postfix) with ESMTPSA id B84233EF19;
 Fri, 24 Dec 2021 10:27:15 +0100 (CET)
Subject: Re: [PATCH v7 3/4] dt-bindings: pinctrl: mt8195: add wrapping node of
 pin configurations
To: Tinghan Shen <tinghan.shen@mediatek.com>, robh+dt@kernel.org,
 linus.walleij@linaro.org, matthias.bgg@gmail.com, broonie@kernel.org
Cc: bgolaszewski@baylibre.com, sean.wang@mediatek.com,
 bayi.cheng@mediatek.com, gch981213@gmail.com, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org,
 linux-spi@vger.kernel.org, Project_Global_Chrome_Upstream_Group@mediatek.com
References: <20211220121825.6446-1-tinghan.shen@mediatek.com>
 <20211220121825.6446-4-tinghan.shen@mediatek.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@somainline.org>
Message-ID: <6317bb3b-38b1-3f5e-9f6c-ebacec9ebfef@somainline.org>
Date: Fri, 24 Dec 2021 10:27:15 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <20211220121825.6446-4-tinghan.shen@mediatek.com>
Content-Language: en-US
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211224_012725_431200_F766462D 
X-CRM114-Status: GOOD (  10.11  )
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

Il 20/12/21 13:18, Tinghan Shen ha scritto:
> On mt8195, the pinctrl node has pinctrl groups to group pin
> configurations by users' need. In each pinctrl group, it has
> subnode(s) to list pins needed and pin configurations. By supporting
> multiple subnodes, we can configure different pin characteristics
> (driving/pull-up/pull-down/etc.) in a pinctrl group.
> 
> Update pinctrl-mt8195.yaml to add subnode in pinctrl groups and an
> example to illustrate the usage.
> 
> Signed-off-by: Tinghan Shen <tinghan.shen@mediatek.com>
> Reviewed-by: Rob Herring <robh@kernel.org>

Acked-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
