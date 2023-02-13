Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D1CFEC636D4
	for <linux-mediatek@archiver.kernel.org>; Mon, 13 Feb 2023 14:53:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=8Xqu8qbQ6M8Ll5On44E3KLaX7WA94HVWNZxXQEgbGgk=; b=S70kcT2ZWZj6mBwjzIAWw3ldBb
	ws4LaQgjlJD6etpeX/XpCav5djWpTSx7JGzVTz64cXI3+hvOMqzrfaUlCcv1hVqUNVtxfPdTtQEbr
	c8BBQddOkxS0iStQZ8+OPODpGIfqbiJVlGj6bcnlLYSn71Kz0RVxT93mEoqnNDJSGitQnmUQd/FaP
	xu7qs1r4MU5WdW40W5C3DauO8159vH+yKd0Tq8gxvsHQ7as3U51h4m+Iqer6KeaXioCNfFCaE+MmE
	fw+70JhGrXt9ZcjWBVNva0kOShNUgh4x+xOfVurYBbiPTI9X+Fn3++7ACcBKxb8S/hiBnbQF9xCw0
	9lwuNrJw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pRaCo-00F3Np-Ty; Mon, 13 Feb 2023 14:53:22 +0000
Received: from madras.collabora.co.uk ([46.235.227.172])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pRaCe-00F3K8-Dm; Mon, 13 Feb 2023 14:53:13 +0000
Received: from [192.168.1.100] (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits))
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id A5EED660209A;
	Mon, 13 Feb 2023 14:53:10 +0000 (GMT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1676299991;
	bh=0bj2of/sUN0oQJ69N2Pym5h89V1ivv1HeeJyDvv0zvo=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=bdQ/nXVIoUm86H0pJWSoU2q8r06of8n0QYwKY5S4YwEnqSIy1lxKHyUHR6Qv+GU1V
	 cEd45h76x1Z2mVqF6QLftw9Azi1CrlEnICUQukMZrP9rjTDCFT4bDoKdMA+sbxy+ja
	 5U0gtX7tysenbtgLE3g+qhawnQxly1h7FbPDaUBRxyhT0rR4vbdRgVyBFETenYQGjd
	 AeWIjh6MATT9uijUIiGZtd+tcAEjIHFRHRa/thpvHz/t9PO6S24GmgLno/TJU18WZ8
	 wiqioupTLHsIxYVojloYtmPk4/yy+ix68wqRfPeds+X2FcQV8B8/cfgV6l1dbrLxIK
	 nZEcoB/0RNPUw==
Message-ID: <63062e24-e6d1-9749-62fc-20e9fcb80ac2@collabora.com>
Date: Mon, 13 Feb 2023 15:53:08 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.2
Subject: Re: [PATCH v6 06/12] remoteproc: mediatek: Extract remoteproc
 initialization flow
Content-Language: en-US
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
 <20230213033758.16681-7-tinghan.shen@mediatek.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
In-Reply-To: <20230213033758.16681-7-tinghan.shen@mediatek.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230213_065312_624217_481C7CC5 
X-CRM114-Status: UNSURE (   9.00  )
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
> This is the preparation for probing multi-core SCP. The remoteproc
> initialization flow is similar on cores and is reuesd to avoid
> redundant code.
> 
> The registers of config and l1tcm are shared for multi-core
> SCP. Reuse the mapped addresses for all cores.
> 
> Signed-off-by: Tinghan Shen <tinghan.shen@mediatek.com>

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>



