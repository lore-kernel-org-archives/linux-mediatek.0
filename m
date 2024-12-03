Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7FEE4D49797
	for <linux-mediatek@archiver.kernel.org>; Tue,  3 Dec 2024 09:14:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=/gZuFaHsyUlIlCX2Z6oddDLWmb2ejZ3NFfijfPLuW18=; b=pC1vjyUBdyKwMeFXeWN0fTsvZC
	jlIvaKMyP38O135KnOwhl2YOOd1Iuyy6nXm+5MFmH3NjDHNflznpa0KZIAu9VVIcyBf7bvPc6dbwU
	028e860e5fGLV4/zzRJJugLDjDQppXDseski0PXTV+8cR7WpO/AKCkYZwnmTpXFmEPn77jnbKQF4s
	5PDiOE4nuSNR9acNVJep06rU8tSgE+4m3CvXaiXLlgCpafRh0KYJCkzyX0VTuquZiBA/qLK3CdvPL
	TlDG9x8VAiZkmCb5m6uMX8btSFzpzLezC3IsHSGi6kAcAic+4GFCCzE1CJhke5T/3iVEG1zvCHxzc
	xj3trHdQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tIOzR-00000008phI-2o5M;
	Tue, 03 Dec 2024 09:14:41 +0000
Received: from bali.collaboradmins.com ([2a01:4f8:201:9162::2])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tIOwG-00000008oxe-43Zj
	for linux-mediatek@lists.infradead.org;
	Tue, 03 Dec 2024 09:11:26 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1733217083;
	bh=JeOaPTPE3XyoYu5PdVQ2W1gB197DwY27Ozt4mP2oI1U=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=MjzWsLPZ9awEQUPLnw7uptgfrVQdttYqvZWBxTx0f/yC3kM5ZSZZt1B7kYi+hKDqC
	 PFjTN0miZUadRd+Lj4cc54gzLNXRH7TFCvoORAcRirowLT6f7SShqmHtwROoq6sbBb
	 5pgDuifRd7jdNEi6exDnnE1qLZw2feo5/ipR7TpiFqP64kd1BdTsFJMPVMIWpRt5Bo
	 xJLWzSOJniT+H0fMtGzSbPX4O6mXCggZCBVGUACqkGvhvkxW40fuUImsMBkCszqF22
	 0sFrtQ3F/BxWKntAKbgOIDO94jbXILugzshUX9On67A6cR99UK5wa2pDZ6LQCqu9qT
	 Z7FMktO8m1f5A==
Received: from [192.168.1.100] (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits))
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 050B717E14EA;
	Tue,  3 Dec 2024 10:11:22 +0100 (CET)
Message-ID: <c87a8f9b-56fb-4b4d-9ba6-07f322faf061@collabora.com>
Date: Tue, 3 Dec 2024 10:11:22 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 6.1 1/2] Revert "arm64: dts: mediatek: mt8195-cherry: Mark
 USB 3.0 on xhci1 as disabled"
To: Chen-Yu Tsai <wenst@chromium.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Sasha Levin <sashal@kernel.org>
Cc: stable@vger.kernel.org, linux-kernel@vger.kernel.org,
 Matthias Brugger <matthias.bgg@gmail.com>, devicetree@vger.kernel.org,
 linux-mediatek@lists.infradead.org, Koichiro Den <koichiro.den@canonical.com>
References: <20241202081624.156285-1-wenst@chromium.org>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Content-Language: en-US
In-Reply-To: <20241202081624.156285-1-wenst@chromium.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241203_011125_179299_F7C503C7 
X-CRM114-Status: UNSURE (   7.46  )
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

Il 02/12/24 09:16, Chen-Yu Tsai ha scritto:
> This reverts commit edca00ad79aa1dfd1b88ace1df1e9dfa21a3026f.
> 
> The hunk was applied to the wrong device node when the commit was
> backported to the 6.1 stable branch.
> 
> Revert it to re-do the backport correctly.
> 
> Reported-by: Koichiro Den <koichiro.den@canonical.com>
> Closes: https://lore.kernel.org/stable/6itvivhxbjlpky5hn6x2hmc3kzz4regcvmsk226t6ippjad7yk@26xug5lrdqdw/
> Fixes: edca00ad79aa ("arm64: dts: mediatek: mt8195-cherry: Mark USB 3.0 on xhci1 as disabled")
> Signed-off-by: Chen-Yu Tsai <wenst@chromium.org>

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>



