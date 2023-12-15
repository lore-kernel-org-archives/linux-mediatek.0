Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B4022C4167B
	for <linux-mediatek@archiver.kernel.org>; Fri, 15 Dec 2023 08:51:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=DOL3MAEWpk4auwrZ/0QVpsKL7LKneCSNGLT6LUjYF8A=; b=meRqM8bqXTuu1XKCLVZpdW391X
	q/de+3hoIpH584pryqvvZy4jVJbaz9VYRD7+7Woe0M6WE1jiypS0L2SNyRkq6TzVcftVpfh2E5SWF
	7VBr9YYYZ/ZlzKEfP8uhBAJxlagyhrWYpWAmeTqSnSnpUHO3Z34xIUm17qTc/fzJgx1Ltp/rEBDCn
	XnywKcCXPZeme+VNPT51fMrXHdPSndpCX/ULNeHDK1cMaNE9ofldIeLJ3AiUUFCvIWeFYXakaiAFi
	PidE+C7NDhMvthF+Sv1RbUBp1BmBONzFi9D3zp+x2jgQ2aLM6ghSBzeohquscnRNLGquaj+M4gkSb
	D3Q91yCQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rE3ue-002Wuw-2T;
	Fri, 15 Dec 2023 08:51:16 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rE3ub-002Wtb-0S;
	Fri, 15 Dec 2023 08:51:14 +0000
X-UUID: 162346509b2711ee9b09ad09c76753c8-20231215
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:MIME-Version:Message-ID:Date:Subject:CC:To:From; bh=DOL3MAEWpk4auwrZ/0QVpsKL7LKneCSNGLT6LUjYF8A=;
	b=dHPBjDKgrXByGafMRoSskvy2iQJ13cTeOFlQR7q4pU+juK9dZQE5TXXPPZ4WDU8J8f65k17UoA82gJED+YWA2QkAbcXFp53kEQF8J2wym+Yg9GSbUVdaopwo46VrMcYB7zL6+033t+JvB/4Nla+976hAftbQboTYJSJOyuDySlo=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.35,REQID:f4889fa7-c45d-4183-b2af-b788d6a7da0a,IP:0,U
	RL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
	release,TS:0
X-CID-META: VersionHash:5d391d7,CLOUDID:c06bb5fd-4a48-46e2-b946-12f04f20af8c,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:102,TC:nil,Content:0,EDM:-3,IP:nil,U
	RL:0,File:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0,AV:0,LES:1,SPR:NO,
	DKR:0,DKP:0,BRR:0,BRE:0
X-CID-BVR: 0,NGT
X-CID-BAS: 0,NGT,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-UUID: 162346509b2711ee9b09ad09c76753c8-20231215
Received: from mtkmbs11n2.mediatek.inc [(172.21.101.187)] by mailgw01.mediatek.com
	(envelope-from <jason-jh.lin@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 1073056159; Fri, 15 Dec 2023 01:51:07 -0700
Received: from mtkmbs13n2.mediatek.inc (172.21.101.108) by
 mtkmbs10n2.mediatek.inc (172.21.101.183) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.26; Fri, 15 Dec 2023 16:51:03 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by
 mtkmbs13n2.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.1118.26 via Frontend Transport; Fri, 15 Dec 2023 16:51:03 +0800
From: Jason-JH.Lin <jason-jh.lin@mediatek.com>
To: Jassi Brar <jassisinghbrar@gmail.com>, Chun-Kuang Hu
	<chunkuang.hu@kernel.org>, AngeloGioacchino Del Regno
	<angelogioacchino.delregno@collabora.com>
CC: Matthias Brugger <matthias.bgg@gmail.com>, <linux-kernel@vger.kernel.org>,
	<linux-arm-kernel@lists.infradead.org>, <linux-mediatek@lists.infradead.org>,
	<Project_Global_Chrome_Upstream_Group@mediatek.com>, Jeffrey Kardatzke
	<jkardatzke@google.com>, Jason-ch Chen <jason-ch.chen@mediatek.com>, "Johnson
 Wang" <johnson.wang@mediatek.com>, "Jason-JH . Lin"
	<jason-jh.lin@mediatek.com>, Singo Chang <singo.chang@mediatek.com>, "Nancy
 Lin" <nancy.lin@mediatek.com>, Shawn Sung <shawn.sung@mediatek.com>,
	"Jason-jh Lin" <jason-jh.lin@mediatek.corp-partner.google.com>
Subject: [PATCH v2 0/3] Add CMDQ driver support for mt8188
Date: Fri, 15 Dec 2023 15:00:23 +0800
Message-ID: <20231215070026.2507-1-jason-jh.lin@mediatek.com>
X-Mailer: git-send-email 2.18.0
MIME-Version: 1.0
Content-Type: text/plain
X-TM-AS-Product-Ver: SMEX-14.0.0.3152-9.1.1006-23728.005
X-TM-AS-Result: No-10--2.689500-8.000000
X-TMASE-MatchedRID: REQh4LCxv5Ab+BGg6rnrdlz+axQLnAVBfLPKYyLDlAcH8UzOewTxw4HP
	3u3XDM5D4vM1YF6AJbZhyT3WNjppUtAtbEEX0MxBxEHRux+uk8jfhP1xgyx3DIPPQq+LR9HCWW1
	s94V1YY4IIMzOvFTgJ534wuSfusGeD8/Mp+zrIDxdsm03R8LRuBwOHg/YG1GNCRijtNma6heKIY
	1utScIUo6H7DI0GsVcMmI24qiENwrMpIbcl3IoA+q1XYAYw09qIdY9jOi4lTI=
X-TM-AS-User-Approved-Sender: No
X-TM-AS-User-Blocked-Sender: No
X-TMASE-Result: 10--2.689500-8.000000
X-TMASE-Version: SMEX-14.0.0.3152-9.1.1006-23728.005
X-TM-SNTS-SMTP: E8E29A6DB722F00B81D96420E5F5E3A2510A85ADCBD8D6300001CA5154F675FA2000:8
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231215_005113_183520_C81A66F6 
X-CRM114-Status: UNSURE (   8.01  )
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

From: Jason-jh Lin <jason-jh.lin@mediatek.corp-partner.google.com>

Since mt8188 has 32 GCE HW thread, we nedd a new platform data to
support it.

So we sort the platform data in numerical order of compatible names and
add a new mt8188 platform data.

Change in v2:
Add a ptach to rename gce_plat variable postfix from 'v1~v7' to SoC names.

Jason-JH.Lin (3):
  mailbox: mtk-cmdq: Rename gce_plat variable with SoC name postfix
  mailbox: mtk-cmdq: Sort cmdq platform data by compatible name
  mailbox: mtk-cmdq: Add CMDQ driver support for mt8188

 drivers/mailbox/mtk-cmdq-mailbox.c | 44 ++++++++++++++++++------------
 1 file changed, 26 insertions(+), 18 deletions(-)

-- 
2.18.0


