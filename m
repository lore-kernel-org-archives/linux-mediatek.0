Return-Path: <SRS0=E/q6=JO=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,INCLUDES_CR_TRAILER,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C39D1C433ED
	for <linux-mediatek@archiver.kernel.org>; Sat, 17 Apr 2021 00:03:24 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 820AA6115B
	for <linux-mediatek@archiver.kernel.org>; Sat, 17 Apr 2021 00:03:24 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 820AA6115B
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Message-ID:Date:To:Cc:From:Subject:References:
	In-Reply-To:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=6akcIwp2Pm50ZouaHG7r5CkBpIjzTMeFzyOT6HonwSw=; b=q2FXhvLa9eR3mQciRSq4Um198
	ipIr4QL08/fbpw5aZ/yxf+7F31o1daBs3ssnDbFrIKuWt9d0KU3r2DHdmjfRK+eQs6mTQDHgr5JFd
	6IkXgDXfIqfdlEwsG1Pn6KYqDPeM0hVf+5XK6e97e5YqjERt5P8gfEPkk+e8ffw2llQBaASnAdi6X
	p6qhN+qX+IA5th4B3+mjrwvm3AQ0exANM8ht4mHjT0g7RVIG847F6vtidoklinOVUTxTFYwmI6dpY
	ilQsOA3SITvKXk29AsXzVNonIhx6rY/L9PVSrsgyBHukK6n0vJoH5D44i4iCxAxxykgMYgPrlolQj
	eu+r067sg==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lXYQY-003nl8-JD; Sat, 17 Apr 2021 00:03:10 +0000
Received: from bombadil.infradead.org ([2607:7c80:54:e::133])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lXYPo-003nf8-MH; Sat, 17 Apr 2021 00:02:24 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=Message-ID:Date:To:Cc:From:Subject:
 References:In-Reply-To:Content-Transfer-Encoding:MIME-Version:Content-Type:
 Sender:Reply-To:Content-ID:Content-Description;
 bh=dBY73gGe5A7WHgdxn7QVGt8B5HRiJmVNpz1Jhqz4K+c=; b=g+4mLt9joK0v6nMkrdH77FX4+G
 x0owMpInY7+24MnUZfbr9z5YnBmT6w3FTZFROkX4gJm4ewEJXOo0uKMNyPwAbr3xwiOt1K6C7qdEh
 gumPf4IwhyAbPeTv+0wny/3NJxteBeTBMsXjlYp+Y09+YL2bimkaOPlh2p79qy7HWG/esm8TZYkKU
 1+ElBTbGXH98cUVX4naNVGHVywIFmWA1R4GGK3zIkErtZoy0buHvYBqMfm5v9MxBJjh4nDaQmZB+U
 Jq4ud7tNy3sr2wSmz+jC/DOgso3mAPmgOL+d9s2aEZXdn0PMNrQqDJa/1FTxSgpUaSx0mJOc+KmfP
 FgRIb2jA==;
Received: from mail.kernel.org ([198.145.29.99])
 by bombadil.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lXYPm-009nQe-B3; Sat, 17 Apr 2021 00:02:23 +0000
Received: by mail.kernel.org (Postfix) with ESMTPSA id B3EC560FE5;
 Sat, 17 Apr 2021 00:02:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1618617741;
 bh=dBY73gGe5A7WHgdxn7QVGt8B5HRiJmVNpz1Jhqz4K+c=;
 h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
 b=D88dMfSrZo1SEUgS55yuEn5mOHGAOCnIEa71NMQubseenUPH/TBk2VNVVSddCYZ8g
 l0YvA+hWONl8SWp1gfKwCG4xHTXSZjroj+XSgdVb0CsuNDSSkgeq5ES6G06r44B8cm
 2HW4xDXc8Yj2gwonFc1CruIPD3s3LRo2CaQy4a1jVVpnTTGL4S/CWK7uuSh3i22pUY
 27x3JknYsBotdQnPI7sTUG9cTc+pDKcKT634jJPpWuKNatQiM6EwDXL0f4QmueqYfQ
 MRDFnaiHw8+R9bHjAk9op5g+AkVChhSfWJeWBScW3+QsqzfPSW76nRa1TzuGTfJ4Tj
 G0CadU5VG32kg==
MIME-Version: 1.0
In-Reply-To: <1618465960-3013-3-git-send-email-flora.fu@mediatek.com>
References: <1618465960-3013-1-git-send-email-flora.fu@mediatek.com>
 <1618465960-3013-3-git-send-email-flora.fu@mediatek.com>
Subject: Re: [PATCH v2 2/7] clk: mediatek: mt8192: Add APU clocks support
From: Stephen Boyd <sboyd@kernel.org>
Cc: Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
 Flora Fu <flora.fu@mediatek.com>, Pi-Cheng Chen <pi-cheng.chen@mediatek.com>,
 Chiawen Lee <chiawen.lee@mediatek.com>,
 Chun-Jie Chen <chun-jie.chen@mediatek.com>, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org, linux-clk@vger.kernel.org,
 srv_heupstream@mediatek.com
To: Flora Fu <flora.fu@mediatek.com>, Matthias Brugger <matthias.bgg@gmail.com>,
 Michael Turquette <mturquette@baylibre.com>, Rob Herring <robh+dt@kernel.org>
Date: Fri, 16 Apr 2021 17:02:20 -0700
Message-ID: <161861774045.46595.16984607053300669956@swboyd.mtv.corp.google.com>
User-Agent: alot/0.9.1
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210416_170222_414125_8F1164F5 
X-CRM114-Status: UNSURE (   5.58  )
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

Quoting Flora Fu (2021-04-14 22:52:35)
> Add APU clocks support on MT8192.
> 
> Signed-off-by: Flora Fu <flora.fu@mediatek.com>
> ---

Acked-by: Stephen Boyd <sboyd@kernel.org>

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
