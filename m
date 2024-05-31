Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 35B00C25B75
	for <linux-mediatek@archiver.kernel.org>; Fri, 31 May 2024 13:57:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Date:Message-Id:Subject:References:In-Reply-To:To:
	From:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=VayvOFE37WAuPRfdVrjSiRg/79iWz8eI4KGxBxpgkyU=; b=JrIZ90moGS2HG8xw+djprc3n1k
	nv/KMfwr86SShLw86XX5hjoNGdKmxemwl3yMsAQysXGaWEsh23vdJCpJsQul1gEu172Cf4wzrKYdi
	tRj54y0ncP5sjaL9xWUr7U8Tfe+G5bm9PBwpEXrT6lmHxLK3O44l2wGvx9tswNLW7iIuhzDFct41a
	jzBcbuJWsH4rWYlRsbSlx7m5Nl7KC3cLjpu7ncolOO+s2BgChV/2zHBnULpkFjiN53xM7RC0dxQNz
	EJrARBiF0jB976H4svj26n81VeHUATeiijg/zIGjmWJ/5gLXmWbtzcG9+W7orMFJHGk/Gq5iWAuM1
	15H/x1sQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sD2lS-0000000AQVC-2Upv;
	Fri, 31 May 2024 13:57:50 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sD2lP-0000000AQU8-0l7k;
	Fri, 31 May 2024 13:57:48 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 7B5D462C4D;
	Fri, 31 May 2024 13:57:46 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E8BABC116B1;
	Fri, 31 May 2024 13:57:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1717163866;
	bh=C3ouozwm1IiFQ01Aw+++mEdQu3kWfVy8HqAjEf2Golg=;
	h=From:To:In-Reply-To:References:Subject:Date:From;
	b=dLLx7F5jq68u9NfFbNCrKk80jP07XZd3TTFhQIRksyVDsxu/exJ5iyJiUH3t5AC3w
	 U/JwIHxLHktz6xncM3SGtmA4B/MY2fymJ6bRbc+axK3CBDvTfm9NJ/+CgDKTv1NEOD
	 AN01qr1GmR6qqD8Px1J93Q4nqLVOGWhXj2tH64fkl0F/wwbmjsEBk17GSepKJChJuR
	 xwAqGfoXp+B/QzJbTrDyTj4NRnS28uKuiMn66TRgLPbZTgxSkya+EXES8jjdhsDmc7
	 Y+sqT2seBAWE+GY5unx1bAM4dtS4ZBARWE519vL2jMkIvltARLk285L+G5vCzamqcp
	 YlbLKCjtnwYDw==
From: Lee Jones <lee@kernel.org>
To: Lee Jones <lee@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 MandyJH Liu <mandyjh.liu@mediatek.com>, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-mediatek@lists.infradead.org, 
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20240518211159.142920-1-krzysztof.kozlowski@linaro.org>
References: <20240518211159.142920-1-krzysztof.kozlowski@linaro.org>
Subject: Re: (subset) [PATCH 1/4] dt-bindings: mfd: mediatek,mt8195-scpsys:
 add mediatek,mt8365-scpsys
Message-Id: <171716386365.1113959.6499832475900299383.b4-ty@kernel.org>
Date: Fri, 31 May 2024 14:57:43 +0100
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Mailer: b4 0.12.4
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240531_065747_308890_0410776A 
X-CRM114-Status: UNSURE (   7.48  )
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

On Sat, 18 May 2024 23:11:56 +0200, Krzysztof Kozlowski wrote:
> Add a new mediatek,mt8365-scpsys compatible, for the SCPSYS syscon block
> having power controller.  Previously the DTS was re-using SYSCFG
> compatible, but that does not seem right, because SYSCFG does not have
> children.
> 
> 

Applied, thanks!

[1/4] dt-bindings: mfd: mediatek,mt8195-scpsys: add mediatek,mt8365-scpsys
      commit: 50c779be27066b4e25873a15580999008d068ff7

--
Lee Jones [李琼斯]


