Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 02EF5C433F5
	for <linux-mediatek@archiver.kernel.org>; Fri, 15 Apr 2022 10:33:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=YNVUWK6thuX6H4Y25wWizy6Mn6X32urHZrIMDzluahY=; b=E23PLH1bwME7lB
	kx71GpGRHjL14iPK9a2/kwNx3eZC50FlqxgoOzQurG9GPELxCgfNoH/rxJEGwBBFzPPuI9fuGHyfC
	s1x1x26MYwOVYcc7NFF/bSUAKXLwYQwqRS0F9GmCawttIW6oSQDA6tDaaLx5OmHpUFIeN9+ibPDcT
	qutffH4RM2fyjMvyLN7agwoMcBHE0AhdqPCwr5Hxc509LqbANE0txHvGq1/DFUm1yoZ6wBxsqzIL8
	vcPYbW5zz+fhQgW+CUUKcUsWLglHiQsMoHe4jUt90FzhiA4gdtCNxQpah5WcbQABZlngCVOr9orTD
	L+y/bG4NYGdPJesePcow==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nfJGW-009fPa-Uw; Fri, 15 Apr 2022 10:33:24 +0000
Received: from bhuna.collabora.co.uk ([2a00:1098:0:82:1000:25:2eeb:e3e3])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nfJG7-009fBD-Rh; Fri, 15 Apr 2022 10:33:01 +0000
Received: from [127.0.0.1] (localhost [127.0.0.1])
 (Authenticated sender: kholk11) with ESMTPSA id D30FB1F47E6A
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1650018778;
 bh=PusWeJyfelc4rfVn7gOGkQ7kuEx7Hrcz3WTXt8Ey8L0=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=ckhrRylc/UTSgvMkkm0H3vUvmwHOwtr9KqhZQphh5cY9omGVjk/7fb6hbOZRSDbmZ
 /ZS0eO0GC1KOjl5b5vKFUxDOcxo3gjga06JSHTMA/nIQ7134imG3YjJ5oV4CUVE5t6
 Lhdvy3ruRrW2xcV/69esiO31cDid+w5uVV3U3fXHHetKVF+CjAbkeHC3M2xgwv3twG
 eHYg6z5RYXTKh5XE5bGV8JcIfQPn1CmTE/gfQi+xTMOwyNAUA9v9f75hpY2mex523U
 JXT6k8UHaqljI511CqduDUCZu1UOpF+f5krcYSvc7N+20g5FEcjNdRYuwPwGQY/fGt
 jcUzXAH8lczoA==
Message-ID: <45b11fdc-4b81-86eb-81ce-ef9e32faa51f@collabora.com>
Date: Fri, 15 Apr 2022 12:32:55 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
Subject: Re: [PATCH v19 08/10] soc: mediatek: add DDP_DOMPONENT_DITHER0 enum
 for mt8195 vdosys0
Content-Language: en-US
To: "jason-jh.lin" <jason-jh.lin@mediatek.com>,
 Rob Herring <robh+dt@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 Chun-Kuang Hu <chunkuang.hu@kernel.org>
Cc: CK Hu <ck.hu@mediatek.com>, Nancy Lin <nancy.lin@mediatek.com>,
 Singo Chang <singo.chang@mediatek.com>, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linux-mediatek@lists.infradead.org, linux-arm-kernel@lists.infradead.org,
 Project_Global_Chrome_Upstream_Group@mediatek.com
References: <20220415083911.5186-1-jason-jh.lin@mediatek.com>
 <20220415083911.5186-9-jason-jh.lin@mediatek.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
In-Reply-To: <20220415083911.5186-9-jason-jh.lin@mediatek.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220415_033300_076584_15947F59 
X-CRM114-Status: UNSURE (   8.46  )
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

Il 15/04/22 10:39, jason-jh.lin ha scritto:
> The mmsys routing table of mt8195 vdosys0 has 2 DITHER components,
> so mmsys need to add DDP_COMPONENT_DITHER1 and change all usages of
> DITHER enum form DDP_COMPONENT_DITHER to DDP_COMPONENT_DITHER0.
> 
> But its header need to keep DDP_COMPONENT_DITHER enum
> until drm/mediatek also changed it.
> 
> Signed-off-by: jason-jh.lin <jason-jh.lin@mediatek.com>

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
