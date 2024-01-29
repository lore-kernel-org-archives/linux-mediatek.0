Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BD5E8C47422
	for <linux-mediatek@archiver.kernel.org>; Mon, 29 Jan 2024 10:42:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=c0203NWogp6DToiFFQcJe4lJaJJOT9gd3m8hbfvPj7U=; b=UQm9/Ou/uSKkGHlbgikvBGg/B1
	GZPahaWzq4+kwXPO4diuSF5P1Z+WFymbcBB77Nljur02Urd2Fx9vhkIFWYr2s4n6/1fkZP1Oxkr79
	WsNMkRwzjWN1lD+PzxRzgm67S7zuoCeq6acTJ/ThBEudC31aDL0UpoDMZLXx81J3KENriNFTsa56Z
	SAQ8KGcBs6tXhH9f320jw/duJQkhDiUQs6ng9BQp7zuYyrTh1T1T9wcwHzVlDVlRavU90WWNsE1PU
	tdGPZIhHYHbzOqxE0wDHgCwfCYetTFLklVISyp+6sxoKK+wcZ9gwrLQ0VfazS/125af3PXfv5uJYi
	NrTAgpEg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rUP60-0000000CGa3-0ji9;
	Mon, 29 Jan 2024 10:42:32 +0000
Received: from madrid.collaboradmins.com ([46.235.227.194])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rUP5S-0000000CGCy-2cXG;
	Mon, 29 Jan 2024 10:42:00 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1706524917;
	bh=GyZE3tofuMTrXIfTvVfxNMaOpNxg3EU4yJp5f+lxPTY=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=Jv5qG8SSaQFqQ2xSK0SXYTy6LVvVgsPfp6OIEzPpRkTIwTOs4/dNOvgDgUNl+M9B+
	 bStNDVlaqmSOXAFt1z7OqW1e/Dv3c3INqiYXOVULXx0DTmflMRCGWP3IRrYI4gl8og
	 lbbVjUpSjsuyTAU4oRh9ub4QeXorFIY/7vbpxJfG/G6u7H6P4i5ci15ytnBfqg7uwD
	 CEphDztKKpK6Ws0A5rRiLjiR5hzuZjOcyu2iiqlv50zVhDa1Y996Os5kFOEyuslt9M
	 pvK5bQou7QRpVwAWMfaiz0279Tl1W1u7FqrdjZIbaYifyeKlWtCYwGxHOJx7tDmB+k
	 gKM901lqZbiLQ==
Received: from IcarusMOD.eternityproject.eu (cola.collaboradmins.com [195.201.22.229])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by madrid.collaboradmins.com (Postfix) with ESMTPSA id 7440C3780C1F;
	Mon, 29 Jan 2024 10:41:56 +0000 (UTC)
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
To: tiffany.lin@mediatek.com,
	andrew-ct.chen@mediatek.com,
	matthias.bgg@gmail.com,
	linux-mediatek@lists.infradead.org,
	Eugen Hristev <eugen.hristev@collabora.com>,
	linux-media@vger.kernel.org,
	devicetree@vger.kernel.org,
	bin.liu@mediatek.com
Cc: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	robh+dt@kernel.org,
	kernel@collabora.com
Subject: Re: [PATCH v3 1/2] dt-bindings: media: mediatek-jpeg-encoder: change max iommus count
Date: Mon, 29 Jan 2024 11:41:43 +0100
Message-ID: <170652472373.127352.5854831299483160743.b4-ty@collabora.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240127084258.68302-1-eugen.hristev@collabora.com>
References: <20240127084258.68302-1-eugen.hristev@collabora.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240129_024158_908964_37C82BF2 
X-CRM114-Status: UNSURE (   7.34  )
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


On Sat, 27 Jan 2024 10:42:57 +0200, Eugen Hristev wrote:
> MT8186 has 4 iommus in the list, to cope with this situation, adjust
> the maxItems to 4 (instead of previous 2).
> Add also minItems as 2 to keep compatibility with current devices.
> 
> 

Applied to v6.4-next/dts64, thanks!

[1/2] dt-bindings: media: mediatek-jpeg-encoder: change max iommus count
      commit: b824b32dd5e98221cbe2e8bcccc6fb4134e35fc1
[2/2] arm64: dts: mediatek: mt8186: Add jpgenc node
      commit: 4c5b46fbf52d52b0f392f0fc3913560bad438e49

Best regards,
-- 
AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>

