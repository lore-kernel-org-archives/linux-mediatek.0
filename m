Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D5CFCC433F5
	for <linux-mediatek@archiver.kernel.org>; Thu, 13 Jan 2022 16:09:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:From:
	References:Cc:To:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=1g6ioJLeS+uxYJBH7/XQAgCmcQ4YjRuPyH5shIR8j60=; b=pWnqcPHgLHANASe86N12vOcIb3
	ag7ErhzkxqkpHzOELxLcz40J7V7ePqYxiGHYY4Bwy59S3nMwS9iY5FB/xqcN8+lBfmUJ18MOhcUrp
	jCdJfAIjLL0hUuh9l7lKDnhXxEJFdph36tlrG0bxlkx+d4UfQGhVPWQwuqbm+TJKVlBRTkWTvZW91
	bx96AWxjAUWwNc84ERvOzOFvJpK6OR65vhA6OdLGDM1qHBEQjAjhVc3BKWWbIjnR1aqSsbEAOROu5
	EKm4hBb5mzUNmcagFtaanzanQcC0kccp5dAGNoHvnwIactiUQO+lYR24i5YPGXI7a6x6hY9UxcYh1
	xLSmSYdw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1n82fP-006U9R-4x; Thu, 13 Jan 2022 16:09:35 +0000
Received: from bhuna.collabora.co.uk ([46.235.227.227])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1n82e5-006TQU-KI; Thu, 13 Jan 2022 16:08:15 +0000
Received: from [127.0.0.1] (localhost [127.0.0.1])
 (Authenticated sender: kholk11) with ESMTPSA id 9CFC71F45F46
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1642090092;
 bh=JMfu4BU6+0yOopVEx4qUzDgVJ/etcVmMV5JMvlOPMX4=;
 h=Subject:To:Cc:References:From:Date:In-Reply-To:From;
 b=RCA4CIRbKQVDz6ybVGfGi5nfu9ntyftOi2ZS9uIROEl9t5BCHaDtbUS7GTwxxDtqB
 6BnHLS56PvcK4uoRxysNbjizXpT2lNHowzT5kOU/A1trt15B3aXkXxHZh5P4wQR3I4
 xisbvK60MvRLpVFkycuL1riQm2VQlJKdokWugMdQZKNlUJKz/mGoweE8/bKHEYoKnm
 m4mv3cqNHFCZOTgwDubjBEkq1zQ7ZmxhjEsBj0I0JycE+SDdYhTwv4Jtx2L/lrLweN
 F9svoaJbAjC3oRtSni6nyzWQDZG1IDaRsQ9J+ow9IcsfPbkHr2etViUha4BLjiZi6t
 ov8nutG+rz+Hg==
Subject: Re: [PATCH v11 10/22] soc: mediatek: add mtk-mutex support for mt8195
 vdosys1
To: "Nancy.Lin" <nancy.lin@mediatek.com>, CK Hu <ck.hu@mediatek.com>
Cc: Chun-Kuang Hu <chunkuang.hu@kernel.org>,
 Philipp Zabel <p.zabel@pengutronix.de>, David Airlie <airlied@linux.ie>,
 Daniel Vetter <daniel@ffwll.ch>, Rob Herring <robh+dt@kernel.org>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 "jason-jh . lin" <jason-jh.lin@mediatek.com>,
 Yongqiang Niu <yongqiang.niu@mediatek.com>, dri-devel@lists.freedesktop.org,
 linux-mediatek@lists.infradead.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 singo.chang@mediatek.com, srv_heupstream@mediatek.com
References: <20220110084645.31191-1-nancy.lin@mediatek.com>
 <20220110084645.31191-11-nancy.lin@mediatek.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Message-ID: <64582c90-f307-5918-fb49-94e0beb2cf23@collabora.com>
Date: Thu, 13 Jan 2022 17:08:09 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <20220110084645.31191-11-nancy.lin@mediatek.com>
Content-Language: en-US
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220113_080813_879913_45803883 
X-CRM114-Status: UNSURE (   9.09  )
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

Il 10/01/22 09:46, Nancy.Lin ha scritto:
> Add mtk-mutex support for mt8195 vdosys1.
> The vdosys1 path component contains ovl_adaptor, merge5,
> and dp_intf1. Ovl_adaptor is composed of several sub-elements.
> 
> Signed-off-by: Nancy.Lin <nancy.lin@mediatek.com>

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>



_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
