Return-Path: <SRS0=GXkz=C6=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-11.0 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	NICE_REPLY_A,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7EB2CC43466
	for <linux-mediatek@archiver.kernel.org>; Mon, 21 Sep 2020 16:15:36 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 280F3221E2
	for <linux-mediatek@archiver.kernel.org>; Mon, 21 Sep 2020 16:15:36 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="BPw4peRS";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="FOlph9vP"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 280F3221E2
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Type:
	Content-Transfer-Encoding:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:From:
	References:To:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=c5ySNcOr4BZrXpT9g7bnLUEESH9+1wPTdRfjnMjcvlQ=; b=BPw4peRSjxvt1620iXFeOqMji
	zcVQLsaZKOwG6SSFhmTzF0woJmXrKn6q09DGrrSUM4lFidoOCzxJ5seo/u+erHMZXp9L9vJtbA2VE
	+ZDDMurXEg3emowiUG+MUBY3ks29TtiOBhu4yt7LZFE249qw86LXd/FO0rGsh5fHn6h+pBsoTL9Fh
	He4e/aAqcrxpT6nCHfbAB96Eha4M59tnoJBT7+wQhMf1jTqotJ0iwuT28WjvaVpvNtx/mp+WEzK4I
	sF4kHoyKvp2Z+BBwj0zL8nIjbMza1pD2RvGBOLHo5oXqtSFisqi9QsV5W4igapPEe+VMXtEXztaUQ
	e/1+ngcUg==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kKOTM-0001Gs-C8; Mon, 21 Sep 2020 16:15:24 +0000
Received: from mail-wm1-x343.google.com ([2a00:1450:4864:20::343])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kKOTJ-0001Ej-8E; Mon, 21 Sep 2020 16:15:22 +0000
Received: by mail-wm1-x343.google.com with SMTP id y15so94290wmi.0;
 Mon, 21 Sep 2020 09:15:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=rSiDIY+mBJXBx7mTEaoU7iUTrz5OuKwc6R4EdUzPFxQ=;
 b=FOlph9vPpLg7Qs+DqdBZs6dhzlOsW8G8sPt/Z6iDZR/iwWMXUgsTrrH3+DFfed2ptg
 MC5qh32BgeRFrVp9mhJlRPwwUz7WgpXOanAvIdJ7j/SILhqQsIbmU8sHwMztmh/TFMdP
 xBGQ5NvApAIYmRg/3VRdJLA+dFtDyyyN5bv/Ohx/txkS1JGzzV0eE+yVJ5M0GWYhFnnQ
 r0uxV5VwalBiNRhOL0MCCmDu3zGmuN0mOVTanH2+goKU9Mt8o8W+TFrCj4BNEYufNQJv
 h7E/bGoHIqh6xxr1XJrrR60bNcSqOS8bQiENjSFd7WAESx7ehqia4nVncKDqlxbOG0XZ
 BQGw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=rSiDIY+mBJXBx7mTEaoU7iUTrz5OuKwc6R4EdUzPFxQ=;
 b=KZOSyybwotIKDuiGSpd96+KlTShg37+Yon/cFxDofpobTE643I14qTSGe+u4P5cmbd
 GoIem82clETFMCmIauA7OcXz+qZ95ljVoeUbBihljd5yT3UVZ+skIzbc+SziWFDiGIz+
 wR7Q5HwBa5j5G9PfOOL/WV4gIkiPbVLpK/gB3CSGelI5HIEu4go0F/gKlfrbPLoS0AO5
 KJfZEdttl6vdGTrwUmYz7Pc/DxwpKa2UUr/xd/SfWMG5c15onV7vbfnvxk7/EUV+CtRQ
 bHhLDumFKfB7ZNQroaEmBY6SmNCRPrxPRn0vuNrYS6YWMpnDjOcQqXyI5xdD5yCODlw9
 Xb8Q==
X-Gm-Message-State: AOAM5305Zq4RYRReYHKJdeebW8TDzCMDwrpaJkOmVDXgbf/j8i35U64l
 4qre0gUCWNRgEJuPLBsNErwRCthOrq29ZQ==
X-Google-Smtp-Source: ABdhPJyObcKg6ezQrEsMRRb/qsn7AmBo/RdJ+Ov0IeCGrXN1B6RC1FB4M7qxxPKQXjkiuh0Debuv3w==
X-Received: by 2002:a1c:e256:: with SMTP id z83mr134592wmg.33.1600704920224;
 Mon, 21 Sep 2020 09:15:20 -0700 (PDT)
Received: from ziggy.stardust ([213.195.113.201])
 by smtp.gmail.com with ESMTPSA id i26sm115868wmb.17.2020.09.21.09.15.18
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 21 Sep 2020 09:15:19 -0700 (PDT)
Subject: Re: [PATCH v3 1/9] soc: mediatek: cmdq: add address shift in jump
To: Dennis YC Hsieh <dennis-yc.hsieh@mediatek.com>,
 Philipp Zabel <p.zabel@pengutronix.de>, David Airlie <airlied@linux.ie>,
 Daniel Vetter <daniel@ffwll.ch>, CK Hu <ck.hu@mediatek.com>,
 Bibby Hsieh <bibby.hsieh@mediatek.com>,
 Houlong Wei <houlong.wei@mediatek.com>
References: <1594136714-11650-1-git-send-email-dennis-yc.hsieh@mediatek.com>
 <1594136714-11650-2-git-send-email-dennis-yc.hsieh@mediatek.com>
From: Matthias Brugger <matthias.bgg@gmail.com>
Message-ID: <ddfff699-0ff7-4c15-4449-d6229c046142@gmail.com>
Date: Mon, 21 Sep 2020 18:15:18 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.12.0
MIME-Version: 1.0
In-Reply-To: <1594136714-11650-2-git-send-email-dennis-yc.hsieh@mediatek.com>
Content-Language: en-US
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200921_121521_411906_BE322FB3 
X-CRM114-Status: GOOD (  19.57  )
X-BeenThere: linux-mediatek@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <linux-mediatek.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mediatek>, 
 <mailto:linux-mediatek-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mediatek/>
List-Post: <mailto:linux-mediatek@lists.infradead.org>
List-Help: <mailto:linux-mediatek-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mediatek>, 
 <mailto:linux-mediatek-request@lists.infradead.org?subject=subscribe>
Cc: wsd_upstream@mediatek.com, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, HS Liao <hs.liao@mediatek.com>,
 linux-mediatek@lists.infradead.org, linux-arm-kernel@lists.infradead.org
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org



On 07/07/2020 17:45, Dennis YC Hsieh wrote:
> Add address shift when compose jump instruction
> to compatible with 35bit format.
> 
> Change since v1:
> - Rename cmdq_mbox_shift() to cmdq_get_shift_pa().
> 
> Signed-off-by: Dennis YC Hsieh <dennis-yc.hsieh@mediatek.com>

Now pushed to v5.9-next/soc

Thanks!

> ---
>   drivers/soc/mediatek/mtk-cmdq-helper.c |    3 ++-
>   1 file changed, 2 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/soc/mediatek/mtk-cmdq-helper.c b/drivers/soc/mediatek/mtk-cmdq-helper.c
> index dc644cfb6419..9faf78fbed3a 100644
> --- a/drivers/soc/mediatek/mtk-cmdq-helper.c
> +++ b/drivers/soc/mediatek/mtk-cmdq-helper.c
> @@ -329,7 +329,8 @@ int cmdq_pkt_finalize(struct cmdq_pkt *pkt)
>   
>   	/* JUMP to end */
>   	inst.op = CMDQ_CODE_JUMP;
> -	inst.value = CMDQ_JUMP_PASS;
> +	inst.value = CMDQ_JUMP_PASS >>
> +		cmdq_get_shift_pa(((struct cmdq_client *)pkt->cl)->chan);
>   	err = cmdq_pkt_append_command(pkt, inst);
>   
>   	return err;
> 

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
