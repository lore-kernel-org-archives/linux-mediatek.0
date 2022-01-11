Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5451DC433F5
	for <linux-mediatek@archiver.kernel.org>; Tue, 11 Jan 2022 13:42:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:From:
	References:Cc:To:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=RJ7EBo5xrI1YIjqgcVHnUTUU2zQ6Bs/LCDmQWQdav5k=; b=vbKIML3jYXm6BaZsQzI1d2ED9e
	OhAqz1jZsR1gknFdiTr2CUnfFOnvbRFgvt8ecaKjgfb+yA9kVH/2QIbkOP+vGN5jYpekKLjQEqSyj
	BRnGTcnECECjUxqJZb6WyWtDhYClFlf7vAusIyh2cFigfcts02P63Dtl09qq5X46aX2JQGhYxoCLD
	65onRFyDflPfTfpm21LC2At+z0lvbFmpZtYYuzp40dAFKbfo2759B+L63+g0P/ebo64dN9fYqcMPE
	4G/3DYZaoGP2nmsbYTL9/eZiBu5xKYVgH/yxfTukGIJsgQ0fCF4v4C36kE0sJZLumilCfXUIOjNQZ
	dVcl8cGQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1n7HQL-00GRA7-2k; Tue, 11 Jan 2022 13:42:53 +0000
Received: from bhuna.collabora.co.uk ([2a00:1098:0:82:1000:25:2eeb:e3e3])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1n7HPs-00GQsY-6L; Tue, 11 Jan 2022 13:42:25 +0000
Received: from [127.0.0.1] (localhost [127.0.0.1])
 (Authenticated sender: kholk11) with ESMTPSA id ED90A1F43CE2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1641908542;
 bh=VDeQBil7SvH4yhLcVBFps42iLaKsZvV+Npp785+S9gE=;
 h=Subject:To:Cc:References:From:Date:In-Reply-To:From;
 b=CukxjS8X5so9pw0JwyRff/isKd/L1VT4kkZuJa1RnP3JefA5K5SyYWbSa2y++pkcY
 k+Xkbv4ISBrHurP/H0pDSYVsb3NV+/cFWqgrqKQwyC+C0j7O46ayI9o8JheqD9LdjQ
 2/QvTYr4SJihNm6I0ni7IjQ4FcoVpMan0jgfD3vtHa5siTOW0sLPPyMjWSMj0JDfxA
 Of0yPofdqvP4wgPpoZ2gLVIP8Vq+kFKnisIBJFGLP0JEJxg0JhpROU3ipwEoZpVAIN
 JKtlHGuzs+HjHoP6/pU2Qw4V4ZcsXj86fUZTjhOUACUnNKlp0qH0gD8tf/Jg0QnGhn
 tYGGN/JlZJzCA==
Subject: Re: [PATCH 5/7] pinctrl: mediatek: paris: Drop extra newline in
 mtk_pctrl_show_one_pin()
To: Chen-Yu Tsai <wenst@chromium.org>, Sean Wang <sean.wang@kernel.org>,
 Linus Walleij <linus.walleij@linaro.org>,
 Matthias Brugger <matthias.bgg@gmail.com>
Cc: linux-mediatek@lists.infradead.org, linux-gpio@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 Zhiyong Tao <zhiyong.tao@mediatek.com>,
 Guodong Liu <guodong.liu@mediatek.com>
References: <20220111112244.1483783-1-wenst@chromium.org>
 <20220111112244.1483783-6-wenst@chromium.org>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Message-ID: <82271a06-d9cb-efd0-57f1-b0bab847f826@collabora.com>
Date: Tue, 11 Jan 2022 14:42:19 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <20220111112244.1483783-6-wenst@chromium.org>
Content-Language: en-US
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220111_054224_400008_45761796 
X-CRM114-Status: GOOD (  17.77  )
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

Il 11/01/22 12:22, Chen-Yu Tsai ha scritto:
> The caller of mtk_pctrl_show_one_pin() is responsible for printing the
> full line. mtk_pctrl_show_one_pin(), called through mtk_pctrl_dbg_show(),
> should only produce a string containing the extra information the driver
> wants included.
> 
> Drop the extra newlines.
> 
> Fixes: 184d8e13f9b1 ("pinctrl: mediatek: Add support for pin configuration dump via debugfs.")
> Fixes: fb34a9ae383a ("pinctrl: mediatek: support rsel feature")
> Signed-off-by: Chen-Yu Tsai <wenst@chromium.org>
> ---
>   drivers/pinctrl/mediatek/pinctrl-paris.c | 6 ++----
>   1 file changed, 2 insertions(+), 4 deletions(-)
> 
> diff --git a/drivers/pinctrl/mediatek/pinctrl-paris.c b/drivers/pinctrl/mediatek/pinctrl-paris.c
> index d259f075c62d..1bacabfbc183 100644
> --- a/drivers/pinctrl/mediatek/pinctrl-paris.c
> +++ b/drivers/pinctrl/mediatek/pinctrl-paris.c
> @@ -639,12 +639,10 @@ ssize_t mtk_pctrl_show_one_pin(struct mtk_pinctrl *hw,
>   			pullup);
>   
>   	if (r1 != -1) {
> -		len += scnprintf(buf + len, buf_len - len, " (%1d %1d)\n",
> +		len += scnprintf(buf + len, buf_len - len, " (%1d %1d)",
>   			r1, r0);

Since you're doing also some nice cleanups, would you mind un-breaking the line
above? That'd be 82 columns, which is fine to have.

In any case:


Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>

>   	} else if (rsel != -1) {
> -		len += scnprintf(buf + len, buf_len - len, " (%1d)\n", rsel);
> -	} else {
> -		len += scnprintf(buf + len, buf_len - len, "\n");
> +		len += scnprintf(buf + len, buf_len - len, " (%1d)", rsel);
>   	}
>   
>   	return len;
> 

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
