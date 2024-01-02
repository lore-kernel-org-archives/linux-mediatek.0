Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9164CC47073
	for <linux-mediatek@archiver.kernel.org>; Tue,  2 Jan 2024 09:14:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=0gsk+dXRnnIpKoJ705Gi3+44srxRX0RlKTiIHgorGAc=; b=dGoW1AoF10ek9+w9z2T4GaQLsS
	Sf+dEFPPr3xNXqAoPB2Uoc94OaTuc4nu2cx8eSwZBMmaVbBnZ2Eho5GxWeFV7ASBHEep55JKomwfr
	mxzwbZo7WZaRHdOErShJKVKnWfFocmJzYKQ3zD+N3lZxjK4WJH2JFFL0xfgUQ/aQnQQBrmUjFJqLJ
	5gIxPD0ay1U2t2rYG1fdCQp6cNwD35zU2EFjExdmd1awBO0WeAn0/ltxA2UfMDSEpUb007X0HS+Rl
	/ExEyhl1SPKX0Q7EI/APRxeYQ6Or0Akpn+8U5K+TZG0CeHtYoa6DK9OqrAg4X0fzl7EP6WEmdidCZ
	6QE5ZcpQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rKar5-007QYr-2E;
	Tue, 02 Jan 2024 09:14:35 +0000
Received: from madrid.collaboradmins.com ([2a00:1098:ed:100::25])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rKar2-007QWi-2I;
	Tue, 02 Jan 2024 09:14:33 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1704186871;
	bh=P0k9lGdFmaxKCJJMVyMxCu4geNsr/+d84M64wiuVpes=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=Xl84UyZIduCiBoywPWkR0hiM9OXdAQE/50z2JX5XCX1EMdcFtnS/DLNdpi9XcHaK3
	 Zgweay3hseljaKTQQUIwknvk6Y7wm/IksS6amwpxErfFHMgkc7j7jIa0J+zgGV3Li2
	 lRS05HexKdL/6aCr0lHonX4XH8+M/WC2aNsY0jTA1Jdqt4/rtlxeFDXPvRF/GdI1b/
	 0mSW6otEtK/nXvWlYkf8qMY4W79HCY0BA2hXmWB/jPgnvpl5AyCM30VZlaICEbw4Gh
	 eJOthtSbzD4TOPgb59bhkF90FY/v8WLFeh9PV90Kc8PjBjNHpZj83o5SN7hW+0M2D5
	 7Yabcb6FrC9iQ==
Received: from [100.113.186.2] (cola.collaboradmins.com [195.201.22.229])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by madrid.collaboradmins.com (Postfix) with ESMTPSA id 9D99F37804B2;
	Tue,  2 Jan 2024 09:14:30 +0000 (UTC)
Message-ID: <bfebc5ec-8501-44b6-b05a-93f5f2072c3d@collabora.com>
Date: Tue, 2 Jan 2024 10:14:30 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 5/6] arm64: dts: mediatek: mt8186: fix VENC power
 domain clocks
Content-Language: en-US
To: Eugen Hristev <eugen.hristev@collabora.com>, tiffany.lin@mediatek.com,
 andrew-ct.chen@mediatek.com, matthias.bgg@gmail.com,
 linux-mediatek@lists.infradead.org
Cc: linux-media@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 robh+dt@kernel.org, kernel@collabora.com
References: <20231228113245.174706-1-eugen.hristev@collabora.com>
 <20231228113245.174706-6-eugen.hristev@collabora.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
In-Reply-To: <20231228113245.174706-6-eugen.hristev@collabora.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240102_011432_881049_6133CD6C 
X-CRM114-Status: UNSURE (   8.05  )
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

Il 28/12/23 12:32, Eugen Hristev ha scritto:
> The larb clock is in fact a subsys clock, so it must be prefixed by
> 'subsys-' to be correctly identified in the driver.
> 
> Fixes: d9e43c1e7a38 ("arm64: dts: mt8186: Add power domains controller")
> Signed-off-by: Eugen Hristev <eugen.hristev@collabora.com>

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>



