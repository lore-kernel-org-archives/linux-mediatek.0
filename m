Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 46C04CED274
	for <linux-mediatek@archiver.kernel.org>; Tue,  8 Oct 2024 08:34:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=77LRUTlS6N85YHurZAwkWWTChImJu9rN9pG0wAdC8nc=; b=FvubMUOwaGXtDRmEJaUrC891Kz
	HaGqExLqkIhohX9ZBZ7Kx2KX3uE/5BJlXsOIa1w3oCAxqQga/dstSLfCjLc2cPhA1ERtbQc2Rv0P6
	2ZdtfYD1zNKDb/s2SHDe+1ZcoxkspVTaSynNyuxaeh6wNvhFac/NNmPWA94pKigEsNxJ9uHsviomt
	i5AWeE89N6Vdx7pR2DuYrlz4FafAimKmEo29wk7YIFi7YK50bhiXLxpwNBTELDFd/PjereMeQRXIR
	72M3p8QM3KnCoE7fO3TpB7MDgb74iRC/JtUYIDbRMumilsSJ0H+Zo9sd8s2XCdY9FJX7oG2n6Wbvh
	4teYJ2Vw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1sy5fi-000000054GR-1FtI;
	Tue, 08 Oct 2024 08:34:22 +0000
Received: from bali.collaboradmins.com ([148.251.105.195])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1sy5SH-00000004zmM-2m01;
	Tue, 08 Oct 2024 08:20:31 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1728375628;
	bh=c/txFuvsjE2i3hdoL6uY9Il04joUzLruIuK2uXuPyQ4=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=MSClA6I0sSpqqRg1Rst67jKs+miA/4kVWz0p482jAYupIfHJBxrdnbue9OEkamBC9
	 O6nY5ZCq1a7BapW8ZMZsky74f0w2UFaVfRFfat0XDVb7HsVFKSWnklhSqW+P0q5u1g
	 X6LgWLBEP1AItCQhGEcE6cei6rsmZVIiXBFtTuX0FMg6URQM9K9qBUccSn3KLLv8EM
	 Xvu7nA5QvraaU+GHKHqErZ7IoX3XKpRkU9avOQLOkGSQBfTGBaLux4fJcacq2e1fT0
	 qcMrAYVjcl1YmDkkU7YVoIdHzGgCnkDJYBFtwpFL/NecyUx6xOb/dz3vtZmm/FfjX3
	 igys7T++H3vTg==
Received: from [192.168.1.100] (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 7828017E10A4;
	Tue,  8 Oct 2024 10:20:27 +0200 (CEST)
Message-ID: <fa0b6d34-65ef-4b12-a290-5ff00c49e10c@collabora.com>
Date: Tue, 8 Oct 2024 10:20:27 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] arm64: dts: mediatek: mt8390-genio-700-evk: enable pcie
To: Macpaul Lin <macpaul.lin@mediatek.com>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org,
 Jieyy Yang <jieyy.yang@mediatek.com>, Jian Yang <jian.yang@mediatek.com>,
 Jianguo Zhang <jianguo.zhang@mediatek.com>,
 Alexandre Mergnat <amergnat@baylibre.com>
Cc: Bear Wang <bear.wang@mediatek.com>, Pablo Sun <pablo.sun@mediatek.com>,
 Macpaul Lin <macpaul@gmail.com>, Sen Chu <sen.chu@mediatek.com>,
 Chris-qj chen <chris-qj.chen@mediatek.com>,
 MediaTek Chromebook Upstream
 <Project_Global_Chrome_Upstream_Group@mediatek.com>,
 Chen-Yu Tsai <wenst@chromium.org>
References: <20241007100749.6657-1-macpaul.lin@mediatek.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Content-Language: en-US
In-Reply-To: <20241007100749.6657-1-macpaul.lin@mediatek.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241008_012029_877728_49047A11 
X-CRM114-Status: UNSURE (   5.84  )
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

Il 07/10/24 12:07, Macpaul Lin ha scritto:
> Enable PCIE, PCIEPHY and related Pinctrls for mt8390-genio-700-evk
> board.
> 
> Signed-off-by: Macpaul Lin <macpaul.lin@mediatek.com>

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>



