Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B5E7FC433EF
	for <linux-mediatek@archiver.kernel.org>; Wed, 19 Jan 2022 08:33:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:CC
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=j/CWzrzCbsM6HqPE6KmHCLqO0tCC5ktLiL2/6EeufcQ=; b=a0mv2BJTZ8o1pN
	bD0qxJWtp05GvESlRp3q7rglJcwTcZ9KdjRL3t6mYnM9C0ca0fHE6h/+vNAhJAXC4pTorJPnhVCzW
	79c4H3SCXa5fJf8xJIjYGuci/VNgjn7M1pSVG8U/d4xCu3sffFNZBtXUkIlIzj4Zb4nkuSkKm3oZZ
	CtcFTghw4SvfxGS97mRqT7Wr9x2MoZr53dHHghUvJJmV6+hyHbQEg7I8vCPnotBaz8vsE7CNsOFY2
	e+vs4GNL/xutao35mlFGE8NekIP7qeU0VWh9Cygz0VT7Dohmsa4IKffdzqPr++PYpln1FjKfVi8BC
	O35WfIGkG3sXrAoKTyhg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nA6P4-004Ki9-Qn; Wed, 19 Jan 2022 08:33:14 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nA6P0-004KhQ-LR; Wed, 19 Jan 2022 08:33:13 +0000
X-UUID: a011f2104c6044f08dcf06ec105b0b45-20220119
X-UUID: a011f2104c6044f08dcf06ec105b0b45-20220119
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw02.mediatek.com
 (envelope-from <miles.chen@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 130821519; Wed, 19 Jan 2022 01:33:08 -0700
Received: from mtkmbs07n1.mediatek.inc (172.21.101.16) by
 MTKMBS62N2.mediatek.inc (172.29.193.42) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Wed, 19 Jan 2022 00:24:49 -0800
Received: from mtkcas10.mediatek.inc (172.21.101.39) by
 mtkmbs07n1.mediatek.inc (172.21.101.16) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Wed, 19 Jan 2022 16:24:47 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by mtkcas10.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via
 Frontend Transport; Wed, 19 Jan 2022 16:24:47 +0800
From: <miles.chen@mediatek.com>
To: Herbert Xu <herbert@gondor.apana.org.au>, "David S. Miller"
 <davem@davemloft.net>, Matthias Brugger <matthias.bgg@gmail.com>, "Jason A.
 Donenfeld" <Jason@zx2c4.com>, Greg Kroah-Hartman
 <gregkh@linuxfoundation.org>, Ard Biesheuvel <ardb@kernel.org>
CC: Miles Chen <miles.chen@mediatek.com>, <linux-crypto@vger.kernel.org>,
 <linux-kernel@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
 <linux-mediatek@lists.infradead.org>
Subject: [PATCH] lib/crypto: blake2s: fix a CFI failure
Date: Wed, 19 Jan 2022 16:24:46 +0800
Message-ID: <20220119082447.1675-1-miles.chen@mediatek.com>
X-Mailer: git-send-email 2.18.0
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220119_003310_737417_112C652E 
X-CRM114-Status: GOOD (  14.54  )
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

From: Miles Chen <miles.chen@mediatek.com>

With CONFIG_CFI_CLANG=y, we observe a CFI failure of
blake2s_compress_generic.

Reverting commit 6048fdcc5f26 ("lib/crypto: blake2s: include as built-in")
is a solution for this problem. So I looked into the patch
and I think it is caused by the weak symbols use by blake2s_compress().

To fix it, remove the weak symbol and use CRYPTO_ARCH_HAVE_LIB_BLAKE2S
to select blake2s_compress_arch/blake2s_compress_generic.

log:
[    0.000000][    T0] Kernel panic - not syncing: CFI failure (target: blake2s_compress_generic+0x0/0x1444)
[    0.000000][    T0] CPU: 0 PID: 0 Comm: swapper/0 Not tainted 5.16.0-mainline-06981-g076c855b846e #1
[    0.000000][    T0] Hardware name: MT6873 (DT)
[    0.000000][    T0] Call trace:
[    0.000000][    T0]  dump_backtrace+0xfc/0x1dc
[    0.000000][    T0]  dump_stack_lvl+0xa8/0x11c
[    0.000000][    T0]  panic+0x194/0x464
[    0.000000][    T0]  __cfi_check_fail+0x54/0x58
[    0.000000][    T0]  __cfi_slowpath_diag+0x354/0x4b0
[    0.000000][    T0]  blake2s_update+0x14c/0x178
[    0.000000][    T0]  _extract_entropy+0xf4/0x29c
[    0.000000][    T0]  crng_initialize_primary+0x24/0x94
[    0.000000][    T0]  rand_initialize+0x2c/0x6c
[    0.000000][    T0]  start_kernel+0x2f8/0x65c
[    0.000000][    T0]  __primary_switched+0xc4/0x7be4
[    0.000000][    T0] Rebooting in 5 seconds..

Fixes: 6048fdcc5f26 ("lib/crypto: blake2s: include as built-in")
Signed-off-by: Miles Chen <miles.chen@mediatek.com>
---
 lib/crypto/blake2s-generic.c | 3 +--
 lib/crypto/blake2s.c         | 6 ++++++
 2 files changed, 7 insertions(+), 2 deletions(-)

diff --git a/lib/crypto/blake2s-generic.c b/lib/crypto/blake2s-generic.c
index 75ccb3e633e6..22fa3ea1689e 100644
--- a/lib/crypto/blake2s-generic.c
+++ b/lib/crypto/blake2s-generic.c
@@ -38,8 +38,7 @@ static inline void blake2s_increment_counter(struct blake2s_state *state,
 }
 
 void blake2s_compress(struct blake2s_state *state, const u8 *block,
-		      size_t nblocks, const u32 inc)
-		      __weak __alias(blake2s_compress_generic);
+		      size_t nblocks, const u32 inc);
 
 void blake2s_compress_generic(struct blake2s_state *state, const u8 *block,
 			      size_t nblocks, const u32 inc)
diff --git a/lib/crypto/blake2s.c b/lib/crypto/blake2s.c
index 93f2ae051370..4055aa593ec4 100644
--- a/lib/crypto/blake2s.c
+++ b/lib/crypto/blake2s.c
@@ -16,6 +16,12 @@
 #include <linux/init.h>
 #include <linux/bug.h>
 
+#if IS_ENABLED(CONFIG_CRYPTO_ARCH_HAVE_LIB_BLAKE2S)
+#  define blake2s_compress blake2s_compress_arch
+#else
+#  define blake2s_compress blake2s_compress_generic
+#endif
+
 void blake2s_update(struct blake2s_state *state, const u8 *in, size_t inlen)
 {
 	__blake2s_update(state, in, inlen, blake2s_compress);
-- 
2.18.0


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
