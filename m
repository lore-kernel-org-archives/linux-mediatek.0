Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 67C3BC76196
	for <linux-mediatek@archiver.kernel.org>; Sat,  1 Apr 2023 00:03:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Date:To:Cc:From:Subject:
	References:In-Reply-To:Content-Transfer-Encoding:MIME-Version:Content-Type:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=PSJxmn/owjJMbAG+C8koAg7DNI8M9Zxw58XzzTVAGNw=; b=UB9oA6mUVuNZ0MgTSTmazCHes6
	qX+KUaFCYSKnDumPiSGzVn3F6MQjdO/j+wODnUHMSPAWffq+0hS87bkLoAgTlzABWSrCjUplavjz2
	jJl9cm+11f2LZvMJ8cZOkeEmaoVkxW337UnQcH6RoU5cIKPUkWIi+f6UZK3BOIZTAh6szFoP3EtP6
	ZpYqQnQJ+Ug7Jv8hwCmwZ+GkCEuNZfBiZ9KxaWJuDDEIsh4fJKq2XQA6uu920ABweGISV9jD0tj/P
	7U7Jv2mMZyhFK0dQQsoqe9zFj7/ZsZJsH0fgbFVFAddnTOgG6/5WHrf65JMajvwZ1APi4vibiThj2
	NUm8zR0w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1piOiW-009FNm-2H;
	Sat, 01 Apr 2023 00:03:36 +0000
Received: from ams.source.kernel.org ([145.40.68.75])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1piOiM-009FGa-1V;
	Sat, 01 Apr 2023 00:03:27 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.source.kernel.org (Postfix) with ESMTPS id 2ADC5B832A9;
	Sat,  1 Apr 2023 00:03:25 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DE80DC433EF;
	Sat,  1 Apr 2023 00:03:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1680307404;
	bh=PSJxmn/owjJMbAG+C8koAg7DNI8M9Zxw58XzzTVAGNw=;
	h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
	b=IT1cIC65I78RkIfhf6AEqnumSEbl/L0mCcuLIWTS6Lr+AfiznTyTKNO53ZhhLojXc
	 CP157caqlC5L1RiU/MSK4D7a9bwX0LZOwq7kCEqpg6Lz3NTNo+uXOWM4zNDIi3i+Ph
	 ylXCvNuCI8XWuQr+I4wZkk8OuGjMKyv3dmdV+WcNk244FRplCGLhztO5Pc0Ja4d9xX
	 0X7gPz9AZuLMwJ0qsc6qrxgDwblO/ag+pOaYircqOO6c7E7wTZWEh2+Q+IL0v6bqXr
	 IzfBvgCKHqWQIFmWw0xnVjV3FWei6/HNdTXtmCGBvbZ7f2ZAYJywcmBDKxulhzBlmh
	 uC5hDHGLBur3g==
Message-ID: <4b7dce21aa108d6c14f1b3beefbf9e46.sboyd@kernel.org>
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20230331123621.16167-9-Garmin.Chang@mediatek.com>
References: <20230331123621.16167-1-Garmin.Chang@mediatek.com> <20230331123621.16167-9-Garmin.Chang@mediatek.com>
Subject: Re: [PATCH v8 08/19] clk: mediatek: Add MT8188 imgsys clock support
From: Stephen Boyd <sboyd@kernel.org>
Cc: Project_Global_Chrome_Upstream_Group@mediatek.com, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, linux-mediatek@lists.infradead.org, linux-clk@vger.kernel.org, netdev@vger.kernel.org, Garmin.Chang <Garmin.Chang@mediatek.com>
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, Garmin.Chang <Garmin.Chang@mediatek.com>, Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Matthias Brugger <matthias.bgg@gmail.com>, Michael Turquette <mturquette@baylibre.com>, Richard Cochran <richardcochran@gmail.com>, Rob Herring <robh+dt@kernel.org>
Date: Fri, 31 Mar 2023 17:03:21 -0700
User-Agent: alot/0.10
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230331_170326_650011_F5E85AE4 
X-CRM114-Status: UNSURE (   6.98  )
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

Quoting Garmin.Chang (2023-03-31 05:36:10)
> Add MT8188 imgsys clock controllers which provide clock gate
> control for image IP blocks.
>=20
> Signed-off-by: Garmin.Chang <Garmin.Chang@mediatek.com>
> Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collab=
ora.com>
> ---

Applied to clk-next

