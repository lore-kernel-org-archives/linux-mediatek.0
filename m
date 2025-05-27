Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 87B71C54F30
	for <linux-mediatek@archiver.kernel.org>; Tue, 27 May 2025 19:33:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Type:MIME-Version:References:Message-ID:Subject:To:From:Date:Reply-To
	:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Z3GFQ2em3qr/+lpcMUswENE9r+bXLAP8Uq3SyEwOvtc=; b=K7iiKWyuMHqCHPTG2TwuCSFiPF
	jl/sEwGjakJ254X4j8SOI560W7ukc2J8k6w95+cCG4JMeSE2+o4e74FjVAlUjdRpiByRyR54CBDju
	wZkn57bBwCjU6RBfXaMp1qq5urTP5xc+f6PwaHrNcTzEnwNq6SQiqs8bxtPEXtcnsH+QR+S23RCKG
	A+avh0HxyQOnLpmQq0KcJnA7u66R+Hv2DlsbmHf/HZ+xJw7oOn/leyqKGBAn01SQrAejArd6XRuM+
	v5sbsiHhQ0quu9bLafqbw3lmH6cSS3jjN9xAkS2aW1spggcc0oG71lk1FaHfiZNGFMGTr4/9iASOU
	pTEpfZiA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uK02x-0000000BRI8-1aPw;
	Tue, 27 May 2025 19:33:11 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uJzyM-0000000BQdo-2HcE;
	Tue, 27 May 2025 19:28:27 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 29AB14A639;
	Tue, 27 May 2025 19:28:26 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C6EB3C4CEE9;
	Tue, 27 May 2025 19:28:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1748374106;
	bh=ZcppwkkBkGHzfL/HojYzLOl4RCeHBYYQUV63DqSRucM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=C18Q4wxAIMAZ+UbWrE1lFvCpoZhpt/PBhWqEwgXbut9htZnxVTyZ4DBPOvmqZ6YNQ
	 lJJ55e7ZRfL/bKDdOK4pOlYBu4SyQktp7wfoCYBdTYeQfUz3ogXafmvGCaT3662unh
	 495cJTJLzsiFQ3oAnLez/2yCuqs2WN6gMWfJNLcE0mtBhFv8pd1GwL5/Dk6+dvoVs5
	 JsvzkbFFzmk3HyeCtRK4HGry4Y8HX1IfiJtazdMxhSsuLe2UU4X9eeB8PRs02okcwG
	 SmXCzdZ9yluDgM9b/BU73hkMHJuoSmWGN6Qo0FhwytFRi8d1kEsev0ZUQU75NQdUx5
	 AH6eL3zDyhaag==
Date: Tue, 27 May 2025 14:28:24 -0500
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Frank Wunderlich <linux@fw-web.de>
Subject: Re: [PATCH v2 01/14] dt-bindings: net: mediatek,net: update for
 mt7988
Message-ID: <174837410385.1090056.12670391327460010323.robh@kernel.org>
References: <20250516180147.10416-1-linux@fw-web.de>
 <20250516180147.10416-2-linux@fw-web.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250516180147.10416-2-linux@fw-web.de>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250527_122826_615642_C240BA9B 
X-CRM114-Status: GOOD (  10.79  )
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
Cc: Andrew Lunn <andrew@lunn.ch>, Landen Chao <Landen.Chao@mediatek.com>, linux-kernel@vger.kernel.org, Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, Lorenzo Bianconi <lorenzo@kernel.org>, devicetree@vger.kernel.org, Conor Dooley <conor+dt@kernel.org>, Sean Wang <sean.wang@mediatek.com>, DENG Qingfang <dqfext@gmail.com>, linux-mediatek@lists.infradead.org, Matthias Brugger <matthias.bgg@gmail.com>, linux-arm-kernel@lists.infradead.org, AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, =?utf-8?B?QXLEsW7DpyDDnE5BTA==?= <arinc.unal@arinc9.com>, netdev@vger.kernel.org, Daniel Golle <daniel@makrotopia.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Vladimir Oltean <olteanv@gmail.com>, "David S. Miller" <davem@davemloft.net>, Felix Fietkau <nbd@nbd.name>
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org


On Fri, 16 May 2025 20:01:31 +0200, Frank Wunderlich wrote:
> From: Frank Wunderlich <frank-w@public-files.de>
> 
> Update binding for mt7988 which has 3 gmac and 2 reg items.
> 
> Signed-off-by: Frank Wunderlich <frank-w@public-files.de>
> ---
> v2:
> - change reg to list of items
> ---
>  .../devicetree/bindings/net/mediatek,net.yaml          | 10 ++++++++--
>  1 file changed, 8 insertions(+), 2 deletions(-)
> 

Reviewed-by: Rob Herring (Arm) <robh@kernel.org>


