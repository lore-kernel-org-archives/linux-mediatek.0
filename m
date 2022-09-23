Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9B486C6FA82
	for <linux-mediatek@archiver.kernel.org>; Fri, 23 Sep 2022 05:25:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Content-Type:References:In-Reply-To:Date:CC:To:From:Subject:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=1KZyGx1JqtxeTxG8MfIi+v7uhwTWWMglV+1MnUR2ayE=; b=OIIK46eoxR0t1KtBhA+Q7x5npf
	r3ZCo3TXjpiKLrLqr6J5cvTCbjTA0pm2vPZVuO6pdCCMChA+Ae3LKXlY64A5hDJdgsxntRZvR7Cm0
	J9FkfFn+f0B83zb6QRiPEnAvRiXuKU1KPJHXEAivfF6Pm4FHOXwhmBXYlPFaXRwGgluE3lggTySg9
	H4yTxmcMXLe8nKg4ti9u67XOYmLgZZhEv9kYzgrQ33ZM55aP4YOGQxZ97JfLNyb1BWkSBCz0skgE1
	ZKlCNf0aQ3wfOvRfcxzZBIumIu8wg9ZHO2y74xAjm8LFW6Io9mk4qe0zX/OyZh2Ild6c3dRcL0ANk
	x+O/HbNA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1obbBI-002Jxt-Oa; Fri, 23 Sep 2022 05:24:56 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1obbB7-002JwQ-5Y; Fri, 23 Sep 2022 05:24:46 +0000
X-UUID: 93508129597642428e54a6e0c0c24d32-20220922
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Transfer-Encoding:MIME-Version:Content-Type:References:In-Reply-To:Date:CC:To:From:Subject:Message-ID; bh=1KZyGx1JqtxeTxG8MfIi+v7uhwTWWMglV+1MnUR2ayE=;
	b=TdXRbfZ/8IpUgA+lgxgn3KDZv+0j7EA5CWlc4TohCN8q+rZHaFNgrEY7V+31LDmlQrDDAODk9tPs7vKTjb8uosN+bowdeTcGP3dXobFf0JJWKfBEgtkEbWWOTcUzeov0ZfCj3qbXbrBvzFeJmxO3xusmM7zq42IjKXLmPmyPWOo=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.11,REQID:52dc7130-5074-41da-8076-91853948634b,IP:0,U
	RL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
	release,TS:0
X-CID-META: VersionHash:39a5ff1,CLOUDID:1469d1a2-dc04-435c-b19b-71e131a5fc35,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:nil,TC:nil,Content:0,EDM:-3,IP:nil,U
	RL:0,File:nil,Bulk:nil,QS:nil,BEC:nil,COL:0
X-UUID: 93508129597642428e54a6e0c0c24d32-20220922
Received: from mtkmbs11n1.mediatek.inc [(172.21.101.185)] by mailgw01.mediatek.com
	(envelope-from <trevor.wu@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 123072555; Thu, 22 Sep 2022 22:20:28 -0700
Received: from mtkmbs11n2.mediatek.inc (172.21.101.187) by
 mtkmbs11n2.mediatek.inc (172.21.101.187) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.792.15; Fri, 23 Sep 2022 12:39:54 +0800
Received: from mtksdccf07 (172.21.84.99) by mtkmbs11n2.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.2.792.15 via Frontend
 Transport; Fri, 23 Sep 2022 12:39:54 +0800
Message-ID: <978af4cc1a8bfa92675bb201947cfdac1e5429f1.camel@mediatek.com>
Subject: Re: [PATCH] ASoC: mediatek: mt8195-mt6359: Use snd_soc_pm_ops
 instead of custom ops
From: Trevor Wu <trevor.wu@mediatek.com>
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, Mark
 Brown <broonie@kernel.org>, Tzung-Bi Shih <tzungbi@kernel.org>
CC: <alsa-devel@alsa-project.org>, <linux-kernel@vger.kernel.org>,
	<tiwai@suse.com>, <lgirdwood@gmail.com>,
	<linux-mediatek@lists.infradead.org>, <matthias.bgg@gmail.com>,
	<linux-arm-kernel@lists.infradead.org>
Date: Fri, 23 Sep 2022 12:39:54 +0800
In-Reply-To: <ce4a6e7f-dee3-c260-bd42-bc77927916e8@collabora.com>
References: <20220922103502.49981-1-angelogioacchino.delregno@collabora.com>
	 <YyxGXXSp2JD9a6ah@google.com> <YyxjZ9nCBdVovkVs@sirena.org.uk>
	 <ce4a6e7f-dee3-c260-bd42-bc77927916e8@collabora.com>
Content-Type: text/plain; charset="UTF-8"
X-Mailer: Evolution 3.28.5-0ubuntu0.18.04.2 
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220922_222445_229911_8172F464 
X-CRM114-Status: GOOD (  20.43  )
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

On Thu, 2022-09-22 at 16:10 +0200, AngeloGioacchino Del Regno wrote:
> Il 22/09/22 15:30, Mark Brown ha scritto:
> > On Thu, Sep 22, 2022 at 07:26:21PM +0800, Tzung-Bi Shih wrote:
> > 
> > > snd_soc_pm_ops[1] sets some more fields.  I'm not quite sure
> > > whether
> > > it would introduce any side effect or not.  Perhaps Trevor could
> > > provide some suggestions.
> > 
> > If it does it should be to fix isues rather than introduce new
> > problems - I suspect the other operations just don't work
> > currently.
> 
>  From my upstream tests, this didn't introduce any issues, that's why
> I've
> sent this patch.
> 
> In any case, let's check with Trevor, just as to be extremely sure,
> but please
> use an upstream kernel for eventual tests, as there are quite a bit
> of changes
> between 5.10 and current upstream.
> 
> Cheers,
> Angelo

I think it's not a big risk if Angelo already did the test and
snd_soc_pm_ops is also used in MT8186.
I can help do more tests on 5.10 when the patch is back to chromium in
the future.
MTK also have a plan to support complete suspend/resume functionality
in MT8195. If Tzung-bi has concerns about the patch, I can help submit
the patch at the time.

Thanks,
Trevor


