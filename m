Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D50ACC64EC4
	for <linux-mediatek@archiver.kernel.org>; Thu, 16 Feb 2023 11:02:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=BdECL0nWuOhxxQUzq/mcwRUPnRSLFDs596FGLIMR9pc=; b=T+OqqzqpiTnkzF65498J2MwbpO
	05RyHgHK/QJwCWq6LBjGnCSKXAr3OwrDJ3Finc4wB+cPvyubquZQOYHicjruxluLFmLVwB4ItQaPI
	YdWWdP36S7P1xSCZVDnz3jT3DsM2G4wiVH5aPy1pzX35QUI93jOaIFX4riqUqzbidyDOn7LswLRgw
	AI5P4mOz3AlHBKe19NicXOAtzR2xZmm9BtE3KSjvceq3K9YsKvS9z6Jv0idG48tQ1kdUgf3gkASp5
	1x2S8u0HTZPRsOYWDOQwsSzTUw+yqlpMPl87gIS3xWq4E4MMo+lZVIbZiGXn3wjZi65cFM2ATxEQ6
	XFxQfOrQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pSc29-009oOG-MZ; Thu, 16 Feb 2023 11:02:37 +0000
Received: from mail-vs1-xe33.google.com ([2607:f8b0:4864:20::e33])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pSc16-009nsA-1N
	for linux-mediatek@lists.infradead.org; Thu, 16 Feb 2023 11:01:33 +0000
Received: by mail-vs1-xe33.google.com with SMTP id w22so66805vsf.13
        for <linux-mediatek@lists.infradead.org>; Thu, 16 Feb 2023 03:01:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=BdECL0nWuOhxxQUzq/mcwRUPnRSLFDs596FGLIMR9pc=;
        b=Y2oOU8cyEJwEh700yB/7z2QJu2Bcxy3bkWsnI1OtkkcuKXE0+3Uil6KfV+8akOLw8y
         to9XpIffITAWrGVJ0oUrBWYHYBUFRD37sLkmgWZFGT56TJjoSmMYDTrAvaFvPeh1o22S
         BUny0HCn9pdX8tD1l1xOcUydoBcifTNPBDp8s=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=BdECL0nWuOhxxQUzq/mcwRUPnRSLFDs596FGLIMR9pc=;
        b=gEIufSaPMuIB8I/F3TvEkThzdXIHB9uGHTUNQ2LeZ+/fLB1MFa3uy/Wxr0LDTCnj5T
         swbXiHgj7WU5fiV2cU3Sm4YXCVw1q+pyFCQuiWJSDBLtZbuvJaKErNO2FvLrmUPBVEm8
         1MlIrTBENR+4Q09ngGKry2xLx3rytrRSNO/Mc/pKtLq0HJn2UcmOY1NqbKYDVgm1qs9c
         n3pM8sp4V3lB+JQAell7R2ASwLwtYLXdtPGQZUyQNugVllhi5hHh49Ri7Ux6KVJuWKA2
         zBmXutYHr9phTAGdn2Xbu7kBc3MDzEmzDvLTPQqQh74bzCY0mq2ctBHnoFMf2sbqPx3a
         M7Mg==
X-Gm-Message-State: AO0yUKWqH2xYjEalM+FkdFIEOvhAMtMQJYcXklxqLLx+AM3V8BuEXQpk
	qbUy7M5vgu7IESXZQ0NFNZXfTOCnW+LyMqvISVXFVw==
X-Google-Smtp-Source: AK7set/IA9hmi0kwDAgoklZpazoBjsCfVSxcouOI1lZeu5WRYfZai2E2MPhF1VyHs6yD9YxZM6pQqZxHx1mPiUZlaKw=
X-Received: by 2002:a67:f749:0:b0:3fc:58d:f90f with SMTP id
 w9-20020a67f749000000b003fc058df90fmr1015471vso.60.1676545289161; Thu, 16 Feb
 2023 03:01:29 -0800 (PST)
MIME-Version: 1.0
References: <20230214134127.59273-1-angelogioacchino.delregno@collabora.com> <20230214134127.59273-29-angelogioacchino.delregno@collabora.com>
In-Reply-To: <20230214134127.59273-29-angelogioacchino.delregno@collabora.com>
From: Chen-Yu Tsai <wenst@chromium.org>
Date: Thu, 16 Feb 2023 19:01:18 +0800
Message-ID: <CAGXv+5EhnDu-=hnyDZoYMBgQhLPpyP+TYgt+hsXVHz49P61KFg@mail.gmail.com>
Subject: Re: [PATCH v2 28/47] clk: mediatek: mt8516: Allow building clock
 drivers as modules
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
X-CRM114-CacheID: sfid-20230216_030132_092438_FD66AEE0 
X-CRM114-Status: UNSURE (   7.36  )
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
> Now that all MT8516 drivers have been converted to platform driver,
> change the configuration options to tristate.
>
> Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>

Reviewed-by: Chen-Yu Tsai <wenst@chromium.org>

