Return-Path: <SRS0=Po0r=ML=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.5 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,INCLUDES_CR_TRAILER,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A36CBC07E9B
	for <linux-mediatek@archiver.kernel.org>; Mon, 19 Jul 2021 11:00:25 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 7260960FF1
	for <linux-mediatek@archiver.kernel.org>; Mon, 19 Jul 2021 11:00:25 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 7260960FF1
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=kCKHt5KwK06FMSE+Kcv6Gln/w0BFbs+hVu/ewxC9QtQ=; b=sBEzpGET0awAgG
	yvUVOidGet4csRJNnPQn9VqpO164nlJkhciAvFHeY7nvItqSZz4lTun6gKBYWOPB30filOGVpmNCV
	mrfFPt2NLPVewQMsj+uPqxueq8nIVaUQxCXnK5uk6nk4zRrmgpQ122I63D6ouPKXtkw+0GnFFE6OC
	pYQSndBfJGKmQ9YHU9CqBibVAFBWLHDhRD93dkfirtXeM5hkqEMVJCcN2oeXPflh+jAwR4u9yd3ns
	bf0pL+3Djt9f+YiqjLBafevOtUAUR1iERtIEA3LqUsCfo0KOWvL71SQJVR7cvvOoGObysCTuNe1ls
	8n33dQVo6yRgcfwUTs4g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1m5R0Q-009PQO-9n; Mon, 19 Jul 2021 11:00:14 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1m5QpD-009KnX-Qi; Mon, 19 Jul 2021 10:48:41 +0000
Received: by mail.kernel.org (Postfix) with ESMTPSA id D3BD460FF4;
 Mon, 19 Jul 2021 10:48:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1626691719;
 bh=x3sZ6QziQFQPBoDXFlrxzz/Xw1YdKNKJ1dEfsJ5U9Ks=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=ofS4LFKVQCiq4PmWj9sATGQpAMPLVg8AXo/1S0/5N5ZLUYlqzT9WdpgY5uM6XmeXg
 tlG1LVugELHTm8WvKL+fiv6X6TWrwY+AqzOBQ8hHuMlwFPkm4zBzSbX0Z02tDqJv0r
 OR0pdXsFD5YoQhNgFIhTZnd9z4iatdW41KnENeyxh+QqmIifxzjzJtoXGsxStxekpa
 PWG+TLb7zco+Ms33rdkBWuuXauBFwFwC1vTb9LPZqkqepjwY9D4QNV3D+tHhkHn78i
 nYXPXbQZ0x01203vLQeBzZFUKvVgWDiGUjWMgER+5UvuDeXgV4mRg/u3yQ8hAubx76
 TcxxH7iiwdkiw==
Date: Mon, 19 Jul 2021 12:48:29 +0200
From: Jakub Kicinski <kuba@kernel.org>
To: DENG Qingfang <dqfext@gmail.com>
Cc: Florian Fainelli <f.fainelli@gmail.com>, Landen Chao
 <landen.chao@mediatek.com>, Andrew Lunn <andrew@lunn.ch>, Vivien Didelot
 <vivien.didelot@gmail.com>, "David S . Miller" <davem@davemloft.net>,
 Matthias Brugger <matthias.bgg@gmail.com>, Sean Wang
 <sean.wang@mediatek.com>, Philipp Zabel <p.zabel@pengutronix.de>,
 netdev@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org,
 frank-w@public-files.de, steven.liu@mediatek.com
Subject: Re: [PATCH net, v2] net: Update MAINTAINERS for MediaTek switch driver
Message-ID: <20210719124829.3a5ca4da@cakuba>
In-Reply-To: <d62aa80d-9ee2-23b8-f68f-449b488a3b0f@gmail.com>
References: <20210601024508.iIbiNrsg-6lZjXwIt9-j76r37lcQSk3LsYBoZyl3fUM@z>
 <20210717154523.82890-1-dqfext@gmail.com>
 <d62aa80d-9ee2-23b8-f68f-449b488a3b0f@gmail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210719_034839_966011_E53C6BF7 
X-CRM114-Status: GOOD (  11.29  )
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

On Sat, 17 Jul 2021 09:10:19 -0700, Florian Fainelli wrote:
> On 7/17/2021 8:45 AM, DENG Qingfang wrote:
> > On Tue, Jun 01, 2021 at 10:45:08AM +0800, Landen Chao wrote:  
> >> Update maintainers for MediaTek switch driver with Deng Qingfang who
> >> contributes many useful patches (interrupt, VLAN, GPIO, and etc.) to
> >> enhance MediaTek switch driver and will help maintenance.
> >>
> >> Signed-off-by: Landen Chao <landen.chao@mediatek.com>
> >> Signed-off-by: DENG Qingfang <dqfext@gmail.com>  
> > 
> > Ping?  
> 
> You might have to resend

Yes, please resend, there may have been something funny with v2 because
patchwork didn't pick it up. It also broke threading in my MUA. Please
make sure v3 will have a different message ID header than v2.

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
