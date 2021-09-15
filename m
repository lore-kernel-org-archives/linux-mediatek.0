Return-Path: <SRS0=Ndyv=OF=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.4 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,INCLUDES_CR_TRAILER,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 72665C433F5
	for <linux-mediatek@archiver.kernel.org>; Wed, 15 Sep 2021 01:24:47 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 3F88561164
	for <linux-mediatek@archiver.kernel.org>; Wed, 15 Sep 2021 01:24:47 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 3F88561164
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Message-ID:Date:To:Cc:From:Subject:
	References:In-Reply-To:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=chLSOGee5khDe+Ps2WIyVg4AST30WERcB+zzPeGKAPA=; b=yzI1WHXgNzgl2r
	QTurtW9/9pb7jSY3S9bTCtQgTiNrgJtYJZes5tB2LK6pLFY1OPtl6iQruA2bvQmvCLjmL3Bq8mWEE
	eTNOSw784Y5/YEzhaK6yITW3rlhvL+UnpLSJ34SH0TtUMG4prSPutBOjzkLzxlRRnaL/bNy1qharN
	/NTNfHaG1EiFqOspUWI57PgMwtFIhgtoFVe94GpBwBrRVPs2paOoxdOpFBO8MTuMPpRy094zMqU/L
	9nIiA8wsrGOhmJ8NqD0Yv947uYzgXWth0rvFC695n3TrTp0NE0bQ8zJCwyEvdMF2U5SWUZtaLCCaK
	eWHx69GFGLZcIqwBJV6g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mQJf9-007oM0-No; Wed, 15 Sep 2021 01:24:35 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mQJeW-007o5W-65; Wed, 15 Sep 2021 01:23:57 +0000
Received: by mail.kernel.org (Postfix) with ESMTPSA id C6F3361164;
 Wed, 15 Sep 2021 01:23:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1631669035;
 bh=a4Q5VaYy+4HCbuUSPOC/CcwYoE5BEe6GS13nz7hj9jg=;
 h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
 b=JiNsVp3DtBHWqHDoFaThuguqdDojwnttXgGWQL9Rn8MvhkkDN38l8SgwHbzWBJZEh
 RM5x5BkJrF7wsCF9gFWbJRbVHGOXrCYzehp28QKz13tAOvKhExilh8Bd2QPu4DiNzS
 elROiwyML+nn4v7vlUKPht5hYqHAdVFiNVUUl4qvJ/n94F63vvOIpvmqClZr5+IRUf
 QrPz1HL8me1T8J0H2gkmrgSpprtCTuSaA4xyzFsaPoQOpaeOGJ4Y2w3zE8IIt86PSc
 4Ex/MF1EEqvCJ58pjyN3d2hPNK/6j/rViZHgNT6l29y0cojHp6/iB531hCzYhcm1gu
 qh0ZOuEbJWvbA==
MIME-Version: 1.0
In-Reply-To: <20210901222526.31065-4-miles.chen@mediatek.com>
References: <20210901222526.31065-1-miles.chen@mediatek.com>
 <20210901222526.31065-4-miles.chen@mediatek.com>
Subject: Re: [PATCH v3 3/3] clk: mediatek: support COMMON_CLK_MT6779 module
 build
From: Stephen Boyd <sboyd@kernel.org>
Cc: Wendell Lin <wendell.lin@mediatek.com>,
 Hanks Chen <hanks.chen@mediatek.com>, linux-clk@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org, wsd_upstream@mediatek.com,
 Miles Chen <miles.chen@mediatek.com>, Lee Jones <lee.jones@linaro.org>
To: Matthias Brugger <matthias.bgg@gmail.com>,
 Michael Turquette <mturquette@baylibre.com>,
 Miles Chen <miles.chen@mediatek.com>
Date: Tue, 14 Sep 2021 18:23:54 -0700
Message-ID: <163166903470.763609.2461004170232167564@swboyd.mtv.corp.google.com>
User-Agent: alot/0.9.1
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210914_182356_264396_02EFF191 
X-CRM114-Status: UNSURE (   6.20  )
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

Quoting Miles Chen (2021-09-01 15:25:26)
> To support COMMON_CLK_MT6779* module build,
> add MODULE_LICENSE and export necessary symbols.
> 
> Cc: Stephen Boyd <sboyd@kernel.org>
> Cc: Hanks Chen <hanks.chen@mediatek.com>
> Cc: Wendell Lin <wendell.lin@mediatek.com>
> Cc: Lee Jones <lee.jones@linaro.org>
> Signed-off-by: Miles Chen <miles.chen@mediatek.com>
> ---

Applied to clk-next

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
