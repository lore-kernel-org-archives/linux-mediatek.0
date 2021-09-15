Return-Path: <SRS0=Ndyv=OF=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.4 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,INCLUDES_CR_TRAILER,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 82B29C433EF
	for <linux-mediatek@archiver.kernel.org>; Wed, 15 Sep 2021 01:24:27 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 4AD8C61164
	for <linux-mediatek@archiver.kernel.org>; Wed, 15 Sep 2021 01:24:27 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 4AD8C61164
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Message-ID:Date:To:Cc:From:Subject:
	References:In-Reply-To:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=6JiBnVubO04FcBXuw02d+nPFj/HE43J5zZM+fmIfA0E=; b=BPhn8yMDNPzo2t
	2NkES73/27U6wEjnRIh+o99REm6vCEyPaBBw5wkNBGaf8HEJ3A8gaLITEv6QwrOCaN7ksWGIwEdPP
	msFW/RO835F8rZInhyc8Jf7XCVMut7Q969EWbojdfaTZWvnH36oewJHQkgYPVH3FLDmUT45NzQVtu
	Fu/TeKkGo/WkkR1OGYX5/+qoYpNBokgScM5B5nBBgz4QOEZ76kMplNF/PulVrko68UmUnA0MyVAfP
	7CTZF1kK72h9UFP75Hje0pnX7EgyfRfG7AkN5ryILVIcrNXSRjDtJYuxUVH3/zlceX92/tulVuF79
	a8ZZyrxtxtnbmI4lSXpg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mQJeq-007oCF-KJ; Wed, 15 Sep 2021 01:24:16 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mQJeQ-007o3m-FY; Wed, 15 Sep 2021 01:23:51 +0000
Received: by mail.kernel.org (Postfix) with ESMTPSA id 18B0C61164;
 Wed, 15 Sep 2021 01:23:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1631669030;
 bh=64nXdNaboRHGPiOfE18v9wd+99WndHPRdbRxXUIuN+g=;
 h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
 b=GmOFHx8nhiSekvsuh0utn7Luy8tL+mdg1YKFxPgmqZBISrPzO5cqGaYU9yNwbPKoM
 JaZjitWwKECn+V/ppfNMZIYtBma/z6T26T6KYEZD+0suX5xo5k/Hy7/2ctUdoC3ycU
 Mt+agjcpT5jBx3SBm6HxmfSwWA8pFo6KyqS4qPn+S36yMxvYUp/cAc4nY2eGevg4dQ
 rvU4nS81FofZm/kH3pt/yyAlN4tjPHSnmK9icVN/qXvvVQ+9urDS4XENhrwtWhXmlY
 M9gh349FQTamm7A7jHeRNQXKA+4Bi94TS/eQX1+tgn4Y2K3rxrhUvR6AZh1tpfg2ni
 Wtcv6wUQjrBhA==
MIME-Version: 1.0
In-Reply-To: <20210901222526.31065-3-miles.chen@mediatek.com>
References: <20210901222526.31065-1-miles.chen@mediatek.com>
 <20210901222526.31065-3-miles.chen@mediatek.com>
Subject: Re: [PATCH v3 2/3] clk: mediatek: support COMMON_CLK_MEDIATEK module
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
Date: Tue, 14 Sep 2021 18:23:48 -0700
Message-ID: <163166902892.763609.977824990105929862@swboyd.mtv.corp.google.com>
User-Agent: alot/0.9.1
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210914_182350_582578_5955E4FD 
X-CRM114-Status: UNSURE (   6.00  )
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

Quoting Miles Chen (2021-09-01 15:25:25)
> To support COMMON_CLK_MEDIATEK module build,
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
