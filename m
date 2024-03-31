Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A51DACD1284
	for <linux-mediatek@archiver.kernel.org>; Sun, 31 Mar 2024 09:28:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Message-ID:References:In-Reply-To:Subject:Cc:To:From:Date:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=7fryVNeKcFi90zGkyiXh+sDRmYe0qNq3h58tPTD/nTY=; b=cM7Z6SLNsepO+3NoJyQuP6qT6i
	jE+aj4MIp79FDQKDUdtT3TQ1rfbXRoiz1xCHtw0dpO1c6W3azzGTSE4utwM0H3knMdabyW9Duy2qH
	yf94X3UeenMD4/6QH0OGFCrWnUJqCn3V2ciO8brZIIxz0E20ryDBmYaYfsXfIXL9rgpZ2BtM7+Xb0
	zFqG7rbsUpMnfIi6U8rUTwrjQ9g9V7O2U1vz4EwrnsIrCxort2dX46o1YSnKq//1BTY+c4SQcwjQa
	/m6gspBg+AUJrcn0LdXQPLednoethLD0198gNzxuBc58/MwZJRi/e+1KGL3THcWfWAzhiQM/ywDvW
	Wfjvx9ZQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rqrUB-00000005AtX-3LFi;
	Sun, 31 Mar 2024 09:28:19 +0000
Received: from relay2-d.mail.gandi.net ([217.70.183.194])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rqrU7-00000005AsF-2N63;
	Sun, 31 Mar 2024 09:28:17 +0000
Received: by mail.gandi.net (Postfix) with ESMTPA id 088D240002;
	Sun, 31 Mar 2024 09:28:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arinc9.com; s=gm1;
	t=1711877290;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=7fryVNeKcFi90zGkyiXh+sDRmYe0qNq3h58tPTD/nTY=;
	b=SYbvsV0QOW5SIxArNvayTkUOk1Iu/7frW4lonHhDTt9QJbYqJjwak/raLpyUYHV9mYoVX+
	VSrTjlHuSWJIprEyNU3wP6MLKjsty5nII0og5SPfkenzTGwLrmCzE4nJnV+t5n2bJpIIep
	NgwWzc0MLvcN1VY4x0nE4DJKzkr9VtSpYWR6diqPfCEtu2s/PU85OgLxFn0M5XRtJTKRdS
	vgK4UjBWF+FF7wnKvTdUkOFXLpnTef8ChLPno3paxPaNsNB3FE2zTc5LK5qeh2AUDhAQpv
	IExxVs4vthw95Exeg8CZa5UwC5LMDnPWXDXu9uaPhO5TAuL6nJ1Rm61JMfgkqg==
MIME-Version: 1.0
Date: Sun, 31 Mar 2024 12:28:08 +0300
From: arinc.unal@arinc9.com
To: Rob Herring <robh+dt@kernel.org>, Krzysztof Kozlowski
 <krzysztof.kozlowski+dt@linaro.org>, Conor Dooley <conor+dt@kernel.org>,
 Matthias Brugger <matthias.bgg@gmail.com>, AngeloGioacchino Del Regno
 <angelogioacchino.delregno@collabora.com>
Cc: mithat.guner@xeront.com, erkin.bozoglu@xeront.com,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org
Subject: Re: [PATCH 0/2] Set PHY address of MT7531 switch to 0x1f on MediaTek
 arm64 boards
In-Reply-To: <20240314-for-mediatek-mt7531-phy-address-v1-0-52f58db01acd@arinc9.com>
References: <20240314-for-mediatek-mt7531-phy-address-v1-0-52f58db01acd@arinc9.com>
Message-ID: <ff196055-ecd8-4563-bc01-ff2533a07109@arinc9.com>
X-Sender: arinc.unal@arinc9.com
Content-Type: text/plain; charset=UTF-8;
 format=flowed
Content-Transfer-Encoding: 8bit
X-GND-Sasl: arinc.unal@arinc9.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240331_022815_767509_FFED0D2B 
X-CRM114-Status: GOOD (  11.09  )
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

On 14.03.2024 15:20, Arınç ÜNAL via B4 Relay wrote:
> Hello.
> 
> This is a small patch series setting the PHY address of MT7531 to 0x1f 
> on
> all boards that have the switch.
> 
> Signed-off-by: Arınç ÜNAL <arinc.unal@arinc9.com>
> ---
> Arınç ÜNAL (2):
>        arm64: dts: mediatek: mt7622: set PHY address of MT7531 switch 
> to 0x1f
>        arm64: dts: mediatek: mt7986: set PHY address of MT7531 switch 
> to 0x1f
> 
>   arch/arm64/boot/dts/mediatek/mt7622-bananapi-bpi-r64.dts | 4 ++--
>   arch/arm64/boot/dts/mediatek/mt7622-rfb1.dts             | 4 ++--
>   arch/arm64/boot/dts/mediatek/mt7986a-bananapi-bpi-r3.dts | 4 ++--
>   arch/arm64/boot/dts/mediatek/mt7986a-rfb.dts             | 4 ++--
>   arch/arm64/boot/dts/mediatek/mt7986b-rfb.dts             | 4 ++--
>   5 files changed, 10 insertions(+), 10 deletions(-)
> ---
> base-commit: ba90af39ba57b3fe3ecfdba0c87a80d20c7b788d
> change-id: 20240314-for-mediatek-mt7531-phy-address-9d0b4cfeca21
> 
> Best regards,

Reminder that this patch series is waiting.

Arınç

