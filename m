Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8D957C4345F
	for <linux-mediatek@archiver.kernel.org>; Fri, 26 Apr 2024 10:30:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=dSGdt/YP0pn5OYZbXUps2DQLIzyfXIN6TaOwb/bKnjo=; b=3EEJUTBuMS3MvaoRAHbD6lUx3g
	umUa5qZfqAj5orxNHEKcum0S5GQMiUjU4HTnLBoehQqqsD/RAEldh9a34xUWG0Wp5Ed39Ppb6A6mQ
	ZsIxvq6INkCVxAqvYN78AQpTR19NOj+qzSOKFM8o/YP+n3fcCTe4nCr2AVNlglcmc3mcs53MWNRba
	Lv9O+xDQvq3gXgCAsS+2QiUWVoaJ1Oelz2LSka0PL+ENzoq0u/NjVlnvK7vs99AoiqCHuTHWyTBgE
	u1MlgDvFUVtN1Gcq7ulEk3X+IM4n0WS9b7w1oBLDc0R4mOoOeT7yhAmidKBJv2iEHhiahzklkQvZK
	JOiR94ZQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s0Iqv-0000000C9Hq-0Wtg;
	Fri, 26 Apr 2024 10:30:49 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s0Iqr-0000000C9Ed-2rp6;
	Fri, 26 Apr 2024 10:30:47 +0000
X-UUID: 02befa7e03b811ef9a78ddf43a9225dc-20240426
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:MIME-Version:Message-ID:Date:Subject:CC:To:From; bh=dSGdt/YP0pn5OYZbXUps2DQLIzyfXIN6TaOwb/bKnjo=;
	b=JfZE6SOCo060us+za4J16bkEJ/BTONjcOm0BdxV25F+hG2anqgm4GMl/SiLYOz6yf0g0AwfpJmglB7aWFiaSOnYmKo6iih0spaxXRNDtNqwel+TY4A72ht0tURHJM27E7zXsUb6OtvM7EAX5SUKPKABgnrB1WNiQcEWd58AmMFc=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.38,REQID:92bedc4d-03f8-4fb9-b362-d741bcf6cedf,IP:0,U
	RL:0,TC:0,Content:-5,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION
	:release,TS:-5
X-CID-META: VersionHash:82c5f88,CLOUDID:bd6b2683-4f93-4875-95e7-8c66ea833d57,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:102,TC:nil,Content:0,EDM:-3,IP:nil,U
	RL:0,File:nil,RT:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0,AV:0,LES:1,
	SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0
X-CID-BVR: 0
X-CID-BAS: 0,_,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-UUID: 02befa7e03b811ef9a78ddf43a9225dc-20240426
Received: from mtkmbs11n1.mediatek.inc [(172.21.101.185)] by mailgw01.mediatek.com
	(envelope-from <zoie.lin@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 1310616328; Fri, 26 Apr 2024 03:30:32 -0700
Received: from mtkmbs13n2.mediatek.inc (172.21.101.108) by
 MTKMBS14N1.mediatek.inc (172.21.101.75) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.26; Fri, 26 Apr 2024 18:30:27 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by
 mtkmbs13n2.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.1118.26 via Frontend Transport; Fri, 26 Apr 2024 18:30:27 +0800
From: zoie.lin <zoie.lin@mediatek.com>
To: Bartosz Golaszewski <brgl@bgdev.pl>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>,
	Arnd Bergmann <arnd@arndb.de>, Greg Kroah-Hartman
	<gregkh@linuxfoundation.org>, Liam Girdwood <lgirdwood@gmail.com>, Mark Brown
	<broonie@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
CC: <linux-i2c@vger.kernel.org>, <devicetree@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	<linux-mediatek@lists.infradead.org>,
	<Project_Global_Chrome_Upstream_Group@mediatek.com>, Zoie Lin
	<zoie.lin@mediatek.com>
Subject: [PATCH 0/3] misc: eeprom: at24: add optional dovdd-supply
Date: Fri, 26 Apr 2024 18:29:46 +0800
Message-ID: <20240426102949.23057-1-zoie.lin@mediatek.com>
X-Mailer: git-send-email 2.18.0
MIME-Version: 1.0
Content-Type: text/plain
X-TM-AS-Product-Ver: SMEX-14.0.0.3152-9.1.1006-23728.005
X-TM-AS-Result: No-10--0.653500-8.000000
X-TMASE-MatchedRID: zPbgMRNMPUIPRVepDWIjxxD3+0w1DhqKesw8RnBRGwqnu6NUK/CwU2b6
	PphVtfZg4wnhOb+JR+SAMuqetGVetoNN9wL55jx9avP8b9lJtWr6C0ePs7A07ba607moR85Rkgq
	5jgyZRjszmwK46+sH2/UDtowQUy5ThuiMkvhUpQKnnGGwTleFAYHxPhxAE7+423fkiP1eoF7QTV
	WQjdvkmFQhow/v76bfSZrfNhP3sgUBh9AgBSEFrJm+YJspVvj2xkvrHlT8euI+kK598Yf3Mg==
X-TM-AS-User-Approved-Sender: No
X-TM-AS-User-Blocked-Sender: No
X-TMASE-Result: 10--0.653500-8.000000
X-TMASE-Version: SMEX-14.0.0.3152-9.1.1006-23728.005
X-TM-SNTS-SMTP: 2D068EC681F9A6DED320B7EA3985D1198E0A78F979A7F01D222C99C83C5170892000:8
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240426_033045_778948_C668DCCA 
X-CRM114-Status: UNSURE (   7.21  )
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

From: Zoie Lin <zoie.lin@mediatek.com>

Based on tag: next-20240426, linux-next/master

v1:
Add support for the dovdd regulator, which supplies an
additional power source to the EEPROM.

Zoie Lin (3):
  misc: eeprom: at24: add optional dovdd-supply
  dt-bindings: eeprom: at24: Add support for at24c64
  dt-bindings: eeprom: at24: Add property dovdd-supply

 .../devicetree/bindings/eeprom/at24.yaml      |  6 +++
 drivers/misc/eeprom/at24.c                    | 37 ++++++++++++++++++-
 2 files changed, 41 insertions(+), 2 deletions(-)

-- 
2.18.0


