Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 34075C433F5
	for <linux-mediatek@archiver.kernel.org>; Thu,  5 May 2022 15:04:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=cGoy8jbkisKXFZOWB9Oe8BPk01J44QKGbFHl8h3Lj2g=; b=QWDvuCpWvJCDe2
	YTr9uQXTWooTLAN42Uy/WzCjvGTCEPESRGIjA8MF/LD0Rz2x4VGxEradcLdOiiBchZXqsbxuudxEK
	/9fLZ2BpscBRABo80n5f1FAJKqhqvPUeqPoMqp61Iovipmqk3aeOEYD02bLbde+qZOHPlT1zYdqfY
	E53k/jIG3ANuitlEXkff2bLJdWQQYTVGX29ebKAz57LbTDjDZS5OPiY3IZ42L5oMHPh9oN4NSCauv
	6utuaLGllH3NmQEGJsqjBh3lWfE/s4hO53vUbDxNdWaClTohmzfMHGcNO+ChZ65/tZlnNRhWb9RC6
	yO4xzcfus4y9uFOfQaTA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nmd1w-00GXgd-1I; Thu, 05 May 2022 15:04:36 +0000
Received: from bhuna.collabora.co.uk ([46.235.227.227])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nmd1e-00GXZE-U4; Thu, 05 May 2022 15:04:20 +0000
Received: from [127.0.0.1] (localhost [127.0.0.1])
 (Authenticated sender: kholk11) with ESMTPSA id 754D41F45912
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1651763057;
 bh=CvWL0d92LTexS+0TabDQSn5dqaw57JFYhNx34gLvT+4=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=FymySwbCbDQl4GF3l/lIkKKEPFBziW0d1hu4fmNOOGncPJRlggPbECJOkic3hNT4K
 cl9A3RkP/QPmQDeirnZHyngRLX4MiVEMNuB47cfXJDaf9/N04OxMj6DVK9KqCli+eY
 HBxIeetLXKDJqR+9jTcyxpK6KqMhCt8/Rge//og6LNx/ealuvT/J03zU0NUjfGmG+q
 S7N3hSGeKfBF8wmWRrHdtQq+dGZ9cH6VPj6PjhHU6wm9ToIptVUtdhRqPbjq4PvcSi
 k0fH6vBYIICtwFYmnIrAXhTSSAICy1h1N7HiosBncuBXhwud9Ul1ibgP5YYY7BzoAz
 z/rTsZqbcatTA==
Message-ID: <af9724fe-181d-3ba4-79b9-bf3fab1ca80d@collabora.com>
Date: Thu, 5 May 2022 17:04:14 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
Subject: Re: [PATCH v6 02/10] cpufreq: mediatek: Add
 platform_device_unregister when driver exit
Content-Language: en-US
To: Rex-BC Chen <rex-bc.chen@mediatek.com>, rafael@kernel.org,
 viresh.kumar@linaro.org, robh+dt@kernel.org, krzk+dt@kernel.org,
 matthias.bgg@gmail.com
Cc: jia-wei.chang@mediatek.com, roger.lu@mediatek.com, hsinyi@google.com,
 khilman@baylibre.com, linux-pm@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org,
 Project_Global_Chrome_Upstream_Group@mediatek.com
References: <20220505115226.20130-1-rex-bc.chen@mediatek.com>
 <20220505115226.20130-3-rex-bc.chen@mediatek.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
In-Reply-To: <20220505115226.20130-3-rex-bc.chen@mediatek.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220505_080419_146734_A778D10B 
X-CRM114-Status: UNSURE (   9.03  )
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

Il 05/05/22 13:52, Rex-BC Chen ha scritto:
> We register the platform device when driver inits. However, we do not
> unregister it when driver exits.
> To resolve this, we declare the platform data to be a global static
> variable and rename it to be "cpufreq_pdev".
> With this global variable, we can do platform_device_unregister() when
> driver exits.
> 
> Signed-off-by: Rex-BC Chen <rex-bc.chen@mediatek.com>

Hello Rex,
this commit needs a Fixes: tag.

Cheers,
Angelo


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
