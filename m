Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3C43AC25B78
	for <linux-mediatek@archiver.kernel.org>; Mon, 20 May 2024 21:05:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=pKRjwH5ZZtQmfTqeIMZu7R8zcDkuEmf493aluGP+5LQ=; b=WRenk/CeavdnUYP7UxvnEgfQE2
	QW/oEweQq9P1BpPwEex2ejVxR7woUSBTQ1SDXdD27iDN59d9mRFfk0JbtQjPm5pG85U7rfTy0Wcmu
	tsGkQT/lq4puaV0ccuMgYBkT3z2esrRaG1dbCsPEta1AZucwWWY8X7GhDGALEr2iipMmdgUghNfRf
	8OE12mcNQY8LIJt88kWtcu9wVcuKkwG69obpCIifAMQPpZ0o4DoAo4uZ1MAYzBg6+xKuAxkly5VS0
	9W1TMi7wqjPB38slpNnqdOAq8dk6uE/UC+OzQigr4FnCjBri106pCFqv03fTt6G9f+Bv/cHbEPTcO
	32H4RQ4w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s9ACU-0000000FY8i-3Bsb;
	Mon, 20 May 2024 21:05:42 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s9ACM-0000000FY4R-31x9;
	Mon, 20 May 2024 21:05:36 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id A031D61EC0;
	Mon, 20 May 2024 21:05:33 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0BCF3C2BD10;
	Mon, 20 May 2024 21:05:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1716239133;
	bh=wKrqbrbcLS0ty3ta4Fz+PTIydCfOBtp4hZWaaDhE8Q4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=P1Li+VzIwBX4VZ6MRkqIGkMQu/mvlZ/THcYVm69WA7SSv0lqPRKKvkZFzqxT7/VZo
	 KwdW67iJoFR+WvztOXdRSiGPfVgc81pcPVJOSY9t+RDfLvAABfiYUxtDrmnljjZUdR
	 OcSDi99WueHO5ur1G6EYFAW8pSNRF9gdoSLaLpBdwkuANji/PWCwy7MMgiMRzI5Qyf
	 0pIpRyEabBrQTQBLnuXDCWZv4yJjYa/Fs6GVvH5d6NTKpJRtpXoYy2HQnttUfHJa68
	 8h37zpUPoK2Wnu1/38Qx2OpwQ7PZQlFJKawLMW8LW45srp5cBJajl9Rec/zte6TI5c
	 1A9tBqyj0EU+A==
Date: Mon, 20 May 2024 16:05:31 -0500
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc: Lee Jones <lee@kernel.org>,
	Steen Hegelund <Steen.Hegelund@microchip.com>,
	Jiaxun Yang <jiaxun.yang@flygoat.com>, Nishanth Menon <nm@ti.com>,
	Lars Povlsen <lars.povlsen@microchip.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org, devicetree@vger.kernel.org,
	Daniel Machon <daniel.machon@microchip.com>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	Conor Dooley <conor+dt@kernel.org>, linux-kernel@vger.kernel.org,
	UNGLinuxDriver@microchip.com
Subject: Re: [PATCH 1/8] dt-bindings: mfd: syscon: Drop hwlocks
Message-ID: <171623912890.1499407.12141677897291152104.robh@kernel.org>
References: <20240519-dt-bindings-mfd-syscon-split-v1-0-aaf996e2313a@linaro.org>
 <20240519-dt-bindings-mfd-syscon-split-v1-1-aaf996e2313a@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240519-dt-bindings-mfd-syscon-split-v1-1-aaf996e2313a@linaro.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240520_140534_828302_787974E7 
X-CRM114-Status: UNSURE (   9.11  )
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


On Sun, 19 May 2024 20:42:16 +0200, Krzysztof Kozlowski wrote:
> Apparently there is no in-tree DTS syscon node having hwlocks, so drop
> the property to simplify the binding.
> 
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> ---
>  Documentation/devicetree/bindings/mfd/syscon.yaml | 5 -----
>  1 file changed, 5 deletions(-)
> 

Acked-by: Rob Herring (Arm) <robh@kernel.org>


