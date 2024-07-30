Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 74AE5C3DA61
	for <linux-mediatek@archiver.kernel.org>; Tue, 30 Jul 2024 09:47:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Date:Message-Id:Subject:References:In-Reply-To:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=sQ5z49mnuFEv0ve0JKLjaswGx2MD29cn1wgFPMG71ls=; b=fdiFgulqsfR4aVhB3K7kwSP8xq
	M66PWamvwlHISKW4j/MS5uPKjHcf89f7ROjWwymBdizkU5k3/9Q4oRJy10GDOZramSsAG3VO/zJuo
	NexrB08WvR9M1SWD+2DgKmuLaCVBApb/YQxYHgv7mk1AaH62CFIA262bRVYeftNR0ZoeEEwEfNq4x
	7kgd8pSY0c8Zhr7Qf0DqSe7b50y4o89F9i9s2Y+ATVWRZ9TWIcN73sG0dKXHfjPtslBMRkWg9acei
	YBO9JYLJocNAd+lMkDRsCpiZZuGkY/pCLMIcsNyFrXQkEmqXH6cr0y6n4cb2QoZWPJHc9cBurvRH1
	ZWPXCH1A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sYjSZ-0000000EbF9-0Y0M;
	Tue, 30 Jul 2024 09:47:59 +0000
Received: from madrid.collaboradmins.com ([46.235.227.194])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sYjS6-0000000Eb8N-3WEu;
	Tue, 30 Jul 2024 09:47:32 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1722332849;
	bh=DED+NOuoNWUw+7V5AqaAhT37gqGBt+JeGB6mkgfB8U8=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=1aDTlIf1g4/q6x4Oed+fRyFaQKanU0Xt93hazYLZXAcRvCdsCMgem/q640/vPvATM
	 rN2KjguWnYYDlHqC7TLOLffcsWateYkqtprpXlTWU7iO2n56A8hXPqthgTXF98JolB
	 fg/qQLSMagyrl9yfUH14gJDt97yCvIrz+iS8x2Eg/fftBoGT3P7qbum1p582zZbzHy
	 5+mh3is2ILQWdtrWOtQNS5xNwKVaRBR7t4omIhMxIW4TPG9Vz22216cKGY2YJqbEjj
	 5Q3SfLeHSYe265wY5H/znQSaaQCJy9W0YXOLFCvHCyxRSnNSH9WAGW8tHa4iHpvM2n
	 G/1BRedgBnerQ==
Received: from IcarusMOD.eternityproject.eu (cola.collaboradmins.com [195.201.22.229])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by madrid.collaboradmins.com (Postfix) with ESMTPSA id B50D637821ED;
	Tue, 30 Jul 2024 09:47:28 +0000 (UTC)
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
To: Matthias Brugger <matthias.bgg@gmail.com>, 
 Chen-Yu Tsai <wenst@chromium.org>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, devicetree@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, 
 linux-kernel@vger.kernel.org
In-Reply-To: <20240625095705.3474713-1-wenst@chromium.org>
References: <20240625095705.3474713-1-wenst@chromium.org>
Subject: Re: [PATCH] arm64: dts: mediatek: mt8183-kukui-jacuzzi: Simplify
 DSI endpoint replacement
Message-Id: <172233284865.78062.3102616199099045616.b4-ty@collabora.com>
Date: Tue, 30 Jul 2024 11:47:28 +0200
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.13.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240730_024731_046619_C058779D 
X-CRM114-Status: UNSURE (   9.29  )
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

On Tue, 25 Jun 2024 17:57:04 +0800, Chen-Yu Tsai wrote:
> Currently the Jacuzzi dtsi file redeclares the full DSI endpoint tree
> from the DSI controller just to replace the remote endpoint. This is
> not necessary since the local endpoint already has a label that can be
> referenced. This will also confusion when the inherited layout is
> changed.
> 
> Replace the redeclared DSI endpoint tree with a label reference.
> 
> [...]

Applied to v6.11-next/dts64, thanks!

[1/1] arm64: dts: mediatek: mt8183-kukui-jacuzzi: Simplify DSI endpoint replacement
      commit: 98ef7cef1b3a5d73b5023c8661534768810dd941

Cheers,
Angelo



