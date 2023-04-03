Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3687FC761A6
	for <linux-mediatek@archiver.kernel.org>; Mon,  3 Apr 2023 12:31:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=OCbJT4f1PuQVROZQSxIumGU9HeTM6IviqLr4/yfC/jU=; b=ofQRlzpMaGv42nNXtkcINOSQU+
	vSwfDfmUoRubzlvNK1GgWtzGGhdN4RShg9D0oRG3YrctU+ZyqeShOIBriEUHOgaSxteDolZCmpq56
	wPTpF5ce8biRdmQ1S/62QU/oGmKnoJNBMo//v46SJh1qVGuf2NVlUdPFuW0pP39/HxtUG3buZVeLp
	nCPujyCQdallf0I7nwdZ2ukACXECF88WlgNWEht4K83tBvbzYiVgbnBNfn6pdunKNa4lNTDJ/rBtm
	5eEqagNHCqyPPXM/srCkM6/xwBIsukOfVCGDxrClqaQKloG9F+GDuEsp29TCuGZB7V7XT9Iw3LfNV
	30td5HBA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pjJLb-00FHKJ-1j;
	Mon, 03 Apr 2023 12:31:43 +0000
Received: from madras.collabora.co.uk ([2a00:1098:0:82:1000:25:2eeb:e5ab])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pjJLX-00FHIE-1t;
	Mon, 03 Apr 2023 12:31:40 +0000
Received: from [192.168.1.100] (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id 0C79866015EC;
	Mon,  3 Apr 2023 13:31:36 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1680525096;
	bh=/rD9SAGPy66J6vfoFhFaVN4WJbqvWHJM6qbPGrEgfek=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=Ih2nysv0vMZHXiRAuIl/l7UkUx5AnzQDMZuQF8qPUo6H15HuGNVGGeDXy7vxdEg/Z
	 gE7xGtEPcQOPj6i3iBsj3XXjCVEYih3EJC4hOnhPVUL/w97e3F6oWg89j8y71onM0I
	 MWmX0CGJZpRwsfXFPTw64goi7H+XNfC1/oZjriYDgKotL0153TjxN6WSjxE+jO48UC
	 RhKYfsiaT9PX+OkieLLJYxFcK/CFg68iJlTMQvbzJ8s28LeDMtoAz3b1wlWmzZXNDl
	 7mXHekHJVhLBvX/ZtyYRUfBWITijznfn/vOoaTjC6+AT+AdWqabKvgxycM1mevHL7j
	 JGiLw8OA9Kf/A==
Message-ID: <4268fd53-9c1b-4b29-437f-5f792292e48d@collabora.com>
Date: Mon, 3 Apr 2023 14:31:33 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.1
Subject: Re: [PATCH 4/7] usb: mtu3: unlock @mtu->lock just before giving back
 request
Content-Language: en-US
To: Chunfeng Yun <chunfeng.yun@mediatek.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Rob Herring <robh+dt@kernel.org>
Cc: Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Matthias Brugger <matthias.bgg@gmail.com>, linux-usb@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 Eddie Hung <eddie.hung@mediatek.com>,
 Tianping Fang <tianping.fang@mediatek.com>
References: <20230403025230.25035-1-chunfeng.yun@mediatek.com>
 <20230403025230.25035-4-chunfeng.yun@mediatek.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
In-Reply-To: <20230403025230.25035-4-chunfeng.yun@mediatek.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230403_053139_830455_EF45848D 
X-CRM114-Status: UNSURE (   8.30  )
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

Il 03/04/23 04:52, Chunfeng Yun ha scritto:
> No need unlock @mtu->lock when unmap request, unlock it just before
> giving back request, due to we do not lock this spinlock when map
> the request.
> 
> Signed-off-by: Chunfeng Yun <chunfeng.yun@mediatek.com>

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>


