Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1B136C433F5
	for <linux-mediatek@archiver.kernel.org>; Thu, 24 Mar 2022 16:12:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=HXrTFHzqJTgaY10poyPklL8l6sivyiy429tuGiP0tGI=; b=MCY1zDBtfsyUHC
	tNNTuh2PCAgYM7NZJcvpEvny4COHWcQnjCo0VaKxqj8weilQigyx3xuThRkMdLXTqMbJypPCPLCrK
	QR1nbdGsxj9oklsSVp/Y1zsWseHd4GCMP+dUfT9OxVWqqFZUe3Z1qh/tiBk9Nz0l5kxI3wmZKzcg1
	2YQf5ksaIluoyTKA0vBW5OvnkPtdkZAxMr3KWu5754RKRJIbqU/XndvktuKPpvBTc65YuJ/BbD1OB
	REBSVq+JsssrI+WoY1ew7l/Y58bhnwBBuWoe5A7e4sm0O52IHEr5WjWEAtWvuH+w5FkGaCfBClXD2
	S45K3R7DDjKJSAWKc+sA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nXQ4v-00HARh-3b; Thu, 24 Mar 2022 16:12:49 +0000
Received: from bhuna.collabora.co.uk ([2a00:1098:0:82:1000:25:2eeb:e3e3])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nXQ4h-00HAMJ-EH; Thu, 24 Mar 2022 16:12:36 +0000
Received: from [127.0.0.1] (localhost [127.0.0.1])
 (Authenticated sender: kholk11) with ESMTPSA id 912651F457D0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1648138354;
 bh=WCk4dzdn3DtFOiWPLHNJq946UphbiJkQG7+kTAtMZdM=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=H2r7TNfTDpxaKSzjPVT4jB1Mv1PmRu810K99bdcoKktnGfjSaQNsCuuOOiOrROAv2
 WAZjuaXdyr6MVvqBpeXb/Ppm5sc66G6BdQIgo65vRbdfRxZB5j3/tkddMZi80SRGGf
 rSV+rwV3ON6wXU68DHcxIf0Mq/9JRaakWy9QRs2K97VEcX0abxRre8f5bGWrdMfZ96
 rCu+B3ki5EreP4yUybGMhb7+JhNQlM3+UOzXFGhjRSLtbAXe2SCKfwf7c/qzTD9sAn
 g3Bq+0E63Ezc0ptia0pnrXKKCceZk041QssxkgEIZw2Ow00o/vAqrwzfIOXCFAmfOr
 IXBAtp09bIaZw==
Message-ID: <d49177c6-651d-e445-4421-1078ba11efb8@collabora.com>
Date: Thu, 24 Mar 2022 17:12:31 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.1
Subject: Re: [PATCH v4 5/6] ASoC: mediatek: mt8195: add machine support for
 max98390 and rt5682
Content-Language: en-US
To: Trevor Wu <trevor.wu@mediatek.com>, broonie@kernel.org, tiwai@suse.com,
 robh+dt@kernel.org, matthias.bgg@gmail.com
Cc: alsa-devel@alsa-project.org, linux-mediatek@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 devicetree@vger.kernel.org, aaronyu@google.com, tzungbi@google.com,
 miles.chen@mediatek.com, yc.hung@mediatek.com
References: <20220324053851.27350-1-trevor.wu@mediatek.com>
 <20220324053851.27350-6-trevor.wu@mediatek.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
In-Reply-To: <20220324053851.27350-6-trevor.wu@mediatek.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220324_091235_643711_1CDA2DDE 
X-CRM114-Status: UNSURE (   8.18  )
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

Il 24/03/22 06:38, Trevor Wu ha scritto:
> This patch adds support for mt8195 board with mt6359, max98390 and
> rt5682.
> 
> Signed-off-by: Trevor Wu <trevor.wu@mediatek.com>

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>



_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
