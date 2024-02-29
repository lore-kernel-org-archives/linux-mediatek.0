Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 05021C48BF6
	for <linux-mediatek@archiver.kernel.org>; Thu, 29 Feb 2024 19:51:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:Message-Id:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=EqblXngSjSh4FBQAwJUgrqAmv50aiEdXS048OLK4Wco=; b=AskSUAEYCqbyB3bKXOelJcPafH
	gyXPR3TOFjbjbdTbwGhNRNCQwuKrfQhQaBfgfXt7KYFpCKjjPKp6icap8mB8wb+bY9Zh5tj8rQmQI
	TuCwwtQCSUpDfNCHL/LoGHsWkk3TDYG8js713PI8amzzcv5Dk1zYwBHH/RoUkGVv4/myJPZcKNtN4
	3rz2vI/hojaeMoGhOKp6XFWTaiI+pfr8KujTveXOubUjy4oLKj3Wvstf0jofPBJXo+4wOft4co44D
	QnSPYtnJLlHg/A1j28Spakhe23Do2gREDhOq32w60H0SLlIaCwTgkxD05ylD46ACKvy2UvpHGNZh4
	On9ZSAaw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rfmR4-0000000EyMQ-3r9b;
	Thu, 29 Feb 2024 19:51:18 +0000
Received: from madrid.collaboradmins.com ([46.235.227.194])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rfmR1-0000000EyLg-1fd6;
	Thu, 29 Feb 2024 19:51:16 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1709236274;
	bh=bj3pI6xkKLINn85t9EjrFuhDT8EzhA7/C3H9O7fd9gI=;
	h=From:Date:Subject:To:Cc:From;
	b=xsaX8nb5bz0HkDPjdymTlmxtjZ9vQMYIIaJjKCIstMDsbbjVsntTs6aT/xbIUI4JX
	 wD6a6bfD5j//1GtwgA4RwBX4cbezYpcZ/Sa6WZEM33nOH0mf2bthkECr2X7IgzbWP4
	 yWQgTfgTPOfWupXhihDzXVbPSzEkPlKhSMoSNeAHTHAmM6kCv/LDU6MnakaNDweL3V
	 4FQ2yqAOq7blHwJoL5rZD+HSZ9fv3xkkF+XAsAQtmxaIwcrEQwwv+b05XiRpeaU9sd
	 WzCKB/ymX+2zSp+DO34CqRDVIxBz6N5uWNlr2+7+ECbZdqHWXfI/UPjKg0AAxl+PG1
	 yzkygNrQCMTNw==
Received: from [192.168.1.200] (zone.collabora.co.uk [167.235.23.81])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: nfraprado)
	by madrid.collaboradmins.com (Postfix) with ESMTPSA id 5334337820ED;
	Thu, 29 Feb 2024 19:51:12 +0000 (UTC)
From: =?utf-8?q?N=C3=ADcolas_F=2E_R=2E_A=2E_Prado?= <nfraprado@collabora.com>
Date: Thu, 29 Feb 2024 14:51:08 -0500
Subject: [PATCH v2] soc: mediatek: cmdq: Don't log an error when
 gce-client-reg is not found
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20240229-gce-client-reg-log-dbg-v2-1-4975077173d0@collabora.com>
X-B4-Tracking: v=1; b=H4sIACvg4GUC/4WNQQ6CMBBFr0Jm7ZhSFMSV9zAsyjAtk1RKWkI0h
 LtbuYDL95L//gaJo3CCe7FB5FWShCmDPhVAo5kcowyZQSt9UVrX6IiRvPC0YGSHPjgceodXw21
 dNUbdeIA8niNbeR/hZ5d5lLSE+Dl+1vJn/ybXEku0ylrbNlQpah4UvDd9iOZM4QXdvu9frQhqg
 8AAAAA=
To: Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: kernel@collabora.com, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, 
 =?utf-8?q?N=C3=ADcolas_F=2E_R=2E_A=2E_Prado?= <nfraprado@collabora.com>
X-Mailer: b4 0.13.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240229_115115_593270_2F2CBF85 
X-CRM114-Status: GOOD (  12.23  )
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

Most of the callers to this function do not require CMDQ support, it is
optional, so the missing property shouldn't cause an error message.
However, it could result on degraded performance, so the fact that it's
missing should still be alerted. Furthermore, the callers that do
require CMDQ support already log at the error level when an error is
returned.

Change the log message in this helper to be printed at the warning level
instead.

Signed-off-by: Nícolas F. R. A. Prado <nfraprado@collabora.com>
---
Changes in v2:
- Changed from debug to warning level
- Tweaked commit message to mention performance penalty of not having
  GCE
- Link to v1: https://lore.kernel.org/r/20240226-gce-client-reg-log-dbg-v1-1-f0fff97c30c7@collabora.com
---
 drivers/soc/mediatek/mtk-cmdq-helper.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/soc/mediatek/mtk-cmdq-helper.c b/drivers/soc/mediatek/mtk-cmdq-helper.c
index b0cd071c4719..943e9055dd1f 100644
--- a/drivers/soc/mediatek/mtk-cmdq-helper.c
+++ b/drivers/soc/mediatek/mtk-cmdq-helper.c
@@ -55,7 +55,7 @@ int cmdq_dev_get_client_reg(struct device *dev,
 					       "mediatek,gce-client-reg",
 					       3, idx, &spec);
 	if (err < 0) {
-		dev_err(dev,
+		dev_warn(dev,
 			"error %d can't parse gce-client-reg property (%d)",
 			err, idx);
 

---
base-commit: 41913bcddc83b131649ee8ff0d9ff29e01731398
change-id: 20240226-gce-client-reg-log-dbg-5ae9637a08ed

Best regards,
-- 
Nícolas F. R. A. Prado <nfraprado@collabora.com>


