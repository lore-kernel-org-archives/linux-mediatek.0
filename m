Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 02531C433F5
	for <linux-mediatek@archiver.kernel.org>; Fri,  8 Apr 2022 13:39:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:References:Cc:To:Subject:From:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=fiznq3eX24P/UH82FYqIoVxgZ3MQ9mLQiE7jH3JETfg=; b=kMSvC9MqNuXwB7
	k/L7uWAKdbA9Vat2wMknqe51eyQYK0FVsSv/Fajoo0s0xoOyjOm16Ie0Jq3zIwnqYAHEARryUVDBY
	bhz0OuYrBjkGRohxKbdee5BvuXldX7TZl0fNpvEW5OLL4w8QfQu/gLNteHFA/SZTasMdkpzwpc5dd
	xl9PRo9nAW5eA+jbfjKwYqsFx6KSlQkuiRHbqySTFz2zLyxysS2nNM1MFdmrM3+8iNLXCoWBXWRHx
	D22xsdulEncyEZwiMeQHZY7VEFHm4pbYQa7IFpvg/AMpcSpfB+I3GH2d/SBvvXbTZH/eML6Ek2Vfa
	Oa5f4nE1CuCPKkezlPNw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ncopQ-00HPtL-UD; Fri, 08 Apr 2022 13:39:08 +0000
Received: from bhuna.collabora.co.uk ([2a00:1098:0:82:1000:25:2eeb:e3e3])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1ncon9-00HORX-9N; Fri, 08 Apr 2022 13:36:48 +0000
Received: from [127.0.0.1] (localhost [127.0.0.1])
 (Authenticated sender: kholk11) with ESMTPSA id 2C7A51F47188
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1649425006;
 bh=9XQVJ/N+Dc94X8yCqDsgthkWlD10Vdhk6Lt9n5h9RdI=;
 h=Date:From:Subject:To:Cc:References:In-Reply-To:From;
 b=bzXIPcJCQ7bcSuMsfdu/WYkCxdyGs7HZ1QZX8aL+AhPXJzWNSYlmTtVKF1vUKH4O2
 4WKGDlrTxU8+GHWu8rF43EVpuuRagcW2ykv7E93gITHMXlIECALOkY8pngDMPzTAF5
 yDJY9VqLa0xxBJL6NBpc104Fvwnu2OqRwNGWZ6yTgReci8cjn1QjNMh1HmSnfLh4I3
 xW1B/Sr0xKZFPj9+M4yccNuI++FqLTh9tM+Lh4vgBtAYxdPRIGK9AQfiiCY+aSyKX9
 5kjr2HXVs7UZf01nGXK5z7qF39Dj09l1Z92GKV9gaTEXl2dtkT1aaJ95n/ZQZHz0pQ
 /lPl1jSguZxHg==
Message-ID: <bcc8a0e1-144e-b9ba-9532-f54d4051d8a6@collabora.com>
Date: Fri, 8 Apr 2022 15:36:42 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Subject: Re: [PATCH V2 05/15] cpufreq: mediatek: Enable clocks and regulators
To: Rex-BC Chen <rex-bc.chen@mediatek.com>, rafael@kernel.org,
 viresh.kumar@linaro.org, robh+dt@kernel.org, krzk+dt@kernel.org
Cc: matthias.bgg@gmail.com, jia-wei.chang@mediatek.com,
 roger.lu@mediatek.com, hsinyi@google.com, linux-pm@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org,
 Project_Global_Chrome_Upstream_Group@mediatek.com,
 "Andrew-sh . Cheng" <andrew-sh.cheng@mediatek.com>
References: <20220408045908.21671-1-rex-bc.chen@mediatek.com>
 <20220408045908.21671-6-rex-bc.chen@mediatek.com>
Content-Language: en-US
In-Reply-To: <20220408045908.21671-6-rex-bc.chen@mediatek.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220408_063647_571245_CA0B3A26 
X-CRM114-Status: UNSURE (   8.49  )
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
> We need to enable regulators so that the max and min requested values will
> be recorded.
> The intermediate clock is not always enabled by CCF in different projects,
> so we should enable it in the cpufreq driver.
> 
> Signed-off-by: Andrew-sh.Cheng <andrew-sh.cheng@mediatek.com>
> Signed-off-by: Jia-Wei Chang <jia-wei.chang@mediatek.com>
> Signed-off-by: Rex-BC Chen <rex-bc.chen@mediatek.com>

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
