Return-Path: <SRS0=hubc=FK=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.3 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1 autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 51D98C4361B
	for <linux-mediatek@archiver.kernel.org>; Sun,  6 Dec 2020 05:19:25 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id A4F7622517
	for <linux-mediatek@archiver.kernel.org>; Sun,  6 Dec 2020 05:19:24 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org A4F7622517
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=huawei.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:From:
	References:To:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=Wyiz9DpOAh4Q/KI+3nksGATQjEmviuUqn76MjTPslKQ=; b=v1rEP/7UuE10IBmXhQ8p6m9D9
	+prjeujJWmBqDXrl9t+3hWxVi13gi+IZNZi8N6o/HVegNBbg0Jwlp/a21XBb770QibFqNiFu+oYsu
	tJnWMAcO5t5YINjTGSkMKBo0rSw4jPq4gv/Y9dxY2Y6GXn9aJ/GtsECSzPWL+EPy3j0IR1SHpRLeK
	bb6dOOyXoOkkDW7+qAQRWb1Qvuqs5QdoYEeGWrQeBYeNArBUiLIsj0U5YR68skqlwsCmLGr9digDs
	1uLm4MHYdkMt92AtUn9iPp/2YqOkm5IoI1Ud+uHpWzFeDNQfwtxZwJFzbYbdq+/fua+a5pu1+b4Pw
	Y++XL3bMg==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1klmRw-000812-7h; Sun, 06 Dec 2020 05:19:08 +0000
Received: from szxga07-in.huawei.com ([45.249.212.35])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1klmRm-0007z0-Fb; Sun, 06 Dec 2020 05:18:59 +0000
Received: from DGGEMS412-HUB.china.huawei.com (unknown [172.30.72.58])
 by szxga07-in.huawei.com (SkyGuard) with ESMTP id 4CpZTZ5M3qz78Jf;
 Sun,  6 Dec 2020 13:18:10 +0800 (CST)
Received: from [127.0.0.1] (10.174.177.9) by DGGEMS412-HUB.china.huawei.com
 (10.3.19.212) with Microsoft SMTP Server id 14.3.487.0; Sun, 6 Dec 2020
 13:18:34 +0800
Subject: Re: [PATCH 1/1] dt-bindings: eliminate yamllint warnings
To: Mark Brown <broonie@kernel.org>
References: <20201204024226.1222-1-thunder.leizhen@huawei.com>
 <20201204024226.1222-2-thunder.leizhen@huawei.com>
 <20201204174135.GC4558@sirena.org.uk>
From: "Leizhen (ThunderTown)" <thunder.leizhen@huawei.com>
Message-ID: <323edb53-71a7-ba81-17b9-704ae3e7a7a1@huawei.com>
Date: Sun, 6 Dec 2020 13:18:31 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.7.0
MIME-Version: 1.0
In-Reply-To: <20201204174135.GC4558@sirena.org.uk>
Content-Language: en-US
X-Originating-IP: [10.174.177.9]
X-CFilter-Loop: Reflected
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201206_001858_900435_D3EA6F42 
X-CRM114-Status: GOOD (  11.43  )
X-BeenThere: linux-mediatek@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <linux-mediatek.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mediatek>, 
 <mailto:linux-mediatek-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mediatek/>
List-Post: <mailto:linux-mediatek@lists.infradead.org>
List-Help: <mailto:linux-mediatek-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mediatek>, 
 <mailto:linux-mediatek-request@lists.infradead.org?subject=subscribe>
Cc: Ricardo
 Ribalda <ribalda@kernel.org>, Sakari Ailus <sakari.ailus@linux.intel.com>,
 David Airlie <airlied@linux.ie>, Michael Turquette <mturquette@baylibre.com>,
 Ulf Hansson <ulf.hansson@linaro.org>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 linux-kernel <linux-kernel@vger.kernel.org>,
 Thierry Reding <thierry.reding@gmail.com>, Sam Ravnborg <sam@ravnborg.org>,
 linux-clk <linux-clk@vger.kernel.org>, Fabio Estevam <festevam@gmail.com>,
 Sumit Semwal <sumit.semwal@linaro.org>, NXP Linux Team <linux-imx@nxp.com>,
 linux-media <linux-media@vger.kernel.org>,
 devicetree <devicetree@vger.kernel.org>, Pengutronix
 Kernel Team <kernel@pengutronix.de>, alsa-devel <alsa-devel@alsa-project.org>,
 Sascha Hauer <s.hauer@pengutronix.de>, Rob Herring <robh+dt@kernel.org>,
 linux-mediatek <linux-mediatek@lists.infradead.org>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 linux-arm-kernel <linux-arm-kernel@lists.infradead.org>,
 Stephen Boyd <sboyd@kernel.org>, linux-mmc <linux-mmc@vger.kernel.org>,
 Liam Girdwood <lgirdwood@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 Hans Verkuil <hverkuil-cisco@xs4all.nl>, Shawn Guo <shawnguo@kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org



On 2020/12/5 1:41, Mark Brown wrote:
> On Fri, Dec 04, 2020 at 10:42:26AM +0800, Zhen Lei wrote:
>> All warnings are related only to "wrong indentation", except one:
>> Documentation/devicetree/bindings/media/i2c/mipi-ccs.yaml:4:1: \
>> [error] missing document start "---" (document-start)
> 
> It would make life easier (and be more normal practice) to split this up
> by driver/subsystem and send a bunch of separate patches to the relevant
> maintainers, this makes it much easier to review and handle things.

Okay, I'll split this patch and send them separately. I'm not going to mark
the new patches as v2 to save trouble.

> 


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
