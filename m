Return-Path: <SRS0=sDSL=4F=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.2 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,URIBL_BLOCKED,
	USER_AGENT_SANE_2 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5E81AC3B185
	for <linux-mediatek@archiver.kernel.org>; Mon, 17 Feb 2020 10:15:45 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 21B0C20725
	for <linux-mediatek@archiver.kernel.org>; Mon, 17 Feb 2020 10:15:45 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="EfqOe/wY";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b="G+b/Ifdw"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 21B0C20725
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Date:To:From:Subject:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=1u503ciBOCCnRlGwzJAzQgdPLSQwOuDvR9VvBlyp53s=; b=EfqOe/wY9HwkDI
	bWFHxo3N8V2fIdpmU4lanzHAiLKkhpKtOggupdYFL9EtrynSHLDugwgoI0+yOzVaPer+y8Du9D+4G
	dZ16s7yFMeVPR/5HMXhVuxQJGs4JV9oJuC4RtFO3MJ8BZ2CKTgNzYiknuYNcI/T1ABv2JgEbiEBhG
	Yoj75vizGi2KvqnQWgq2P9v4+b4SnuYtPHLpF/4jTnkQUdu9OavzOGByTUvQGni6RGopw4aoIMAKp
	9PUwLaUWbasMqRPF6nKwcs52pNcTA4okW18jQtY4kyLoZAOVI8XPxXqPSoLgBhG/NG4/MnwfxA12H
	Y78JIObZbxAv07D3bkkA==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1j3dRA-0003YM-Uc; Mon, 17 Feb 2020 10:15:36 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1j3dR2-0003Pz-7q; Mon, 17 Feb 2020 10:15:29 +0000
X-UUID: 7957a477d40e4ef0b46a597c51d8746f-20200217
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:MIME-Version:Content-Type:References:In-Reply-To:Date:CC:To:From:Subject:Message-ID;
 bh=ABI0N2j/Jh+drizYMIhvk5l8R+23rLL1RNKJu4e6TbI=; 
 b=G+b/IfdwcG3M8LNEPiHJAT5OhXWEJsTb08T16n0eZiJnYalDcqUirVFDMgpUxjL4aOVuSxItbkeWmV8Br9pdESUwUaPsik++imSBJfsgqJK9wCrYYj1hs9dM/+QJU0k1Xc4jQ7RVZxjKwKA+3uFKqkZgovD92Nv2XIbHxHBbvM4=;
X-UUID: 7957a477d40e4ef0b46a597c51d8746f-20200217
Received: from mtkcas68.mediatek.inc [(172.29.94.19)] by mailgw02.mediatek.com
 (envelope-from <yong.liang@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLS)
 with ESMTP id 1203119227; Mon, 17 Feb 2020 02:15:24 -0800
Received: from MTKMBS33DR.mediatek.inc (172.27.6.106) by
 MTKMBS62N1.mediatek.inc (172.29.193.41) with Microsoft SMTP Server (TLS) id
 15.0.1395.4; Mon, 17 Feb 2020 02:15:43 -0800
Received: from MTKCAS36.mediatek.inc (172.27.4.186) by MTKMBS33DR.mediatek.inc
 (172.27.6.106) with Microsoft SMTP Server (TLS) id 15.0.1395.4;
 Mon, 17 Feb 2020 18:11:01 +0800
Received: from [10.17.3.153] (10.17.3.153) by MTKCAS36.mediatek.inc
 (172.27.4.170) with Microsoft SMTP Server id 15.0.1395.4 via Frontend
 Transport; Mon, 17 Feb 2020 18:14:35 +0800
Message-ID: <1581934493.27500.4.camel@mhfsdcap03>
Subject: Re: [PATCH 1/1] amr64: dts: modify mt8183.dtsi
From: Yong Liang <yong.liang@mediatek.com>
To: Matthias Brugger <matthias.bgg@gmail.com>
Date: Mon, 17 Feb 2020 18:14:53 +0800
In-Reply-To: <b0345cfc-0e7c-65a8-5ff3-ea064b6c8905@gmail.com>
References: <Add watchdog device node>
 <20200217081922.22544-1-yong.liang@mediatek.com>
 <20200217081922.22544-2-yong.liang@mediatek.com>
 <b0345cfc-0e7c-65a8-5ff3-ea064b6c8905@gmail.com>
X-Mailer: Evolution 3.10.4-0ubuntu2 
MIME-Version: 1.0
X-TM-SNTS-SMTP: C869A12EC30298FAB5FD83CF057EFEA45400B4271D34EE09E02F69FD808CD1172000:8
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200217_021528_290852_E2759E9E 
X-CRM114-Status: GOOD (  14.29  )
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
Cc: "mark.rutland@arm.com" <mark.rutland@arm.com>,
 "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "robh+dt@kernel.org" <robh+dt@kernel.org>,
 "linux-mediatek@lists.infradead.org" <linux-mediatek@lists.infradead.org>,
 "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On Mon, 2020-02-17 at 18:05 +0800, Matthias Brugger wrote:
> 
> On 17/02/2020 09:19, Yong Liang wrote:
> > From: "yong.liang" <yong.liang@mediatek.com>
> > 
> > Add watchdog device node
> > Document base on http://lists.infradead.org/pipermail/linux-mediatek/2020-January/026415.html
> > 
> 
> Commit message shouldn't contain links to the mailinglist this is additional
> information just for review and should go after '---'
> 
> 
> > Signed-off-by: yong.liang <yong.liang@mediatek.com>
> > ---
> 
> Next time please put reference to series your patches are based on here :)
> 
> I fixed the commit message (the subject wasn't really usefull, I fixed that too)
> and pushed it to v5.6-next/dts64
> 
> Thanks,
> Matthias

  Hi Matthias:
     So this patch confirmd to be merged?
     Thansk you very much!
> 
> >  arch/arm64/boot/dts/mediatek/mt8183.dtsi | 7 +++++++
> >  1 file changed, 7 insertions(+)
> > 
> > diff --git a/arch/arm64/boot/dts/mediatek/mt8183.dtsi b/arch/arm64/boot/dts/mediatek/mt8183.dtsi
> > index 10b32471bc7b..8b59e0eba2eb 100644
> > --- a/arch/arm64/boot/dts/mediatek/mt8183.dtsi
> > +++ b/arch/arm64/boot/dts/mediatek/mt8183.dtsi
> > @@ -253,6 +253,13 @@
> >  			#interrupt-cells = <2>;
> >  		};
> >  
> > +		watchdog: watchdog@10007000 {
> > +			compatible = "mediatek,mt8183-wdt",
> > +				     "mediatek,mt6589-wdt";
> > +			reg = <0 0x10007000 0 0x100>;
> > +			#reset-cells = <1>;
> > +		};
> > +
> >  		apmixedsys: syscon@1000c000 {
> >  			compatible = "mediatek,mt8183-apmixedsys", "syscon";
> >  			reg = <0 0x1000c000 0 0x1000>;
> > 

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
