Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 24014C4167D
	for <linux-mediatek@archiver.kernel.org>; Thu,  9 Nov 2023 11:42:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ieKWV4LeUpNd3aNfMR6jkkLmDfzpIzHAWaTQGBd3/5c=; b=LBE+JjLf2BpNALPxrSUORSkPrl
	BLwCfYpZalTCmY1BPe71BRoEippVvnUYKSsUWp4nIgtY3oX50nFiqd2GIZqidVh7/Jd4GmVFzEAWe
	8TSIdDhnQkI6hZBxPgQ7Th3guPGCxPiPlcYRtyKQCvnX4G4i/kHyD7EQ2lrk7oaQzGfo5lYiOtBFO
	bjSA/4If+W/NlcZ1DQx74BXOL54b9ok/P4og1voqD+8HP9ZXx+YbwEKbddjukDQA0Jm0C1NzxzOWb
	HmPxeJEpy2hGaQ4zIjFDu73ndLtG8TRlEL5mZtEv4rCUXB7n2Z1OxCIBUgkw5wLd/oipsDIv0SvRU
	RbCV45nw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1r13Qw-0066gS-3B;
	Thu, 09 Nov 2023 11:42:50 +0000
Received: from madras.collabora.co.uk ([2a00:1098:0:82:1000:25:2eeb:e5ab])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1r13Qq-0066cQ-0k;
	Thu, 09 Nov 2023 11:42:45 +0000
Received: from [100.107.97.3] (cola.collaboradmins.com [195.201.22.229])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id A21026607498;
	Thu,  9 Nov 2023 11:42:41 +0000 (GMT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1699530162;
	bh=r8ruF9YN0L4bEEkLdhc4a/eZmk8kyZoR/y8lsZMRFMw=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=GO6ismQD+TCUhDDFoIEGl9sJWRQIIqppa+4/l6Cr1nA8E08ebnKUsYU4prI0B9lSE
	 c5bwa2Q3LNiSKTyV6+SE0JJUAJ5j6g+LTopIFFAS0xQPBSIVeFK58pnoyInhxdBnEJ
	 aKOaCAntUf9iRwrVYTkiIRouSXO0RY+ukcRmhggGB7vd86fmpoJ8nMkx/UsQ9TL73S
	 oPr5JXNDvhgEG8mGyIY47KZomwo3w/4/ZbKwx+Gbdy5LBk03xTll9Y9yQ19r16qoY7
	 Nfi5lKLYQrrZCzvk4pD5jq/++GQnBOQgrHIi5zfuHdK68QoJ7JGfxxzrtM6ruYH3Nb
	 s7tyZJebzfkFw==
Message-ID: <da47a3bc-3170-471a-acae-6c73e236b2c2@collabora.com>
Date: Thu, 9 Nov 2023 12:42:39 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RESEND 2/3] dt-bindings: clock: mediatek: Remove compatible for
 MT8188 VPPSYS
Content-Language: en-US
To: "yu-chang.lee" <yu-chang.lee@mediatek.com>,
 Rob Herring <robh+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>,
 Michael Turquette <mturquette@baylibre.com>, Stephen Boyd
 <sboyd@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>
Cc: "Nancy . Lin" <nancy.lin@mediatek.com>, Nathan Lu
 <nathan.lu@mediatek.com>, Moudy Ho <moudy.ho@mediatek.com>,
 "Jason-JH . Lin" <jason-jh.lin@mediatek.com>,
 Garmin Chang <garmin.chang@mediatek.com>, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org
References: <20231109111122.371-1-yu-chang.lee@mediatek.com>
 <20231109111122.371-3-yu-chang.lee@mediatek.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
In-Reply-To: <20231109111122.371-3-yu-chang.lee@mediatek.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231109_034244_398940_087BEF48 
X-CRM114-Status: UNSURE (   4.43  )
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

Il 09/11/23 12:11, yu-chang.lee ha scritto:
> Remove VPPSYS0, VPPSYS1 compatible on Mediatek MT8188.
> 
> Signed-off-by: yu-chang.lee <yu-chang.lee@mediatek.com>

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>



