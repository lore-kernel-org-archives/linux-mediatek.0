Return-Path: <SRS0=iNWv=42=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.3 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,USER_AGENT_SANE_2
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4C7F1C10F25
	for <linux-mediatek@archiver.kernel.org>; Mon,  9 Mar 2020 23:31:39 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 1E07A2253D
	for <linux-mediatek@archiver.kernel.org>; Mon,  9 Mar 2020 23:31:39 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="a8gLdwiP";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b="TZorDZQc"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 1E07A2253D
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Date:To:From:Subject:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=nD3eKk4X3cY1vmCKgMow2SKS/ADKRf9OoJKoff8kPvY=; b=a8gLdwiPThiDMh
	wMcp1ODd4D4K7xio0B8UGWxMMgSoCzlN9SkEEKiatQBiFtZzjxZI+gGRJN8AY5sqn92EJj5qlKWgm
	QUQ0LI5Txtx1UZ6e6y/yfHztsIyZ7BqKB1eFur0z+FmZYdIUDkAQWRC7wk1f+Gtt3opA9pXZIWBUs
	5GDdgSl+8R8RXc5aIrkFXPGy7MHkTAE3f58SvpRoHSd7T6q9oQrhheJ/ggc04ZUfrIf7tazkq8IYv
	+CwijZQRYoI6nYNzA1pvVsm5kd1qSLZrO3Xj1kRDNXnPJ1otyh7Y15MkHjrTAAW4tO8JkKaTsGk+r
	MsJHdVtcLqLii9ZtA6MQ==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jBRrt-0007Oi-SH; Mon, 09 Mar 2020 23:31:29 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jBRrg-0007C7-Lv; Mon, 09 Mar 2020 23:31:18 +0000
X-UUID: 61cec5a51ff94b26b9524ffaad2b2e0b-20200309
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:MIME-Version:Content-Type:References:In-Reply-To:Date:CC:To:From:Subject:Message-ID;
 bh=/ML3Ledtqy4m3bKFwbFWPyytmDkR4UuhLn++0IipQ84=; 
 b=TZorDZQcjDTH8lhmhgwVC1EltnoyQvnZ/vx2FIVo0ORShoGzK930oQGd0abkK3LzJNKUE19zlwu7m2pdA0eea2zZRC3XoEikCEDXxOvcqsZgLl02BezOl57hK1Lui4QRqPs9SLiyu6/0PwW7+3KAMnBP9WGJMZK5ox+whgKW4H0=;
X-UUID: 61cec5a51ff94b26b9524ffaad2b2e0b-20200309
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw01.mediatek.com
 (envelope-from <chun-hung.wu@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLS)
 with ESMTP id 989306467; Mon, 09 Mar 2020 15:31:09 -0800
Received: from mtkmbs05n1.mediatek.inc (172.21.101.15) by
 MTKMBS62DR.mediatek.inc (172.29.94.18) with Microsoft SMTP Server (TLS) id
 15.0.1395.4; Mon, 9 Mar 2020 16:21:06 -0700
Received: from MTKCAS06.mediatek.inc (172.21.101.30) by
 mtkmbs05n1.mediatek.inc (172.21.101.15) with Microsoft SMTP Server (TLS) id
 15.0.1395.4; Tue, 10 Mar 2020 07:19:53 +0800
Received: from [172.21.77.33] (172.21.77.33) by MTKCAS06.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1395.4 via Frontend
 Transport; Tue, 10 Mar 2020 07:18:21 +0800
Message-ID: <1583796065.23665.8.camel@mtkswgap22>
Subject: Re: [PATCH 1/4] [1/4] mmc: core: expose MMC_CAP2_CQE* to dt
From: Chun-Hung Wu <chun-hung.wu@mediatek.com>
To: Linus Walleij <linus.walleij@linaro.org>
Date: Tue, 10 Mar 2020 07:21:05 +0800
In-Reply-To: <CACRpkdauCe-zAcsO5q_79+Ux_a2=bktA5UqKjWs4XdBJZ3wWeg@mail.gmail.com>
References: <1581921111-24172-1-git-send-email-chun-hung.wu@mediatek.com>
 <1581921111-24172-2-git-send-email-chun-hung.wu@mediatek.com>
 <CACRpkdauCe-zAcsO5q_79+Ux_a2=bktA5UqKjWs4XdBJZ3wWeg@mail.gmail.com>
X-Mailer: Evolution 3.2.3-0ubuntu6 
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200309_163116_729137_1F45ED83 
X-CRM114-Status: GOOD (  21.37  )
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
Cc: Mark Rutland <mark.rutland@arm.com>,
 Kate Stewart <kstewart@linuxfoundation.org>,
 Ulf Hansson <ulf.hansson@linaro.org>, wsd_upstream@mediatek.com,
 linux-mmc <linux-mmc@vger.kernel.org>, Pan Bian <bianpan2016@163.com>, Pavel
 Machek <pavel@ucw.cz>, Chaotian Jing <chaotian.jing@mediatek.com>,
 kernel-team@android.com, "open list:OPEN FIRMWARE AND FLATTENED
 DEVICE TREE BINDINGS" <devicetree@vger.kernel.org>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 Rob Herring <robh+dt@kernel.org>,
 "moderated list:ARM/Mediatek SoC support" <linux-mediatek@lists.infradead.org>,
 Matthias Brugger <matthias.bgg@gmail.com>, Thomas
 Gleixner <tglx@linutronix.de>, Stanley Chu <stanley.chu@mediatek.com>,
 Allison Randal <allison@lohutok.net>,
 Linux ARM <linux-arm-kernel@lists.infradead.org>,
 Mathieu Malaterre <malat@debian.org>, Greg
 Kroah-Hartman <gregkh@linuxfoundation.org>,
 Kuohong Wang <kuohong.wang@mediatek.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On Fri, 2020-02-21 at 15:33 +0100, Linus Walleij wrote:
> On Mon, Feb 17, 2020 at 7:32 AM Chun-Hung Wu <chun-hung.wu@mediatek.com> wrote:
> 
> > Expose MMC_CAP2_CQE and MMC_CAP2_CQE_DCMD
> > to host->caps2 if
> > 1. "supports-cqe" is defined in dt and
> > 2. "disable-cqe-dcmd" is not defined in dt.
> >
> > ---
> >  drivers/mmc/core/host.c | 8 ++++++++
> >  1 file changed, 8 insertions(+)
> >
> > diff --git a/drivers/mmc/core/host.c b/drivers/mmc/core/host.c
> > index 105b7a7..efb0dbe 100644
> > --- a/drivers/mmc/core/host.c
> > +++ b/drivers/mmc/core/host.c
> > @@ -319,6 +319,14 @@ int mmc_of_parse(struct mmc_host *host)
> >                 host->caps2 |= MMC_CAP2_NO_SD;
> >         if (device_property_read_bool(dev, "no-mmc"))
> >                 host->caps2 |= MMC_CAP2_NO_MMC;
> > +       if (device_property_read_bool(dev, "supports-cqe"))
> > +               host->caps2 |= MMC_CAP2_CQE;
> 
> I don't understand why this is even a DT property as it should
> be clear from the hosts compatible whether it supports CQE or
> not. But it's too late to do anything about that I suppose, and
> I just assume there is something I don't understand here.
"supports-cqe" as my understanding is like HS400 HS200 is a host
capability.
> 
> > +       /* Must be after "supports-cqe" check */
> > +       if (!device_property_read_bool(dev, "disable-cqe-dcmd")) {
> > +               if (host->caps2 & MMC_CAP2_CQE)
> > +                       host->caps2 |= MMC_CAP2_CQE_DCMD;
> > +       }
> 
> This is the right place to do this I suppose. Disabling CQE
> selectively is something you might wanna do for debugging.
> Acked-by: Linus Walleij <linus.walleij@linaro.org>
> 
> I see that some drivers are already parsing this DT property
> on their own, should we follow up with patches so that these:
> 
> $ git grep 'supports-cqe'
> drivers/mmc/host/sdhci-brcmstb.c:       if
> (device_property_read_bool(&pdev->dev, "supports-cqe")) {
> drivers/mmc/host/sdhci-msm.c:   if (of_property_read_bool(node, "supports-cqe"))
> drivers/mmc/host/sdhci-tegra.c: if
> (device_property_read_bool(host->mmc->parent, "supports-cqe"))
> 
> Make use of the central parsing instead?
In v4, I will remove the vendor driver dt setting and use central
parsing instead.
> 
> Yours,
> Linus Walleij

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
