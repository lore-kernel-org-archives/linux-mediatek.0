Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 36F9FC433F5
	for <linux-mediatek@archiver.kernel.org>; Thu, 19 May 2022 11:13:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=t8Q1MNnFH69p7HtF93Fd3eGGqTWEJXJLQSxz4VOtlpU=; b=KZkUO9jRHqn9Ku
	eRzgaqnXtCLs6uwgGu0T3MlPb3yhy/cMm9wNRRr1N4sq0jRnFiKLvuErRxQMbUMstJQ47jpO/yHRB
	aWgZubCy65FiwPWT8QeA0MM0FsjQ1HSTKhCUBb4K8tjVTJfa4z3KLTQkqBO0MHUY6NtuHOvx87OJY
	VHYPRoLVSIGSLUPOSwaIoLb4PLWIzW4qSL+gFp4SFfmgl43KGvYLKZj0NmkLM0XkzjShvDw6TPR63
	xPCE/UuyUuyPeA5COKMFUvWbTRsAui/h4ugm8NUUNbaqD2imL+VZjis8p9o9iif5NcJf+ZlJUGFnS
	cjctKl5/KIitA6h58z0w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nre5V-006Pce-Vn; Thu, 19 May 2022 11:13:02 +0000
Received: from bhuna.collabora.co.uk ([46.235.227.227])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nre5L-006Pb3-LQ; Thu, 19 May 2022 11:12:53 +0000
Received: from [127.0.0.1] (localhost [127.0.0.1])
 (Authenticated sender: kholk11) with ESMTPSA id 6A87D1F45A60
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1652958770;
 bh=0vp1+rP2qL80xLM2XgWzvi9l9uo7sa3pk6bo6A5h2Vo=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=f2B4bry+j0yvryUxmZg2H1K29X9GmcJfHZDBxvFkIq4B/tq75Xpgqt7B3spqBjSiT
 L6yqlvRU4XTH0XdMMaPu79pdpFTMut6BAObhrgr6H/Z7qaxI0GDCXDqTj+IhNW3giX
 t8jVGzI7dtz5WWnabWZFjmdtVnJ6RT7m8BZ2oHQDTlkqkdRsW7CNH1Li2ichemwnX0
 nQL1W8xHPX1BeOMgXbulyE2fJKLGe3q5lRJcVN/TlQ1kqFhKHEqY7X04MnN5noKuI3
 HOwS6U/KHnqLCrf+AMO10ISvuOx6R2NVuBBoZ41pEcL3i+NCs14z84Qs02ebCYZIo6
 uvw+sUDCTVJ+g==
Message-ID: <aed584c0-f097-fdef-8078-a7c457d1cb1a@collabora.com>
Date: Thu, 19 May 2022 13:12:46 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.0
Subject: Re: [v10 1/1] thermal: mediatek: add another get_temp ops for thermal
 sensors
Content-Language: en-US
To: James Lo <james.lo@mediatek.com>, "Rafael J . Wysocki"
 <rafael@kernel.org>, Daniel Lezcano <daniel.lezcano@linaro.org>,
 Matthias Brugger <matthias.bgg@gmail.com>, linux-pm@vger.kernel.org
Cc: linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, 
 linux-kernel@vger.kernel.org,
 Project_Global_Chrome_Upstream_Group@mediatek.com,
 Fan Chen <fan.chen@mediatek.com>, Louis Yu <louis.yu@mediatek.com>,
 Michael Kao <michael.kao@mediatek.com>, Hsin-Yi Wang <hsinyi@chromium.org>,
 Ben Tseng <ben.tseng@mediatek.com>
References: <20220519101044.16765-1-james.lo@mediatek.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
In-Reply-To: <20220519101044.16765-1-james.lo@mediatek.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220519_041251_872644_2DD8BCF0 
X-CRM114-Status: UNSURE (   8.80  )
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

Il 19/05/22 12:10, James Lo ha scritto:
> Provide thermal zone to read thermal sensor
> in the SoC. We can read all the thermal sensors
> value in the SoC by the node /sys/class/thermal/
> 
> In mtk_thermal_bank_temperature, return -EAGAIN instead of -EACCESS
> on the first read of sensor that often are bogus values.
> This can avoid following warning on boot:
> 
>    thermal thermal_zone6: failed to read out thermal zone (-13)
> 
> Signed-off-by: Michael Kao <michael.kao@mediatek.com>
> Signed-off-by: Hsin-Yi Wang <hsinyi@chromium.org>
> Signed-off-by: Ben Tseng <ben.tseng@mediatek.com>
> Signed-off-by: James Lo <james.lo@mediatek.com>

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
