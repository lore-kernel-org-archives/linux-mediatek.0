Return-Path: <SRS0=Uf5e=NV=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.6 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,URIBL_BLOCKED,USER_AGENT_SANE_2
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C7617C432BE
	for <linux-mediatek@archiver.kernel.org>; Mon, 30 Aug 2021 07:43:31 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 9141B60FE6
	for <linux-mediatek@archiver.kernel.org>; Mon, 30 Aug 2021 07:43:31 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 9141B60FE6
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Date:CC:To:From:Subject:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=JLtrlyjzjl/R+8C75hzl6d3WPYXaXtK7vWJ9NzNQX0k=; b=BX8J1DykSkEZhR
	OPfqAWuCrgryy4BlWZuDHomxqeFhVRHqM/V1PUVeZzOzahX5KySnTGB+Kx/poOQjhh3nyd9/Nx9J6
	Tmzr+8g8g4IJAyc66pAde2XnfGTSugsnl2kV+/BcrFVCSZQi/CryAATRO4rP0PCqZ7I2SnPaVo+1j
	ip5AmPXaW8MoYMDN6ZzjTk/uQsg5PVQ2216LNarXe1x2Fry+R/oD3jugvTbq/+jYsYKR96e5xrOeh
	q9QrL0z9w1S/Neh+rYHKIV7uViUXpVovhkWgVZw2snb1CW4jju5XH6AykAaJZ5z9p/3OTET+thY/N
	96KZre3TTx82dxaCgrOA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mKbwv-00Gdmv-Ot; Mon, 30 Aug 2021 07:43:21 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mKbwq-00Gdl8-C0
 for linux-mediatek@lists.infradead.org; Mon, 30 Aug 2021 07:43:20 +0000
X-UUID: 47b14e2765824610a867e57a8f208044-20210830
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:MIME-Version:Content-Type:References:In-Reply-To:Date:CC:To:From:Subject:Message-ID;
 bh=n+oZBZbUePjiqxewt0xMXIG7XJSFjLMgCTbyqYKbDrQ=; 
 b=nXR9Z7I88KPzb/qfNoH/HSoFlZkl+NUcgi49q0vy4vAOvea38pst9OCMALmj/pmDXgWlaIV8nNcUeL07WF4HxMEXf2u3EFD9+4d7XEwGp14JjQE3eSuwLgeLx6xrE8dmezG7jyhmkHcM53bNElnFSew0t1qlcZXXLi5Vi2vp4QE=;
X-UUID: 47b14e2765824610a867e57a8f208044-20210830
Received: from mtkcas67.mediatek.inc [(172.29.193.45)] by mailgw02.mediatek.com
 (envelope-from <trevor.wu@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 43015604; Mon, 30 Aug 2021 00:43:13 -0700
Received: from mtkmbs05n2.mediatek.inc (172.21.101.140) by
 MTKMBS62DR.mediatek.inc (172.29.94.18) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Mon, 30 Aug 2021 00:43:12 -0700
Received: from MTKCAS06.mediatek.inc (172.21.101.30) by
 mtkmbs05n2.mediatek.inc (172.21.101.140) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Mon, 30 Aug 2021 15:43:11 +0800
Received: from mtksdccf07 (172.21.84.99) by MTKCAS06.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Mon, 30 Aug 2021 15:43:11 +0800
Message-ID: <126146d89214d6fdf4a326abfb0eec2ca0a9a246.camel@mediatek.com>
Subject: Re: [bug report] ASoC: mediatek: implement mediatek common structure
From: Trevor Wu <trevor.wu@mediatek.com>
To: Dan Carpenter <dan.carpenter@oracle.com>, <garlic.tseng@mediatek.com>
CC: <alsa-devel@alsa-project.org>, <linux-mediatek@lists.infradead.org>,
 <trevor.wu@mediatek.com>
Date: Mon, 30 Aug 2021 15:43:06 +0800
In-Reply-To: <20210827085734.GB9183@kili>
References: <20210827085734.GB9183@kili>
X-Mailer: Evolution 3.28.5-0ubuntu0.18.04.2 
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210830_004316_502329_D9FA19F7 
X-CRM114-Status: GOOD (  15.23  )
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

Hi Dan,

Garlic has left mediatek, so I will help this problem.
Thank you for pointing out the problem.
It seems that some handling for NULL case should be added to
suspend/resume funtion.
I will send a patch for the problem.

Thanks,
Trevor


On Fri, 2021-08-27 at 11:57 +0300, Dan Carpenter wrote:
> Hello Garlic Tseng,
> 
> The patch 283b612429a2: "ASoC: mediatek: implement mediatek common
> structure" from Jun 17, 2016, leads to the following
> Smatch static checker warning:
> 
> 	sound/soc/mediatek/common/mtk-afe-fe-dai.c:364 mtk_afe_resume()
> 	error: we previously assumed 'afe->reg_back_up' could be null
> (see line 359)
> 
> sound/soc/mediatek/common/mtk-afe-fe-dai.c
>     354         if (pm_runtime_status_suspended(dev) || !afe-
> >suspended)
>     355                 return 0;
>     356 
>     357         afe->runtime_resume(dev);
>     358 
>     359         if (!afe->reg_back_up)
>     360                 dev_dbg(dev, "%s no reg_backup\n", __func__);
> 
> Should this return?  Also when ->reg_back_up is allocated there is no
> check for NULL so it seems like a very possible condition.
> 
>     361 
>     362         for (i = 0; i < afe->reg_back_up_list_num; i++)
>     363                 mtk_regmap_write(regmap, afe-
> >reg_back_up_list[i],
> --> 364                                  afe->reg_back_up[i]);
>     365 
>     366         afe->suspended = false;
>     367         return 0;
>     368 }
> 
> regards,
> dan carpenter
> 
> _______________________________________________
> Linux-mediatek mailing list
> Linux-mediatek@lists.infradead.org
> 
https://urldefense.com/v3/__http://lists.infradead.org/mailman/listinfo/linux-mediatek__;!!CTRNKA9wMg0ARbw!3mMCbxx-YFIMMsBt65G7RuCRYOyFvPR_ZdB9SjdWOhElHVtsE6cAas4nmodLGDHR6w$
>  
_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
