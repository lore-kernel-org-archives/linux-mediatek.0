Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B608BC433F5
	for <linux-mediatek@archiver.kernel.org>; Mon, 25 Apr 2022 06:22:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Date:CC:To:From:Subject:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=eHvzqhZt/LdePWLLY1vQt58N5wVpJONBT8yjW1Ho4OQ=; b=K4oHwl6cfJzeoy
	o1lq4HYAw1eWhvxmPwH275Kr/lndmWEA2qdy+P2tNyG7DHnAh28wnZ18CnKUyb4pGz1jS8Azn7A3h
	wDGvCkWZQT1mniTzwNSTAtvpT6XlVRn6Ub5ggHBwSoSW5YhdlML8mOKFxfh8+KFFHRQygVd0NjOLv
	cbdKqxc4rBE0mSm3zDkFUaH+7suZws7tjo3shzUxk3L+AiahI3dVZIwa5NoHBpcDXaP7PfQYw2QHD
	vem6a7H7sJJdL+CI8OviSgRQAcKlIdrVrs76ajTvVZ2M77kVZtVXyT16OmnFrMITWBT8v1KlrdyP2
	A/5k2MiEAegSxdQxKCog==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nis6o-008T0S-AO; Mon, 25 Apr 2022 06:22:06 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nis6j-008SzX-VD; Mon, 25 Apr 2022 06:22:04 +0000
X-UUID: 3f5ede9c27ac47aaa3695b65076a87f9-20220424
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.4, REQID:b1b37cdd-f6ff-4cec-8fd8-70d5d4001d39, OB:0,
 LO
 B:0,IP:0,URL:8,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,RULE:Release_Ham,ACTI
 ON:release,TS:8
X-CID-META: VersionHash:faefae9, CLOUDID:d908d3f0-da02-41b4-b6df-58f4ccd36682,
 C
 OID:IGNORED,Recheck:0,SF:nil,TC:nil,Content:0,EDM:-3,File:nil,QS:0,BEC:nil
X-UUID: 3f5ede9c27ac47aaa3695b65076a87f9-20220424
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw02.mediatek.com
 (envelope-from <rex-bc.chen@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 278709313; Sun, 24 Apr 2022 23:21:49 -0700
Received: from mtkexhb02.mediatek.inc (172.21.101.103) by
 MTKMBS62N1.mediatek.inc (172.29.193.41) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Sun, 24 Apr 2022 23:20:48 -0700
Received: from mtkcas10.mediatek.inc (172.21.101.39) by mtkexhb02.mediatek.inc
 (172.21.101.103) with Microsoft SMTP Server (TLS) id 15.0.1497.2;
 Mon, 25 Apr 2022 14:20:47 +0800
Received: from mtksdccf07 (172.21.84.99) by mtkcas10.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Mon, 25 Apr 2022 14:20:46 +0800
Message-ID: <88b2103944768732ab813c294bce88097321f501.camel@mediatek.com>
Subject: Re: [PATCH V4 00/14] cpufreq: mediatek: Cleanup and support MT8183
 and MT8186
From: Rex-BC Chen <rex-bc.chen@mediatek.com>
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>, <rafael@kernel.org>, 
 <viresh.kumar@linaro.org>, <robh+dt@kernel.org>, <krzk+dt@kernel.org>,
 <matthias.bgg@gmail.com>
CC: <jia-wei.chang@mediatek.com>, <roger.lu@mediatek.com>,
 <hsinyi@google.com>, <khilman@baylibre.com>,
 <angelogioacchino.delregno@collabora.com>, <linux-pm@vger.kernel.org>,
 <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
 <linux-arm-kernel@lists.infradead.org>, <linux-mediatek@lists.infradead.org>, 
 <Project_Global_Chrome_Upstream_Group@mediatek.com>
Date: Mon, 25 Apr 2022 14:20:46 +0800
In-Reply-To: <af95f353-c91d-844e-3bc1-e052f7d16e54@linaro.org>
References: <20220422075239.16437-1-rex-bc.chen@mediatek.com>
 <af95f353-c91d-844e-3bc1-e052f7d16e54@linaro.org>
X-Mailer: Evolution 3.28.5-0ubuntu0.18.04.2 
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220424_232202_036971_D54F11A9 
X-CRM114-Status: GOOD (  10.73  )
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

On Fri, 2022-04-22 at 19:23 +0200, Krzysztof Kozlowski wrote:
> On 22/04/2022 09:52, Rex-BC Chen wrote:
> > 
> > Reference series:
> > [1]: V1 of this series is present by Jia-Wei Chang.
> >      message-id:20220307122151.11666-1-jia-wei.chang@mediatek.com
> > 
> > [2]: The MediaTek CCI devfreq driver is introduced in another
> > series.
> >      message-id:20220408052150.22536-1-johnson.wang@mediatek.com
> > 
> > [3]: The MediaTek SVS driver is introduced in another series.
> >      message-id:20220221063939.14969-1-roger.lu@mediatek.com
> 
> These are not proper links. Please use lore references.
> 
> 
> Best regards,
> Krzysztof

Hello Krzysztof,

I will use lore references in next version.
Thanks.

BRs,
Rex


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
