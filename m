Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BFF86C761A6
	for <linux-mediatek@archiver.kernel.org>; Sat,  1 Apr 2023 00:06:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Date:To:Cc:From:Subject:
	References:In-Reply-To:Content-Transfer-Encoding:MIME-Version:Content-Type:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=xqAuBNUbT1L8H+Cbmkp2qhJjetUJRKcRzSUh5ExB2dM=; b=LX9aKEnkXVxeQ8jwKadyVycg9y
	Ym9DLG473b2qPMD1ynHav+GnUdZ2avz2Y04/uJ8qxwWJwRAnCnST+3tEYFvQQMki58L8hyc4XnUKD
	SN3zMxQx2aeYj3uJnJA84cVtcaIsrADsWXq7ge/NOJO5PMrAQXP0r+9BXVWls8jmKmRaiVOPZxMTw
	nfNzfCB4atDxwWGRW+XZ3cXFYVppKLg6J+2crUlD3JlqhRAkROnDw7gZ1Nwn6tIyZUOdHdong8Lr1
	PDKKaFOZ25AcHuJfFHdNMSrlVpsfrIc+thBfNXNJrCpOB/U78Z0lN7QpJebfK6RXJvkhejlsaNPAw
	hsxkKLHg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1piOkp-009H20-09;
	Sat, 01 Apr 2023 00:05:59 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1piOk5-009GTt-1b;
	Sat, 01 Apr 2023 00:05:14 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 0E69562CAF;
	Sat,  1 Apr 2023 00:05:13 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C5391C433D2;
	Sat,  1 Apr 2023 00:05:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1680307512;
	bh=xqAuBNUbT1L8H+Cbmkp2qhJjetUJRKcRzSUh5ExB2dM=;
	h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
	b=Zs5QSsn/ya5ww683UuJdXgOjNXG0qa32Qg1xZvEccyN+O5yaj2YhEz4ahzPvihrfz
	 aak0wAzD5PAPwDOTmnx6wR9+9hboD4+5xqLCRh2oCiiKSqtDyK0qQ1jnSKuYd21gFX
	 mdwiBvSw2Kb8weRlSAXK7AZtKAQCyiC4nrwhO+xT6dsjtIVJ55d9sO3KsVfjxUQ/iC
	 xM5L4kszZ4aFpuWo1VInWiXjBOuzcoy4AIxO512wVLUgkTMYDZv88wDsI3yvialkCa
	 5nFLwtqwbZeqazMEybn3CeXsdhTG6rBFKtjK83/Dx9RREd1zTLQ3jsqMRO8dKXnFIG
	 a5SI612tH5iOw==
Message-ID: <5bc60218e9ba8990a445ede8772c863c.sboyd@kernel.org>
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20230331123621.16167-20-Garmin.Chang@mediatek.com>
References: <20230331123621.16167-1-Garmin.Chang@mediatek.com> <20230331123621.16167-20-Garmin.Chang@mediatek.com>
Subject: Re: [PATCH v8 19/19] clk: mediatek: Add MT8188 adsp clock support
From: Stephen Boyd <sboyd@kernel.org>
Cc: Project_Global_Chrome_Upstream_Group@mediatek.com, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, linux-mediatek@lists.infradead.org, linux-clk@vger.kernel.org, netdev@vger.kernel.org, Garmin.Chang <Garmin.Chang@mediatek.com>
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, Garmin.Chang <Garmin.Chang@mediatek.com>, Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Matthias Brugger <matthias.bgg@gmail.com>, Michael Turquette <mturquette@baylibre.com>, Richard Cochran <richardcochran@gmail.com>, Rob Herring <robh+dt@kernel.org>
Date: Fri, 31 Mar 2023 17:05:10 -0700
User-Agent: alot/0.10
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230331_170513_622320_C18F42F1 
X-CRM114-Status: UNSURE (   7.19  )
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

Quoting Garmin.Chang (2023-03-31 05:36:21)
> Add MT8188 adsp clock controller which provides clock gate
> control for Audio DSP.
>=20
> Signed-off-by: Garmin.Chang <Garmin.Chang@mediatek.com>
> Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collab=
ora.com>
> ---

Applied to clk-next

