Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 15B11CFB43F
	for <linux-mediatek@archiver.kernel.org>; Mon,  7 Oct 2024 14:55:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=emLxQy4ZoYAXoww9bdwTCanFXsFmlVyqGdpCppK9gbo=; b=F0bqRPUOH1LI96iJrNevypFxMf
	dMrDtCKBRv9mNk/78+cV69Jqid4QIj1GWmCngE9YD/dLkNpq7lVnzzDoqb75fE6D3ElsSpI+G3/H4
	4Ramwtu+dqZDcZ/NJEVIsQimiaSqtPBC8ICJS3uYI4F0sIPktJIjFnM9SfIzRJnM1dBtsk/4OxR6R
	YHyu3JzCpG6ZPeNiKezGPbvRJZNQaPaUixvKxTM4mnckf9t0KtuGGKav8S21eQSrTsTbduzd1wLVT
	yuegb7lo1w0eIJz7whtHn/S8BW0YAkN3TyueLDiIrwA8MlteiSlK57Sdf1B1x51+eXpvMrUR77cIX
	dUvmBhiw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1sxp93-00000002ooT-0NfZ;
	Mon, 07 Oct 2024 14:55:33 +0000
Received: from bali.collaboradmins.com ([148.251.105.195])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1sxp7i-00000002oTr-15zL;
	Mon, 07 Oct 2024 14:54:11 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1728312848;
	bh=9/Ra/jDDnLa5AUszXp1dUHjFKSxU6y6Jqx381bWuyDE=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=FVNAV2X4utwp+8hiBgmNYD1A3OTPIU65XCMGxEyHZ1AV7sdeDtBxGOTqTS5CKlAhL
	 P+GQaixTJqVnWh3JfR0hZvE18Bl5O9Em/W1fix/bnNaIM2ARm9caHXvEX/fBSPrgAt
	 RBvtBhOOas0vaD5J9Yk4cYlqAxgrnjQTi1/80RXmDK7qXcLlnV6jlJURkFyNInaUnC
	 IU6sHuz/WNEyWMoBAa7whXIzQbjGM0IcMZ5g2DkVO8QvU4ZsA//kR/A1o0YprNulhr
	 Lin2tHzmOFYMHGusSIFl0ugj0QRrckzbHqSdGM/b9XqBd6CdyEZZTgOpUDZuNnC67U
	 hqBqv26xkzTww==
Received: from [192.168.1.100] (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits))
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 88E5217E35FF;
	Mon,  7 Oct 2024 16:54:07 +0200 (CEST)
Message-ID: <381fcbfa-edfb-46c8-8ee2-1386af2ba4c4@collabora.com>
Date: Mon, 7 Oct 2024 16:54:07 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] soc: mediatek: pwrap: add pwrap driver for MT8188 SoC
To: Macpaul Lin <macpaul.lin@mediatek.com>,
 Matthias Brugger <matthias.bgg@gmail.com>, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org,
 Alexandre Mergnat <amergnat@baylibre.com>
Cc: Bear Wang <bear.wang@mediatek.com>, Pablo Sun <pablo.sun@mediatek.com>,
 Macpaul Lin <macpaul@gmail.com>, Sen Chu <sen.chu@mediatek.com>,
 Chris-qj chen <chris-qj.chen@mediatek.com>,
 MediaTek Chromebook Upstream
 <Project_Global_Chrome_Upstream_Group@mediatek.com>,
 Chen-Yu Tsai <wenst@chromium.org>
References: <20241007024350.7878-1-macpaul.lin@mediatek.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Content-Language: en-US
In-Reply-To: <20241007024350.7878-1-macpaul.lin@mediatek.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241007_075410_493879_5039C7F7 
X-CRM114-Status: UNSURE (   7.57  )
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

Il 07/10/24 04:43, Macpaul Lin ha scritto:
> MT8188 are highly integrated SoC and use PMIC_MT6359 for
> power management. This patch adds pwrap master driver to
> access PMIC_MT6359.
> 
> Signed-off-by: Sen Chu <sen.chu@mediatek.com>
> Signed-off-by: Macpaul Lin <macpaul.lin@mediatek.com>

Actually, MT8188 and MT8195's pwrap registers and code flow are exactly the same:
since they are, we don't need this commit (or we don't need it right now!), and
we can just update the binding so that we can declare...

compatible = "mediatek,mt8188-pwrap", "mediatek,mt8195-pwrap", "syscon";

...hence this driver doesn't get any commit :-)

Cheers,
Angelo


