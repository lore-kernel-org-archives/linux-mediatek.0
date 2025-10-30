Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B9CEFCCF9F5
	for <linux-mediatek@archiver.kernel.org>; Thu, 30 Oct 2025 09:23:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=DDBfL+Hy8f51AoDOTnXkzFSeoiQAJ4Mj3RmbnaS8qgs=; b=wXn5H/6cj+3CaIUJl72YpDELZn
	MolV7eC49dBtc/O3EmNuUOtv02y2fPoAinh+f/7UYFOXAWDKEv93Ty7QkjABNv07acstmtvrnSyI4
	qfoG2ipD9p5yIXZ4m0C3aQ841+Al9IkJSkGMP1MJOO/emJ5dHpAoR1kYZ6ByWsdonD5g5yKZa1Sim
	tXE7RVjANDSxhmwe8+HQMYCY7Yg5rwyNk1LHTFmG8z2ovOxxxz29zmqJUScTjE5J3pIQHSg9zX3WQ
	CcqdUfgDamkjzMu5230YSVjTFC6k1y8MlosSNHFNp80wN+YTnb//IVQW8JFYSOC2IEwa50wu4lCVn
	4yiIcJ2g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vEOsV-00000003qlv-3g01;
	Thu, 30 Oct 2025 09:23:31 +0000
Received: from bali.collaboradmins.com ([2a01:4f8:201:9162::2])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vEOsS-00000003qk5-23lv;
	Thu, 30 Oct 2025 09:23:29 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1761816206;
	bh=RuQBqrdtUqoyAIaOqRpMQ6P5/VwynqIJx+FW8eJmZrA=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=GJ6e9DSPVh7u+eTrjWEbA926QJ51gld8urEAHHONd9igGi+plgW0FEiLnp9BWR3ys
	 HrmkCNxZ2ZSS2bYNZB0fqG9b2KIclQJLKJVWGFGv0OQRp9lCT8H16PoMNiCCG+05+1
	 x2MY1iSms/1i6uE9gfhdqqB+OUgypAtUlXe2mptcKp2yWkdmlbkZRLYxmMv2sGJPCx
	 BIIq3sHAwXFDYltAr/vKDHQB00Pgully+qY4S3n4/lZcFC+KB3hdiwtvpBRyqp4KLc
	 JHmcFBOgVUc59ut7Y7p4fVDkupg0V9wPc2EiPns77jtxAj8qcZL277W6lmxuc9K3Io
	 IHsQvJwf5Q3cg==
Received: from [192.168.1.100] (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 4D83D17E13F9;
	Thu, 30 Oct 2025 10:23:26 +0100 (CET)
Message-ID: <a46ff728-63f3-46c5-8b6e-880c36c2d164@collabora.com>
Date: Thu, 30 Oct 2025 10:23:25 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] dt-bindings: spmi: spmi-mtk-pmif: Add compatible for
 MT8189 SoC
To: Louis-Alexis Eyraud <louisalexis.eyraud@collabora.com>,
 Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>,
 Hsin-Hsiung Wang <hsin-hsiung.wang@mediatek.com>
Cc: kernel@collabora.com, linux-kernel@vger.kernel.org,
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org
References: <20251029-mt8189-dt-bindings-spmi-v1-1-fbea12a4ed5e@collabora.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Content-Language: en-US
In-Reply-To: <20251029-mt8189-dt-bindings-spmi-v1-1-fbea12a4ed5e@collabora.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251030_022328_682248_4FBA78CA 
X-CRM114-Status: UNSURE (   7.43  )
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

Il 29/10/25 14:31, Louis-Alexis Eyraud ha scritto:
> Add compatible string for the SPMI block on MT8189 SoC, which is
> compatible with the one used on MT8195.
> 
> Signed-off-by: Louis-Alexis Eyraud <louisalexis.eyraud@collabora.com>

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>



