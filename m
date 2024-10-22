Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2B8F8D1CDC8
	for <linux-mediatek@archiver.kernel.org>; Tue, 22 Oct 2024 09:19:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Date:Message-Id:Subject:References:In-Reply-To:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=oYE7u2NNMhizaVu4uj0xF1gP32vqIhz69DY3rZXnlDA=; b=iDEceskNcNioHQ7BPznF6CykI0
	lLiG3D41SEGAgebFsu/Rdofg0Yy/UDShoe4NvQLo3iZgGzy2Fu6fLgpzEUiEPP2X/b3HaL4dG2dZt
	rkvEwnmzEsrwaXie3ix0wjbgcW3HAIVFx6hEL9ZpACPWQlGfz3UJL1NQqnud3x7Mw9JXF+V5faGHe
	FwGRicMH3rG3HMJ+rUID4Vm3umeVElgRdiv95tWn3JSiFheSNY3OBm+xoAcjy7wmPnEYPuVH0G2xj
	BkX3vahZu5ffFP1Zf5mZXEUSvu7ISgRDAS3Elmuu9EB7tTxrwgLHVSciL969P9urXXVT6cR1LinzK
	MlHedqYQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t3B2i-0000000AKDH-2oHM;
	Tue, 22 Oct 2024 09:19:08 +0000
Received: from bali.collaboradmins.com ([2a01:4f8:201:9162::2])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t3Azt-0000000AIx5-1zkj;
	Tue, 22 Oct 2024 09:16:16 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1729588571;
	bh=Nx4K4qHhijgkkN36huYLT2ycTLY7lXkDiYfysKifHAg=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=SO8kGZtPX+MyHyxdiQqp0nQPXAE17o02MF1xL8Vf3WOvCHf1rRS8SjtKDsuHkSe2k
	 7O9JO4WPXAdy1WnX6VqU71/EehHrUJkZvaa4HDwB8g4CzpHALAwy3TQYw8zZCwnu44
	 QevXoLw2UzyktMYd/xn0mJG1S8fWzd/rS1z6GZjuXxIvOrt04h8Jh7jJncb/ZA6Ci2
	 cel7ctySV33J/PXAtZVBAWaFVDItIZfecJAwEyMenhqddqLpjUsx63SngpTktC2nXU
	 hlofxSohgPqN1/HkOzJYMNe2MvkjPhAJZLMG1oWwAj7R9tTGC8m+0fPAiE4Wf7MznI
	 keRmUz8HDpJgA==
Received: from IcarusMOD.eternityproject.eu (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 8CEF317E137D;
	Tue, 22 Oct 2024 11:16:11 +0200 (CEST)
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
To: Matthias Brugger <matthias.bgg@gmail.com>, 
 Fei Shao <fshao@chromium.org>
Cc: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-kernel@vger.kernel.org, linux-mediatek@lists.infradead.org
In-Reply-To: <20241021081311.543625-1-fshao@chromium.org>
References: <20241021081311.543625-1-fshao@chromium.org>
Subject: Re: [PATCH] arm64: dts: mediatek: mt8188: Fix USB3 PHY port
 default status
Message-Id: <172958857153.72613.8539161640798181554.b4-ty@collabora.com>
Date: Tue, 22 Oct 2024 11:16:11 +0200
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.14.2
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241022_021613_785108_58B52FCC 
X-CRM114-Status: UNSURE (   9.36  )
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

On Mon, 21 Oct 2024 16:10:47 +0800, Fei Shao wrote:
> The T-PHY controller at 0x11e40000 controls two underlying USB2 and USB3
> PHY ports. The USB3 port works normally just like the others, so there's
> no point in disabling it separately. Otherwise, board DTs would have to
> enable both the T-PHY controller and one of its sub-nodes in particular,
> which is slightly redundant and confusing.
> 
> Remove the status line in the u3port1 node, so it's ready to be used
> once the T-PHY controller is enabled.
> 
> [...]

Applied to v6.12-next/dts64, thanks!

[1/1] arm64: dts: mediatek: mt8188: Fix USB3 PHY port default status
      commit: 6bb64877a41561bc78e0f4e9e04d524a0155d6aa

Cheers,
Angelo



