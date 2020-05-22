Return-Path: <SRS0=9rwW=7E=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.2 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,UNPARSEABLE_RELAY,URIBL_BLOCKED,USER_AGENT_SANE_2 autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 04EFCC433E0
	for <linux-mediatek@archiver.kernel.org>; Fri, 22 May 2020 04:09:51 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id BBCF420748
	for <linux-mediatek@archiver.kernel.org>; Fri, 22 May 2020 04:09:50 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="Uc+Oy530";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b="FVd2BM88"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org BBCF420748
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Date:To:From:Subject:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=jY1+HSqWXqNF9bjoY84bsjp/453kQtxqECuPA18n5q4=; b=Uc+Oy530Q3f1v/
	I8tQbzKe+zs1bvmugTPF/oWdP9jH409Ka7QVPEGJ/BVWdnZ5YOn5xdfQr9xyEv0pW/qPY9EJ/N+Fm
	+ng0ANdseSDWF4yKmsyGulXyx5fMLBEFjj/3A9uHl70++oEo/cS9QU4nBXq0Qh1pvtTeBSm8kGPRO
	DLOV8mragfLSkiFCuX7xPdtqPcF7n8f6DnfWMlTt8D8+y0VkeaQz6tmZc5Ow5gR5emj+9FY1vwYSd
	OMqnjEnlxGT4N7wGfqpYcTm9AFCYooVwniU9QWEG0Hxb2E5lwuLQiL8UCJqgrzf77t8Nd1iZfX2aK
	KBrehQFXInaxs9tKKa0Q==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jbz0A-0004vd-9k; Fri, 22 May 2020 04:09:42 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jbz07-0004un-Lk; Fri, 22 May 2020 04:09:41 +0000
X-UUID: 70e790e626c74bc28dcefc8cd916dd6b-20200521
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:MIME-Version:Content-Type:References:In-Reply-To:Date:CC:To:From:Subject:Message-ID;
 bh=X47htdhmQH4NMD8VYo9Wr+NebWgg/Igukck/NyzLjDY=; 
 b=FVd2BM88NwlDWXM+H49UDz6JLO63itSZEJExahDZlDYS0b8yVRQI8pi9r/iJ/JlkIUNluCjiqRYEgh3f5dRNnnLu6210C/X35dGCHp5jzAjlixfjpjucvBHg9j6i5gSgIxGewVpQ41Dj0QAQHDh/Q8m9e8wiedFjo8LEbk9lEO0=;
X-UUID: 70e790e626c74bc28dcefc8cd916dd6b-20200521
Received: from mtkcas67.mediatek.inc [(172.29.193.45)] by mailgw02.mediatek.com
 (envelope-from <michael.kao@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLS)
 with ESMTP id 45983275; Thu, 21 May 2020 20:09:22 -0800
Received: from MTKMBS07N2.mediatek.inc (172.21.101.141) by
 MTKMBS62N1.mediatek.inc (172.29.193.41) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Thu, 21 May 2020 21:09:33 -0700
Received: from mtkcas07.mediatek.inc (172.21.101.84) by
 mtkmbs07n2.mediatek.inc (172.21.101.141) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Fri, 22 May 2020 12:09:30 +0800
Received: from [172.21.84.99] (172.21.84.99) by mtkcas07.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Fri, 22 May 2020 12:09:30 +0800
Message-ID: <1590120571.22249.25.camel@mtksdccf07>
Subject: Re: [v4,0/7] Add Mediatek thermal dirver and dtsi
From: Michael Kao <michael.kao@mediatek.com>
To: Matthias Brugger <matthias.bgg@gmail.com>
Date: Fri, 22 May 2020 12:09:31 +0800
In-Reply-To: <7e205390-c7a7-b8c9-3ba2-344a04dc6696@gmail.com>
References: <20200323121537.22697-1-michael.kao@mediatek.com>
 <7e205390-c7a7-b8c9-3ba2-344a04dc6696@gmail.com>
X-Mailer: Evolution 3.2.3-0ubuntu6 
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200521_210939_716596_053AF181 
X-CRM114-Status: GOOD (  18.12  )
X-BeenThere: linux-mediatek@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <linux-mediatek.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mediatek>, 
 <mailto:linux-mediatek-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mediatek/>
List-Post: <mailto:linux-mediatek@lists.infradead.org>
List-Help: <mailto:linux-mediatek-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mediatek>, 
 <mailto:linux-mediatek-request@lists.infradead.org?subject=subscribe>
Cc: Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org,
 srv_heupstream@mediatek.com, linux-pm@vger.kernel.org,
 Daniel Lezcano <daniel.lezcano@linaro.org>, linux-kernel@vger.kernel.org,
 Eduardo Valentin <edubezval@gmail.com>, Rob Herring <robh+dt@kernel.org>,
 linux-mediatek@lists.infradead.org, hsinyi@chromium.org,
 Zhang Rui <rui.zhang@intel.com>, linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On Thu, 2020-05-21 at 14:51 +0200, Matthias Brugger wrote:
> Hi Michael,
> 
> On 23/03/2020 13:15, Michael Kao wrote:
> > This patchset supports for MT8183 chip to mtk_thermal.c.
> > Add thermal zone of all the thermal sensor in SoC for
> > another get temperatrue. They don't need to thermal throttle.
> > And we bind coolers for thermal zone nodes of cpu_thermal.
> > 
> > Rebase to kernel-5.6-rc1.
> > 
> > Update content:
> > 
> > [1/7]
> >     - Squash thermal zone settings in the dtsi from [v3,5/8]
> >       arm64: dts: mt8183: Increase polling frequency for CPU thermal zone
> > 
> >     - Remove the property of interrupts and mediatek,hw-reset-temp
> > 
> > [2/7]
> >     - Correct commit message
> > 
> > [4/7]
> >     - Change the target temperature to the 80C and change the commit message
> > 
> > [6/7]
> >     - Adjust newline alignment
> > 
> >     - Fix the judgement on the return value of registering thermal zone
> > 
> > This patch series base on these patches [1].
> > 
> > [v7,3/3] PM / AVS: SVS: Introduce SVS engine (https://patchwork.kernel.org/patch/11439829/)
> > 
> > Matthias Kaehlcke (1):
> >   arm64: dts: mt8183: Configure CPU cooling
> > 
> > Michael Kao (6):
> >   arm64: dts: mt8183: add thermal zone node
> >   arm64: dts: mt8183: add dynamic power coefficients
> >   arm64: dts: mt8183: Add #cooling-cells to CPU nodes
> >   thermal: mediatek: mt8183: fix bank number settings
> 
> Do I understand correctly that we need to fix the bank number before we can add
> the device tree changes. And that the last two patches are enhancements for the
> driver but needed to get a working version?
> 
> Regards,
> Matthias
> 
Hi Matthias,

There is one bank setting of mt8183 config.
If the device tree merged first. I worry that it will crash when the
thermal zone read temperature.
It will access the invalid index of bank.
So please wait the patch "fix bank number settings " merged first.
Thanks!

/* MT8183 thermal sensor data */
static const int mt8183_bank_data[MT8183_NUM_SENSORS] = {
	MT8183_TS1, MT8183_TS2, MT8183_TS3, MT8183_TS4, MT8183_TS5,
MT8183_TSABB
}; 

Best Regards,
Michael


> >   thermal: mediatek: add another get_temp ops for thermal sensors
> >   thermal: mediatek: use spinlock to protect PTPCORESEL
> > 
> >  arch/arm64/boot/dts/mediatek/mt8183.dtsi | 156 +++++++++++++++++++++++
> >  drivers/thermal/mtk_thermal.c            |  88 +++++++++++--
> >  2 files changed, 231 insertions(+), 13 deletions(-)
> > 

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
