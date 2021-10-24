Return-Path: <SRS0=8pCq=PM=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 482F1C433EF
	for <linux-mediatek@archiver.kernel.org>; Sun, 24 Oct 2021 20:28:29 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id D8C7F60FE8
	for <linux-mediatek@archiver.kernel.org>; Sun, 24 Oct 2021 20:28:28 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org D8C7F60FE8
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=armlinux.org.uk
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=TKhzSycSlYKm+7ma4ZJ2EnLOXLe+2+sY/x/fADHK/MY=; b=JcZayhlgjEpee0
	7Dxfy7JS3N8weRFRiZX7NqAUDXvMnMC7345z3ELdn2vHrkiy0lv6VNXN4kgZRUTWGsJILjjK61L5c
	nIDuy4BhLI/kS112DXZX/u/7SdUEwcLWqfgM+pFfphLHvVEC4+UWPrI1465NmQoV6SbUwJ9/oJDcr
	4ijbMXJNIIG94nkHL/eox0VNRhDeKVoAO3DAKxEBcIcEHQ53FeEST19hpPHmFhxiBU7VX0owRA/dt
	6svHCVrXdTDTM1vo5Qxy5WDq6b1k+mGmYfhHiOVcDwt9+DFsm0zl+iDulfwxnyY1v/OojXQTKY4H+
	bgr1HQEEqsuSt4FV6Sfg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mek6M-00EaI1-Td; Sun, 24 Oct 2021 20:28:18 +0000
Received: from pandora.armlinux.org.uk ([2001:4d48:ad52:32c8:5054:ff:fe00:142])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mek6J-00EaEB-J5; Sun, 24 Oct 2021 20:28:17 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=armlinux.org.uk; s=pandora-2019; h=Sender:In-Reply-To:Content-Type:
 MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
 List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=8O9gkYAmFcVK2IsDTWyn2VcW39mplgtD5t4PDmHXu1U=; b=nSaHE3DkXdmeZ1O0lor5XmoZPe
 AW5ZCFNAxuvaGwR9xicRQr5bwZzNSKltIJlzzKIfb2B41sFIiWKNLHMxaykVDRj1MhManwnqgrj/S
 x9ZQedtZPEiyRNOygnlTPudecxV3ArZrm3/abUvlXCE5ztjj0qNfwUwjLOdeaytVsz4+BQmuUtfKu
 IfshdYkYPo3di9x0o2/Dswha1avGXlmWtX9n1EQwYW5XDl8OuvEs3VIR+MXA4vtI6SMeI7B4nhLi/
 bCUHBXPGkqMQcySiXD1C4DcC1niCP7nlV+Bx4tLMqyIEP53flEsPKfa2yZXIi/Rn42ghwVnMeRJf4
 FofPugpg==;
Received: from shell.armlinux.org.uk
 ([fd8f:7570:feb6:1:5054:ff:fe00:4ec]:55272)
 by pandora.armlinux.org.uk with esmtpsa (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.94.2)
 (envelope-from <linux@armlinux.org.uk>)
 id 1mek49-0003Y2-8V; Sun, 24 Oct 2021 21:26:01 +0100
Received: from linux by shell.armlinux.org.uk with local (Exim 4.94.2)
 (envelope-from <linux@shell.armlinux.org.uk>)
 id 1mek46-0003JU-0B; Sun, 24 Oct 2021 21:25:58 +0100
Date: Sun, 24 Oct 2021 21:25:57 +0100
From: "Russell King (Oracle)" <linux@armlinux.org.uk>
To: "jason-jh.lin" <jason-jh.lin@mediatek.com>
Cc: Chun-Kuang Hu <chunkuang.hu@kernel.org>,
 Philipp Zabel <p.zabel@pengutronix.de>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 Jassi Brar <jassisinghbrar@gmail.com>,
 Yongqiang Niu <yongqiang.niu@mediatek.com>,
 David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>,
 dri-devel@lists.freedesktop.org, linux-mediatek@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 hsinyi@chromium.org, fshao@chromium.org, nancy.lin@mediatek.com,
 singo.chang@mediatek.com
Subject: Re: [PATCH] mailbox: remove the error message when gce clk is defer
Message-ID: <YXXBVTEbjPiBm1un@shell.armlinux.org.uk>
References: <20211023164831.25690-1-jason-jh.lin@mediatek.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20211023164831.25690-1-jason-jh.lin@mediatek.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211024_132815_642531_F7842D35 
X-CRM114-Status: GOOD (  16.26  )
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On Sun, Oct 24, 2021 at 12:48:31AM +0800, jason-jh.lin wrote:
> Remove the error message when gce clk is defer.
> 
> Signed-off-by: jason-jh.lin <jason-jh.lin@mediatek.com>
> ---
>  drivers/mailbox/mtk-cmdq-mailbox.c | 6 ++++--
>  1 file changed, 4 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/mailbox/mtk-cmdq-mailbox.c b/drivers/mailbox/mtk-cmdq-mailbox.c
> index fd5576a9f8b4..684b8aa1e445 100644
> --- a/drivers/mailbox/mtk-cmdq-mailbox.c
> +++ b/drivers/mailbox/mtk-cmdq-mailbox.c
> @@ -577,7 +577,8 @@ static int cmdq_probe(struct platform_device *pdev)
>  				snprintf(clk_id, sizeof(clk_id), "%s%d", clk_name, alias_id);
>  				cmdq->clocks[alias_id].id = clk_id;
>  				cmdq->clocks[alias_id].clk = of_clk_get(node, 0);
> -				if (IS_ERR(cmdq->clocks[alias_id].clk)) {
> +				if (IS_ERR(cmdq->clocks[alias_id].clk) &&
> +				    PTR_ERR(cmdq->clocks[alias_id].clk) != -EPROBE_DEFER) {
>  					dev_err(dev, "failed to get gce clk: %d\n", alias_id);
>  					return PTR_ERR(cmdq->clocks[alias_id].clk);
>  				}

So when you get -EPROBE_DEFER, you omit the error message _and_ ignore
the -EPROBE_DEFER. Is that really what you want to do?

-- 
RMK's Patch system: https://www.armlinux.org.uk/developer/patches/
FTTP is here! 40Mbps down 10Mbps up. Decent connectivity at last!

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
