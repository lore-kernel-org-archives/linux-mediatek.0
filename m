Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 62DB3C77B7A
	for <linux-mediatek@archiver.kernel.org>; Thu,  1 Jun 2023 15:18:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=om6vVqhUTGRoMD24byuluNyuAPSz+SZ7EzIEE6u+Ouk=; b=OidyUW8VJro9wC1CGzod2xQDsC
	uZ5PR4UhSkLMylAsUjzduWBfdjN8ndYGxQvf9FqHskkulWgQ2PTrlrtAQTS84AkDJsoKIaNJGsAMm
	ot/dySm2mSqZrEdf/L5KwolRmblcApBKhFOs3jIL0ZAlk+HVpSFpsPDnjaW6f81FwFeV02Nrj31PY
	1Hnt5PEgiZKZTcLJ4TB0jJXcYDZRPZVLoaR0sO7/9qBYVUGDTqFgSVvIB6wu73eFAJBGI+j0NhKq9
	aCnTw1xuoC3m+5xgNnuLWfpYMEPxPKngasdDPQRk/u/WJuOi7T75ROlc2csWk705rcU9FR22mowaI
	oGyDT00w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1q4k4j-00405a-0B;
	Thu, 01 Jun 2023 15:18:53 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1q4k4f-00403x-1j;
	Thu, 01 Jun 2023 15:18:51 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 5FC866468C;
	Thu,  1 Jun 2023 15:18:48 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C525FC4339C;
	Thu,  1 Jun 2023 15:18:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1685632727;
	bh=zt7KZMmx/oJBYdfFdtNG8ZQh916ADU8eGaXVMVWxHLE=;
	h=From:To:Cc:Subject:Date:From;
	b=lOsYcDeZ6FDbxshIu7kdv+ump9fNlSvRpNRm6K6kLV3mxZKqoX7/SeZaOn5gv9gYd
	 jUGbk6YWUoRlA6uXYqUPeKRY+B/G7Gtt6DRjGqb/rofNXy1cgD4lv6tend69ihuddC
	 /Xs5cKYacjSj7o/Ch3PcbC+S5wqM/cwEt5cNvibv8wmRxcg74v43euAPEUPlY7fG5a
	 I0xFlAuT7pGfRRlcmRdc3Ln/9JyPCzJ1R8eqd4eYbhqcuvyFxOQPjvsczQhU1vqyNd
	 nWIyEt9HR0ur9SlpXBuqSzw77gRjWK2aT6fdvn0eK1AeOTk3eXPGF0sk7UpCqBMB8s
	 Un4YXvEvE8kcg==
From: Arnd Bergmann <arnd@kernel.org>
To: kasan-dev@googlegroups.com,
	ryabinin.a.a@gmail.com
Cc: glider@google.com,
	andreyknvl@gmail.com,
	dvyukov@google.com,
	vincenzo.frascino@arm.com,
	elver@google.com,
	linux-media@vger.kernel.org,
	linux-crypto@vger.kernel.org,
	herbert@gondor.apana.org.au,
	ardb@kernel.org,
	mchehab@kernel.org,
	Arnd Bergmann <arnd@arndb.de>,
	Dan Carpenter <dan.carpenter@linaro.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Nathan Chancellor <nathan@kernel.org>,
	Nick Desaulniers <ndesaulniers@google.com>,
	Tom Rix <trix@redhat.com>,
	Kees Cook <keescook@chromium.org>,
	Josh Poimboeuf <jpoimboe@kernel.org>,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	llvm@lists.linux.dev
Subject: [PATCH] [RFC] ubsan: disallow bounds checking with gcov on broken gcc
Date: Thu,  1 Jun 2023 17:18:11 +0200
Message-Id: <20230601151832.3632525-1-arnd@kernel.org>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230601_081849_680416_7976BDFC 
X-CRM114-Status: GOOD (  16.30  )
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

From: Arnd Bergmann <arnd@arndb.de>

Combining UBSAN and GCOV in randconfig builds results in a number of
stack frame size warnings, such as:

crypto/twofish_common.c:683:1: error: the frame size of 2040 bytes is larger than 1024 bytes [-Werror=frame-larger-than=]
drivers/media/platform/mediatek/vcodec/vdec/vdec_vp9_req_lat_if.c:1589:1: error: the frame size of 1696 bytes is larger than 1400 bytes [-Werror=frame-larger-than=]
drivers/media/platform/verisilicon/hantro_g2_vp9_dec.c:754:1: error: the frame size of 1260 bytes is larger than 1024 bytes [-Werror=frame-larger-than=]
drivers/staging/media/ipu3/ipu3-css-params.c:1206:1: error: the frame size of 1080 bytes is larger than 1024 bytes [-Werror=frame-larger-than=]
drivers/staging/media/rkvdec/rkvdec-vp9.c:1042:1: error: the frame size of 2176 bytes is larger than 2048 bytes [-Werror=frame-larger-than=]
drivers/staging/media/rkvdec/rkvdec-vp9.c:995:1: error: the frame size of 1656 bytes is larger than 1024 bytes [-Werror=frame-larger-than=]

I managed to track this down to the -fsanitize=bounds option clashing
with the -fprofile-arcs option, which leads a lot of spilled temporary
variables in generated instrumentation code.

Hopefully this can be addressed in future gcc releases the same way
that clang handles the combination, but for existing compiler releases,
it seems best to disable one of the two flags. This can be done either
globally by just not passing both at the same time, or locally using
the no_sanitize or no_instrument_function attributes in the affected
functions.

Try the simplest approach here, and turn off -fsanitize=bounds on
gcc when GCOV is enabled, leaving the rest of UBSAN working. Doing
this globally also helps avoid inefficient code from the same
problem that did not push the build over the warning limit.

Reported-by: Dan Carpenter <dan.carpenter@linaro.org>
Link: https://lore.kernel.org/stable/6b1a0ee6-c78b-4873-bfd5-89798fce9899@kili.mountain/
Link: https://gcc.gnu.org/bugzilla/show_bug.cgi?id=110074
Link: https://godbolt.org/z/zvf7YqK5K
Signed-off-by: Arnd Bergmann <arnd@arndb.de>
---
 lib/Kconfig.ubsan | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/lib/Kconfig.ubsan b/lib/Kconfig.ubsan
index f7cbbad2bb2f4..8f71ff8f27576 100644
--- a/lib/Kconfig.ubsan
+++ b/lib/Kconfig.ubsan
@@ -29,6 +29,8 @@ config UBSAN_TRAP
 
 config CC_HAS_UBSAN_BOUNDS_STRICT
 	def_bool $(cc-option,-fsanitize=bounds-strict)
+	# work around https://gcc.gnu.org/bugzilla/show_bug.cgi?id=110074
+	depends on GCC_VERSION > 140000 || !GCOV_PROFILE_ALL
 	help
 	  The -fsanitize=bounds-strict option is only available on GCC,
 	  but uses the more strict handling of arrays that includes knowledge
-- 
2.39.2


