Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 165EEC433EF
	for <linux-mediatek@archiver.kernel.org>; Thu, 19 May 2022 00:28:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Message-Id:Date:To:Cc:From:Subject:
	References:In-Reply-To:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=SEbpRcSiJ7d7Wnru50ouyKRLz0vFy8SKxY2sRrgfBmo=; b=301dtrEIcFnYQr
	1w2hExQZS0msyti2gGuOm1GLacYLPY60cENs+vcqnfgvNwkVCBWR1Yt2v6cOiZPEKiCUcAMRm1ZFI
	Xb33Jamh2K36ujG9N/sD1E1+ZgPRaf8rovQZIYdVD9MAky/tYkCwI5fuaDeFMCHFxw3H+Zm4aV8HV
	0FXzGDMgpFeClW59K7Ydcc1OA+dqjyTy4SRnZB5W9hFMOYeggUY/tKq7N+P4VnXf9Kp5GF7pb9xiL
	jBaiWdVa42KzVv/OXUXlp5lqgYXfbDtM2vlhVQZbN8XpP0g+7P5EQUfMNqxbGozH0Zn0v/gyqaZqk
	kKSEP+06XEwVAcLciRwA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nrU18-004UE8-IG; Thu, 19 May 2022 00:27:50 +0000
Received: from ams.source.kernel.org ([145.40.68.75])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nrU0y-004UCe-9m; Thu, 19 May 2022 00:27:41 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id C3EB3B8226B;
 Thu, 19 May 2022 00:27:38 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 64A00C385A5;
 Thu, 19 May 2022 00:27:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1652920057;
 bh=uLA2B3JdtuKfmczgP+XIweYLbIcpKI/kfdimMYr3uVs=;
 h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
 b=AJb4BTc2uFwAXCCKwPjc1pyzCc66nl82NeqQAY8kya/dCQmC2z1cN4HWCLVXhhlDA
 5ccjPa3h5Fn0spnoWwRE/dLWKAoia77J4LhpogK7XTvPBCMGGjfup0yVol150t+BWn
 ICt3K9fcasYC1oJ2l5nClR+VBQ9wFEeIbZSyhZlCMpUGc2s9KMAQpjl8aO4ujCNqZ6
 c6gCOy82jsApzi0JdaU9bN44pvNfuzYVc4VXRttOu6PvY0/Gl/KKGCPkAjD+o6W7pf
 f18qt6qP6CAr1UYv2GL3D+Iukc1A23brwONtn+bn91JIn+h6c1SoBFg0Y465Z3k7EH
 xDs8evEzH8MlQ==
MIME-Version: 1.0
In-Reply-To: <20220509090939.845-2-sam.shih@mediatek.com>
References: <20220509090939.845-1-sam.shih@mediatek.com>
 <20220509090939.845-2-sam.shih@mediatek.com>
Subject: Re: [PATCH 1/1] clk: mediatek: update compatible string for MT7986
 ethsys
From: Stephen Boyd <sboyd@kernel.org>
Cc: John Crispin <john@phrozen.org>, Lorenzo Bianconi <lorenzo@kernel.org>,
 Sam Shih <sam.shih@mediatek.com>
To: Matthias Brugger <matthias.bgg@gmail.com>,
 Michael Turquette <mturquette@baylibre.com>, Ryder Lee <ryder.lee@kernel.org>,
 Sam Shih <sam.shih@mediatek.com>, linux-arm-kernel@lists.infradead.org,
 linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-mediatek@lists.infradead.org
Date: Wed, 18 May 2022 17:27:35 -0700
User-Agent: alot/0.10
Message-Id: <20220519002737.64A00C385A5@smtp.kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220518_172740_517405_5AD70C0F 
X-CRM114-Status: UNSURE (   8.43  )
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

Quoting Sam Shih (2022-05-09 02:09:39)
> Update compatible string of mt7986 ethsys clock driver to fit the
> devicetree bindings document.
> 
> Signed-off-by: Sam Shih <sam.shih@mediatek.com>

Is it 

Fixes: ec97d23c8e22 ("clk: mediatek: add mt7986 clock support")

?

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
