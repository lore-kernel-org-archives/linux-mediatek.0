Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 85313C3ABAC
	for <linux-mediatek@archiver.kernel.org>; Tue,  6 May 2025 09:08:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Date:Message-Id:Subject:References:In-Reply-To:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=1jGf/plY2ONRRVKTYDDcgKLdEiw4nVM7PFUY28QLdD4=; b=gpIFo1eCiHzUNoGFpVlChs4UK0
	NIpXW0+4g6pLQ1+8DVvbWgpbYByefS258c+iX3Zkx0qJoYiw1QCWLYKohvsJSZzFU9q9UmTqpVIbI
	UDq+duTp+R7IR70C3EY1lGeUWJIxIQ3rgNyPfzNBBwfFs9fH0AFxHNbaX45LC/qCoXgUU64KJf/OD
	ZSKlzC+RAhW81WaI52FGMdp4Xo3FviiVSvPx+pDfVp5dhMCdsCHBsItd7WatbxQTxB3BVYXEHaN92
	TLWDej4Z36UR3HvnKz8qkcr0MQcAWAr6MI7KljAdmPLDH3KepU505eNPpWB3OZntP+nZCc43Qb0xb
	6GqbbtOQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uCEHe-0000000BHXW-2JQO;
	Tue, 06 May 2025 09:08:14 +0000
Received: from bali.collaboradmins.com ([2a01:4f8:201:9162::2])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uCDjr-0000000BB7T-46JJ;
	Tue, 06 May 2025 08:33:21 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1746520398;
	bh=Xz/XZoWdLK9sjxD5LgW3w0A+B+hpmKHOEi8obS3nq38=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=j9Z2yEthJUOpZhCQGy8ad6UVLa5tE+PmU25AQXWomdrypN9ePQmxewE3PfoVuDkJH
	 x8LMGp6bm/c0H5lSmZ4dEHNd3M4Uu5tkhNlaLLZHBJY8fVAtoO+7mheqa0/fWq24WY
	 JMW+FSRIMKyxlZ+CNCCiPxg4qUaPhU/UZ/D4w1+7PEHdjVy2nyGjWJVUlypqwt0WdT
	 AxwUWEGWTOlBMCAq9k77tkUr9+dv2dkbehKgKaC5wooLsH4+hpA+FS6owyAYhQGOci
	 5n5cBP5saJDzr7N020b95TWO8dVLfLAeA1bAvcCqg8bOl6Rjrspr//+3Ar86KYeW8r
	 qNN6okFAWJICw==
Received: from IcarusMOD.eternityproject.eu (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id EF62217E049F;
	Tue,  6 May 2025 10:33:17 +0200 (CEST)
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
To: Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 "Rob Herring (Arm)" <robh@kernel.org>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org
In-Reply-To: <20250409205001.1522009-1-robh@kernel.org>
References: <20250409205001.1522009-1-robh@kernel.org>
Subject: Re: [PATCH] arm/arm64: dts: mediatek: Add missing
 "#sound-dai-cells" to linux,bt-sco
Message-Id: <174652039790.26427.3827996167340215423.b4-ty@collabora.com>
Date: Tue, 06 May 2025 10:33:17 +0200
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.14.2
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250506_013320_163020_F2799343 
X-CRM114-Status: UNSURE (   5.64  )
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

On Wed, 09 Apr 2025 15:50:00 -0500, Rob Herring (Arm) wrote:
> Add missing "#sound-dai-cells" which is required by the linux,bt-sco
> binding.
> 
> 

Applied to v6.15-next/dts64, thanks!

[1/1] arm/arm64: dts: mediatek: Add missing "#sound-dai-cells" to linux,bt-sco
      commit: b8202a12cdd771b55a9565814022ea8c69572cd7

Cheers,
Angelo



