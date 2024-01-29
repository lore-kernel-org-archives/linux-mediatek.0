Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CA89FC47422
	for <linux-mediatek@archiver.kernel.org>; Mon, 29 Jan 2024 10:32:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=xtUYYY0Ltor1B0DFVwOECEu4gXenVU7DueR4ebL9vYQ=; b=iYkTQ89P4y33200zirVbBWmlFL
	UMlVXZDOM6STvM90My03yVQgBMhwO1UStQIdV3+9S858ka7+LRLzVmvXh0hqFkAk6gwkNKQma/8MI
	itV+u6seyWUGmJMGbBUkJ85BDW2uYP2+WIDvFviMns1OyyWeDjCb76RNGDXgA/wpTxIQuaPY0UXDV
	dZk7q2MbjsPbN9tC37u3/o2cEtI5QKAR7JplIWx3yZGeauyFbVDfhTe6R1I3xRaVqCQrNxO/cz34t
	EHKIl6aV4q5IecBlAX7NrpyPZtN/+yM8JkVMG9NHBZVgZIo0wGKyxj6xA78TjDmA9+mCB7nv731/0
	KKYjhw5A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rUOw1-0000000CEB6-1nzQ;
	Mon, 29 Jan 2024 10:32:13 +0000
Received: from madrid.collaboradmins.com ([2a00:1098:ed:100::25])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rUOvx-0000000CEA7-48kW;
	Mon, 29 Jan 2024 10:32:11 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1706524328;
	bh=Kw1lj15Qbi2VspPbsVRk7AoiW6W+CJ78QBpDv6oRZ5M=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=BInki8l7s8YGSvbUkuui9ovLkxveKFX3sa1/BLZvHt9I1vbNH4VSZ7ssDoxlTuVnp
	 khFmezlVJH5zIAI/QAKlVp24B9GSGhAG8J/tdMMyF5A2ChVi6RqdQQNhXwXwAlLacD
	 4tF9b00MTFmkloorpEqzQYhlMQ/tHqX6K6TYQV49hn0T8EowcMx4AFZhFow02U6Lxq
	 BldG8He3rANbHJXOwAzdrmdPf227q3R1jM1xGb0UeeZhEwSVybuAwdqecu3mql3jKu
	 9b9+kCWVwW+xMoHn4uzsf7gcKChQ3NKUoC3zoqAJfJ+6fWkoMVfbCJ1ez+WQi+F/DD
	 Yn4GduU4XfVCw==
Received: from [100.113.186.2] (cola.collaboradmins.com [195.201.22.229])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by madrid.collaboradmins.com (Postfix) with ESMTPSA id E83A33780C1F;
	Mon, 29 Jan 2024 10:32:07 +0000 (UTC)
Message-ID: <54553c4f-bdf9-4f26-9d32-2f12d62de0ec@collabora.com>
Date: Mon, 29 Jan 2024 11:32:07 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 2/2] arm64: dts: mediatek: mt8186: Add jpgenc node
Content-Language: en-US
To: Eugen Hristev <eugen.hristev@collabora.com>, linux-media@vger.kernel.org,
 devicetree@vger.kernel.org, linux-mediatek@lists.infradead.org,
 bin.liu@mediatek.com
Cc: linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 kernel@collabora.com, matthias.bgg@gmail.com,
 Allen-KH Cheng <allen-kh.cheng@mediatek.com>,
 Hsin-Yi Wang <hsinyi@chromium.org>, Max Staudt <mstaudt@chromium.org>,
 Ricardo Ribalda <ribalda@chromium.org>
References: <20240127084258.68302-1-eugen.hristev@collabora.com>
 <20240127084258.68302-2-eugen.hristev@collabora.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
In-Reply-To: <20240127084258.68302-2-eugen.hristev@collabora.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240129_023210_209402_0B60FE5C 
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

Il 27/01/24 09:42, Eugen Hristev ha scritto:
> From: Allen-KH Cheng <allen-kh.cheng@mediatek.com>
> 
> Add JPEG encoder node.
> 
> Signed-off-by: Allen-KH Cheng <allen-kh.cheng@mediatek.com>
> Reviewed-by: Hsin-Yi Wang <hsinyi@chromium.org>
> Reviewed-by: Max Staudt <mstaudt@chromium.org>
> Tested-by: Max Staudt <mstaudt@chromium.org>
> Reviewed-by: Ricardo Ribalda <ribalda@chromium.org>
> [eugen.hristev@collabora.com: minor cleanup]
> Signed-off-by: Eugen Hristev <eugen.hristev@collabora.com>

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>



