Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 41072CF31A9
	for <linux-mediatek@archiver.kernel.org>; Wed,  2 Oct 2024 09:40:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Date:Message-Id:Subject:References:In-Reply-To:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=+7igsCe/ZJ3n2bTuo9+FiLfVDKiikW8Mn/dcHWamiXk=; b=HYIdgnucgdESUUlSxZZ/xBradh
	JybhLBNAHxnh7SvFguHF9u9GHsPMYAgAQXY7so8R8BIfQEifpHrHr7jQM4VHpH3dddRghb2IuDf0j
	EOhe6GPIfJ/n+Fn+HhnCvN9pwpBfTd8VPuDwPcsRaVooe3SqgwaHkz/NGVxsH2FeaVc6Yscv7rWqc
	I+gjkZ54ckvsb30uLEpmuREC0uscDLvU9at1p3Oey2mM65M2aDCHZsTCtSNCYD/l2OLpfxhROW4k9
	1TGnNaA+346+s3VNep1YUlomzeQdOT5JVHSWBn2gCVS2nsclcEpxmabajBIEP7qM0zyUO0REGDDSo
	nqQgdQOA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1svvqR-00000005N3c-1Lti;
	Wed, 02 Oct 2024 09:40:31 +0000
Received: from bali.collaboradmins.com ([148.251.105.195])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1svvjf-00000005Lf6-3sol;
	Wed, 02 Oct 2024 09:33:33 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1727861610;
	bh=V5MWrcloCnllnIn8JJoZtfb9JnL24Lh+8b4pyRiq7os=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=CkewjaoIMfqoJC6DPeY0KR4HW1CGM/bxC/kTbpeBChEpT1ON6gNgJrVhLjCHdSPCL
	 2rVOFZgnSlnC3nopddFdAVR5wgFNRpwXdG/ZCl0FonmbuT8aEaqfQ/aQgAISR6IdfQ
	 0qu41Pz5L06lqMldUP4YbR38yL9SLbqz8kKYgEWaXpLaG8eag+hpXekqKPEimnf4s3
	 XRKGZfSnrF7MmFimIOK3jhQAgwEcFbkOEIrqeeX76pMhAWlybIP6qVzsNaQwVbCH4l
	 rLyMD4WjtsSzqM2tcc5vsbYjTFQYoBT9ASm9H4CwjlKIIEQkMXbtX+2jTqqJ1HdkKr
	 yXWKl9pcJO9mA==
Received: from IcarusMOD.eternityproject.eu (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 05CE917E121F;
	Wed,  2 Oct 2024 11:33:29 +0200 (CEST)
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 Pin-yen Lin <treapking@chromium.org>
Cc: linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 Fabien Parent <fparent@baylibre.com>, 
 =?utf-8?q?N=C3=ADcolas_F=2E_R=2E_A=2E_Prado?= <nfraprado@collabora.com>
In-Reply-To: <20240919094212.1902073-1-treapking@chromium.org>
References: <20240919094212.1902073-1-treapking@chromium.org>
Subject: Re: [PATCH v3] arm64: dts: mediatek: mt8183-pumpkin: add HDMI
 support
Message-Id: <172786160996.39477.14645002362222354228.b4-ty@collabora.com>
Date: Wed, 02 Oct 2024 11:33:29 +0200
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.14.2
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241002_023332_147470_268DCD47 
X-CRM114-Status: UNSURE (   7.87  )
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

On Thu, 19 Sep 2024 17:41:49 +0800, Pin-yen Lin wrote:
> The MT8183 Pumpkin board has a micro-HDMI connector. HDMI support is
> provided by an IT66121 DPI <-> HDMI bridge.
> 
> Enable the DPI and add the node for the IT66121 bridge.
> 
> 

Applied to v6.12-next/dts64, thanks!

[1/1] arm64: dts: mediatek: mt8183-pumpkin: add HDMI support
      https://git.kernel.org/mediatek/c/72f3e3d6

Cheers,
Angelo



