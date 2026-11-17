Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 29937606A897
	for <linux-mediatek@archiver.kernel.org>; Tue, 17 Nov 2026 14:32:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=15nzGx0t;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.a=rsa-sha256 header.s=mail header.b=XZFomuKM
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=qD+tzylpE2ufLWvEITjSReEtXMBKjPc7yP4ypKilhew=; b=15nzGx0t9dvkZQ
	GVLckHl5chAGdccjujAMsp/sf+NIuPmyi17Egeqi12YjGi6j+Sffa+XMRRZR3NkOu4ujRFz/pCEaT
	sejg5D7sYn1+lwg+JvJhi5i2ZdK4+kLf+iLJWN/WVIZZ7TaE2041zBHsz3IcljaZzhSHOT1Osnr/X
	89WWpnoFKjzPyzF03RMrehOS0stz3T0+fpS8/tXQ0F8zPVMA/3IYmG8hNo2R+/Jz6ZSLBQw/TpAhK
	KNkHq3bUCGS1ktmy14NFt5oL6vJ/h1cik8/QIbpTVZwC/wyZkvLluyp1cejhscLkWGFEb772k89ev
	PoS0s1DciVSh4Su6Al2Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xTKEx-000000069Ez-3h1n;
	Tue, 17 Nov 2026 14:32:55 +0000
Received: from bali.collaboradmins.com ([2a01:4f8:201:9162::2])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xTKEu-000000069CN-3h9w;
	Tue, 17 Nov 2026 14:32:54 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1794925970;
	bh=S1+CM4ZTRDhAuFdTnMRVUvSUePFWDrIJ2UJw22fjbTw=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=XZFomuKMSY2LtFqd5jpC+E1y4h3Mb8rfKdpzXryTW6Z0TW6SqHygAx6f5dh+m3KPD
	 HsyCq/GFncQ+CaBq4vVX6auQiYP7DAf0LI/e4s2F++EqFSZ0EdZcxvkaudu3bSTHSQ
	 Af88IXYLmSF0rG0+SwuOR2U5XVzVwovs2W2cIQuhfSJ0tD9MHGcPkit0l/sJri2UHe
	 9jsdCngF3+ZXCXsKxOZICgUc37Vo3n8cx+iuAGMaaB3Pmub3AQATm2VfK6sOuWpQ5l
	 YpkHLPfNvZKB6Z+IHqtNFCVW328Mj4OQQWZur1XfN6WVM1gjYTv42v721USZopLQGC
	 zoqR/GNuVK4sQ==
Received: from [100.64.1.21] (unknown [100.64.1.21])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange x25519)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 301DF17E05D6;
	Tue, 17 Nov 2026 15:32:50 +0100 (CET)
Message-ID: <a08cdf23-cf6f-4aad-a4a5-315393bef9bc@collabora.com>
Date: Tue, 17 Nov 2026 15:32:49 +0100
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/2] dt-bindings: soc: mediatek: pwrap: Add MT8163
To: bengris32@protonmail.ch, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>,
 Flora Fu <flora.fu@mediatek.com>, Alexandre Mergnat <amergnat@baylibre.com>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org
References: <20261117-mt8163-pwrap-support-v1-0-b00fa10035a5@protonmail.ch>
 <20261117-mt8163-pwrap-support-v1-1-b00fa10035a5@protonmail.ch>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Content-Language: en-US
In-Reply-To: <20261117-mt8163-pwrap-support-v1-1-b00fa10035a5@protonmail.ch>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261117_063253_104951_AA460018 
X-CRM114-Status: UNSURE (   7.10  )
X-CRM114-Notice: Please train this message.
X-Spam-Score: -2.1 (--)
X-BeenThere: linux-mediatek@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-mediatek.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-mediatek/>
List-Post: <mailto:linux-mediatek@lists.infradead.org>
List-Help: <mailto:linux-mediatek-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mediatek>,
 <mailto:linux-mediatek-request@lists.infradead.org?subject=subscribe>
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
X-Spam-Status: No, score=-12.4 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1 autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On 11/17/26 14:28, Ben Grisdale via B4 Relay wrote:
> From: Ben Grisdale <bengris32@protonmail.ch>
> 
> Add a compatible for the PMIC wrapper found on the MediaTek MT8163 SoC.
> 
> Signed-off-by: Ben Grisdale <bengris32@protonmail.ch>

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>

