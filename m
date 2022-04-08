Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7F890C433FE
	for <linux-mediatek@archiver.kernel.org>; Fri,  8 Apr 2022 13:37:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:References:Cc:To:Subject:From:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=jP6PZpbmxFdpkHMdItpujHkkoE9KxhBXepk2aKCtOi8=; b=J3dYHipN5Nx8ck
	q4k8BRmr0lem3ekL009bj30QpyEnax8OHOaxSvUjyzyiGx89CUNbrRBfOQwiRaA8q/rx022yvhAEL
	It9OZuHc0iTkjwA4V5kBfZ8rHJKxaEimf7EG9AZ1rIO9HD6PMM9Qxw2ibejdgOUbH1gDPczA1JD6g
	Xq23YkFAQ9p5iLNoDBOwd8LIHuVoeU9x1YQcLrE1wWy5Ba850jVGaOK4bHFbippa/colfRuyHEi9H
	zT824+oiCsCOVFwS+rmr2MniMxh1giHB0CCz2LLE+ZN8mPXWaBTinMoMoTB+iF0lo8GHXNMzOH2zk
	9w1dzUnM9YosN4F87iSQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ncooB-00HPAl-EW; Fri, 08 Apr 2022 13:37:51 +0000
Received: from bhuna.collabora.co.uk ([2a00:1098:0:82:1000:25:2eeb:e3e3])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1ncon0-00HOL2-JH; Fri, 08 Apr 2022 13:36:40 +0000
Received: from [127.0.0.1] (localhost [127.0.0.1])
 (Authenticated sender: kholk11) with ESMTPSA id 491E81F47188
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1649424996;
 bh=f5u2GvC9CzdV3mcoeppQOwz7zeKj9pHJtOGbBCnnxtA=;
 h=Date:From:Subject:To:Cc:References:In-Reply-To:From;
 b=mBaVNi+0gfbD4VAiI5W5iAPsGTmzsSZcR+omXo070mKOtvbQklF38Gw2DSWxXrW+0
 Y8clEazOcBWQw+/q2VVTY5Ik5EgOC4AkKaGFm+X2IcJ5gAOIttgB9ZluBy0xD91IWP
 zJxtjkMRgktQQo1zounRwEyFn/9k+n3WijFhlSJAub8IOLN/IOkJa6i52NL6lu5gtR
 9WQ1B9MRNsY5/mausBxVgpe9NJdAq9+QrZnTMiYs6BF1rSpH8GrrXcMAWXG1VLtUDV
 /Nw3RH0PnLT1ohKa0knazORKVuw3EAPS1CfH8Njm5Y5XJwZiWHV6ic72n/aRo0ahUn
 rAO9DvMQWyc9w==
Message-ID: <1e3338a6-d1db-6ae1-2cd2-d45a4babc844@collabora.com>
Date: Fri, 8 Apr 2022 15:36:32 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Subject: Re: [PATCH V2 02/15] cpufreq: mediatek: Use module_init and add
 module_exit
To: Rex-BC Chen <rex-bc.chen@mediatek.com>, rafael@kernel.org,
 viresh.kumar@linaro.org, robh+dt@kernel.org, krzk+dt@kernel.org
Cc: matthias.bgg@gmail.com, jia-wei.chang@mediatek.com,
 roger.lu@mediatek.com, hsinyi@google.com, linux-pm@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org,
 Project_Global_Chrome_Upstream_Group@mediatek.com
References: <20220408045908.21671-1-rex-bc.chen@mediatek.com>
 <20220408045908.21671-3-rex-bc.chen@mediatek.com>
Content-Language: en-US
In-Reply-To: <20220408045908.21671-3-rex-bc.chen@mediatek.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220408_063638_912260_CDA50BEE 
X-CRM114-Status: UNSURE (   6.55  )
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
> - Use module_init instead of device_initcall.
> - Add a function for module_exit to unregister driver.
> 
> Signed-off-by: Jia-Wei Chang <jia-wei.chang@mediatek.com>

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
