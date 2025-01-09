Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 04356E77197
	for <linux-mediatek@archiver.kernel.org>; Thu,  9 Jan 2025 11:16:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=IqIww/V9yPXMwfJDQRUwvKjHiGcdHc5iDBh9REH9F2Q=; b=3zhNVTkg+tgKmIvMuybXHSSVwa
	zZCIEfP6JSn3dMqfy0D5LGP9/RrwWvVwEquSlXBMQ8FCNYac+icHVy2GxT8xXu9JDFockfYHz1SEs
	l5gyyC/yvP8xWOiG6qZTgmMmS141JLM4ir58OpMKYsaKNkT/MsS1tJcVQaE0/BkSnpUPPqXQzKnyn
	DKFSLdR61UQBWU4XrzpSZsdJg1zhjDysXpknFtcpWD8vv7cwv4rL6qLnt9jii0nHbAMLKBXlZE7Q1
	1mbPobPUamzwHDiqmvDM2dDx15a0TqFWOt4T2KYvJhpzP76PxH9x4SEWAHvAYLe82vU3X33Errf3H
	PXTAplhw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tVqWl-0000000BgEO-0oYQ;
	Thu, 09 Jan 2025 11:16:39 +0000
Received: from bali.collaboradmins.com ([2a01:4f8:201:9162::2])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tVqSv-0000000BfaT-2xOL;
	Thu, 09 Jan 2025 11:12:42 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1736421160;
	bh=rADA9hzCxvUrpUJJKstmnYVcdIugZAWBRdnGgvRIFcA=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=hex7CfuWZ6Qt6xawm2soL46ZFsFnPw0i4ztSNOuou2/PxWwpeexuBcbPNKUAK1WTB
	 7To7fIV9f3nXqJ7V43+Q7y9IUumSiTHnL7PfoZKSB5m4uyCB9FbXBrWolmdTuOQaFf
	 E9qQzhP3xjWoA8OL8qoko3Aj85oSQoZHE661/kKrg/FTDefdmmcNd1Ywh532M09bR2
	 Asgz4enaHr0GKWU4x4TqlbvZC3aTKGbtztgLnPfo0AZegfa2BJ6BSUrp6iHD1612dL
	 dJ7kWy+8HyMUXRpT0+2IBpfr+nOmuUqgcK/kav1X1FQwgDwhQBKnrj84u0NeyJmhFQ
	 j9dmEKxYlKHYQ==
Received: from [192.168.1.100] (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits))
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 9644E17E1564;
	Thu,  9 Jan 2025 12:12:39 +0100 (CET)
Message-ID: <10ec0c42-cc71-4664-9307-1206d74e67af@collabora.com>
Date: Thu, 9 Jan 2025 12:12:39 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 3/3] arm64: dts: mediatek: mt8173: Fix some node names
To: Chen-Yu Tsai <wenst@chromium.org>,
 Matthias Brugger <matthias.bgg@gmail.com>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org,
 Eddie Huang <eddie.huang@mediatek.com>, Sascha Hauer <s.hauer@pengutronix.de>
References: <20250108083424.2732375-1-wenst@chromium.org>
 <20250108083424.2732375-3-wenst@chromium.org>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Content-Language: en-US
In-Reply-To: <20250108083424.2732375-3-wenst@chromium.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250109_031241_895229_0945BF5E 
X-CRM114-Status: UNSURE (   6.51  )
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

Il 08/01/25 09:34, Chen-Yu Tsai ha scritto:
> Some node names are incorrect, causing DT validations due to mismatches.
> 
> Fixes: b3a372484157 ("arm64: dts: Add mediatek MT8173 SoC and evaluation board dts and Makefile")
> Fixes: f2ce70149568 ("arm64: dts: mt8173: Add clock controller device nodes")
> Cc: Eddie Huang <eddie.huang@mediatek.com>
> Cc: Sascha Hauer <s.hauer@pengutronix.de>
> Signed-off-by: Chen-Yu Tsai <wenst@chromium.org>

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>


