Return-Path: <SRS0=LW2f=OE=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.4 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,INCLUDES_CR_TRAILER,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 04AF1C433EF
	for <linux-mediatek@archiver.kernel.org>; Tue, 14 Sep 2021 22:37:15 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id C524D6113B
	for <linux-mediatek@archiver.kernel.org>; Tue, 14 Sep 2021 22:37:14 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org C524D6113B
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Message-ID:Date:To:Cc:From:Subject:
	References:In-Reply-To:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=tzDJ+o+UXC6sFzXT6FLCNgodn8tU+yrirz16MbmQH18=; b=EYYcdTOnTz8Tno
	TCnCdhzpUk43aZw4KpXJVvmVwb6eOY8tKvEScvN76PVB5mKn2mZzW4gk/BmeA9g/+9a1qQ3o+Vu+Z
	gGMXs1xkxigQJ0ZQ7eq3Ix8J+HQJ8YgD/0t1bBu3ZctZyOB01nxmxQEGmfesCycAVxDElrIbEUzsu
	nglH5dl/fpAb0UYos3bpIBcAh+I4PIkq753Z/ya7QPjP7+SO43hnQ1WFk1rAgnVF8ZPY94iu1FI1o
	Cf029YTu5sIR7kJrczmzDgYHybtVqN6vPD3Zf7jdT+Dr8C8xMRWRlVYIAXIFDmIdf5YjAVJdoMk0V
	YbzRpxBxW3+u5pD9IJmA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mQH31-007RZy-OV; Tue, 14 Sep 2021 22:37:03 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mQGmq-007Jwl-Md; Tue, 14 Sep 2021 22:20:21 +0000
Received: by mail.kernel.org (Postfix) with ESMTPSA id 2B0FA61175;
 Tue, 14 Sep 2021 22:20:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1631658020;
 bh=r1OvlgjiQppjPiGzI6tFa4VMULrxK1llfZWUWLThmRU=;
 h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
 b=KFAGYXkQPaCZ7ioZ1XITS5A1kbs2w+LjFX2J9kJY7yONArtF2roB/EhOeuqLa1zCV
 39dr86s+XDL49jEmEC2WBcZ3ClRTjN/GoAwddgw/94mtdnOMEbW0SW1Ls3QqT2ACfR
 Q7ji5eoDOkt5dUF9Hvpqx7I0mQ7xQlsD7//A0f3LV39woaZkPtmBADw1IPsqrJz0f3
 WtYonEZyE+KHIxBxEPjT32lZJT0ntKjQN+E/g1L33HG8gZNg/BYN+4PJv7gpn1fqFt
 miizRL/x50LE3BENHi72BpKwLX8lUkD4qQhz8LcC+HHkbqGphdTRhNkwPbxLTWucGN
 JaIkhpmqxf3Tg==
MIME-Version: 1.0
In-Reply-To: <20210914021633.26377-25-chun-jie.chen@mediatek.com>
References: <20210914021633.26377-1-chun-jie.chen@mediatek.com>
 <20210914021633.26377-25-chun-jie.chen@mediatek.com>
Subject: Re: [v3 24/24] clk: mediatek: Add MT8195 apusys clock support
From: Stephen Boyd <sboyd@kernel.org>
Cc: linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-mediatek@lists.infradead.org, linux-clk@vger.kernel.org,
 devicetree@vger.kernel.org, srv_heupstream@mediatek.com,
 Project_Global_Chrome_Upstream_Group@mediatek.com,
 Chun-Jie Chen <chun-jie.chen@mediatek.com>
To: Chun-Jie Chen <chun-jie.chen@mediatek.com>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 Nicolas Boichat <drinkcat@chromium.org>, Rob Herring <robh+dt@kernel.org>
Date: Tue, 14 Sep 2021 15:20:19 -0700
Message-ID: <163165801904.763609.1606672028948718811@swboyd.mtv.corp.google.com>
User-Agent: alot/0.9.1
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210914_152020_813070_53C4804C 
X-CRM114-Status: UNSURE (   5.40  )
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

Quoting Chun-Jie Chen (2021-09-13 19:16:33)
> Add MT8195 apusys clock controller which provides PLLs
> in AI processor Unit.
> 
> Signed-off-by: Chun-Jie Chen <chun-jie.chen@mediatek.com>
> Reviewed-by: Chen-Yu Tsai <wenst@chromium.org>
> ---

Applied to clk-next

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
