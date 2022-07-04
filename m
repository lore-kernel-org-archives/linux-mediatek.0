Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7DC36C43334
	for <linux-mediatek@archiver.kernel.org>; Mon,  4 Jul 2022 11:18:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=sa8QRzcJ1PCEXvqx21XKnSLb/IaQajG0tZykZIWUlrQ=; b=Tpjo1NYArlKV58Aez1g9g5AfbK
	5Rqy/svoHtEYuJ+0tGNxM2CqpUsDcZ2ryZnxaWbXQXCHqHLRIdrzIja4zZ0Ea0hGx3i/Oyi2G+a2W
	NfJqkBjO0HT/ezvCpkAw7X4G8XC6wDLxpfz8iTnnWYsr65zIeWd0NFM8gsELa9NI18Twm56kCsmT8
	sMXJicGf3whX4veDqG96byqn3WE614nEIvpdb1ymaGEp7OjGTIMt4dhyfgDst90n6+LLB4HvJP5kA
	cLhVQ/lheBE2RUQEp6l9GCPxsCaJgK53VLAaAjQKjGEOKjeTb0sCgq1qR9SGVtJY3A2TD57MsL9Z4
	tSHB4Lqg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o8K66-007c2r-5z; Mon, 04 Jul 2022 11:18:34 +0000
Received: from madras.collabora.co.uk ([2a00:1098:0:82:1000:25:2eeb:e5ab])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o8JWD-0077oC-MK; Mon, 04 Jul 2022 10:41:31 +0000
Received: from [192.168.1.100] (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits))
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id 7F3BE6601987;
	Mon,  4 Jul 2022 11:41:27 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1656931288;
	bh=LL/n3GPAuDdNhREU+FWUQSZmRh57acNgvIGkF1czuv4=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=DjCzIisRVqSrR31WKiNO11au6koHVyx7SzuzBq10Mw1HUsyPz4sb1tJGJ7LQVroxR
	 eYTG0AghWV7HL5IM70Y6N7W5Hz2qIVvO3y+HnP8E+8t4SrxPZERKPlD4/I4zJLwaW/
	 w3l3ZReM1yz/8rQWDxI+p7kWlgCKMO2cMLKi/IM5sqQK1+tVl7hQ/jbLpKFbOVZkdf
	 aK107u0zs45SyE+O0l9t3eHENbhIIOHH7xJ4DD0VXATv/WTDzxr8VocXtknHgnq6sT
	 8hTlNDdFRBd3sDqtqQPz1kWTQrmUMPcQDsN28X4tkhuYQbnTfSfIgxVqRmvR5VApTR
	 1BqPxqwYp8F9Q==
Message-ID: <97834627-a2c2-71d2-5a96-4b59c5856dd3@collabora.com>
Date: Mon, 4 Jul 2022 12:41:25 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.10.0
Subject: Re: [PATCH v1 09/16] arm64: dts: mt8195: Add spmi node
Content-Language: en-US
To: Tinghan Shen <tinghan.shen@mediatek.com>, Yong Wu <yong.wu@mediatek.com>,
 Joerg Roedel <joro@8bytes.org>, Will Deacon <will@kernel.org>,
 Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 Chun-Jie Chen <chun-jie.chen@mediatek.com>, Weiyi Lu <weiyi.lu@mediatek.com>
Cc: iommu@lists.linux-foundation.org, linux-mediatek@lists.infradead.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org,
 Project_Global_Chrome_Upstream_Group@mediatek.com,
 Henry Chen <henryc.chen@mediatek.com>
References: <20220704100028.19932-1-tinghan.shen@mediatek.com>
 <20220704100028.19932-10-tinghan.shen@mediatek.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
In-Reply-To: <20220704100028.19932-10-tinghan.shen@mediatek.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220704_034129_925358_362653E2 
X-CRM114-Status: UNSURE (   8.01  )
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

Il 04/07/22 12:00, Tinghan Shen ha scritto:
> Add spmi node to mt8195.
> 
> Signed-off-by: Henry Chen <henryc.chen@mediatek.com>
> Signed-off-by: Tinghan Shen <tinghan.shen@mediatek.com>

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>


