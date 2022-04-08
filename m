Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9A510C433F5
	for <linux-mediatek@archiver.kernel.org>; Fri,  8 Apr 2022 13:41:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:References:Cc:To:Subject:From:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=NH2+Q0PbsbqL9Z2n3FBpWP9a1Jjb7JgxuId0cLxRzYw=; b=HUZm6qiu0BRc8t
	10VIkMT8rFY/IOmt5mUwv7DsZZCWPwoeB9mxIyDO1J9+nmqJZNW1b50XNCbfqHyyqR+/tRyhPyzjX
	XPPpf5i1lWlQqX/7m/yqytcPWmaRdgpGpiEj+OAFwRGL3Mg6BlIm9r9t9wuEKBeHFM7zzj2d4qrVK
	mymOzSx4iXY7tfysTmUerHWTccwm6YnjnI4rdlpSzVXR70vHtYdX/+3Hye+cm+jSrL400Cj7O0tW/
	hvYhaNbFYH/ciJocU2lz6qPJ/lM21CJzuSlw+hZDDB0t+B8VnEMDWaHNhfZnEoqukUrLC9Mf6XWqE
	QPlJ9VGqFtfSDBA/Vixw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ncork-00HRCf-LM; Fri, 08 Apr 2022 13:41:32 +0000
Received: from bhuna.collabora.co.uk ([46.235.227.227])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nconR-00HOeq-4z; Fri, 08 Apr 2022 13:37:08 +0000
Received: from [127.0.0.1] (localhost [127.0.0.1])
 (Authenticated sender: kholk11) with ESMTPSA id 2425C1F471A5
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1649425023;
 bh=vUqOZIPLx1XwB9++8jhHrxqr5wzBNjLzr7972tFmOiw=;
 h=Date:From:Subject:To:Cc:References:In-Reply-To:From;
 b=dtJuyo9V92+nr2q94QT+uv2g+jJKYduy9fZgPSOXb8UlVadnzrlSfjpZ9iHIHeRAR
 vv9X6/7PntDhVPLu4CziVyERzNsY8P20Jz56qnAafbp1LwtlbYTTOe8uaLz6ZNdAIi
 2YsEZlXE6r3ikFSEf5Ab/9Cwv0OhHWG4dfb5HrH+wsIX4ai6Q18qsm6EJUj8XBHCZ9
 YtG6XHZbWyGYPs9PbbRxCKOhXMtn7lPyc5eUNvobxLsFhubOkSG2vXJRiCANeH57SO
 zxrXAa0ZezuctycgmZBalAZnPb3DvzDf9c56W8tpvFCzcKzN1LFZDUURXAqZtHLmpp
 mesVS/4JuNHog==
Message-ID: <8a2cf094-07f0-9497-c966-4667c51b8b0c@collabora.com>
Date: Fri, 8 Apr 2022 15:37:00 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Subject: Re: [PATCH V2 10/15] cpufreq: mediatek: Make sram regulator optional
To: Rex-BC Chen <rex-bc.chen@mediatek.com>, rafael@kernel.org,
 viresh.kumar@linaro.org, robh+dt@kernel.org, krzk+dt@kernel.org
Cc: matthias.bgg@gmail.com, jia-wei.chang@mediatek.com,
 roger.lu@mediatek.com, hsinyi@google.com, linux-pm@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org,
 Project_Global_Chrome_Upstream_Group@mediatek.com
References: <20220408045908.21671-1-rex-bc.chen@mediatek.com>
 <20220408045908.21671-11-rex-bc.chen@mediatek.com>
Content-Language: en-US
In-Reply-To: <20220408045908.21671-11-rex-bc.chen@mediatek.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220408_063705_396904_B4F5AA25 
X-CRM114-Status: UNSURE (   5.89  )
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

Il 08/04/22 06:59, Rex-BC Chen ha scritto:
> From: Jia-Wei Chang <jia-wei.chang@mediatek.com>
> 
> For some MediaTek SoCs, like MT8186, it's possible that the sram regulator
> is shared between CPU and CCI.
> 
> Signed-off-by: Jia-Wei Chang <jia-wei.chang@mediatek.com>

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
