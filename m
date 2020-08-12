Return-Path: <SRS0=Jt7l=BW=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7476DC433E0
	for <linux-mediatek@archiver.kernel.org>; Wed, 12 Aug 2020 14:25:00 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 2B78720639
	for <linux-mediatek@archiver.kernel.org>; Wed, 12 Aug 2020 14:25:00 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="eTbSmTis";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=gmx.net header.i=@gmx.net header.b="OA7TzBeO"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 2B78720639
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=public-files.de
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:References:In-Reply-To:Date:Subject:To:From:
	Message-ID:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=GM4UBogph3r9sRBPkFo9uO16RkkIemg4hzmCBAb44/Q=; b=eTbSmTislPXSy3FuZSuOR58DY
	ZWd8NK5v1Hmz4Ao3ksr7OWE9VLt1Sr7rUdUyuL3kHMDe1M2TijMDpmc9sFWduEPDJnWLNPXMBZvwH
	Ysm5ViDd1AJppf9rIsNrbUoiij2RTCuktzpJdels2sZ39F89tqlgQiX5tpHAKR/vIPZrG0gHoU3Ca
	8pw7QDYHLqxj9UR8XuGg/LloOt+6SKTPnyHe7m0KA686d0ar/31HFZGCxKm6otbiRgXuBP9WhJHI6
	MGnmw7HSje7l7IxCl8u/9VCdVGkKVVsWS5w8pnY660uGtK2wW+kiVAO7F8txRgpky0Pz047ct87Lg
	axGyWSshA==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1k5rgP-0003nt-H1; Wed, 12 Aug 2020 14:24:49 +0000
Received: from mout.gmx.net ([212.227.15.19])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1k5rgM-0003mq-KK; Wed, 12 Aug 2020 14:24:47 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.net;
 s=badeba3b8450; t=1597242283;
 bh=2qIIIi+kVG7PNoSbul+CG9EF5Wr4xueF6mcdgIcW3EU=;
 h=X-UI-Sender-Class:From:To:Cc:Subject:Date:In-Reply-To:References;
 b=OA7TzBeOa1ZfJ5pzxZYr900dbbwTk6LG7ieCb/jpccuIDgKJay0BpB28cr98P+pGT
 sBNcHdfdfXv0rOxuAnYxtIQhF7EPcy7c/XkydLnPwlIxlWecu/sTBV/VCt5cucE5sR
 4ckUc+kM+62lM6I66aji0audmZN7TYJBGHWf7Xpg=
X-UI-Sender-Class: 01bb95c1-4bf8-414a-932a-4f6e2808ef9c
Received: from [185.53.41.139] ([185.53.41.139]) by web-mail.gmx.net
 (3c-app-gmx-bs32.server.lan [172.19.170.84]) (via HTTP); Wed, 12 Aug 2020
 16:19:04 +0200
MIME-Version: 1.0
Message-ID: <trinity-b7a0d7ed-cbc7-421d-810d-162fd178a8f3-1597241944268@3c-app-gmx-bs32>
From: Frank Wunderlich <frank-w@public-files.de>
To: Wenbin Mei <wenbin.mei@mediatek.com>
Subject: Aw: [v2,3/3] mmc: mediatek: add optional module reset property
Date: Wed, 12 Aug 2020 16:19:04 +0200
Importance: normal
Sensitivity: Normal
In-Reply-To: <20200812130129.13519-4-wenbin.mei@mediatek.com>
References: <20200812130129.13519-1-wenbin.mei@mediatek.com>
 <20200812130129.13519-4-wenbin.mei@mediatek.com>
X-UI-Message-Type: mail
X-Priority: 3
X-Provags-ID: V03:K1:DI9ytn25Mt7akP/u6K+zVHv5f9HCrC6Cv16qnII6teMTpW2XwfNpVoOFjsieNPVwxH/l4
 cU9JOsQ/EywXacZma3nl2x+nLnZRWJetq0muKjnIFXHkClEF1/JKMVLhiQGD47pDpFys17mtusRl
 IZj0JuYw2/1ZQNpDUsRUHTLewSnpAmCMNyaFY3QyL81a+Exg1Hd9W45f5B3QKDiXi8YPcFl3ujSC
 htEJ6QIHlc+SwUugRjsLYSIYvPxrpe1U85FJ2oxUj1HDNAkgp5/kWi3ABWD/dfqso+NKIE0XQUAB
 MA=
X-UI-Out-Filterresults: notjunk:1;V03:K0:tN/jcYrGwgE=:9+hjcQA0cwn1zimVsBFmKx
 Y1fPgWzo9syFghABkja9wXQRT3ifGOAP0E8E2NpW7UhJHJcWPMsLWFvZ7op8ry/DekknhmQ46
 jedYhTayMkBCOxqMr+vwI17wdrQAn6tWlRbqmtVDXE9SR6y3S/XQYd/hRytiPquSIeRKRsjkM
 zUbTBxcyS4UShE3+fKlZbpOVyhrb9hBufIzV6UodGkjmsCtDcyEGuyzsKxA0LA1kSoGapQXVI
 m3LIrD7Xi6XoQZMZF257rKDr3b7iW467KFuC5WXEfP/xsk47EQfNab5XeCZ/Y4rKglVEBPzpv
 tYlrGqgVp/zd4yG3YhH3ALCoqe05orjm+YncBKjly8TlIRLKrVU3u8pSJ7Qq7iuds/HKlmV1L
 ATBGUdb9sl2jxqHQeDMZxsnmT7WPyEf8tIkahfKcuM1b8hvK3dHxYX04dyP0VpNUvyz0ORfMQ
 VSsbVX2oHdWfLmg08Ea05znVK6MZXKLwbIpp1Qe/TxQ1gViehXjAObeHPCFLN26eqoq/7NRaK
 d37Np/RynTCuCYhHfz5Yu8W6NPqR80hCnrgIG0xvfYHX1zxZ6mIID86yev4kowO1Ay7YWjE27
 n9HdCHFXAn7kF8OQtvHcJjcEQo/jp2vd/FXZCdtmTwjOpgveoOAcBfSl+x/+jUt4Q78TlVmKS
 V5MXonZiqrY/YLjcLAvnEc3FSZz67J6hbunQth4pXN3Hn+lkWfLOUZ11FlYdjqWprNdY=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200812_102446_886623_1A5785CA 
X-CRM114-Status: UNSURE (   7.66  )
X-CRM114-Notice: Please train this message.
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
Cc: devicetree@vger.kernel.org, Ulf Hansson <ulf.hansson@linaro.org>,
 Wenbin Mei <wenbin.mei@mediatek.com>, srv_heupstream@mediatek.com,
 linux-mmc@vger.kernel.org, linux-kernel@vger.kernel.org,
 stable@vger.kernel.org, Rob Herring <robh+dt@kernel.org>,
 linux-mediatek@lists.infradead.org, Chaotian Jing <chaotian.jing@mediatek.com>,
 Philipp Zabel <p.zabel@pengutronix.de>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

Hi,
it looks like you missed Philipps comments in v1

for stable i guess you need only add Cc: Stable-line to signed-off-area (not add it to CC of mail), sorry my mistake

Cc: stable@vger.kernel.org

regards Frank

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
