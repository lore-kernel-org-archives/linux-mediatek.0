Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B424FC04E69
	for <linux-mediatek@archiver.kernel.org>; Fri,  4 Aug 2023 14:50:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=SMo6gMfYlM/VNtFOwn/e5G1+vIj8kyfLio8gxupX/74=; b=PcXQaidRxDE4gvaKAydo7lpRwD
	7xg+7AK49iw+EBB3BkzC02LGPfDGPVlQcc1SeLU3YzDg2btg3M68EQUzEt0SJMZ215kO2UWGId5Hc
	AyW2f6CPkFJs8dofY0pWqdgx5KYXXTrlOx+f/xXX9qrDCF3eHQxUComv8RsLR+xq7JQ3tKoXRS5+E
	JnHuTIQh6nWTanf/z4UxH0rVD7NVzIUAV0IszwH+918J4+JLNtoUk7OtrCZ14v3c39T1C+Ne0d64t
	f8DDKn46TDql/XpOy6HRY/EfHMJ3eQloBB0wFWj7gCGW8qF0UjOAfUKbq5Km8W6018hdqLEbippCi
	voiX89Hw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qRw85-00Cd8w-2a;
	Fri, 04 Aug 2023 14:50:13 +0000
Received: from mail-lj1-x22e.google.com ([2a00:1450:4864:20::22e])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qRw81-00Cd7e-37
	for linux-mediatek@lists.infradead.org;
	Fri, 04 Aug 2023 14:50:12 +0000
Received: by mail-lj1-x22e.google.com with SMTP id 38308e7fff4ca-2b9ba3d6157so35370311fa.3
        for <linux-mediatek@lists.infradead.org>; Fri, 04 Aug 2023 07:50:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20221208.gappssmtp.com; s=20221208; t=1691160607; x=1691765407;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=SMo6gMfYlM/VNtFOwn/e5G1+vIj8kyfLio8gxupX/74=;
        b=Mfog46uUvnC1c3rJIRnxVP4Rn1RbM25sv6wJsTw/NSVKIwWmjjCO90AC35/gzaa/Y5
         F3rZRVvXDuuGz6MMqir/9Eh0mflOU0TgDqPn9elrJExaK5oBz588NIunZgMZIHUVzB/G
         54NpDe2kPhOJN3NU+NolDhb/A3wovEabDWmtdgXv8KGTCPee+zgTuRPt533tcJFlA1i6
         XRq8+VcfmJaRwMDSYHJ4QfTZl/APXx0z8YuY8Vqr5gY407AiuxzAQB490bCFp3dlR39b
         aW8l1/6W0FrEM1CVF9+wIoB1ktl2ZJhCjkqt/OpAIYpjy0mln0oczHM5luyUJBt6gvXD
         12hQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1691160607; x=1691765407;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=SMo6gMfYlM/VNtFOwn/e5G1+vIj8kyfLio8gxupX/74=;
        b=cnUngsMbU2H+dawJclRO4pdfGIMJL3IK+K+MIinfs4UfGWVEv6x2s2wjLkiEVIgAGW
         zVTCzqiyy903umnTwBwoed+6UXXfTibHbBK61ax0m5cGw4927veWB0wxeOdwZWVPx7Wv
         CZbN3wBPPH6zM+nIroMpdpQV7q5ILdDZcWiGRZPMrtZ6cdvxfTTrIPcFEZeNVooJ479n
         k3Jw2SgRW0Z7WjDhDCDQmgq8NtufrXgjXzRwCVtGH4QS7AG0SKKcvGHpW+lKD4zXNmgy
         54MmuE5oeOC0wtR24iZbZKMr4j7TvQTF0ZTeGUTqcpb4h02nXaaebRXq2jaQJ+vc+rOH
         00dw==
X-Gm-Message-State: AOJu0YzyVWcRC65WuqkrYSBB35JftqiWbY5WzH9lpnaR6SgXLtDt7UbS
	KVtBwW9Ww9J/lW3ejBqKgqZw9A==
X-Google-Smtp-Source: AGHT+IH9U6AIT6bF+8F9r2Z0sZcprmA3N5tubjVSO8iveevPtXWr9d3p3tebi9qlowrLhtjtfMqA8Q==
X-Received: by 2002:a2e:a176:0:b0:2b9:ee3e:2407 with SMTP id u22-20020a2ea176000000b002b9ee3e2407mr1664532ljl.38.1691160606509;
        Fri, 04 Aug 2023 07:50:06 -0700 (PDT)
Received: from localhost ([2a01:e0a:55f:21e0:9e19:4376:dea6:dbfa])
        by smtp.gmail.com with ESMTPSA id l26-20020a1c791a000000b003fbb06af219sm2540259wme.32.2023.08.04.07.50.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 04 Aug 2023 07:50:06 -0700 (PDT)
Date: Fri, 4 Aug 2023 16:50:05 +0200
From: Julien Stephan <jstephan@baylibre.com>
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: Louis Kuo <louis.kuo@mediatek.com>, 
	Phi-bang Nguyen <pnguyen@baylibre.com>, Florian Sylvestre <fsylvestre@baylibre.com>, 
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>, Alexander Gordeev <agordeev@linux.ibm.com>, 
	Andy Hsieh <andy.hsieh@mediatek.com>, Conor Dooley <conor+dt@kernel.org>, 
	daoyuan huang <daoyuan.huang@mediatek.com>, devicetree@vger.kernel.org, 
	Hans Verkuil <hverkuil-cisco@xs4all.nl>, Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, linux-mediatek@lists.infradead.org, 
	linux-media@vger.kernel.org, Matthias Brugger <matthias.bgg@gmail.com>, 
	Mauro Carvalho Chehab <mchehab@kernel.org>, Moudy Ho <moudy.ho@mediatek.com>, 
	Rob Herring <robh+dt@kernel.org>, Vasily Gorbik <gor@linux.ibm.com>
Subject: Re: [PATCH v2 2/4] media: platform: mediatek: isp_30: add mediatek
 ISP3.0 sensor interface
Message-ID: <72ixohoacq4vgj7nqg4l5gt5bs5e5ewain6a5ovqs3winx3qzz@sbg5lfohq5mq>
References: <20230630100321.1951138-1-jstephan@baylibre.com>
 <20230630100321.1951138-3-jstephan@baylibre.com>
 <da891ec5-473c-5bef-d88b-661fac70ed25@collabora.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <da891ec5-473c-5bef-d88b-661fac70ed25@collabora.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230804_075010_005244_D3D8D74C 
X-CRM114-Status: GOOD (  16.44  )
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

On Mon, Jul 03, 2023 at 01:02:02PM +0200, AngeloGioacchino Del Regno wrote:
> Il 30/06/23 12:01, Julien Stephan ha scritto:
..snip..
> > +
> > +static const struct mtk_seninf_format_info mtk_seninf_formats[] = {
> > +	{
> > +		.code = MEDIA_BUS_FMT_SBGGR8_1X8,
> > +		.flags = MTK_SENINF_FORMAT_BAYER,
>
> Each entry fits in one line.
>
> 	{ .code = MEDIA_BUS_FMT_SBGGR8_1X8, .flags = MTK_SENINF_FORMAT_BAYER },
>

Hi Angelo,

Actually not all entries fit in one line. The last 4 ones don't:

       { .code = MEDIA_BUS_FMT_SGRBG10_DPCM8_1X8, .flags = MTK_SENINF_FORMAT_DPCM | MTK_SENINF_FORMAT_INPUT_ONLY },
which is 115 chars..

so what is the best? put all in one line except the last 4 one? or keep
them all as is?


> > +	}, {
..snip..
> > +	udelay(1);
> > +	mtk_seninf_input_update(input, SENINF_CTRL, CSI2_SW_RST, 0);
>
> Is there any way to check if the CSI port did reset, or is it *guaranteed* to get
> out of reset in a microsecond after deasserting SW_RST?
>

I will double check this

> > +}
> > +
..snip..
> > +
> > +	val = mtk_seninf_mux_read(mux, SENINF_MUX_CTRL);
>
> rst_mask = SENINF_MUX_CTRL_SENINF_IRQ_SW_RST | SENINF_MUX_CTRL_SENINF_MUX_SW_RST;
>
> writel(mux->base + SENINF_MUX_CTRL, val | rst_mask);
> writel(mux->base + SENINFMUX_CTRL, val & ~rst_mask);
>
> that's better, right? :-)
>

right :)

Cheers
Julien

> > +	mtk_seninf_mux_write(mux, SENINF_MUX_CTRL, val |
> > +			     SENINF_MUX_CTRL_SENINF_IRQ_SW_RST |
> > +			     SENINF_MUX_CTRL_SENINF_MUX_SW_RST);

