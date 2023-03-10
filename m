Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0564CC6FA99
	for <linux-mediatek@archiver.kernel.org>; Fri, 10 Mar 2023 05:18:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=cmJriFkOpKZoYnGPOl4SvxxCHjZCGjG91SGvDFXeoKU=; b=TOcvng1gaj/ZmTdRX9m8y7Aybk
	xQh8fGjA73wg/6fhLkQfFqQn21LDn+C8RrB2hQjmzZaemnSMrNTsmDgLgiSj7sVKEyWtYmx3lPz5d
	TvpeQAJcn89zQiJW58vZqQDmxiZAxFpeDjn8xeF0chSgJMFw13F+rfUrE0pDz47mX3qf8zf7e/AGF
	h99zuYgFHFxy9m0M1t+1WbUtuvsanND4HmUWfhTMX3t7BqeF6P34iCUuxO6saZ/DU2Zo+eoRGzG1w
	KxN3WGQwHjDVpANUxv9YJw8UxVve1tqdWCiuzut0kHcCYjj9qKTK7iw8VSgOEyuuE/jjUIzJIpVsl
	9X2PQb/A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1paV8t-00D5fb-Aq; Fri, 10 Mar 2023 05:18:11 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1paV8p-00D5ed-Eg; Fri, 10 Mar 2023 05:18:08 +0000
X-UUID: ee377c02bf0211ed8a441d988bb316ae-20230309
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:MIME-Version:Message-ID:Date:Subject:CC:To:From; bh=cmJriFkOpKZoYnGPOl4SvxxCHjZCGjG91SGvDFXeoKU=;
	b=a5ocF37LHhdkvlYvq/KSK7L2nC4cJrw8wqZLGKNFnmAnmv5ihvGgpVIQjnL+0jDdiVXaGe8epb4Qo3/qqc+6PMwspmyzws/dGjP2zW5nudZtzJ84pXMSbrsVGRmN8X0zk74N/y+jxLtFdfcmiD4nHbqN1KkjEpt1IbMw1CAC/ZY=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.20,REQID:9db0609c-f5e0-4174-af9a-ac1e1c815a7c,IP:0,U
	RL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
	release,TS:0
X-CID-META: VersionHash:25b5999,CLOUDID:7b4cef27-564d-42d9-9875-7c868ee415ec,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:102,TC:nil,Content:0,EDM:-3,IP:nil,U
	RL:0,File:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0,AV:0
X-CID-BVR: 0,NGT
X-UUID: ee377c02bf0211ed8a441d988bb316ae-20230309
Received: from mtkmbs13n2.mediatek.inc [(172.21.101.108)] by mailgw01.mediatek.com
	(envelope-from <jia-wei.chang@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 870466266; Thu, 09 Mar 2023 22:18:02 -0700
Received: from mtkmbs13n2.mediatek.inc (172.21.101.108) by
 mtkmbs11n2.mediatek.inc (172.21.101.187) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.25; Fri, 10 Mar 2023 13:17:52 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by
 mtkmbs13n2.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.1118.25 via Frontend Transport; Fri, 10 Mar 2023 13:17:52 +0800
From: jia-wei.chang <jia-wei.chang@mediatek.com>
To: "Rafael J . Wysocki" <rafael@kernel.org>, Viresh Kumar
	<viresh.kumar@linaro.org>, Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, Kevin
 Hilman <khilman@baylibre.com>, Rex-BC Chen <rex-bc.chen@mediatek.com>,
	Jia-Wei Chang <jia-wei.chang@mediatek.com>
CC: <linux-arm-kernel@lists.infradead.org>,
	<linux-mediatek@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
	<Project_Global_Chrome_Upstream_Group@mediatek.com>, <hsinyi@google.com>,
	Nick <vincent@systemli.org>, Dan Carpenter <error27@gmail.com>
Subject: [PATCH v1 0/3] Enhance mediatek-cpufreq robustness
Date: Fri, 10 Mar 2023 13:17:47 +0800
Message-ID: <20230310051750.4745-1-jia-wei.chang@mediatek.com>
X-Mailer: git-send-email 2.18.0
MIME-Version: 1.0
Content-Type: text/plain
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230309_211807_654761_161E827E 
X-CRM114-Status: UNSURE (   5.72  )
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

From: "Jia-Wei Chang" <jia-wei.chang@mediatek.com>

MediaTek cpufreq driver has some reported problems required to be fixed.

Tested on:
MT8186 Platform (kernel v5.15)

jia-wei.chang (3):
  cpufreq: mediatek: fix passing zero to 'PTR_ERR'
  cpufreq: mediatek: fix KP caused by handler usage after
    regulator_put/clk_put
  cpufreq: mediatek: raise proc/sram max voltage for MT7622 and MT8516

 drivers/cpufreq/mediatek-cpufreq.c | 64 ++++++++++++++++++++++--------
 1 file changed, 47 insertions(+), 17 deletions(-)

-- 
2.18.0


