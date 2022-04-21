Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 459E2C433EF
	for <linux-mediatek@archiver.kernel.org>; Thu, 21 Apr 2022 09:18:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Date:CC:To:From:Subject:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=NHx1OSIKvtOyyIxtL2H30ZsT0Pme1LsPxCSZz8D+HJ8=; b=MCMswdMVSWdoZi
	grKlWvEAy4Mgfndm3n+QLyutqoseAHbXPbg9G0V5ihoJaF/k18z1atWnV+0eUrcWXdM6TZJhRN2ip
	17Be4RQ5RCBdF2G3y6E0KkgqX/22yOjw/Vhkq+w5LSilW+6rNR3JOodAdbkbM4rKv+Adxv8HxP4vB
	70n0WSySvmtyMtCWyvbcwlMttZtzZeAeJLNjqmuRhyftf4DMRFsKTXzfAk1PNwifi3YFV/m+jtbL1
	t3bXHZbTCqeK9ODi4ZPORwdpMXG9PG+jUq22FwK5WUxPhstDFv2Qr+cQF3Bze4MS7cRCWku+bZZdR
	wMC3bWV0W0z3KqGuh2mQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nhSxQ-00CgJy-Fy; Thu, 21 Apr 2022 09:18:36 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nhSwK-00Cflq-Vo; Thu, 21 Apr 2022 09:17:33 +0000
X-UUID: cb3c0b01a7e543559b24c19b56416a1a-20220421
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.4, REQID:767e59f3-42ce-49f2-8b52-c827816d6f69, OB:0,
 LO
 B:0,IP:0,URL:8,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,RULE:Release_Ham,ACTI
 ON:release,TS:8
X-CID-META: VersionHash:faefae9, CLOUDID:121ba3ef-06b0-4305-bfbf-554bfc9d151a,
 C
 OID:IGNORED,Recheck:0,SF:nil,TC:nil,Content:0,EDM:-3,File:nil,QS:0,BEC:nil
X-UUID: cb3c0b01a7e543559b24c19b56416a1a-20220421
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw02.mediatek.com
 (envelope-from <roger.lu@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 1858748955; Thu, 21 Apr 2022 02:17:21 -0700
Received: from mtkexhb02.mediatek.inc (172.21.101.103) by
 MTKMBS62N2.mediatek.inc (172.29.193.42) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Thu, 21 Apr 2022 02:11:28 -0700
Received: from mtkcas11.mediatek.inc (172.21.101.40) by mtkexhb02.mediatek.inc
 (172.21.101.103) with Microsoft SMTP Server (TLS) id 15.0.1497.2;
 Thu, 21 Apr 2022 17:11:26 +0800
Received: from mtksdccf07 (172.21.84.99) by mtkcas11.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Thu, 21 Apr 2022 17:11:26 +0800
Message-ID: <87d953ecfae99e786b0bc3c3756816114e3af287.camel@mediatek.com>
Subject: Re: [PATCH v24 3/7] soc: mediatek: SVS: introduce MTK SVS engine
From: Roger Lu <roger.lu@mediatek.com>
To: Kevin Hilman <khilman@kernel.org>, Matthias Brugger
 <matthias.bgg@gmail.com>, Enric Balletbo Serra <eballetbo@gmail.com>, "Rob
 Herring" <robh+dt@kernel.org>, Nicolas Boichat <drinkcat@google.com>,
 "Stephen Boyd" <sboyd@kernel.org>, Philipp Zabel <p.zabel@pengutronix.de>
CC: Fan Chen <fan.chen@mediatek.com>, HenryC Chen <HenryC.Chen@mediatek.com>, 
 Xiaoqing Liu <Xiaoqing.Liu@mediatek.com>, Charles Yang
 <Charles.Yang@mediatek.com>, Angus Lin <Angus.Lin@mediatek.com>, Mark Rutland
 <mark.rutland@arm.com>, Nishanth Menon <nm@ti.com>,
 <devicetree@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
 <linux-mediatek@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
 <linux-pm@vger.kernel.org>,
 <Project_Global_Chrome_Upstream_Group@mediatek.com>, Guenter Roeck
 <linux@roeck-us.net>, Jia-wei Chang <jia-wei.chang@mediatek.com>
Date: Thu, 21 Apr 2022 17:11:26 +0800
In-Reply-To: <7h5yn3s3jq.fsf@baylibre.com>
References: <20220420102044.10832-1-roger.lu@mediatek.com>
 <20220420102044.10832-4-roger.lu@mediatek.com>
 <7h5yn3s3jq.fsf@baylibre.com>
X-Mailer: Evolution 3.28.5-0ubuntu0.18.04.2 
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220421_021729_082879_76892E58 
X-CRM114-Status: GOOD (  23.22  )
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

Hi Kevin,

Thanks very much for the feedback.

On Wed, 2022-04-20 at 17:06 -0700, Kevin Hilman wrote:
> Hi Roger,
> 
> 
> Roger Lu <roger.lu@mediatek.com> writes:
> 
> > The Smart Voltage Scaling(SVS) engine is a piece of hardware
> > which calculates suitable SVS bank voltages to OPP voltage table.
> > Then, DVFS driver could apply those SVS bank voltages to PMIC/Buck
> > when receiving OPP_EVENT_ADJUST_VOLTAGE.
> > 
> > Signed-off-by: Roger Lu <roger.lu@mediatek.com>
> > Reviewed-by: AngeloGioacchino Del Regno <
> > angelogioacchino.delregno@collabora.com>
> 
> Can SVS work with one or the other clusters disabled?  It seems like it
> should still be able to work.  However, if you disable the 2nd cluster
> (e.g. by passing `maxcpus=4` on the kernel command-line, the SVS driver
> will fail to probe.
> 
> I dont' think it's a blocker for merging this series, but making the
> probe a bit more robust so it can handle the cluster being disabled
> would be nice additional fix for later.
> 
> For example, upstream kernel on mt8183-pumpkin board is very unstable
> with the 2nd cluster enabled (I'm still trying to debug why), but I have
> to boot with `maxcpus=4` on the cmdline, otherwise kernel fails to boot,
> so that's how I noticed this probe failure with SVS.

On mt8183 platform, I think SVS can work with one or the other clusters
disabled. However, SVS is supposed to be enabled after system is stable for not
involving any power unstable concern.

If we want part of SVS works at the development stage, we can disable non-
working svs bank as below. Thanks.

--- a/drivers/soc/mediatek/mtk-svs.c
+++ b/drivers/soc/mediatek/mtk-svs.c
@@ -2164,7 +2164,7 @@ static struct svs_bank svs_mt8183_banks[] = {
                .cpu_id                 = 4,
                .buck_name              = "proc",
                .volt_flags             = SVSB_INIT01_VOLT_INC_ONLY,
-               .mode_support           = SVSB_MODE_INIT01 | SVSB_MODE_INIT02,
+               .mode_support           = SVSB_MODE_ALL_DISABLE,
                .opp_count              = MAX_OPP_ENTRIES,

> 
> Kevin


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
