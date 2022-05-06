Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 404A8C433EF
	for <linux-mediatek@archiver.kernel.org>; Fri,  6 May 2022 01:55:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Date:CC:To:From:Subject:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=7JEmoGld8DOecdel3Yy4ARJ4skcLIIixkeNcl48/MvQ=; b=elVodnLhHZw7NR
	8JTGbobo2eY/SQDaTx1hE55PBcfkjvNtjITuxhiBSRIN2S2Bshxi6Fysx2Umieb0aEQrcSbEvM5OE
	peucMbRQ2ASz7+EsN9jBfplHLv3WNE+ypNE8rnbeU465qxpDQG8FIYa7P7HR6MfJ6I6X+FtI+r2tS
	UU5+eEDhSnQWRPZfhysWrBXGJBbFnHMX1aS9ivc+0Yf77gUourxHRht1xHFUxI+Pn2MloCzZ1r2c+
	j3UnQoyuq3qvv4BYBQHD8TXGiE/z3j9sxyNaCxrpdzzMlnY65Ci+cC/vOwkJUgyNERbe4j3kPdC2a
	G4u9VOSslhsusH4VIN0A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nmnBR-000rAk-4n; Fri, 06 May 2022 01:55:05 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nmnBL-000r9L-IV; Fri, 06 May 2022 01:55:02 +0000
X-UUID: 5186a02b0f334edf8d113cfe19e01a36-20220505
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.4, REQID:0f31f3d3-7cf6-47ac-a9f4-f7fc3ea7aaa5, OB:0,
 LO
 B:0,IP:0,URL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,RULE:Release_Ham,ACTI
 ON:release,TS:0
X-CID-META: VersionHash:faefae9, CLOUDID:24326116-2e53-443e-b81a-655c13977218,
 C
 OID:IGNORED,Recheck:0,SF:nil,TC:nil,Content:0,EDM:-3,File:nil,QS:0,BEC:nil
X-UUID: 5186a02b0f334edf8d113cfe19e01a36-20220505
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw01.mediatek.com
 (envelope-from <rex-bc.chen@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 217064230; Thu, 05 May 2022 18:54:52 -0700
Received: from MTKMBS07N2.mediatek.inc (172.21.101.141) by
 MTKMBS62DR.mediatek.inc (172.29.94.18) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Thu, 5 May 2022 18:49:03 -0700
Received: from mtkmbs11n2.mediatek.inc (172.21.101.187) by
 mtkmbs07n2.mediatek.inc (172.21.101.141) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Fri, 6 May 2022 09:49:01 +0800
Received: from mtksdccf07 (172.21.84.99) by mtkmbs11n2.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.2.792.3 via Frontend
 Transport; Fri, 6 May 2022 09:49:01 +0800
Message-ID: <774c87ffdcac2ca97efef9fc6140f85ddc30e513.camel@mediatek.com>
Subject: Re: [PATCH v6 02/10] cpufreq: mediatek: Add
 platform_device_unregister when driver exit
From: Rex-BC Chen <rex-bc.chen@mediatek.com>
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 <rafael@kernel.org>, <viresh.kumar@linaro.org>, <robh+dt@kernel.org>,
 <krzk+dt@kernel.org>, <matthias.bgg@gmail.com>
CC: <jia-wei.chang@mediatek.com>, <roger.lu@mediatek.com>,
 <hsinyi@google.com>, <khilman@baylibre.com>, <linux-pm@vger.kernel.org>,
 <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
 <linux-arm-kernel@lists.infradead.org>, <linux-mediatek@lists.infradead.org>, 
 <Project_Global_Chrome_Upstream_Group@mediatek.com>
Date: Fri, 6 May 2022 09:49:01 +0800
In-Reply-To: <af9724fe-181d-3ba4-79b9-bf3fab1ca80d@collabora.com>
References: <20220505115226.20130-1-rex-bc.chen@mediatek.com>
 <20220505115226.20130-3-rex-bc.chen@mediatek.com>
 <af9724fe-181d-3ba4-79b9-bf3fab1ca80d@collabora.com>
X-Mailer: Evolution 3.28.5-0ubuntu0.18.04.2 
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220505_185459_646506_EE59BEAD 
X-CRM114-Status: GOOD (  13.97  )
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

On Thu, 2022-05-05 at 17:04 +0200, AngeloGioacchino Del Regno wrote:
> Il 05/05/22 13:52, Rex-BC Chen ha scritto:
> > We register the platform device when driver inits. However, we do
> > not
> > unregister it when driver exits.
> > To resolve this, we declare the platform data to be a global static
> > variable and rename it to be "cpufreq_pdev".
> > With this global variable, we can do platform_device_unregister()
> > when
> > driver exits.
> > 
> > Signed-off-by: Rex-BC Chen <rex-bc.chen@mediatek.com>
> 
> Hello Rex,
> this commit needs a Fixes: tag.
> 
> Cheers,
> Angelo
> 

Hello Angelo,

Thanks for the reminder.
I will add "Fixes: 501c574f4e3a ("cpufreq: mediatek: Add support of
cpufreq to MT2701/MT7623 SoC")"

BRs,
Rex


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
