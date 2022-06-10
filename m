Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E3DA1C43334
	for <linux-mediatek@archiver.kernel.org>; Fri, 10 Jun 2022 05:59:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Date:CC:To:From:Subject:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=zjZnuwgQh5DryUyccvqnXe3TogNrLQVRjA9d5NItpic=; b=jsU2fD/nx+WMmg
	w5zN7TJgqelabUwJZT9a1/bY0wf2W2SIkOGf0gfRdRRRMa7mivcuHug95K9Ty8B7Qia87MP18Q+s5
	nVIMAex2RT+fIAhaG1Q4AH+JtO0rdAk+oGjhosunTO3mT3E6MHnTNnFg3BiH80JqNBSTAvUHBLcRG
	HOe314pwMzF8jGLSPJ6ltOFMvCAC1dc2SelAuFgIJfkcsmPfkE2aw7J2QUH5aolNsySF5y2VaSTPK
	EkcHnYhND41x1WK5eVyiR26VP6wQKP09ObzwzVYP81ooQYwUchF8ZO14d9UNwGBs3AyW6aYbfJch/
	qW4o3cgdVa+kYGzrrcnA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nzXfw-0064qj-Nw; Fri, 10 Jun 2022 05:59:16 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nzXfl-0064lz-Fy; Fri, 10 Jun 2022 05:59:06 +0000
X-UUID: 4d733b52a57a4a1995ac9420be1d8d88-20220609
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.5,REQID:884b307e-b258-41a5-b31e-a097422af9dd,OB:0,LO
	B:0,IP:0,URL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,RULE:Release_Ham,ACTI
	ON:release,TS:0
X-CID-META: VersionHash:2a19b09,CLOUDID:a413e67e-c8dc-403a-96e8-6237210dceee,C
	OID:IGNORED,Recheck:0,SF:nil,TC:nil,Content:0,EDM:-3,IP:nil,URL:0,File:nil
	,QS:0,BEC:nil
X-UUID: 4d733b52a57a4a1995ac9420be1d8d88-20220609
Received: from mtkcas68.mediatek.inc [(172.29.94.19)] by mailgw01.mediatek.com
	(envelope-from <james.lo@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
	with ESMTP id 1323858521; Thu, 09 Jun 2022 22:58:53 -0700
Received: from mtkmbs10n2.mediatek.inc (172.21.101.183) by
 MTKMBS62N1.mediatek.inc (172.29.193.41) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Thu, 9 Jun 2022 22:58:51 -0700
Received: from mtkcas10.mediatek.inc (172.21.101.39) by
 mtkmbs10n2.mediatek.inc (172.21.101.183) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id 15.2.792.3;
 Fri, 10 Jun 2022 13:58:50 +0800
Received: from mtksdccf07 (172.21.84.99) by mtkcas10.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Fri, 10 Jun 2022 13:58:44 +0800
Message-ID: <34c4b4ba35054baa0f969936a4ca7252c5bd7629.camel@mediatek.com>
Subject: Re: [v10 1/1] thermal: mediatek: add another get_temp ops for
 thermal sensors
From: James Lo <james.lo@mediatek.com>
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	"Rafael J . Wysocki" <rafael@kernel.org>, Daniel Lezcano
	<daniel.lezcano@linaro.org>, Matthias Brugger <matthias.bgg@gmail.com>,
	<linux-pm@vger.kernel.org>
CC: <linux-arm-kernel@lists.infradead.org>,
	<linux-mediatek@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
	<Project_Global_Chrome_Upstream_Group@mediatek.com>, Fan Chen
	<fan.chen@mediatek.com>, Louis Yu <louis.yu@mediatek.com>, Michael Kao
	<michael.kao@mediatek.com>, Hsin-Yi Wang <hsinyi@chromium.org>, Ben Tseng
	<ben.tseng@mediatek.com>
Date: Fri, 10 Jun 2022 13:58:44 +0800
In-Reply-To: <aed584c0-f097-fdef-8078-a7c457d1cb1a@collabora.com>
References: <20220519101044.16765-1-james.lo@mediatek.com>
	 <aed584c0-f097-fdef-8078-a7c457d1cb1a@collabora.com>
X-Mailer: Evolution 3.28.5-0ubuntu0.18.04.2 
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220609_225905_566342_35B982F5 
X-CRM114-Status: GOOD (  11.56  )
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

On Thu, 2022-05-19 at 13:12 +0200, AngeloGioacchino Del Regno wrote:
> Il 19/05/22 12:10, James Lo ha scritto:
> > Provide thermal zone to read thermal sensor
> > in the SoC. We can read all the thermal sensors
> > value in the SoC by the node /sys/class/thermal/
> > 
> > In mtk_thermal_bank_temperature, return -EAGAIN instead of -EACCESS
> > on the first read of sensor that often are bogus values.
> > This can avoid following warning on boot:
> > 
> >    thermal thermal_zone6: failed to read out thermal zone (-13)
> > 
> > Signed-off-by: Michael Kao <michael.kao@mediatek.com>
> > Signed-off-by: Hsin-Yi Wang <hsinyi@chromium.org>
> > Signed-off-by: Ben Tseng <ben.tseng@mediatek.com>
> > Signed-off-by: James Lo <james.lo@mediatek.com>
> 
> Reviewed-by: AngeloGioacchino Del Regno <
> angelogioacchino.delregno@collabora.com>
> 

Hello Rafael, Daniel and Matthias,

Can you give us some suggestions for this patch?
Thanks!

BRs,
James


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
