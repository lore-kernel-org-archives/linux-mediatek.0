Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B19F5C433F5
	for <linux-mediatek@archiver.kernel.org>; Thu, 21 Apr 2022 09:34:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Date:CC:To:From:Subject:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=AeMV7Ii3RqzFchlGpVLTGN5n/EUSclDRSbmy2NP1bjg=; b=onH8XD9rVl51q9
	DXF3/SQvuymt96wKMd2YHxAobWfJZYL2aSSS6k7XWSRS33OM76LVQlGsCtYUUSghE8mgHqJ4WuZEJ
	up+MS3YzPkEQZINp527sk+w/ijnX8rLdO7O0exZckkw2fKPVj3PvDpvsGpA77GAfyfgtJBVJHUlpn
	KCvB6XykWTLPRkJZ6qS5IdbKjyGd9N1Yj0s3zywecyYhwbSo4Geef9ykKpdCDqEOoEmDpqVZKB/cb
	T2OWlE3fVJxXvoFzSuHjeoJBUuNEmsrXV95FsF3LsYX91ugW0RmwVz/6EwgvOnTwN0iKgwjzymI1x
	f2Z0bHdktQUBn+EboM0w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nhTCG-00CmBy-Gv; Thu, 21 Apr 2022 09:33:56 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nhTC5-00Cm8o-Co; Thu, 21 Apr 2022 09:33:47 +0000
X-UUID: 298252e5cf43498ea045cf4491ebcb0c-20220421
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.4, REQID:85874407-4591-4e37-8a2f-34f24a84bfff, OB:0,
 LO
 B:0,IP:0,URL:8,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,RULE:Release_Ham,ACTI
 ON:release,TS:8
X-CID-META: VersionHash:faefae9, CLOUDID:acb679f0-da02-41b4-b6df-58f4ccd36682,
 C
 OID:IGNORED,Recheck:0,SF:nil,TC:nil,Content:0,EDM:-3,File:nil,QS:0,BEC:nil
X-UUID: 298252e5cf43498ea045cf4491ebcb0c-20220421
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw01.mediatek.com
 (envelope-from <roger.lu@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 1692807866; Thu, 21 Apr 2022 02:33:40 -0700
Received: from mtkmbs10n1.mediatek.inc (172.21.101.34) by
 MTKMBS62DR.mediatek.inc (172.29.94.18) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Thu, 21 Apr 2022 02:28:37 -0700
Received: from mtkcas10.mediatek.inc (172.21.101.39) by
 mtkmbs10n1.mediatek.inc (172.21.101.34) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.2.792.15; Thu, 21 Apr 2022 17:28:35 +0800
Received: from mtksdccf07 (172.21.84.99) by mtkcas10.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Thu, 21 Apr 2022 17:28:35 +0800
Message-ID: <3d463c8b099fdb1c9a0df9e615a8ca1d8a034120.camel@mediatek.com>
Subject: Re: [PATCH v24 0/7] soc: mediatek: SVS: introduce MTK SVS
From: Roger Lu <roger.lu@mediatek.com>
To: Kevin Hilman <khilman@kernel.org>, Matthias Brugger
 <matthias.bgg@gmail.com>, Enric Balletbo Serra <eballetbo@gmail.com>, "Rob
 Herring" <robh+dt@kernel.org>, Nicolas Boichat <drinkcat@google.com>, Stephen
 Boyd <sboyd@kernel.org>, Philipp Zabel <p.zabel@pengutronix.de>
CC: Fan Chen <fan.chen@mediatek.com>, HenryC Chen <HenryC.Chen@mediatek.com>, 
 Xiaoqing Liu <Xiaoqing.Liu@mediatek.com>, Charles Yang
 <Charles.Yang@mediatek.com>, Angus Lin <Angus.Lin@mediatek.com>, Mark Rutland
 <mark.rutland@arm.com>, Nishanth Menon <nm@ti.com>,
 <devicetree@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
 <linux-mediatek@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
 <linux-pm@vger.kernel.org>,
 <Project_Global_Chrome_Upstream_Group@mediatek.com>, Guenter Roeck
 <linux@roeck-us.net>, Jia-wei Chang <jia-wei.chang@mediatek.com>
Date: Thu, 21 Apr 2022 17:28:35 +0800
In-Reply-To: <7hczhbe3wn.fsf@baylibre.com>
References: <20220420102044.10832-1-roger.lu@mediatek.com>
 <7hczhbe3wn.fsf@baylibre.com>
X-Mailer: Evolution 3.28.5-0ubuntu0.18.04.2 
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220421_023345_474310_9698A709 
X-CRM114-Status: GOOD (  23.85  )
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

On Wed, 2022-04-20 at 16:22 -0700, Kevin Hilman wrote:
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
> > 1. SVS driver uses OPP adjust event in [1] to update OPP table voltage part.
> > 2. SVS driver gets thermal/GPU device by node [2][3] and CPU device by
> > get_cpu_device().
> > After retrieving subsys device, SVS driver calls device_link_add() to make
> > sure probe/suspend callback priority.
> > 
> > [1] 
> > https://urldefense.com/v3/__https://git.kernel.org/pub/scm/linux/kernel/git/vireshk/pm.git/commit/?h=opp*linux-next&id=25cb20a212a1f989385dfe23230817e69c62bee5__;Lw!!CTRNKA9wMg0ARbw!3gWsdVuiyF0iafrmVINP9FVz7fjGB1UqTPLfMNWEhsl96RDPB-Se6Q-g3F8daK-u$
> >  
> > [2] 
> > https://urldefense.com/v3/__https://git.kernel.org/pub/scm/linux/kernel/git/vireshk/pm.git/commit/?h=opp*linux-next&id=b325ce39785b1408040d90365a6ab1aa36e94f87__;Lw!!CTRNKA9wMg0ARbw!3gWsdVuiyF0iafrmVINP9FVz7fjGB1UqTPLfMNWEhsl96RDPB-Se6Q-g3Lel3h4j$
> >  
> > [3] 
> > https://urldefense.com/v3/__https://git.kernel.org/pub/scm/linux/kernel/git/matthias.bgg/linux.git/commit/?h=v5.16-next*dts64&id=a8168cebf1bca1b5269e8a7eb2626fb76814d6e2__;Lw!!CTRNKA9wMg0ARbw!3gWsdVuiyF0iafrmVINP9FVz7fjGB1UqTPLfMNWEhsl96RDPB-Se6Q-g3KhMdm00$
> >  
> > 
> > Change since v23:
> > - Change wording from "Mediatek" to "MediaTek" (uppercase T) in mtk-
> > svs.yaml.
> > - Use cpuidle_pause_and_lock() to prevent system from entering cpuidle
> > instead of applying pm_qos APIs.
> > - Add kfree() at the end of svs_probe() when encountering probe fail.
> > - Change MODULE_LICENSE from "GPL v2" to "GPL".
> > - Add nvmem_cell_put() in error handling when nvmem_cell_read() encounters
> > fail.
> 
> I also gave you a reviewed-by on v23, but here it is again:
> 
> Reviewed-by: Kevin Hilman <khilman@baylibre.com>
> 
> 
> That being said, it would be really nice to see an integration tree
> where this was all tested on mainline (e.g. v5.17, or v5.18-rc)
> 
> For example, I can apply this to v5.18-rc2 and boot on my mt8183-pumpkin
> board, it fails to probe[1] because there is no CCI node in the upstream
> mt8183.dtsi.
> 
> I'm assuming this series is also not very useful without the CPUfreq
> series from Rex, so being able to test this, CCI and CPUfreq together on
> MT8183 on a mainline kernel would be very helpful.
> 
> Kevin
> 
> [1]
> [    0.573332] mtk-svs 1100b000.svs: cannot find cci node
> [    0.574061] mtk-svs 1100b000.svs: error -ENODEV: svs platform probe fail

Just share. I've tested this series on below two platforms and it works as
expected.
- mt8183-Krane (kernel-v5.10)
- mt8192-Hayato (kernel-v5.4)

Sincerely,
Roger Lu.


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
