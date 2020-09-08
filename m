Return-Path: <SRS0=x1vn=CR=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.3 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,URIBL_BLOCKED,USER_AGENT_SANE_2
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C2FFAC43461
	for <linux-mediatek@archiver.kernel.org>; Tue,  8 Sep 2020 02:37:52 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 05ED320732
	for <linux-mediatek@archiver.kernel.org>; Tue,  8 Sep 2020 02:37:51 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="W/DfpHyE";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b="qBdXoDKO"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 05ED320732
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Date:To:From:
	Subject:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=YYVIPeQmzQNoXb9wSBySwb/1UJfKS0pomLVOJ8527BA=; b=W/DfpHyEcQRI9bB4XWy9Q8t0+
	xjVuhE8VsPiPgzs82M+j7Q0OMVW8zzSxeA1VpnA9WghsXIHbi1wR4laBIR5AoiyNJu9fLaSWwIy2V
	CuvcgAArdP37pkeH3tOfGSdV0v22f8mGhl1Pm84PAk2TdxHxwpp4zEdVo7eqy6lZpBXF1c+iSNw4t
	uKpjQtB0H7NP4ggFxyaE5Kfsv7gvGlOzA0CpfOY1u3Xp0RXObErKBwS+fp4MgSRfX9Px9pnoD8uZb
	Ix1AVOFPCgafJlhU8tJyvxhwa1E3tbn4uRr5V0WkkCGI7Jb5+ElIXtDp0wzPvVQAqOrpBtdBCkvto
	u23SEaCEQ==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kFTVq-0004ek-Sm; Tue, 08 Sep 2020 02:37:38 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kFTVj-0004eH-Kz; Tue, 08 Sep 2020 02:37:33 +0000
X-UUID: 84676c8f25bd48ba832f101911be6486-20200907
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:MIME-Version:Content-Type:References:In-Reply-To:Date:CC:To:From:Subject:Message-ID;
 bh=zPKIe0f4htLXPBgdV5V5ez5FoqIWorB9FGa+1tg+aIs=; 
 b=qBdXoDKObxp+/RXgrG79aFe3TMisC0d6T480tyox4EvRkD1Y1OhszCks8XHjf1N3loUwohVd35I3R9qQdeFltidBIsQbZgZyJza6YZWOpyjQRxtR4xdAPAd4qU+qxGxsuG8qq6hz+hw6iLm64mO1hOYYfxt/k3UsRmQDlz5aV/4=;
X-UUID: 84676c8f25bd48ba832f101911be6486-20200907
Received: from mtkcas67.mediatek.inc [(172.29.193.45)] by mailgw02.mediatek.com
 (envelope-from <hector.yuan@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 1734804427; Mon, 07 Sep 2020 18:35:15 -0800
Received: from MTKMBS01N2.mediatek.inc (172.21.101.79) by
 MTKMBS62N2.mediatek.inc (172.29.193.42) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Mon, 7 Sep 2020 19:35:13 -0700
Received: from mtkcas08.mediatek.inc (172.21.101.126) by
 mtkmbs01n2.mediatek.inc (172.21.101.79) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Tue, 8 Sep 2020 10:35:11 +0800
Received: from [172.21.77.33] (172.21.77.33) by mtkcas08.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Tue, 8 Sep 2020 10:35:07 +0800
Message-ID: <1599532510.17707.4.camel@mtkswgap22>
Subject: Re: [PATCH v3] cpufreq: mediatek-hw: Add support for Mediatek
 cpufreq HW driver
From: Hector Yuan <hector.yuan@mediatek.com>
To: <linux-mediatek@lists.infradead.org>
Date: Tue, 8 Sep 2020 10:35:10 +0800
In-Reply-To: <1598446913-24325-1-git-send-email-hector.yuan@mediatek.com>
References: <1598446913-24325-1-git-send-email-hector.yuan@mediatek.com>
X-Mailer: Evolution 3.2.3-0ubuntu6 
MIME-Version: 1.0
X-TM-SNTS-SMTP: 20163B1F379299FECF0559FE30ED5B620CF238BC658FC8CDEAA9638C5FF6418A2000:8
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200907_223731_873001_7C30CA47 
X-CRM114-Status: GOOD (  16.06  )
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
Cc: devicetree@vger.kernel.org, Anson Huang <Anson.Huang@nxp.com>,
 Arnd Bergmann <arnd@arndb.de>, linux-pm@vger.kernel.org,
 Viresh Kumar <viresh.kumar@linaro.org>,
 "Rafael J. Wysocki" <rjw@rjwysocki.net>, wsd_upstream@mediatek.com,
 Bjorn Andersson <bjorn.andersson@linaro.org>, Olof Johansson <olof@lixom.net>,
 Vinod Koul <vkoul@kernel.org>, Rob Herring <robh+dt@kernel.org>,
 Catalin Marinas <catalin.marinas@arm.com>,
 Matthias Brugger <matthias.bgg@gmail.com>, Shawn Guo <shawnguo@kernel.org>,
 Geert Uytterhoeven <geert+renesas@glider.be>, Li Yang <leoyang.li@nxp.com>,
 Will Deacon <will@kernel.org>, linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

Hi, Sirs:

Please kindly let me know your review thoughts of this patch.
Appreciated.
 
On Wed, 2020-08-26 at 21:01 +0800, Hector Yuan wrote:
> The CPUfreq HW present in some Mediatek chipsets offloads the steps necessary for changing the frequency of CPUs. 
> The driver implements the cpufreq driver interface for this hardware engine. 
> 
> This patch depends on the MT6799 DTS patch submitted by Hanks Chen
>  https://lkml.org/lkml/2020/8/4/1094
> 
> 
> Hector.Yuan (2):
>   cpufreq: mediatek-hw: Add support for Mediatek cpufreq HW driver
>   dt-bindings: cpufreq: add bindings for MediaTek cpufreq HW
> 
>  .../bindings/cpufreq/cpufreq-mediatek-hw.yaml      |  141 +++++++++
>  drivers/cpufreq/Kconfig.arm                        |   12 +
>  drivers/cpufreq/Makefile                           |    1 +
>  drivers/cpufreq/mediatek-cpufreq-hw.c              |  305 ++++++++++++++++++++
>  4 files changed, 459 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/cpufreq/cpufreq-mediatek-hw.yaml
>  create mode 100644 drivers/cpufreq/mediatek-cpufreq-hw.c

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
