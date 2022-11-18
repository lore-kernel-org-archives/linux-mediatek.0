Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A8A92C433FE
	for <linux-mediatek@archiver.kernel.org>; Fri, 18 Nov 2022 20:28:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Message-ID:Date:References:In-Reply-To:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=0XBIIsbYjFQlxqPutQtC3YZdHA7lM3DSVyPcn1CRdwE=; b=iwlGyWWqDE2pwc3AxNW2nnKszB
	3AAlI9YDQhpGsKPmtPCcRPpvMwOlG/4yOOCS/4gvoJ7bdxyVyHzIeo7X+IaTF+Y55eJiWqv76EG+0
	vuo3AquLJ/wC5IZKG7ginTCCMIqTvsRbZTHuL8APmFRCZhzCA7dyJ8EInFk0/j0RN4YKI8ZjZzrm/
	8HUj6LXxAMB3CGuzKpxaYtAUY98ZIHTAuObUHmPAsI8VuqZgdL+0WULg9U081rm+EGDQQ7cvwaOUC
	adlZuLm0ngnEIHXjCaUVoj68PpZNuVfxleYr1arRDivVgRKkLTJRyFP1AeefvC/jDsSVKsW8PN8TS
	baYE3DlQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ow7y2-007vK5-RV; Fri, 18 Nov 2022 20:28:06 +0000
Received: from mail-pj1-f44.google.com ([209.85.216.44])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ow7y0-007vJ9-1v
	for linux-mediatek@lists.infradead.org; Fri, 18 Nov 2022 20:28:05 +0000
Received: by mail-pj1-f44.google.com with SMTP id w4-20020a17090ac98400b002186f5d7a4cso5765310pjt.0
        for <linux-mediatek@lists.infradead.org>; Fri, 18 Nov 2022 12:28:02 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:references
         :in-reply-to:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=0XBIIsbYjFQlxqPutQtC3YZdHA7lM3DSVyPcn1CRdwE=;
        b=xtsyYM2aNxf0Pff/l2KHe3HUfH0WhxD76rADgH+pEZnF+XfE6BVRuUwzW1FkTutueW
         A7Ec4yIH4fiTT/dEtuOAGYiW++U7YQiEpuE7+TTH9bkr6oIG62B5k5SP+7d0f0lxPpoE
         l3j4JuL8BRdzxnLsaM+eI4Cq6WHe0VqGsBzMXz2eu8qkGpX4Jfml1mWHGIg97FG0FrG3
         gNA17V9uHm4Q+NNEEkqyqaH7XxrdC5ZIAaYk/PlIkNvNnWUCAaa5rCFBqpBx39MhHstu
         PQ25QMBcOctmXGxDyLystlv4/UA+rtJJ6nRIYTQqelZvQ3aAqjfrcANhsbeJvS/eE1Kq
         JeYQ==
X-Gm-Message-State: ANoB5plD7bcNAfQoT4O1woJi5SfeGfFS3ZLBTP1Ss3w+3IGkMKQpjPMe
	cseG0BdmVKnWeydtHSNgNltGEA==
X-Google-Smtp-Source: AA0mqf4WqWyM2o3krfJjKP6HKQ83bfsi3Jrz07p/fPicZ49O43m8mXK8WX3ZaOquvP7dOZrMFsJZjw==
X-Received: by 2002:a17:902:ccc7:b0:17e:4b8a:827c with SMTP id z7-20020a170902ccc700b0017e4b8a827cmr1112491ple.115.1668803281786;
        Fri, 18 Nov 2022 12:28:01 -0800 (PST)
Received: from localhost ([75.172.139.56])
        by smtp.gmail.com with ESMTPSA id ix11-20020a170902f80b00b001788ccecbf5sm4118348plb.31.2022.11.18.12.28.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 18 Nov 2022 12:28:01 -0800 (PST)
From: Kevin Hilman <khilman@kernel.org>
To: Bernhard =?utf-8?Q?Rosenkr=C3=A4nzer?= <bero@baylibre.com>,
 linux-mediatek@lists.infradead.org
Cc: linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 devicetree@vger.kernel.org, robh+dt@kernel.org,
 krzysztof.kozlowski+dt@linaro.org, matthias.bgg@gmail.com,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Subject: Re: [PATCH v3 7/7] arm64: dts: mediatek: Initial mt8365-evk support
In-Reply-To: <20221117210356.3178578-8-bero@baylibre.com>
References: <20221117210356.3178578-1-bero@baylibre.com>
 <20221117210356.3178578-8-bero@baylibre.com>
Date: Fri, 18 Nov 2022 12:28:01 -0800
Message-ID: <7hy1s880tq.fsf@baylibre.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221118_122804_167002_36A225EE 
X-CRM114-Status: UNSURE (   6.42  )
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

Bernhard Rosenkr=C3=A4nzer <bero@baylibre.com> writes:

> From: Fabien Parent <fparent@baylibre.com>
>
> This adds minimal support for the Mediatek 8365 SOC and the EVK reference
> board, allowing the board to boot to initramfs with serial port I/O.
>
> Signed-off-by: Fabien Parent <fparent@baylibre.com>
> [bero@baylibre.com: Removed parts depending on drivers that aren't upstre=
am yet, cleanups, add L2 cache]
> Signed-off-by: Bernhard Rosenkr=C3=A4nzer <bero@baylibre.com>

Tested-by: Kevin Hilman <khilman@baylibre.com>

Boot tested on mt8365-evk and works well.  When this lands we can get
finally this board into KernelCI. :)

Kevin


