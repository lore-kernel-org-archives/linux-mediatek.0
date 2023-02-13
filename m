Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 907BDC636D4
	for <linux-mediatek@archiver.kernel.org>; Mon, 13 Feb 2023 14:53:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=bl7ftHERk6N2p3yuTz6agffAGHYj4oOByQDXlMeCkaE=; b=EoIwICDhXnXO0FjpDaLPFmmwR6
	eS61g0a94idSM3TaoOhnuUYcKwtUaGmgInqYPKTHte09LBAYvmTqlnOgPwzco+9Rr7oD1cLch+CRR
	dh2II3YNLPOD8pbLFpgwortbKMtcbTFf71/BhjK7bV4glz+T3NCw34KZveHzjh0QLH89AZcn9Z7wl
	kSxSiY+DEqVTxLHr6FNgMqpc7AGy3GoKRaq9l6+uYS56wNsW3pbsEMoHgsJ9DC4sdNv1XAXR81UCz
	xDPX3Poy2sqe2SKx6xotFRfWkrfVlMZck99W5XTROVIIdORbXBhnxxlp+3e0lMDoQ+yv8NjW+5guP
	iTskwj/Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pRaCO-00F3E0-Mq; Mon, 13 Feb 2023 14:52:56 +0000
Received: from madras.collabora.co.uk ([46.235.227.172])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pRaCD-00F3Ar-9r; Mon, 13 Feb 2023 14:52:47 +0000
Received: from [192.168.1.100] (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id 841D1660209A;
	Mon, 13 Feb 2023 14:52:35 +0000 (GMT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1676299956;
	bh=FuwwZwXsBgBDZDXz+btVCJiK7TvAR9ew7WIV1Gkdg2o=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=YyX5CZuGsThkzfpQ65RDbFd3vWmv/GrIE8WEiVbRahgab7YS35IaHKNyz3YUywqHH
	 Z41n+zz+5CrqFFBimmHUgwbfiRXO17hGEvZlic5g3bY5uawR3Og+s2vGS3mTNc8TWJ
	 U6o+tVLlFNkTjQIWP+SqAdgExzxU9p2M7SK/7JBEqSxE2SxgUh2ZjBVi3+n45sm3YA
	 4QVkIMtHJPOW+EUKNgRDcv2hspU43PwiLeXesSF/q5H5gssgzSIh6u1UZv6a68ZrSY
	 Zvsnt5rXtGu5R1CHfwh+LP/oZDPx3G7o8CXV9QwpacfcE6LS8jnUNqOdaSO18HOmBu
	 C4Yx8P+oN2L9w==
Message-ID: <200fafc1-04be-2464-b973-232d16a9bf8d@collabora.com>
Date: Mon, 13 Feb 2023 15:52:32 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.2
Subject: Re: [PATCH v6 05/12] remoteproc: mediatek: Add MT8195 SCP core 1
 operations
To: Tinghan Shen <tinghan.shen@mediatek.com>,
 Bjorn Andersson <andersson@kernel.org>,
 Mathieu Poirier <mathieu.poirier@linaro.org>,
 Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Matthias Brugger <matthias.bgg@gmail.com>
Cc: linux-remoteproc@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org,
 Project_Global_Chrome_Upstream_Group@mediatek.com
References: <20230213033758.16681-1-tinghan.shen@mediatek.com>
 <20230213033758.16681-6-tinghan.shen@mediatek.com>
Content-Language: en-US
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
In-Reply-To: <20230213033758.16681-6-tinghan.shen@mediatek.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230213_065245_598585_8326651E 
X-CRM114-Status: UNSURE (   7.27  )
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

Il 13/02/23 04:37, Tinghan Shen ha scritto:
> The SCP rproc driver has a set of chip dependent callbacks for
> boot sequence and IRQ handling. Implement these callbacks for MT8195
> SCP core 1.
> 
> Signed-off-by: Tinghan Shen <tinghan.shen@mediatek.com>

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>



