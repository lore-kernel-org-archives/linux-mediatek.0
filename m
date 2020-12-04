Return-Path: <SRS0=yJvo=FI=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BBFB9C4361A
	for <linux-mediatek@archiver.kernel.org>; Fri,  4 Dec 2020 10:57:02 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id CB0B4229EF
	for <linux-mediatek@archiver.kernel.org>; Fri,  4 Dec 2020 10:57:01 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org CB0B4229EF
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe
	:List-Id:MIME-Version:References:In-Reply-To:Date:To:From:Subject:Message-ID:
	Reply-To:Cc:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=p1zIKqXxTnjMOavhreHgewLPn8dDXRu345+SrjNPK78=; b=VHJeOrJirat5wT4VzfucynfPsL
	kJTesO4CFC/5bMGW46LCXbeCWOKOfVlTvsfkObzqXy1NAVInmyAY01X+EV1BBUgm/vDMWFQi7SvnA
	fCy8C4I9FkLeli0RhVLoFWJ0eU/hVc78gtDNh9Xr08P1vZXiRq2rqS3DlrLwyONjPOz07ic6lNvbR
	8l8qs301InY/RM/x7LzvBzjH7H+dBuZozYQ3ksBJHOZPDVcpDIJvWKui4E4R7p1hto7S8fqkCEm5M
	gTwb/ZSsStkBLi+5n0I1371xnT5kIdeYEXc/169MlKWDPJ3+3s0kGYUjpWRbK51xG3dABoUkukE3r
	zDQ8icxQ==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kl8lh-0000yD-S1; Fri, 04 Dec 2020 10:56:53 +0000
Received: from metis.ext.pengutronix.de ([2001:67c:670:201:290:27ff:fe1d:cc33])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kl8ld-0000vu-C5
 for linux-mediatek@lists.infradead.org; Fri, 04 Dec 2020 10:56:50 +0000
Received: from lupine.hi.pengutronix.de
 ([2001:67c:670:100:3ad5:47ff:feaf:1a17] helo=lupine)
 by metis.ext.pengutronix.de with esmtps
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <p.zabel@pengutronix.de>)
 id 1kl8lS-0004Tj-Og; Fri, 04 Dec 2020 11:56:38 +0100
Received: from pza by lupine with local (Exim 4.92)
 (envelope-from <p.zabel@pengutronix.de>)
 id 1kl8lM-0006gu-8p; Fri, 04 Dec 2020 11:56:32 +0100
Message-ID: <2c36ef4c2d022f6f83ec5c78a951d5e76f95378e.camel@pengutronix.de>
Subject: Re: [PATCH 1/5] media: dt-bindings: add the required property
 'additionalProperties'
From: Philipp Zabel <p.zabel@pengutronix.de>
To: Zhen Lei <thunder.leizhen@huawei.com>, Mauro Carvalho Chehab
 <mchehab@kernel.org>, Rob Herring <robh+dt@kernel.org>, Karol Gugala
 <kgugala@antmicro.com>, Mateusz Holenko <mholenko@antmicro.com>, Greg
 Kroah-Hartman <gregkh@linuxfoundation.org>, Pawel Czarnecki
 <pczarnecki@internships.antmicro.com>,  Stafford Horne <shorne@gmail.com>,
 Matthias Brugger <matthias.bgg@gmail.com>, Lee Jones
 <lee.jones@linaro.org>,  linux-media <linux-media@vger.kernel.org>,
 linux-serial <linux-serial@vger.kernel.org>, linux-arm-kernel
 <linux-arm-kernel@lists.infradead.org>, linux-mediatek
 <linux-mediatek@lists.infradead.org>, devicetree
 <devicetree@vger.kernel.org>,  linux-kernel <linux-kernel@vger.kernel.org>
Date: Fri, 04 Dec 2020 11:56:32 +0100
In-Reply-To: <20201204093813.1275-2-thunder.leizhen@huawei.com>
References: <20201204093813.1275-1-thunder.leizhen@huawei.com>
 <20201204093813.1275-2-thunder.leizhen@huawei.com>
User-Agent: Evolution 3.30.5-1.1 
MIME-Version: 1.0
X-SA-Exim-Connect-IP: 2001:67c:670:100:3ad5:47ff:feaf:1a17
X-SA-Exim-Mail-From: p.zabel@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de);
 SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-mediatek@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201204_055649_466353_A5F16602 
X-CRM114-Status: GOOD (  10.05  )
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On Fri, 2020-12-04 at 17:38 +0800, Zhen Lei wrote:
> When I do dt_binding_check for any YAML file, below wanring is always
> reported:
> 
> xxx/media/coda.yaml: 'additionalProperties' is a required property
> xxx/media/coda.yaml: ignoring, error in schema:
> warning: no schema found in file: xxx/media/coda.yaml
> 
> There are three properties defined in allOf, they should be explicitly
> declared. Otherwise, "additionalProperties: false" will prohibit them.
> 
> Signed-off-by: Zhen Lei <thunder.leizhen@huawei.com>

Thank you, there already is a patch to fix this:

https://lore.kernel.org/linux-media/20201117200752.4004368-1-robh@kernel.org/

regards
Philipp

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
