Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 24101D1CDC8
	for <linux-mediatek@archiver.kernel.org>; Tue, 22 Oct 2024 09:19:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Date:Message-Id:Subject:References:In-Reply-To:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=qWRFAy88i9iDCiYtFdav1hZilK2mtPCIXNICUiC8Dp4=; b=tB3EljOM380G8OHVdPJp62i2tM
	QxCaqsNg1ly6TK1PI08sHMbr8+5xp6LdICQnCHig8CG026Zux9i0/Sau/YaH2mIgCzA0U0NPRRLY2
	AA4IOykrZKZj5aNocashFSr8du7OG5on9jzZFEHn1wA/r8jUm12qOOemmXIv6OwaRO5B3JUaVRQBe
	fg5wau/uDre19aAwvdpmia7EOM7oajeHaubh+P4SClyfBq3Chlf5T/m9eK8v0IXyBvGkRpQu7avHs
	rst/9ek7DB5YiSbrWaZZileDUpa8mHhPK+hpfrcVwSz9WkUM03qNeJ5SvL0tQwMwtv8WN3o6Vf7kb
	KxOduL8A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t3B33-0000000AKPJ-33lk;
	Tue, 22 Oct 2024 09:19:29 +0000
Received: from bali.collaboradmins.com ([148.251.105.195])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t3Azt-0000000AIx7-2heh;
	Tue, 22 Oct 2024 09:16:16 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1729588572;
	bh=dKnWBCt7LzZ5FtFGlHAJYJJx3XRxPgfuRNhgjoZdFnw=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=hrv773sfMTS9T2djR2/3Emq3wlCozUAckSYY9L5rgzXDnsO9FA/4EGyHu36554z9w
	 tDdsknD92cfSmtRou0ZrQ6X2rTKCggn5Q0YdiAGIHqO3k2Hxd5AsF0T/NzVDMTAKoD
	 hh+i4zeBWuxv+4uIlAMILWtm8EEPhmDCN6rMCJVn0mdA5jWZ9V8KSWPBheMlnS7aF7
	 NZeZFTpk9a91Yqv3iCVi9aXt0+CTVwQmNo6Eu9PibNP0ZadLiGxGeUeu0y/aMqPN5h
	 GRZLGSXbugWEKep9dKJtvykC0PutjSIgIXCyuERzNJ3CWy/IhhD5Nn6/lHSQnxhrP8
	 o7iY7T17XTBcw==
Received: from IcarusMOD.eternityproject.eu (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id EB2BC17E1394;
	Tue, 22 Oct 2024 11:16:11 +0200 (CEST)
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
To: Matthias Brugger <matthias.bgg@gmail.com>, 
 Fei Shao <fshao@chromium.org>
Cc: linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 linux-mediatek@lists.infradead.org
In-Reply-To: <20241021114318.1358681-1-fshao@chromium.org>
References: <20241021114318.1358681-1-fshao@chromium.org>
Subject: Re: [PATCH] arm64: dts: mediatek: mt8195-cherry: Use correct audio
 codec DAI
Message-Id: <172958857191.72613.13695952777293754508.b4-ty@collabora.com>
Date: Tue, 22 Oct 2024 11:16:11 +0200
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.14.2
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241022_021614_081745_4F8B2E8B 
X-CRM114-Status: UNSURE (   6.91  )
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

On Mon, 21 Oct 2024 19:39:33 +0800, Fei Shao wrote:
> The RT5682i and RT5682s drivers describe two DAIs: AIF1 supports both
> playback and capture, while AIF2 supports capture only.
> 
> Cherry doesn't specify which DAI to use. Although this doesn't cause
> real issues because AIF1 happens to be the first DAI, it should be
> corrected:
>     codec@1a: #sound-dai-cells: 1 was expected
> 
> [...]

Applied to v6.12-next/dts64, thanks!

[1/1] arm64: dts: mediatek: mt8195-cherry: Use correct audio codec DAI
      commit: 7d5794e6d964940e46286fadbe69a3245fa51e44

Cheers,
Angelo



