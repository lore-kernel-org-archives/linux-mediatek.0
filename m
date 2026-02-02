Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 23E82E73158
	for <linux-mediatek@archiver.kernel.org>; Mon,  2 Feb 2026 12:02:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=/GLE9J/X788sEsHoqlePw6y2LCmC1w+ePvcAzvgiYiI=; b=0vl8TucwlJnceuqNWyeg/XcIky
	JmEngh/+Ud2jd3+6oIK09KUizRZeKs8DiCGdKS2FsjEyvsUQwaTCwbBLnIRbOdWrIDJNrlgG2yL0D
	VyVSnRa0mzqldxoYPRW1xPMson6ZH+ORXWO2uVWqKsbJ2HOfv4KQOsk3wVVG5BnsdJIGVC8lKZpoC
	DC6OxjHvpVG4T24QXnntURcg+J9T6n/y9gpvoK9SkK2VvyYpmY5ga9MUzOOHCmB5tkzeTGNj/0Fju
	t5o/bOX0/bRnBORPIGkI2arIcaAMWpw76hqKYJmh5ZqTEU0MQPt7qHo/4qlgTemJWw9UhwHJW1lQV
	OtvkSP1g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vmsdC-00000004wOC-01mI;
	Mon, 02 Feb 2026 12:02:14 +0000
Received: from bali.collaboradmins.com ([2a01:4f8:201:9162::2])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vmsd7-00000004wLv-3umS;
	Mon, 02 Feb 2026 12:02:11 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1770033727;
	bh=Q0A8zblGmQhiY1aUgiC5T2dZuCpHQ9u58iJxqwdJMtI=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=IZGB/OYIV54RYNBbI+miFt+Yd89ADqWLCilI1zYyjc+JbXAECLLytRU5nJ0HKz9Rj
	 LWs78w+J15UZaH4PMnhbgS4adOsDv7I0v11h8MzKJgqlwboK4+jHho74kQHclCjy28
	 cHLWaVFLCFJqtwqt3fAxTt6IQDnP1Kk6zPXiCZvs3G57+IwTr/W8rbH2g0q46h5OHg
	 e1P9LsicOwVyOiQbKNy+aX6OBEuiFocGNR1L1tHFT5Z1Kb9Nr3q4JVYjfDitRgSFCU
	 rBQelpwsuo8ELz8G3TB7J+uQUBHWEuNGW6ESunjoK5S56xUv59NHDoknwpxLuB9MIA
	 YXcGZowGNuKpQ==
Received: from [192.168.1.100] (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id B294E17E14F2;
	Mon,  2 Feb 2026 13:02:06 +0100 (CET)
Message-ID: <5742bfd3-d08d-4d45-968d-5cef9ec060f4@collabora.com>
Date: Mon, 2 Feb 2026 13:02:06 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/3] pmdomain: mediatek: Add bus protect control flow for
 MT8189
To: "irving.ch.lin" <irving-ch.lin@mediatek.com>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Ulf Hansson <ulf.hansson@linaro.org>,
 Matthias Brugger <matthias.bgg@gmail.com>
Cc: Matthias Brugger <mbrugger@suse.com>, devicetree@vger.kernel.org,
 linux-pm@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org,
 Project_Global_Chrome_Upstream_Group@mediatek.com,
 Qiqi Wang <qiqi.wang@mediatek.com>, sirius.wang@mediatek.com,
 vince-wl.liu@mediatek.com, jh.hsu@mediatek.com
References: <20260202064820.347550-1-irving-ch.lin@mediatek.com>
 <20260202064820.347550-3-irving-ch.lin@mediatek.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Content-Language: en-US
In-Reply-To: <20260202064820.347550-3-irving-ch.lin@mediatek.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260202_040210_122371_A08BDC7C 
X-CRM114-Status: UNSURE (   6.42  )
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

Il 02/02/26 07:48, irving.ch.lin ha scritto:
> From: Irving-CH Lin <irving-ch.lin@mediatek.com>
> 
> In MT8189 mminfra power domain, the bus protect policy separates
> into two parts, one is set before subsys clocks enabled, and another
> need to enable after subsys clocks enable.
> 
> Signed-off-by: Irving-CH Lin <irving-ch.lin@mediatek.com>

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>


