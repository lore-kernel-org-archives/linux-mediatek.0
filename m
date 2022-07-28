Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0D46CC04A68
	for <linux-mediatek@archiver.kernel.org>; Thu, 28 Jul 2022 10:49:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=5W+TJpGcDhBSF6LlPdvc5zu8kqDqLcfHjFHoQAn0IXA=; b=BtE7bHdfg+sPpaIDKW5lIVUx8e
	t2xLd3rT2Jkwxvdv1roAwCyHPk/Koi3voBOSKeEwy2pymdDv1B9K8XzOu4bmJwQRhVv5P3FP5e89u
	yvdiYbXzfflVXvntA3X0Ms8avEVgLmd5Pl7fgvQWMxtAG9TOK+SORyZbflDNQapt4GZO3xAvhRsot
	1UdIgzwkg1RMw3W5kOnnq/no4fNSkkqm9orMFDgx1SNQnG5Mydc3wNMMd9ySkUc2z2kjB7v9bmHOi
	d6sUkaxdBtyxnO3cWWGnaXRfVv4F1wwvAX54TKhhBqE0HHKgRZkpAnNNI4S1w57nRoPy+rFZC2oY6
	IXQa8q+Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oH14j-008UPC-9a; Thu, 28 Jul 2022 10:49:05 +0000
Received: from madras.collabora.co.uk ([2a00:1098:0:82:1000:25:2eeb:e5ab])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oH14X-008UKy-Jd; Thu, 28 Jul 2022 10:48:54 +0000
Received: from [192.168.1.100] (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits))
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id AAA976601B41;
	Thu, 28 Jul 2022 11:48:50 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1659005331;
	bh=Rfxcg0iEQFXBWxGeTeIp30bpOBIQldLdjIXrXh76rkw=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=h0cQQ3Cg7rssjGPUCBqL5TZ8M89UkaL4FM5h6WwF+d68/KFa2P+OqQ9cu4KRkG1mF
	 ONf5jMjK7LmQk69AalHqV6jw4aNiFA9+fCC/fpkh7jLmtPRBaWDB+ExSVdRzmSATqd
	 bc3y5H4/FjPT+cDUjUq2mOfu0cbYVV5wd6sPasVpKcgvibhSqDoG4qlP821NTb6eKW
	 uRQ/30ExIE2xmOTlGFKPcYHkksZwVWdngzINr5GWgvC1SauO8PBogBTSsOHrUZnH1k
	 wH6so/lk4PQQu/gND4YHMZJSE9cgo16ipk/jb4pVR3W5Wx+HSCg2AzGhztnyfyAnyn
	 w7Sqw5oqN3DNQ==
Message-ID: <de66908a-76cd-db18-82d3-6125ddb6b798@collabora.com>
Date: Thu, 28 Jul 2022 12:48:48 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PATCH v3 2/2] pinctrl: mediatek: add mt8188 driver
Content-Language: en-US
To: Hui Liu <hui.liu@mediatek.com>, linus.walleij@linaro.org,
 robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org, matthias.bgg@gmail.com
Cc: Project_Global_Chrome_Upstream_Group@mediatek.com,
 jianguo.zhang@mediatek.com, zhiyong.tao@mediatek.com,
 sean.wang@mediatek.com, linux-gpio@vger.kernel.org,
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org
References: <20220728084951.22102-1-hui.liu@mediatek.com>
 <20220728084951.22102-3-hui.liu@mediatek.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
In-Reply-To: <20220728084951.22102-3-hui.liu@mediatek.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220728_034853_812641_518477AF 
X-CRM114-Status: UNSURE (   6.86  )
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

Il 28/07/22 10:49, Hui Liu ha scritto:
> From: "Hui.Liu" <hui.liu@mediatek.com>
> 
> Add pinctrl driver support for MediaTek SoC mt8188.
> 
> Signed-off-by: Hui.Liu <hui.liu@mediatek.com>

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>


