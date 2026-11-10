Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1161C606A320
	for <linux-mediatek@archiver.kernel.org>; Tue, 10 Nov 2026 18:56:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=XosQuiVr;
	dkim=pass (2048-bit key, unprotected) header.d=justthetip.ca header.i=@justthetip.ca header.a=rsa-sha256 header.s=key1 header.b=ovaMj8qW
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=kQSjpRkLhJ3MmjhWRGrwwqa6QqXZ8qzNkGmLYEakllQ=; b=XosQuiVrexIWpD
	ZPnRjir6Ayp+jOozcaI59/1QkyIXrZv315hnThYxTPTZQ8Bg34WxhnOIRnCn/npc2KPinitD2Vt+5
	fNBcGQ5v1tW1p/LOTlptPT8oASWzXzblxiAs43LBtfQOppfFWlcqIIiJuCRDPmG+Ok5MfJbhWPoay
	Y2o+N3Z6PXF33cmUQizmivOZY3RMcfZEL8Avagklq94M0NyZvAA7Y/KZAsy5P3UsuUO5xhxVb5Zod
	mkypoN99B5a8qO40p+EvZ4OxSsbCW0s88Nsx+E3kkRpfgGZH7ZAUEzsubU3yfcAgHG68A53i990iK
	Vd0/Ud7XAAUvMXJ+wb+A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xQr1U-00000004rC8-3FX1;
	Tue, 10 Nov 2026 18:56:48 +0000
Received: from out-188.mta0.migadu.com ([2001:41d0:1004:224b::bc] helo=mta0.migadu.com)
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xQr1R-00000004rB2-3AkD
	for linux-mediatek@lists.infradead.org;
	Tue, 10 Nov 2026 18:56:48 +0000
X-Envelope-To: linux-mediatek@lists.infradead.org
DKIM-Signature: a=rsa-sha256; bh=2DL3rl+rMQtbPHNfe/VkSh1vOHFeZi6JunlnhjAs+Gw=;
 c=simple/simple; d=justthetip.ca;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1794337003; v=1; x=1794941803;
 b=ovaMj8qW6D6q5ugifWnb1Sl8MCktDkmt2V7e0KeUoq3nnM0MTLHc6aZqH3JJNxMc/FgBgxN4
 riumrtRuOsAOju5LVQ27+eLqAIpWaROhxUa+7vdNCvy8oLQLjpbHfwS6TUcyXd+PYtCEC3uq91w
 ti74ljVPQRoJghRe0ojRSBs/axmR3+xiz+hPpedaBXjA0w9fyBjB7pYLpcIcWd8Y7uYvX/u2u0b
 oVMPcQGQsOXOZur/OwmaJGhNaswiBVWo8t/HNsZUxNpUNmQ+7HWp4ms74Pg+34XuObgcCm+Rm1Z
 mjKQJQiHdGBNL7p/gEZnCjBJHp3yQq6hjMuyXyzMF2Cbg==
X-Envelope-To: linux-mediatek@lists.infradead.org
Received: by smtp.migadu.com with ESMTPS id 40fe415b35cf92f9;
	Tue, 10 Nov 2026 18:56:43 +0000
X-Mizu-Trace-ID: 40fe415b35cf92f9
X-Migadu-Flow: FLOW_OUT
From: Devin Wittmayer <lucid_duck@justthetip.ca>
To: kernel test robot <lkp@intel.com>
Cc: Felix Fietkau <nbd@nbd.name>,
	Lorenzo Bianconi <lorenzo@kernel.org>,
	Ryder Lee <ryder.lee@mediatek.com>,
	oe-kbuild-all@lists.linux.dev,
	Deren Wu <deren.wu@mediatek.com>,
	Sean Wang <sean.wang@mediatek.com>,
	Shayne Chen <shayne.chen@mediatek.com>,
	Quan Zhou <quan.zhou@mediatek.com>,
	Michael Lo <michael.lo@mediatek.com>,
	James-LY Huang <james-ly.huang@mediatek.com>,
	linux-wireless@vger.kernel.org,
	linux-mediatek@lists.infradead.org
Subject: Re: [PATCH v2] wifi: mt76: mt792x: tell mac80211 when a disconnect cancels its ROC
Date: Tue, 10 Nov 2026 11:56:37 -0700
Message-ID: <20261110185637.13126-1-lucid_duck@justthetip.ca>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <202611101719.St87Ty1E-lkp@intel.com>
References: <20261110005846.38432-1-lucid_duck@justthetip.ca> <202611101719.St87Ty1E-lkp@intel.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261110_105646_297720_9AFA12D8 
X-CRM114-Status: UNSURE (   6.08  )
X-CRM114-Notice: Please train this message.
X-Spam-Score: -2.1 (--)
X-BeenThere: linux-mediatek@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-mediatek.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-mediatek/>
List-Post: <mailto:linux-mediatek@lists.infradead.org>
List-Help: <mailto:linux-mediatek-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mediatek>,
 <mailto:linux-mediatek-request@lists.infradead.org?subject=subscribe>
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
X-Spam-Status: No, score=-13.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no
	version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On Tue, Nov 10, 2026 at 05:27:20PM +0800, kernel test robot wrote:
> [auto build test ERROR on wireless-next/main]
> [also build test ERROR on wireless/main linus/master v7.4-rc2 next-20261109]
> [If your patch is applied to the wrong git tree, kindly drop us a note.

Wrong tree. v2 is for Felix's mt76 branch:

  https://github.com/nbd168/wireless.git mt76
  base-commit: 8739e5b44b23

> >> drivers/net/wireless/mediatek/mt76/mt7921/main.c:385:16: error: 'struct mt792x_phy' has no member named 'roc_notify'

That flag comes from 2466ffac172d, which is in that branch and has not
reached wireless-next yet. The clang report is the same thing.

Devin

