Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9EFFCC4332F
	for <linux-mediatek@archiver.kernel.org>; Tue, 12 Dec 2023 16:36:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Subject:Cc:From:
	To:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=xQM8Ci95br6UpZv6S/P/yPue9VcluKR7oR4GJe65I2k=; b=QepIIUpGB7Y6Ia7cjt4sam2TYW
	eAgqOpibE2ZXrVeIz3+wxHCFQ9rR26bkOVmeDweJLZD94GXapRCOwjm3CBrjxc/a32jtgwAm4pI4a
	vUpw+chCElkJLe+wRbeDuS6ldxwd4LXuH0pryh99cfl/Q+MZaOJ5RdCW5L5alkvOeMYannk9Xz1Lw
	847C24YE3YYHsW640N9sMBlFLC+Yzj1SpZ1AfU9NminVWyDq+SjNaRZIMGsKtYSB8YJ2nNW6RsGI/
	iL2na7vp4O2D0vzCxGaq3m42r8oixQamJUE7fkP+SEiXULxit/S5V/A5SSQ9aQrJzH7/1cp4po44g
	RGqYmXNw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rD5kb-00CFEm-1r;
	Tue, 12 Dec 2023 16:36:53 +0000
Received: from mail-4323.proton.ch ([185.70.43.23])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rD5kX-00CFC7-37
	for linux-mediatek@lists.infradead.org;
	Tue, 12 Dec 2023 16:36:52 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=emersion.fr;
	s=protonmail2; t=1702399004; x=1702658204;
	bh=xQM8Ci95br6UpZv6S/P/yPue9VcluKR7oR4GJe65I2k=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 Feedback-ID:From:To:Cc:Date:Subject:Reply-To:Feedback-ID:
	 Message-ID:BIMI-Selector;
	b=WsFtlMCDeErknnMmjq7MhuKXRdxIawCITzMkIK57U3gE2v39FzMn8u71o5f5OkEfP
	 BamfL6xfBjZHQM93MI4ViqRfDLuiA3YOk6oWMkYJ9/3GWX8RrRXH1Rs52gQuitseqZ
	 iT6q2AeS2MWMcfIOlQ6Pc0u5q47GRX4FUQeavG3+6C3E5sfi0sJF90EVA579039vhG
	 mg0LHb3jsUhwyqMrpkX9nxJq2xpviqfQ6wgxVell+MNGEN01K7UhrGwlB85L4DjzmY
	 FVpFmmfVSrSkQNYiYHSTTmGBYQT5PMmfYeKneXZkivzzxkQ8AHg2kJoVHSj4oLv4tQ
	 Rlj2PK7xD4Gzw==
Date: Tue, 12 Dec 2023 16:36:35 +0000
To: Yong Wu <yong.wu@mediatek.com>
From: Simon Ser <contact@emersion.fr>
Cc: Rob Herring <robh+dt@kernel.org>, Sumit Semwal <sumit.semwal@linaro.org>, christian.koenig@amd.com, Matthias Brugger <matthias.bgg@gmail.com>, dri-devel@lists.freedesktop.org, John Stultz <jstultz@google.com>, Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Jeffrey Kardatzke <jkardatzke@google.com>, Benjamin Gaignard <benjamin.gaignard@collabora.com>, Vijayanand Jitta <quic_vjitta@quicinc.com>, Nicolas Dufresne <nicolas@ndufresne.ca>, jianjiao.zeng@mediatek.com, linux-media@vger.kernel.org, devicetree@vger.kernel.org, Conor Dooley <conor+dt@kernel.org>, ckoenig.leichtzumerken@gmail.com, linaro-mm-sig@lists.linaro.org, linux-mediatek@lists.infradead.org, Joakim Bech <joakim.bech@linaro.org>, tjmercier@google.com, linux-arm-kernel@lists.infradead.org, AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, kuohong.wang@mediatek.com, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 0/7] dma-buf: heaps: Add secure heap
Message-ID: <DPBmATfmfvSP8Cwjz99kj_JvCEiAqRfuMFJZEBF2aIgl8NZqWFR66eyPTX1E8bHyOlimBihEE3E80p9bfOJ-0SNu8pwoIzL9gD2Xae6r97g=@emersion.fr>
In-Reply-To: <20231212024607.3681-1-yong.wu@mediatek.com>
References: <20231212024607.3681-1-yong.wu@mediatek.com>
Feedback-ID: 1358184:user:proton
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231212_083651_343995_4B514E45 
X-CRM114-Status: UNSURE (   4.66  )
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

Is there a chance to pick a better name than "secure" here?

"Secure" is super overloaded, it's not clear at all what it means from
just the name. Something like "restricted" would be an improvement.

