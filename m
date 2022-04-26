Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CA47BC433EF
	for <linux-mediatek@archiver.kernel.org>; Tue, 26 Apr 2022 00:14:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Message-Id:Date:To:Cc:From:Subject:
	References:In-Reply-To:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=PxUkCQyufVGqzwChNqJKZJbwjP9ZKkJO+T7Op9V3cjE=; b=acfMPEsx4NPKhL
	rGeXh/FnE9SjplTmpjbbhiJH2O5LxPWz0hq9m6rakc1Qfn2/xVO8MqqN256C/NqIgt2pfpn2ZwwYN
	Jz4BxCIrdLMM3Qf6K9Vyc+pz2gHcML7kyEhZUm37MIyfM+os27/Ow6N4W3HwR0tc7sP5oVK3Dnvp3
	H1RfuPHaul6pecKq5vOyt75c9D8EDHmhsj2J02T5eNtuY0F+koS/mvKX7p5RGKPupuI82WqGc5TNa
	vl+woKC+P8rkFEB9Ap77pBQOGjzYIiN8Dnv9GmJWzYxNv/HIGj/HG/ryGFAoabBtdLwihI4MQLGcx
	RoyzCmNt8++F7Wy4sckw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nj8qQ-00Bq1r-Lh; Tue, 26 Apr 2022 00:14:18 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nj8pN-00BpPN-W7; Tue, 26 Apr 2022 00:13:15 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 8B7F861671;
 Tue, 26 Apr 2022 00:13:13 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E35EAC385AE;
 Tue, 26 Apr 2022 00:13:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1650931993;
 bh=2pOIqk/1MTAUoNZqI21mUlSzVaSA+8cvo6c8NdB/7YU=;
 h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
 b=NnewxImx735aiqVB/1VgC9Md61kBQIn2GEKRnk7xpdj7vWB2kVeDtsxj34LWUoETQ
 qbg/068f+c1mmYLMbOp24211B+2ruFRIBGTkjXLT/6uBxUmb1xckwuRi/DQKkX1q26
 o+JilLLZnQw/v5MZWW18hqoFPUOJghGu5aITXO8Ddq1mqCg/oLP/+Yy1OavmnDtez7
 uoCPrVmnh2hQKeCK+nvlnCxcaihc/KOarYq7dqKmjV5ybqcrJJLa9qEbA6bxNabJaa
 tI1Z2NZ20/nwcTvnyvNQCW4k9ICWSVAIR/ulboWje9RCJCfEw91iH5TOuqWx3LEti0
 qCOCp4TRS9XpQ==
MIME-Version: 1.0
In-Reply-To: <20220409132251.31725-9-chun-jie.chen@mediatek.com>
References: <20220409132251.31725-1-chun-jie.chen@mediatek.com>
 <20220409132251.31725-9-chun-jie.chen@mediatek.com>
Subject: Re: [PATCH v5 08/15] clk: mediatek: Add MT8186 mmsys clock support
From: Stephen Boyd <sboyd@kernel.org>
Cc: linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-mediatek@lists.infradead.org, linux-clk@vger.kernel.org,
 devicetree@vger.kernel.org, srv_heupstream@mediatek.com,
 Project_Global_Chrome_Upstream_Group@mediatek.com,
 Chun-Jie Chen <chun-jie.chen@mediatek.com>
To: Chun-Jie Chen <chun-jie.chen@mediatek.com>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 Nicolas Boichat <drinkcat@chromium.org>, Rob Herring <robh+dt@kernel.org>
Date: Mon, 25 Apr 2022 17:13:10 -0700
User-Agent: alot/0.10
Message-Id: <20220426001312.E35EAC385AE@smtp.kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220425_171314_133885_664C9BFD 
X-CRM114-Status: UNSURE (   8.55  )
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

Quoting Chun-Jie Chen (2022-04-09 06:22:44)
> Add MT8186 mmsys clock controller which provides clock gate
> control in video system. This is integrated with mtk-mmsys
> driver which will populate device by platform_device_register_data
> to start mmsys clock driver.
> 
> Signed-off-by: Chun-Jie Chen <chun-jie.chen@mediatek.com>
> Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
> Reviewed-by: Miles Chen <miles.chen@mediatek.com>
> ---

Applied to clk-next

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
