Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 205A8E7718B
	for <linux-mediatek@archiver.kernel.org>; Mon, 23 Dec 2024 11:40:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Date:Message-Id:Subject:References:In-Reply-To:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=55EKLv0/mObdciGWHZ2WoLnd+/7EMidxvkGuXSZW8t4=; b=qoqxJMJ/ASB64pLu3Ns+FbrtoI
	mJbzYFKHrSCB/iefPfBdJB6izsUzZOfYFoRFEvd4zN4whTUq/6u4s5l61+BMkUDxYVnZ8W17fCeN6
	okRbUcCXqwYzuXBB/CThvBE71oUsSGEDZAqFWxPYJyF174LG1GcPU+r7y49Eo56YqTsKR5P8wEfQs
	xWs2colovVpMmznsCNHjNjx/GI67b7LLTYas4ffLXt49O/wPmMpaxlxOcZh4XqplcgDl3yL2zodFr
	EA2kFjWjbGRDgeHPZN+QOx4LT/ogAHdhbf0gqJys/u9GegiyDYVPmOZCBCujZlwNh2ujx9mXt+okj
	qM/xAEdA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tPgnm-00000009vBt-0hI5;
	Mon, 23 Dec 2024 11:40:46 +0000
Received: from bali.collaboradmins.com ([148.251.105.195])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tPgcj-00000009u7F-2EmL;
	Mon, 23 Dec 2024 11:29:22 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1734953360;
	bh=XOPtTvgUGmse9HYA6g645mQ7/aXPjfWD4Xe/QesJL3c=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=AEo3/1gknag3uZKjeMVGGrNmhPkPMzsAf7xIhXtZbWwKIzKI+4P1LymWj8w7AQgi4
	 DnCpKbco4ewg5Bg2GWNdGPnOg3KCDa0m2qWR7eBhklI8dkDiBx61Jrs9OciY6LpCgs
	 xcfMOVelrAVWcF3Moak1Wlhh6xa+jdmno2YcWtNkql09Ma/EDcQvIDJh4cd3tEUvKs
	 ulaiabVIlYLvpDqQP9sQFUFZHPNMHmWHeXDuMoRwPE0/CeEh2cwkfF0JTt7RqcfHpC
	 bmKbrEckj9HpyGCKGRajRDqzCxZQVdLfat6KGTrD9lI82u9z2IBUmXBIiQp9WdJe8F
	 v+qxFHrjh2WlA==
Received: from IcarusMOD.eternityproject.eu (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id CDDA417E3683;
	Mon, 23 Dec 2024 12:29:19 +0100 (CET)
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
To: Matthias Brugger <matthias.bgg@gmail.com>, 
 Chen-Yu Tsai <wenst@chromium.org>
Cc: devicetree@vger.kernel.org, linux-mediatek@lists.infradead.org, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
In-Reply-To: <20241030070224.1006331-1-wenst@chromium.org>
References: <20241030070224.1006331-1-wenst@chromium.org>
Subject: Re: (subset) [PATCH 0/4] arm64: dts: mediatek: mt8183 cleanups
Message-Id: <173495335977.39294.15680283704993365440.b4-ty@collabora.com>
Date: Mon, 23 Dec 2024 12:29:19 +0100
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.14.2
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241223_032921_750543_7790FCEB 
X-CRM114-Status: UNSURE (   8.03  )
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

On Wed, 30 Oct 2024 15:02:19 +0800, Chen-Yu Tsai wrote:
> Here are some cleanups for the MT8183 Kukui and Jacuzzi device trees.
> These just fix up some names, add missing supplies, and drop redundant
> regulators.
> 
> Please have a look.
> 
> 
> [...]

Applied to v6.13-next/dts64, thanks!

[1/4] arm64: dts: mediatek: mt8183-kukui-jacuzzi: Drop pp3300_panel voltage settings
      commit: 0b5b1c881a909f17c05ef4b1ccb421e077f6e466

Cheers,
Angelo



