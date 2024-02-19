Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 29660C48BC3
	for <linux-mediatek@archiver.kernel.org>; Mon, 19 Feb 2024 10:03:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=zIAcZy1VilDDyGH0xxGoyG/iWko6yQhNRKRevOMykKc=; b=eD9qDmniYVJqQhP56nyzlaaVxz
	Lm6lOGbqq2sXuWljFWG+9p9Z1DCmonCITiKrFiO36/eb0l20kSjnskX8yYDfxQ6ejwr1NKBn/CKpD
	iVnOIyAOETDLQOf4uD6InA9A7HxGemam+Z5gSK/5sczE0NQzK7lQBonfx4RdmYcpQw9rXrWbGMpu1
	jDp3yvds2ZkzGSaIid0w2KT1B4mbiy3EeJaYb2TSZeTguAnQDyj1oh4eDhS7bhpmhq4re27UQDikx
	d8aQkULrqO55sxi84Dfs5TZC0pJ4KKmmNmIdNu/ApVMohHuk/BIbVrW3do8PyQIwE5t4JTEtbwUOy
	IYV+lHAw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rc0UO-00000009x2k-3EHr;
	Mon, 19 Feb 2024 10:03:08 +0000
Received: from madrid.collaboradmins.com ([2a00:1098:ed:100::25])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rc0UL-00000009x0Z-0a0n;
	Mon, 19 Feb 2024 10:03:06 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1708336983;
	bh=HqsOIJb5iZIsdTx/9+wzLDZFTiKmXPmHGZEETmuqA/E=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=fIYyj7HkYuKtsPw+l99jhHS5OjmIhBzOR0qVzZA3mylXcuJ/nt+0O0TCYIitsaew/
	 uo2cw6ONm7yCiTe1IrgpCd5L9r25x2nAnPx9o1sx68joxz1n+PCNI2qQ7XV8krEzFf
	 F8AglYpaNodVpajOe6J0ra+6WgHAdW+TM94J8CBUqwlw5JTkv2NWFtHQpCMhcuizsJ
	 lOZ9ectKFROthHAh41ycto5TX/jmhjsSBB+3PXTh8A1MUsUHYVNa+yuBrs6PsYLCul
	 pEA4bVuCNVDO41v/o3ZcTk6WHgkuCJlCOuTiaZ1C31CPK8MIuSA+c2QRyWhZXdjw9V
	 W5CUhJHABQgfg==
Received: from IcarusMOD.eternityproject.eu (cola.collaboradmins.com [195.201.22.229])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by madrid.collaboradmins.com (Postfix) with ESMTPSA id E8B583781FD9;
	Mon, 19 Feb 2024 10:03:02 +0000 (UTC)
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
To: Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	=?UTF-8?q?Ar=C4=B1n=C3=A7=20=C3=9CNAL?= <arinc.unal@arinc9.com>
Cc: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	erkin.bozoglu@xeront.com,
	mithat.guner@xeront.com,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org
Subject: Re: [PATCH 0/2] Add port@5 as CPU port on certain MT7622 and MT7986 boards
Date: Mon, 19 Feb 2024 11:03:00 +0100
Message-ID: <170833695121.72704.8159416902422246326.b4-ty@collabora.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240219-for-mediatek-v1-0-7078f23eab82@arinc9.com>
References: <20240219-for-mediatek-v1-0-7078f23eab82@arinc9.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240219_020305_329292_5E889D1A 
X-CRM114-Status: UNSURE (   8.58  )
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

On Mon, 19 Feb 2024 12:36:12 +0300, Arınç ÜNAL wrote:
> This patch series adds port@5 as CPU port on certain MT7622 and MT7986
> boards.
> 
> 

Applied to v6.8-next/dts64, thanks!

[1/2] arm64: dts: mt7622: add port@5 as CPU port
      https://git.kernel.org/mediatek/c/7b8cc130
[2/2] arm64: dts: mt7986: add port@5 as CPU port
      https://git.kernel.org/mediatek/c/43ec7fc9

Cheers,
Angelo


