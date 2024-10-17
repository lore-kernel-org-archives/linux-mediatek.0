Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AAD2CD2F7DA
	for <linux-mediatek@archiver.kernel.org>; Thu, 17 Oct 2024 03:09:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=rGntS9xOFiEeM/CMGDTBCcX5N9b7TzQhEkYEMSmKp44=; b=tXLdFiXF4S+8vQwbKwdv1JYRQe
	E057DdXnZoVfgokW9Da+LokfTvq3LwcNlxr5vKNhjxiNSlI6xGYIaSTzdWXlohcuGN0dg3qVgn/1n
	701J+hYJ6LMw1WyD2ZIRfl50LYDyK5j6APoQz+5ffCYWLKxK+gATX++oWRJYGxJDaDWan932jaVjT
	MZtDnEqgPqeNkhp6TZFNwDILiKIxE5rWhX/XviP2XLm97GI1GDC7HyOpNeiQsoge4nrHDAm2BFjoE
	c+lBt4XYynFa2XvquHXYgnj0g28qGl9G2gvt6DdWIpZfhFkCko/rzo4aL2KZatABTbvkwG+gS5PV+
	OV+ziJig==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t1Gsy-0000000DcwL-2OJq;
	Thu, 17 Oct 2024 03:09:12 +0000
Received: from smtpbgeu1.qq.com ([52.59.177.22])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t1GrT-0000000Dcnz-41oI;
	Thu, 17 Oct 2024 03:07:44 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=uniontech.com;
	s=onoh2408; t=1729134399;
	bh=rGntS9xOFiEeM/CMGDTBCcX5N9b7TzQhEkYEMSmKp44=;
	h=From:To:Subject:Date:Message-ID:MIME-Version;
	b=XA9R44voNHMqBepq1VReiYD/fB618XAH1SIbthnQc8t4Gmy9XUJlMF2tRqNuG0JH5
	 IIjDN450loyVjC6TcVwtAbqGFYDatH+CfHex2gGxeqEZfQ1uNbSkgkD/tNsEV3Wgvw
	 8f5cFMf8oCVyzMO+8FsYm7R1uywfr2h+jn8Umbc0=
X-QQ-mid: bizesmtpsz14t1729134356tiqk8w
X-QQ-Originating-IP: JzxPHKK/gP3irJfApYxXxk8Z6DxYHx70zkel4N+qhuk=
Received: from localhost.localdomain ( [113.57.152.160])
	by bizesmtp.qq.com (ESMTP) with 
	id ; Thu, 17 Oct 2024 11:05:54 +0800 (CST)
X-QQ-SSF: 0000000000000000000000000000000
X-QQ-GoodBg: 1
X-BIZMAIL-ID: 5622655037225638582
From: WangYuli <wangyuli@uniontech.com>
To: nbd@nbd.name,
	lorenzo@kernel.org,
	ryder.lee@mediatek.com,
	shayne.chen@mediatek.com,
	sean.wang@mediatek.com,
	kvalo@kernel.org,
	matthias.bgg@gmail.com,
	angelogioacchino.delregno@collabora.com
Cc: linux-wireless@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	raoxu@uniontech.com,
	guanwentao@uniontech.com,
	zhanjun@uniontech.com,
	WangYuli <wangyuli@uniontech.com>
Subject: [RESEND. PATCH] mt76: mt76u_vendor_request: Do not print error messages when -EPROTO
Date: Thu, 17 Oct 2024 11:05:50 +0800
Message-ID: <08A72BFE4FA79ABB+20241017030551.85817-1-wangyuli@uniontech.com>
X-Mailer: git-send-email 2.45.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-QQ-SENDSIZE: 520
Feedback-ID: bizesmtpsz:uniontech.com:qybglogicsvrgz:qybglogicsvrgz8a-1
X-QQ-XMAILINFO: MXBlLHWRHBZ3NlBZw6kwLL6jbfJ+c9nSwmtIfnJ+3C2qF4wrb4Nxgg0w
	RzfPkjpccstGCyf555LTAhVNJ3gDIHNVDENlkJ5eoDwkgufGOxCJaIlOSuwZ2azX/pnnucc
	gtV5iQyWgNJAWLyvTmfos9dmsuJ/toW29o9qrkwm66sCB2GMyY/R7KnH/AFKVvUisdw3qev
	HD7j+MowvrHs+vXeqgL3sa4cfUk6Uqpm3uipE5MFgUUmTDvwYvJ0xPu40ooW7KMWIN760zE
	EukoO3jFC+7BC3rMfFumdKt7UhkoRNMCKOaI4mRShiV+ZyaQ7QDgcFQ79YN31slVSeSZxZd
	tVESyjyBbvivb3b6wig6xE3NhjI+GBPk9DhVOVOyZKW7wTIF+uxNJ0xUtgkQthRM2bsQDSG
	a7LHx7C3jnz8QkbXCuXlFVggFK78QdppH7gEFY1u6+Na/3Eczlq04fp13iiXeOVmtao7+01
	iGKy9eoTtP4Mrytu9qifbD4eCHr3fsUVtvFzFcxc7grPIaOAZpocQWc3QdAPfMp73v+m6eJ
	qSb5H99/46Zpd1DJAw5W6NUTT09PNyPpDFRvfKbfPldzG8fbt9HuZcEHpgP4oCcWET5hfUc
	rYbDOaaClIsxL2i/zRT/Uhlj/21Mir8hCXqqQgVkfO7X3kqpM71+uLGbgGkQCy1StY49Mws
	QO1/qRYgVDELpzD1U6a5ooHD9BY5z+fTrVYt6ZRzCdBXg822Omk2ODEzL3cVvr9MESQET/z
	nB7AXp6JffidKiW/5Z+cUS17Fc1MEkt81PNQBjjrx8i5OPy16LrPzazjp/Mhgwn3aFxTVks
	/XF7kIad5m1fQVdxaxDQ+0Z1u6i6qj897FvVrsgbR+s7NgTxM6wyRW/iXmAJc66UZ55gMyh
	+sEGsjxtGzptWmyjlbkMFFkJxzbTf67P5YKkb3ziInrxVohMhrMRFFSxUbN1kVxlBdjsW3r
	E5eh/Pfi1u3LGpNbDA+hSdopn69B0C8dx4GKAvhGZJwAjtJUnKyCRJ0stHKdb0We0zO8=
X-QQ-XMRINFO: NyFYKkN4Ny6FSmKK/uo/jdU=
X-QQ-RECHKSPAM: 0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241016_200740_459480_896267E8 
X-CRM114-Status: UNSURE (   8.22  )
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

When initializing the network card, unplugging the device will
trigger an -EPROTO error, resulting in a flood of error messages
being printed frantically.

Signed-off-by: Xu Rao <raoxu@uniontech.com>
Signed-off-by: WangYuli <wangyuli@uniontech.com>
---
 drivers/net/wireless/mediatek/mt76/usb.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/net/wireless/mediatek/mt76/usb.c b/drivers/net/wireless/mediatek/mt76/usb.c
index 58ff06823389..f9e67b8c3b3c 100644
--- a/drivers/net/wireless/mediatek/mt76/usb.c
+++ b/drivers/net/wireless/mediatek/mt76/usb.c
@@ -33,9 +33,9 @@ int __mt76u_vendor_request(struct mt76_dev *dev, u8 req, u8 req_type,
 
 		ret = usb_control_msg(udev, pipe, req, req_type, val,
 				      offset, buf, len, MT_VEND_REQ_TOUT_MS);
-		if (ret == -ENODEV)
+		if (ret == -ENODEV || ret == -EPROTO)
 			set_bit(MT76_REMOVED, &dev->phy.state);
-		if (ret >= 0 || ret == -ENODEV)
+		if (ret >= 0 || ret == -ENODEV || ret == -EPROTO)
 			return ret;
 		usleep_range(5000, 10000);
 	}
-- 
2.45.2


