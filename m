Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 99760C07E9D
	for <linux-mediatek@archiver.kernel.org>; Tue, 27 Sep 2022 11:06:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=YoP0iJI4foWfryCoJTWN03TBnFQ1b6aTjxGQpRFcgGc=; b=sfKvIPFTY7TGukWCHQpTfHUOmG
	rrAO+Q5cBbU1K0DQFYNx/gUcuCTTK7HKo0qLt4H/xiiIXwP6PFG4O9ouqeOpviYihY3dL/R+tvI4r
	a/ENiLmBZIXS1F2oIHyowxK9FUVaO2OZU2LrJ20jgPFe89zR7+HHbpTjD+SIymf5eKm13Ws3G28Gg
	ZCq7R0XLBtK3LQ4iRqT++6FhAYJrMfINMgbGbr/A8wr2NbSgq7955BshN/Y6RxCSsZJZ76U/c0qRm
	Svl0dh/+Ekmxvxl07k3otYIys8hHV/mHyVzvntewdur+BvFonWrG5Q/LDWhA78xwvSlg8b3yK1S/T
	BxJx4jQw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1od8PR-00A3fN-SF; Tue, 27 Sep 2022 11:05:53 +0000
Received: from madras.collabora.co.uk ([2a00:1098:0:82:1000:25:2eeb:e5ab])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1od8O7-00A2uS-AH; Tue, 27 Sep 2022 11:04:32 +0000
Received: from [192.168.1.100] (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits))
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id E5D496601F41;
	Tue, 27 Sep 2022 12:04:28 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1664276669;
	bh=MGGRSFV4QKZ64S297uy7PnxQS7sY2jyybyoCgu9gy38=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=J95bXywUFI/OUUcoPV975N4k06sRbpqvUJRyFV0TEx/GPmwwlvTcKmu+xtjWC+2bE
	 wAA04Ysw7x4/Ac5gewLwtJHBjxv3lxPHXSZ+85bP+qLuTp64JNyTQQaQyE7KIgSUIt
	 rIQ0qAMuKDsGaopQvE5OtM6h8D4GdDhuuH0G2Jq/wlcnXKEKeNUlfyaSA+THYy3uK4
	 YIbExeus54XILWgapy1lmkrMXj+APPKTtJz+YH9fQ8x2k2yDHYjbEdT/W+e0LLVa90
	 nLNeYJb6TMOMZbE19M2D3x8OxQfhE3PsMZJCWIc04LE1oilZFEv/q5ekQGR3NhuzhC
	 n/NGrgBp2+o/g==
Message-ID: <cb7ca8a8-14b4-0929-fd05-d37c47285176@collabora.com>
Date: Tue, 27 Sep 2022 13:04:26 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.2.0
Subject: Re: [PATCH v3 05/11] remoteproc: mediatek: Add SCP core 1 register
 definitions
Content-Language: en-US
To: Tinghan Shen <tinghan.shen@mediatek.com>,
 Bjorn Andersson <andersson@kernel.org>,
 Mathieu Poirier <mathieu.poirier@linaro.org>,
 Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 Tiffany Lin <tiffany.lin@mediatek.com>,
 Andrew-CT Chen <andrew-ct.chen@mediatek.com>,
 Yunfei Dong <yunfei.dong@mediatek.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: linux-remoteproc@vger.kernel.org, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org,
 linux-kernel@vger.kernel.org, linux-media@vger.kernel.org
References: <20220927025606.26673-1-tinghan.shen@mediatek.com>
 <20220927025606.26673-6-tinghan.shen@mediatek.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
In-Reply-To: <20220927025606.26673-6-tinghan.shen@mediatek.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220927_040431_539235_E3DD3C39 
X-CRM114-Status: UNSURE (   7.74  )
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

Il 27/09/22 04:56, Tinghan Shen ha scritto:
> Add MT8195 SCP core 1 related register definitions.
> 
> Signed-off-by: Tinghan Shen <tinghan.shen@mediatek.com>
> Reviewed-by: Mathieu Poirier <mathieu.poirier@linaro.org>

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>



