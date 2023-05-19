Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A9FC4C77B75
	for <linux-mediatek@archiver.kernel.org>; Fri, 19 May 2023 17:54:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Cx/BboKZM72bNvQURDNrMM6XJGTDay/DOoAsiS5ct9M=; b=tYTpvHl1xb4PZKeTvINbOFsClq
	vyMslqJ2NJa7XL9xQZZcJxtnVqg6zSkf9G6PU+gtK2U7GCPdsjosUs0oqEP0lSP/uhkfI7SUlW7VJ
	69Pzfd8xaMTPT+ewaTsXzE/4mDWVtp9I3EBuIDXKy+NlnY9MEgb2wfeqvBoVPWOMjWO2ZkDb/aPlx
	dV6Wq6T+mx9i+2+gVcxuD9BpcZPungUc8tbJnaUIq1ahxLwvu0DxHJjflJU62R7G4w8Z+9j9cAtNo
	KV8X+p6hbkmHZAL1xiZOwt1zkE9FCEnw2KqYl8l5AoY6bIR4MS0ob5OMHYNow2QfbmTWP+OqacmtT
	dcoGqQJw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1q04J1-00Gv5E-2g;
	Fri, 19 May 2023 17:54:19 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1q04Iw-00Gv4S-23;
	Fri, 19 May 2023 17:54:15 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 3416065677;
	Fri, 19 May 2023 17:54:14 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0D273C433D2;
	Fri, 19 May 2023 17:54:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1684518853;
	bh=97Bz3gBu3cjMub0ke7MmKbcC+HeuWyYj4GzpqG/0u3I=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=gWaZrMfp2bStabm0ely1bhnRcEqCR+YB3uEp7Sac3dSS8jW2seO49cVpL5YpaLhpM
	 QlDwLutKOtdP1nQXNQBpclTgqUzRQmc0wU6vaZcVmIJClsCAZ0BV1eJqG995nUJIB/
	 cRg2GXhCtQR0DLNL3cQ0cU7sjydtehsiSuqjz1+RwsylcBXV3J0TwyX0m8uzt7Ztyl
	 iUbLJhpCfzNAkviW9sLxTV1XrbuCmPdJZhdBW3cuYtB0QQ/59gnrOAG5bze1H297CP
	 jCkqUJjgvupFaHmDrIcppwH7Hl6wl4YzJ7HocwxZR//KUXpqCK2+/BzCkFv1wD2fzT
	 NS0pkjDORuMvQ==
Date: Fri, 19 May 2023 23:24:09 +0530
From: Vinod Koul <vkoul@kernel.org>
To: Chunfeng Yun <chunfeng.yun@mediatek.com>
Cc: Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org, linux-phy@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH RESEND v9 1/2] phy: core: add debugfs files
Message-ID: <ZGe3wY7U9o0QzsxB@matsya>
References: <20230513092218.21139-1-chunfeng.yun@mediatek.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230513092218.21139-1-chunfeng.yun@mediatek.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230519_105414_716537_A9DE3CF6 
X-CRM114-Status: UNSURE (   7.22  )
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
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On 13-05-23, 17:22, Chunfeng Yun wrote:
> Add a debugfs root for phy class, and create a debugfs directory under
> the root when create phy, then phy drivers can add debugfs files.

Applied both, thanks

-- 
~Vinod

