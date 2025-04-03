Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0AB26C3600C
	for <linux-mediatek@archiver.kernel.org>; Thu,  3 Apr 2025 10:36:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=AZWh+657KpbAK6kPDxe9FIgNLp0y0qiY5W/I+mC7v7I=; b=Kxr2BI8Gkz0k66QER9i49OcCLd
	wDeRl/QjJkWkyejjXMW1JMmXu/jN17z+pdfwbf+0gAo4JwFRQ20OVFM5c3ehAwXisl+/GCugpE3st
	Zr4BBl2sKX9wj777xuavp2JgljglTQaZX+D0641+BfH/CKO0WwJuawmrRIPFF1fQ0alPf20exE4om
	bLRLZ8KCayBOPkHdIFJ7QrDeEhvs+98rDtnt4sThfCKnAuYW0nQ2xcvsYGeJ3DxQBKl2M5ZMXN0+9
	cvNeLVLqSa4KUl/yYaGpMPXrmYG8l1ASp2Q9/Frd6ZJQc4U8RqYjdT9fj58dtGn1GfoScy89iIjK3
	J4YsQ3UA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.1 #2 (Red Hat Linux))
	id 1u0HwD-00000008adz-0QWS;
	Thu, 03 Apr 2025 10:36:45 +0000
Received: from bali.collaboradmins.com ([148.251.105.195])
	by bombadil.infradead.org with esmtps (Exim 4.98.1 #2 (Red Hat Linux))
	id 1u0Haf-00000008Wmd-0hr6;
	Thu, 03 Apr 2025 10:14:30 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1743675267;
	bh=pQ+giU2o8bR+aD+qw27N0esYeebZsDjxSFdqzbBOCrA=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=PNimA5mIt/hfRCsjeMpmH4eTYTRmCpptdNG5VYisLtuNU029cxK+fj/yH4DJD01Q/
	 ur1N3Kw5pJJNkQJ0bP85jKifaTUVKhRJ7A7iHpICQdeE1ZFXqBzN5Q3ZPos3O7bq6B
	 KW4Fct8T6jz6VJZKf1bz2zLAtRsCbT16F8zLEgct0VimGM7uTwvIvhRd8r1e75gyqy
	 HsljNuQlcWg3K17jhBgafyZl36zNse33AMQwl7fmh4GCNyPBYM+17BPIxQMhGhKtlX
	 FoWk/a6ePZfrwfkGa3iWGXPt7KoUpZuKcKafRB2k1Lzt33P4TRMcLkknm6DtqvoqV2
	 i8lvkONG2mrrg==
Received: from [192.168.1.100] (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 1E4FA17E0F47;
	Thu,  3 Apr 2025 12:14:27 +0200 (CEST)
Message-ID: <08ed1431-8e77-4435-9309-825b0f1ec4c6@collabora.com>
Date: Thu, 3 Apr 2025 12:14:26 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 2/2] memory/mediatek: Add an interface to get current
 DDR data rate
To: Crystal Guo <crystal.guo@mediatek.com>,
 Krzysztof Kozlowski <krzk@kernel.org>, Rob Herring <robh@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>
Cc: linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org,
 Project_Global_Chrome_Upstream_Group@mediatek.com
References: <20250403065030.22761-1-crystal.guo@mediatek.com>
 <20250403065030.22761-3-crystal.guo@mediatek.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Content-Language: en-US
In-Reply-To: <20250403065030.22761-3-crystal.guo@mediatek.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250403_031429_355891_79FC8C71 
X-CRM114-Status: UNSURE (   5.86  )
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

Il 03/04/25 08:48, Crystal Guo ha scritto:
> Add MediaTek DRAMC driver to provide an interface that can
> obtain current DDR data rate.
> 
> Signed-off-by: Crystal Guo <crystal.guo@mediatek.com>

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>



