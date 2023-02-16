Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C01FCC636D7
	for <linux-mediatek@archiver.kernel.org>; Thu, 16 Feb 2023 08:56:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=SHowq6DBf2cQJTeoPMKiGvKAjNuUb3fl52JbQ7+XiTQ=; b=ehEAbZg/9zgSa8OPDKbHS4/90T
	KDxHVPdanh1IFGnzdp17932jgWrMJvwEzEqO8Sp9hSidxg7KYKpiC7AZ9dpU0ozz8NsYXgfCdE70j
	BgYRkMnZ/S2S+KAnPl4Jh8gSmQ1CP15jYQ+stHXKXcIBiSxcdqnkVm3KBqHL/yF4iUmknKD+Z6RjM
	GVtWaGbNDibx/FhVKt3TpXObLNWPKjRQGGyPZebMQ41MkB5J4QO+8Z9sBU7Aexow5JoKAvLDPG5kM
	CF/oiATYKHwx0E2B3yj6pOEZSVlcwSsbSg0ZQta38tkZ3+bpaMF/73FyTYQtDZo6XKNWim7weeEaY
	JJPj7ucw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pSa3p-0098VP-R6; Thu, 16 Feb 2023 08:56:13 +0000
Received: from mail-vs1-xe32.google.com ([2607:f8b0:4864:20::e32])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pSa3k-0098TP-2g
	for linux-mediatek@lists.infradead.org; Thu, 16 Feb 2023 08:56:13 +0000
Received: by mail-vs1-xe32.google.com with SMTP id q190so1174889vsa.13
        for <linux-mediatek@lists.infradead.org>; Thu, 16 Feb 2023 00:56:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=SHowq6DBf2cQJTeoPMKiGvKAjNuUb3fl52JbQ7+XiTQ=;
        b=fhvc6hUjWFRQPnJCbs+gDum3iHeWp5QtJVemXtboy3T9nV+apTLF+hpD6+8Q3K2E6i
         yL5qd4ZnxGbaHgUyFVVUCZi9pKI4I5Q6t3tqURU6rWctfCtScC5nsVIAd1XrmNBgbxaq
         jXSSbyO+OpNzI61O85gfJbT1Feed2X+YxFxpI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=SHowq6DBf2cQJTeoPMKiGvKAjNuUb3fl52JbQ7+XiTQ=;
        b=XO5MnqFMdErdJfSZnWyg9gwu8oEvr82RXZ/vrZtj3zSgQuIQgoVHKgN2kDEwDiw2ML
         WD4AZ1OpkqHr6Pe9KbkkxHDOlmqdkj1pDtLVDhZgPo+wU77/ZSpqf9BS24eDeo5xNC38
         Bjm1PZvqczCn4SZXwDycD/h6hUhStwxzUqnObzYqILo7dKMzRLQxfsOfCSRunMT6mTGF
         Gt2xuHBRBbBz+kjZzOIaoeDzb7Pt5/ImbxAXiCrPSql9msFHxKZl33NYDVg0A5kYx8YC
         eUPuHzlX/iy45GdlNeGrVCF9CqpMxXY0yGPcYX0wCbSbiPDk45yQLDAJ6sQyOI1EoI2k
         VU8A==
X-Gm-Message-State: AO0yUKVn2nv461sB9iYy1I8Px0BwAsUXr9Dml7l3PHgl0XvCasmPBbH+
	McEZ1P+xdzWw9qqJYDpr2fNVZju/AZ7zcOprbYXhvQ==
X-Google-Smtp-Source: AK7set+vp6162xHF8teoDckEkkowi9+9lSlBTLWUQzkpE/prNx60QCTqa0FZ8/nPJQXtuohzL5bzLLspqVQH4Bpkn+g=
X-Received: by 2002:a67:f749:0:b0:3fc:58d:f90f with SMTP id
 w9-20020a67f749000000b003fc058df90fmr965643vso.60.1676537766972; Thu, 16 Feb
 2023 00:56:06 -0800 (PST)
MIME-Version: 1.0
References: <20230214134127.59273-1-angelogioacchino.delregno@collabora.com> <20230214134127.59273-21-angelogioacchino.delregno@collabora.com>
In-Reply-To: <20230214134127.59273-21-angelogioacchino.delregno@collabora.com>
From: Chen-Yu Tsai <wenst@chromium.org>
Date: Thu, 16 Feb 2023 16:55:55 +0800
Message-ID: <CAGXv+5EepjwoVSZA=XFgwy_qiL3A2eZ7ZPBy-9Mb=D7OHYCjLQ@mail.gmail.com>
Subject: Re: [PATCH v2 20/47] clk: mediatek: mt8183: Convert all remaining
 clocks to common probe
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: mturquette@baylibre.com, sboyd@kernel.org, matthias.bgg@gmail.com, 
	johnson.wang@mediatek.com, miles.chen@mediatek.com, 
	chun-jie.chen@mediatek.com, daniel@makrotopia.org, fparent@baylibre.com, 
	msp@baylibre.com, nfraprado@collabora.com, rex-bc.chen@mediatek.com, 
	zhaojh329@gmail.com, sam.shih@mediatek.com, edward-jw.yang@mediatek.com, 
	yangyingliang@huawei.com, granquet@baylibre.com, pablo.sun@mediatek.com, 
	sean.wang@mediatek.com, chen.zhong@mediatek.com, linux-kernel@vger.kernel.org, 
	linux-clk@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-mediatek@lists.infradead.org, kernel@collabora.com
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230216_005608_362642_6ADDEADC 
X-CRM114-Status: GOOD (  13.48  )
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

On Tue, Feb 14, 2023 at 9:42 PM AngeloGioacchino Del Regno
<angelogioacchino.delregno@collabora.com> wrote:
>
> Switch to mtk_clk_simple_{probe,remove}() for infracfg and topckgen
> clocks on MT8183 to allow full module build for clock drivers.
>
> Differently from other MediaTek clock drivers, it was necessary to
> change the name of the `clk13m` clock, as that is already declared
> in the SoC's devicetree as a "fixed-factor-clock" (with the same
> name) and redeclaring it here would obviously fail to register the
> entire clock controller; this clock wasn't dropped only to retain
> compatibility with older devicetrees
>
> As a note, the `clk13m` clock is not mentioned in any parent names
> array(s) as the correct one (csw_f26m_d2) is already used in place
> of that.
>
> Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>

Reviewed-by: Chen-Yu Tsai <wenst@chromium.org>

