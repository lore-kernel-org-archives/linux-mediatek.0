Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4742CC27C43
	for <linux-mediatek@archiver.kernel.org>; Wed, 29 May 2024 12:33:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Date:Message-Id:Subject:References:In-Reply-To:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=nZR385nhzQG6j/jJTJJ0to5h5uRARnPMhfHIlKjsCu0=; b=DE19EQSP10nbWjbMJCosTTylMa
	owlCul+PfBcofzwdrhXgvlVXqbxD18Biist70Ylkgpkl2FH/v9wuzQ8DON1OhyNWL5/wyhzvlcUwG
	cGaG7khYvUUw1F73AqeNUEmUpV6UIUzzsymk8+GWDGuVLtO/SiCx22GTNcGEGo4x/BeiD6QdOiNTq
	5yS4Yq4VStHjkZ/OueHGvgFVaRlvSp5bEVS6nIMQTW6yD1B+ofHkDJclSblPnept4q6BiRPW7u1qO
	nfzrclKV0wQCeZS6qXfEKF17GgRZAp+EcxFoV3JKFFTzxFCTC1ogRFdl9Hsj7NfOtyvDWP8gTC8CL
	tV0TYfRg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sCIUs-000000047lp-3Ek1;
	Wed, 29 May 2024 12:33:38 +0000
Received: from madrid.collaboradmins.com ([2a00:1098:ed:100::25])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sCIUp-000000047l2-0ZuF;
	Wed, 29 May 2024 12:33:36 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1716986013;
	bh=TtvIqDj/cbzytXl+BfyEW3QVw8j1n3TE8MYTau3IeMw=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=AiSYD2DXNs8yMYs+HBIGlGChfRvsZOtVsR3myGqnAZp1gIDiHIs3fbhOe95eNqbR5
	 jEdJBqgAiIqi+eVNi3krsoukFHlO5fzImkYaBbFT/4gPRegP0kqMWskMp4/47Cgj9x
	 WGzwjLQaPazqOlAgvfHE1PBCD5U0Y7YO5VZV/9pUt3k73LFeEDlRn8HANrLb41qURo
	 z5BXDFjdQfEeCo4EK2M6IEbL3GL185BpfohtP+augqH/W99UxcfbalJb2wN8lV/DC0
	 2nFhSYu7klwd14olAN3Xbs1UkswoSz3Ye6G2bpUNIeOxbUVyUQzl+rA7L8mE+5aeo8
	 ZB6iymg6yRUrQ==
Received: from IcarusMOD.eternityproject.eu (cola.collaboradmins.com [195.201.22.229])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by madrid.collaboradmins.com (Postfix) with ESMTPSA id 3429E378000A;
	Wed, 29 May 2024 12:33:33 +0000 (UTC)
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
To: Matthias Brugger <matthias.bgg@gmail.com>, 
 Geert Uytterhoeven <geert+renesas@glider.be>
Cc: soc@kernel.org, linux-mediatek@lists.infradead.org, 
 linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org
In-Reply-To: <2fd900a30b5a0f7de4ea68f60bac250794b8cdb4.1716984213.git.geert+renesas@glider.be>
References: <2fd900a30b5a0f7de4ea68f60bac250794b8cdb4.1716984213.git.geert+renesas@glider.be>
Subject: Re: [PATCH resend v3] arm64: dts: mediatek: mt7986a: bpi-r3:
 Convert to sugar syntax
Message-Id: <171698601313.527285.15364047983482006077.b4-ty@collabora.com>
Date: Wed, 29 May 2024 14:33:33 +0200
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.13.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240529_053335_396518_2BB2D3AF 
X-CRM114-Status: UNSURE (   7.37  )
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

On Wed, 29 May 2024 14:06:14 +0200, Geert Uytterhoeven wrote:
> Overlay syntactic sugar for generating target-path fragments is
> supported by the version of dtc supplied with the kernel since commit
> 50aafd60898a8b3e ("scripts/dtc: Update to upstream version
> v1.4.6-21-g84e414b0b5bc").  Hence convert the Bananapi R3 overlay
> devicetree source files to sugar syntax, improving readability.
> 
> 
> [...]

Applied to v6.10-next/dts64, thanks!

[1/1] arm64: dts: mediatek: mt7986a: bpi-r3: Convert to sugar syntax
      commit: 01738dc14a7eb3cec7c7f3c804d88a9a4e38a3e8

Cheers,
Angelo



