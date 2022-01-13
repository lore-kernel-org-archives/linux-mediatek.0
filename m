Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 24259C433F5
	for <linux-mediatek@archiver.kernel.org>; Thu, 13 Jan 2022 16:11:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:From:
	References:Cc:To:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=aewBQAuEkOoLuMUZ80HzJBhPiI6Vo8ybJ/LsnuR4lv8=; b=Xwj8XKkiEU2da0kuJ1zRfSARap
	yIdfl05ZWni8CU/xGYZOOkegFIQA2m7Zeh1F/W7+6AO4OWclENkCsr7q7rSfo7b8L3rJX4OU/Sv13
	i+gE4pzw1YuA7TD+oJRmHdZDazpAaQHAdOsZbRZ3h3vL1jaKGUQ7sbHhNnhmtfuqKNa0h0xQIC312
	IFR+E0syyoVkS3wsiUlnHRleG+bqF0iwUVGeBUMsTo14mt2X35J9hLCv6Mh5NLGglIum6IKPlwUxa
	lhy4l6wta2CVDRtbzdmHGRtgwQXk/Lb5oH0Et/kx9le3olkll8LIcBf/mO+SwDQjhn/qCyf0+GFPe
	g239VMuA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1n82gv-006V7t-LJ; Thu, 13 Jan 2022 16:11:09 +0000
Received: from bhuna.collabora.co.uk ([46.235.227.227])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1n82eH-006TZA-El; Thu, 13 Jan 2022 16:08:26 +0000
Received: from [127.0.0.1] (localhost [127.0.0.1])
 (Authenticated sender: kholk11) with ESMTPSA id 7271F1F45F46
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1642090104;
 bh=EJCJ/U8x9BufSZOZuD2xdqLDerBdLK0JlNJ0Lc3P0r8=;
 h=Subject:To:Cc:References:From:Date:In-Reply-To:From;
 b=O63IZ60KePMUX4t7LXts5qjLWpTVTleknfXkdkm4GjReM/TIchvcn5woLrIzAbF8L
 xrFCf4dZ+mgyl/xtHAuSzbCeLFZiYCEN+T7Vn3EodIVKrtbUpe5dX5nkHKlUvTv2J+
 iHZ8kRTVIiZ0na2Oe/bkQQnFXZVfPBCJiU4lbiQulxD+RrkH3NBf+8afO31DymHURs
 VpcZZA4O4sEPlgwIt+9rBXt89PxTNsGoNCjjJ64pqyQe3K2EnVSCW32mNieNZtpyCR
 g5kHc/okwcvYCnuiuspbrJZMt4eLIlR0PwY0642uyIEYI++ss4Lt1D1K3bqWwy8X/R
 jSkpoHN1jf2+Q==
Subject: Re: [PATCH v11 05/22] soc: mediatek: add mtk-mmsys support for mt8195
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
 <20220110084645.31191-6-nancy.lin@mediatek.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Message-ID: <1e3ff068-3335-8402-4eb6-ec4fbda44461@collabora.com>
Date: Thu, 13 Jan 2022 17:08:21 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <20220110084645.31191-6-nancy.lin@mediatek.com>
Content-Language: en-US
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220113_080825_717997_F60EE881 
X-CRM114-Status: UNSURE (   9.52  )
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
> Add mt8195 vdosys1 clock driver name and routing table to
> the driver data of mtk-mmsys.
> 
> Signed-off-by: Nancy.Lin <nancy.lin@mediatek.com>

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
