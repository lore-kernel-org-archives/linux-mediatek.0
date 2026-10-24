Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5B32A606A334
	for <linux-mediatek@archiver.kernel.org>; Sat, 24 Oct 2026 15:42:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=Itj55tKS;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=E/A591u/
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=vjEeye3G0zd8caK/nKeFaZ6nAZ8lGBdWDRGnP6Iv4Rk=; b=Itj55tKSkXwKMV
	VnEtQhtwtLlyGZPSlffaRFu8yHOksr7rtUqxH1f1xTGq6wDqNgMt+wRqlYpUmlo5vj2tlchj5oU70
	k6aSwLLTK9Wjom9naMMcbMgxt+DSZFg9kD/KaCIzR97W01Yc9yySt+PXNeSjdLIrn5+KzyVnlTQ6B
	j6SmMwWiqk2hmZFFE+OwY66Hd7+od4LhcH4wm4JYKXeRsaC6bGw/1JhQdUe4VRQCWE8p6zJq6D/oc
	cIhJCbPSylLySVhumXoOZLP5XKxUBIjSnvgFYEKcCJRIninWfS02MqDYFKctpiDU4E/pVjkNmk0ry
	xBSG1MvSh0EWbBcFkW3Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xKdsx-00000000KKG-0KwM;
	Sat, 24 Oct 2026 15:42:19 +0000
Received: from mail-dy1-x1334.google.com ([2607:f8b0:4864:20::1334])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xKdst-00000000KIA-3TpK
	for linux-mediatek@lists.infradead.org;
	Sat, 24 Oct 2026 15:42:17 +0000
Received: by mail-dy1-x1334.google.com with SMTP id 5a478bee46e88-35f1f76ea84so2975719eec.1
        for <linux-mediatek@lists.infradead.org>; Sat, 24 Oct 2026 08:42:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792856535; x=1793461335; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=vjEeye3G0zd8caK/nKeFaZ6nAZ8lGBdWDRGnP6Iv4Rk=;
        b=E/A591u/3S2w7hxg3Xly/PwTlzptePJLVJ6UfOLtMnB/2b/VOlhYpsDKHyAQYJLTnF
         891WA+L7bb7x8vDinw+D9+AJzHKP1DKIs2GS0Jy70hUongEmRVZAhIKmllFYX5YWc7pp
         60HtToBnHuMOQd6I2v6c0DMT40B613TTb+rh7JcK9ZZ9psWUWhlV15M/I8VRL6T+KF8i
         NsNTRHmwfETyKsI226nDOCzfiNTifUd0YZoBc8m7v5/KwLtMYnzfGIHM8sy71URTbmYO
         +ut4eEWQnKJ3p4lRoypRrvAdZkf2rMmOIt1VA2hpRQ1SqDgIyUJfy/fqVJx8R5O2298E
         CBIg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792856535; x=1793461335;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=vjEeye3G0zd8caK/nKeFaZ6nAZ8lGBdWDRGnP6Iv4Rk=;
        b=XEoXT82G/PPknmQT/iY9XAypyqmop3eEJviyCNu07yNdCKB/D28Ns2HJHfQK7+C7sU
         gyofE8ebHD1+MbQyts+mhB/wq7qTIDXVZO8guBL9qYZEJaVX6qeLJPTg5vDdi6qF9OfC
         lsNciwNYAFc83VjTrnh1MIh5p8MyvtKDJ06/3yH4WVKC1BZBBB+N+8T3Ud3CjW9mkNwr
         7tZUJoeXjWDJ5CDfeb4bBS+qy3v7TrmFoc3pdm7qNi6z1LaLXjyf5Tgp59KcL2LHAGyp
         Z/h79KUQmvlGJUG55vpDtdmabSuOeDBWNREfXdOfNohNO9Ca9maXcBuqJT3iSRD1svsN
         YMlA==
X-Forwarded-Encrypted: i=1; AKwUvBzIVU7xSS6vi75+awYtImGncnNNaaDXK6pDjnOk09d5kzsL1mrabGN2q7I5U8sN/bs5iasM6uY5NU3vEsR04w==@lists.infradead.org
X-Gm-Message-State: AFq9FYKHue+0w9Fin2gvm61YJVHR6lxSsO9S3hOkP3uaNx0ELlmdiCuY
	ZOCLWFLS1JoS0+ZArtAOAE9RQ8nMHFfZGq4E4JU+SQ6fGpWMXfoLkD49
X-Gm-Gg: AYBFou0DQa3u7lH84knz+U78GsXLtzq+6IhEmHw464rjv280Dy2T8QOmfNGlEU8UFMP
	OTXVSpn+5Wl5A4Z/tAVnog4jU6xZ9REflCvzTmeRwwhgKqd+BqQeHwNchu9gaXppYfnSl3JKt6d
	imP20Yjg7k8DjgqTPwR4gucjBnPnVmajpQFp1GNnv98NF0KJl7KhEz1hR7W291ZDDgZUXUvME2k
	J+aP4p+SmD3fWmrpvkfwrxNLKsqNGjthz97738UXjrnXUY1FMAWWkQd2BfVGBaNwQk0NMuFQDBI
	4uwR1YdEhVZ/TVJYivGqB5SBKw23TsnPz199A9sflrgTClgde3omU23CmWsLRmD4XMwe2kLH4Jw
	0HePW87beKTY3R4IpmY0FrR8EMgKVtxretue98hKho16m5F0oN9ce2qKSpAunKwxWyfor52frG6
	WhaadOER7TmSe4oRNW0JUdZ+Vjkf9wAfKV0LEi5PMG6i2fN3zaB2vkSoshQP2dFA33nyb3Gz4ir
	3PeROROM3hxEt7qyBOM2r7diX0McA4aw6c4pfotbqStkq6YDhg2Ytnnfg==
X-Received: by 2002:a05:693c:8381:10b0:351:dbc:b663 with SMTP id 5a478bee46e88-369e863b90emr3837046eec.31.1792856534783;
        Sat, 24 Oct 2026 08:42:14 -0700 (PDT)
Received: from plex ([2406:6d00:a27c:4200:aab8:e0ff:fe02:33c1])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-369e8daf444sm7766450eec.18.2026.10.24.08.42.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 24 Oct 2026 08:42:14 -0700 (PDT)
From: Chris Scott <gilroyscott1970@gmail.com>
To: netdev@vger.kernel.org
Cc: lorenzo@kernel.org,
	andrew+netdev@lunn.ch,
	davem@davemloft.net,
	edumazet@kernel.org,
	kuba@kernel.org,
	pabeni@redhat.com,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	matthias.bgg@gmail.com,
	angelogioacchino.delregno@collabora.com,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	pawlik.dan@gmail.com,
	zhengping.zhang@airoha.com,
	Chris Scott <gilroyscott1970@gmail.com>
Subject: [RFC net-next 2/3] net: airoha: npu: attach a coherent pool in the NPU window
Date: Sun, 25 Oct 2026 01:41:49 +1000
Message-ID: <20261024154150.45733-3-gilroyscott1970@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261024154150.45733-1-gilroyscott1970@gmail.com>
References: <20261024154150.45733-1-gilroyscott1970@gmail.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261024_084215_868981_72F2033B 
X-CRM114-Status: GOOD (  15.78  )
X-Spam-Score: -1.9 (-)
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
X-Spam-Status: No, score=-15.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

The EN7581 NPU can only address host DRAM at 0x80000000-0xbfffffff;
higher addresses alias the lower 1 GiB. The coherent buffers allocated
on the NPU device are all shared with the NPU: since mt76 uses the NPU
device as dma_dev, these are the NPU TX/RX descriptor rings, the HW-RRO
ba_bitmap/addr_elem/msdu_pg/session buffers and the NPU TXD buffers.
On a 2 GiB board nothing keeps them below 0xc0000000; they normally
land there only because of early-boot allocation order. With low DRAM
reserved away on W1700K the SoC hangs right after mt7996 firmware load.

If the NPU node has an optional "dma" reserved-memory region, attach it
as the device coherent pool so all of these come from the window. The
next patch moves the mailbox buffers to coherent memory as well.

Unlike a restricted-dma-pool this leaves streaming mappings alone.
Packet buffers are passed through to the WiFi DMA engine: on W1700K
with 96% of TX skbs and ~20% of RX page_pool buffers above 0xc0000000,
host-path traffic and sha256 file round-trips stay intact, at the same
throughput as without a pool, whereas a restricted-dma-pool (swiotlb
bouncing) costs ~22% of host-path TX.

A device coherent pool has no fallback once full; mt76 and the mailbox
use ~10.7 MiB with MT7996, so the DT region should be 16 MiB.

This patch was written with the help of Claude (Anthropic, claude-
opus-5-5).

Link: https://lore.kernel.org/r/atCRsquzA1UxSpCc@mediatek.com
Tested-by: Daniel Pawlik <pawlik.dan@gmail.com>
Signed-off-by: Chris Scott <gilroyscott1970@gmail.com>
---
 drivers/net/ethernet/airoha/airoha_npu.c | 18 ++++++++++++++++++
 1 file changed, 18 insertions(+)

diff --git a/drivers/net/ethernet/airoha/airoha_npu.c b/drivers/net/ethernet/airoha/airoha_npu.c
index 4d3195eb00..069fd60680 100644
--- a/drivers/net/ethernet/airoha/airoha_npu.c
+++ b/drivers/net/ethernet/airoha/airoha_npu.c
@@ -693,6 +693,11 @@ static const struct regmap_config regmap_config = {
 	.disable_locking	= true,
 };
 
+static void airoha_npu_rmem_release(void *data)
+{
+	of_reserved_mem_device_release(data);
+}
+
 static int airoha_npu_probe(struct platform_device *pdev)
 {
 	struct device *dev = &pdev->dev;
@@ -776,6 +781,19 @@ static int airoha_npu_probe(struct platform_device *pdev)
 	if (err)
 		return err;
 
+	if (of_property_match_string(dev->of_node, "memory-region-names",
+				     "dma") >= 0) {
+		err = of_reserved_mem_device_init_by_name(dev, dev->of_node,
+							  "dma");
+		if (err)
+			return err;
+
+		err = devm_add_action_or_reset(dev, airoha_npu_rmem_release,
+					       dev);
+		if (err)
+			return err;
+	}
+
 	err = airoha_npu_run_firmware(dev, base, &res);
 	if (err)
 		return err;
-- 
2.53.0


