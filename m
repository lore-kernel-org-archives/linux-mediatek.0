Return-Path: <SRS0=vEIf=YZ=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.3 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,USER_AGENT_SANE_2 autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9EBAACA9ECB
	for <linux-mediatek@archiver.kernel.org>; Fri,  1 Nov 2019 01:31:56 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 707602086D
	for <linux-mediatek@archiver.kernel.org>; Fri,  1 Nov 2019 01:31:56 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="jio7S6Sh"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 707602086D
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Date:To:From:Subject:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=q8pP3VD1do+uXKeFjdi+B0MH8ASlhEX4OR/gKnoM0b8=; b=jio7S6Shv12Mnu
	h6z0HZhr92Trn5VE4xWMiFtHHvr7oUFaq1Z8jm1gjop0Bfgowl8xeMqwqjYEEQpuDYdpwvuy/QoRe
	m8Ig0YIo7Gg7NICN1oZIPIfoxRRj0FzdZrT/D9DdNQi1HzW/plp4Uu8knd/vAQOFz9k69YQ7oZgIC
	/RWa+xJs0KKYqCT10MJVj0vZJ1ccLcJXUseB5Tkrg9F6PT/zIxtkdteZWVNqYQAjgSZ6StSJKvyNc
	EuBL+zfmTT5F9FPIeV9DdF/s5vOxR591lGrBcVk+RmGYDcsCaEvXlT/VS4stwTdW7jC3EWEALDDIt
	41TOm7GpzgVKEecbUfFw==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1iQLnA-00060R-2U; Fri, 01 Nov 2019 01:31:56 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1iQLn2-0005zI-AE; Fri, 01 Nov 2019 01:31:54 +0000
X-UUID: 5130383db0bf41b9b2c0732fb8e4eb9e-20191031
X-UUID: 5130383db0bf41b9b2c0732fb8e4eb9e-20191031
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw01.mediatek.com
 (envelope-from <michael.kao@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLS)
 with ESMTP id 678234526; Thu, 31 Oct 2019 17:31:10 -0800
Received: from MTKMBS02N2.mediatek.inc (172.21.101.101) by
 MTKMBS62DR.mediatek.inc (172.29.94.18) with Microsoft SMTP Server (TLS) id
 15.0.1395.4; Thu, 31 Oct 2019 18:31:37 -0700
Received: from MTKCAS06.mediatek.inc (172.21.101.30) by
 mtkmbs02n2.mediatek.inc (172.21.101.101) with Microsoft SMTP Server (TLS) id
 15.0.1395.4; Fri, 1 Nov 2019 09:31:35 +0800
Received: from [172.21.84.99] (172.21.84.99) by MTKCAS06.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1395.4 via Frontend
 Transport; Fri, 1 Nov 2019 09:31:35 +0800
Message-ID: <1572571899.23942.3.camel@mtksdccf07>
Subject: Re: [RESEND PATCH] thermal: mediatek: add suspend/resume callback
From: Michael Kao <michael.kao@mediatek.com>
To: Daniel Lezcano <daniel.lezcano@linaro.org>
Date: Fri, 1 Nov 2019 09:31:39 +0800
In-Reply-To: <a0af0b72-dbc3-f284-34b7-fc94bbe349a4@linaro.org>
References: <1570613704-16609-1-git-send-email-michael.kao@mediatek.com>
 <a0af0b72-dbc3-f284-34b7-fc94bbe349a4@linaro.org>
X-Mailer: Evolution 3.2.3-0ubuntu6 
MIME-Version: 1.0
X-TM-SNTS-SMTP: FBAAD417DA093FF98E142D814BA2901E3D11B820C756EC48F85BA1DB00C7872C2000:8
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20191031_183152_516544_DD5B9666 
X-CRM114-Status: GOOD (  12.02  )
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
 linux-pm@vger.kernel.org, Louis Yu <louis.yu@mediatek.com>,
 linux-kernel@vger.kernel.org, Eduardo Valentin <edubezval@gmail.com>,
 Rob Herring <robh+dt@kernel.org>, linux-mediatek@lists.infradead.org,
 hsinyi@chromium.org, Matthias Brugger <matthias.bgg@gmail.com>,
 Zhang Rui <rui.zhang@intel.com>, linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On Sun, 2019-10-13 at 19:50 +0200, Daniel Lezcano wrote:
> On 09/10/2019 11:35, michael.kao@mediatek.com wrote:
> > From: Louis Yu <louis.yu@mediatek.com>
> > 
> > Add suspend/resume callback to disable/enable Mediatek thermal sensor
> > respectively. Since thermal power domain is off in suspend, thermal driver
> > needs re-initialization during resume.
> > 
> > Signed-off-by: Louis Yu <louis.yu@mediatek.com>
> > Signed-off-by: Michael Kao <michael.kao@mediatek.com>
> > ---
> > This patch series base on these patches [1][2].
> > 
> > [1]thermal: mediatek: mt8183: fix bank number settings (https://patchwork.kernel.org/patch/10938817/)
> > [2]thermal: mediatek: add another get_temp ops for thermal sensors (https://patchwork.kernel.org/patch/10938829/)
> 
> There is no new version with the comments take into account. Did I miss
> something?
> 
> The patch base on Kenrel 5.4. I resend to linux-pm. The original patch is at linux-mediatek only.



_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
