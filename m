Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CB351CD37B5
	for <linux-mediatek@archiver.kernel.org>; Mon, 11 May 2026 09:47:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Date:Message-Id:Subject:References:In-Reply-To:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=bKeHQJuKhbJacbnVH2fw8TyHYYhmR3Cw7Ih7a1BuhZQ=; b=JjvOtfylSNCMNVvgmliq/JHW3I
	cUxpN4k2j3AItHwIuT1W1qElo9gwfVmYOsgueyodM8vlHvkplKBh06gowuBBA3HpAuD4YqWb3fV+z
	58r0fL/oqPRgA+qvKRDrzUjOM2Qfp3M4somOMoM+lqijd5LEFv2X6fzab86CzM1NxeQovNlxZ5Bnu
	zFwEkkrr2KbtNdykcfG1qLZ4vnIcaGB0xt0uE9Jk89TkAMM580mPpn2DJMqkwa8qM5lKr4S4Bdl+o
	njAP72XXGWcTgiZ+i2cGWP41w8YRkCjz+4kBKuoiMM1F95c2yOIOBsKLVq5KuB/sYjFpDrpLoOUFR
	/gbBCreg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wMNEy-0000000CznN-49sv;
	Mon, 11 May 2026 09:47:56 +0000
Received: from bali.collaboradmins.com ([2a01:4f8:201:9162::2])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wMNEs-0000000CzjA-0QoX;
	Mon, 11 May 2026 09:47:52 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1778492867;
	bh=KAacyabt/cyiwQDZ9EaRG+E1w1FvHnkbqvn0xq5Avbo=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=kFumTGzQRWkaBQrsyuRDrLwqTfv0wZzZ1C8sGz/xu1JGz/O1Hf1teietlC8U2ZdBM
	 JntsDi1edyLi1IpK4q+cl8ojALmPvrReheW6N5BOIXMdrazt3AEdV3qnh25UqzkZJw
	 37I1+gnIfb4DbrlwbsLi7JPkFlw7dSko501OF0PutsuCmhkzBVlHglkxqel/GltCvd
	 UtjPcZNN2LB0iBpWY/VicNhFUTndpvcIphNc1Lv8u8rySGVpPa/bRlAbN2FNTQKfZP
	 iw+Py3usi+igfOX98gmaMWJUhD4S2HGmqVZGuFuhff/mA4lwSP97pcw34K/YVSJAdx
	 xuQQ12eNhdjiw==
Received: from IcarusMOD.eternityproject.eu (unknown [100.64.1.21])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 4EF7D17E12E5;
	Mon, 11 May 2026 11:47:47 +0200 (CEST)
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
To: robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org, 
 matthias.bgg@gmail.com, Akari Tsuyukusa <akkun11.open@gmail.com>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org
In-Reply-To: <20260325144500.667385-1-akkun11.open@gmail.com>
References: <20260325144500.667385-1-akkun11.open@gmail.com>
Subject: Re: [PATCH] arm: dts: mediatek: mt6589: Add Arm Generic Timer node
Message-Id: <177849286725.117937.1598232312363149560.b4-ty@collabora.com>
Date: Mon, 11 May 2026 11:47:47 +0200
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.14.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260511_024750_672160_402FE24C 
X-CRM114-Status: UNSURE (   6.02  )
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

On Wed, 25 Mar 2026 23:45:00 +0900, Akari Tsuyukusa wrote:
> Add the Arm Generic Timer node to the MT6589 SoC.
> "arm,cpu-registers-not-fw-configured;" is required
> because the bootloader does not initialize the Arm Generic Timer.
> 
> 

Applied to v7.1-next/dts32, thanks!

[1/1] arm: dts: mediatek: mt6589: Add Arm Generic Timer node
      commit: 2a5d54507c68c2a8de9d6f6746f23771d38f4dbc

Cheers,
Angelo



