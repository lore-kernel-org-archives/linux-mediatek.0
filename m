Return-Path: <SRS0=WPHR=7H=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.3 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,USER_AGENT_SANE_2 autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 28656C433E0
	for <linux-mediatek@archiver.kernel.org>; Mon, 25 May 2020 02:32:27 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id F005E2076C
	for <linux-mediatek@archiver.kernel.org>; Mon, 25 May 2020 02:32:26 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="HIqzfokv";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b="u7VuTHcf"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org F005E2076C
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Date:To:From:Subject:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=LV0KPKwP5EX1jYiLBMavv7uH8Do1ASgureVSy5SvCA0=; b=HIqzfokvnxtDmO
	TMLK9D51nimfi6p8XEgZRRJrast96TnC/VeVEJciN+8+vS7GUuTlGanSxA1+xIJCodeZeCmBxtic6
	IpmsGkmvmZ89ek+RGOBjkCxeTMqKFa7yu2OK4dyKY7gPzqAOjYRwwVuRLNls7m366sZwgXaxU9g6a
	t9Pc0n3VfHo7AWvtcGIINhyjpa0CaHvqN8V8VY8YBZlhhmGFFdupvN2i/oQsYnw8JlGugQvqxi/ni
	MXL/r0DcWNujRedU1izIm5hAXVcoAjwybLMZoTWJoflKhV2d/pHDmJIeJZ3/ZQqYtlS9qg+HTr4cT
	Y9Zxl2YBHGr4W47vhDQw==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jd2ua-0002GV-56; Mon, 25 May 2020 02:32:20 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jd2tz-0001i9-Q8; Mon, 25 May 2020 02:31:45 +0000
X-UUID: e6ce3daf9c914beabf01cb587a3a05d2-20200524
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:MIME-Version:Content-Type:References:In-Reply-To:Date:CC:To:From:Subject:Message-ID;
 bh=ooK+iIy0dqz3B+xhJunMUOu6PJzalddKbdB9jFuuiGs=; 
 b=u7VuTHcf3wfTIbRVMWoptP87ILwu8lhZR4uArS31w8+PdGNRLcy2IFCsDTc+p1ftoyee6+jgE0zjl4IiEi7pYH+u5t8hQ4QQMDGF/G+pRxzhP0lqb6ZXkC5/LAMNXwgzxEPAP/BnmQH/uSP4SWYVRIFU/dawKz6RGBzmqWjHrA4=;
X-UUID: e6ce3daf9c914beabf01cb587a3a05d2-20200524
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw02.mediatek.com
 (envelope-from <andrew-sh.cheng@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLS)
 with ESMTP id 1472562909; Sun, 24 May 2020 18:31:32 -0800
Received: from MTKMBS07N2.mediatek.inc (172.21.101.141) by
 MTKMBS62N1.mediatek.inc (172.29.193.41) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Sun, 24 May 2020 19:21:30 -0700
Received: from mtkcas07.mediatek.inc (172.21.101.84) by
 mtkmbs07n2.mediatek.inc (172.21.101.141) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Mon, 25 May 2020 10:21:28 +0800
Received: from [172.21.77.4] (172.21.77.4) by mtkcas07.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Mon, 25 May 2020 10:21:27 +0800
Message-ID: <1590373289.12854.3.camel@mtksdaap41>
Subject: Re: [PATCH V3] arm64: dts: mediatek: add cpufreq and cci devfreq
 nodes for mt8183
From: andrew-sh.cheng <andrew-sh.cheng@mediatek.com>
To: Matthias Brugger <matthias.bgg@gmail.com>
Date: Mon, 25 May 2020 10:21:29 +0800
In-Reply-To: <085be59e-76d5-4743-0f0c-12f6440715fe@gmail.com>
References: <1576826785-3867-1-git-send-email-andrew-sh.cheng@mediatek.com>
 <085be59e-76d5-4743-0f0c-12f6440715fe@gmail.com>
X-Mailer: Evolution 3.10.4-0ubuntu2 
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200524_193143_848434_FC354485 
X-CRM114-Status: GOOD (  11.54  )
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
 srv_heupstream@mediatek.com, linux-kernel@vger.kernel.org,
 Rob Herring <robh+dt@kernel.org>, linux-mediatek@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On Sat, 2020-05-23 at 21:04 +0200, Matthias Brugger wrote:
> 
> On 20/12/2019 08:26, Andrew-sh.Cheng wrote:
> > From: "Andrew-sh.Cheng" <andrew-sh.cheng@mediatek.com>
> > 
> > add cpufreq and cci devfreq nodes for mt8183
> > 
> > Depend on regulator node patch:
> > https://patchwork.kernel.org/patch/11284617/
> > 
> > Signed-off-by: Andrew-sh.Cheng <andrew-sh.cheng@mediatek.com>
> > ---
> >  arch/arm64/boot/dts/mediatek/mt8183-evb.dts |  36 ++++
> >  arch/arm64/boot/dts/mediatek/mt8183.dtsi    | 245 ++++++++++++++++++++++++++++
> >  2 files changed, 281 insertions(+)
> > 
> [...]
> > +
> > +	cci: cci {
> > +		compatible = "mediatek,mt8183-cci";
> 
> I wasn't able to find anyprovider for this compatible.
> 
> I'll drop this patch from my queue.
> 
> Regards,
> Matthias
Hi Matthias,

I put the dt-binding at another patch set.
https://patchwork.kernel.org/patch/11559265/
I will integrate this patch with that patch set and resend.
Thank you.

BR
Andrew-sh.Cheng
_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
