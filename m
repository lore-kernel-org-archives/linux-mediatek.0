Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 51839C433EF
	for <linux-mediatek@archiver.kernel.org>; Tue,  8 Mar 2022 15:28:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=yMP15A/IrcHPVcp91U8azI9Iv28TeVIYJRVkjSnqJt8=; b=hwtiQjPbd4HBQO
	AVOTT/nBF/QfCWiLw6gIcwJbicvNV71pI1vgmCff+pdXuJRfXxJ9cpTDFyVMCufSbp4V5OkoA8Ye/
	cVCBG3f3dJaoVm6CBn1kuj98C5x+TucIQkBiSSFdV1x6LeEPoXJmNnPTMp5RD6OBsTVWjVh7nTmST
	S+VuU1scDEFeYrs4fn13YXYl3AvLJBE3cnyC0FdIIix32imI0+3v/URk4qEf6CoQFWPudb/MfUUdg
	XWTZRTYLZrTJThE5yt+LwaM0KXWdJH/NSSG3nWyvQTDvIuYMrZmGBd5pzrlDCn77+BGLXrL4oGjVt
	VppaQgpB4idDpDoRzVgQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nRbkg-004xOg-22; Tue, 08 Mar 2022 15:27:54 +0000
Received: from bhuna.collabora.co.uk ([46.235.227.227])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nRbk9-004xDm-8X; Tue, 08 Mar 2022 15:27:22 +0000
Received: from [127.0.0.1] (localhost [127.0.0.1])
 (Authenticated sender: kholk11) with ESMTPSA id 7841A1F42FA2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1646753240;
 bh=mIroQP3tB1a7rDkP2yeLhxzu7G9KButjFXnb5VdUlUA=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=nbipGJDxzfwckK1I0UeDsp0CromMA5ceLPeeCxHVxHPLCzUBzHs4PzQnsAIEgcvhT
 NnO9ozCej3tF4E43fGFhwZKO1dqS8B+DvIPKEBgNTcojdA5EnEUowxNXwiPEPuel2s
 juPy82lrRaT6y6Gcr1s8KCzkbXrDTmZi61piJq48YyRRD5GsRgKrL0IICJFL1IQd0j
 JH9It5qs/TSfJDnuMsBfuL/sUtmCtsyyxigw1MrkUIF94ifxn9ottwtquLi7ahhKGv
 lKhAj2x0AjwgVOC9dIRqJIJHxYVFNz/5NmCeFz/ANKwXXBlgkMCmbsv2lLUlalZ6tK
 v1oEA2MmlUO3A==
Message-ID: <979ed023-ce90-ebae-7729-b5a2982b05d0@collabora.com>
Date: Tue, 8 Mar 2022 16:27:16 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.1
Subject: Re: [PATCH v2 07/11] pinctrl: mediatek: paris: Rework
 mtk_pinconf_{get,set} switch/case logic
Content-Language: en-US
To: Chen-Yu Tsai <wenst@chromium.org>, Sean Wang <sean.wang@kernel.org>,
 Linus Walleij <linus.walleij@linaro.org>,
 Matthias Brugger <matthias.bgg@gmail.com>
Cc: linux-mediatek@lists.infradead.org, linux-gpio@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
References: <20220308100956.2750295-1-wenst@chromium.org>
 <20220308100956.2750295-8-wenst@chromium.org>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
In-Reply-To: <20220308100956.2750295-8-wenst@chromium.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220308_072721_535758_20401B22 
X-CRM114-Status: GOOD (  16.20  )
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

Il 08/03/22 11:09, Chen-Yu Tsai ha scritto:
> The current code deals with optional features by testing for the
> function pointers and returning -ENOTSUPP if it is not valid. This is
> done for multiple pin config settings and results in the code that
> handles the supporting cases to get indented by one level. This is
> aggrevated by the fact that some features require another level of
> conditionals.
> 
> Instead of assigning the same error code in all unsupported optional
> feature cases, simply have that error code as the default, and break
> out of the switch/case block whenever a feature is unsupported, or an
> error is returned. This reduces indentation by one level for the useful
> code.
> 
> Also replace the goto statements with break statements. The result is
> the same, as the gotos simply exit the switch/case block, which can
> also be achieved with a break statement. With the latter the intent
> is clear and easier to understand.
> 
> Signed-off-by: Chen-Yu Tsai <wenst@chromium.org>

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>

> ---
>   drivers/pinctrl/mediatek/pinctrl-paris.c | 144 ++++++++++-------------
>   1 file changed, 61 insertions(+), 83 deletions(-)
> 


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
