Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7717DC6FA91
	for <linux-mediatek@archiver.kernel.org>; Fri, 23 Sep 2022 10:02:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Content-Type:References:In-Reply-To:Date:CC:To:From:Subject:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=v/qG9fxATKm3vUoRKPm9Tz2iucvTSL2B8IYNIBhPiA4=; b=fjQVNME6HLTl4EneuRzZfOfdc0
	sakFDol/D2YZcEydSTdpYKD3pDGvOHp24Te94u7YijAIkTRst3xHATG2Yg5VEWr3JltRgmQVdSvrc
	oASw4uMswQkwarE+/pu1x7ms9MTU+lVm3RJWoNoE19ToQ8sOH2QYJVYKY77NA8g0A/f4NfXCCU9iE
	z546QIASJQ/BvWWDS9tuJ7Ux7uQmfv8oMb92IXhW/7oU7NMl0URnUxskCbdIUlbCK+1bWKezg0GcC
	oF7H2QoihuTy+ld7VBsiIfL6UD6qVRF0FAvOFc74jFRe6UAa+8R7e+da43XBueg7cYO8hemDE/MJR
	zoxDAovQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1obfVT-003XVY-2M; Fri, 23 Sep 2022 10:02:03 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1obfVH-003XRb-7r; Fri, 23 Sep 2022 10:01:52 +0000
X-UUID: 37f5ae052732430d9b584ead170026b4-20220923
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Transfer-Encoding:MIME-Version:Content-Type:References:In-Reply-To:Date:CC:To:From:Subject:Message-ID; bh=v/qG9fxATKm3vUoRKPm9Tz2iucvTSL2B8IYNIBhPiA4=;
	b=uM1Rk9KD8gHjoRtSpCyXAib+HYf0uoSYKY+M/ea+bpx+Pp8rQMZ9yr7PUJeKV5vyixrPBRylgI23hdlat1O1kFbkulxDp/p8Ss9Bfbs7NwY9iBMH9IbLVFwaKXiKF19g9vO3N9MwBjqQpXh+9Qtp3UeFKkPpHNeeX01VoNYdXKQ=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.11,REQID:b211c921-8559-45f7-a334-f8e88d861036,IP:0,U
	RL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
	release,TS:0
X-CID-META: VersionHash:39a5ff1,CLOUDID:d6d9daa2-dc04-435c-b19b-71e131a5fc35,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:nil,TC:nil,Content:0,EDM:-3,IP:nil,U
	RL:0,File:nil,Bulk:nil,QS:nil,BEC:nil,COL:0
X-UUID: 37f5ae052732430d9b584ead170026b4-20220923
Received: from mtkmbs11n1.mediatek.inc [(172.21.101.185)] by mailgw02.mediatek.com
	(envelope-from <xinlei.lee@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 1561473627; Fri, 23 Sep 2022 02:57:49 -0700
Received: from mtkmbs11n1.mediatek.inc (172.21.101.185) by
 mtkmbs10n1.mediatek.inc (172.21.101.34) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.792.15; Fri, 23 Sep 2022 17:27:13 +0800
Received: from mszsdhlt06 (10.16.6.206) by mtkmbs11n1.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.2.792.15 via Frontend
 Transport; Fri, 23 Sep 2022 17:27:13 +0800
Message-ID: <95bcba12c6dbcffdcf5256f8836eeb16425dd1c5.camel@mediatek.com>
Subject: Re: [PATCH v9,0/3] Add dpi output format control for MT8186
From: xinlei.lee <xinlei.lee@mediatek.com>
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	<matthias.bgg@gmail.com>, <jason-jh.lin@mediatek.com>,
	<rex-bc.chen@mediatek.com>, <ck.hu@mediatek.com>, <p.zabel@pengutronix.de>,
	<airlied@linux.ie>, <daniel@ffwll.ch>
CC: <dri-devel@lists.freedesktop.org>, <linux-mediatek@lists.infradead.org>,
	<linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
	<Project_Global_Chrome_Upstream_Group@mediatek.com>, <jitao.shi@mediatek.com>
Date: Fri, 23 Sep 2022 17:27:13 +0800
In-Reply-To: <b11fec5e-0725-be3c-4b4b-0e68bf00c10d@collabora.com>
References: <1663922440-20242-1-git-send-email-xinlei.lee@mediatek.com>
	 <b11fec5e-0725-be3c-4b4b-0e68bf00c10d@collabora.com>
Content-Type: text/plain; charset="UTF-8"
X-Mailer: Evolution 3.28.5-0ubuntu0.18.04.2 
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220923_030151_296544_C16511BA 
X-CRM114-Status: GOOD (  11.57  )
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
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On Fri, 2022-09-23 at 11:19 +0200, AngeloGioacchino Del Regno wrote:
> Il 23/09/22 10:40, xinlei.lee@mediatek.com ha scritto:
> > From: Xinlei Lee <xinlei.lee@mediatek.com>
> > 
> > Base on the branch of ck-linux-next/mediatek-drm-fixes.
> > 
> 
> Hello Xinlei,
> 
> I've reviewed v8 just some minutes before you pushed this v9.
> 
> Can you please make the requested changes from v8 on patch [2/3] and
> push a v10 retaining the Reviewed-by tags that I released on v8?
> 
> Thanks,
> Angelo
> 
> 
Hi Angelo:

Thanks for your review.

I will add your Reviewed-by tag in v10 and move the position of the
member variable.

Best Regards!
Xinlei


