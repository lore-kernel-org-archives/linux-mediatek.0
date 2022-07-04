Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C66A3C43334
	for <linux-mediatek@archiver.kernel.org>; Mon,  4 Jul 2022 09:26:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=KF99gcYOcP+Ah4aD9gN74n2H3iN8SpLaeQ4FCdqzIJI=; b=IcR3vuul1zb+deO/4MWKAt9AoP
	mjcHNcMLyRxhDLQXiDmbaiS0oAhuwD0DH6pO45TPDUI4sXbtx9tyPQyRoDMUZwOjW+X5gzBYUqWLm
	++a4shQZC/BGBGmH2TrEulouSGUy3bqlItB+lfLR/9qcAG3yEyhhVu5UevfX6nI26yGbtaSyLhfos
	SAYEJ4WG60zv8/Wjg9N/j1SyaVmeDxfkAD10wOPxkz0nZKHNOxeJsSvhG0/2VQkafEiQh5HDR3pOJ
	gAmz6OECUHt/fuVksFssHB+dvwaLCi2b/NsKcNNDp0spmANkVGk4ANZV+pByOw5S5oJY0/spAkO7Q
	HtjyE7Xw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o8ILP-006RdE-Bc; Mon, 04 Jul 2022 09:26:15 +0000
Received: from madras.collabora.co.uk ([2a00:1098:0:82:1000:25:2eeb:e5ab])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o8ILB-006RVq-HM; Mon, 04 Jul 2022 09:26:04 +0000
Received: from [192.168.1.100] (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits))
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id 2FFE26601604;
	Mon,  4 Jul 2022 10:25:59 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1656926759;
	bh=8zvFYnOz1U946jUFE3WZkMYumMLtWeLYdXvCp8c/6z0=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=chx49ZsnQDfd3zIx2uLPIhsslgwIKDzl3zWFNA51ciV4gsF183X2vUUSUnSzl2KXx
	 92TDvvf+ASzxjWYcH/E+it48Evlop6RdanCAe/W+7V9XeRK2HNnkZGv3KoKIwcfKXP
	 KIPLzbXgBWR7O6xFDdMJnmSnR7yE6MhKXZj9U2o1A/E1VWnN+D2P+A0OeU4u6jUkvR
	 ouZwqRVIXq+Ju0nA610/aYEDB1hkdZe9bl2mNoUEcjOpWZPqFIiTX/xRhuEI5hYYLE
	 c0fBPtGzUEUTjOd1ni25IQrIv7VdE2z7eIeTUHjeeNVi1BLtvHSH2U3W3uJ0Sls777
	 kSr1BR2eotMdQ==
Message-ID: <73c6b04f-f98a-1dee-ff82-ec43a4fce155@collabora.com>
Date: Mon, 4 Jul 2022 11:25:56 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.10.0
Subject: Re: [PATCH v2 1/1] remoteproc: mediatek: enable cache for mt8186 SCP
Content-Language: en-US
To: Allen-KH Cheng <allen-kh.cheng@mediatek.com>,
 Bjorn Andersson <bjorn.andersson@linaro.org>,
 Mathieu Poirier <mathieu.poirier@linaro.org>,
 Rob Herring <robh+dt@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>
Cc: Project_Global_Chrome_Upstream_Group@mediatek.com,
 linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
 linux-mediatek@lists.infradead.org, linux-arm-kernel@lists.infradead.org,
 linux-remoteproc@vger.kernel.org, Hsin-Yi Wang <hsinyi@chromium.org>
References: <20220701121229.22756-1-allen-kh.cheng@mediatek.com>
 <20220701121229.22756-2-allen-kh.cheng@mediatek.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
In-Reply-To: <20220701121229.22756-2-allen-kh.cheng@mediatek.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220704_022601_746592_B7629E72 
X-CRM114-Status: GOOD (  12.15  )
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

Il 01/07/22 14:12, Allen-KH Cheng ha scritto:
> This patch is for enableing cache in SCP. There is not enough space
> on the SRAM of SCP. We need to run programs in DRAM. The DRAM power
> and latency is much larger than SRAM, so cache is used to mitigate
> the negative effects for performance. we set SCP registers for cache
> size before loading SCP FW. (8KB+8KB) and also adjust ipi_buf_offset
> in SRAM from 0x7bdb0 to 0x3BDB0 for enableing cache.
> 
> This patch was tested on MediaTek mt8186.
> 
> Signed-off-by: Allen-KH Cheng <allen-kh.cheng@mediatek.com>

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>


