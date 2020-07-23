Return-Path: <SRS0=cyKo=BC=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-11.5 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,
	URIBL_BLOCKED,USER_AGENT_SANE_2 autolearn=unavailable autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E763BC433DF
	for <linux-mediatek@archiver.kernel.org>; Thu, 23 Jul 2020 11:47:30 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id B49FB20825
	for <linux-mediatek@archiver.kernel.org>; Thu, 23 Jul 2020 11:47:30 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="2Uzzs5vb";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b="hoGU7ecv"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org B49FB20825
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Date:To:From:
	Subject:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=uiqcgEj6fQdFojflUO+ihJHc2X4HunV4hXYDVRpkHhE=; b=2Uzzs5vb6mFMN4AlWj+w+AV9g
	n15w+Xpui8WH0d+2VKKAApNCltiUUVq3nS0xzKj13Bhu80zt3Mhj6hvxchKHeVv5gIHDRVWxrquAO
	akR3GB8CKTIYhFq2BWgr0oz0YYeQRU29hme1MQ7ZsHPJF7t2Px4nfa4L0qoNxjsRpsZZKHkWRTj1m
	/fFwn+27m8eJEArePPt20hJun3tNpMOJiV3Y2RuQUDG+uYUWQNYxshlRY/ckz7MSBzgsZ4Yv1Hd4f
	MpqsiVpgLEVFug7YGhOwYASgl7uBSlkVBKhANyTSFkB+lmegGA6gspKrCWzfhoemsQ/7Bfgj1CLti
	klxPOXo5w==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jyZh2-0005Bq-UQ; Thu, 23 Jul 2020 11:47:20 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jyZgx-0005AE-S1; Thu, 23 Jul 2020 11:47:16 +0000
X-UUID: 1cc0db0ffe3b4a5eacdd8c94d1cf4ef5-20200723
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:MIME-Version:Content-Type:References:In-Reply-To:Date:CC:To:From:Subject:Message-ID;
 bh=2q03hZrAhwWp3X4sbe3hUR79Z4qYNGIR06wj3Meeyjk=; 
 b=hoGU7ecvm2vCgIPO8N0rdJxnGl3tBo36xrnxlZS8v8cTd85Qo2QFmUmE465WT5cB/pWL7zwDPy7yp6ukcxwPJz7G8yq2ArPp6EvTF2t06FgRXnCFbfnG3cE5hRnvhfotz3NsChQG65ssDMcIUJvfWTENUcdqaSFEEi9ll/ClUs8=;
X-UUID: 1cc0db0ffe3b4a5eacdd8c94d1cf4ef5-20200723
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw02.mediatek.com
 (envelope-from <hanks.chen@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLS)
 with ESMTP id 2798884; Thu, 23 Jul 2020 03:47:09 -0800
Received: from MTKMBS01N1.mediatek.inc (172.21.101.68) by
 MTKMBS62N1.mediatek.inc (172.29.193.41) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Thu, 23 Jul 2020 04:46:15 -0700
Received: from mtkcas08.mediatek.inc (172.21.101.126) by
 mtkmbs01n1.mediatek.inc (172.21.101.68) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Thu, 23 Jul 2020 19:46:01 +0800
Received: from [172.21.77.33] (172.21.77.33) by mtkcas08.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Thu, 23 Jul 2020 19:46:01 +0800
Message-ID: <1595504763.31289.5.camel@mtkswgap22>
Subject: Re: [PATCH v3 4/4] irqchip/mtk-cirq: Convert to a platform driver
From: Hanks Chen <hanks.chen@mediatek.com>
To: Saravana Kannan <saravanak@google.com>
Date: Thu, 23 Jul 2020 19:46:03 +0800
In-Reply-To: <20200718000637.3632841-5-saravanak@google.com>
References: <20200718000637.3632841-1-saravanak@google.com>
 <20200718000637.3632841-5-saravanak@google.com>
X-Mailer: Evolution 3.2.3-0ubuntu6 
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200723_074716_054806_321D19B3 
X-CRM114-Status: GOOD (  14.83  )
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
Cc: CC Hwang <cc.hwang@mediatek.com>, Jason Cooper <jason@lakedaemon.net>,
 Marc Zyngier <maz@kernel.org>, Loda Chou <loda.chou@mediatek.com>,
 linux-kernel@vger.kernel.org, Bjorn Andersson <bjorn.andersson@linaro.org>,
 Andy Gross <agross@kernel.org>, linux-mediatek@lists.infradead.org,
 linux-arm-msm@vger.kernel.org, Matthias Brugger <matthias.bgg@gmail.com>,
 John Stultz <john.stultz@linaro.org>, Thomas Gleixner <tglx@linutronix.de>,
 kernel-team@android.com, linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On Fri, 2020-07-17 at 17:06 -0700, Saravana Kannan wrote:
> This driver can work as a platform driver. So covert it to a platform
> driver.
> 
> Signed-off-by: Saravana Kannan <saravanak@google.com>
> ---
>  drivers/irqchip/irq-mtk-cirq.c | 4 +++-
>  1 file changed, 3 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/irqchip/irq-mtk-cirq.c b/drivers/irqchip/irq-mtk-cirq.c
> index 69ba8ce3c178..62a61275aaa3 100644
> --- a/drivers/irqchip/irq-mtk-cirq.c
> +++ b/drivers/irqchip/irq-mtk-cirq.c
> @@ -295,4 +295,6 @@ static int __init mtk_cirq_of_init(struct device_node *node,
>  	return ret;
>  }
>  
> -IRQCHIP_DECLARE(mtk_cirq, "mediatek,mtk-cirq", mtk_cirq_of_init);
> +IRQCHIP_PLATFORM_DRIVER_BEGIN(mtk_cirq)
> +IRQCHIP_MATCH("mediatek,mtk-cirq", mtk_cirq_of_init)
> +IRQCHIP_PLATFORM_DRIVER_END(mtk_cirq)

Hi Saravana,

Looks good for me to convert cirq to a platform.
Thank you for your patch.

Reviewed-by: Hanks Chen <hanks.chen@mediatek.com>

Hanks Chen
_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
