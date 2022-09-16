Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 907B1ECAAD8
	for <linux-mediatek@archiver.kernel.org>; Fri, 16 Sep 2022 08:17:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=2PnNFNUqQBrbAJ+KLmE5zE/OnqNdj3sYS9lVb/E9pKE=; b=i/2QPG9Jzjtq8lfThe9bbb99cI
	5dqFRzb8iI0a+eSu94HMlaZs28YmoFVtFRdaWru/yTjUWnQPfHUUyv2c2knvLYW5Mfc5u2c45H6SQ
	NaZdWGBKQpzinFgUNnV2J/pPITxZ57sZ34pyWwhajQNN+mCwGnCI/M0Kfvd2fyYvaI6JtkGl2FlvH
	YhewelkPCWcIftz3mVBTb54Yp8q6BV9frF1mTz3J+reDi8Pb3h/FH7rwg/MozE0Vl5Y797rxO+V5/
	5zTGRKhzlq5OP/4M11MPpqyk80K56TlLz9oIXOwyVre6cd3uX4v3YN9f0Cuors5mSSl7pLMZr9e1H
	FeKuoFpA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oZ6X9-00AtU7-Lw; Fri, 16 Sep 2022 08:17:11 +0000
Received: from mail-yb1-xb30.google.com ([2607:f8b0:4864:20::b30])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oZ6Vp-00ArYR-9k
	for linux-mediatek@lists.infradead.org; Fri, 16 Sep 2022 08:15:52 +0000
Received: by mail-yb1-xb30.google.com with SMTP id e81so12012381ybb.13
        for <linux-mediatek@lists.infradead.org>; Fri, 16 Sep 2022 01:15:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20210112.gappssmtp.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date;
        bh=2PnNFNUqQBrbAJ+KLmE5zE/OnqNdj3sYS9lVb/E9pKE=;
        b=pVIFVU242w9iq7DXYThjL37Si11OW6ebqwACau4FFnXH9jsTHyXtD8zowpGxU6I/0v
         CaUibP8uciXBPp1XNVfdZHglARuJhWBYwgHmXt+Zr20mV84GYplmVQGgVXgtIu3nuCGP
         vSsln3vtuynZvlsfTm9UFMf25wwCkVad5YLnFeL+qMISTWetVArsmrnivbfUvX4L21pd
         3otUXHDnxt6qZXZyP+59BDEZwYjkItz9gGz4EEPs1jnTmtEYGw+rv3wI3aq6hY5hoNQb
         NTIiBRfgJtdkdNHeaY8R2ac+TxUceQf27JceMDOugrLFocDMulsDvjjicEtd+NARCvX9
         mcuw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date;
        bh=2PnNFNUqQBrbAJ+KLmE5zE/OnqNdj3sYS9lVb/E9pKE=;
        b=1iMPkivbE74Cd2hidLKfUzAwVEM10Rz1jw0rAB0olHCOvfKm9Quzr0yqe+Oo03LAjn
         vguy+8W9FIcHqI93ATmxWefLtswVIC1QKV7TSjBc3vBD7Kz2yvODHMmKYF52FDSBbTV+
         3X1D/RNOF/8skm3DkFAFqRN1Ixp2wi2cdKNJk4mOoj+cOzPv12snZvWWQgVImCcMhLxt
         xOP3b6UFtaJ7eDkR0uvGVVvzK5RY4iH/drqG+Q0K6ctx7ZBrIwivXEIYPyEVnDuqpaVS
         YpGi/viLNpPiWr0IEn0hXd33vlC4KQo6gwoC/lNpfYlG0NaWvaveLAU9S2xlzDQz0ABD
         PGxw==
X-Gm-Message-State: ACrzQf34Fig3O6aPpNCE7H2vZA2hiOLKcB2W8885SB3c3lbcbe4kAPBC
	QYyyyXlFa0RptUwNQuJ7EO7rcO5jlECGq0B3/nAI1w==
X-Google-Smtp-Source: AMsMyM4uK5qX0hNriC08kjBGoyryzCAKwvl0ezSa6qMX7DCS06l9JI2YRDdGZ5bpYNAvRVJdroYT4ispXrrbmlqKGf8=
X-Received: by 2002:a25:708b:0:b0:6b0:8a11:b32 with SMTP id
 l133-20020a25708b000000b006b08a110b32mr1874467ybc.520.1663316142506; Fri, 16
 Sep 2022 01:15:42 -0700 (PDT)
MIME-Version: 1.0
References: <20220817080757.352021-1-bchihi@baylibre.com> <20220817080757.352021-5-bchihi@baylibre.com>
 <8d6383e0-329e-ca91-6e79-85b3806a2af3@collabora.com> <CAGuA+ooEHPiHuGYXOh7s68HRTv9HSr-BexFsCLUPWTMQ3szCfg@mail.gmail.com>
 <ccd27ec5-6bce-0f5c-1b58-b7bfcbccdeed@collabora.com>
In-Reply-To: <ccd27ec5-6bce-0f5c-1b58-b7bfcbccdeed@collabora.com>
From: Balsam CHIHI <bchihi@baylibre.com>
Date: Fri, 16 Sep 2022 10:15:06 +0200
Message-ID: <CAGuA+oroekhVRyxa-z1VTZrzOBW2zCoGaFmH=KLYu_JfwxP3NA@mail.gmail.com>
Subject: Re: [PATCH v9,4/7] thermal: mediatek: Add LVTS driver for mt8192
 thermal zones
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: rafael@kernel.org, rui.zhang@intel.com, daniel.lezcano@linaro.org, 
	amitk@kernel.org, linux-pm@vger.kernel.org, linux-kernel@vger.kernel.org, 
	khilman@baylibre.com, mka@chromium.org, robh+dt@kernel.org, 
	krzk+dt@kernel.org, matthias.bgg@gmail.com, p.zabel@pengutronix.de, 
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-mediatek@lists.infradead.org, james.lo@mediatek.com, 
	fan.chen@mediatek.com, louis.yu@mediatek.com, rex-bc.chen@mediatek.com, 
	abailon@baylibre.com
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220916_011549_394255_656C0187 
X-CRM114-Status: UNSURE (   4.93  )
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

> It's the wrong error number. You have to return -EAGAIN :-)

Got it, thanks! :D

