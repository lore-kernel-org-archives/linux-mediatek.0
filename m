Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5966BC433F5
	for <linux-mediatek@archiver.kernel.org>; Mon, 14 Mar 2022 10:29:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=AhKziGQFDayf/BH8KcbeyjmEiJTRVsksSm8dewxkxNM=; b=3PqSv849SMejc8
	qT38sby3p7w1rFtncRMvpoCyg8DBs84JMZeOw10yNEgz0+9x91Iyol3YQnHNMZedam1Hj6R/XaE7/
	itq+BuBp3EiYtKEqb1uTOQr9JUIQpRGpQyAFLusEmC66ArSZEx6PMnH/TQbj4QLYy863JBOOJS39l
	wyt2BpWfelQly48UcELSa5z39vaJs08aKeWP5o3jAeYbrwxvkdAW+1HMsFlG3UbU+7gqmvfV7dvll
	bAudUvzmA5dBlT9OFTgcbaYxeM7W8R2B8QeKVE1ixW8v0H24Wr2vTq0uuirhFJrURl0jAVXB7l0vx
	hd5IJrQT/OqibgrICsbw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nThxG-004xtH-Ni; Mon, 14 Mar 2022 10:29:34 +0000
Received: from bhuna.collabora.co.uk ([2a00:1098:0:82:1000:25:2eeb:e3e3])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nThx0-004xmD-JN; Mon, 14 Mar 2022 10:29:19 +0000
Received: from [127.0.0.1] (localhost [127.0.0.1])
 (Authenticated sender: kholk11) with ESMTPSA id 81ACD1F4355A
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1647253757;
 bh=tW8FyRuL6n5L/qwnAWR7Khp5bAbCAxndU7Bal/l1SLE=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=P/Z2aAIy4xDzgiDQgftx8TBfT4KE3jqICwKh8pxOQ/GeFYXHOm4DyZ4rg31wZqgFB
 TLuxHH11Zq/2+69x8VTtxZaGrvO05jWvfWUCoOwEuYCAGOmpilAssD7pRdsAIaxVWN
 ndrmlPff25/547PQtONC0Yf03kgGarcvppr1o7GQQlCiuhIBL4DH+vsyKL9HXo4TkA
 sTLrh9ezFervX49WkQ81b1QsxC07xFarfVG9FaFMiS/VdTxzRBjg3u0Kc+z3n8nRXI
 MbkLCdaLU+nVtkcjFUf/kMiDFwAlg/9aM5AjxMdCzUaGG/4a7bMH2oedGbXZ0KE9KS
 6ROAMt0TqRscw==
Message-ID: <b5910ef5-6203-5823-3ce7-682f0324d8bd@collabora.com>
Date: Mon, 14 Mar 2022 11:29:14 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.1
Subject: Re: [v3 08/19] ASoC: mediatek: mt8186: support pcm in platform driver
Content-Language: en-US
To: Jiaxin Yu <jiaxin.yu@mediatek.com>, broonie@kernel.org, robh+dt@kernel.org
Cc: aaronyu@google.com, matthias.bgg@gmail.com, trevor.wu@mediatek.com,
 tzungbi@google.com, julianbraha@gmail.com, alsa-devel@alsa-project.org,
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org,
 Project_Global_Chrome_Upstream_Group@mediatek.com
References: <20220313151023.21229-1-jiaxin.yu@mediatek.com>
 <20220313151023.21229-9-jiaxin.yu@mediatek.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
In-Reply-To: <20220313151023.21229-9-jiaxin.yu@mediatek.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220314_032918_804285_5C128C10 
X-CRM114-Status: UNSURE (   7.42  )
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

Il 13/03/22 16:10, Jiaxin Yu ha scritto:
> Add mt8186 pcm dai driver.
> 
> Signed-off-by: Jiaxin Yu <jiaxin.yu@mediatek.com>

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>

> ---
>   sound/soc/mediatek/mt8186/mt8186-dai-pcm.c | 423 +++++++++++++++++++++
>   1 file changed, 423 insertions(+)
>   create mode 100644 sound/soc/mediatek/mt8186/mt8186-dai-pcm.c
> 

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
