Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7F339C61DA4
	for <linux-mediatek@archiver.kernel.org>; Thu, 16 Feb 2023 11:01:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=z1UJuDxc/dW2NAAvPvyR0ggXJqGR2HNPP1/APrqV7r0=; b=srbG+KPMgeaz0HOP8v0S/oj1RM
	derPEQ1gk1vYMF17pKMTGDKZIZ5YMOtD4evVpnj1AU+lCXU/DKlMSKnJ5p+4sdDcSGcx6HNr82rU8
	rm9Ku2pPwbioFYtgSOwfKYEkSoGNV3cga46xBL67J2MtRU/XJdoYG8YhuJEV0I/qq/cRHtZQTYCs4
	mccIjMTlFIHScJc60lHD5PTDobTIF7osNnn0MFv12KcjgTpa1uUVttl1C6BqHjt+U0Ry/vBogKkVw
	JvCjPHQCiZ1N9QbCmVVcwUaL062P0vBnifC/V7Wb/IlXLWpCK4XOz0uC62iU6GBFJD1g8KAwtGMCZ
	pnNAGtOA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pSc0q-009nlM-GC; Thu, 16 Feb 2023 11:01:16 +0000
Received: from mail-vs1-xe2b.google.com ([2607:f8b0:4864:20::e2b])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pSc0i-009nh3-1M
	for linux-mediatek@lists.infradead.org; Thu, 16 Feb 2023 11:01:12 +0000
Received: by mail-vs1-xe2b.google.com with SMTP id h10so1484282vsu.11
        for <linux-mediatek@lists.infradead.org>; Thu, 16 Feb 2023 03:01:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=z1UJuDxc/dW2NAAvPvyR0ggXJqGR2HNPP1/APrqV7r0=;
        b=nLnemLAnXuuMt0ZWOuk2BSImf2AMv0Hl6mdw/A2xfsn3fwTmtKH4Tz28yMOCkbBNjD
         CWhmtnqkOd2l4M3Rsc6M+xJaTujSJXYREN7Eo7R3lrld4ZWkUOAJa77crSkVoF4qVVrZ
         2bsfet+4pY9pzAohpk7SC6Kzny+PCOKpwIL1s=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=z1UJuDxc/dW2NAAvPvyR0ggXJqGR2HNPP1/APrqV7r0=;
        b=q1KrFZVTqYRCeeW08/GquGvB5d5cUpIPaGvSkz5tvgnntAnqqppjZq9eW1nXvj1Emf
         XH+i1Hy3jyf2m9P4VUmw3GlHcEcOK2m7An+0hz37nzvpkDpVdVFXclFSukRX77AUk1Uk
         R+wlnY4amV/sKc+iR72aSG3Jaxf3eLgBtaIUtxr0Dt6Dldq15oWwXpcyhnlIibA4QZPW
         D+5J+2FBUsLFJRqMDmxbkt8fODSOYWJclhrZdEUYwvdGcGqB29E6Cyuvc3RGRSa6Gn5M
         g0dRKAlQYRpMn38VORAUGBKLvlXGamDsjElCcwCW8cQehmcrDyc6t3G4nZfuzV4/yCN6
         8jgg==
X-Gm-Message-State: AO0yUKWWXNpDNvXwX4i3J96F/hFB+HEbTfloF1q7K9WhF8L/bWUuQvsl
	C3qsFsFzp3KOJcdGhTt5nO4hIVPav+AF5t/cep07bA==
X-Google-Smtp-Source: AK7set/OCcT2HX+FgGe/T2X4Ge6Yj21L72BELhl7RL8tasIGkQlgdaMzHof52fg1wx/ikQdVVp6Lm/jGEQn7wHo+e+4=
X-Received: by 2002:a67:f749:0:b0:3fc:58d:f90f with SMTP id
 w9-20020a67f749000000b003fc058df90fmr1015296vso.60.1676545266969; Thu, 16 Feb
 2023 03:01:06 -0800 (PST)
MIME-Version: 1.0
References: <20230214134127.59273-1-angelogioacchino.delregno@collabora.com> <20230214134127.59273-28-angelogioacchino.delregno@collabora.com>
In-Reply-To: <20230214134127.59273-28-angelogioacchino.delregno@collabora.com>
From: Chen-Yu Tsai <wenst@chromium.org>
Date: Thu, 16 Feb 2023 19:00:55 +0800
Message-ID: <CAGXv+5EzvWtEPyeGZJHtg0D9CvDd-j=N+C5cLoSuTUWxKL3-Hg@mail.gmail.com>
Subject: Re: [PATCH v2 27/47] clk: mediatek: mt8516: Convert to platform
 driver and simple probe
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
X-CRM114-CacheID: sfid-20230216_030108_173909_8EBB2B33 
X-CRM114-Status: UNSURE (   7.25  )
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
> Convert the MT8516 clock drivers to be platform drivers and use the
> common probe mechanism.
>
> Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>

Reviewed-by: Chen-Yu Tsai <wenst@chromium.org>

But wow this diff is hard to read.

