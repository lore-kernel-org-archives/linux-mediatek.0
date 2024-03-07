Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B746DC48BF6
	for <linux-mediatek@archiver.kernel.org>; Thu,  7 Mar 2024 10:33:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=LSrbJw341Av1wy4jD97zYx0fGXicPFSN24bVfnjo+O0=; b=I24jEm1P1GobbcpZEII2IWNXiA
	tnvuy3mZkjjhqHCoMSBdBx+CCZyvKLf860pz/nxT7V1aAcwFJQMOJlp/VnYNuZGkhsF6G9b+JsZXq
	R59lvuNsP0Xa+QuO+CfgajerpjTn8R6H3vevaIpHeQWdp+JaOUchdvQB6q4t6Opa1K/+jsijXkUXv
	ntlfULNQqREa25PXFRxLXGdjmw6oDDfYNZ3OhoXqX4J6p+9Zmnvl8CVJ9gFszMHnDCkxdcCPUDQ4j
	6jlxlt13hWzMDAGZu56AerQYFIlI2Yih4xrw6kTYiPAT62snHaWxoNQhSuqFGzS+bk99T55PKbjjI
	aWMCF+Ng==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1riB3v-000000046M4-3hdH;
	Thu, 07 Mar 2024 10:33:19 +0000
Received: from madrid.collaboradmins.com ([2a00:1098:ed:100::25])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1riB3m-000000046FQ-3uKp;
	Thu, 07 Mar 2024 10:33:12 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1709807589;
	bh=bBunPHKSmHGf8l/+2/CVYxGsnfGs5hi7pWNxqAObtxU=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=euxAtePErViPvAXDPjS/CT8y1c0eP4O2jbOK+Ntj2k+uP3KihT8Y9T8Ph9mWIEzVS
	 k1DL5I2VnPAlIguTwBTqNeVSAaASO2ecbbmmwUiFH6QMD02RIjuiZFqLRE52byf4LQ
	 nBymRvsQ+WNlKibzp3IyPP5xFoTPjWkbQUBKTNtW4llrB2yBx/1z0RjHBthDPNn/Cr
	 dJHTZfHLKVeB+KbbQQnAw387zZ6XhYn17J0jWWnLLUt9XnxrM2Vl6xnhwsyX7XAvE+
	 F3RY0KKrlArY0Au6jemtGEigfU3xXQ+WpO46TJXaUNCvY5mNCDSp3auKSaLPa/mKBD
	 5pHk4+yPOx1gQ==
Received: from [100.113.186.2] (cola.collaboradmins.com [195.201.22.229])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by madrid.collaboradmins.com (Postfix) with ESMTPSA id D98C837820EA;
	Thu,  7 Mar 2024 10:33:08 +0000 (UTC)
Message-ID: <a0d01d84-60de-4728-9b36-c66fb2561ba9@collabora.com>
Date: Thu, 7 Mar 2024 11:33:08 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/4] soc: mediatek: mtk-cmdq: Add cmdq_pkt_mem_move()
 function
Content-Language: en-US
To: "Jason-JH.Lin" <jason-jh.lin@mediatek.com>,
 Jassi Brar <jassisinghbrar@gmail.com>,
 Chun-Kuang Hu <chunkuang.hu@kernel.org>,
 Matthias Brugger <matthias.bgg@gmail.com>
Cc: Jason-ch Chen <jason-ch.chen@mediatek.com>,
 Singo Chang <singo.chang@mediatek.com>, Nancy Lin <nancy.lin@mediatek.com>,
 Shawn Sung <shawn.sung@mediatek.com>, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org,
 Project_Global_Chrome_Upstream_Group@mediatek.com
References: <20240307013458.23550-1-jason-jh.lin@mediatek.com>
 <20240307013458.23550-3-jason-jh.lin@mediatek.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
In-Reply-To: <20240307013458.23550-3-jason-jh.lin@mediatek.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240307_023311_139466_230DF976 
X-CRM114-Status: UNSURE (   6.64  )
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

Il 07/03/24 02:34, Jason-JH.Lin ha scritto:
> Add cmdq_pkt_mem_move() function to support CMDQ user making
> an instruction for moving a value from a source address to a
> destination address.
> 
> Signed-off-by: Jason-JH.Lin <jason-jh.lin@mediatek.com>

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>



