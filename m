Return-Path: <SRS0=h4nU=NZ=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.4 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,INCLUDES_CR_TRAILER,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4BD0CC433EF
	for <linux-mediatek@archiver.kernel.org>; Fri,  3 Sep 2021 18:33:27 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 1A49360FC0
	for <linux-mediatek@archiver.kernel.org>; Fri,  3 Sep 2021 18:33:27 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 1A49360FC0
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Message-ID:Date:To:Cc:From:Subject:
	References:In-Reply-To:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ZMQgdsNt71AZYRMxUgC4YqKHNcJ4FCuiVRZshV5mwXI=; b=Wnv8IRhWVAHqED
	q25l4HmQgZhvj80dlidN05zTfqXRRfbBXeYsujEYb3rsLeno69gcQhJiW3yyFgKc/yQxfaCpKw4Qx
	jox4bNHf04S8OfFtVo6JJyoyZDDYclu+udjLZnrGHXHd7L/S/8gix0j9hMOI0UkFIdFaHgq42PhEN
	2vofsKl7IAZN+BHp82wJRiR1ctk51/+U5on3FvG3LTYdPxe9uXCpe7t26yXiqEmjI5IEqkS2Z93xC
	iKE9Da795kG10Sdw9yuCViNpYhaqty/+0vNoF2XzgqxN5FTZ5K4v6z2Ia7VYgnrzIYcUS38h5dST+
	u47Pu/gYxYG3u49YI0xw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mME04-00CbD5-96; Fri, 03 Sep 2021 18:33:16 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mMDzi-00Cb2q-DG; Fri, 03 Sep 2021 18:32:55 +0000
Received: by mail.kernel.org (Postfix) with ESMTPSA id 9CF3960724;
 Fri,  3 Sep 2021 18:32:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1630693973;
 bh=l/p1Mt+6Buj3XpMkEakyWxymjCSxUxk4W1rvVC61s4Y=;
 h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
 b=f6KdmLDyoCj8nHr/oc0jQe6KrKWlhQDDVs0k69X/d/+YOu36J8pL16GkpIePEoFjj
 u/qOlKoRY0cVmbGT9yvRyGYZ41rg40sccPGZ2ndVD27M4QscQf1FBeNRbzxgsf4a41
 7csNMyf4kyuMlZDDj5FihxoxaX20rC1U+hBKVA9mEeAFZG8gbNpFnDdXlZtOz0SBk3
 6y8mu6y19xaSgY0g2B1YQWPPhTsU+jMoMC1X7cQ9CNgBi3yaSh7LBwpDpVwUXeV3Pl
 nR7/DtbxWjs0C7eetEn5gHwFCyrPf5kA7u48hBscwDwT/0bpUhaiarDMhCVKAKGXdR
 kYsRB9HijTGhA==
MIME-Version: 1.0
In-Reply-To: <20210902075713.7563-1-miles.chen@mediatek.com>
References: <20210902075713.7563-1-miles.chen@mediatek.com>
Subject: Re: [PATCH] clk: rockchip: use module_platform_driver_probe
From: Stephen Boyd <sboyd@kernel.org>
Cc: linux-clk@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-mediatek@lists.infradead.org, wsd_upstream@mediatek.com,
 Miles Chen <miles.chen@mediatek.com>
To: Heiko Stuebner <heiko@sntech.de>,
 Michael Turquette <mturquette@baylibre.com>,
 Miles Chen <miles.chen@mediatek.com>
Date: Fri, 03 Sep 2021 11:32:52 -0700
Message-ID: <163069397238.405991.15295469394989512619@swboyd.mtv.corp.google.com>
User-Agent: alot/0.9.1
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210903_113254_513711_37F5C14C 
X-CRM114-Status: UNSURE (   5.35  )
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

Quoting Miles Chen (2021-09-02 00:57:13)
> Replace builtin_platform_driver_probe with module_platform_driver_probe
> because that rk3399 and rk3568 can be built as kernel modules.
> 
> Cc: Stephen Boyd <sboyd@kernel.org>
> Signed-off-by: Miles Chen <miles.chen@mediatek.com>

Should it have a fixes tag?

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
