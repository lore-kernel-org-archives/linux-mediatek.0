Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 20108CA5FCE
	for <linux-mediatek@archiver.kernel.org>; Mon,  5 Oct 2026 11:26:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=YmAdUzfHpXWCcsCDGufdmZ0OVPyw9FksvaDdRfTvduQ=; b=CYSyR1Meo3Z8PkNLGYorhB/+7s
	+DCP8HaCBCjae01nDWUKoBfU3Cv71ULm3iURaNaQpYhg3juopgHnL2t5kB/Teuqmtw7aCUjtYO1JX
	/GbeviiJixM6aZ3+We5KCK1/fdhFT2uRrcKXyojn9cNT0JzyovUftzl4D4OEN2HKG+SWPVPYL2jgG
	VhJeXkleHYs6iRqWrI9C8iR5GUrL/CMHRu1LbkoTRNFS2ZLZpMjTwjv5OmLYbMbDXL7xTABFMuwWG
	Mu7cUTzGDkKfK5Iw+9orb2qojWNKIgTXDs32PO9hyZkc1qvH81+G8lNH3C0Zw+Q4xlzf94sBtCJ/D
	Gm641BOw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xDgqA-0000000GKJW-05m5;
	Mon, 05 Oct 2026 11:26:42 +0000
Received: from mail-dy1-x1330.google.com ([2607:f8b0:4864:20::1330])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xDgq7-0000000GKIl-3x2n
	for linux-mediatek@lists.infradead.org;
	Mon, 05 Oct 2026 11:26:41 +0000
Received: by mail-dy1-x1330.google.com with SMTP id 5a478bee46e88-351348eb579so255287eec.0
        for <linux-mediatek@lists.infradead.org>; Mon, 05 Oct 2026 04:26:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791199599; x=1791804399; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=YmAdUzfHpXWCcsCDGufdmZ0OVPyw9FksvaDdRfTvduQ=;
        b=Dkj1itVNbH4Yi+aFHQ8uDiV2ibUK1kTzaEp9xpnim26dQp42KhNxdi+v0eGws2YK0u
         OW4Zm5fVZg3ZvJYKvGn13Cu3VHXtosCi6twyg8+7qEeV0wa9XPefkZP353vijQ+Or05N
         WY8wdqKPxTGmx67mRZF+YUoNAuX9s16yV/Ziqj7vVkkhearTPxNGDbKjIOYKwb3mZi/a
         mwL79u+HAJPgDreWnADiKDeRUFTjq6JmCggGhcqSjXhClDmsJNfXQDV1psF3gYToBYPk
         ORn4QmeuW6mkczNblyglukzNy+yg1MHh4Xu1aqQoMOoeqhl2TuiBGztJg3KFz9hJTjhV
         m4qA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791199599; x=1791804399;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=YmAdUzfHpXWCcsCDGufdmZ0OVPyw9FksvaDdRfTvduQ=;
        b=gqyEOg+0Jf7U9OIHz7CDDdkgLMbgHW+qhoQfFhcoCVREXmVS++SFSJwp/J7ds8hvhE
         pFvUkcUZcnbhAi62Bl+8vJBK9SWBfBO+yPODhgiiUOrYqPgnpcegkdCX8TUeAANmul1l
         +eanVayfEAm2ar9ddmuXooTpxt93/CmuOr2znxA611LRbfeJX5+fl4ESAmfKbhhWHuvt
         pId7Ds3vaXn9zrGOBquvj46UUsx4ymTXCC9Fye185KROfxv8Rb+y24s+d5yPB7qj/bz8
         iCsXgJKfUHET92SYasFs9050Tb/UjwMgp/KWNbQffhvta4ExxwpqIaMdBdDRPMLKzTj2
         UUhw==
X-Forwarded-Encrypted: i=1; AKwUvByFee1HfJQRltBBmebxRe/l7ZPk6B/CRtn2CQUsRYOgUdrsXaG/tb7yr7jk2J+6Ku23pBOlXj5BMce+gyAf6w==@lists.infradead.org
X-Gm-Message-State: AFuF++m7X8MJkMlQwHyJtFdK9XCcoPxkiP3RomHFbX2ZTafyz8ynYdol
	Q7a7SBG52J9VQ87exnNh9UFg33gJTjWpBP3HkbKX6tRWv2DzYLRRCR2+
X-Gm-Gg: AYBFou2Cp2TdoXbIDsG53wEVfj5jI+a1IT1JzNYTqLh/KWu3nH6Z5chNDfrT68XEeoH
	qKLrxAfl/Is/nJO99uKyl8gs99w5BfFiZX/6PPX9AvxeP2Gm/lknz2avAtdF5ZLo4o1ylmw1LbL
	2V2a/tgvuG0urLPjh/09D1JjMseBqQ7p41jbZZArJCo6FQueU8oZOQjhNe+fvp+2OLXXtmWC7yY
	kQhIuB8kdWVUgnvAswRmvTuJqd5IxxOhe7wtW9fjNgCmtnOIK+FAxX2up5m8aSthJ+JW7OCb0Q7
	27sdI7zKl6Hn0DIl+8cyYVbqJZ3UPhWE1/7GWxLmjkgxaV6ytG+yDD2gStTk4xeb+ZIk+i+fRQ0
	65vDMPY+bOzoiVuZCiSz2DyyEsAAJ2bXlzn/sea82Q3yvtOT8t4Te16+HS0a90rpYk4bqeJ7jlF
	3WuJZkrqZxV5RBzfRr5BJk+R5DfAOvo1GFvGWZewGXo8tJ/4ZgchcYcKBmpnC/oDWwtRiIwLkgc
	6ICUkgCcyRm4/46
X-Received: by 2002:a05:7301:6195:20b0:33e:61ab:8309 with SMTP id 5a478bee46e88-34db72e503amr14890548eec.23.1791199598602;
        Mon, 05 Oct 2026 04:26:38 -0700 (PDT)
Received: from JMD.localdomain ([220.158.183.16])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-351277a2fb4sm14902080eec.26.2026.10.05.04.26.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 05 Oct 2026 04:26:38 -0700 (PDT)
From: Atul Akella <atul.akella@gmail.com>
To: linux-remoteproc@vger.kernel.org
Cc: Atul Akella <atul.akella@gmail.com>,
	stable@vger.kernel.org,
	Bjorn Andersson <andersson@kernel.org>,
	Mathieu Poirier <mathieu.poirier@linaro.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Pi-Hsun Shih <pihsun@chromium.org>,
	Nicolas Boichat <drinkcat@chromium.org>,
	Erin Lo <erin.lo@mediatek.com>,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org
Subject: [PATCH 1/2] remoteproc: mtk_scp: Fix bounds check in mt8183_scp_da_to_va()
Date: Mon,  5 Oct 2026 11:25:17 +0000
Message-ID: <2e32034b79ea7cad99b7ea9edfb8b2ad64f5096b.1791198233.git.atul.akella@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1791198233.git.atul.akella@gmail.com>
References: <cover.1791198233.git.atul.akella@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261005_042639_981308_E4A48516 
X-CRM114-Status: GOOD (  15.15  )
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

mt8183_scp_da_to_va() translates a device address to a pointer into
SCP SRAM or DRAM. Its bounds check is wrong in two ways:

- offset is an int but is assigned from a u64. For the DRAM window,
  da = dma_addr + 0x100000010 is truncated to offset 0x10 and passes
  the check. There is also no da >= dma_addr check, so a da below
  dma_addr wraps in the u64 subtraction and can truncate to a small
  positive offset.

- (offset + len) is computed in size_t and wraps for a large len.
  With offset = 0x100 and len = (size_t)-0x80, the sum is 0x80 and
  the check passes.

da and len come from the firmware's ELF program headers
(p_paddr/p_memsz) via rproc_da_to_va(), and the returned pointer is
then written to by the ELF loader, so a malformed firmware image can
make the loader write outside the intended region.

Use a u64 offset, check da >= dma_addr before subtracting, and
compare len against the remaining window size instead of adding it
to offset.

Fixes: 63c13d61eafe ("remoteproc/mediatek: add SCP support for mt8183")
Cc: stable@vger.kernel.org
Signed-off-by: Atul Akella <atul.akella@gmail.com>
---
 drivers/remoteproc/mtk_scp.c | 8 +++++---
 1 file changed, 5 insertions(+), 3 deletions(-)

diff --git a/drivers/remoteproc/mtk_scp.c b/drivers/remoteproc/mtk_scp.c
index 9751acc2bf83..d18ae676260a 100644
--- a/drivers/remoteproc/mtk_scp.c
+++ b/drivers/remoteproc/mtk_scp.c
@@ -754,17 +754,19 @@ static int scp_start(struct rproc *rproc)
 
 static void *mt8183_scp_da_to_va(struct mtk_scp *scp, u64 da, size_t len)
 {
-	int offset;
+	u64 offset;
 	const struct mtk_scp_sizes_data *scp_sizes;
 
 	scp_sizes = scp->data->scp_sizes;
 	if (da < scp->sram_size) {
 		offset = da;
-		if (offset >= 0 && (offset + len) <= scp->sram_size)
+		if (len <= scp->sram_size - offset)
 			return (void __force *)scp->sram_base + offset;
 	} else if (scp_sizes->max_dram_size) {
 		offset = da - scp->dma_addr;
-		if (offset >= 0 && (offset + len) <= scp_sizes->max_dram_size)
+		if (da >= scp->dma_addr &&
+		    offset <= scp_sizes->max_dram_size &&
+		    len <= scp_sizes->max_dram_size - offset)
 			return scp->cpu_addr + offset;
 	}
 
-- 
2.43.0


