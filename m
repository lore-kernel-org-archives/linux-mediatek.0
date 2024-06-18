Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B8CF7C27C4F
	for <linux-mediatek@archiver.kernel.org>; Tue, 18 Jun 2024 12:23:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Date:Message-Id:Subject:References:In-Reply-To:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=izFUUMAjD6j6o/tA7co7skUBTE4TJ0jcLsgKVOCSfD8=; b=gBeEfla90s2tE7ziV4/zwJqtdf
	1Pxw8OaXEC11IQ+/1jfUpHSlaL2MgOLhbmVAcvu0jlguo79RKm/JvO3BqKcPgaxcPmVg3Hi5Bzr5M
	yU1WZ6sY7f1N1f9wrmdtF2BTXKM9lpiNZks7TJJvwal6uw/tE+hVXusxFzBt1s6kevJs5ZT3hjVlz
	WGb7xUK80N32yIUYp8lvL/olE6ttHE4ffdO10tU3j0Hqo72QfyxThALIqtoTvH50Rgp6tvdR/32d+
	z0/Am4+7LnCSvKoGqtNjtV+ZyVU5sX7F8tnDen3UOWg+ShZo7/N65bNhvS0lVYOykAjpfihm/AL7K
	P6KrNNwQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sJXrw-0000000ErV1-0ZpI;
	Tue, 18 Jun 2024 12:23:24 +0000
Received: from madrid.collaboradmins.com ([46.235.227.194])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sJXro-0000000ErRb-27Vl;
	Tue, 18 Jun 2024 12:23:18 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1718713394;
	bh=sDNNMxHKly7zct6ZWmT2pOfsBogVmKdEYEa+jqhZDsM=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=LkPMKPiFHomCePvAx5JBn8CLyrLA7r0lAmXDi2iS8RF5He7N8yfqAFzuiiOZXAQEh
	 UbMejr7mdgO6TPIuwV/mQjBLr/9Ez07BLH3in8TbV3ZyXTuPtIoohRq5bRLa8XF2rM
	 nTYUPUs6HoRZ16QiDoOr9DE38UTVQ2H7ZqadAw4rohgYDCDuxWY7u1oEqpxCoZaG48
	 //suJowzjz9mU0nukHVZSFaaVo+6Y7khz+fH7qi7c/DOP1z3QCJ7qDbhEPqoEA1Cb6
	 Dlb0M9Zye08f+CLe/BMQ7rVUQlMD1nj2nLxVTQ6X8dnU81wucNDObONNuD9NTJrcgl
	 SxgmR0CExI6jg==
Received: from IcarusMOD.eternityproject.eu (cola.collaboradmins.com [195.201.22.229])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by madrid.collaboradmins.com (Postfix) with ESMTPSA id 06F3D3780BDB;
	Tue, 18 Jun 2024 12:23:13 +0000 (UTC)
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Matthias Brugger <matthias.bgg@gmail.com>, Heiko Stuebner <heiko@sntech.de>, 
 Hsin-Te Yuan <yuanhsinte@chromium.org>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, 
 linux-rockchip@lists.infradead.org
In-Reply-To: <20240613-jack-rate-v2-0-ebc5f9f37931@chromium.org>
References: <20240613-jack-rate-v2-0-ebc5f9f37931@chromium.org>
Subject: Re: (subset) [PATCH v2 0/2] arm64: dts: Fix the value of
 `dlg,jack-det-rate` mismatch
Message-Id: <171871339394.163370.9266867043922843876.b4-ty@collabora.com>
Date: Tue, 18 Jun 2024 14:23:13 +0200
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.13.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240618_052316_708743_BA221575 
X-CRM114-Status: UNSURE (   6.66  )
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

On Thu, 13 Jun 2024 11:58:53 +0000, Hsin-Te Yuan wrote:
> According to Documentation/devicetree/bindings/sound/dialog,da7219.yaml,
> the value of `dlg,jack-det-rate` property should be like "32_64" instead
> of "32ms_64ms".
> 
> 

Applied to v6.10-next/dts64, thanks!

[1/2] arm64: dts: mediatek: mt8183-kukui: Fix the value of `dlg,jack-det-rate` mismatch
      commit: 1b0c5a724d726e533ead9580de696bb705dd2e4e

Cheers,
Angelo



