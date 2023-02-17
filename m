Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7CDD1C636D6
	for <linux-mediatek@archiver.kernel.org>; Fri, 17 Feb 2023 08:03:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=o7YPoLv0Mb3/P1pcQA1xTESl2Pe5exe78Q7w7mJljJM=; b=2M2Xnn4dzTcyzN6cYxiCzcQ6CP
	bxo6GDvzAoJhcia+kjVjjLJ9rGkiYXYqjBRWhAucXXGogOSvMr/587BH7jwFDT4+3trG1wcykgErX
	vYaaVVcMTT6ewfOhR1ViUDPv8S4W3jpE5A8QdZQnvguj2hHw/4it6JTbWnL0aeFAI94pAr1KjiBy1
	3cp9rQsUlw4nm3akZI4/5gMa6P4W8QsILwy0P17HIl66IPOlbFD5WWyQFK6X11hZ9wM+4GZoQp02O
	yU7grNCtE2FWmmGCj2K0jGIWgjI20D5JMoEpF0opWNBGgxRlbVVVeIyrJRuRFqqrN8uaWd5OqYhmG
	s70Fp8kg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pSvhw-00DCIM-L6; Fri, 17 Feb 2023 08:03:04 +0000
Received: from mail-vs1-xe2d.google.com ([2607:f8b0:4864:20::e2d])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pSvhq-00DCCz-9d
	for linux-mediatek@lists.infradead.org; Fri, 17 Feb 2023 08:02:59 +0000
Received: by mail-vs1-xe2d.google.com with SMTP id j40so2744521vsv.2
        for <linux-mediatek@lists.infradead.org>; Fri, 17 Feb 2023 00:02:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=o7YPoLv0Mb3/P1pcQA1xTESl2Pe5exe78Q7w7mJljJM=;
        b=hgJNmWlVbmB3rBcCxz0t4TFcMPdLncKPxUCjG3Ocmx0L5xNI2mLxrbeK5+MK7Kgf4W
         g9guiiB5baKztUyzX1jH4+GFsl49g1XaotdqvNRvGDukIxdrgM/g5dUl3oYiQIL/5WX8
         t8WT2cUKIhvtz8AcDDw1oJH9sp5peg++x5au8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=o7YPoLv0Mb3/P1pcQA1xTESl2Pe5exe78Q7w7mJljJM=;
        b=4luEvx22Npd/KlJyjJvagZRIsvZ3h0h2U8KgU6xPI9hPyyHAmknx5MNOKaqOky89Y4
         ez4tsx36XCaqVjTbxPyBfalf//ol2a68g0mVGBPbdri/VrNj4hT9AiwZ1CGhURICIts7
         RFbwqpByiMIQMrmSYpdFqZ58VhRKYeShIcogt9Uo3gV/hXVJtRIeK0QWABnRubO7onXu
         vBQnTC0V6JYyt4j9vXX3k3vugxsiihBPDuFfLvXcPLN9kihezIpnNurT+UMse45oOGLY
         2YtXLlfqHS/lneb6WMKID3lxgbc6lzKS+Wzqe4UpaMHp4B0Xic7Y48VqIG4uSN5D7645
         W27Q==
X-Gm-Message-State: AO0yUKWbRT8pd001Z4rv32xYpKWwxFYXPzoHxIImau9YbwPWoWWjeskY
	0ocKas0Ze8z3CQomLsGQJ5YiDcm2RLpvwpOILOa6tw==
X-Google-Smtp-Source: AK7set+guMlNO8y7qmiUXCH5/6LMKqnHADxixWgkynAREbqMIljK8xAseyTKFErWOaE0P4+CiupdVaRpkTOTx/3kut8=
X-Received: by 2002:a67:f749:0:b0:3fc:58d:f90f with SMTP id
 w9-20020a67f749000000b003fc058df90fmr1614352vso.60.1676620974178; Fri, 17 Feb
 2023 00:02:54 -0800 (PST)
MIME-Version: 1.0
References: <20230214134127.59273-1-angelogioacchino.delregno@collabora.com> <20230214134127.59273-47-angelogioacchino.delregno@collabora.com>
In-Reply-To: <20230214134127.59273-47-angelogioacchino.delregno@collabora.com>
From: Chen-Yu Tsai <wenst@chromium.org>
Date: Fri, 17 Feb 2023 16:02:43 +0800
Message-ID: <CAGXv+5EJLijrq2Mb=+HyOJmOvTPzJA_RQswOhE8DuLXUO5BeHA@mail.gmail.com>
Subject: Re: [PATCH v2 46/47] clk: mediatek: Kconfig: Allow module build for
 core mt8192 clocks
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
X-CRM114-CacheID: sfid-20230217_000258_374363_1112CCD7 
X-CRM114-Status: UNSURE (   8.94  )
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
> Bootloaders must in a way setup the SoC to boot Linux: this means
> that it will be possible to decompress a ramdisk and eventually
> insert the core clock driver module from there.
> Allow module build for all MT8192 clocks by switching to tristate.
>
> Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>

Reviewed-by: Chen-Yu Tsai <wenst@chromium.org>

