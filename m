Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 05CB2C636D7
	for <linux-mediatek@archiver.kernel.org>; Tue, 21 Feb 2023 03:39:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=eyR7hb6+4nnohx1Os+xJuDUE4j0WlgtLqxQEIptIJGc=; b=DL3n6oZrbSE27/Tf5jMp1iS+Hi
	CXohNyjgT+Khd9RNvUjotvvOWfbDcMsJar1Z2vXEHCTC4U+snxw+RLjQNwqHLYDyDddt/l7NN8f1R
	67Jbh1vy4cmbzG3EfmKten4sFSWh3vHL1mFHoVbM+mrBI5D1GvTwPhQdR2KyOAL4C4oNum/s+VL31
	zuZFNGmzZQM4vn++5OvjZw/NqnwtCtBZYfVSLVK5S3Irto0UpeL1Aqi5gKb84zBrjXmTSbObD+I9t
	W0u1ym1faBE/yzb1Hz0bdZfj7YAhaFtXPamJLVfCiD2yO4fNc1uY2RVM0pXT+5R7jeeZWjvY45umK
	d7SC+Ixg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pUJVL-006SId-VD; Tue, 21 Feb 2023 03:39:48 +0000
Received: from mail-vs1-xe36.google.com ([2607:f8b0:4864:20::e36])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pUJVI-006SHa-Kx
	for linux-mediatek@lists.infradead.org; Tue, 21 Feb 2023 03:39:46 +0000
Received: by mail-vs1-xe36.google.com with SMTP id v3so2582917vse.0
        for <linux-mediatek@lists.infradead.org>; Mon, 20 Feb 2023 19:39:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1676950783;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=eyR7hb6+4nnohx1Os+xJuDUE4j0WlgtLqxQEIptIJGc=;
        b=EH9Gs94+bMfCqoMpwo0blYpUtwBOlTqv5J56zeGIbkMnPE2IWzW0qkSqhNjrmciPj5
         NinIep+5pkpc1/y6LpPdT66tfyHugn+Tbcr2qiB5AZggTM4yT/xmLE1T5if0wKxoFZgJ
         GfNpN1vpgHOjyrQtbH5Reh1C1Hu8vyf19mdx8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1676950783;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=eyR7hb6+4nnohx1Os+xJuDUE4j0WlgtLqxQEIptIJGc=;
        b=peSBSmgw0gu6Wi/G/Bf3Sxw+o0Ne9Jun1jU+Rqe7ObXF1fJi6tI09fFhVV7HEmyHOu
         zrM2au48O5+fFXBnqWOecn09fpjCAVkrFwF14lq41px8sgmWRLdgjxgHgyRapb97hqvE
         0JbqI7wfKMTrwljcZkySHaFUdCcDpIQa43DqO/XFI0UBtfOFwhmOidh415A4FrvK623z
         HrZCZ8+b1ZVPEfT/vArS12x0owQ90V7dnPrI7h1QUlcXSrX4etlyMSrLfJAlrHUp1YCB
         C8fUj/67C7r69Juh6r3u+gCTtd4EDkn9imvDidJJfDrNHgeA3zb/cNzlvr8klxMRQVqo
         ot1A==
X-Gm-Message-State: AO0yUKXlpxljGOBdVxL8c8HW9th7bvGBNKYhyehFn8tAlkwFfDYX3mk4
	mh826yYtpPVsDzgerNo1zI+Frg31qjHh71UxeE2oJQ==
X-Google-Smtp-Source: AK7set+D349/5265yL0xKdvrfFIsomu5l6hLeBBkm5qE9AONzbCuJgnYXdR0E3W2E+MqupsPm0Wi6fjuhGasUAmEV/k=
X-Received: by 2002:a67:f6c1:0:b0:411:a14d:6bac with SMTP id
 v1-20020a67f6c1000000b00411a14d6bacmr828458vso.44.1676950783217; Mon, 20 Feb
 2023 19:39:43 -0800 (PST)
MIME-Version: 1.0
References: <20230220150111.77897-1-angelogioacchino.delregno@collabora.com> <20230220150111.77897-20-angelogioacchino.delregno@collabora.com>
In-Reply-To: <20230220150111.77897-20-angelogioacchino.delregno@collabora.com>
From: Chen-Yu Tsai <wenst@chromium.org>
Date: Tue, 21 Feb 2023 11:39:32 +0800
Message-ID: <CAGXv+5FhOnGfCOuWfNY8EgSzJ9Su7peukJh5YGQWJ4ZFV9u0Bw@mail.gmail.com>
Subject: Re: [PATCH v3 19/55] clk: mediatek: mt8183: Move apmixedsys clock
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
	linux-mediatek@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230220_193944_719855_2AFF6A1F 
X-CRM114-Status: UNSURE (   9.72  )
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

On Mon, Feb 20, 2023 at 11:01 PM AngeloGioacchino Del Regno
<angelogioacchino.delregno@collabora.com> wrote:
>
> In preparation for migrating all other mt8183 clocks to the common
> mtk_clk_simple_probe(), move apmixedsys clocks to a different file.
> While at it, use the builtin_platform_driver() macro for it and fix
> some indentation issues in the PLLs table.
>
> During the conversion, error handling was added to the apmixedsys
> probe function.
>
> Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>

Reviewed-by: Chen-Yu Tsai <wenst@chromium.org>

