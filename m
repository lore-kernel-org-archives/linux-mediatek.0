Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D2155CA5531
	for <linux-mediatek@archiver.kernel.org>; Wed, 13 Sep 2023 10:15:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=MMbkLH3AOmmQ3kk5Lu75zCGR33JDRTpSqnGusQBT0b8=; b=oy7Jggh5iPOBKWEKSJGD9dEyJ4
	82P6EC8yqynNwj0MlrCRDymn94cwqFNxWTa+SDsu0RIbG7phn4qGB/7baiVvrw7RbQAOQSnl55Sn+
	Lv+KSgfc5AO2UvsPDApWIKJGHUi41YTILeKwjAzgI5pPhDTMzV+Q+242NzXjlO93ScjAwuB1iyO+x
	EuXH9eMqFvTaX7/C9/hB73W0TmaMfwDAcAD1c4df3I1rHvYm/bLHtFll0HYoLVvrnKM2AdUDUUdzg
	sEVvVIB+6Lmzl2XzOLYCdp7VrFXDeq4fdPCOkZIEVtfmEL82qdqsqHQg62cVRKI0kRzTc+pyqJqYk
	rodrxqvg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qgMuD-005NxJ-2T;
	Wed, 13 Sep 2023 10:15:33 +0000
Received: from madras.collabora.co.uk ([2a00:1098:0:82:1000:25:2eeb:e5ab])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qgLuG-005FYl-1j;
	Wed, 13 Sep 2023 09:11:33 +0000
Received: from [192.168.1.100] (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits))
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id A7DA3660732C;
	Wed, 13 Sep 2023 10:11:30 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1694596291;
	bh=N+JMYyvOVjtyU/ve8vYukFa5nTM6GUSEY4UtANdc3GI=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=gsouZHJPmErhDGeooV6CUn77O0tNB7ffMMRcit2UgaH5EfZXZaK+d8NGU/otajs8r
	 lofJaiwuLgZvs17fQyKNN8Y9mQAiPVu6ABZcHh/uHwiaihCbwxLFmzxIJ0HjEmFyDP
	 zJ2VSAytFImJyueMVy9aQHGH1h7rP1g/SPb+XKdjpK+bn3U6OIeaIVcQ4LJfpzGmRd
	 cEFhEhtLQtVhc2XFaS9aMhbcyrHyIq8xTKF1SkJWrAYEZYDA6QAXGXHj8XLX/PXoQJ
	 sA4opvR6C7Y7wMi/stbc7PDb4R1kYua3HKIDUPWFFz9FhO2rT49zovZqwne9ir2cbQ
	 WKrpDgXYK5frw==
Message-ID: <5d3053d8-0252-f8fe-fa9e-526f0f4d52bb@collabora.com>
Date: Wed, 13 Sep 2023 11:11:28 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.15.0
Subject: Re: [PATCH 3/5] spmi: mtk-pmif: Reorder driver remove sequence
Content-Language: en-US
To: Fei Shao <fshao@chromium.org>, Stephen Boyd <sboyd@kernel.org>,
 Chen-Yu Tsai <wenst@chromium.org>
Cc: linux-kernel@vger.kernel.org, linux-mediatek@lists.infradead.org,
 Matthias Brugger <matthias.bgg@gmail.com>,
 linux-arm-kernel@lists.infradead.org
References: <20230824104101.4083400-1-fshao@chromium.org>
 <20230824104101.4083400-4-fshao@chromium.org>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
In-Reply-To: <20230824104101.4083400-4-fshao@chromium.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230913_021132_712662_A32A133D 
X-CRM114-Status: UNSURE (   8.11  )
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

Il 24/08/23 12:40, Fei Shao ha scritto:
> This driver enables clocks and then adds SPMI controller in probing, so
> we expect the reversed sequence in removal.
> Fix the order in the remove callback.
> 
> Signed-off-by: Fei Shao <fshao@chromium.org>

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>



