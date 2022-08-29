Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A40D0ECAAD5
	for <linux-mediatek@archiver.kernel.org>; Mon, 29 Aug 2022 16:10:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ZPo2IFjFMA2hVDjM6c3TxWuz5w/vpLF1tlFpfViNg78=; b=hjFl1EnsTkK5mH7wyWMfymWca7
	b6T8584xCpy4BbswXW0bMasZsXoUDRXEYRrloqpEaysp+NYGTunXlpx+MfEz0qq3J053eLTlr7lQM
	cKmgWy9j/ly8thdi5D1Xa+Spxez3QpS0FTdyWujcrkzbNlpV+7mcaeOdzQiKnqf3XkCJMQ0Pi8TJv
	jTegvrukxVZNAjcwECuQblgfdrkc6RAXzZYgokTAz2jUPLkve1Izg6N4e6nFvPNhWuyhqa+0AttpN
	/Aj1PjlWq1HeVRR0zGvY58yxvsMyArSN/9D29McyNVKxXi+xDV/y5UILQI0EDM68MyawZW5MgWQCg
	N6/2glzw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oShL1-00Bcd5-Fh; Mon, 29 Aug 2022 16:10:11 +0000
Received: from madras.collabora.co.uk ([2a00:1098:0:82:1000:25:2eeb:e5ab])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oShIT-00BbgH-QX; Mon, 29 Aug 2022 16:07:35 +0000
Received: from notapiano (unknown [70.107.189.129])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: nfraprado)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id DFD136601E65;
	Mon, 29 Aug 2022 17:07:28 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1661789250;
	bh=HKidM7v19MiruZdK7/phGu4UFG+Bzp83idEhdT1R2Dg=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=OT2U9NQDjXeDnOkz1Z39vD5Nf+z4Z9jS1wx8h5+pT7NtcZvECNuxYrfd/voAgOgBZ
	 8I1z90Am4d6er5TdD6+T7ESofbmiBZJM9kUYeYtBr5bbzN6EwxPgg3kBoQhr3JAgRr
	 RC43KWcYUHdjpEmiCOSSrYsn+pUHNe0QRkNnAdv2Y93GiJ5Y7MJB5IjSyDzuZbNtUy
	 j52gPs7oLwmcnp2j6hWe1q0hbJRii70NAu9LINpDQGNFe5yncFdCLpaSoklawrApTO
	 Id2BObeIQHLkDYDkjaxmdbdzL1gIrcxWPb6/4ET2rGez3H5FuJZVqMgXQBb0z+/oyY
	 9oEnIWheuaJhQ==
Date: Mon, 29 Aug 2022 12:07:24 -0400
From: =?utf-8?B?TsOtY29sYXMgRi4gUi4gQS4=?= Prado <nfraprado@collabora.com>
To: Allen-KH Cheng <allen-kh.cheng@mediatek.com>
Cc: Matthias Brugger <matthias.bgg@gmail.com>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
	Project_Global_Chrome_Upstream_Group@mediatek.com,
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org, linux-mediatek@lists.infradead.org,
	Chen-Yu Tsai <wenst@chromium.org>, hsinyi@chromium.org
Subject: Re: [PATCH v15] arm64: dts: Add MediaTek MT8186 dts and evaluation
 board and Makefile
Message-ID: <20220829160724.xfbqxv7fs6ilr74u@notapiano>
References: <20220825170448.17024-1-allen-kh.cheng@mediatek.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20220825170448.17024-1-allen-kh.cheng@mediatek.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220829_090734_034869_A9A76E7B 
X-CRM114-Status: UNSURE (   9.28  )
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

On Fri, Aug 26, 2022 at 01:04:48AM +0800, Allen-KH Cheng wrote:
> MT8186 is a SoC based on 64bit ARMv8 architecture. It contains 6 CA55
> and 2 CA76 cores. MT8186 share many HW IP with MT65xx series.
> 
> We add basic chip support for MediaTek MT8186 on evaluation board.
> 
> Signed-off-by: Allen-KH Cheng <Allen-KH.Cheng@mediatek.com>

Reviewed-by: Nícolas F. R. A. Prado <nfraprado@collabora.com>

Thanks,
Nícolas

