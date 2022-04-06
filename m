Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C98FDC433EF
	for <linux-mediatek@archiver.kernel.org>; Wed,  6 Apr 2022 10:42:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=0c3vXG7Oe+hsG6WZxAU/PeABDCGG52NGCZwJLRVEL5k=; b=V9eBSqMY0jUBVN
	H9dNDgzXG3oaMIk7rs/1pT8MIplimNoBiB1qUsgDh4SQM3CxoioAPkv89dPwL0kZsJh2rDh0+gc3B
	w+5Be6giv+hFvwIpO/kL8PCLb9eBGg2GY68QIa2ai2l5L5XyqClaPe8rHGKGFdj2Ia2kkZcbHDNLF
	gjTMTVXzhBqawJpIQi7rILyhaAkuwBfXuzXPYcFhVMPYpAE9fL0ucADzcvlLmfCETrGmaum+e3quO
	3jkzGNR22JoBH2wXg9YXN06nlHKGwee9BqTc0WtigSq9u2v1dxzgY99qHVd6z3Cn39gkdKgEN7iDk
	3HIzftQ9osddq1QieHBA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nc37N-005Tf8-3m; Wed, 06 Apr 2022 10:42:29 +0000
Received: from bhuna.collabora.co.uk ([2a00:1098:0:82:1000:25:2eeb:e3e3])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nc346-005S0B-CI; Wed, 06 Apr 2022 10:39:07 +0000
Received: from [127.0.0.1] (localhost [127.0.0.1])
 (Authenticated sender: kholk11) with ESMTPSA id 62E321F40636
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1649241544;
 bh=Wt6H1/5KeIwiv84NwDktEXWbagGeTc+A2tTQdBJ3m/M=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=hJXdG7l7xrjiCg6g8MWK7luueDWq70aow8lvQ6vnOWPs9zVmi0JNIIc5MWqIyomGP
 wkMZgWzgAdiwsoVsfGspG3eIJsMdhGaVqiX/foIUhBT6QcVRpYeJCi4l6LH9+AfNoA
 B4erpzjUZ5+wNT/w4SX6p0QB7uae9VJ+LNVqo8Jp1sFBDdu76zuAbqMsMhS9t+Oakt
 SI7wF/TKilhHc0+wt379jA/DQ59AcOOkDETmpZIAzVg8U2h6Isuhnk5CQA3zyXxpO0
 FILEIiEBjOnrt/MGSL8aWwAyOuHgrh+1uI8ON3fe7f5zvk9M1CawuUF+JtdoKi1ikq
 V3LYUnWeMTVFw==
Message-ID: <ff4e0e14-b0cc-feed-6038-45d383a0fd4a@collabora.com>
Date: Wed, 6 Apr 2022 12:39:01 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
Subject: Re: [PATCH 2/3] arm64: dts: mt8183: Correct disp_aal node compatible
Content-Language: en-US
To: Rex-BC Chen <rex-bc.chen@mediatek.com>, chunkuang.hu@kernel.org,
 robh+dt@kernel.org, krzk+dt@kernel.org
Cc: matthias.bgg@gmail.com, p.zabel@pengutronix.de, airlied@linux.ie,
 yongqiang.niu@mediatek.com, jason-jh.lin@mediatek.com,
 nancy.lin@mediatek.com, allen-kh.cheng@mediatek.com,
 dri-devel@lists.freedesktop.org, linux-mediatek@lists.infradead.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org,
 Project_Global_Chrome_Upstream_Group@mediatek.com
References: <20220406094654.29722-1-rex-bc.chen@mediatek.com>
 <20220406094654.29722-3-rex-bc.chen@mediatek.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
In-Reply-To: <20220406094654.29722-3-rex-bc.chen@mediatek.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220406_033906_634681_0537C4FF 
X-CRM114-Status: UNSURE (   8.38  )
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

Il 06/04/22 11:46, Rex-BC Chen ha scritto:
> The driver data of MT8183 and MT8173 are different.
> The value of has_gamma for MT8173 is true while the value of MT8183 is
> false. Therefore, the compatible of disp_aal for MT8183 is not suitable
> for the compatible for MT8173.
> 
> Signed-off-by: Rex-BC Chen <rex-bc.chen@mediatek.com>

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
