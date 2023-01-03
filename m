Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8E702C46467
	for <linux-mediatek@archiver.kernel.org>; Tue,  3 Jan 2023 14:37:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=yscCcyKPjSTZE+VDsJHtpV3DIMn6waAkI+60V27owtw=; b=b1DUWUKLfm/e4pAJeUpMWCi66z
	G0wluWIOWbY8u+h2yIGMgMWnVStqCcsVfHAv3o0jjSChlKR1aw8S58BnF72S7YUc6zy6iCCjyDBFI
	U2cy8RPekxRxzlHi1wZTg5aIpszsC2G1pmSpUXkA8Vo98mQXzPS7gqbxLZXyTc1Dye5dVW13yvRL/
	8d/qNS9pv89YRTM/RLbbNItz+VJoTXs+367jLWbeBe8x63/gEk8bfTd8NSXaiBNxGuDnQhGhbmqpW
	QtrNaVdZnYcTlLaWtFhEhsRwacHWNHLP2ZvI1I1y0OqHJ3VdYZa4PLAguoM3IyNxfh+E2U1YklLfW
	OuXDSEDw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pCiPd-00226P-RX; Tue, 03 Jan 2023 14:37:10 +0000
Received: from madras.collabora.co.uk ([2a00:1098:0:82:1000:25:2eeb:e5ab])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pCgjl-001LTx-Cf; Tue, 03 Jan 2023 12:49:50 +0000
Received: from [192.168.1.100] (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits))
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id 81F7B6602CF9;
	Tue,  3 Jan 2023 12:49:47 +0000 (GMT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1672750188;
	bh=Dav1vDwLoGDp9ZF7vLWHeFVk9edqKnGsWzKrSp/svGY=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=i+SKhCQ024xh1rUDOqBBXtkiV5DLj3fCCNygvxSNoD/zWtwQ2J903Mt9EY0ihR3az
	 kqN6BFFewFv3rUb6WmaRVao7uK2eqd2s//7EAp1VftO4TB3z0PZwTPPiu1iK7DL2Ez
	 YDW+GVcxPRPyXOSCZXEWRDyyyKVlYiLyS0G3oVlu87684cBfvE4H+tV7xQsqFHbrVA
	 ys5wtjCZaJMtJWCYHEuoIMYjYfVFE7+YfA7SziR/EoPzh8MXSm2RcUaNfXvuC//K6q
	 SXXJNeLVcSmqX2cuiXeTXD8xQL6kBh0McVBvKXr4dapR+E0zRAtQlS42DHDRFNWdNB
	 o2XnGSd4uf1RA==
Message-ID: <863ea43a-b32f-ae63-d863-6e97f3a67626@collabora.com>
Date: Tue, 3 Jan 2023 13:49:45 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.0
Subject: Re: [PATCH v1 07/13] soc: mtk-svs: mt8183: refactor o_slope
 calculation
Content-Language: en-US
To: Roger Lu <roger.lu@mediatek.com>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 Enric Balletbo Serra <eballetbo@gmail.com>, Kevin Hilman
 <khilman@kernel.org>, Nicolas Boichat <drinkcat@google.com>
Cc: Fan Chen <fan.chen@mediatek.com>,
 Jia-wei Chang <jia-wei.chang@mediatek.com>, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org,
 linux-kernel@vger.kernel.org, linux-pm@vger.kernel.org,
 Project_Global_Chrome_Upstream_Group@mediatek.com
References: <20221226094248.4506-1-roger.lu@mediatek.com>
 <20221226094248.4506-8-roger.lu@mediatek.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
In-Reply-To: <20221226094248.4506-8-roger.lu@mediatek.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230103_044949_608991_E5D9EC43 
X-CRM114-Status: UNSURE (   7.83  )
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

Il 26/12/22 10:42, Roger Lu ha scritto:
> The o_slope value is dependent of the o_slope_sign, refactor code to get
> rid of unnecessary if constructs.
> 
> Signed-off-by: Matthias Brugger <matthias.bgg@gmail.com>
> Signed-off-by: Roger Lu <roger.lu@mediatek.com>

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>



