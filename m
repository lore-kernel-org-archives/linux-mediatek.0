Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 47002C25B78
	for <linux-mediatek@archiver.kernel.org>; Tue,  4 Jun 2024 12:44:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Date:Message-Id:Subject:References:In-Reply-To:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ttEhzrC+GIGcjmYk+wa+z1bNPwfiGpJ0bsewdtoMvrY=; b=1C9lEQXjr4Jy/aUmS8S3KThSK8
	fIuBR/4dzhD8gF9eNy5QoXVwt8E51AkZEiLbvbHFY05z0yAHcH435mK3oiGH/x0HbU7JVIS4IjTNK
	FXeBRCb0esVgaTofjcgW0LsnMGNs4aMoQ3yOU105bOTz0ahs2K2rP2DCeDoCq64WyNlMis5BK1q1P
	6qD2IsypqXIInDgA4pRzYFOvBK6Jwik6jV39rtaTchzOkDtim72MD4TWA8p24NXKN7iIyW9faCthw
	3vim+p+CVs4cXS8Uh11I1DvFq3dI/+75yIic+FxAqBjRjQur8jbT85innX1eBHUOkDC45BFtW0K/M
	DRAMLJAA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sETWp-00000002Klr-3TtJ;
	Tue, 04 Jun 2024 12:44:39 +0000
Received: from madrid.collaboradmins.com ([2a00:1098:ed:100::25])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sETWm-00000002Kka-1KzZ;
	Tue, 04 Jun 2024 12:44:37 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1717505075;
	bh=p46dFaOjZpK3OgYnoTc4t+Mc4ObxgROZFJtGZVC8V/Y=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=srRr7m3SSs8pB8m60vBMDWU9bVriUN/9Xg3O6QglwTa23hjd//i2aySu8OVDzmb4D
	 Bl+O5z5xuvsYTEloLgKONHUwKfqd8NgxfAPEs0/6mQcKnA02bPKBuQeJ3N7KQ7SPoy
	 jgjZUOuhfelbhD3PZtoeK3ME9NHDVZICbGnUdg4TnLxZO1r9hLc5KkRcAAvtT6+NRO
	 1Ecccv+tmpyAdXTgMQhRgS89+BOgSgHcfEu9uUCC0eid8KJSBLVFp0gbcP5jv0fauW
	 hIdVNI9V09NpndefpYuGte1sLw3NA1p1FIXNEDSHWMKLeRwnAPo3HW7Qi5QuGr8NGO
	 HiRXl6JyLTDLA==
Received: from IcarusMOD.eternityproject.eu (cola.collaboradmins.com [195.201.22.229])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by madrid.collaboradmins.com (Postfix) with ESMTPSA id 5F71E37821A8;
	Tue,  4 Jun 2024 12:44:34 +0000 (UTC)
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
To: Matthias Brugger <matthias.bgg@gmail.com>, 
 =?utf-8?q?Rafa=C5=82_Mi=C5=82ecki?= <zajec5@gmail.com>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, devicetree@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, 
 =?utf-8?q?Rafa=C5=82_Mi=C5=82ecki?= <rafal@milecki.pl>
In-Reply-To: <20240604064302.487-1-zajec5@gmail.com>
References: <20240604064302.487-1-zajec5@gmail.com>
Subject: Re: [PATCH V2 1/2] arm64: dts: mediatek: mt7988: add PWM
 controller
Message-Id: <171750507431.334281.10525618295173973957.b4-ty@collabora.com>
Date: Tue, 04 Jun 2024 14:44:34 +0200
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Mailer: b4 0.13.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240604_054436_796882_E4213AE6 
X-CRM114-Status: UNSURE (   4.69  )
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

On Tue, 04 Jun 2024 08:43:01 +0200, Rafał Miłecki wrote:
> MT7988 has on-SoC controller that can control up to 8 PWM interfaces.
> 
> 

Applied to v6.10-next/dts64, thanks!

[1/2] arm64: dts: mediatek: mt7988: add PWM controller
      commit: 9e12e66ef9584900b0a08ff7ed1a70078386c0d7
[2/2] arm64: dts: mediatek: mt7988: add I2C controllers
      commit: 92b1be17128be7cc5ba7753ceda973899205ffcb

Cheers,
Angelo



