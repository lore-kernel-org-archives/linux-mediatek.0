Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 85CA3C636D7
	for <linux-mediatek@archiver.kernel.org>; Tue, 21 Feb 2023 03:58:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=L7Tcyr5dOvP+6P4gxGkarZtN6wcj1ZBVjR/UVVwdfS8=; b=HUaDofCcaRMywGhTz6pTf5Z0oG
	wHcefX00HMq77ZWO57B8nPacHdKiPvCU+udGDHcphokLKIbv8163m05EAd0JDR0RYuep3jtJSZiuT
	NgvDbO0HiCCtvEm+vtpyt4h1yq3XgbbjFO5MJIGvgoIrxttIKb+rmlgZbDNUTb3PI9LuTKG8ZNVpA
	WI1ElKTdwxC4BrFccn5isirM7fHIhKc65jhuEezmCYCXVzrzcZOtoi0NNbIDpJHxTg2sOKTZw9GwB
	myPMi4tm4HNYZ0B3eDsW7wPOz+WihZXyogMSJRLItnnyeeRHujVlkjve5HT1surlIGwalWI0zYnnP
	gL4u+MWA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pUJnm-006XjF-RJ; Tue, 21 Feb 2023 03:58:50 +0000
Received: from mail-vs1-xe2f.google.com ([2607:f8b0:4864:20::e2f])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pUJnV-006Xb0-KF
	for linux-mediatek@lists.infradead.org; Tue, 21 Feb 2023 03:58:35 +0000
Received: by mail-vs1-xe2f.google.com with SMTP id f31so2891124vsv.1
        for <linux-mediatek@lists.infradead.org>; Mon, 20 Feb 2023 19:58:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1676951913;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=L7Tcyr5dOvP+6P4gxGkarZtN6wcj1ZBVjR/UVVwdfS8=;
        b=IGCWsSkkutgh0okrfT7uNFy1RET6SsVtvhWs/LxdEJVE8B7tM6E3UEw//b+M/52lAZ
         l66CsyZgEsgVv0gZWtiop9xYWuA1CQw/7tUTKesUiToMpqgi57toBLVQOxWgj787HSjH
         MS6+Q7uiQAejEqu1bQJqsIfCOQQWiq1wvAvRw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1676951913;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=L7Tcyr5dOvP+6P4gxGkarZtN6wcj1ZBVjR/UVVwdfS8=;
        b=HNLPr8RgYuTz3beQsD53h8fvZojPOrcvTyGux+EDtuxSMWwLFACxViImRWX+ix8Q8P
         B/6HoQXQgM4aZAmbm3zE4fLv+VnXpGzDbRcqCjSMbUOJTY7u8G08Hj+ivmxYXdAcDKZx
         YaOIbR4VPM/NoTfWH6xNOFZJgBQEcxsLZmN9wHe9ffGGpymJm4hhpjQAEwHppk9ztWyG
         otTgt9MhEaQMGtiBEhWvI4C75zaora43K+WQaSJNmajl8r1yGwDvdNStINr9Bv37BjGU
         a/2P+O8ucxs06p9q9/U4bYl2nRb1Ml51f8BJanmrr5dqfWv3vfp8o1xaWG6/yonQTO1f
         9cEw==
X-Gm-Message-State: AO0yUKVMNEL/SG6AJJy2o/jh0rwGOJChou6VMc1Q7OWWb2xD8XhgjAIz
	usaOGxmYxshBv8MRaQHesR3VFLInlN64/iirIgpL3Q==
X-Google-Smtp-Source: AK7set/CV/ZM7hd/l3fjmImnECupChh8gWI0Feh0+HOI2S1BX5lITZZjvlZgjwhlppcpeUrVOzbCiYwLLNVX2ZFcm+U=
X-Received: by 2002:a67:f6c1:0:b0:411:a14d:6bac with SMTP id
 v1-20020a67f6c1000000b00411a14d6bacmr834615vso.44.1676951912861; Mon, 20 Feb
 2023 19:58:32 -0800 (PST)
MIME-Version: 1.0
References: <20230220150111.77897-1-angelogioacchino.delregno@collabora.com> <20230220150111.77897-54-angelogioacchino.delregno@collabora.com>
In-Reply-To: <20230220150111.77897-54-angelogioacchino.delregno@collabora.com>
From: Chen-Yu Tsai <wenst@chromium.org>
Date: Tue, 21 Feb 2023 11:58:21 +0800
Message-ID: <CAGXv+5Ge2aLLTLHajzdwRYtWU3akcZuo8e8z2niVqKMhzR4x5Q@mail.gmail.com>
Subject: Re: [PATCH v3 53/55] clk: mediatek: mt8135: Join root_clk_alias and
 top_divs arrays
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
X-CRM114-CacheID: sfid-20230220_195833_692959_F8FF4E70 
X-CRM114-Status: UNSURE (   7.52  )
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
> In preparation for converting this driver to the common simple probe
> mechanism, join the root_clk_alias and top_divs mtk_fixed_factor
> arrays.
>
> This commit brings no functional change.
>
> Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>

Reviewed-by: Chen-Yu Tsai <wenst@chromium.org>

