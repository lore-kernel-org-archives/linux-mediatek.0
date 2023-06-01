Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2412DC77B7A
	for <linux-mediatek@archiver.kernel.org>; Thu,  1 Jun 2023 07:34:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=VxYRFWIiNkIiVzU0sYK4wyw0WuGk1tNLQAJN5o20Yfk=; b=ae4hl2c53kGUOG2EMO+pyuMCVP
	YUY0SFUzIDnNuQxcwRmjynnZqY1h4PuDk3J8yTS7FaSxzvtfzt3TDzn0nHlymcZq+BA7rKhSx9Fh0
	SAFMF32PSL+/k2bXWxW2gzI2cHr9xY5FydXxpbBl1tmDVTi039G+6dQInC92PBjadgP01D7KPqzlR
	L49F8KvZu+S4iESpP53u8VnKEcP2WH5fypgRvLH3ae2PNJNM3xSN1p11nfEyd2eI9RoBtP2ckw8DW
	suqgL/8tq2jXFjyeBliDoRJlrTf/3cEHUmyYjFDHFlXMAsE8LgzcEcAsUUqRt00+1P95SDYnEh+N8
	+lakwkzQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1q4cp3-002NYa-2S;
	Thu, 01 Jun 2023 07:34:13 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1q4cou-002NWE-04
	for linux-mediatek@lists.infradead.org;
	Thu, 01 Jun 2023 07:34:11 +0000
X-UUID: ab4bc1a4004e11ee83ed1395ce914268-20230601
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:MIME-Version:Message-ID:Date:Subject:CC:To:From; bh=VxYRFWIiNkIiVzU0sYK4wyw0WuGk1tNLQAJN5o20Yfk=;
	b=G2nFB2+uP419TorEzJbdSvaMt2Z+L6k5xPtNg6LHnRtq6yGoRRpG+dEwS9FaaknTYj9Sr0fVAn+4fj1iYoGnzm61OB4LLEAtNDnSZucuSmc5T/ZXUv9y1wJ7GQzDPvKO55WDs9piWkg8NnQvtU7pQhXrdBR04/9jC0gc9cOfnIk=;
X-CID-UNFAMILIAR: 1
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.25,REQID:9a9cebba-5c40-4713-bc28-85e1a52948c0,IP:0,U
	RL:0,TC:0,Content:0,EDM:0,RT:0,SF:100,FILE:0,BULK:0,RULE:Release_Ham,ACTIO
	N:release,TS:100
X-CID-INFO: VERSION:1.1.25,REQID:9a9cebba-5c40-4713-bc28-85e1a52948c0,IP:0,URL
	:0,TC:0,Content:0,EDM:0,RT:0,SF:100,FILE:0,BULK:0,RULE:Spam_GS981B3D,ACTIO
	N:quarantine,TS:100
X-CID-META: VersionHash:d5b0ae3,CLOUDID:49603c3d-7aa7-41f3-a6bd-0433bee822f3,B
	ulkID:23060115332838CVQQ6Y,BulkQuantity:1,Recheck:0,SF:38|29|28|16|19|48,T
	C:nil,Content:0,EDM:-3,IP:nil,URL:11|1,File:nil,Bulk:40,QS:nil,BEC:nil,COL
	:0,OSI:0,OSA:0,AV:0
X-CID-BVR: 0
X-CID-BAS: 0,_,0,_
X-UUID: ab4bc1a4004e11ee83ed1395ce914268-20230601
Received: from mtkmbs13n1.mediatek.inc [(172.21.101.193)] by mailgw02.mediatek.com
	(envelope-from <chris.lu@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 169073759; Thu, 01 Jun 2023 00:33:57 -0700
Received: from mtkmbs13n2.mediatek.inc (172.21.101.194) by
 mtkmbs10n1.mediatek.inc (172.21.101.34) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.26; Thu, 1 Jun 2023 15:33:24 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by
 mtkmbs13n2.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.1118.26 via Frontend Transport; Thu, 1 Jun 2023 15:33:24 +0800
From: Chris Lu <chris.lu@mediatek.com>
To: Josh Boyer <jwboyer@kernel.org>, David Woodhouse <dwmw2@infradead.org>,
	Ben Hutchings <ben@decadent.org.uk>, Marcel Holtmann <marcel@holtmann.org>,
	Johan Hedberg <johan.hedberg@gmail.com>
CC: Sean Wang <sean.wang@mediatek.com>, Deren Wu <deren.Wu@mediatek.com>,
	Aaron Hou <aaron.hou@mediatek.com>, KM Lin <km.lin@mediatek.com>, Robin Chiu
	<robin.chiu@mediatek.com>, Steve Lee <steve.lee@mediatek.com>,
	linux-bluetooth <linux-bluetooth@vger.kernel.org>, linux-firmware
	<linux-firmware@kernel.org>, linux-kernel <linux-kernel@vger.kernel.org>,
	linux-mediatek <linux-mediatek@lists.infradead.org>, Chris.Lu
	<chris.lu@mediatek.com>
Subject: [PATCH 1/1] linux-firmware: update firmware for mediatek bluetooth chip (MT7921)
Date: Thu, 1 Jun 2023 15:33:14 +0800
Message-ID: <20230601073315.22308-1-chris.lu@mediatek.com>
X-Mailer: git-send-email 2.18.0
MIME-Version: 1.0
Content-Type: text/plain
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230601_003404_067073_9B9C6541 
X-CRM114-Status: UNSURE (   7.17  )
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

From: "Chris.Lu" <chris.lu@mediatek.com>

Update binary firmware for MT7921 BT devices.

File: mediatek/BT_RAM_CODE_MT7961_1_2_hdr.bin
Version: 20230526131214

Signed-off-by: Chris.Lu <chris.lu@mediatek.com>

Chris.Lu (1):
  linux-firmware: update firmware for mediatek bluetooth chip (MT7921)

 WHENCE                                  |   2 +-
 mediatek/BT_RAM_CODE_MT7961_1_2_hdr.bin | Bin 532590 -> 532846 bytes
 2 files changed, 1 insertion(+), 1 deletion(-)

-- 
2.18.0


