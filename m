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
	by smtp.lore.kernel.org (Postfix) with ESMTP id EEA58C433F4
	for <linux-mediatek@archiver.kernel.org>; Thu, 23 Jul 2020 11:43:23 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id C123422B43
	for <linux-mediatek@archiver.kernel.org>; Thu, 23 Jul 2020 11:43:23 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="MUSjuhYS";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b="QWkD4VIF"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org C123422B43
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Date:To:From:
	Subject:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=XBnsqRGF4F620MVr1R5sbyaJLeyh0VfR0lqTbDPRt44=; b=MUSjuhYSuy2RRw6IWTiPX1olG
	08jImDII1N5kTEMa0klSI5FXIR/QAc8MvVA0sa936gYGzPSx6JjrKT38BKbQBhOoZ56Jrup6bT4tq
	QSNVWrsZPmxou0l5C4vDjRmytCd2a7JlI4W3eLyKQm/YG4Y1Gb8MUtML+Bsgs0j14s/JfqxZFTWZZ
	QOqIfhr0rhlT34ukgamEea8Vw1/cv3lA68CQZbYSBljljVmpraTbV1QCW+Nm2f0g+ewXi1DEU/qN6
	4rY5XdQgb/Y3WTWwgTxtu79M/jWmV5KYJzIpyMTi+K7m5N2ocfJW1io5aipo8FD96LHsvWmmIbRn0
	qDiF/kOiA==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jyZd5-0004JU-Ug; Thu, 23 Jul 2020 11:43:15 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jyZd2-0004IW-0r; Thu, 23 Jul 2020 11:43:12 +0000
X-UUID: ff8dece117b941818237bf689db6c40e-20200723
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:MIME-Version:Content-Type:References:In-Reply-To:Date:CC:To:From:Subject:Message-ID;
 bh=srHmaeIaH4DgL6zlUDjHL1vTY6xXkzLRF2s0x4GmvL0=; 
 b=QWkD4VIFahNEjOkPmSaijO8Ndj+BVSq5ely54w8Hi7e/jl5BNPY9Ce1wXcGSHI7mFuvyS5Lxp2nyuSe2ZxCiTkr+2giZUV6L1W/0ABHZNw/CT3NCiIh1hpDN1veX76TBPGubcHPUMSybcT4GSeMBMX/fC2X+m12C403JXLY9HSY=;
X-UUID: ff8dece117b941818237bf689db6c40e-20200723
Received: from mtkcas67.mediatek.inc [(172.29.193.45)] by mailgw02.mediatek.com
 (envelope-from <hanks.chen@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLS)
 with ESMTP id 80869137; Thu, 23 Jul 2020 03:43:05 -0800
Received: from MTKMBS01N2.mediatek.inc (172.21.101.79) by
 MTKMBS62DR.mediatek.inc (172.29.94.18) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Thu, 23 Jul 2020 04:43:04 -0700
Received: from mtkcas08.mediatek.inc (172.21.101.126) by
 mtkmbs01n2.mediatek.inc (172.21.101.79) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Thu, 23 Jul 2020 19:42:49 +0800
Received: from [172.21.77.33] (172.21.77.33) by mtkcas08.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Thu, 23 Jul 2020 19:42:49 +0800
Message-ID: <1595504571.31289.4.camel@mtkswgap22>
Subject: Re: [PATCH v3 3/4] irqchip/mtk-sysirq: Convert to a platform driver
From: Hanks Chen <hanks.chen@mediatek.com>
To: Saravana Kannan <saravanak@google.com>
Date: Thu, 23 Jul 2020 19:42:51 +0800
In-Reply-To: <20200718000637.3632841-4-saravanak@google.com>
References: <20200718000637.3632841-1-saravanak@google.com>
 <20200718000637.3632841-4-saravanak@google.com>
X-Mailer: Evolution 3.2.3-0ubuntu6 
MIME-Version: 1.0
X-TM-SNTS-SMTP: 1D931836E2A244EF5C10FC64AFF0902903C48F59E64BF33879AEA552E426CC712000:8
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200723_074312_208284_BE50581E 
X-CRM114-Status: GOOD (  15.16  )
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
>  drivers/irqchip/irq-mtk-sysirq.c | 4 +++-
>  1 file changed, 3 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/irqchip/irq-mtk-sysirq.c b/drivers/irqchip/irq-mtk-sysirq.c
> index 6ff98b87e5c0..7299c5ab4d10 100644
> --- a/drivers/irqchip/irq-mtk-sysirq.c
> +++ b/drivers/irqchip/irq-mtk-sysirq.c
> @@ -231,4 +231,6 @@ static int __init mtk_sysirq_of_init(struct device_node *node,
>  	kfree(chip_data);
>  	return ret;
>  }
> -IRQCHIP_DECLARE(mtk_sysirq, "mediatek,mt6577-sysirq", mtk_sysirq_of_init);
> +IRQCHIP_PLATFORM_DRIVER_BEGIN(mtk_sysirq)
> +IRQCHIP_MATCH("mediatek,mt6577-sysirq", mtk_sysirq_of_init)
> +IRQCHIP_PLATFORM_DRIVER_END(mtk_sysirq)


Hi Saravana,

Looks good for me to convert it to a platform.

Thank you for your patch.

Reviewed-by: Hanks Chen <hanks.chen@mediatek.com>


Hanks Chen



_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
