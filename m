Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EA30DCFA754
	for <linux-mediatek@archiver.kernel.org>; Tue,  8 Oct 2024 09:01:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Date:Message-Id:Subject:References:In-Reply-To:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=I5mJB4/13yI8vhQPjlN2QCyvEbKu6o3GwCNkMIyZ4dY=; b=kIYDGjlW7tydr2x/KpQ44yDSJS
	wpP1ozqglkzxgPv0bfHEiHGx7Pi50orCSH+O9r94RIN3K/enUAcm1x8wTOhaZoxoGYE6g7VvQ5dxb
	nSteJY8D9gu708yjpdO7eU1n4d20LgnHC34epOw7laXksgGHNAdcjy5TVMtL5u4AZAsFd3aNUYRuw
	Sg8uvWeWFxzCahZ/diski9j/v73T4sL0ixWy+GO5Y4HV35DwLUrl0DYiPnGb+Pv9/W8uLe+jTCL7I
	M+/t4l+fvUNjpJ4MpL+FbvwzswYyJzc2YMb2JB288425Y1KHp2UeWczuDBTpR3S7jCi5Zb3+uhsQb
	T/OTszHQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1sy66I-00000005CeW-00e7;
	Tue, 08 Oct 2024 09:01:50 +0000
Received: from bali.collaboradmins.com ([148.251.105.195])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1sy60B-00000005AIJ-2xAL;
	Tue, 08 Oct 2024 08:55:33 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1728377730;
	bh=rvjGmFEsoc0/TUD1jfFG2aFMzQUg4L/iSKC6A+/Qo7E=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=Zykpkf0SnNylPL05nhtlqxHronlK952S9bxwc2slA0PKGVnU0lDmZMFov/NJULfoT
	 mZPDh/f9R3kWqGn13jrZzlUq6UZyqGPrEeJugWlIqs+nvrdyVAYunFUhKBV7PvfA19
	 10l52WpC4JQTuXUt2nwpKKNYJ0gBB8MBMr5wOeBTmgwH45bq4bGnrLsjjf0i39Lk7C
	 hFPKv1tX6l1fyxooUt72qsgFX4ny+lXUBiQcK1exeqvjtLeenDLNdMNkVj6hP4Ggsq
	 B5mtsHJKzARmWnE1PWIl2soqTE1btxukiSy6MVTrFag+CVnUf/rtNqOXRGcaA7uWUJ
	 X184jTVamDxHg==
Received: from IcarusMOD.eternityproject.eu (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id AEE9F17E10C2;
	Tue,  8 Oct 2024 10:55:29 +0200 (CEST)
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 Enric Balletbo i Serra <eballetbo@kernel.org>, Ben Ho <Ben.Ho@mediatek.com>, 
 Hsin-Yi Wang <hsinyi@chromium.org>, Nicolas Boichat <drinkcat@chromium.org>, 
 Hsin-Te Yuan <yuanhsinte@chromium.org>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org
In-Reply-To: <20240909-eeprom-v1-0-1ed2bc5064f4@chromium.org>
References: <20240909-eeprom-v1-0-1ed2bc5064f4@chromium.org>
Subject: Re: [PATCH 0/2] Fix the address of eeprom of mt8183-kukui
Message-Id: <172837772966.33303.10861074513601839928.b4-ty@collabora.com>
Date: Tue, 08 Oct 2024 10:55:29 +0200
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.14.2
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241008_015531_923571_5FBF3D56 
X-CRM114-Status: UNSURE (   7.65  )
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

On Mon, 09 Sep 2024 08:33:45 +0000, Hsin-Te Yuan wrote:
> The address of eeprom should be 50. The fixed commit in krane one is
> older than the rest, so split it for backporting.
> 
> 

Applied to v6.12-next/dts64, thanks!

[1/2] arm64: dts: mt8183: krane: Fix the address of eeprom at i2c4
      https://git.kernel.org/mediatek/c/d7f3e27b
[2/2] arm64: dts: mt8183: kukui: Fix the address of eeprom at i2c4
      https://git.kernel.org/mediatek/c/c2f1aa44

Cheers,
Angelo



