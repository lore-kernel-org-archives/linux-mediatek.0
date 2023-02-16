Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4E736C636D7
	for <linux-mediatek@archiver.kernel.org>; Thu, 16 Feb 2023 08:12:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=dfTtDbofkY1pATTMEv/SAf76IfaGsSIyYJtG+jJyho8=; b=rZhzCUgQzxj2UzZXHEzMuCATjA
	XljYSfzpUpHMJ+FNT3SfQOWKIm9qX8isernPmazlvW1jitoQrH3ltVYCg+SWDQbUZ46+p9SroYVqw
	0366Nc9ceXhRjHlmBNUAs4yf84XBSYRC62e1EF/VKjv1F7UrrkNJ/m2+U0lRsIkaiXrDaKtnYDUFx
	8qFz3mOA4J8QV7B56sXDl6E6Fr/Lda/OCAa1qRlmbnuwuhb/De3WNvJ2H45CeuYFW5LxhvDH1sj2C
	tfudRJMwwGZIVLg2UL35AawTaULqD1ido2NDvQHPD0dCEAkLbBJkOW79Adv5Hw/Wf4L5dMa76MqAk
	YFP/ufAg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pSZNC-008wUt-0S; Thu, 16 Feb 2023 08:12:10 +0000
Received: from mail-vs1-xe35.google.com ([2607:f8b0:4864:20::e35])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pSZN9-008wTO-Kq
	for linux-mediatek@lists.infradead.org; Thu, 16 Feb 2023 08:12:08 +0000
Received: by mail-vs1-xe35.google.com with SMTP id z15so1092402vsj.12
        for <linux-mediatek@lists.infradead.org>; Thu, 16 Feb 2023 00:12:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=dfTtDbofkY1pATTMEv/SAf76IfaGsSIyYJtG+jJyho8=;
        b=lySNA01DIQWkgwtRvj/X6Ob8tzm+Mn+oE9MXXNMKCbzvD9/ImDRgbys0KYR05gATMg
         LzjYmu0MdtH7jHJ/j02SeRJC7YJcrsh+Yc/RdgaLqqNjaRmafziWbucC1pGdMsO/eK1K
         Py/e5RdiSHfWAh/qPd2tLOt2MiqOxsRoiL19Q=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=dfTtDbofkY1pATTMEv/SAf76IfaGsSIyYJtG+jJyho8=;
        b=wE22SeoRTgKn20PTgmnHkd6VfRRvfsCY99LeYhnADQELRrwlxjhPotORs5CyQNHajE
         q1pBt9wDRH7K7viz1xafFApQAFHHvyDqUudiFdj8/MDmd46jY2aSMcxne1sKcCT56C9M
         ljVTRVJClAow9IkYHXog7WvKdZ82dKwDbB1dx7RYYWXv0lY6jGvg0Evd2m9Fvx1Oa81d
         EJdLaEeLCgyQ0J+6Y8fIOPZWk7EVyOb7yqe5xUHSUbVAXYs83R4Q9NJy+WiUrEDs2ecx
         s8Yo2E5g7xpu/ebh5dWLpHkUsuOFINXfIe6L9rxpRGgB3m9Y0Gn9sc/3PIkGf9gZJHPx
         /VXQ==
X-Gm-Message-State: AO0yUKXWcM+EAleR5Ff3lKWcTcyO+2Nqx80WyFhpjfklw0fOxtYRHDr+
	WcBAv2JhkV33shKWyQGcF+ypTIOwFZoxvC35pHI/bQ==
X-Google-Smtp-Source: AK7set9GLZD9CV/33MRERq3c7/9G84mUxES45gMMthrTTkVHz/fhYLvw9tN1hgVZOMakIs5IYmKdncbES1i/ffC40Zg=
X-Received: by 2002:a67:f749:0:b0:3fc:58d:f90f with SMTP id
 w9-20020a67f749000000b003fc058df90fmr948306vso.60.1676535126416; Thu, 16 Feb
 2023 00:12:06 -0800 (PST)
MIME-Version: 1.0
References: <20230214134127.59273-1-angelogioacchino.delregno@collabora.com> <20230214134127.59273-19-angelogioacchino.delregno@collabora.com>
In-Reply-To: <20230214134127.59273-19-angelogioacchino.delregno@collabora.com>
From: Chen-Yu Tsai <wenst@chromium.org>
Date: Thu, 16 Feb 2023 16:11:55 +0800
Message-ID: <CAGXv+5EVLKwf8F9SxauWP4O61wxdEFwk7hhir16r82Xp-pDe7A@mail.gmail.com>
Subject: Re: [PATCH v2 18/47] clk: mediatek: mt8183: Move apmixedsys clock
 driver to its own file
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
X-CRM114-CacheID: sfid-20230216_001207_723164_25D6F205 
X-CRM114-Status: UNSURE (   9.14  )
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
> In preparation for migrating all other mt8183 clocks to the common
> mtk_clk_simple_probe(), move apmixedsys clocks to a different file.
> While at it, use the builtin_platform_driver() macro for it and fix
> some indentation issues in the PLLs table.

You also implemented error handling. That probably deserves a separate
patch with a Fixes tag.

ChenYu

