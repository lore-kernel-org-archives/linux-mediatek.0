Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9F0CBCF31A9
	for <linux-mediatek@archiver.kernel.org>; Wed,  2 Oct 2024 09:47:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Date:Message-Id:Subject:References:In-Reply-To:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=MoDycju6MyzJK5wIICPD9Oxr3aCziLHgsLJ3OZD4GrI=; b=joirRAbEI9pz6RGeMHtEilx4Kz
	bOgLTRkOznwDslK/FMlbCy4DzFSvRrvS2JPPqxGD8S8IgzRN9xduC3q/LGH3dEPn2s8dFAJncxCm+
	udp+g3YTrE7ttXZ2xs1wqqwaTQjw/Mgi15P9Wsz+HIQEce3LAEkeXL4SD8TqAzXLTJanDojJb9Oa+
	uZ9POd1Ct4rJlhGZFB3OGu0xQmbymtj8ZVedk9DwLu4JizICOQod7D/ryvjbWdJuPxYwKNjRS+y2E
	wBHE9+lYp/jhx+t8gDSUO1J47yTTsHBrQtvt6LwJF7vR1IltYarFU5zgslq38lbtCxbFlM286m7Pq
	St6xw/iA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1svvxe-00000005O3e-3BLW;
	Wed, 02 Oct 2024 09:47:58 +0000
Received: from bali.collaboradmins.com ([148.251.105.195])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1svvjj-00000005LhO-2K3K;
	Wed, 02 Oct 2024 09:33:37 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1727861613;
	bh=crIeX+1YqBeapyeeVy+SwHw+twfzOe2BPfPN8aW1AzY=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=WqbuubvOKGFbHKKqknz05MJbkSh4o8kB7ri1/FYxBCfLM/xm87eNdVEHGcWWGDop3
	 a7bGixPsJM++my68sjxNgohGbl17EnBch3UzMtGl9sxADScHiCoGbdx7mtkWBRmNJf
	 T8DUiGCDsa/kvo4DTfa9J81gbNM88B8G7P85vyfPIdQ9LhxZdMDsA34k5egpEWKsBi
	 afG5EU5R5+cDGQJmfa39tDPUHplgZXgT8eTnohHRMluuTsFzXF34otKtgBsNQJWfjN
	 YXysvS2qTNe1bu8gPKMR0rDdDq5Gsp6nQi0EAHWKsQrPZhTehT1pXcNz97pA88iQd2
	 cZYhXhE2pdaJA==
Received: from IcarusMOD.eternityproject.eu (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 81B8417E120F;
	Wed,  2 Oct 2024 11:33:33 +0200 (CEST)
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 Hsin-Yi Wang <hsinyi@chromium.org>, Hsin-Te Yuan <yuanhsinte@chromium.org>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org
In-Reply-To: <20240910-one-wire-v2-1-2bb40d5a3cf8@chromium.org>
References: <20240910-one-wire-v2-1-2bb40d5a3cf8@chromium.org>
Subject: Re: [PATCH v2] arm64: dts: mt8183: set DMIC one-wire mode on Damu
Message-Id: <172786161347.39477.13562765698626239218.b4-ty@collabora.com>
Date: Wed, 02 Oct 2024 11:33:33 +0200
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.14.2
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241002_023335_821047_D5B54E13 
X-CRM114-Status: UNSURE (   5.63  )
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

On Tue, 10 Sep 2024 08:47:44 +0000, Hsin-Te Yuan wrote:
> Sets DMIC one-wire mode on Damu.
> 
> 

Applied to v6.12-next/dts64, thanks!

[1/1] arm64: dts: mt8183: set DMIC one-wire mode on Damu
      https://git.kernel.org/mediatek/c/ca80f750

Cheers,
Angelo



