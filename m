Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 83DB8C3DA61
	for <linux-mediatek@archiver.kernel.org>; Mon, 29 Jul 2024 22:30:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=948yQ5v6dNdMWIhom6JmZcGff83DJngPfyBc0pp39JI=; b=zXklR8d/qwgjmFiwNPTZ1PYmt3
	qatJyY5WTYEYwYxM4DiH6+V+j5eE0kdO0kQ/tPtlKpObDHNoftfuFNcT6ZSS/p7DtcxATeIkYokx7
	KV8eN61AV/tG99z/ItlEuFJkIUepNjM2rqb+SLemeTee+M87y9OrMiVHE9DRm8fHQQHD8e1d+dOHm
	V/C4mjiBeymBd0toWoWfKzDVYT8eaM5ISsnPJLwbF3J+eVWSJaEwmPVzomNLmVFCT5ZzkLQb0p2kU
	aV3JbLY1M1CiVqHoPxqgTYJcmH0ZCANZzLWP1EuaCoeUY8++Cv6Q3+Bs+3x+XX2L9WYjJ2Xt0ea3+
	uPDC82tg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sYYsq-0000000CuG5-3xnO;
	Mon, 29 Jul 2024 22:30:24 +0000
Received: from madrid.collaboradmins.com ([2a00:1098:ed:100::25])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sYXjG-0000000ClTo-1ZkK;
	Mon, 29 Jul 2024 21:16:27 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1722287784;
	bh=LOZJvW/JL7dJF2U2piC6XH9x32IcP9JJ89yfsFfMpIU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=k5qdzrT9Ou4tuZtEMBs5zQ0gIzg6Wfd3Y7dsWRh3OMGzUMuIvKTXvlGM1Lf2Xj4pN
	 mpIeolAWd7gF9Mi2XrA+Bq6U2IWi2zbqHUcRRrjHovqpKZwOuFmO2ZMDlzC/S26I+F
	 7koLBQsqBNgMMaoH2S4gnfY/TuOIOdlGaGo2qTX38fnG7CcbJyTW/SuIRBOhSeDu7L
	 NlYpGJlN1VrzXKqJpqkERy8LcoGlIsg5Vb36VQYxRErnrMXayWWQV8DPY4mjcSX6av
	 Se6QOAv+rCSePEorqDFNbOCjY/ZXRme3dwsN61WbUZM1K4RMzRAryrbqncoLuewJ9Z
	 cChufSEGXJrSQ==
Received: from notapiano (zone.collabora.co.uk [167.235.23.81])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: nfraprado)
	by madrid.collaboradmins.com (Postfix) with ESMTPSA id A74DF3780530;
	Mon, 29 Jul 2024 21:16:21 +0000 (UTC)
Date: Mon, 29 Jul 2024 17:16:19 -0400
From: =?utf-8?B?TsOtY29sYXMgRi4gUi4gQS4=?= Prado <nfraprado@collabora.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: kernel@collabora.com, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org
Subject: Re: [PATCH] arm64: dts: mediatek: cherry: Specify pull resistance
 for RSEL GPIOs
Message-ID: <1fc31d16-dbc6-4d92-b594-27f7df3d6215@notapiano>
References: <20240531-tomato-rsel-gpio34-35-fix-v1-1-64ab2545f182@collabora.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20240531-tomato-rsel-gpio34-35-fix-v1-1-64ab2545f182@collabora.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240729_141626_571666_5E82489D 
X-CRM114-Status: GOOD (  12.65  )
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

On Fri, May 31, 2024 at 05:51:09PM -0400, Nícolas F. R. A. Prado wrote:
> GPIOs 34 and 35 on MT8195 are of type MTK_PULL_PU_PD_RSEL_TYPE, meaning
> not only can they be configured as pull-up or pull-down, but the pull
> resistance can also be configured.
> 
> The current bias setting however doesn't specify a resistance value,
> resulting on the following errors:
> 
> mt8195-pinctrl 10005000.pinctrl: Not support rsel value 1 Ohm for pin = 34 (GPIO34)
> mt8195-pinctrl 10005000.pinctrl: Not support rsel value 1 Ohm for pin = 35 (GPIO35)
> 
> Specify the pull resistance for those GPIOs to fix the errors.
> 
> Fixes: 5bf7dabe40f2 ("arm64: dts: mediatek: cherry: Document gpios and add default pin config")
> Signed-off-by: Nícolas F. R. A. Prado <nfraprado@collabora.com>

Hi Angelo,

it seems this patch fell through the cracks. Do you want me to rebase & resend
it? 

Same question for this patch:
https://lore.kernel.org/all/20240606-mt8195-dma-scp-node-err-v2-1-e14702e9d3f2@collabora.com/

Thanks,
Nícolas

