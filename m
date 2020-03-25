Return-Path: <SRS0=43xy=5K=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 75F9DC54FD2
	for <linux-mediatek@archiver.kernel.org>; Wed, 25 Mar 2020 02:34:18 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 4A8A820714
	for <linux-mediatek@archiver.kernel.org>; Wed, 25 Mar 2020 02:34:18 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="owDQBpAd";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=flygoat.com header.i=jiaxun.yang@flygoat.com header.b="MGBDxLNR"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 4A8A820714
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=flygoat.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Date:Subject:Message-ID:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=U08Qd7qfHqDhrBv7oSdMVaR5lvNQ2a/Yk0ILyv2Irrg=; b=owDQBpAdze5dqp
	102D5JSgbYy+n1tbBF+mgN0D/J54dymmhxX5G41MEdEUYx4v2GwdAKkNiSzB7iCFgYu/ShHp2MOKZ
	PTIuaFdhcNNcrqO+jpNeDSFxGg644G64WWgcjOtMUSyoHe40qLZEXk7g9Xpy2VUCAB+mwQiQJQJMZ
	b6kdKbXy5uqq2zVxSVZljOEO7SrxZwXFHdXMu2fFQLiv59EYzvKSDreXoJdnIVKTVh5Lf+ThOB5XQ
	TH2EO3P3uZcqk1r+LOYbKllzYbZtBQN3cCTe6Mjp5c8lBtIkVa4r/pzVg8YG7Xja4lzHLRsl4N/cB
	eaXAhUDF9mC4FsHFlM/w==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jGvru-0004jS-1J; Wed, 25 Mar 2020 02:34:10 +0000
Received: from sender3-op-o12.zoho.com.cn ([124.251.121.243])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jGvr6-0003wl-BS; Wed, 25 Mar 2020 02:33:23 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1585103479; 
 s=mail; d=flygoat.com; i=jiaxun.yang@flygoat.com;
 h=From:To:Cc:Message-ID:Subject:Date:In-Reply-To:References:MIME-Version:Content-Transfer-Encoding:Content-Type;
 bh=yyST9a4xds2OxHP7d839ZExH6zCAlPz7AHq/7HnkO+0=;
 b=MGBDxLNRcnw+6qJTvx05eGMOstYRHvSbOhuEdL7taDXptxvfLF8rxsPHnav4P5/Q
 SBBaP5Qom4Rj2JDEN/p7/3X20BPAT9msWTkvCAPl981eGaAwf4QKTXyCMyiHxBw0Znr
 fHKyc1f+uskxwMln9lWHOMzalLTXvL57vAlH9D2s=
Received: from localhost.localdomain (39.155.141.144 [39.155.141.144]) by
 mx.zoho.com.cn with SMTPS id 1585103477959328.4875849949635;
 Wed, 25 Mar 2020 10:31:17 +0800 (CST)
From: Jiaxun Yang <jiaxun.yang@flygoat.com>
To: linux-mips@vger.kernel.org
Message-ID: <20200325022916.106641-3-jiaxun.yang@flygoat.com>
Subject: [PATCH v7 01/12] MIPS: Loongson: Do not initialise statics to 0
Date: Wed, 25 Mar 2020 10:28:18 +0800
X-Mailer: git-send-email 2.26.0.rc2
In-Reply-To: <20200325022916.106641-1-jiaxun.yang@flygoat.com>
References: <20200325022916.106641-1-jiaxun.yang@flygoat.com>
MIME-Version: 1.0
X-ZohoCNMailClient: External
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200324_193321_555058_83CA79C2 
X-CRM114-Status: GOOD (  10.16  )
X-BeenThere: linux-mediatek@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <linux-mediatek.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mediatek>, 
 <mailto:linux-mediatek-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mediatek/>
List-Post: <mailto:linux-mediatek@lists.infradead.org>
List-Help: <mailto:linux-mediatek-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mediatek>, 
 <mailto:linux-mediatek-request@lists.infradead.org?subject=subscribe>
Cc: Mark Rutland <mark.rutland@arm.com>, linux-doc@vger.kernel.org,
 "H. Nikolaus Schaller" <hns@goldelico.com>, John Crispin <john@phrozen.org>,
 Jiaxun Yang <jiaxun.yang@flygoat.com>, Paul Cercueil <paul@crapouillou.net>,
 linux-ide@vger.kernel.org, Miquel Raynal <miquel.raynal@bootlin.com>,
 Mauro Carvalho Chehab <mchehab+samsung@kernel.org>,
 Huacai Chen <chenhc@lemote.com>, Tiezhu Yang <yangtiezhu@loongson.cn>,
 Andi Kleen <ak@linux.intel.com>, Paul Burton <paulburton@kernel.org>,
 Jonathan Corbet <corbet@lwn.net>, Marc Zyngier <maz@kernel.org>,
 Krzysztof Kozlowski <krzk@kernel.org>, Yinglu Yang <yangyinglu@loongson.cn>,
 devicetree@vger.kernel.org, Jean Delvare <jdelvare@suse.com>,
 Jason Cooper <jason@lakedaemon.net>,
 Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>,
 Rob Herring <robh+dt@kernel.org>, linux-mediatek@lists.infradead.org,
 Jonathan Cameron <Jonathan.Cameron@huawei.com>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 Thomas Gleixner <tglx@linutronix.de>,
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
 Allison Randal <allison@lohutok.net>, linux-arm-kernel@lists.infradead.org,
 Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
 Matt Redfearn <matt.redfearn@mips.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, linux-kernel@vger.kernel.org,
 Serge Semin <fancer.lancer@gmail.com>,
 "Eric W. Biederman" <ebiederm@xmission.com>,
 Manuel Lauss <manuel.lauss@gmail.com>, "David S. Miller" <davem@davemloft.net>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

From: Tiezhu Yang <yangtiezhu@loongson.cn>

Fix the following checkpatch error:

ERROR: do not initialise statics to 0
#125: FILE: loongson64/numa.c:125:
+	static unsigned long num_physpages = 0;

Signed-off-by: Tiezhu Yang <yangtiezhu@loongson.cn>
Signed-off-by: Thomas Bogendoerfer <tsbogend@alpha.franken.de>
---
 arch/mips/loongson64/numa.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/mips/loongson64/numa.c b/arch/mips/loongson64/numa.c
index e5b40c5e3296..1ae072df4831 100644
--- a/arch/mips/loongson64/numa.c
+++ b/arch/mips/loongson64/numa.c
@@ -122,7 +122,7 @@ static unsigned long nid_to_addroffset(unsigned int nid)
 static void __init szmem(unsigned int node)
 {
 	u32 i, mem_type;
-	static unsigned long num_physpages = 0;
+	static unsigned long num_physpages;
 	u64 node_id, node_psize, start_pfn, end_pfn, mem_start, mem_size;
 
 	/* Parse memory information and activate */
-- 
2.26.0.rc2



_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
