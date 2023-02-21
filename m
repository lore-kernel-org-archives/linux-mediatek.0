Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C9F8AC64EC7
	for <linux-mediatek@archiver.kernel.org>; Tue, 21 Feb 2023 03:58:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Sbe8qXQKMrVpJkOf3jrVoLuxZbFldgdnsONLwx23aA4=; b=uJdgyKUr2/PKoDoSbsYI9xmDAA
	iiwLfZ0RpoN4FlB816Jx7sEUAqj0OkjmM9+oLoiAcfqnBplfa1ySwzl91FZmrdP89BScFMQGGiY10
	TLLy3oNb4PYdG1oBUpLy5oUi2DPZnRtXpMHZIrV5wZA7zO8FUX5YFTi0odbzF3z0feRLF2J5i7Osp
	cqpjREHHYigGT3flvSwi6mEiCiGlNz/tzPl02wjjUlW5ohIKOtpkfztHYgB3DFsOR1I7inm3FXG5d
	moPPb4SK+WH7gNceCJ8ibbnV6T0OLyEHcdIlVLn64D9YC6VQL7G+UNnHaTV9wZukwkwUo6T3cd8MG
	o5ail0/Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pUJmu-006XHR-3v; Tue, 21 Feb 2023 03:57:56 +0000
Received: from mail-vs1-xe36.google.com ([2607:f8b0:4864:20::e36])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pUJmq-006XER-PO
	for linux-mediatek@lists.infradead.org; Tue, 21 Feb 2023 03:57:54 +0000
Received: by mail-vs1-xe36.google.com with SMTP id y8so2182469vsn.2
        for <linux-mediatek@lists.infradead.org>; Mon, 20 Feb 2023 19:57:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1676951871;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=Sbe8qXQKMrVpJkOf3jrVoLuxZbFldgdnsONLwx23aA4=;
        b=GJRd2vTgRLB7Meg2mjAcO0LWEXqrYp0jZW+JDujL7OoOJvzjyHipO8tJHeVDniyNu8
         q//VIfiCaBP7w/NcQRau97s9Xak0lggHo57uzLgQeTxFpepxUeycmE66CATQ7As0zHRi
         5XIMt8ljZEVVWtyL7lr0E24bNkmc9eLcO8OUg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1676951871;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Sbe8qXQKMrVpJkOf3jrVoLuxZbFldgdnsONLwx23aA4=;
        b=ZgYz2uTLI4gysTiyMr/8BSXCR1lLsmIrT1xsbOrWBnRZq+s9ufaFTTahd49AaH2Ns7
         fzrpV9A/6C1mx1+3boMQn1tLiHW7FemKfTgREayAC7oc7dYhhCCLI/BXGHbS4XGf77Jf
         7nv8ZB/m8Psgup1tWd05u6ppyL1Z/b8xqARzSHJ3b2Z45Jc2UgwKslgmo9oXOyoO1ot9
         uwokxDrrvPLtoQcVCdEquh8z5NlxBnXDULz9CmvoGG4wZiqut0xBESmRmP3p3dNg7moP
         fA1+jpxdJREgWHHXQQEg7wtwrYTw+4HPyjrvyPqXgASsAvJCbvKfDR8hiYEBnd7OIVwr
         BQDg==
X-Gm-Message-State: AO0yUKXQ0naIbAStX6csgpDjFpnisTKKE27uMzra0F7WVMXun9fN4Xbg
	k4AchDydhjWPvcO2Iu28BpkHOuPwBkWqFvWXySvkEg==
X-Google-Smtp-Source: AK7set/Oytljy1v3YJXFROUZlTwsYws5TsLkkfjMaDGrWjewbhAS+n2E1Ju5JPAijfSBy4C0MZ9A8Y5Gh6nAi6EZlfo=
X-Received: by 2002:a67:f6c1:0:b0:411:a14d:6bac with SMTP id
 v1-20020a67f6c1000000b00411a14d6bacmr834379vso.44.1676951871830; Mon, 20 Feb
 2023 19:57:51 -0800 (PST)
MIME-Version: 1.0
References: <20230220150111.77897-1-angelogioacchino.delregno@collabora.com> <20230220150111.77897-53-angelogioacchino.delregno@collabora.com>
In-Reply-To: <20230220150111.77897-53-angelogioacchino.delregno@collabora.com>
From: Chen-Yu Tsai <wenst@chromium.org>
Date: Tue, 21 Feb 2023 11:57:40 +0800
Message-ID: <CAGXv+5FnZMZFt31zhKx=wja5F9Bm9YjEOh8K_wDf6QaoSW1dwA@mail.gmail.com>
Subject: Re: [PATCH v3 52/55] clk: mediatek: mt8135-apmixedsys: Convert to
 platform_driver and module
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: mturquette@baylibre.com, sboyd@kernel.org, matthias.bgg@gmail.com, 
	johnson.wang@mediatek.com, miles.chen@mediatek.com, 
	chun-jie.chen@mediatek.com, daniel@makrotopia.org, fparent@baylibre.com, 
	msp@baylibre.com, nfraprado@collabora.com, rex-bc.chen@mediatek.com, 
	zhaojh329@gmail.com, sam.shih@mediatek.com, edward-jw.yang@mediatek.com, 
	yangyingliang@huawei.com, granquet@baylibre.com, pablo.sun@mediatek.com, 
	sean.wang@mediatek.com, chen.zhong@mediatek.com, linux-kernel@vger.kernel.org, 
	linux-clk@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-mediatek@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230220_195752_852866_913652B6 
X-CRM114-Status: UNSURE (   9.02  )
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
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On Mon, Feb 20, 2023 at 11:02 PM AngeloGioacchino Del Regno
<angelogioacchino.delregno@collabora.com> wrote:
>
> Convert apmixedsys clocks to be a platform driver; while at it, also
> add necessary error handling to the probe function, add a remove
> callback and provide a MODULE_DESCRIPTION().
>
> This driver is now compatible with an eventual module build.
>
> Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>

Reviewed-by: Chen-Yu Tsai <wenst@chromium.org>

