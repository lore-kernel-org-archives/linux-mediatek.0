Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 327B5ECAAA1
	for <linux-mediatek@archiver.kernel.org>; Mon, 31 Oct 2022 13:24:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=GObgZtJaMvW6GAIXf3KtG5joDlbYm3MR1xWoKCXOhnA=; b=OOabIoGhV47wc8lqNuTHNO8yPT
	Yl0Iw2q94cH4jKIBipkMOacXyrqDUtwR6s+FTpgWyOLmn2jaxkC4XDaoOq1AH+9T0jICphW5QlXDF
	VsfZrZIC46Qj8XHjpn8wiY9MtfB2qwNdSxjLBBk94PP0BVJceECEVUXezytYW3LQclMcNUuKVEzaq
	SSpEzz0fqgdbA3u/33L2OlIdmHubU8PTLaaGynTLpJi1JixvckCX4qhVEWt5FQf4ya4K0TtingLYq
	/NFy+CRNM7cr8Ms1hSJfBVe3zgErROjiHyL9UrjjEEr8r5p5y2W+PA2uT2NdtMGq2zoMHbAYPJwL2
	l+eMADbg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1opUlz-00C1yJ-7Y; Mon, 31 Oct 2022 13:24:15 +0000
Received: from madras.collabora.co.uk ([2a00:1098:0:82:1000:25:2eeb:e5ab])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1opUlo-00C1tQ-M0; Mon, 31 Oct 2022 13:24:05 +0000
Received: from [192.168.1.100] (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits))
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id DFBB1660037C;
	Mon, 31 Oct 2022 13:24:02 +0000 (GMT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1667222643;
	bh=FGCLVcrbsRRA9pknCacs9VnpBtBKl7pLRAKqrBSRr9I=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=VQeYkjVlii3B1a7OfsypnxmQLryaiTnyX2bIFMlhgfMG7ms4ZCmCZLGCfvkHguPYa
	 L+Py0JN9WYyg0EzcqRZ/4weiwwZxnof1vw9nGPhDTixpWcFFlOywWDoHLdfuRjcmZP
	 GVyKvrNFmmKzap3zIKqlYSDS4u+kkfjkjyQA4/WlJmzt8CE8PFZW26nJmis4H1TOds
	 MFlS0k2yVY5gOZypEqJblnePzSy9rQ9O5HuDYKDn69yCVO+WATdfiBO1PW19htAKjO
	 qetFnHp/ff4z1gU5ffmwmdE5gKkMMzM4veefna6cLiKTaSABv5Ac0spBuBue5+WYlT
	 7pEjkMxfolH6w==
Message-ID: <81072604-3c56-54e8-2f4f-ee52ba73eeae@collabora.com>
Date: Mon, 31 Oct 2022 14:24:00 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.3.3
Subject: Re: [PATCH v4 2/3] arm64: dts: mt8195: Add pcie and pcie phy nodes
Content-Language: en-US
To: Tinghan Shen <tinghan.shen@mediatek.com>,
 Ryder Lee <ryder.lee@mediatek.com>, Jianjun Wang
 <jianjun.wang@mediatek.com>, Bjorn Helgaas <bhelgaas@google.com>,
 Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Matthias Brugger <matthias.bgg@gmail.com>
Cc: linux-pci@vger.kernel.org, linux-mediatek@lists.infradead.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org,
 Project_Global_Chrome_Upstream_Group@mediatek.com
References: <20221028094317.29270-1-tinghan.shen@mediatek.com>
 <20221028094317.29270-3-tinghan.shen@mediatek.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
In-Reply-To: <20221028094317.29270-3-tinghan.shen@mediatek.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221031_062404_872535_119C51CD 
X-CRM114-Status: UNSURE (   7.36  )
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

Il 28/10/22 11:43, Tinghan Shen ha scritto:
> Add pcie and pcie phy nodes for mt8195.
> 
> Signed-off-by: Jianjun Wang <jianjun.wang@mediatek.com>
> Signed-off-by: Tinghan Shen <tinghan.shen@mediatek.com>

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>



