Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ACD1FCAC5A7
	for <linux-mediatek@archiver.kernel.org>; Wed, 24 Sep 2025 08:35:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:Resent-From
	:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=vkXPcN1pvEAb0sHlkdYoW4OmV5Q1t8n1b1FfYPFRxoE=; b=bcrgXsMkIFjIJABAa8ONyo7rzv
	l/S8xpW/bDcpKAqcup0NB5lUHnHj1Ok7AVOxaO6AKa14edcrobbJfNTyhCPNFW37qo6zulz5N/KQ1
	68eU8wh+bv+KHHM5Wfn16APq0HW66ysc1gF/kLsIcc50t7QVn1jJmFjLHOlakYU4OvfDGYjXaJVhn
	xBPecPVjbpi2I61iWU2kEqvCl/JK/1nkHchtzkuPM1kBPXhrR4wFCq/Imqxky0W5bWG5Aetz4O2s4
	/08dDcDbIkRY2HZYvl340xj35HRWc+W76t7mH36CkWhm0annR91ar2GS/pvY1xynrSoD7tDGR0dtd
	Rup5NHcw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v1Kxr-0000000Ftaj-258j;
	Wed, 24 Sep 2025 08:35:03 +0000
Received: from bali.collaboradmins.com ([148.251.105.195])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v1Kxf-0000000FtQW-0Har;
	Wed, 24 Sep 2025 08:34:52 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1758702888;
	bh=NQpn5On1CpZYeSoKNe+8hbK1OW/Ka5jHDW6U1lstCec=;
	h=Date:Subject:To:References:From:In-Reply-To:From;
	b=cZiP2itXfdkJ6bbHkHMc2AZFZnMBN6qhCADI9XHKsDoH5Z3UxvU6pg5TTTvCd4QRV
	 hOQgX+AhF/IqbVDwCzcOROKW0HRKTgmzmHvPIAVItTLVm74ghMKsSzxLwQYsRwETbZ
	 iYn9P5sjyEpUq1c61LYGKYlNNHlxfdW64Dcgc+ELgLiws4ZjkA8xnUZeS2RJYglPf5
	 mo3wei2LNmW5X4+Zhlx3kSrG+t0IAD4flPr/gKEs2QyqCAfyLLex8r9fS8GHywc53Z
	 +bY9qM9I1OyLO/eHrBWHMYMR2Wv5dboev/iZwmtHu8dnP8J6sV6aDrYfufNsv6GFE5
	 7uzks4ph2dvEQ==
Received: from [192.168.1.100] (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 32A5A17E0C21;
	Wed, 24 Sep 2025 10:34:48 +0200 (CEST)
Message-ID: <b520c02c-f405-4310-92b7-7301f9f29e28@collabora.com>
Date: Wed, 24 Sep 2025 10:34:47 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/2] dt-bindings: arm64: dts: airoha: Add AN7583
 compatible
To: Christian Marangi <ansuelsmth@gmail.com>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>,
 Felix Fietkau <nbd@nbd.name>, John Crispin <john@phrozen.org>,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org
References: <20250923185340.21526-1-ansuelsmth@gmail.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Content-Language: en-US
In-Reply-To: <20250923185340.21526-1-ansuelsmth@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250924_013451_285003_C1DDD941 
X-CRM114-Status: UNSURE (   6.46  )
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

Il 23/09/25 20:53, Christian Marangi ha scritto:
> Add Airoha AN7583 compatible to the list of enum for Airoha Supported
> SoCs.
> 
> Signed-off-by: Christian Marangi <ansuelsmth@gmail.com>

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>



