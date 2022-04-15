Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D6BE3C433F5
	for <linux-mediatek@archiver.kernel.org>; Fri, 15 Apr 2022 12:27:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=HRU9Wn7qLnkBElLp9mFj9sH+6yfyxLXlYDGsH/hC9gE=; b=fXvh6COo4nUYDp
	VTYpFVNbdZF+0kO6cGVUVUB7b6jk/voAsC8A6dOgmSTmY7CUCh1peELH8x9CqPrLFY7/tePZKyK5j
	ov6WY/W0sHLK9VOt+Ds3rJ/7fy+H0ddMH43in2Jbv+0rnkpaNyp+iK1EoyjnX1sMKyxiBY4qi9Jaj
	UnlIBGif3jnMHfk8GoYX+Qh6B9pRk3f3oH0RzHnpLJ9SUQZC46FfN1lpedxc9OceVqONSByt4cQDX
	5t2S3sOJIt/810OyIc5JXYq4EdSqy3yiZKnJyM5DOYfq9iRIQqSfqq4FgLL9orbHT6sBpiAefEru4
	BZ0GHhyKsBo2Atvb9SUQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nfL2i-009yLE-T4; Fri, 15 Apr 2022 12:27:16 +0000
Received: from bhuna.collabora.co.uk ([2a00:1098:0:82:1000:25:2eeb:e3e3])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nfL00-009wOu-6c; Fri, 15 Apr 2022 12:24:29 +0000
Received: from [127.0.0.1] (localhost [127.0.0.1])
 (Authenticated sender: kholk11) with ESMTPSA id BCD431F47E0F
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1650025467;
 bh=6Z+gWy9qIs5W0hqsy0FIxSakYLRz+BXCwJ6EprEUa2c=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=Paj4zcJG2Xe9RP8XaVi2C+ydlxAxfCUITLHVzfag8SfMH+Au8N0hhwwUKQ8VDOuQO
 5ep+3UL62D8S23GqLbmJEtyY9OBUCmrQWiMOG+v+tlf270fivWoQjPPfrntTwVHGFI
 lnom6cW1Iy2/ZGl7U3xCV3mIC4Kr62HRRXrzkOowaNklV+xnMhhySA8uHQdO9L2gXS
 b5Kdic8/5BpfxkdSiiogCMuePNOKJLTDlsfpuCAvqWPVgmeWv7QmMhnhYLvgTGRYLv
 mCkKvdKWle1EP2QQFvZd61UUMC26sPmLLCpnBmKlXLPf1zt8kiD0ZS/PGGpCMDneRd
 e+eNl7EPqS1SA==
Message-ID: <bcaeefa7-82e9-b40a-faac-a51bc78d9481@collabora.com>
Date: Fri, 15 Apr 2022 14:24:23 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
Subject: Re: [PATCH V3 02/15] cpufreq: mediatek: Use device print to show logs
Content-Language: en-US
To: Rex-BC Chen <rex-bc.chen@mediatek.com>, rafael@kernel.org,
 viresh.kumar@linaro.org, robh+dt@kernel.org, krzk+dt@kernel.org,
 matthias.bgg@gmail.com
Cc: jia-wei.chang@mediatek.com, roger.lu@mediatek.com, hsinyi@google.com,
 khilman@baylibre.com, linux-pm@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org,
 Project_Global_Chrome_Upstream_Group@mediatek.com
References: <20220415055916.28350-1-rex-bc.chen@mediatek.com>
 <20220415055916.28350-3-rex-bc.chen@mediatek.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
In-Reply-To: <20220415055916.28350-3-rex-bc.chen@mediatek.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220415_052428_419207_CDCBC11B 
X-CRM114-Status: UNSURE (   5.77  )
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

Il 15/04/22 07:59, Rex-BC Chen ha scritto:
> - Replace pr_* with dev_* to show logs.
> - Remove usage of __func__.
> 
> Signed-off-by: Rex-BC Chen <rex-bc.chen@mediatek.com>

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com



_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
