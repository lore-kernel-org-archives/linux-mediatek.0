Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6DB7BE6FE58
	for <linux-mediatek@archiver.kernel.org>; Fri, 22 Sep 2023 15:51:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:Message-Id:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=oX1CT1XC6kqzJ0nzURtFKAwu+A0CSwuSVdUe/dyO6BE=; b=vYMrz6ym98S5K7FSgmjqPEn18p
	9mRFBmQwcqkx2PVJgxyUjGW4jeVbAKT7Fh2C/qUq1L+1oFgBWOp0kVSYyLglMqzAA7/ZIoS8qeqnL
	kyR52Bf1RVQBpHcZM0jLenC5Z5vSLkX6zVYxKYK9s9T4xysAmF1SmigTI3mMikU0Aw8WYx9OOa1Us
	0nVpHSd5hioU7i5KEBpPknG8eI618F+5lRDRegBrgjRwFRhPerUCPQTmeZfINAMzP+aiNwEAiZ/jp
	2Uh48GU578K5ugraIHYDjEEqfkKbe7+wiqZ9dgtsaACfcWHeX0TxqZ5zVsjx1aQhws2FmK9JYZhyc
	iZFCvg6Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qjiRG-009Lsp-18;
	Fri, 22 Sep 2023 15:51:30 +0000
Received: from ams.source.kernel.org ([2604:1380:4601:e00::1])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qjiRD-009LrK-1Q
	for linux-mediatek@lists.infradead.org;
	Fri, 22 Sep 2023 15:51:28 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by ams.source.kernel.org (Postfix) with ESMTP id 83CE8B823D1;
	Fri, 22 Sep 2023 15:51:25 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6FDD9C433CC;
	Fri, 22 Sep 2023 15:51:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1695397884;
	bh=gcRAnlPPhzGuwjzkrCHq4S2a/cVRkBflII1JB2lJU+0=;
	h=From:Date:Subject:To:Cc:From;
	b=JHvghhh5aTrdwv45a5aWrV9EtLYm6O/9vhKmFFEfctQNsDIHMy43vZh3lrzOC4WIh
	 9HFE4FJJ3rPMTLpeT2Ne64LLEbqnZijZFzjDN1adBAhHACEN+p1QChiQcGa168jMZk
	 02mW2ZPTzjQemSkLGUmGoxJTOHEfykzZMqTyF0anhZO3cLHX8KrXayWZt4Z9KRISuI
	 gQ2aaXAgrDplyaT5aJymsF3SBBnOZmkGW5IX0jNGegHwlL196tg/i+efdsb8xC5n7K
	 9K0yZqnIdgUJKwvjlAf7zHGiPL5YUBOni23pD1Ow9yNWef17/16sJe30Jo2/RdMEfz
	 8mY7vNtvTnlsQ==
From: Nathan Chancellor <nathan@kernel.org>
Date: Fri, 22 Sep 2023 08:51:17 -0700
Subject: [PATCH 5.10] drm/mediatek: Fix backport issue in
 mtk_drm_gem_prime_vmap()
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20230922-5-10-fix-drm-mediatek-backport-v1-1-912d76cd4a96@kernel.org>
X-B4-Tracking: v=1; b=H4sIAPS3DWUC/x2NzQqDMBAGX0X23C2biIX0VUoPqfnSLuIPG5GC+
 O4GjwPDzE4Fpij0bHYybFp0niq4W0P9L05fsKbK5MW3Erznjp1w1j8nG3lE0rhi4E/sh2W2lQV
 4hNaHjCxUI4uhytfgRd3dCb2P4wS20nRBdgAAAA==
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 Sasha Levin <sashal@kernel.org>
Cc: Chun-Kuang Hu <chunkuang.hu@kernel.org>, 
 Philipp Zabel <p.zabel@pengutronix.de>, linux-mediatek@lists.infradead.org, 
 stable@vger.kernel.org, llvm@lists.linux.dev, 
 Nathan Chancellor <nathan@kernel.org>
X-Mailer: b4 0.13-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=1768; i=nathan@kernel.org;
 h=from:subject:message-id; bh=gcRAnlPPhzGuwjzkrCHq4S2a/cVRkBflII1JB2lJU+0=;
 b=owGbwMvMwCEmm602sfCA1DTG02pJDKm82/9EyCus2b75RPjCBPGJ/svrueTihDxcJvx0WpU4a
 VYr19u/HaUsDGIcDLJiiizVj1WPGxrOOct449QkmDmsTCBDGLg4BWAicx8y/PffKfCR9fm5E4Kb
 dj2Sdj+aFXDxn+RT0U+9t5139ee//3KIkeF48J+1P5WjTmz3DE+VPfz6oly/juoqX4cw9/AI3rk
 J//kA
X-Developer-Key: i=nathan@kernel.org; a=openpgp;
 fpr=2437CB76E544CB6AB3D9DFD399739260CB6CB716
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230922_085127_635660_61C0C05E 
X-CRM114-Status: GOOD (  12.97  )
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
---
This is a fix for a 5.10 backport, so it has no upstream relevance but
I've still cc'd the relevant maintainers in case they have any comments
or want to double check my work.
---
 drivers/gpu/drm/mediatek/mtk_drm_gem.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/mediatek/mtk_drm_gem.c b/drivers/gpu/drm/mediatek/mtk_drm_gem.c
index fe64bf2176f3..b20ea58907c2 100644
--- a/drivers/gpu/drm/mediatek/mtk_drm_gem.c
+++ b/drivers/gpu/drm/mediatek/mtk_drm_gem.c
@@ -252,7 +252,7 @@ void *mtk_drm_gem_prime_vmap(struct drm_gem_object *obj)
 	if (!mtk_gem->kvaddr) {
 		kfree(sgt);
 		kfree(mtk_gem->pages);
-		return -ENOMEM;
+		return NULL;
 	}
 out:
 	kfree(sgt);

---
base-commit: ff0bfa8f23eb4c5a65ee6b0d0b7dc2e3439f1063
change-id: 20230922-5-10-fix-drm-mediatek-backport-0ee69329fef0

Best regards,
-- 
Nathan Chancellor <nathan@kernel.org>


