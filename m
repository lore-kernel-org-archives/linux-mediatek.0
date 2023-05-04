Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9B64EC7EE2D
	for <linux-mediatek@archiver.kernel.org>; Thu,  4 May 2023 19:43:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=DOkiLhv8zpXl6XIbXJ5JvlcWPG0PS//7V1Unk0FAQqU=; b=mCWHeUo1RownH1EqQN86hmOsvY
	eAyWCNlWDaPhAZ253FBP6Ga4LdJH0ZHJ+qC7F/QbjhbpW29mvnLGBXBHQQOmQy37goPU16IboSBnB
	1tY+7m9ScyHSWuUmT+PPam9vZBPqD1bLS7oWDbX8sY1NxaJjFyd3qav+p2pT3dgLyeiQBzL1YQ5CP
	jy7Gf2tTGBIQwg6bxaURdgrdIfOen0VqsbOGMP3o4nwQj9VxBPS/ryX0Ooeu9fEWZZnZ++y4qC8R9
	7wcFY3kNFil08UZF/+EFB08cg7IkbRyqcGzvoDBzaX8EigOEfGUE0M9EIr3yHw6yTwOMXgxAcl+pD
	uio2WMzg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1puere-008pmI-1s;
	Thu, 04 May 2023 19:43:42 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1puerY-008pjW-2l;
	Thu, 04 May 2023 19:43:38 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 5F3C46373B;
	Thu,  4 May 2023 19:43:36 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 118F5C4339B;
	Thu,  4 May 2023 19:43:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1683229416;
	bh=MJS4dzAVZY1D72hkrMes3j6B2EDrslbNlLubS/o/zaQ=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=BLlQjG263BsbE6scllCxPBc+WPhqR6fw9OU5nUVmQH6+tSJLNj+Hnj34dkZjyy+Ag
	 ZDuq2/OTKoFecYEIIuT9fiQjx1wzarJbT4e/FY0J3pUMzQvQseZutHcp/j8haNRkGu
	 xhbH4v/9RhzFSgkf/oprxrZX2wldcDJUY7THDr5fglcicNDBoZ7gYjoB+j1fN1NuTZ
	 WoZizABj6LFktxYIr9N+DvS7MgfBhANGzzBo3kjjkMId+EkJhS6hQVQfijWbXMYD62
	 50hdYhPfHoRMhgsMEPkUsNs3P+F9P5DyQA04stEc3Ya+1TZhnl+VvsXpg6UIrzQbHR
	 JOYW8SibsbRkg==
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Cc: Reese Russell <git@qrsnap.io>,
	Felix Fietkau <nbd@nbd.name>,
	Sasha Levin <sashal@kernel.org>,
	lorenzo@kernel.org,
	ryder.lee@mediatek.com,
	kvalo@kernel.org,
	davem@davemloft.net,
	edumazet@google.com,
	kuba@kernel.org,
	pabeni@redhat.com,
	matthias.bgg@gmail.com,
	sean.wang@mediatek.com,
	deren.wu@mediatek.com,
	sridhar.samudrala@intel.com,
	gch981213@gmail.com,
	greearb@candelatech.com,
	linux-wireless@vger.kernel.org,
	netdev@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org
Subject: [PATCH AUTOSEL 6.3 41/59] wifi: mt76: mt7921: add Netgear AXE3000 (A8000) support
Date: Thu,  4 May 2023 15:41:24 -0400
Message-Id: <20230504194142.3805425-41-sashal@kernel.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230504194142.3805425-1-sashal@kernel.org>
References: <20230504194142.3805425-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230504_124336_935195_C4FECF01 
X-CRM114-Status: GOOD (  12.21  )
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

From: Reese Russell <git@qrsnap.io>

[ Upstream commit 03eb52dd78cab08f13925aeec8315fbdbcba3253 ]

Issue: Though the Netgear AXE3000 (A8000) is based on the mt7921
chipset because of the unique USB VID:PID combination this device
does not initialize/register. Thus making it not plug and play.

Fix: Adds support for the Netgear AXE3000 (A8000) based on the Mediatek
mt7921au chipset. The method of action is adding the USD VID/PID
pair to the mt7921u_device_table[] array.

Notes: A retail sample of the Netgear AXE3000 (A8000) yeilds the following
from lsusb D 0846:9060 NetGear, Inc. Wireless_Device. This pair
0846:9060 VID:PID has been reported by other users on Github.

Signed-off-by: Reese Russell <git@qrsnap.io>
Signed-off-by: Felix Fietkau <nbd@nbd.name>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 drivers/net/wireless/mediatek/mt76/mt7921/usb.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/net/wireless/mediatek/mt76/mt7921/usb.c b/drivers/net/wireless/mediatek/mt76/mt7921/usb.c
index 8fef09ed29c91..a95ec388653c5 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7921/usb.c
+++ b/drivers/net/wireless/mediatek/mt76/mt7921/usb.c
@@ -18,6 +18,9 @@ static const struct usb_device_id mt7921u_device_table[] = {
 	/* Comfast CF-952AX */
 	{ USB_DEVICE_AND_INTERFACE_INFO(0x3574, 0x6211, 0xff, 0xff, 0xff),
 		.driver_info = (kernel_ulong_t)MT7921_FIRMWARE_WM },
+	/* Netgear, Inc. [A8000,AXE3000] */
+	{ USB_DEVICE_AND_INTERFACE_INFO(0x0846, 0x9060, 0xff, 0xff, 0xff),
+		.driver_info = (kernel_ulong_t)MT7921_FIRMWARE_WM },
 	{ },
 };
 
-- 
2.39.2


