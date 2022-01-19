Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 672F5C433EF
	for <linux-mediatek@archiver.kernel.org>; Wed, 19 Jan 2022 20:05:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Message-Id:Date:To:Cc:From:Subject:
	References:In-Reply-To:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=NmkSsAvr2E9z/4I18Nd5hw4qCHPaFJwg5rBXJDepJpo=; b=NWVd1GYuUJCnFv
	djJ/IAw8fYdKQhtZPDEXnV+mp62+VKFlKYjCaCn9OdvZ1sMQ8czzVY25iyQLanPffxQxawYQtFwCa
	zYMXTPLh7HCAN58wbUMjWKczQ+csFXsNsZc7/gR0B9rG0crt4TMlrrqwSjTs9cS2W3fSxI6uNxA71
	/22SKnE21pYzxT0VHUc4E0xbJevSsFhiXkWZ4/wzda/TUH/Z+M2AqvMmA1n9xXdfYcI99ma8Heevn
	pe4GRMSV0paqNbwtaGa3xWybmZNuSz3qG+d3Gn5JQAPk7rPx51S7JCf5IkH2dIzjiiSWbBlqirQ3h
	e1uucaXQVZnstPqHpiFg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nAHD9-007Cph-0D; Wed, 19 Jan 2022 20:05:39 +0000
Received: from ams.source.kernel.org ([145.40.68.75])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nAHCw-007CnO-MC; Wed, 19 Jan 2022 20:05:27 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id 5E19EB81B40;
 Wed, 19 Jan 2022 20:05:25 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 15995C004E1;
 Wed, 19 Jan 2022 20:05:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1642622724;
 bh=WETv3X7CMWAxiJd6kJ5202hY9BumADpmPipnmE7jRRc=;
 h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
 b=lkxTmAKMPE8VYox3ea1nm1pTyRDVTfcSYa4zu5NpReRB/HVyyySaeaqJv1pL6Go6P
 jwH/VIrLLsgpX6hQajFl0rk1UJw2cv4fgiF6eICwqk6EVctGrasCPdITThNTVngKlN
 PsDbwSaZZPopGwv4gOMfN2Foz4QKCnlpwWqdJdU8IG7LJTCLrOREMUV3mYynTTPdvG
 YpIv6kZRYY8ZMJzV+SgcNFErhV6Cybu7sRa5FPVvh5qwXp0UVvedK5RJ5AsN1v/KL4
 tliaQ60cxW060PwOC+zG68URG3Z1qik71YDq/ajKltn0HIvL8cVxAHc5CUSdpMxrjX
 ToMx034KO3y8A==
MIME-Version: 1.0
In-Reply-To: <20220119123658.10095-2-sam.shih@mediatek.com>
References: <20220119123658.10095-1-sam.shih@mediatek.com>
 <20220119123658.10095-2-sam.shih@mediatek.com>
Subject: Re: [PATCH 1/1] clk: mediatek: relicense mt7986 clock driver to
 GPL-2.0
From: Stephen Boyd <sboyd@kernel.org>
Cc: John Crispin <john@phrozen.org>, Sam Shih <sam.shih@mediatek.com>
To: Matthias Brugger <matthias.bgg@gmail.com>,
 Michael Turquette <mturquette@baylibre.com>, Ryder Lee <ryder.lee@kernel.org>,
 Sam Shih <sam.shih@mediatek.com>, linux-arm-kernel@lists.infradead.org,
 linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-mediatek@lists.infradead.org
Date: Wed, 19 Jan 2022 12:05:22 -0800
User-Agent: alot/0.10
Message-Id: <20220119200524.15995C004E1@smtp.kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220119_120526_890498_AE1AE091 
X-CRM114-Status: GOOD (  10.05  )
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

Quoting Sam Shih (2022-01-19 04:36:58)
> The previous mt7986 clock drivers were incorrectly marked as GPL-1.0.
> This patch changes the driver to the standard GPL-2.0 license.
> 
> Signed-off-by: Sam Shih <sam.shih@mediatek.com>
> ---

Applied to clk-next

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
