Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CDD28CDB47E
	for <linux-mediatek@archiver.kernel.org>; Thu, 12 Oct 2023 13:11:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=r5dDfzp8LqUtb51WOABNwcgD43msNqzmUCo0K+JOCjU=; b=MUdwsQoNr8KSJ4NmpF4huKmE+V
	NsGWZQ2SGThLXzjEhxRpA13U83T8WTGrIVnWq456ZQx6TVNJOUv4nb1fQqOQxheyw0c6DH1dLB6PG
	8K2r3pTpBRU/IH6VIhYtUtp7bK1NFJyp+P8K4LAlV80wz/hj8Ch53uRGUwc/cqskoobpIjiZHJkgl
	nxzCCISf0QNimUJ61kzfOdDsyzSgCmvTncMYmWDi17DT/nh7/OvWoljTHjkRaRAn6yoIEXyLCVLNs
	W/PlwHoG8bBRTIjk95EfuvwH5lVCF8k/NNfb5hcQivL/PtwZpXCmms54QcCGbjWHwPioeMO8WtPfQ
	M1WtS2xw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qqvT7-00137B-2D;
	Thu, 12 Oct 2023 13:11:13 +0000
Received: from madras.collabora.co.uk ([46.235.227.172])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qqvT0-00135R-12;
	Thu, 12 Oct 2023 13:11:11 +0000
Received: from [192.168.1.100] (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits))
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id 26A01660734A;
	Thu, 12 Oct 2023 14:11:04 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1697116264;
	bh=8TGPKtAK3pMPkVljBf/J5sPx4RaW1Xn2qBY/TA8G2Lg=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=AjKwI03lrIrJJKAeT8zI3uJoBYB5+g1ZHXTClSak9O8YFF6mEUnsdrsh/EYVfmKow
	 /T8MEzzKj7tqHn/0bB3O//UhozGa6XJNexAzoYig7HMAB1HMvPU0zgeVk9mzzyxNxS
	 37VybFuIN2R44AmchDNO1DQQ/H4XtJnUi1VtV2xU56AwbSrn8pVzmPlZqzhwsplbTU
	 brv7P9LLmRq6WQEE7WNdwyI/uSGB3JWPLhRG+JgrpF121emZUQyr/jZcULhTMfZf/H
	 avZquwgMYXVhuiWPvGwCqxXeAIhX8IUcCMinbBYeQgRFt2ayfk7164AZ2xWIYmqj3V
	 Up5vGhu/403tg==
Message-ID: <592a17cf-b612-bfba-8bac-ff4322448409@collabora.com>
Date: Thu, 12 Oct 2023 15:11:02 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.15.0
Subject: Re: [PATCH v7 00/12] add support MDP3 on MT8195 platform
Content-Language: en-US
To: Moudy Ho <moudy.ho@mediatek.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 Ping-Hsun Wu <ping-hsun.wu@mediatek.com>,
 daoyuan huang <daoyuan.huang@mediatek.com>,
 Hans Verkuil <hverkuil-cisco@xs4all.nl>
Cc: linux-kernel@vger.kernel.org, linux-media@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org
References: <20231012091206.20165-1-moudy.ho@mediatek.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
In-Reply-To: <20231012091206.20165-1-moudy.ho@mediatek.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231012_061106_527340_46592BB2 
X-CRM114-Status: GOOD (  10.16  )
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

Il 12/10/23 11:11, Moudy Ho ha scritto:
> Changes since v6:
> - Rebase on v6.6-rc5.
> - Dependent dtsi files:
>    https://patchwork.kernel.org/project/linux-mediatek/list/?series=792079
> - Dependent bindings:
>    https://patchwork.kernel.org/project/linux-mediatek/list/?series=792477
> - Move the patch that fixes compile warnings from this series and
>    create a separate standalone patch.

You forgot to mention that moving that patch added a dependency of this series
on .. that patch, at [1].

[1]: https://lore.kernel.org/r/20231012091206.20165-1-moudy.ho@mediatek.com

Cheers,
Angelo


