Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 998E2C433EF
	for <linux-mediatek@archiver.kernel.org>; Wed,  9 Mar 2022 20:02:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Date:Cc:To:From:Subject:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=MzRn3NN9hii6RjpszvJrlb4C3vKTlOSTdBPYa2xp344=; b=yA5OL5AwmT//mX
	0BHty2/JU3OfVwJniFTrLFddT2+1Wm06rdEJIk1fS/AsGwcZknQdKk9fVEQLc0CdHF+RPkgwB4iSl
	fUErsdisBC5PTI7UaLMs5vQpdqmuLzkdpj04v374wU2hbzwwmR4zZPFpIIw7xUsPBy60+T9VP+vnZ
	SVVat4orFzsdX7mNgVL07RceG2TWB5DN4U5j4wpi1wjmI4UnUgtdRaAzTJYmRjE/F/r7UdFw3uV7K
	fsmueVz5iJMPgOM4kFQ38bmgt2ol8GpTA4h6cYa4q10w+yqo6OkbgKGmy6X38ltuIqMzDP0rEYiAG
	p9hi3wqKe847wnGk8dww==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nS2VU-00AN4h-Lq; Wed, 09 Mar 2022 20:02:00 +0000
Received: from relay4.hostedemail.com ([64.99.140.37])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nS2VI-00AN0Z-7I; Wed, 09 Mar 2022 20:01:49 +0000
Received: from omf14.hostedemail.com (a10.router.float.18 [10.200.18.1])
 by unirelay10.hostedemail.com (Postfix) with ESMTP id B1D4221B6;
 Wed,  9 Mar 2022 20:01:42 +0000 (UTC)
Received: from [HIDDEN] (Authenticated sender: joe@perches.com) by
 omf14.hostedemail.com (Postfix) with ESMTPA id 5B61D32; 
 Wed,  9 Mar 2022 20:01:17 +0000 (UTC)
Message-ID: <400cf2fc8cbc3887a90f50709f40adc0662ec0f4.camel@perches.com>
Subject: Re: [PATCH v2 05/11] pinctrl: mediatek: paris: Drop extra newline
 in mtk_pctrl_show_one_pin()
From: Joe Perches <joe@perches.com>
To: Chen-Yu Tsai <wenst@chromium.org>, Sean Wang <sean.wang@kernel.org>, 
 Linus Walleij <linus.walleij@linaro.org>, Matthias Brugger
 <matthias.bgg@gmail.com>
Cc: linux-mediatek@lists.infradead.org, linux-gpio@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Date: Wed, 09 Mar 2022 12:01:39 -0800
In-Reply-To: <20220308100956.2750295-6-wenst@chromium.org>
References: <20220308100956.2750295-1-wenst@chromium.org>
 <20220308100956.2750295-6-wenst@chromium.org>
User-Agent: Evolution 3.40.4-1ubuntu2 
MIME-Version: 1.0
X-Stat-Signature: itpi6u5eyed33jaieo59phaog6r153x8
X-Rspamd-Server: rspamout03
X-Rspamd-Queue-Id: 5B61D32
X-Session-Marker: 6A6F6540706572636865732E636F6D
X-Session-ID: U2FsdGVkX1+v5TW9d+3Dr2lvFismD/IYOx5icBwv8Xg=
X-HE-Tag: 1646856077-760257
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220309_120148_370879_DEEFEEBB 
X-CRM114-Status: GOOD (  13.29  )
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On Tue, 2022-03-08 at 18:09 +0800, Chen-Yu Tsai wrote:
> The caller of mtk_pctrl_show_one_pin() is responsible for printing the
> full line. mtk_pctrl_show_one_pin(), called through mtk_pctrl_dbg_show(),
> should only produce a string containing the extra information the driver
> wants included.

Does this function have another caller?

It looks as if this function doesn't need to be EXPORT_SYMBOL_GPL
and could just be declared static in the file instead.

btw: using %1d is mostly senseless as a control, but has some
     documentary use as a value < 0 or >= 10 will be always be
     fully emitted anyway.

> diff --git a/drivers/pinctrl/mediatek/pinctrl-paris.c b/drivers/pinctrl/mediatek/pinctrl-paris.c
[]
> @@ -634,14 +634,10 @@ ssize_t mtk_pctrl_show_one_pin(struct mtk_pinctrl *hw,
>  			pullen,
>  			pullup);
>  
> -	if (r1 != -1) {
> -		len += scnprintf(buf + len, buf_len - len, " (%1d %1d)\n",
> -			r1, r0);
> -	} else if (rsel != -1) {
> -		len += scnprintf(buf + len, buf_len - len, " (%1d)\n", rsel);
> -	} else {
> -		len += scnprintf(buf + len, buf_len - len, "\n");
> -	}
> +	if (r1 != -1)
> +		len += scnprintf(buf + len, buf_len - len, " (%1d %1d)", r1, r0);
> +	else if (rsel != -1)
> +		len += scnprintf(buf + len, buf_len - len, " (%1d)", rsel);
>  
>  	return len;
>  }



_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
