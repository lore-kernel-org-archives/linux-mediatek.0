Return-Path: <SRS0=KH1D=MT=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.5 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7CE12C4338F
	for <linux-mediatek@archiver.kernel.org>; Tue, 27 Jul 2021 10:38:55 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 30BB561882
	for <linux-mediatek@archiver.kernel.org>; Tue, 27 Jul 2021 10:38:55 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 30BB561882
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=OfBMLdCuOm+4hRejClW6PwFFxPEH1anXb0pSxtnQrnw=; b=u04MXKMiWrkQRh
	J/7sDjI3FfszYekKL3eooLxQyTMJiPEENJ1f54dt9yjZovcycMgQ9IpkbTKR71LIhbKSbRWQLNulV
	JGzY1SR9RO9+qvvSAeE4cDdfGY8URumNVuhRGME3icXIekzdRbZXkmsiB99Qr5yhgwyHXz43GbfNT
	LN7RxY74TJ2jlke97rrrzH88w4sbqt7i7UifIzavWA9BQ2koi0BZg6OLFeoBDcdtgJcQsiVPEmevH
	2FyQEPsoC9/0eUbRgkOYpN+5dTyI1KH2UOxK8qznfvIzlx9bIGT1eDrosGtONIfbgT76kQCz2xzIZ
	egf0T1rptP1fWxEVQzaQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1m8KTw-00ET7l-SJ; Tue, 27 Jul 2021 10:38:40 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1m8KTt-00ET7D-KE; Tue, 27 Jul 2021 10:38:39 +0000
X-UUID: 621de9a31549475594de815a3fe81c04-20210727
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From;
 bh=yh5OaABkkwK55A62XY8aWS++B18XsOpNTAKwZGiPuPc=; 
 b=J2yocH6GBv8PKUSi3R0c6Y7xA6OAwPX8owdtIYX9nH4ES1hLoG2EzM81dMUvT+CsqV7t1pQ4Xd2Ml7uYLPLrUTL1LwnIB5f+XjUPE5JIEhLnvMvb41oQsSY0k5JWsdaOW+m0Kc1hqc1bUNxvdSVdw3T9anRgDtnXawjfuxr+m+A=;
X-UUID: 621de9a31549475594de815a3fe81c04-20210727
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw01.mediatek.com
 (envelope-from <chihhao.chen@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 107076413; Tue, 27 Jul 2021 03:38:29 -0700
Received: from MTKMBS01N1.mediatek.inc (172.21.101.68) by
 MTKMBS62N2.mediatek.inc (172.29.193.42) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Tue, 27 Jul 2021 03:28:27 -0700
Received: from mtkcas10.mediatek.inc (172.21.101.39) by
 mtkmbs01n1.mediatek.inc (172.21.101.68) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Tue, 27 Jul 2021 18:28:13 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by mtkcas10.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via
 Frontend Transport; Tue, 27 Jul 2021 18:28:13 +0800
From: <chihhao.chen@mediatek.com>
To: <geraldogabriel@gmail.com>
CC: <alsa-devel@alsa-project.org>, <chihhao.chen@mediatek.com>,
 <damien@zamaudio.com>, <linux-arm-kernel@lists.infradead.org>,
 <linux-kernel@vger.kernel.org>, <linux-mediatek@lists.infradead.org>,
 <matthias.bgg@gmail.com>, <tiwai@suse.com>, <tiwai@suse.de>,
 <wsd_upstream@mediatek.com>
Subject: Re: [PATCH] ALSA: usb-audio: fix incorrect clock source setting
Date: Tue, 27 Jul 2021 18:27:44 +0800
Message-ID: <20210727102744.30364-1-chihhao.chen@mediatek.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <CAEsQvctJDnsaRTXAGAJ6==juKazoo2=AJrWabLzqE=jCfg5EEA@mail.gmail.com>
References: <CAEsQvctJDnsaRTXAGAJ6==juKazoo2=AJrWabLzqE=jCfg5EEA@mail.gmail.com>
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210727_033837_714041_0ACBA572 
X-CRM114-Status: UNSURE (   4.34  )
X-CRM114-Notice: Please train this message.
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

From: chihhao chen <chihhao.chen@mediatek.com>

Hello

<6>[  150.347456][ T2768] __uac_clock_find_source: FOR EP 81: Clock Selector c has pin 2 for Clock Source ID a selected
<6>[  150.347517][ T2768] __uac_clock_find_source: FOR EP 81: Found Source! Clock Selector c has pin 2 for Clock Source ID a about to be reselected
<6>[  150.384289][ T2768] __uac_clock_find_source: FOR EP 81: Clock Selector c has pin 2 for Clock Source ID a selected
<6>[  150.390920][ T2768] __uac_clock_find_source: FOR EP 81: Found Source! Clock Selector c has pin 2 for Clock Source ID a about to be reselected
<6>[  150.438156][ T2768] __uac_clock_find_source: FOR EP 81: Clock Selector c has pin 2 for Clock Source ID a selected
<6>[  150.438226][ T2768] __uac_clock_find_source: FOR EP 81: Found Source! Clock Selector c has pin 2 for Clock Source ID a about to be reselected
<6>[  150.473547][ T2768] __uac_clock_find_source: FOR EP 81: Clock Selector c has pin 2 for Clock Source ID a selected
<6>[  150.480165][ T2768] __uac_clock_find_source: FOR EP 81: Found Source! Clock Selector c has pin 2 for Clock Source ID a about to be reselected
<6>[  150.513375][ T2768] __uac_clock_find_source: FOR EP 1: Clock Selector b has pin 2 for Clock Source ID a selected
<6>[  150.513439][ T2768] __uac_clock_find_source: FOR EP 1: Found Source! Clock Selector b has pin 2 for Clock Source ID a about to be reselected
<6>[  150.546161][ T2768] __uac_clock_find_source: FOR EP 1: Clock Selector b has pin 2 for Clock Source ID a selected
<6>[  150.552678][ T2768] __uac_clock_find_source: FOR EP 1: Found Source! Clock Selector b has pin 2 for Clock Source ID a about to be reselected
<6>[  150.584347][ T2768] __uac_clock_find_source: FOR EP 1: Clock Selector b has pin 2 for Clock Source ID a selected
<6>[  150.584418][ T2768] __uac_clock_find_source: FOR EP 1: Found Source! Clock Selector b has pin 2 for Clock Source ID a about to be reselected
<6>[  150.617760][ T2768] __uac_clock_find_source: FOR EP 1: Clock Selector b has pin 2 for Clock Source ID a selected
<6>[  150.624253][ T2768] __uac_clock_find_source: FOR EP 1: Found Source! Clock Selector b has pin 2 for Clock Source ID a about to be reselected
<6>[  150.657906][ T2768] __uac_clock_find_source: FOR EP 1: Clock Selector b has pin 2 for Clock Source ID a selected
<6>[  150.657982][ T2768] __uac_clock_find_source: FOR EP 1: Found Source! Clock Selector b has pin 2 for Clock Source ID a about to be reselected
<6>[  150.689571][ T2768] __uac_clock_find_source: FOR EP 1: Clock Selector b has pin 2 for Clock Source ID a selected
<6>[  150.696109][ T2768] __uac_clock_find_source: FOR EP 1: Found Source! Clock Selector b has pin 2 for Clock Source ID a about to be reselected

Chihhao
_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
