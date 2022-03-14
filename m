Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9386AC433F5
	for <linux-mediatek@archiver.kernel.org>; Mon, 14 Mar 2022 10:25:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=INGvM203UOHhFBH+eEIfVujjaj3vGI6LCJHAo2yUvHE=; b=mvs+9Qf+30LXj1
	VLozuJ6sp42zHboglOj1eY+/2il9Kwo4x7Y1Gzj+4HOU7MwAgPAany8XwhRi7VnZCfa5KqM2OyuTo
	K9V1kKcd4/tq/Gu5wSm4GhH42KSaWrBbL81v24F/4+65BfQWdrTbj3vF2/xM2jyOGuFWKf8E+CWD/
	8VG+2O4DezffzVmnaWDIeLSFtg/pSUEtDuMQuXA4ekaPcDJPOiwXm20YeVrTt0y1CeheIOPgruGcK
	jTWbgQXA6BygFj1SfmAVokIAdA8cZP2nYEP//r4w2RlfaaHWjopuMe9xn7dm9xhPFDXSE6CfhdIPY
	NMBNk8pzrxVg6N335AKg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nThtc-004wJk-4X; Mon, 14 Mar 2022 10:25:48 +0000
Received: from bhuna.collabora.co.uk ([46.235.227.227])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nThtA-004wAb-Mm; Mon, 14 Mar 2022 10:25:23 +0000
Received: from [127.0.0.1] (localhost [127.0.0.1])
 (Authenticated sender: kholk11) with ESMTPSA id B83AA1F434FA
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1647253519;
 bh=CMDLyrkwOqWTgGkVJSKbrJxuQwnDyjhV3L0QailiIj8=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=kB3fV4sKc0tD7r3/SJxX8Rl5Debi9JeEKE/AlO+V1kyORZVET0wnKCqS5m/qCbD36
 VGOkrAxa1UGiyaw06eshc8SRqa2lujdY8Fk9fvVOKwnJECoJIc0XjpP0eKFUXUayqb
 hlGjh/UQVKcCKW95Jc/BfmgpNTOHVDQ9o2BRjGfkCzc3pyZSIKR1wz9LLbhNS2j8Oa
 0SBgCQWR05ZRqiwJOGGvkKHxpsR9SCYsVnQd0/JKVszQsW41sDMw1WHcDdZ9RZqVPm
 N/fgKs5kSa4RprKUgKD+GeqN9UGjB+Jj5XznV/gr+o0MmhrQE51U/z/aEi5EDrj9hk
 dk/avJx8Y5jJg==
Message-ID: <fe924e75-6543-2b5a-b354-6eb38fb1cbe6@collabora.com>
Date: Mon, 14 Mar 2022 11:25:15 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.1
Subject: Re: [v3 04/19] ASoC: mediatek: mt8186: support adda in platform driver
Content-Language: en-US
To: Jiaxin Yu <jiaxin.yu@mediatek.com>, broonie@kernel.org, robh+dt@kernel.org
Cc: aaronyu@google.com, matthias.bgg@gmail.com, trevor.wu@mediatek.com,
 tzungbi@google.com, julianbraha@gmail.com, alsa-devel@alsa-project.org,
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org,
 Project_Global_Chrome_Upstream_Group@mediatek.com
References: <20220313151023.21229-1-jiaxin.yu@mediatek.com>
 <20220313151023.21229-5-jiaxin.yu@mediatek.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
In-Reply-To: <20220313151023.21229-5-jiaxin.yu@mediatek.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220314_032520_939921_591F3A2E 
X-CRM114-Status: UNSURE (   7.62  )
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
> Add mt8186 adda dai driver.
> 
> Signed-off-by: Jiaxin Yu <jiaxin.yu@mediatek.com>

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>

> ---
>   sound/soc/mediatek/mt8186/mt8186-dai-adda.c | 878 ++++++++++++++++++++
>   1 file changed, 878 insertions(+)
>   create mode 100644 sound/soc/mediatek/mt8186/mt8186-dai-adda.c
> 

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
