Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 42F7DC433EF
	for <linux-mediatek@archiver.kernel.org>; Sat, 18 Dec 2021 09:45:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Date:To:From:Subject:Message-ID:Reply-To:Cc:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=mEy6Z/+erMAkV7NcVXLtgOgBeqFss8qQ1CYWY8B1io0=; b=iWH8uceEx4dBYJ
	tFdB1BK79VO0/nJbRH5tZu/qP2ND8V8Qzg1G/+3AuwUWFx6zEiFM4hmlc+zKI+YMhp4RAjx09ydJt
	eQMmbT4rwH2rLf5xjmPu4OKu+XPr+1TX+cjrb2J+W2aOKqusThtYOvpQQF5ZWKo5npcCMY7sAD9X4
	70JahZF/HCild4Vs4YTshEEJrxx3ET49mLihcrUBMxWVmmBH277W7qDMFadkGJwXagTb0GvkmnyZa
	2fR68o+tIoE0SWVcnfqc0Mb2SnBUz3BxskdUxRWktBv0eRLMSjg2i3q/szu2oduA3eOY8n1FAxEwB
	IUgfyyg+L/LD3DScZMYQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1myWGz-00DPC6-1k; Sat, 18 Dec 2021 09:45:01 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1myWGm-00DPAA-Cx; Sat, 18 Dec 2021 09:44:50 +0000
X-UUID: 2f9d78e48dfe454db02ca081c18f27c3-20211218
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:MIME-Version:Content-Type:References:In-Reply-To:Date:To:From:Subject:Message-ID;
 bh=BX/xr60YeEGkR5WPd8bZnIzzW27Ue8psX+ZM7ID81Ws=; 
 b=IuS8ogSNs/5R2cHUpRZt1ZUhNsHJtgyOUdXWB3KKcb2gy1lbK2G0vswC97Kjt1A7JczB/nzKwnvK77PRIhX/eImjQV2qPwkXbMKbydit1WHb/wT2jLCmTIx1jEXcUj28dt5pVkl6kXEHotIU53/zxidkIkP8WLWqx/8QiWXbQQY=;
X-UUID: 2f9d78e48dfe454db02ca081c18f27c3-20211218
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw01.mediatek.com
 (envelope-from <kewei.xu@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 500900162; Sat, 18 Dec 2021 02:44:41 -0700
Received: from mtkmbs10n1.mediatek.inc (172.21.101.34) by
 MTKMBS62N2.mediatek.inc (172.29.193.42) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Sat, 18 Dec 2021 01:44:39 -0800
Received: from mtkcas10.mediatek.inc (172.21.101.39) by
 mtkmbs10n1.mediatek.inc (172.21.101.34) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.2.792.15; Sat, 18 Dec 2021 17:44:38 +0800
Received: from mhfsdcap04 (10.17.3.154) by mtkcas10.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Sat, 18 Dec 2021 17:44:31 +0800
Message-ID: <dfd50de5149a38ad1bc5faf9bb26a8a04be7d314.camel@mediatek.com>
Subject: Re: [PATCH v7 6/7] i2c: mediatek: Isolate speed setting via dts for
 special devices
From: Kewei Xu <kewei.xu@mediatek.com>
To: Wolfram Sang <wsa@the-dreams.de>, <matthias.bgg@gmail.com>,
 <robh+dt@kernel.org>, <linux-i2c@vger.kernel.org>,
 <devicetree@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
 <linux-kernel@vger.kernel.org>, <linux-mediatek@lists.infradead.org>,
 <srv_heupstream@mediatek.com>, <leilk.liu@mediatek.com>,
 <qii.wang@mediatek.com>, <liguo.zhang@mediatek.com>,
 <caiyu.chen@mediatek.com>, <ot_daolong.zhu@mediatek.com>,
 <yuhan.wei@mediatek.com>
Date: Sat, 18 Dec 2021 17:44:32 +0800
In-Reply-To: <YaTMQQhENmJAIUk4@kunai>
References: <20210917101416.20760-1-kewei.xu@mediatek.com>
 <20210917101416.20760-7-kewei.xu@mediatek.com> <YVf+83LdUEPjoLdI@kunai>
 <1891acec7f5c417f62081a8b10249b265df7ea62.camel@mediatek.com>
 <YWQYbaTIhud2QHNP@kunai> <YaTMQQhENmJAIUk4@kunai>
X-Mailer: Evolution 3.28.5-0ubuntu0.18.04.2 
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211218_014448_473350_E21C86B1 
X-CRM114-Status: GOOD (  21.89  )
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

On Mon, 2021-11-29 at 13:49 +0100, Wolfram Sang wrote:
> > > stretching. But if the slave device stretch the SCL line for too
> > > long
> > > time, our design still cannot make tSU,STA/tHD,STA/tSU,STO meet
> > > spec.
> > 
> > Isn't the new algorithm broken if it cannot support clock
> > stretching?
> > What was the problem of the old algorithm not meeting the spec?
> > 
> > > However in the old (default) timing algorithm before the commit
> > > be5ce0e97cc7 ("i2c: mediatek: Add i2c ac-timing adjust support"),
> > > tSU,STA/tHD,STA/tSU,STO can meet spec. So we want to define a new
> > > setting "default-adjust-timing" for using the old (default)
> > > timing
> > > algorithm."
> > 
> > What I still do not get: the old algorithm was able to handle clock
> > stretching. Why can't you update the new one to handle clock
> > stretching
> > as well. I might be missing something, but what is it?
> 
> I am still interested. Especially in the last question. Is the last
> question clear to you? I can explain some more otherwise.
> 
Hi,Wolfram,

I'm very sorry that I didn't reply to your information in time due
to my many personal affairs.

The Old algorithm was designed to focus only on normal functions, and
need to add additional custom code to adjust ac-timing when the
communication timing did not meet the specifications. so when there is
no clock stretch, ac-timing does not meet the spec, but the function is
always normal.

The new algorithm(The commit patch: be5ce0e97cc7 ("i2c: mediatek: Add
i2c ac-timing adjust support") is based on the requirements of i2c spec
to calculate the hardware-related settings so that the function and ac-
timing are normal When there is no clock stretch or the clock stretch
time is short. When the stretching time is very long (>60us), i2c ac-
timing does not meet the specifications and causes function abnormal.

In order to make the i2c function normal, this patch was submitted,
that is, when the stretch is long, the old algorithm is used to ensure
the function is normal, and when the stretch is short, the new
algorithm is used to ensure that the ac-timing and function are normal.

We found that when the ac-timing calculation formula is updated, the
new algorithm can make i2c ac-timing meet the spec and function
normally. So we plan to replace this patch with a patch that updates
the calculation formula.

Thanks~
Kewei
_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
