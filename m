Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 96198C4332F
	for <linux-mediatek@archiver.kernel.org>; Thu, 13 Oct 2022 08:20:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ZmOQEJNbDAsDiwKXQ7lHUnlDVH5DUtcsRbLF9La9Hj8=; b=N8U4P7mOjigRNRydA1j6daarvf
	DC57zyURBuGxUH2x+kyTfPb5hJV0nK4JYJSi2xbW5gx2s1gg0ZIACL4GJMNtuDShrr4QURvuFt2OL
	oq+UFUY/YPCPtWPW+SH5vPc9S+joTel6kYJq/MI2z4Hl24iB8SGgXyWvWUudD+BaU4zSl4jGztl/C
	twEU1D9LIfHVlA5zNa9w9F8i8dyts8RqLH95V9JHnuNpr0URzze5axFMG197VnsFAUam+NDzps1Ku
	auDJIopLUfLFZ37r9XBBwVGfLs2VSKHRViMsvk6NCxTH+D4j89y/gP8Yeqo3MrF2/xIZQ07k2Da/a
	GKRG4HVA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oitRj-00B3nj-F9; Thu, 13 Oct 2022 08:20:03 +0000
Received: from madras.collabora.co.uk ([2a00:1098:0:82:1000:25:2eeb:e5ab])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oitRY-00B3jw-Rq; Thu, 13 Oct 2022 08:19:54 +0000
Received: from [192.168.1.100] (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits))
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id 106AF6600371;
	Thu, 13 Oct 2022 09:19:51 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1665649191;
	bh=aFIIWxh1y1LKHVn7Z8KItIRUC+fC0NuqzYF4pn1EXnE=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=fuhpBkBFdJNNtcjYYvWWUp8jlp3LKL4FRDZeEm7a8rytfNk+sQMtc1Slmz0SuLm9x
	 MJr728JAARg3CxFGikiMRg/O+uj2LZmRlfNQTyzNc20Ie6uSjoMu1Dg66KupCTnCjq
	 6aOQfeadD7bX/N2LLuyRlX5+Wp4ujjjtWbQgwANCEoJnmHc2peoEO96tTiDI13eWqF
	 udP2KJA8pq5wnEy61/3eLUyg4Td/gHAebZ+durW5aBehRbv9yXehJNTvRnNXCk7xyX
	 qEWhYYIhsF4ldIGvOV1F2zTSBN59tjRmzlum+kscCZR8G3yadHwXgLI2/W26Nk/v43
	 sMYBrEPBFbOxQ==
Message-ID: <7e137a24-f3e1-f519-60f3-4c8e12e2f6c6@collabora.com>
Date: Thu, 13 Oct 2022 10:19:48 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.2.0
Subject: Re: [PATCH v3 5/8] soc: mediatek: mmsys: add support for MT8195
 VPPSYS
Content-Language: en-US
To: Moudy Ho <moudy.ho@mediatek.com>, Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 Chun-Kuang Hu <chunkuang.hu@kernel.org>
Cc: linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org,
 Project_Global_Chrome_Upstream_Group@mediatek.com,
 "Roy-CW.Yeh" <roy-cw.yeh@mediatek.com>
References: <20221013020329.8800-1-moudy.ho@mediatek.com>
 <20221013020329.8800-6-moudy.ho@mediatek.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
In-Reply-To: <20221013020329.8800-6-moudy.ho@mediatek.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221013_011953_055031_DB56D5F5 
X-CRM114-Status: UNSURE (   7.42  )
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

Il 13/10/22 04:03, Moudy Ho ha scritto:
> From: "Roy-CW.Yeh" <roy-cw.yeh@mediatek.com>
> 
> Add MT8195 VPPSYS0 and VPPSYS1 driver data.
> 
> Signed-off-by: Roy-CW.Yeh <roy-cw.yeh@mediatek.com>
> Signed-off-by: Moudy Ho <moudy.ho@mediatek.com>

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>



