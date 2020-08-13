Return-Path: <SRS0=lgZq=BX=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.5 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,
	USER_AGENT_SANE_2 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DE7C6C433DF
	for <linux-mediatek@archiver.kernel.org>; Thu, 13 Aug 2020 06:55:58 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id A916720771
	for <linux-mediatek@archiver.kernel.org>; Thu, 13 Aug 2020 06:55:58 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="fp5FbY9E";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b="Zv0rqyCg"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org A916720771
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Date:To:From:
	Subject:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=M7Tg56vd1893vCFJIzudLNOGcWf887YoMNZq2QtWzYQ=; b=fp5FbY9EWQZt5t6DKr3iVdp6N
	PQbzxXRPjnCllMiGXD7PKb2g6xFRgKIEK/82KYSjcJhN+p/4DKkmdnMRvmdGEVYn/CvmGMIC3I7A/
	m8CVNjst74fzWlFHxXj3MFJ3zBOT5C58SjkDu8VppOyDa2OjXwZqiqcYgkmYiTboMlkA8vJiSsd2n
	g+mNzKxwFF29DEu1rhKZpTE3I+0aySGhQzZK21fPzzfOoTmYafxaStxaDbfO0pByKZl9oxpCtivQo
	QvywZRhBd/NQ95FQuoxoAiNXVe/PIn1wqPQDz2SwiCxhoCVWgRyPNBX4Y8VtTltyBEvLQOH/49lWb
	ePkOFqRwQ==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1k679M-0006Vr-N4; Thu, 13 Aug 2020 06:55:44 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1k679I-0006UT-3o; Thu, 13 Aug 2020 06:55:43 +0000
X-UUID: 301652ffd019420483df71c59a6473b4-20200812
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:MIME-Version:Content-Type:References:In-Reply-To:Date:CC:To:From:Subject:Message-ID;
 bh=K8cY7A6xcVtlMwzfYxfFED43cNL6JNqBX8t0cFFimHQ=; 
 b=Zv0rqyCg/8SmMpAAmWEGVLVVgSxmvqF+VtlOzl24RMp1xePrs/jXu1IyX5DZjDrRk/CZJ08SLB48grPlin2+XVdVPzoE79vOuDDxR87STNZr2Yjyt0dWn0+RkKNszDJigAiMfKzPfIrKHqIxIzqsuU7M7l7Sd8LWuM1WDizLU2g=;
X-UUID: 301652ffd019420483df71c59a6473b4-20200812
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw01.mediatek.com
 (envelope-from <hector.yuan@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLS)
 with ESMTP id 2080624391; Wed, 12 Aug 2020 22:55:33 -0800
Received: from MTKMBS01N2.mediatek.inc (172.21.101.79) by
 MTKMBS62N2.mediatek.inc (172.29.193.42) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Wed, 12 Aug 2020 23:55:32 -0700
Received: from mtkcas08.mediatek.inc (172.21.101.126) by
 mtkmbs01n2.mediatek.inc (172.21.101.79) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Thu, 13 Aug 2020 14:55:15 +0800
Received: from [172.21.77.33] (172.21.77.33) by mtkcas08.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Thu, 13 Aug 2020 14:55:15 +0800
Message-ID: <1597301716.7652.1.camel@mtkswgap22>
Subject: Re: [PATCH v1 2/2] dt-bindings: cpufreq: add  MediaTek cpufreq
 bindings
From: Hector.Yuan <hector.yuan@mediatek.com>
To: Rob Herring <robh@kernel.org>
Date: Thu, 13 Aug 2020 14:55:16 +0800
In-Reply-To: <20200812162604.GA2319433@bogus>
References: <1596716320-19811-1-git-send-email-hector.yuan@mediatek.com>
 <1596716320-19811-3-git-send-email-hector.yuan@mediatek.com>
 <20200812162604.GA2319433@bogus>
X-Mailer: Evolution 3.2.3-0ubuntu6 
MIME-Version: 1.0
X-TM-SNTS-SMTP: EABEB4EA3A04522E2AB0A2F60DAB2E236AD01C5E53B97674C796187486C045402000:8
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200813_025540_402586_D4DB2A0B 
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
Cc: Will Deacon <will@kernel.org>, wsd_upstream@mediatek.com,
 Geert Uytterhoeven <geert+renesas@glider.be>,
 Anson Huang <Anson.Huang@nxp.com>, linux-pm@vger.kernel.org,
 devicetree@vger.kernel.org, Catalin
 Marinas <catalin.marinas@arm.com>, "Rafael J. Wysocki" <rjw@rjwysocki.net>,
 Arnd Bergmann <arnd@arndb.de>, Bjorn Andersson <bjorn.andersson@linaro.org>,
 Olof Johansson <olof@lixom.net>, Vinod Koul <vkoul@kernel.org>,
 Rob Herring <robh+dt@kernel.org>, linux-mediatek@lists.infradead.org,
 Viresh Kumar <viresh.kumar@linaro.org>,
 Matthias Brugger <matthias.bgg@gmail.com>, Li Yang <leoyang.li@nxp.com>, Shawn
 Guo <shawnguo@kernel.org>, linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On Wed, 2020-08-12 at 10:26 -0600, Rob Herring wrote:
> On Thu, 06 Aug 2020 20:18:40 +0800, Hector Yuan wrote:
> > From: "Hector.Yuan" <hector.yuan@mediatek.com>
> > 
> > Add devicetree bindings for MediaTek HW driver.
> > 
> > Signed-off-by: Hector.Yuan <hector.yuan@mediatek.com>
> > ---
> >  .../bindings/cpufreq/cpufreq-mediatek-hw.yaml      |   56 ++++++++++++++++++++
> >  1 file changed, 56 insertions(+)
> >  create mode 100644 Documentation/devicetree/bindings/cpufreq/cpufreq-mediatek-hw.yaml
> > 
> 
> 
> My bot found errors running 'make dt_binding_check' on your patch:
> 
> /builds/robherring/linux-dt-review/Documentation/devicetree/bindings/cpufreq/cpufreq-mediatek-hw.example.dt.yaml: example-0: cpufreq@11bc00:reg:0: [0, 1162256, 0, 140] is too long
> /builds/robherring/linux-dt-review/Documentation/devicetree/bindings/cpufreq/cpufreq-mediatek-hw.example.dt.yaml: example-0: cpufreq@11bc00:reg:1: [0, 1162400, 0, 140] is too long
> 
> 
> See https://patchwork.ozlabs.org/patch/1341854
> 
> If you already ran 'make dt_binding_check' and didn't see the above
> error(s), then make sure dt-schema is up to date:
> 
> pip3 install git+https://github.com/devicetree-org/dt-schema.git@master --upgrade
> 
> Please check and re-submit.
> OK, will modify and re-submit @ V2

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
