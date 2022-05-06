Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E855DC433F5
	for <linux-mediatek@archiver.kernel.org>; Fri,  6 May 2022 08:26:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=XjshwddHJTpFLj6K1D9wHucJPNEfop0P9JnGbvEKles=; b=uqegxDOE8fksfT
	jsogsXxcKjkjkY4RdL692xttu1ddQ21CpN7Ii1GvRa25IJjc361X6JMmzCyuoCW0VBnEie/f9zzHd
	lbZkCrCUGsoQz1UbI5JN2FhvJC3YA1JcBgQgSh4lNnvrhU6BeyLMYBueVhdfM9NoKJQ91dhiwIv0j
	R7wffYh+BMH1Hw3+h+1eJSEp7K1XR+TMJhFUiCIp9uJ52vEgtnvg9x/W9MkCH8uKFCmrjjYwr+SKk
	SQBSaYrUNa/sllmj5q/fKKLTZozVc1WuH2PwSnTVtzBcsbxgfN77ALiUIP70EhmCiN5BsHWmH9lN/
	aaUFlo1hObdp/Q5NkFag==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nmtIH-0024l2-SW; Fri, 06 May 2022 08:26:33 +0000
Received: from bhuna.collabora.co.uk ([46.235.227.227])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nmtBX-0021yv-2k; Fri, 06 May 2022 08:19:36 +0000
Received: from [127.0.0.1] (localhost [127.0.0.1])
 (Authenticated sender: kholk11) with ESMTPSA id 3899B1F406ED
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1651825173;
 bh=jOn99sFlUaon4ViUY/sVaReudul+d+g6/yvSUHH5wZw=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=P/LJ16sfqtpixZvqPPI9Eldivz8UZpG+OsTQhiEMvr+i3ngKPKTjqDJ0MdULTrcuf
 td8j1LluJTlesr9w1N/jDB9QAC1g6EiSWRlYcUTQZfOsGjRmC4E1H1ElsxHpTBr3aj
 voyGU/GwPspUaW9JtFIq5U+lvoNAubD+Ve4BS/0IXxEAi4CS56/X3qqNOhAaS3xCqE
 CYow+uNndAhyat7s2LZBek4DzvDyjfhgJzYFFLLghyf1PRm4Z9/1kuuNxXO6DP5a/o
 HjKWtvm4eU9MK8K3kE/SmYKhWvOBV79luD0WCVS+hSb56kwnZ4YTpXM4MyxZD7X1MJ
 ILBZuuKYzQ2OA==
Message-ID: <eb3884ac-56b2-4c37-05bc-82e8e44b22d2@collabora.com>
Date: Fri, 6 May 2022 10:19:30 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
Subject: Re: [PATCH v2 3/3] soc: mediatek: devapc: Add support for MT8186
Content-Language: en-US
To: Rex-BC Chen <rex-bc.chen@mediatek.com>, robh+dt@kernel.org,
 krzysztof.kozlowski+dt@linaro.org, matthias.bgg@gmail.com
Cc: runyang.chen@mediatek.com, linux-mediatek@lists.infradead.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org,
 Project_Global_Chrome_Upstream_Group@mediatek.com
References: <20220504115501.3490-1-rex-bc.chen@mediatek.com>
 <20220504115501.3490-4-rex-bc.chen@mediatek.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
In-Reply-To: <20220504115501.3490-4-rex-bc.chen@mediatek.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220506_011935_326763_71FB4D80 
X-CRM114-Status: UNSURE (   6.41  )
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

Il 04/05/22 13:55, Rex-BC Chen ha scritto:
> Add devapc data and compatible to support MT8186 devapc.
> 
> Signed-off-by: Runyang Chen <runyang.chen@mediatek.com>
> Signed-off-by: Rex-BC Chen <rex-bc.chen@mediatek.com>

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
