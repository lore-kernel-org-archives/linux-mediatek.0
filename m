Return-Path: <SRS0=/jeW=BU=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7373FC433E1
	for <linux-mediatek@archiver.kernel.org>; Mon, 10 Aug 2020 19:11:34 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 2BB2122B4B
	for <linux-mediatek@archiver.kernel.org>; Mon, 10 Aug 2020 19:11:34 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="XWoqrtqf";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=kernel.org header.i=@kernel.org header.b="YMscp0VU"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 2BB2122B4B
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-Id:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=ZzKhzJDh/WeW+gBXC+fvW4y3AV5aj1MkwzP8VkjfhuY=; b=XWoqrtqfkkeq0crRVS1t1s1IW
	4aiynFjjhHJGiyJf371VfErEGG3QDkSA/mZwyNTfk9bciRLAR5IX2oWHwfuhY37Nr328vzZjxyukK
	B1Ei3j3ymfpOkOqvVoCw38nLQJZhNW7LaJauHfv3oXgEqdzjHAR46qlk2Dt+k/rPRnsehU5GtRCxu
	EnbOz62O4zxh/Pco4a4pmdJ+rds/9TsaLxMs/XmUmI72YKhaJCq9ltYAxm+f9FwwUPKI9TkM8Z/p9
	WS1OkjquNvXjhby3ARt1lE3VLyRpbaZc+FaF9cgytUKaEw/HX3gkwt0nnsguwnXaYDDOyTJtBpOal
	yLB9HtqdQ==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1k5DCc-0005tv-5P; Mon, 10 Aug 2020 19:11:22 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1k5DCI-0005gI-7f; Mon, 10 Aug 2020 19:11:04 +0000
Received: from sasha-vm.mshome.net (c-73-47-72-35.hsd1.nh.comcast.net
 [73.47.72.35])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 77BF42078D;
 Mon, 10 Aug 2020 19:11:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1597086661;
 bh=x9GG5gygsBiraECBSOqumUJcpCscr6B3l3sBiltVbKI=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=YMscp0VU+h/1Of6GnSav01mq8r3K7Z47w9R4hc+Pee0ay3Q20yth+bAeo4s0cnKGA
 fuyvG9flrdG6CisWRht0GBqOu4iMhpO4ranU+hca7kIVw9UzG+4iaWkjl0D2BQOslm
 HoiSDVcbQ9u1LRKPE3Xy7zaUV3KoIdkN6Co4sy44=
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: [PATCH AUTOSEL 5.7 24/60] usb: mtu3: clear dual mode of u3port when
 disable device
Date: Mon, 10 Aug 2020 15:09:52 -0400
Message-Id: <20200810191028.3793884-24-sashal@kernel.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20200810191028.3793884-1-sashal@kernel.org>
References: <20200810191028.3793884-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200810_151102_663413_465BD357 
X-CRM114-Status: GOOD (  12.87  )
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
Cc: Sasha Levin <sashal@kernel.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, linux-usb@vger.kernel.org,
 linux-mediatek@lists.infradead.org, Chunfeng Yun <chunfeng.yun@mediatek.com>,
 linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

From: Chunfeng Yun <chunfeng.yun@mediatek.com>

[ Upstream commit f1e51e99ed498d4aa9ae5df28e43d558ea627781 ]

If not clear u3port's dual mode when disable device, the IP
will fail to enter sleep mode when suspend.

Signed-off-by: Chunfeng Yun <chunfeng.yun@mediatek.com>
Link: https://lore.kernel.org/r/1595834101-13094-10-git-send-email-chunfeng.yun@mediatek.com
Signed-off-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 drivers/usb/mtu3/mtu3_core.c | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/drivers/usb/mtu3/mtu3_core.c b/drivers/usb/mtu3/mtu3_core.c
index 9dd02160cca97..e3780d4d65149 100644
--- a/drivers/usb/mtu3/mtu3_core.c
+++ b/drivers/usb/mtu3/mtu3_core.c
@@ -131,8 +131,12 @@ static void mtu3_device_disable(struct mtu3 *mtu)
 	mtu3_setbits(ibase, SSUSB_U2_CTRL(0),
 		SSUSB_U2_PORT_DIS | SSUSB_U2_PORT_PDN);
 
-	if (mtu->ssusb->dr_mode == USB_DR_MODE_OTG)
+	if (mtu->ssusb->dr_mode == USB_DR_MODE_OTG) {
 		mtu3_clrbits(ibase, SSUSB_U2_CTRL(0), SSUSB_U2_PORT_OTG_SEL);
+		if (mtu->is_u3_ip)
+			mtu3_clrbits(ibase, SSUSB_U3_CTRL(0),
+				     SSUSB_U3_PORT_DUAL_MODE);
+	}
 
 	mtu3_setbits(ibase, U3D_SSUSB_IP_PW_CTRL2, SSUSB_IP_DEV_PDN);
 }
-- 
2.25.1


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
