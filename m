Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 649F8E95A61
	for <linux-mediatek@archiver.kernel.org>; Sat,  7 Oct 2023 09:56:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Message-ID:In-Reply-To:Date:From:Cc:To:Subject:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:References:List-Owner;
	bh=noCleavFRBCxM2LBiIrdZfBRTXt6UlpNfDDWfquq8M8=; b=ZaDefOEe60lP/ELg37vY60ySOR
	Vw2e5S1tV87MRt+GnEoilwm1zUYmJERZE+twDGqQHSJUyXRUv+Hj66BuhzpJUhgZW0hPnTvR3jHM/
	/MWUqLNljMVl2OP32ifIJhPrz75xfT3xLmcKr41eAwLL90ZIcnQ1x1BIno/Y5N4/XVPzJfKx8GUth
	BfMHQDRxb6Si6Gk4j+GvbYHerbAq8QDLcIP9zskF1lzG4kdrucWLzQuFwknbImYizLhPPuCfncEMT
	jk6GkA3VLoZPJiqVfGpTw4cqyDiJwqbYgkLvOwuC+rKO1NxH6jVKL9fNU7SNSgp+GpTyx2UvboRIW
	R5czLn7A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qp42a-007HGi-2q;
	Sat, 07 Oct 2023 09:56:08 +0000
Received: from ams.source.kernel.org ([145.40.68.75])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qp42W-007HFk-27
	for linux-mediatek@lists.infradead.org;
	Sat, 07 Oct 2023 09:56:06 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by ams.source.kernel.org (Postfix) with ESMTP id C2E35B8076C;
	Sat,  7 Oct 2023 09:56:02 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CB1E3C433C8;
	Sat,  7 Oct 2023 09:56:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1696672561;
	bh=nkhNxslDrxRmqtD0Efb+DAIcFT8i0IMyLqM+tqRxiN4=;
	h=Subject:To:Cc:From:Date:In-Reply-To:From;
	b=zX/Hk/aW+4iszM5flJ4B3nmx02fVwMGaf3PtYb78QUaPp7SDskHP2deUJCsPW1r69
	 cJPmRzJR1LDmSG/lsj9yZCcQ6u5WEI1eOHkFcQ7YYlcI9hxTs+kiKgzs4htR6cVG2x
	 efeUHRsaJ9CRMeSqBT2mDsPNhCfk29Azu30bbhcQ=
Subject: Patch "drm/mediatek: Fix backport issue in mtk_drm_gem_prime_vmap()" has been added to the 5.10-stable tree
To: chunkuang.hu@kernel.org,gregkh@linuxfoundation.org,linux-mediatek@lists.infradead.org,llvm@lists.linux.dev,nathan@kernel.org,p.zabel@pengutronix.de,sashal@kernel.org
Cc: <stable-commits@vger.kernel.org>
From: <gregkh@linuxfoundation.org>
Date: Sat, 07 Oct 2023 11:55:58 +0200
In-Reply-To: <20230922-5-10-fix-drm-mediatek-backport-v1-1-912d76cd4a96@kernel.org>
Message-ID: <2023100757-endnote-problem-a13b@gregkh>
MIME-Version: 1.0
Content-Type: text/plain; charset=ANSI_X3.4-1968
Content-Transfer-Encoding: 8bit
X-stable: commit
X-Patchwork-Hint: ignore 
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231007_025605_003954_5CD2E0DE 
X-CRM114-Status: GOOD (  15.38  )
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


This is a note to let you know that I've just added the patch titled

    drm/mediatek: Fix backport issue in mtk_drm_gem_prime_vmap()

to the 5.10-stable tree which can be found at:
    http://www.kernel.org/git/?p=linux/kernel/git/stable/stable-queue.git;a=summary

The filename of the patch is:
     drm-mediatek-fix-backport-issue-in-mtk_drm_gem_prime_vmap.patch
and it can be found in the queue-5.10 subdirectory.

If you, or anyone else, feels it should not be added to the stable tree,
please let <stable@vger.kernel.org> know about it.


From nathan@kernel.org  Sat Oct  7 11:52:29 2023
From: Nathan Chancellor <nathan@kernel.org>
Date: Fri, 22 Sep 2023 08:51:17 -0700
Subject: drm/mediatek: Fix backport issue in mtk_drm_gem_prime_vmap()
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Sasha Levin <sashal@kernel.org>
Cc: Chun-Kuang Hu <chunkuang.hu@kernel.org>, Philipp Zabel <p.zabel@pengutronix.de>, linux-mediatek@lists.infradead.org, stable@vger.kernel.org, llvm@lists.linux.dev, Nathan Chancellor <nathan@kernel.org>
Message-ID: <20230922-5-10-fix-drm-mediatek-backport-v1-1-912d76cd4a96@kernel.org>

From: Nathan Chancellor <nathan@kernel.org>

When building with clang:

  drivers/gpu/drm/mediatek/mtk_drm_gem.c:255:10: error: incompatible integer to pointer conversion returning 'int' from a function with result type 'void *' [-Wint-conversion]
    255 |                 return -ENOMEM;
        |                        ^~~~~~~
  1 error generated.

GCC reports the same issue as a warning, rather than an error.

Prior to commit 7e542ff8b463 ("drm/mediatek: Use struct dma_buf_map in
GEM vmap ops"), this function returned a pointer rather than an integer.
This function is indirectly called in drm_gem_vmap(), which treats NULL
as -ENOMEM through an error pointer. Return NULL in this block to
resolve the warning but keep the same end result.

Fixes: 43f561e809aa ("drm/mediatek: Fix potential memory leak if vmap() fail")
Signed-off-by: Nathan Chancellor <nathan@kernel.org>
Signed-off-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
---
 drivers/gpu/drm/mediatek/mtk_drm_gem.c |    2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

--- a/drivers/gpu/drm/mediatek/mtk_drm_gem.c
+++ b/drivers/gpu/drm/mediatek/mtk_drm_gem.c
@@ -252,7 +252,7 @@ void *mtk_drm_gem_prime_vmap(struct drm_
 	if (!mtk_gem->kvaddr) {
 		kfree(sgt);
 		kfree(mtk_gem->pages);
-		return -ENOMEM;
+		return NULL;
 	}
 out:
 	kfree(sgt);


Patches currently in stable-queue which might be from nathan@kernel.org are

queue-5.10/drm-mediatek-fix-backport-issue-in-mtk_drm_gem_prime_vmap.patch
queue-5.10/bpf-fix-btf_id-symbol-generation-collision.patch
queue-5.10/bpf-fix-btf_id-symbol-generation-collision-in-tools.patch

