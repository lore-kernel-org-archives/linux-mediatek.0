Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0B73BC433FE
	for <linux-mediatek@archiver.kernel.org>; Mon, 21 Nov 2022 18:21:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Message-ID:Date:References:In-Reply-To:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=8w9f4y377QtdcrkQmSKVz9YndndMyGver3VZ27R7CKA=; b=trJ7d8VwrbyK3GRJbK0+2U/C2x
	kujN8te4FkbIp/twoGkCjmwIJQQm+/u1cXjWnJmZX3MMwAAR23dlNyJjYUc3515u9gZ/IStKAeRbG
	n0pfEbOfwNGYZ47ySSKmAJjKAO/3SLafrE93DRldcnHdPI/PamO2aQiQeL/SmW/k8R8mGAyz4APCY
	ijR/iLmZ9Bm22tNGo2pBe4der+tBET7OxGvanf7elkYoM556380pGEVD5SBtkMxXqL0u6BWF9fGfz
	EflN1mGjtFxhEL+naztCduY5LPAaMr7OCUsrBZBDKyedateSzQ/0XU3piMsgV9uG1sIV+GDnt/fvh
	HcIqoMqw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oxBQF-00GoPT-8h; Mon, 21 Nov 2022 18:21:35 +0000
Received: from mail-pj1-x1034.google.com ([2607:f8b0:4864:20::1034])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oxBQC-00GoN3-93
	for linux-mediatek@lists.infradead.org; Mon, 21 Nov 2022 18:21:33 +0000
Received: by mail-pj1-x1034.google.com with SMTP id a22-20020a17090a6d9600b0021896eb5554so6050989pjk.1
        for <linux-mediatek@lists.infradead.org>; Mon, 21 Nov 2022 10:21:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20210112.gappssmtp.com; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:references
         :in-reply-to:subject:cc:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=8w9f4y377QtdcrkQmSKVz9YndndMyGver3VZ27R7CKA=;
        b=3omtfVMBlHwiBWSEOLuxgQqnH3bzQTxnJNc1CqHj7505Mu9sQWMu+R+dNeviBUmYON
         Nrf8mMt8T1phKqn9bnrQ8wX/SZjaMtN9aW+sqrjVXk89gHEZaLF65G5zzK2Sv1FMckQH
         bS5TNztm10AdS2d2Nz90rX0XPsE5YItnVVEOOdwnVoDy4Jm+JQDKmrIkt6A/5v14qzvM
         yyIy4/6Bs5e3cdN4m/UmybN1YXi/kUBQ7Nwl/FYRdfIjb+/1Iz3iHv0HiApd3FBpx6QI
         5ZRSNdtulQGLkZdjFQx+gvExfnafWI7bJ4nco2qjdNPx7ThYKfeph9DpZbWv6h1AjhF0
         qpNw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:references
         :in-reply-to:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=8w9f4y377QtdcrkQmSKVz9YndndMyGver3VZ27R7CKA=;
        b=IvHWaYlWCcihlP1imtCih3hM4/kaZ+3hmfRWibwk9BOUGcPJFBasw9OeDZ83/N+E1H
         t2M2n40R5nDRjjJB1XRHEphXYM9MgdnAw+GFDOiRURpHlDlN8tevN8xUHqdP1BzOpKH/
         xMfEWNm9p5/lo18mKqhE3aMGTMsXNJe8uxhKDEdtczuAUMyRK2om4WZT7v27bsvtw5qC
         cPnjKKbU+n1wEVy4axAxto8J93We/0f8GifXgtOg+61uw1rKRZSBfRzUXM/qqPCcCUKx
         Ignhgd5l5mg9MdoXLiwpf0ElGPccKw/gV/AoLpKnA3TKKZ8FRRdYqybt1QbumIpPkUdr
         571w==
X-Gm-Message-State: ANoB5plIi+l+G1A3fLkEZwZchG+TGVoZz+63g3XLyC5L9/BkhqbIBFaJ
	VJmbagX6fuRKvWtEJxanWVE/f+OG01xHdmq9
X-Google-Smtp-Source: AA0mqf6lZH/t4A6UhS6locXOZ/QDeHJNF0k/f2M6v6NCSZSVyFx7Q5/JiZKp4LAXjmm2O30PPiKTmw==
X-Received: by 2002:a17:902:7d94:b0:188:f0e1:ef42 with SMTP id a20-20020a1709027d9400b00188f0e1ef42mr2923518plm.166.1669054891238;
        Mon, 21 Nov 2022 10:21:31 -0800 (PST)
Received: from localhost ([75.172.139.56])
        by smtp.gmail.com with ESMTPSA id e1-20020aa79801000000b0056bb4bbfb9bsm5335744pfl.95.2022.11.21.10.21.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 21 Nov 2022 10:21:30 -0800 (PST)
From: Kevin Hilman <khilman@baylibre.com>
To: Bernhard =?utf-8?Q?Rosenkr=C3=A4nzer?= <bero@baylibre.com>,
 devicetree@vger.kernel.org
Cc: linux-mediatek@lists.infradead.org,
 linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org, krzysztof.kozlowski@linaro.org,
 mcoquelin.stm32@gmail.com, alexandre.torgue@foss.st.com,
 matthias.bgg@gmail.com
Subject: Re: [PATCH 6/9] ARM: dts: mediatek: Remove pins-are-numbered property
In-Reply-To: <20221121015451.2471196-7-bero@baylibre.com>
References: <20221121015451.2471196-1-bero@baylibre.com>
 <20221121015451.2471196-7-bero@baylibre.com>
Date: Mon, 21 Nov 2022 10:21:30 -0800
Message-ID: <7hpmdg88yd.fsf@baylibre.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221121_102132_366131_F9116F7A 
X-CRM114-Status: UNSURE (   3.98  )
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

> Remove the unnecessary pins-are-numbered property from
> Mediatek ARM DeviceTrees
>
> Signed-off-by: Bernhard Rosenkr=C3=A4nzer <bero@baylibre.com>

Acked-by: Kevin Hilman <khilman@baylibre.com>

