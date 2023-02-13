Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E67E0C636D4
	for <linux-mediatek@archiver.kernel.org>; Mon, 13 Feb 2023 14:59:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=9KeMn9e8tJSRkpaaJjaD4HxEYEi62afZes7HLSbhQrk=; b=WyZCWiuuQwvpTqAUaI7JZitIYV
	v83+jbreeyXbERHl9SuD4aAMPFk0AsM+vNTp1Nqg+trLwhYge1i5ZzwCA24qrRQLBD4iNou7JCkw/
	PmZ9INasmMeOJu7kg6Dz1U0sTjiI/cx4KwE2jD08ZawOWvgepKSo7zeKdIZvvJfdmkIWcS7vY7r4X
	mYgA4QSUxOB/XnCsjueu6qFHjDgUrFqR2tKRGHz+ux0eJv30LzLbJspQdYy+Rgf6zMX8S3n2Wq1nF
	srx3cKX7pQeVbQiIsPOfza3gnnSDU+0UNR+J/i/uU3imVJel/TLS0Tr+Wekz203wYtIV61MgH0LLk
	oJ4p9vSg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pRaJ0-00F5El-SN; Mon, 13 Feb 2023 14:59:47 +0000
Received: from madras.collabora.co.uk ([46.235.227.172])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pRaIl-00F57j-3V; Mon, 13 Feb 2023 14:59:32 +0000
Received: from [192.168.1.100] (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits))
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id 1349F66020A2;
	Mon, 13 Feb 2023 14:59:29 +0000 (GMT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1676300369;
	bh=MVAAR+POGKgxUb9d/9L16cYTpx1kxwtwfwvhi78kve4=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=WfDy+2PvvZncwh76LKqnlhWbyBXLB8Aj0DGQn8/I2T7JJbv4hydXkytVzZIRjS0s0
	 5wMGlHlF7scmNvxTGni8GoKxk8u8NXxZz4UEKaHKt3bqOfHXJrT9zJrrodkTMBf+YN
	 U2t4bQpwEuyzSvP4GbrFQ21vtJaKzTRcUX6Z5K4X0vJOltNLO6k5wO8oZZ6o0PgGCi
	 z29jfvXwDpgHtVBHIQqc3TJ9HBEXfz6HC73LP9Tpw3l/jWhKD+xi4ZKQ+J7hHP3lrE
	 NIcohd1cRtBVuWmzz1+40KhpsA5i/eauFOCE3nEIpUf/cg64D4GJb+yiZD6pXczTz4
	 wN+bs3fJbGoTA==
Message-ID: <32a41b0f-48e2-a87b-9736-1e10fe8859d9@collabora.com>
Date: Mon, 13 Feb 2023 15:59:26 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.2
Subject: Re: [PATCH v6 09/12] remoteproc: mediatek: Setup MT8195 SCP core 1
 SRAM offset
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
 <20230213033758.16681-10-tinghan.shen@mediatek.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
In-Reply-To: <20230213033758.16681-10-tinghan.shen@mediatek.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230213_065931_327261_520737B0 
X-CRM114-Status: GOOD (  12.11  )
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
> Because MT8195 SCP core 0 and core 1 both boot from head of SRAM and
> have the same viewpoint of SRAM, SCP has a "core 1 SRAM offset"
> configuration to control the access destination of SCP core 1 to boot
> core 1 from different SRAM location.
> 
> The "core 1 SRAM offset" configuration is composed by a range
> and an offset. It works like a simple memory mapped mechanism.
> When SCP core 1 accesses a SRAM address located in the range,
> the SCP bus adds the configured offset to the address to
> shift the physical destination address on SCP SRAM. This shifting is
> transparent to the software running on SCP core 1.
> 
> Signed-off-by: Tinghan Shen <tinghan.shen@mediatek.com>

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>



