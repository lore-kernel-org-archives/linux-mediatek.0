Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 98E62D1CDC7
	for <linux-mediatek@archiver.kernel.org>; Tue, 22 Oct 2024 09:18:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Date:Message-Id:Subject:References:In-Reply-To:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=V/i9UNKzeNlJvAobgPCyINeJt6Eg4b1cJLzbszZhyTc=; b=peR+Db7cJh5xSER/9DmBCHBEE9
	IRbg7uNZFMRm3nXadOBRqmA4YRHA6bwkqg0XSqXesVxU3ifgeK8PrQ3VleVrDCCNqK+XcuAHrTMnv
	yu4tnHUfFi0fKiLRrsTD07Cx4h/iVDzShbNEwQnUIVTDXG8gEvqOz4M65rDaNrmasFpN0/CGbocql
	BOlRweef0cR9gPtjy5Xu3HQhpCImQ4fcMpFju7i0C5/lsuWzCxRjk5G8juEIvBEihy1h7ZoVFTnWL
	sfS5UWzBvYlbMmgexVyFm2ByyZucVFPJM9hAOdm5rzksooSny3oyASlJkHdeSyv5blUBgYrbdNPeg
	/m4rH/Zw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t3B2Y-0000000AK6u-16zV;
	Tue, 22 Oct 2024 09:18:58 +0000
Received: from bali.collaboradmins.com ([148.251.105.195])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t3Azt-0000000AIx1-0Gl7;
	Tue, 22 Oct 2024 09:16:15 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1729588571;
	bh=8I1J+Ow2u6TaDaq3YClWuoQ4+wuldxjkbbLHsfWOIOI=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=fsd1JyMo0inTZbf/lAH97EXxZxpTJpitc/x4HavJUZTAt1HnAYyIxAH6Pdrn44LtR
	 k4/QyQTR/zMkyxJlVEAkUIjqV+9QB2ERlN3LL+jmdTdTpGP19b52qLLqoORYUuLW3K
	 mnEW3XoE6VBXH8f/6JHhxUwb5ZGa9q7Xk88va/rnA1m1FGK+ImaoH9HwvfghHEQ5rs
	 0chn5pnDUPipDSqfKm0S0hEoouCsKCB5pbQsS4y0Gr7yn3lV5q6W1rT/2ZV5MkKrPc
	 4rK4ofl+M3uWt3/bXHEpDGk+gtmAPN0CIAjepx0h1Mrl7jhTj9xi43rL7DWqU7MPmX
	 xtaulbxExcGGg==
Received: from IcarusMOD.eternityproject.eu (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 2CD8217E12D6;
	Tue, 22 Oct 2024 11:16:11 +0200 (CEST)
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
To: Matthias Brugger <matthias.bgg@gmail.com>, 
 Chen-Yu Tsai <wenst@chromium.org>
Cc: devicetree@vger.kernel.org, linux-mediatek@lists.infradead.org, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
In-Reply-To: <20241018082001.1296963-1-wenst@chromium.org>
References: <20241018082001.1296963-1-wenst@chromium.org>
Subject: Re: [PATCH v2] arm64: dts: mediatek: mt8173-elm-hana: Add
 vdd-supply to second source trackpad
Message-Id: <172958857114.72613.13256249212455678116.b4-ty@collabora.com>
Date: Tue, 22 Oct 2024 11:16:11 +0200
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.14.2
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241022_021613_282700_372FFE30 
X-CRM114-Status: UNSURE (   9.82  )
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

On Fri, 18 Oct 2024 16:20:00 +0800, Chen-Yu Tsai wrote:
> The Hana device has a second source option trackpad, but it is missing
> its regulator supply. It only works because the regulator is marked as
> always-on.
> 
> Add the regulator supply, but leave out the post-power-on delay. Instead,
> document the post-power-on delay along with the reason for not adding
> it in a comment.
> 
> [...]

Applied to v6.12-next/dts64, thanks!

[1/1] arm64: dts: mediatek: mt8173-elm-hana: Add vdd-supply to second source trackpad
      commit: f766fae08f6a2eaeb45d8d2c053724c91526835c

Cheers,
Angelo



