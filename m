Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 28335D15D87
	for <linux-mediatek@archiver.kernel.org>; Mon, 21 Oct 2024 12:28:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=xBs1HP63qMsKx2m4qB5ScdKNGVvxtlof+K8EuBS3NhI=; b=UKic859dMmwUv/DpR9R8dfjund
	yDWHvDjS/DwNF+aMJFzK7Q0RESobq9WgY51o4dYhU3KB+KTkHf+GUNNlE/VvVy6xTP1M8JPJTQVtc
	ikpzx8h5OGfEnv6bIbZypjuUy3i/Fba1jErJo/zRbLhoWrPCYTP97cQZxh4u1Hil8mCKUIg/F5VnP
	iMKD0YRrwPFyBx3F9TD9UOECf2kzXBv+EBDekN3oyAnlOzm58PaeaOBHby5p1ciRCbvlJqWM8b0kM
	bpw84QWXs2tFcaR1Vprc1gRIQla6v5gN2LcEyblI2d/lvCaG4+fcF+owRvttThlF8A8nhPHLm2UJk
	Db5XFvcw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t2rWG-00000007FAB-0o6O;
	Mon, 21 Oct 2024 12:28:20 +0000
Received: from bali.collaboradmins.com ([2a01:4f8:201:9162::2])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t2rLr-00000007CHU-2HaB;
	Mon, 21 Oct 2024 12:17:38 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1729513054;
	bh=ujbXw7vejmRZ9o6zJBfdBwm0wEDn5AWwnG56UXmaBlI=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=GwQw+G+MUTYxZMJPwdXQsoDJHrIl6mSPOyA1rYqOmJ1eidGZONpqWlY3f+Jd5ypvs
	 khYewhHEjKXQG9Pjs085kKFo8yf4NpGww3wB/9k00wV97618W5cKk3wj92Y8Geew7O
	 KaW5ccVg2ow599sItmnP+0A7ag2asIpwhh2QDAL5yVV0OyAWd8bYOYZ+vxeuCtTeiZ
	 6Ypgmqk4jthdiCMIWkqtUP3AxlJTw5sI2aljmNLysxSakn+LHpf1uWqV6mgKPkL+PQ
	 Dwdu0y4I8XaQBjTtiGHn6qHoAshWOaJd2VoHMoGlcloMScy5hU/SeHwVR2va/devGH
	 7ZmilP7uugRTg==
Received: from [192.168.1.100] (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 6C69517E35D9;
	Mon, 21 Oct 2024 14:17:33 +0200 (CEST)
Message-ID: <1c54febc-4031-4706-9cfa-ecf090854691@collabora.com>
Date: Mon, 21 Oct 2024 14:17:33 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/2] arm64: dts: mediatek: mt8188: Add ethernet node
To: =?UTF-8?B?TsOtY29sYXMgRi4gUi4gQS4gUHJhZG8=?= <nfraprado@collabora.com>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Matthias Brugger
 <matthias.bgg@gmail.com>, Richard Cochran <richardcochran@gmail.com>
Cc: kernel@collabora.com, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org, netdev@vger.kernel.org,
 Andrew Lunn <andrew@lunn.ch>, Jianguo Zhang <jianguo.zhang@mediatek.com>,
 Macpaul Lin <macpaul.lin@mediatek.com>,
 Hsuan-Yu Lin <shane.lin@canonical.com>
References: <20241018-genio700-eth-v2-0-f3c73b85507b@collabora.com>
 <20241018-genio700-eth-v2-1-f3c73b85507b@collabora.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Content-Language: en-US
In-Reply-To: <20241018-genio700-eth-v2-1-f3c73b85507b@collabora.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241021_051735_760706_11898157 
X-CRM114-Status: UNSURE (   7.25  )
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

Il 18/10/24 17:19, Nícolas F. R. A. Prado ha scritto:
> Describe the ethernet present on the MT8188.
> 
> Signed-off-by: Jianguo Zhang <jianguo.zhang@mediatek.com>
> Signed-off-by: Macpaul Lin <macpaul.lin@mediatek.com>
> Signed-off-by: Hsuan-Yu Lin <shane.lin@canonical.com>
> [Cleaned up to pass dtbs_check, follow DTS style guidelines, removed
> hardcoded mac address and split between mt8188 and genio700 commits,
> and addressed further feedback from the mailing list]
> Signed-off-by: Nícolas F. R. A. Prado <nfraprado@collabora.com>

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>



