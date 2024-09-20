Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 33B58C78849
	for <linux-mediatek@archiver.kernel.org>; Fri, 20 Sep 2024 13:43:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:CC:To:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=NhoCCaFffSxTrq/SCjrYPSay+Ic98uE1jW+vIVZg6oI=; b=zqE9s9c9T9ZexleSfSlryjdfX4
	wE00j3jv/WqUnv5GW1LfzYrEEnrS0eGtnzflQIXxRWnbEZw2mPb2UfSp3ZtQJ77h2bTGZE7o2klFW
	BTSTc5CPfXhpGqj5daa+LjCPPBEJ7nWVkQKangUEr7zNRUKPHigM035n3tx4h/MPDUlCkdLSY+jvP
	3SCb82HoqBkKpyiRWbisbUDFiqde2SEhVlA2JDQ0daciFus0Xsg4jkGMzVTKM4vTTmgopobZq2mSg
	flTERhAUavj2gXRuJGgIRFIsYzFlwyzEm+bC12Bw2+8epGAM5/sntNV2LmTSZq/nZusajj7I/Zom2
	1vo89uRw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1srdv1-0000000CHw9-3lYk;
	Fri, 20 Sep 2024 13:43:31 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1srdtx-0000000CHgp-1wtL;
	Fri, 20 Sep 2024 13:42:26 +0000
X-UUID: 2a50e0d6775611efba0aef63c0775dbf-20240920
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From; bh=NhoCCaFffSxTrq/SCjrYPSay+Ic98uE1jW+vIVZg6oI=;
	b=Nc/S41um9pR5RLvq8p44GuOxvaRmww6aiUGGW2Tx2vCJDnXEQhnXciFq7oou4x6bpZ4TNI5QsHlsNroCm8lA/Vyl2FP76TdXtt7JRv5KhxUJtLT8waV3XqjdrbrWzCsV5tFQHaFOJ/TaN7Jfk0I4uMqtCX3cYQIlCod4yQVukZ8=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.41,REQID:4bed9eeb-dba6-4e2c-852e-77d3d90e1de6,IP:0,U
	RL:0,TC:0,Content:-25,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTIO
	N:release,TS:-25
X-CID-META: VersionHash:6dc6a47,CLOUDID:c1be82d0-7921-4900-88a1-3aef019a55ce,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:102,TC:nil,Content:0,EDM:-3,IP:nil,U
	RL:0,File:nil,RT:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0,AV:0,LES:1,
	SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 0,NGT
X-CID-BAS: 0,NGT,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-UUID: 2a50e0d6775611efba0aef63c0775dbf-20240920
Received: from mtkmbs09n2.mediatek.inc [(172.21.101.94)] by mailgw02.mediatek.com
	(envelope-from <pablo.sun@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 945047801; Fri, 20 Sep 2024 06:42:23 -0700
Received: from mtkmbs11n2.mediatek.inc (172.21.101.187) by
 MTKMBS14N1.mediatek.inc (172.21.101.75) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.26; Fri, 20 Sep 2024 21:42:21 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by
 mtkmbs11n2.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.1118.26 via Frontend Transport; Fri, 20 Sep 2024 21:42:21 +0800
From: Pablo Sun <pablo.sun@mediatek.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Matthias Brugger
	<matthias.bgg@gmail.com>, AngeloGioacchino Del Regno
	<angelogioacchino.delregno@collabora.com>, Michael Turquette
	<mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, "Srinivas
 Kandagatla" <srinivas.kandagatla@linaro.org>
CC: <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
	<linux-arm-kernel@lists.infradead.org>, <linux-mediatek@lists.infradead.org>,
	<linux-clk@vger.kernel.org>, Pablo Sun <pablo.sun@mediatek.com>
Subject: [PATCH 2/5] clk: mediatek: clk-mt8188-topckgen: Remove univpll from parents of mfg_core_tmp
Date: Fri, 20 Sep 2024 21:41:08 +0800
Message-ID: <20240920134111.19744-3-pablo.sun@mediatek.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <20240920134111.19744-1-pablo.sun@mediatek.com>
References: <20240920134111.19744-1-pablo.sun@mediatek.com>
MIME-Version: 1.0
Content-Type: text/plain
X-TM-AS-Product-Ver: SMEX-14.0.0.3152-9.1.1006-23728.005
X-TM-AS-Result: No-10--3.220100-8.000000
X-TMASE-MatchedRID: 6mUaupESUicX/DgtOsKbJEKcYi5Qw/RVYU4M4UEhdYoOUs4CTUgKy6dy
	K1rXVA/F9tuSNsrGP8feAMGbXnKiN7UN8Yzp1vtfA9lly13c/gHt/okBLaEo+IWXGHd13QwAo8W
	MkQWv6iXBcIE78YqRWo6HM5rqDwqt4XgtCAUmrqUKYfTzGGy8aC9j0U24TSafOrFVoj5IqtJ8dr
	/u/DLEnwHOhuuQEdvLcdzPe3Qcn3bSiULcJKjUyoEDzLGQCF4vwZBgUyJVEbl6Fw8/PpTMRaVvm
	iAyeA2kc5MSfkiJFI5QBJtcKcOYfpRMZUCEHkRt
X-TM-AS-User-Approved-Sender: No
X-TM-AS-User-Blocked-Sender: No
X-TMASE-Result: 10--3.220100-8.000000
X-TMASE-Version: SMEX-14.0.0.3152-9.1.1006-23728.005
X-TM-SNTS-SMTP: E9E4C39A28787342393ECA9258E7290EA1B256B30B3614CD06F8F7BD2D4C723A2000:8
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240920_064225_535141_43413B01 
X-CRM114-Status: GOOD (  12.57  )
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

Same as MT8195, MT8188 GPU clock is primarly supplied by the dedicated
mfgpll. The clock "mfg_core_tmp" is only used as an alt clock when
setting mfgpll clock rate.

If we keep the univpll parents from mfg_core_tmp, when setting
GPU frequency to 390000000, the common clock framework would switch
the parent to univpll, instead of setting mfgpll to 390000000:

    mfgpll                            0        0        0   949999756
    univpll                           2        2        0  2340000000
       univpll_d6                     1        1        0   390000000
          top_mfg_core_tmp            1        1        0   390000000
             mfg_ck_fast_ref          1        1        0   390000000
                mfgcfg_bg3d           1        1        0   390000000

This results in failures when subsequent devfreq operations need to
switch to other frequencies. So remove univpll from the parent list.

This solution is taken from commit 72d38ed720e9 ("clk: mediatek:
clk-mt8195-topckgen: Drop univplls from mfg mux parents")

Signed-off-by: Pablo Sun <pablo.sun@mediatek.com>
---
 drivers/clk/mediatek/clk-mt8188-topckgen.c | 7 +++++--
 1 file changed, 5 insertions(+), 2 deletions(-)

diff --git a/drivers/clk/mediatek/clk-mt8188-topckgen.c b/drivers/clk/mediatek/clk-mt8188-topckgen.c
index 2ccc8a1c98f9..74ee692ac613 100644
--- a/drivers/clk/mediatek/clk-mt8188-topckgen.c
+++ b/drivers/clk/mediatek/clk-mt8188-topckgen.c
@@ -342,11 +342,14 @@ static const char * const dsp7_parents[] = {
 	"univpll_d3"
 };
 
+/*
+ * MFG can be also parented to "univpll_d6" and "univpll_d7":
+ * these have been removed from the parents list to let us
+ * achieve GPU DVFS without any special clock handlers.
+ */
 static const char * const mfg_core_tmp_parents[] = {
 	"clk26m",
 	"mainpll_d5_d2",
-	"univpll_d6",
-	"univpll_d7"
 };
 
 static const char * const camtg_parents[] = {
-- 
2.45.2


