Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EFD9FC25B77
	for <linux-mediatek@archiver.kernel.org>; Mon, 20 May 2024 21:22:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=tg1qbLCJATh0fAvY0OYpCWrQOdxi5+SocWmqaVlbks0=; b=GE7etsADL1cai3t7wHOhsG0CIt
	fyFlKyFjD4nhlnMd56+pZQ+2HUyrtSFeQwzUm/SEPvP9NRKQpad/SzngHgAGwv+02dvXOpAEyyl7r
	0gx1aFhVvzdF1PtV+0tSyQFsNzwisRXIOb6EC0x3WzAxt1YdV9XDxj09qUGf5UNUKZ45xAkdGoW2h
	TZj5Ff4t5fHWrdBYwNEbUPkAxTFyH/a2568/a90/TAbabtgoJ0dEE9FdNmTr5AZMcrh8UGigLcaaa
	urGa7akbEYz+eRcHGy6D1kMCKGG68W49H4+rxd5KGGAnyWnnGvX5Y5nL4oUpBeF+Jr9+UnCjvkMu+
	NGHSDzEw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s9ASY-0000000Fa3S-2RMH;
	Mon, 20 May 2024 21:22:18 +0000
Received: from sin.source.kernel.org ([145.40.73.55])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s9ASV-0000000Fa2f-3JIg;
	Mon, 20 May 2024 21:22:17 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id 5CCDDCE0D8B;
	Mon, 20 May 2024 21:22:13 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5316FC2BD10;
	Mon, 20 May 2024 21:22:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1716240132;
	bh=E6TcOxL5uy2e/cY4PINVvMynIN5+jOe4ZcRRrYdWzI4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=LnRkzITjHDtw1/8w6vcbvQuDUN6HuU47f1hvl2WQCtNmV34bpDgGs7PqLUp3BrxBV
	 ykGPf4vNTIhPlw4eeRCjb2JS6hgyXkNf3DLcDfGvEBsLpteCBRLMPQNJasJsFCtgB9
	 M1xpLWCcIVSRz1A13weQPlssLjuYSa8VrwgJLFj0xTfX3/d7ke9jhSCc0b1hMJHqZa
	 QyU32FqXxDf+ISb0cYIlN8dbGaeUcoMH1lG9GGDnTkmgc39/57noMjGGSGWlE8Z4xe
	 e1cM/rmxDzkxJtPmtW+RrWST7M63H4Vv9OyMfIwAy6eWxPo4eydWzeXgjeVOAgKjpa
	 ERtWs9Q1FoAsw==
Date: Mon, 20 May 2024 16:22:11 -0500
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc: Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	devicetree@vger.kernel.org,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	linux-arm-kernel@lists.infradead.org,
	Daniel Machon <daniel.machon@microchip.com>,
	Conor Dooley <conor+dt@kernel.org>, Nishanth Menon <nm@ti.com>,
	Jiaxun Yang <jiaxun.yang@flygoat.com>,
	linux-mediatek@lists.infradead.org,
	Steen Hegelund <Steen.Hegelund@microchip.com>,
	Lars Povlsen <lars.povlsen@microchip.com>,
	linux-kernel@vger.kernel.org, Lee Jones <lee@kernel.org>,
	UNGLinuxDriver@microchip.com
Subject: Re: [PATCH 7/8] dt-bindings: mfd: syscon: Add APM poweroff mailbox
Message-ID: <171624012885.1611775.15501873485589051240.robh@kernel.org>
References: <20240519-dt-bindings-mfd-syscon-split-v1-0-aaf996e2313a@linaro.org>
 <20240519-dt-bindings-mfd-syscon-split-v1-7-aaf996e2313a@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240519-dt-bindings-mfd-syscon-split-v1-7-aaf996e2313a@linaro.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240520_142216_032451_C29CCCB6 
X-CRM114-Status: UNSURE (   8.67  )
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


On Sun, 19 May 2024 20:42:22 +0200, Krzysztof Kozlowski wrote:
> Add compatible for an already used syscon poweroff/mailbox block in APM.
> 
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> ---
>  Documentation/devicetree/bindings/mfd/syscon.yaml | 2 ++
>  1 file changed, 2 insertions(+)
> 

Reviewed-by: Rob Herring (Arm) <robh@kernel.org>


