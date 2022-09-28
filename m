Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1ADC7C32771
	for <linux-mediatek@archiver.kernel.org>; Wed, 28 Sep 2022 11:06:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:CC:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=MN3nxq5g6hX09F9vsW86ESfKbMSAEPh2i6PCUaRTs6Y=; b=Nk9b0UQ/hUddM8r2ccMfWxdw3L
	TLQmgP9qVjMk5DsmDIMtuMcZnivDM5mWvpQrJnY2+hKstscAYTM2FFiEYLXjFDkZCkzagA7QQMrA0
	WX/MlaM1cJCs9KElnw2yKZEV1g6K/iU0BZ7WEKofb/17E8wIYy3jGWAG7KbTiF6vJNIoSyDuxhp0z
	CdAI/l96jj/2QhQYrQzWnSZ1+l2O9VEY442hIgdHSSePmW0Rxr+LqaW8jpSshnV+lV4vKj4hEHHgz
	rA7A194t16alo9g+LuO0SSTGdbbZGvahBFAbCceaehd3RY7+gRPYetB5L53WghSglqJON486UQCGQ
	h89QwjNQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1odUt4-00FqJz-0W; Wed, 28 Sep 2022 11:05:58 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1odUt0-00FqFy-JX; Wed, 28 Sep 2022 11:05:56 +0000
X-UUID: f363f5560068476d86160f56bf2049ad-20220928
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:CC:To:From; bh=MN3nxq5g6hX09F9vsW86ESfKbMSAEPh2i6PCUaRTs6Y=;
	b=BSxKNic9rFL6Oo2GPBdxe9AWXaK1xiOhgGtQSukrQ9dv8QqGyZtOm1BNi9s84KRPkK5R1Vs1qlcwKIZgvghvJ/CXVbkUzc+XpTTmrX/a7ChK8PKxeT/AP6b7G03SGHG+zoALrO8Bw1T4mrwR/7lxihLrZzJBGLRSeTqPddX42Ac=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.11,REQID:569c8ca4-47ad-42ca-aa81-0811b6791b82,IP:0,U
	RL:0,TC:0,Content:-5,EDM:0,RT:0,SF:95,FILE:0,BULK:0,RULE:Release_Ham,ACTIO
	N:release,TS:90
X-CID-INFO: VERSION:1.1.11,REQID:569c8ca4-47ad-42ca-aa81-0811b6791b82,IP:0,URL
	:0,TC:0,Content:-5,EDM:0,RT:0,SF:95,FILE:0,BULK:0,RULE:Spam_GS981B3D,ACTIO
	N:quarantine,TS:90
X-CID-META: VersionHash:39a5ff1,CLOUDID:1e905ea3-dc04-435c-b19b-71e131a5fc35,B
	ulkID:220928190544LN0EGNU0,BulkQuantity:0,Recheck:0,SF:38|28|17|19|48,TC:n
	il,Content:0,EDM:-3,IP:nil,URL:1,File:nil,Bulk:nil,QS:nil,BEC:nil,COL:0
X-UUID: f363f5560068476d86160f56bf2049ad-20220928
Received: from mtkmbs13n1.mediatek.inc [(172.21.101.193)] by mailgw01.mediatek.com
	(envelope-from <jianhua.lin@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 1189363383; Wed, 28 Sep 2022 04:05:43 -0700
Received: from mtkmbs11n2.mediatek.inc (172.21.101.187) by
 mtkmbs11n2.mediatek.inc (172.21.101.187) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.792.15; Wed, 28 Sep 2022 19:05:38 +0800
Received: from localhost.localdomain (10.17.3.154) by mtkmbs11n2.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.2.792.15 via Frontend
 Transport; Wed, 28 Sep 2022 19:05:37 +0800
From: Jianhua Lin <jianhua.lin@mediatek.com>
To: Hans Verkuil <hverkuil-cisco@xs4all.nl>, Mauro Carvalho Chehab
	<mchehab@kernel.org>, Rob Herring <robh+dt@kernel.org>, Krzysztof Kozlowski
	<krzysztof.kozlowski+dt@linaro.org>, Matthias Brugger
	<matthias.bgg@gmail.com>
CC: <linux-media@vger.kernel.org>, <devicetree@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	<linux-mediatek@lists.infradead.org>,
	<Project_Global_Chrome_Upstream_Group@mediatek.com>, Jianhua Lin
	<jianhua.lin@mediatek.com>
Subject: [PATCH v2, 0/2] Add MT8188 jpeg encoder and decoder compatible
Date: Wed, 28 Sep 2022 19:05:32 +0800
Message-ID: <20220928110534.4756-1-jianhua.lin@mediatek.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220928_040554_650251_B6DBA9D5 
X-CRM114-Status: UNSURE (   8.58  )
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

This series patches dependent on: 
media_stage tree:
https://git.linuxtv.org/media_stage.git/
commit/?id=7ce22e9229f216c638426a854efd5bd127b24

Changes compared with v1:
- rebase v1, no change.
 
Jianhua Lin (2):
  dt-bindings: media: mediatek-jpeg-decoder: Add MT8188 compatible
    string
  dt-bindings: media: mediatek-jpeg-encoder: Add MT8188 compatible
    string

 .../devicetree/bindings/media/mediatek-jpeg-decoder.yaml         | 1 +
 .../devicetree/bindings/media/mediatek-jpeg-encoder.yaml         | 1 +
 2 files changed, 2 insertions(+)

-- 
2.18.0


