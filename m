Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9AC60C64ED8
	for <linux-mediatek@archiver.kernel.org>; Fri, 24 Feb 2023 10:03:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=rQ+c56zWKAB6KkNwyl4wfURLw4xEI4TvXfEXVR7fScM=; b=iznUfmcozfxWIBT+129UZkM+Pi
	o5I15xhYbnG7dwiLDRi/cvkyOkAXBDM4kF8IrXvHrfUunALIvedw5q3Wykae3mV1xTBUTLqBCdRXL
	8dv1X5WtIvENw25xGKeIJ5rRCDD4iDTNU4PwT8fUh4mwTgHDqZs5pCoMJ5ujeH4AsF7dAVAZH1sIi
	T1qeGYDd8xWhWvT0HKk7b64G+8M/KUTxyzrpOBJsW1d0K+NYk7nb8DFchGQGLqkcieI+znu+6J2ZH
	EVdKxEggBfaK3xljuvfVrL/CabWo32LNVum4zLmdGE1P+cqhhmgE64x0FtX2LGwOLcp04eut9Lg2m
	SlXpAnBg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pVUut-001qU8-G6; Fri, 24 Feb 2023 10:03:03 +0000
Received: from mail-vs1-xe2f.google.com ([2607:f8b0:4864:20::e2f])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pVUuT-001qFI-68
	for linux-mediatek@lists.infradead.org; Fri, 24 Feb 2023 10:02:39 +0000
Received: by mail-vs1-xe2f.google.com with SMTP id x14so20716862vso.9
        for <linux-mediatek@lists.infradead.org>; Fri, 24 Feb 2023 02:02:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=rQ+c56zWKAB6KkNwyl4wfURLw4xEI4TvXfEXVR7fScM=;
        b=mBf0fYdRBib48fcz8dVMkxRqv5dmT7j+KcKi6TQXWv47/sBOnplVjUA/KJlyaJhQ/u
         MUR8SPGjgkC8cTh1fdFKb3e7FHSM8YWB+6bJw3n9E66VgUJL5kFFtsaamzBOoG2BENuh
         trKPvAePy3rIQUhrjjvPeTuEOOm0WiZHCi6nI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=rQ+c56zWKAB6KkNwyl4wfURLw4xEI4TvXfEXVR7fScM=;
        b=F6QBYcuxjFYhlXIZJFHPrK3tM7ftJLd62Y8ImEgXNCkv3ui14hE9v45jTp3O1Qelk9
         CXo8IuKpWTcP3z+VAe7TCjuqE5tY9RgWu8jelenumCu1bfQJLIgxWb4z3oFtsr9zELvL
         Wdc+BiGSXtFzHQOWWXNFrWrXkKLdWBEoT4njGkrPrPWag7z6U6ukqKe7BeiwbhtIDGXk
         8JmPhre8I7WJ5mzNtr8pWp2M7x6ewy0ZQbp2nYUhsve9vvf8SrvqI5IUIGM7fvvbclg5
         W+J2o+OyfnWbtCdjxnHeyu9p2L49QGtkq7W7CWRq/Pd/lOio10PdrAuHhfIjQJoCn3YM
         3FGQ==
X-Gm-Message-State: AO0yUKVYVVydRrHi/Lb+lozHC0TFdP3QQAipxU7ML8Z7oXZ5KgBmRhiI
	ybVj7WWcFyUklh6wZ2D/nAyeSEUJFVoIn3b+6cbHBQ==
X-Google-Smtp-Source: AK7set9tS5Vg40qoFVl+YV3ZHnpGsg0FDitUcAkWfOL/lB0uJsb2dhWG1E7jYLg/T5T3JyAWuVyzhJYudWUCfyfHK1U=
X-Received: by 2002:a05:6102:31a9:b0:415:48dd:e0b9 with SMTP id
 d9-20020a05610231a900b0041548dde0b9mr2020384vsh.3.1677232953844; Fri, 24 Feb
 2023 02:02:33 -0800 (PST)
MIME-Version: 1.0
References: <20230223134345.82625-1-angelogioacchino.delregno@collabora.com> <20230223134345.82625-16-angelogioacchino.delregno@collabora.com>
In-Reply-To: <20230223134345.82625-16-angelogioacchino.delregno@collabora.com>
From: Chen-Yu Tsai <wenst@chromium.org>
Date: Fri, 24 Feb 2023 18:02:22 +0800
Message-ID: <CAGXv+5ES6MnmL0dhumwamHDVhcbeJ10UEO=98-SnWgWzzyHBCg@mail.gmail.com>
Subject: Re: [PATCH v2 15/16] arm64: dts: mediatek: mt8195-cherry: Enable
 Mali-G57 GPU
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: matthias.bgg@gmail.com, robh+dt@kernel.org, 
	krzysztof.kozlowski+dt@linaro.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-mediatek@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230224_020237_250835_33285E88 
X-CRM114-Status: UNSURE (   7.23  )
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

On Thu, Feb 23, 2023 at 9:44 PM AngeloGioacchino Del Regno
<angelogioacchino.delregno@collabora.com> wrote:
>
> Enable the Mali-G57 found on this platform with the open-source
> Panfrost driver.
>
> Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>

Reviewed-by: Chen-Yu Tsai <wenst@chromium.org>

