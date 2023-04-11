Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6795EC76196
	for <linux-mediatek@archiver.kernel.org>; Tue, 11 Apr 2023 08:28:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=SQeO89ozGxkBkEsM+odu7VCaQ3h+zIvykuXbxijVU0M=; b=Vudch66ncRUtrb2WwH3Lrw9n2x
	5RxGbNS3Z9DnThfyFbkYAfJa+40s4NIP9olMemx/Cj282IwynfytEUIitR0yP4WL9DhRXjkYC2Gll
	eI0gLgVV2m7900ynE1aBMrpBK7TSaWcSa9AFv4KI0F7lXLZUMWZdOevsCYitAT1ituQ4CzxbANMBo
	Xy9oI3QkKwmG2nIqkSNsg62oO8MHSUKH3T7Hg0Sy/ryPHvPY5i5+UcMyQKSI0ZlOCe9FcNNyR0W9K
	riPtcgorZLP0qCIX+0fbICK1dKHBm7RwYVMDNNW5wR0Ws0Rt+r8atww5vDRcpkrlEQvItfG2/cBkq
	litceLqw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pm9MX-00Gskx-1z;
	Tue, 11 Apr 2023 08:28:25 +0000
Received: from madras.collabora.co.uk ([46.235.227.172])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pm9MT-00GsjT-2R;
	Tue, 11 Apr 2023 08:28:22 +0000
Received: from [192.168.1.100] (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits))
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id C4E2D66031E2;
	Tue, 11 Apr 2023 09:28:19 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1681201700;
	bh=zR5A2y0u1pon3797Cdyl90Wk9kLNd3D+9zTfEkqtCoo=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=GWjt4Vu09C8UQp7IpbPt2j2WrG7FzI/rvSbJo57LQJwS644ZOPOSl/C9kANZpJuPU
	 ZdC/yhUepN4nEL+ZY2JDENJc7VVIc571vsiQQX0rZyr9o/d/gt5xRH1nURnYt++W4p
	 rPv3JTnv3NXbocfpRqMschY6o+GvuyohuV9/KUUR/23YFsLy+UQB/YA0HACcMoE5X2
	 cg8owKl9K7flK/I0sOi1odVOg0nraS1ImtVvZ9F4xUYzHQG0ZToDYVAaPYzbo2jfdD
	 zQTkEzxP18pYYySxE/PoGxCxAHSm+Hq4GpZzxxh2+iUQXFiMDUrdPxslM1IsCKHm4H
	 BEu2FZgzJdvow==
Message-ID: <ef108434-1956-d488-c6f6-535d66ba6603@collabora.com>
Date: Tue, 11 Apr 2023 10:28:16 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.1
Subject: Re: [PATCH v2 1/3] memory: mtk-smi: mt8365: Add SMI Support
Content-Language: en-US
To: Alexandre Mergnat <amergnat@baylibre.com>, Yong Wu
 <yong.wu@mediatek.com>, Krzysztof Kozlowski
 <krzysztof.kozlowski@linaro.org>, Matthias Brugger <matthias.bgg@gmail.com>,
 Rob Herring <robh+dt@kernel.org>
Cc: linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org
References: <20230407-smi-driver-v2-0-8da6683cdb5c@baylibre.com>
 <20230407-smi-driver-v2-1-8da6683cdb5c@baylibre.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
In-Reply-To: <20230407-smi-driver-v2-1-8da6683cdb5c@baylibre.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230411_012821_922508_9B83B5D4 
X-CRM114-Status: UNSURE (   7.00  )
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

Il 07/04/23 11:13, Alexandre Mergnat ha scritto:
> Add MT8365 SMI common support.
> 
> Reviewed-by: Yong Wu <yong.wu@mediatek.com>
> Signed-off-by: Alexandre Mergnat <amergnat@baylibre.com>

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>



