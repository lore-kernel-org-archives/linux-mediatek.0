Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AA722C46CD2
	for <linux-mediatek@archiver.kernel.org>; Tue,  2 Jan 2024 09:49:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=f2iRJzEo81Ok3ar+66iB59rlVx5J2gsVMp/x5tlqnQs=; b=xIEYofLF+d47EVClVHR1LP6+Rn
	bI97TpWrfiEVGAuiH0je4cgartECGGviwrTWfgQXiUMJ+9pjmo1z8jLfMT0AeIFTQzEk1kZWZXP3p
	b4xzT7loomur5nQQ6br0MG21pkFame55p9w1mHTBqZjBYu6t1EXcMMRxGB1lehhS5REXz1U+iZFrt
	8s/6HKUTPBCPpC8syT1cPXgBEKNnIZUwgGYNkvqjCJ0hrYt0HDpkq3jK70UEOmNkfOv4oWXwcco9w
	xV5ZOvR8/CERZL5yNVPbn56AP4JqAo1jcNGmSW3yzL9S7GjMXLhb6nBp4HXKq2nBJVi5LKBUW5i8V
	aB8AlMng==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rKbOQ-007VIK-2b;
	Tue, 02 Jan 2024 09:49:02 +0000
Received: from madrid.collaboradmins.com ([2a00:1098:ed:100::25])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rKbON-007VGp-10;
	Tue, 02 Jan 2024 09:49:00 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1704188937;
	bh=OvE2/2zTZsB0BNc3HMIYvB2Llo/yQBobBLmB7wWDyHk=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=b6DbzbvNyNJ7nJhUWCan2k47HMceMhwuKEP2hUhQ+4gblfG93fG9ewp4xphSWF+vL
	 vm9aUhV48RopRuY7L8eOjuXaR7PtBc8nln1iHWIEuTZaxY9cHmz9lqnFsli4pOFdMj
	 Zx/SzYVIG0Rt//XHiACwkR+9DVJZSG8MFdZC+df1o2wN3+TkL4J8+ZhYN2zoJ9yzv8
	 c9lbEtHOicuvhDctF6yJJRlFniUj7WnMvrqiNcFcZVbyHGaNNE6uFZ6mbe2dN1cQGN
	 i/dxyzD55KFP4FPnRdUdAV3/8s7VMvEwWS0zmQQ3c25qh22Q6CYcqIj21xP6PO3LaB
	 sVc+CdtMet7uA==
Received: from [100.113.186.2] (cola.collaboradmins.com [195.201.22.229])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by madrid.collaboradmins.com (Postfix) with ESMTPSA id 33C5C37813DB;
	Tue,  2 Jan 2024 09:48:57 +0000 (UTC)
Message-ID: <ae25ecf0-51fc-476c-879b-14b5bc52ad4e@collabora.com>
Date: Tue, 2 Jan 2024 10:48:57 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 2/3] soc: mediatek: mtk-socinfo: Add driver for getting
 chip information
Content-Language: en-US
To: William-tw Lin <william-tw.lin@mediatek.com>,
 Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>, Matthias Brugger
 <matthias.bgg@gmail.com>,
 Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org
References: <20231222080739.21706-1-william-tw.lin@mediatek.com>
 <20231222080739.21706-3-william-tw.lin@mediatek.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
In-Reply-To: <20231222080739.21706-3-william-tw.lin@mediatek.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240102_014859_480909_B40D8071 
X-CRM114-Status: UNSURE (   8.63  )
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

Il 22/12/23 09:07, William-tw Lin ha scritto:
> Add driver for socinfo retrieval. This patch includes the following:
> 1. mtk-socinfo driver for chip info retrieval
> 2. Related changes to Makefile and Kconfig
> 
> Signed-off-by: William-tw Lin <william-tw.lin@mediatek.com>

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>



