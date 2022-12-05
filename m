Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A89BEC4321E
	for <linux-mediatek@archiver.kernel.org>; Mon,  5 Dec 2022 13:21:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Message-ID:Date:References:In-Reply-To:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=9z1JhFIl54hhe1hJzAGSFqm4Ab0z60pwIOimmNR2/Lc=; b=z6ShHYCh4XPgkhHJsvAPXz3ie1
	1ltBppizhHTW/T9JncTrMA35B1rNTFaGDUtqJ4uRCWLRl/EvstJk2iQxV1OUjUk8ZbAmOpCDM6dck
	dAfI5d6H68yU3UE1xdEwcdrLjgj2I/voFY2D3DGev1Hq6qcWjSLRgBpw5fQLtat0CeOlzq9lqS28o
	pU4fZnwQaSnti0x5Fr4Dy+zAMsHVanx8x/O9TtXybscht0BSSSCNBzU1DxVZg6sXcP7dqrzqF5CDw
	BAE/wpkiO0bDPa6CaTWVSkKREwJmRnKu9xEHdq5gVbLgibqUsPx/jGr7DGAok+tSvNhpTDwwKmiFj
	jPpshdCw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p2BPs-003KLe-Ov; Mon, 05 Dec 2022 13:21:52 +0000
Received: from mail-pg1-x52c.google.com ([2607:f8b0:4864:20::52c])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p2BPe-003K10-RD
	for linux-mediatek@lists.infradead.org; Mon, 05 Dec 2022 13:21:40 +0000
Received: by mail-pg1-x52c.google.com with SMTP id 136so10484438pga.1
        for <linux-mediatek@lists.infradead.org>; Mon, 05 Dec 2022 05:21:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20210112.gappssmtp.com; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:references
         :in-reply-to:subject:cc:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=9z1JhFIl54hhe1hJzAGSFqm4Ab0z60pwIOimmNR2/Lc=;
        b=bA7kTiuyMy0akuLe9I6Y5TgP9Gy1UA4+voCgPw03Dv31AGXnaMq3Tu3xCLVfTtBYuT
         BmEHqWRXfM4T0tjjyfH0OPzCnL56qn2UHFc63E/NNkDRq1UyeZ+LZcH5nSiRFJCcB1GU
         aWom9nox5uFGWQj8KSr7ur8u7qzEutw3B0+D32rFqRRV62cAXlUZdFHg6e8mDpao/8Vg
         iJkRjCgxZLp2Y7MtBQcwFlWMXcrEUllkujlYGIQOkZbpsS85kaD//C+49imHis3uiDNX
         jFB4Hwp/hOxExMtsTQtiqDVOD6l7M4SZ59B4NsAsAAEJvbXqyp0SRf5BFKM2opyA09di
         1Xyg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:references
         :in-reply-to:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=9z1JhFIl54hhe1hJzAGSFqm4Ab0z60pwIOimmNR2/Lc=;
        b=Agihh/ujB3azOGJ+strrSUW6G1OdxoxprjsM09dwLLP4pVB7OguyY2Gx/DXcivkd88
         +wwVjKUxHmnACNGfesxj+7fVfZtk7cYHPWJ82CeVs9KuYbqAoOZ+DsjG9Rybz+IRXDZE
         IoMajMnx8EHAPgV/yh7WLMcMiRJw8fJ57Df4Bbb7ew1TG3VAtNSY+M3s6pO6UvT71jzw
         kcoNTV3nOy/UFYcgWsOuSDMt326fCNs4m2Uc4TR/li7nxtL8GwFL+Zp2S8xaiXbaYyW8
         0DIH8oIS+Xx3sWu2/AJ4i0jH/NY7Hds45Zgdqk7Bpd39xMXuZc9FyNSKb/clLO7Q2su2
         kj2A==
X-Gm-Message-State: ANoB5pmjRx+QLQOo8btJNr+A99ZIb3TBVKTMVLtY4Jm6PNag9drbXnQH
	s1Lmei27Aihb9C66T9G1F1pJ+Q==
X-Google-Smtp-Source: AA0mqf7MiItBstwxtCl5bK9j7nFlFPOtd2lA9WFHspdb9k/DZyXPDYMrLQK0IU6wIzVKzqL9WVWUQw==
X-Received: by 2002:a63:4742:0:b0:478:cd7d:3f55 with SMTP id w2-20020a634742000000b00478cd7d3f55mr1407966pgk.624.1670246496752;
        Mon, 05 Dec 2022 05:21:36 -0800 (PST)
Received: from localhost (63-228-113-140.tukw.qwest.net. [63.228.113.140])
        by smtp.gmail.com with ESMTPSA id g2-20020a655942000000b00476c2180dbcsm8250956pgu.29.2022.12.05.05.21.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 05 Dec 2022 05:21:36 -0800 (PST)
From: Kevin Hilman <khilman@baylibre.com>
To: alexandre.torgue@foss.st.com, Bernhard =?utf-8?Q?Rosenkr=C3=A4nzer?=
 <bero@baylibre.com>,
 devicetree@vger.kernel.org
Cc: linux-mediatek@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com, mcoquelin.stm32@gmail.com,
 krzysztof.kozlowski@linaro.org, matthias.bgg@gmail.com,
 angelogioacchino.delregno@collabora.com, linux-gpio@vger.kernel.org,
 linus.walleij@linaro.org
Subject: Re: [PATCH v3 7/7] ARM: dts: stm32: Remove the pins-are-numbered
 property
In-Reply-To: <20221129023401.278780-8-bero@baylibre.com>
References: <20221129023401.278780-1-bero@baylibre.com>
 <20221129023401.278780-8-bero@baylibre.com>
Date: Mon, 05 Dec 2022 05:21:36 -0800
Message-ID: <7hlenm56lb.fsf@baylibre.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221205_052138_916134_14462313 
X-CRM114-Status: UNSURE (   4.72  )
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

Alexandre,

Bernhard Rosenkr=C3=A4nzer <bero@baylibre.com> writes:

> Remove the pins-are-numbered property from STM32 DeviceTrees
>
> Signed-off-by: Bernhard Rosenkr=C3=A4nzer <bero@baylibre.com>
> Reviewed-by: Matthias Brugger <matthias.bgg@gmail.com>

Now that the driver & binding qre queued, I'm assuming you'll queue this
one via the stm32 tree?

Thanks,

Kevin

