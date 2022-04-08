Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3C84EC433F5
	for <linux-mediatek@archiver.kernel.org>; Fri,  8 Apr 2022 13:38:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:References:Cc:To:Subject:From:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=gHXREogQAyRm5Fwp3kEp6Ba2488GTbyvZ78suU7K0Yo=; b=WEhJISvaVtuIzR
	SqNyE2yz4XxRzqjZrmkhRIBxnWF74ei2UI1zgmgDyb3276cbnwhmDVNv591Db4HLbxoqCCXrHjH+3
	A5Xt/tXbgvX2oRPBA5u5I3QVfsNmu52pjUB81j+HzYeJdr3Nm7DfPGq9xD7nMxlwWFnp6Zv7qKyNO
	KOqmeaCd4Ddx7+qFV7cctOQjppTDedSgI4V1tvckpMqvp28rUnsNrugWlATdl2TQtOkMM/xEYOXbo
	x2xci8I2RZZg6U5uCGLdQM2qpOVUCRINsnXiO4pvspqL9+TCMAIdv4IixNABw5M98civ8SNekDzc/
	ac1KfXZF7V8avvUONGwA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ncoot-00HPbS-5G; Fri, 08 Apr 2022 13:38:35 +0000
Received: from bhuna.collabora.co.uk ([46.235.227.227])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1ncon5-00HOOA-Uk; Fri, 08 Apr 2022 13:36:45 +0000
Received: from [127.0.0.1] (localhost [127.0.0.1])
 (Authenticated sender: kholk11) with ESMTPSA id 157211F471A4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1649425001;
 bh=+tOnX4QIugfD+9Fhv/ALRTUmQmslQz3qMgPazBPnu7Y=;
 h=Date:From:Subject:To:Cc:References:In-Reply-To:From;
 b=FIqcdy3eJS4+vH4pOIMJwd7u3fep32bmhLVeFkb/+OrYF5FdBbkRvA9LGG2sO1Wkw
 VglK7Yng/DBr/0M8/oamz874VPqmNmIM0ZM5n1e5nAuuQnLa2qY37WUtBtaeDG8hPk
 bXRS43glG6pYxVRP50be1mze9nsyl+eZmTBaEkCMqpmL0mExixaLWaW5s+9cZ/+3UG
 sD8luUio6Xc1mCEPeve4ag3LmyJRm23N3U0VXASr7DZlGVlMwF1NJZVBzjpoWv/PPS
 kZNNkwqvxc/u0m+0b8pCkLr0cdbaAnSJhPbQcaKTLcWPsYty10rn6CbdJLa2Q8EMVV
 DQHNBi9Lux7vQ==
Message-ID: <13c1bee4-f9c0-2ca3-1f6c-ee60f090bef2@collabora.com>
Date: Fri, 8 Apr 2022 15:36:38 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Subject: Re: [PATCH V2 04/15] cpufreq: mediatek: Remove unused headers
To: Rex-BC Chen <rex-bc.chen@mediatek.com>, rafael@kernel.org,
 viresh.kumar@linaro.org, robh+dt@kernel.org, krzk+dt@kernel.org
Cc: matthias.bgg@gmail.com, jia-wei.chang@mediatek.com,
 roger.lu@mediatek.com, hsinyi@google.com, linux-pm@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org,
 Project_Global_Chrome_Upstream_Group@mediatek.com
References: <20220408045908.21671-1-rex-bc.chen@mediatek.com>
 <20220408045908.21671-5-rex-bc.chen@mediatek.com>
Content-Language: en-US
In-Reply-To: <20220408045908.21671-5-rex-bc.chen@mediatek.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220408_063644_206623_05B77955 
X-CRM114-Status: UNSURE (   4.39  )
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

Il 08/04/22 06:58, Rex-BC Chen ha scritto:
> From: Jia-Wei Chang <jia-wei.chang@mediatek.com>
> 
> Remove unused headers.
> 
> Signed-off-by: Jia-Wei Chang <jia-wei.chang@mediatek.com>

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
