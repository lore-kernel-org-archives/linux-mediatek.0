Return-Path: <SRS0=ZCae=DC=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.4 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,URIBL_BLOCKED,USER_AGENT_SANE_2
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4BC4AC4363D
	for <linux-mediatek@archiver.kernel.org>; Fri, 25 Sep 2020 07:26:19 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 94C802086A
	for <linux-mediatek@archiver.kernel.org>; Fri, 25 Sep 2020 07:26:18 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="EvF1BEjO";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b="pbldmRyf"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 94C802086A
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Date:To:From:
	Subject:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=J1DL1i03NMgrQH3oidibZpremlpWwHMl6TFazu6VL+4=; b=EvF1BEjOx4BNaQNraZd+pYGT4
	fMSW0N6E38yIktW2Oxk2048YnlHjrgZCSsMUI6RJj53ihtX33+IjPg1Fl3ERXvWjDz+iOvmsRnoXY
	SaGaRe69eVus5qZ/HxXLzGimfjOD6gxN8Ov8HWZqjqZOvp39g9m5xJZ72cQ/ApcsNLZF9rjwLF9Pg
	YSjocTcL9A4u/M6vSgRcQ2FV8K3oFEfQ3c71Q5LFPh299Nd+symfgyaVY9ZxXLrNJvZAc8DBrYzex
	udEZxzoCTb0WYwKtr2sWMB0hqdDeqvl1qVQo09IUs9YHppIgfVVc1qIZ/eZ2UG7E76DWgWbzdfAWE
	2sbmhdUyQ==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kLi7M-0008RI-G8; Fri, 25 Sep 2020 07:26:08 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kLi7I-0008QQ-K6; Fri, 25 Sep 2020 07:26:06 +0000
X-UUID: 68b072bb72bd4022aebf21c9a81ed2ab-20200924
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:MIME-Version:Content-Type:References:In-Reply-To:Date:CC:To:From:Subject:Message-ID;
 bh=qR+6jO15KAuDt/EGf8Txytwkys5qSReDtq36TcjNmZg=; 
 b=pbldmRyfG3USG3/0C/3coFn01dHuKTjB8Ja8GfkwKf9yhxw4ZXQDZA5izOtR1YAWRdOd9cAElWYwFYqY5nwbyPMi8j9lkzeptIaZLAOEKPXa+uTiVrLwg7AyJJgbqMecMiEE3sQnxyc8xscBZVAXb7hffPE3O++Fh5adHXv6+No=;
X-UUID: 68b072bb72bd4022aebf21c9a81ed2ab-20200924
Received: from mtkcas68.mediatek.inc [(172.29.94.19)] by mailgw01.mediatek.com
 (envelope-from <hector.yuan@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 1882622603; Thu, 24 Sep 2020 23:25:59 -0800
Received: from MTKMBS01N2.mediatek.inc (172.21.101.79) by
 MTKMBS62N2.mediatek.inc (172.29.193.42) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Fri, 25 Sep 2020 00:25:57 -0700
Received: from mtkcas08.mediatek.inc (172.21.101.126) by
 mtkmbs01n2.mediatek.inc (172.21.101.79) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Fri, 25 Sep 2020 15:25:47 +0800
Received: from [172.21.77.33] (172.21.77.33) by mtkcas08.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Fri, 25 Sep 2020 15:25:48 +0800
Message-ID: <1601018748.21446.43.camel@mtkswgap22>
Subject: Re: [PATCH v7 2/2] dt-bindings: cpufreq: add bindings for MediaTek
 cpufreq HW
From: Hector Yuan <hector.yuan@mediatek.com>
To: Viresh Kumar <viresh.kumar@linaro.org>, Rob Herring <robh@kernel.org>
Date: Fri, 25 Sep 2020 15:25:48 +0800
In-Reply-To: <20200925061543.5hxs3ija2y53gzea@vireshk-i7>
References: <1599712262-8819-1-git-send-email-hector.yuan@mediatek.com>
 <1599712262-8819-3-git-send-email-hector.yuan@mediatek.com>
 <20200922202852.GA3134161@bogus> <1600866614.21446.18.camel@mtkswgap22>
 <1601000847.21446.34.camel@mtkswgap22>
 <20200925061543.5hxs3ija2y53gzea@vireshk-i7>
X-Mailer: Evolution 3.2.3-0ubuntu6 
MIME-Version: 1.0
X-TM-SNTS-SMTP: 1A08A85A014F2A3DFCD670D1D164310B29665174DC1C1C9978AFB07F1C124E7D2000:8
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200925_032604_802740_EA0CA1BF 
X-CRM114-Status: GOOD (  14.85  )
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
Cc: Rob Herring <robh@kernel.org>, wsd_upstream@mediatek.com,
 devicetree@vger.kernel.org, linux-pm@vger.kernel.org,
 "Rafael J. Wysocki" <rjw@rjwysocki.net>, linux-kernel@vger.kernel.org,
 linux-mediatek@lists.infradead.org, linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

Hi, Rob sir:

Yes, my patch follows
Documentation/devicetree/bindings/cpufreq/cpufreq-qcom-hw.txt way to
define frequency domain.
Is it OK to you if I use the same way to do?
And if there exist any schema problem, please kindly let me know how to
fix it.

My patch reference
Documentation/devicetree/bindings/thermal/thermal-cooling-devices.yaml
to use the cpu node.
https://elixir.bootlin.com/linux/v5.9-rc6/source/Documentation/devicetree/bindings/thermal/thermal-cooling-devices.yaml

Thanks a lot.

On Fri, 2020-09-25 at 11:45 +0530, Viresh Kumar wrote:
> On 25-09-20, 10:27, Hector Yuan wrote:
> > Hi, Viresh & Rob Sir:
> > 
> > I will change frequency domain to below and define it in cpufreq_hw
> > schema rather than cpu node.
> > 
> > mediatek,freq-domain-0 = <&cpu0>, <&cpu1>;
> 
> I think it would be better to do it the standard way we have done it elsewhere.
> i.e. follow Documentation/devicetree/bindings/cpufreq/cpufreq-qcom-hw.txt, that
> is similar to what you did earlier.
> 

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
