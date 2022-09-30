Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 577C3C433F5
	for <linux-mediatek@archiver.kernel.org>; Fri, 30 Sep 2022 22:12:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Message-Id:Date:To:Cc:From:
	Subject:References:In-Reply-To:Content-Transfer-Encoding:MIME-Version:
	Content-Type:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Jo/Vgfba9De5xy/v6raQyqYE0lJYMx5B8RCbTNv97jY=; b=B/vtRhdQicUMTXranhfqiU8jIB
	JUCAP+jIScD1/lPezvHsXSG8IJS1UutnxbxzuhOH/6Z51Yoqx3xPjopNStlBOk7aYKo4lznPhoywv
	FN3iwYgQeNCJl6mTrex5CsHMmWtlqAR1YBf6IV6HSgwwZ/DYa9hzlY7crrCPwLeI2Bj6qIS1WcEcf
	qE+3Wlbayeuco9BYjvHgIA3xaALiwpSXYellIvafLiuq+isnrXS8k8OIg86/whAE7hgE8wG+UJIiQ
	CAv6Y/afES01/y1cYz51n2c0vkAkD7x/XuY4Hp2bfRsk8wwFhVHlp9xaqT6xyZBZkHoi2nLt3oOzj
	XLgHCeeA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oeOFM-00BpLE-RD; Fri, 30 Sep 2022 22:12:40 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oeOEr-00Bp1m-I8; Fri, 30 Sep 2022 22:12:10 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 20FB762526;
	Fri, 30 Sep 2022 22:12:09 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 74725C433C1;
	Fri, 30 Sep 2022 22:12:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1664575928;
	bh=Jo/Vgfba9De5xy/v6raQyqYE0lJYMx5B8RCbTNv97jY=;
	h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
	b=bpwc+/EhGxFQzXBU6jftrABmxHnosUtKVU6MmlJ0n8UeqaiP29iqthhd9wUd7wLjJ
	 I2+AfP59xvbdCvG2Dm/BcBGxm3J82KQrVO05I79uQRCVJ4/Q+u1Cn+VZnAQHx3OqvX
	 dCoi7tmEIdV72rDz70kCyFzgrQ7tpbe3yf2UnhLsF3tmucIhXXqhVbQHfJPNKLmkCY
	 Kz5S58GL/yep3UGdeAl7v7/cueFcaIKU2vyCyj69jX1jclE7ekIChsdPDnZzHKmPCG
	 kND6wxv+6fR5/HP3ZFsOvD3Nerg3oyNuR6VoGpAb/64igxdFqKs9Q2TZ3oH7yxjopm
	 rVZd2X8Bfu9MA==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20220822152652.3499972-5-msp@baylibre.com>
References: <20220822152652.3499972-1-msp@baylibre.com> <20220822152652.3499972-5-msp@baylibre.com>
Subject: Re: [PATCH v4 4/4] clk: mediatek: add driver for MT8365 SoC
From: Stephen Boyd <sboyd@kernel.org>
Cc: linux-clk@vger.kernel.org, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org, Fabien Parent <fparent@baylibre.com>, Markus Schneider-Pargmann <msp@baylibre.com>
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, Fabien Parent <parent.f@gmail.com>, Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Markus Schneider-Pargmann <msp@baylibre.com>, Matthias Brugger <matthias.bgg@gmail.com>, Michael Turquette <mturquette@baylibre.com>, Rob Herring <robh+dt@kernel.org>
Date: Fri, 30 Sep 2022 15:12:06 -0700
User-Agent: alot/0.10
Message-Id: <20220930221208.74725C433C1@smtp.kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220930_151209_672284_052BD915 
X-CRM114-Status: UNSURE (   8.24  )
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

Quoting Markus Schneider-Pargmann (2022-08-22 08:26:52)
> From: Fabien Parent <fparent@baylibre.com>
>=20
> Add clock drivers for MT8365 SoC.
>=20
> Signed-off-by: Fabien Parent <fparent@baylibre.com>
> Signed-off-by: Markus Schneider-Pargmann <msp@baylibre.com>
> ---

Applied to clk-next

