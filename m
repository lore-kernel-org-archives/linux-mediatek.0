Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 545C1C433F5
	for <linux-mediatek@archiver.kernel.org>; Tue, 26 Apr 2022 00:12:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Message-Id:Date:To:Cc:From:Subject:
	References:In-Reply-To:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=qMqKer1ixYRVNjqScv48emRBhHhyRUeFzFA7LexgqDs=; b=jTD8+5N8rp7Kyg
	DhSULoS9tiuUWM6t6ojQoxgaP76GBFvOVD0CSjBXnCRu4PW5fz+0L09AczKP0YCWyK9HRI6+iR4AG
	TDDzuY5KEXRnyXWCGH3mmGL3ksfg4HrAHTN2q1T6iLNAl9NVBsKf6Bj1gaDYuxK18BQIkIBLH8ZvC
	n9TXZkLEFetZywP3ws4zPEMBZZvW+cSNAIERiiQvAA4FScIb8fMPGEJ1AEKKC1pSsvjdvlGug2L57
	tI6HGVQk0KpNN9UV5pmG3AEHC3AGHUDHPTcKuyIF+ivzfDi9t4UkdfGiacQxdND2XHdG6RQhfsR++
	czmaCgDfSz+9RNcqWkUw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nj8oS-00BoyT-8P; Tue, 26 Apr 2022 00:12:16 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nj8oI-00Bowe-30; Tue, 26 Apr 2022 00:12:07 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id A8FD861676;
 Tue, 26 Apr 2022 00:12:04 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E4623C385A4;
 Tue, 26 Apr 2022 00:12:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1650931924;
 bh=2cinohATxPD5jIOjLzdaNPIP5C9FIyAkI8AzF3YNoaU=;
 h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
 b=iOUDS1uCgZ5NV/o6YT3TLhIpF/e/JOfqlNY+wqwbvekbkOfCGbRdqFAQlNxegWOOr
 3xrDpswREEqCUCQVwldihOvYkz+1z3yMWoYH/ZDXBFE2MBu+6b4L0LX+Easoyi+J/S
 11MIu6JC1QxSpkyxdDm4g8MiKYtDLgirl3T+MDqDCjz3u85UPOu6gYbMgCPkO3+zy/
 D5XBmvavXxSXG+TnKHQTNQCDlDSKznkWpdD9pHcOyGEmwiJg1k5iULEuJndtOyUYCY
 OUxZiJxs0mFMPQEDXHkYLzeRIGNc7Vq3xfmfqO8luOKrctWacHzt1NjguVJA1KNq94
 bQQhhRgTblFoQ==
MIME-Version: 1.0
In-Reply-To: <20220409132251.31725-2-chun-jie.chen@mediatek.com>
References: <20220409132251.31725-1-chun-jie.chen@mediatek.com>
 <20220409132251.31725-2-chun-jie.chen@mediatek.com>
Subject: Re: [PATCH v5 01/15] dt-bindings: ARM: MediaTek: Add new document
 bindings of MT8186 clock
From: Stephen Boyd <sboyd@kernel.org>
Cc: linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-mediatek@lists.infradead.org, linux-clk@vger.kernel.org,
 devicetree@vger.kernel.org, srv_heupstream@mediatek.com,
 Project_Global_Chrome_Upstream_Group@mediatek.com,
 Chun-Jie Chen <chun-jie.chen@mediatek.com>
To: Chun-Jie Chen <chun-jie.chen@mediatek.com>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 Nicolas Boichat <drinkcat@chromium.org>, Rob Herring <robh+dt@kernel.org>
Date: Mon, 25 Apr 2022 17:12:01 -0700
User-Agent: alot/0.10
Message-Id: <20220426001203.E4623C385A4@smtp.kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220425_171206_207537_254B8B3C 
X-CRM114-Status: UNSURE (   8.94  )
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

Quoting Chun-Jie Chen (2022-04-09 06:22:37)
> This patch adds the new binding documentation for system clock
> and functional clock on MediaTek MT8186.
> 
> Signed-off-by: Chun-Jie Chen <chun-jie.chen@mediatek.com>
> Reviewed-by: Rob Herring <robh@kernel.org>
> ---

Applied to clk-next

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
