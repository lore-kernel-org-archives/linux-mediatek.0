Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 03B67C32793
	for <linux-mediatek@archiver.kernel.org>; Wed, 18 Jan 2023 11:26:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=B82/3/xDp/IQxqACB5wrtRFspv40/chspxpULHCPY2k=; b=uYQzwJu8GCeb9QsN4Va8EnkxYf
	FILZFXOlme/og0pxKxsDxFk43vg1/3/qPtFjTi1G8nTF9q/v1JoDb3VhDQWJsWR69/uLHgrP7LnZv
	ih561k8SdrsAAiYPyNgPvEO0XqKKepgfmI+on8NMDcZmQZ4YOMgLqIue/pKrr/X8b2czKzuxJr9ou
	tyPWaMfTGuOBqzgYIijsqLFj1V7hR94P91fhMWg36cyZ98LYvN0a5OYgMKJVREkmtM08pJO4QSMBB
	/6Cnid/e9ReGW4Q9um+u8FGhmLPVi24Hhisnaj+0pybNss+OyOMdMHqd0yB7yIZb6XxbFH+PU2XOE
	9iG4zHbA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pI6aR-000Wm8-Vu; Wed, 18 Jan 2023 11:26:35 +0000
Received: from madras.collabora.co.uk ([46.235.227.172])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pI6aH-000WkF-V4; Wed, 18 Jan 2023 11:26:27 +0000
Received: from [192.168.1.100] (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id 8F7DC6602E0A;
	Wed, 18 Jan 2023 11:26:22 +0000 (GMT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1674041183;
	bh=RilHqFPMaWTucBwrDBDlmCahDlfPKMU/BJEodhKEbQI=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=mM05r1D1Kn8ZwXLxWE5eryt1Z52Jm57sz/fyt7AGTvpMz3r5MwVfjtg2OcU/wsM0N
	 jRLo0Nz0hyaUBqPwg5/K2WbCB0GFKEIn8OdtCLnyITHRJg/Me+0evBAy9bzYMawJhw
	 wuPm1DY4g0N4OROQPFEknX2pEhN6kUqOmjjlJhsqhckthqQUzwDrVg+k16JnvJf7YI
	 n1C3Z9aHb15DXsqjLIDdxnncU6aX131KQt2hmS8/jy+ydd/a9Wiv9SDQ3gCg4CxNvo
	 Fd6MAspNPJ7tw6F/wq1D5+uutjT6ss61SHws2v5uKmJ2aR3MI02IAb/TnK9UC1tz3y
	 /1Z8mELjN2CaA==
Message-ID: <2662ea23-614f-10d6-124f-44aa5fff2a5b@collabora.com>
Date: Wed, 18 Jan 2023 12:26:19 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.0
Subject: Re: [PATCH 2/2] pinctrl: mediatek: Initialize variable *buf to zero
Content-Language: en-US
To: Guodong Liu <Guodong.Liu@mediatek.com>, Sean Wang <sean.wang@kernel.org>,
 Linus Walleij <linus.walleij@linaro.org>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 Light Hsieh <light.hsieh@mediatek.com>, Rob Herring <robh@kernel.org>
Cc: linux-mediatek@lists.infradead.org, linux-gpio@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 Zhiyong Tao <zhiyong.tao@mediatek.com>
References: <20230118062036.26258-1-Guodong.Liu@mediatek.com>
 <20230118062036.26258-3-Guodong.Liu@mediatek.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
In-Reply-To: <20230118062036.26258-3-Guodong.Liu@mediatek.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230118_032626_252529_6F25C05B 
X-CRM114-Status: UNSURE (   8.58  )
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

Il 18/01/23 07:20, Guodong Liu ha scritto:
> Coverity spotted that *buf is not initialized to zero in
> mtk_pctrl_dbg_show. Using uninitialized variable *buf as argument to %s
> when calling seq_printf. Fix this coverity by initializing *buf as zero.
> 
> Fixes: 184d8e13f9b1 ("pinctrl: mediatek: Add support for pin configuration
> dump via debugfs.")
> Signed-off-by: Guodong Liu <Guodong.Liu@mediatek.com>


Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>



