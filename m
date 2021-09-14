Return-Path: <SRS0=LW2f=OE=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.4 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,INCLUDES_CR_TRAILER,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1FC7AC433FE
	for <linux-mediatek@archiver.kernel.org>; Tue, 14 Sep 2021 22:19:28 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id E0C096117A
	for <linux-mediatek@archiver.kernel.org>; Tue, 14 Sep 2021 22:19:27 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org E0C096117A
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Message-ID:Date:To:Cc:From:Subject:
	References:In-Reply-To:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=aHJcDtcm7LpXjKIh4isXSrj/bL+TLZb7/wGi4zenOeM=; b=qe5pZggKOmqCDU
	J/+OteNFYnFpIrM4XqVXfXBhGzo+dq9qXHKK7QgMMqvyjbrs09yEy/j27Gj9Jyc5v5bH5qJmU0Sqd
	UYp1XLRVjJ1anIecFd/3BKL9MmnDhn/zgXGCBnXOhVs4NLy6F4mOqn2YtUK/y5fqx1TDAxmG3a5v2
	FEI2GGRyQwUfjy02LIW9hABLSDP1itIKlMK9grFwbf3i0Rl3tXyr/XC3E6o2U+gDriI7BN3qeay1m
	q+j7Da1WFQkGZTv8vHTMOSy1/G+tC4irr1iW69KueCwSHXlxsQCT1lj9uIWquiNIq65xIXhAOz/WG
	CxpCtsxSfhfpEN2kUClg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mQGln-007JMw-Pl; Tue, 14 Sep 2021 22:19:15 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mQGki-007IsT-Ns; Tue, 14 Sep 2021 22:18:10 +0000
Received: by mail.kernel.org (Postfix) with ESMTPSA id 582AD61164;
 Tue, 14 Sep 2021 22:18:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1631657888;
 bh=tgTTZMjt8Mww5FFR+ZGGWlJ3N4siFq1LQKbrxSONmjA=;
 h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
 b=F2eXCQLB+jpo0InbEeQPnQrcnq63l/QJUl9S0jiDhO8dGzAOvoEIeANw0o0u2IhPc
 7e5CQ1LW/1liED0WbVgfa4WrPPentOT24r6gxQE1aP4Vys7T0KJ8Vb3mTutpUk1wsR
 nWXZiq3vyzUTBwf/MsV4FWrPat21VIk6x9HBTZQ/haOYHM0Lvt3w8dWyMHdGdnu2Y6
 /leNHGu9Nek7pzKh4Idl3BnRB1I7z8NqlnsKJfl5dTYgYYhquRwJCdeekZyj33tssW
 ykTVMaZJr0gDZZtoc4xmuaWZP90tcAXTQP0HKPdi4nrzf2yfYdXsPQoitsCwwuEK4w
 MJFM4NMoYYAHw==
MIME-Version: 1.0
In-Reply-To: <20210914021633.26377-5-chun-jie.chen@mediatek.com>
References: <20210914021633.26377-1-chun-jie.chen@mediatek.com>
 <20210914021633.26377-5-chun-jie.chen@mediatek.com>
Subject: Re: [v3 04/24] clk: mediatek: Add API for clock resource recycle
From: Stephen Boyd <sboyd@kernel.org>
Cc: linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-mediatek@lists.infradead.org, linux-clk@vger.kernel.org,
 devicetree@vger.kernel.org, srv_heupstream@mediatek.com,
 Project_Global_Chrome_Upstream_Group@mediatek.com,
 Chun-Jie Chen <chun-jie.chen@mediatek.com>
To: Chun-Jie Chen <chun-jie.chen@mediatek.com>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 Nicolas Boichat <drinkcat@chromium.org>, Rob Herring <robh+dt@kernel.org>
Date: Tue, 14 Sep 2021 15:18:07 -0700
Message-ID: <163165788720.763609.7235370743590362862@swboyd.mtv.corp.google.com>
User-Agent: alot/0.9.1
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210914_151808_844393_224F293B 
X-CRM114-Status: UNSURE (   5.99  )
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

Quoting Chun-Jie Chen (2021-09-13 19:16:13)
> In order to avoid resource leak when fail clock registration appears,
> so adds the common interface to handle it.
> 
> Signed-off-by: Chun-Jie Chen <chun-jie.chen@mediatek.com>
> Reviewed-by: Chen-Yu Tsai <wenst@chromium.org>
> ---

Applied to clk-next

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
