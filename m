Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ACDBDC433EF
	for <linux-mediatek@archiver.kernel.org>; Wed,  4 May 2022 12:07:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Date:CC:To:From:Subject:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=BkmL/Dr/a5KJLh3lqVSgp0q7cewTXgC6GvkwINqQDxc=; b=l3z384HJAw8qaW
	Za30ZgCN/p5vvaLHFier3l9d6peht7ZBCngmBdpRCMDLfO8Q0szhHKwkMEpRr9vKzMcpy6qRcVDOh
	fd8FlF4DW/4tm7k7HNbXNXNY8QoaYS0abqgrzpzkxk/orKau0ulNb95lR9L9564l4wiVdhdJl4zFw
	ntH+kWaCkuHT98wBbpVmqXRejK/qhq2EAC97TO0bXpKH+ipu8k87fCDsD9M4NvIKmTr0XaEujv5oM
	hCdOoW+L7yl5yXBmbJ5PtgsTh5h5VTqBjVcoeWRlqkUPgt6me9+sYpGPsPo3WZX35vAuxyxBc6Rwd
	raVoeqfwl9r1ElVxGmNA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nmDn8-00Ae0r-NO; Wed, 04 May 2022 12:07:38 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nmDmF-00AdWL-Vu; Wed, 04 May 2022 12:06:45 +0000
X-UUID: ec3da4464e7e48f2b33665e9a72b268c-20220504
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.4, REQID:42047d95-3154-4679-9375-233083735fa1, OB:0,
 LO
 B:0,IP:0,URL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,RULE:Release_Ham,ACTI
 ON:release,TS:0
X-CID-META: VersionHash:faefae9, CLOUDID:be2d8bb2-56b5-4c9e-8d83-0070b288eb6a,
 C
 OID:IGNORED,Recheck:0,SF:nil,TC:nil,Content:0,EDM:-3,File:nil,QS:0,BEC:nil
X-UUID: ec3da4464e7e48f2b33665e9a72b268c-20220504
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw02.mediatek.com
 (envelope-from <rex-bc.chen@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 1584963687; Wed, 04 May 2022 05:06:41 -0700
Received: from mtkmbs10n2.mediatek.inc (172.21.101.183) by
 MTKMBS62DR.mediatek.inc (172.29.94.18) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Wed, 4 May 2022 05:06:39 -0700
Received: from mtkmbs11n2.mediatek.inc (172.21.101.187) by
 mtkmbs10n2.mediatek.inc (172.21.101.183) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.792.3; 
 Wed, 4 May 2022 20:06:38 +0800
Received: from mtksdccf07 (172.21.84.99) by mtkmbs11n2.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.2.792.3 via Frontend
 Transport; Wed, 4 May 2022 20:06:38 +0800
Message-ID: <af5d30f36092f387e4de7e4c09ca09f9de0478ba.camel@mediatek.com>
Subject: Re: [PATCH] cpufreq: Avoid unnecessary frequency updates due to
 mismatch
From: Rex-BC Chen <rex-bc.chen@mediatek.com>
To: Viresh Kumar <viresh.kumar@linaro.org>, Rafael Wysocki
 <rjw@rjwysocki.net>, "Rafael J. Wysocki" <rafael@kernel.org>, "Matthias
 Brugger" <matthias.bgg@gmail.com>
CC: <linux-pm@vger.kernel.org>, Vincent Guittot <vincent.guittot@linaro.org>, 
 <linux-kernel@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
 <linux-mediatek@lists.infradead.org>, <jia-wei.chang@mediatek.com>
Date: Wed, 4 May 2022 20:06:38 +0800
In-Reply-To: <39e39a7d30c8ee6af81fb64670a330abeb87402e.1651652493.git.viresh.kumar@linaro.org>
References: <39e39a7d30c8ee6af81fb64670a330abeb87402e.1651652493.git.viresh.kumar@linaro.org>
X-Mailer: Evolution 3.28.5-0ubuntu0.18.04.2 
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220504_050644_092226_67C71468 
X-CRM114-Status: GOOD (  15.71  )
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

On Wed, 2022-05-04 at 13:51 +0530, Viresh Kumar wrote:
> For some platforms, the frequency returned by hardware may be
> slightly
> different from what is provided in the frequency table. For example,
> hardware may return 499 MHz instead of 500 MHz. In such cases it is
> better to avoid getting into unnecessary frequency updates, as we may
> end up switching policy->cur between the two and sending unnecessary
> pre/post update notifications, etc.
> 
> This patch has chosen allows the hardware frequency and table
> frequency
> to deviate by 1 MHz for now, we may want to increase it a bit later
> on
> if someone still complains.
> 
> Reported-by: Rex-BC Chen <rex-bc.chen@mediatek.com>
> Signed-off-by: Viresh Kumar <viresh.kumar@linaro.org>
> ---
> 

Hello Viresh,

Thanks for your help!
Jia-wei verified this patch in his device, and I help him to add this.

Tested-by: Jia-wei Chang <jia-wei.chang@mediatek.com>

BRs,
Rex


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
