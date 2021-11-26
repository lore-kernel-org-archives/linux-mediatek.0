Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CFA65C433F5
	for <linux-mediatek@archiver.kernel.org>; Fri, 26 Nov 2021 12:26:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:From:
	References:Cc:To:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=6OAtVOCYGrl+cVKyXLxq52whqPUs4AzcIMSCmJrntdk=; b=2Vy1yj3RAOH3Qr4YShHG95xUY2
	D3BybgBjjVziSam4I39DbydqndpE51MR1FpotsKD6oB8ZmO6Lpp5I0DQic04mWTtXSW3+GWnQ+n6F
	5GlFWdWPj+I24bG5GFhH1x1OTZ/2Gm9U6Hsirevk+AlgRflytHdQmVPWosLssmnxZWv048I9lwdnP
	k2CT9VUGamgGQF4+uZQJ/Cbjs2GTKM87MYq+chhcowBgMq0RuIy2WFDYwPoJttWJmZ/9dsm7qIp7Q
	aDrRBaK8Nr/gJlBpKufDwlG676SibL8jwsQBmadPWdNC992izrx/6vNQN0WwouR3ynokEJBlXWc/K
	wy/FJccQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mqaJH-00AMGi-Mh; Fri, 26 Nov 2021 12:26:35 +0000
Received: from bhuna.collabora.co.uk ([2a00:1098:0:82:1000:25:2eeb:e3e3])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mqa0P-00AHfN-As
 for linux-mediatek@lists.infradead.org; Fri, 26 Nov 2021 12:07:06 +0000
Received: from [127.0.0.1] (localhost [127.0.0.1])
 (Authenticated sender: kholk11) with ESMTPSA id 81E1A1F424B2
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=collabora.com; s=mail;
 t=1637928424; bh=lX6ppMZjO0025K7runl0mEgfYiZFx0hIVDwtqr+JnAM=;
 h=Subject:To:Cc:References:From:Date:In-Reply-To:From;
 b=gocUK+GrWnXl6OKH/AevijAI24+YPu7y7cG7JpNfIzKaaOkO5YIcm+g4VX7go3Dw4
 Mrykzt9/N1hZRWFb5eYsZtcb1ZeoLjslBbS8V9Do4CMXkSbQJYYSSa0IK9qTK1TdEq
 ZtlMt6ACjwLpRObtq51WBWwn9ip4QoybLUpo0juifxmEHvwmEXSb5cQBOTLvaWfBcb
 MTAjUT44oNLDAgQmyXgmkEi5HY6NeRPn+eKehA2pPPFRbzCkGJlcGoDJPJo6GgyBuo
 xgI50lPS+knlc0AlgfZxJ6jWL3paAKjCkqSdCF5dddU8BYcnTIztLkeL+ar8Po3C7c
 fQrOkqgKMp5zw==
Subject: Re: [PATCH v2 7/8] ASoC: SOF: mediatek: Add mt8195 dsp clock support
To: Daniel Baluta <daniel.baluta@oss.nxp.com>, broonie@kernel.org,
 alsa-devel@alsa-project.org
Cc: pierre-louis.bossart@linux.intel.com, lgirdwood@gmail.com,
 daniel.baluta@nxp.com, daniel.baluta@gmail.com,
 linux-kernel@vger.kernel.org, yc.hung@mediatek.com,
 linux-mediatek@lists.infradead.org
References: <20211118100749.54628-1-daniel.baluta@oss.nxp.com>
 <20211118100749.54628-8-daniel.baluta@oss.nxp.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Message-ID: <111881ca-bc8e-3c41-fe58-20f01b623031@collabora.com>
Date: Fri, 26 Nov 2021 13:07:01 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <20211118100749.54628-8-daniel.baluta@oss.nxp.com>
Content-Language: en-US
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211126_040705_581620_71A266B6 
X-CRM114-Status: GOOD (  10.70  )
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

Il 18/11/21 11:07, Daniel Baluta ha scritto:
> From: YC Hung <yc.hung@mediatek.com>
> 
> Add adsp clock on/off support on mt8195 platform.
> 
> Signed-off-by: YC Hung <yc.hung@mediatek.com>
> Reviewed-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
> Reviewed-by: Daniel Baluta <daniel.baluta@nxp.com>
> Signed-off-by: Daniel Baluta <daniel.baluta@nxp.com>
> ---
>   sound/soc/sof/mediatek/adsp_helper.h       |   2 +-
>   sound/soc/sof/mediatek/mt8195/Makefile     |   2 +-
>   sound/soc/sof/mediatek/mt8195/mt8195-clk.c | 158 +++++++++++++++++++++
>   sound/soc/sof/mediatek/mt8195/mt8195-clk.h |  28 ++++
>   sound/soc/sof/mediatek/mt8195/mt8195.c     |  22 ++-
>   5 files changed, 208 insertions(+), 4 deletions(-)
>   create mode 100644 sound/soc/sof/mediatek/mt8195/mt8195-clk.c
>   create mode 100644 sound/soc/sof/mediatek/mt8195/mt8195-clk.h
> 

Acked-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>



_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
