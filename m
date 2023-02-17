Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6837BC05027
	for <linux-mediatek@archiver.kernel.org>; Fri, 17 Feb 2023 04:23:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=qMJrW3rbhiV2WpI8udS44p8yxQXPp4OR7zwWUWrBLQY=; b=MelZM234LIugXvsFT7O9rI84iW
	17kYTzKe8IgoBCtD9M6aaIzApMf8aJJcWbQY5mJR4pUPQM2ldliDbByCNUbm0m4th7n0xb+vC26m6
	jIp/2kRqIgSCEvG/J/HQCrUBxOZ9YKyn6bFLfh2lbbNP5YqjEV96ZLyD4wBPlnWVsXLtiEAHaPanM
	VoOQWswpnaJA+UVnusE9C0yfqTUaQFeHKyV93uMM2foxAyYejIx9BEH9I1h5ljoUao6IhDv15sGQU
	sVfKknlfKfTH5OkuaLnKpj5cg8p/YpARatrPI6Uxba3JAJ0uatSUW8cr7UxuO6Hn/v7Ro3p/o96XL
	X4ORonbw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pSsH2-00CeSG-2i; Fri, 17 Feb 2023 04:23:04 +0000
Received: from mail-vs1-xe34.google.com ([2607:f8b0:4864:20::e34])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pSsGy-00CeR7-Iy
	for linux-mediatek@lists.infradead.org; Fri, 17 Feb 2023 04:23:01 +0000
Received: by mail-vs1-xe34.google.com with SMTP id d66so4310493vsd.9
        for <linux-mediatek@lists.infradead.org>; Thu, 16 Feb 2023 20:23:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=qMJrW3rbhiV2WpI8udS44p8yxQXPp4OR7zwWUWrBLQY=;
        b=cb+NU7/hOrbeIcSAvzvU+tZuwXMCxS0dDxTkUfSdzU72XQQPcT8u+iahlUuOdzU6G+
         untKhF7BuSkJYwsQTHm2q81nQF5w/Vk7P/NK54b2hAojRwwkWbK/gDWpIWeVE6Wxlhyx
         yTIo8iQGaV/K4usRg+HpQ1zTWM40TWLc9vt3E=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=qMJrW3rbhiV2WpI8udS44p8yxQXPp4OR7zwWUWrBLQY=;
        b=woaXG/JGT+o7AFMke/02Xgc8zd/xKIcXM/ShUO1Hie0NxkrORzO/Kzcg/FVogunW6Y
         hNUaATSWLlodSJ5nTlOMmC13sldcZgQRT4GBrNlYHwLWkXBmnARMkFvcE87gad1K+k8H
         tN/pu0XlGqalI7HW3Si6/f4ff9S7DfGURCCoOMIUQL8Dfre2kuZ+VHiopy91n/miGniM
         7L9t1bT1qCwVuladeTbygDQRJfUoZXAp9gcBy+2yy13G7CA4XOTIA6Kbdyc+FsqByBAR
         AIvTa2yQ5Yt5a5bxIHnWS5uqsKANY+1Fj2Z/jMmgD+e+RSC/jORcCIDv7J5QlbYiWCA4
         TkNw==
X-Gm-Message-State: AO0yUKXcB3CEmbTpj0zQEKP2bx3u8MuvseRPEdpNJB9mma994gu+5LSm
	EyfKF9u3+JOEmn/x2r/A3p0yISwNpGHyjgUljAVfuAdf7pVXKA==
X-Google-Smtp-Source: AK7set9vsLwX+gthcvL2Wxef+YafrTV4xzfWZkMbI8ss4V/DiE2fTut21H1Wtq3OHhxIlP71d2IMxXbDSdVrl7GcBi0=
X-Received: by 2002:a67:f749:0:b0:3fc:58d:f90f with SMTP id
 w9-20020a67f749000000b003fc058df90fmr1529005vso.60.1676607779821; Thu, 16 Feb
 2023 20:22:59 -0800 (PST)
MIME-Version: 1.0
References: <20230214134127.59273-1-angelogioacchino.delregno@collabora.com> <20230214134127.59273-36-angelogioacchino.delregno@collabora.com>
In-Reply-To: <20230214134127.59273-36-angelogioacchino.delregno@collabora.com>
From: Chen-Yu Tsai <wenst@chromium.org>
Date: Fri, 17 Feb 2023 12:22:48 +0800
Message-ID: <CAGXv+5HHQ+ZQt6CVOKKvef5CQVWe1AW6N07GSUCBuFZc5P=59Q@mail.gmail.com>
Subject: Re: [PATCH v2 35/47] clk: mediatek: Add MODULE_LICENSE() where missing
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
X-CRM114-CacheID: sfid-20230216_202300_638145_22E2E659 
X-CRM114-Status: UNSURE (   8.24  )
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

On Tue, Feb 14, 2023 at 9:42 PM AngeloGioacchino Del Regno
<angelogioacchino.delregno@collabora.com> wrote:
>
> In order to successfully build clock drivers as modules it is required
> to declare a module license: add it where missing.
> While at it, also change the MODULE_LICENSE text from "GPL v2" to
> "GPL" (which means the same) on clk-mt7981-eth.c.
>
> Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>

Looks like all files have it now.

Reviewed-by: Chen-Yu Tsai <wenst@chromium.org>

