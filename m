Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4D9B2CA6007
	for <linux-mediatek@archiver.kernel.org>; Mon, 19 Jan 2026 08:24:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ove6z4GEDRrmzL1qSU7abyz0K3DIWuJFgY2FuK5CbFQ=; b=aorklmaYaW8hu+sg1rnYRFgtP8
	5DCZ/UYBDL3qwOI0j2F1JHdyF5DXjSjV8+SN1aM8v0LFE0x06dgCNQ2W3dEaQOFN+mrqGWaJyKTmp
	5ccBO7RhnRru8Mf8E0ON4E0ryWgI+AdWjcp9aNnKtfCZSnPQcaWxBpFUg8Cs7ZcWoRa1XAbd/iz/Z
	tUJGfaVxoVz0xJn1wsPL0ShCElC0XUPaOpBfecqoCihbbTW+z3b9MPLycllf1Tn0E2n0wumzFBf2h
	AxuecfKnMgIh20ys7gk595v/NEFLw6hpftKDrZRpD1GkCAfX1kMhlcSeKxsUHyIef6ngCs6Jlc7FJ
	khZYUAFg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vhkYX-00000001YKt-397s;
	Mon, 19 Jan 2026 08:24:13 +0000
Received: from mail-dl1-x122d.google.com ([2607:f8b0:4864:20::122d])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vhkYV-00000001YK0-20xe
	for linux-mediatek@lists.infradead.org;
	Mon, 19 Jan 2026 08:24:12 +0000
Received: by mail-dl1-x122d.google.com with SMTP id a92af1059eb24-124566b6693so3984114c88.0
        for <linux-mediatek@lists.infradead.org>; Mon, 19 Jan 2026 00:24:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1768811050; x=1769415850; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ove6z4GEDRrmzL1qSU7abyz0K3DIWuJFgY2FuK5CbFQ=;
        b=hcauDYbMc7i/2Qn4/kPxEdvSao6VP+DgoqXX+i8cs6bckDE3sZ1AMw6Plx2wPjDR9T
         LS867Kj+JGTQRkobQb5ntjjimZRDpme7GOd1YWP2ze8y3G9X5zXQy1Hj0okTfTxZoIzV
         CwN3pY8SbfIPxPxI2kkX2WMTWPE3Eky+MJv1QUhj1qL6eHm45g2lSVkN4kpQY9R9BNhT
         PgI/kBUaKgaYZ0ZLkCzPuN3+BaZ/urn5U5+R0PCad9vxJFZ9RSnUjVAkyhvkVrX/pwjS
         Ug1uAvr6K1L4PXt88UxTjKFCXWr3ntHn2pkM2sxiJz1912sZB26nqkEDy2YWxRYdNdDt
         cNdQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768811050; x=1769415850;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=ove6z4GEDRrmzL1qSU7abyz0K3DIWuJFgY2FuK5CbFQ=;
        b=IDVyLrixgW2AJEzKN1DdZBkGtiR5sGVvrv6uAUGe6OqfkDiyKWBCzslYQShoDD9AT6
         PYgsu3lIjjlWqiozmNWpjvV5MMycfngOirPPs2FJLSoQQWPqSMhlSKMVOB1XdQzAkGmJ
         n20e3atxjMtxhSXL1G7ZW8XNRUJ/6CPjTW9W5Dv8r1DzRi9ocjTgcFa3FYhRV/8O5A0/
         5snFjwFRRGxVWegY0jLgoPTHJpvPUJ38LBYLVyR1xVine+BbRPl4LjYJ48OCeK1Xblmt
         NA/QGpUtQh3QZA3bVocUubsBuEMES7IcG1Es02amUXVV0GHzS2EQIW6dxSCkvWheRJwh
         v8kw==
X-Forwarded-Encrypted: i=1; AJvYcCVu1Iji7gClq/ry3hJMNsmw6neeaVUaG7q2/o8pyl4wOtEuZRPiElIxlek/6CQ937IIZ22GIPiWIWQATafIxg==@lists.infradead.org
X-Gm-Message-State: AOJu0Yw6OLx4+x5kqwyj/zdIA0GFJq5TGTZVLlbn46aQrFh33+9BPQYQ
	EmfRGBxV5SKbJthDSvVLVrrsIzNYx//5KyVywocX+Gc2YWE1NPLYRhZ6oJmHWYFWsUz0A/0Z27m
	7JLPMhhJ54sJeRygE50/lkioGIy4gOgw=
X-Gm-Gg: AY/fxX5qdh9/JSp/KaK1WiSOpkV27lo8bjCrDRCTKidMIEVfniUzZRK6JdnE6JyKzyy
	JRaHT0oeOuvlkMrT0FLiLEhSZXsrpHmMRCsZ+n64DrfSRabrdWEbEb4jKpFDs9QimMRFGSU68Ts
	1G5WP39uxAgq3otjSXfPrsvB/2Q7f3CUGtwksrk9L6YRSwYLfSDu+8SzVhekCdhv9I6eAJQMpNB
	1z/XIzm+b8fq1PvfpNTZYZITYblqOeTR39Z1FJNwPgO5rHZf++Ynbo+/zso0nbDdNJ+8BTT0+Hf
	hjfllAzxXFf1JawUQpAvZUJet+wb4jyKOApDNZEyTd2baX1fuT59QndvuHuyQb6RKrPqBD9D/V9
	CBFnGWWRWFg==
X-Received: by 2002:a05:7022:a86:b0:11b:ceee:b78a with SMTP id
 a92af1059eb24-1244b33639emr7887537c88.19.1768811050417; Mon, 19 Jan 2026
 00:24:10 -0800 (PST)
MIME-Version: 1.0
References: <20260119064118.2493736-1-zhipeng.wang_1@nxp.com> <20260119064118.2493736-2-zhipeng.wang_1@nxp.com>
In-Reply-To: <20260119064118.2493736-2-zhipeng.wang_1@nxp.com>
From: Daniel Baluta <daniel.baluta@gmail.com>
Date: Mon, 19 Jan 2026 10:26:51 +0200
X-Gm-Features: AZwV_Qig-56UXGLfTyKon8QrH5w4OVjRr-qKTuvAKDTHLoGx-DgPQcPPQmb017c
Message-ID: <CAEnQRZCaAp-nUEd8NnQmT7MU-Kx=usV1OSx8xtiQB3aWUFzYAw@mail.gmail.com>
Subject: Re: [PATCH v1 1/4] clocksource/drivers/mmio: Export clocksource_mmio_init()
To: Zhipeng Wang <zhipeng.wang_1@nxp.com>
Cc: daniel.lezcano@linaro.org, tglx@kernel.org, shawnguo@kernel.org, 
	s.hauer@pengutronix.de, kernel@pengutronix.de, festevam@gmail.com, 
	matthias.bgg@gmail.com, angelogioacchino.delregno@collabora.com, 
	linux-kernel@vger.kernel.org, imx@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, 
	chun-hung.wu@mediatek.com, walter.chang@mediatek.com, jstultz@google.com, 
	amergnat@baylibre.com, aisheng.dong@nxp.com, jindong.yue@nxp.com, 
	xuegang.liu@nxp.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260119_002411_520349_28B65006 
X-CRM114-Status: UNSURE (   8.09  )
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

On Mon, Jan 19, 2026 at 8:42=E2=80=AFAM Zhipeng Wang <zhipeng.wang_1@nxp.co=
m> wrote:
>
> From: Chun-Hung Wu <chun-hung.wu@mediatek.com>
>
> Export clocksource_mmio_init() and clocksource_mmio_readl_up()
> to support building clocksource driver as module,
> such as timer-mediatek.c.
>
> Signed-off-by: Chun-Hung Wu <chun-hung.wu@mediatek.com>
> Signed-off-by: Walter Chang <walter.chang@mediatek.com>
> Acked-by: John Stultz <jstultz@google.com>

Hi Zhipeng,

Please add your Signed-off-by tag (even if you just pulled this patch
from another tree)
This comment applies to all patches in the series.

