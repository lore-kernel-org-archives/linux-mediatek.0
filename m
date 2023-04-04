Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8C155C76196
	for <linux-mediatek@archiver.kernel.org>; Tue,  4 Apr 2023 00:05:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	Message-ID:Date:References:In-Reply-To:Subject:Cc:To:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=M8biJ1aBbukeLfwN+w/+0iRNiLUjgXR0WEnlqTCaXvw=; b=rJL4b8ajXq/fZVWTPnq2EKinIi
	7MnXz5mDpNBZIPrPhmEvM3Hr+BMH50hAMS72AZB/FeS8wFCgH30VggOCTA2LknsCCgBZwzKhJgkDC
	J8LAPf4WOVORO6w3ph8n1u4YEnhSgi3ObCDZ7TGZwSWzpY6QvNsmup0rET0S9ju3MT+6oZ3KrR3Nr
	Ke7yeOgVrrSyqnWQP8QMGlj0kRsPOULr46HZXq6D5+/bcBGeYCGJ1dT5ZbPTxInV2EpihITwBF/I+
	HvucJNXmlNsbJWT5+xAX+QvnGVWdtiWTsQ/fbSeSUalWYe1ZetZ1Yix1kmSwDd/QpLc6PZRDx+odh
	HF7MKj8A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pjUB9-00HEns-3C;
	Tue, 04 Apr 2023 00:05:39 +0000
Received: from mail-pj1-x102e.google.com ([2607:f8b0:4864:20::102e])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pjUB4-00HElp-1U
	for linux-mediatek@lists.infradead.org;
	Tue, 04 Apr 2023 00:05:38 +0000
Received: by mail-pj1-x102e.google.com with SMTP id e15-20020a17090ac20f00b0023d1b009f52so34353304pjt.2
        for <linux-mediatek@lists.infradead.org>; Mon, 03 Apr 2023 17:05:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20210112.gappssmtp.com; s=20210112; t=1680566733;
        h=mime-version:message-id:date:references:in-reply-to:subject:cc:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=M8biJ1aBbukeLfwN+w/+0iRNiLUjgXR0WEnlqTCaXvw=;
        b=cJ8T/bJ/DOKAf5nPWS/rWDTVm5GpHso3ZRrEV+vv/Y9tK1iJ1LvxG/PjhLoWc2X7v0
         xfAPyqZiCwKAbYX0+uehzDGsNpUcQ6rg1OoGarzIZlCwpeY5w9m2WdijxQ7izEpECs4M
         TAXm+/kJS5p1rWZPMcIKgC6G8GsyGTQuf1eeN42nzoTeo4qlwHaYExuqTohl+5AeWpp3
         mA5+2sEw9ojFwihpo5wYxtr7G6YPDyweOcVKSWCjRx1AG8oXLPg3+7f3Vowy+0ND0dZj
         QvDtcQu8r7V7irKHgcvR7wVNDghGRfzHu9PHGXcdX8o7ky+hObMDXdkvKI4ai1ST/csE
         y4mA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1680566733;
        h=mime-version:message-id:date:references:in-reply-to:subject:cc:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=M8biJ1aBbukeLfwN+w/+0iRNiLUjgXR0WEnlqTCaXvw=;
        b=1lgLBVJeITAERqNgVo7jyEwpb/tWVDDdeEiqGvCrLuKYRLrPcNwvgg0zyHlpgSDe5k
         xAUfR5/DFCaCGMYNPMVAbOGnU/rNAHAy0HPrkb3OEKzdfIrA7zVavwHagmIGVsaARwx8
         wXgEt5aI++5qKbE8/4+i1E18+TTwMdaKXyFL+j+Ojwew/nQLr2TGW4VlnuVnPqqssz48
         ivtaQW6/MUSTB6PeWIqzlqXGURT/5h0ZhVl7Lze2FUTPGRMEnwGmTavbCWAd6zWCYKER
         xa6vKXmFd27OX3D4ZavqgIZBZqJNSPb+42l2Tn19eqrxQHAqvh5kfIANdjZpnPdQqjtp
         cWmw==
X-Gm-Message-State: AAQBX9fzpGethbOlAI6NIc0BaSJFTp3s3MxGRCGFl+uylo16BnSfAEPw
	N0lNQ5HG6FFYLVSTTRxk4N+AtA==
X-Google-Smtp-Source: AKy350a8EOWlE6/ey6qlDm4l3M/bElNRWs6BENfSo8Yhhz4VqjfFZVoicQqCKM9Tl+bt2b6qzQPHBw==
X-Received: by 2002:a17:902:f545:b0:1a1:a996:feb3 with SMTP id h5-20020a170902f54500b001a1a996feb3mr1094215plf.26.1680566733293;
        Mon, 03 Apr 2023 17:05:33 -0700 (PDT)
Received: from localhost (63-228-113-140.tukw.qwest.net. [63.228.113.140])
        by smtp.gmail.com with ESMTPSA id y1-20020a170902864100b0019c61616f82sm7098625plt.230.2023.04.03.17.05.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 03 Apr 2023 17:05:32 -0700 (PDT)
From: Kevin Hilman <khilman@baylibre.com>
To: Alexandre Mergnat <amergnat@baylibre.com>
Cc: Wim Van Sebroeck <wim@linux-watchdog.org>, Guenter Roeck
 <linux@roeck-us.net>, Rob Herring <robh+dt@kernel.org>, Krzysztof
 Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Matthias Brugger
 <matthias.bgg@gmail.com>, AngeloGioacchino Del Regno
 <angelogioacchino.delregno@collabora.com>, Chaotian Jing
 <chaotian.jing@mediatek.com>, Ulf Hansson <ulf.hansson@linaro.org>, Wenbin
 Mei <wenbin.mei@mediatek.com>, Linus Walleij <linus.walleij@linaro.org>,
 Zhiyong Tao <zhiyong.tao@mediatek.com>, Bernhard =?utf-8?Q?Rosenkr=C3=A4n?=
 =?utf-8?Q?zer?=
 <bero@baylibre.com>, linux-watchdog@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org,
 linux-mmc@vger.kernel.org, linux-gpio@vger.kernel.org, Alexandre Bailon
 <abailon@baylibre.com>, Fabien Parent <fparent@baylibre.com>, Amjad
 Ouled-Ameur <aouledameur@baylibre.com>, Krzysztof Kozlowski
 <krzysztof.kozlowski@linaro.org>
Subject: Re: [PATCH v4 00/11] Improve the MT8365 SoC and EVK board support
In-Reply-To: <CAFGrd9qLzcDJO_Fk_-B6XYuuxQzQoYLXmdp0Qj1Tszr0-sqNgw@mail.gmail.com>
References: <20230203-evk-board-support-v4-0-5cffe66a38c0@baylibre.com>
 <7hy1ncydtc.fsf@baylibre.com>
 <CAFGrd9rKy9a4bUf1dkUtTogtWPFr5eu3jcsdaixi3hs_dWMwrg@mail.gmail.com>
 <CAFGrd9qLzcDJO_Fk_-B6XYuuxQzQoYLXmdp0Qj1Tszr0-sqNgw@mail.gmail.com>
Date: Mon, 03 Apr 2023 17:05:32 -0700
Message-ID: <7h1ql0y0j7.fsf@baylibre.com>
MIME-Version: 1.0
Content-Type: text/plain
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230403_170534_501539_520A18C2 
X-CRM114-Status: UNSURE (   6.55  )
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

Alexandre Mergnat <amergnat@baylibre.com> writes:

> Here a build-able & working branch with dependencies:
> https://gitlab.baylibre.com/baylibre/mediatek/bsp/linux/-/commits/amergnat/i350-evk-board-support

This branch doesn't compile.

Kevin

