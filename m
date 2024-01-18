Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 70F89C47DAF
	for <linux-mediatek@archiver.kernel.org>; Thu, 18 Jan 2024 18:37:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=Fe6rbSJm2UEsTdz5bzEmdOd0YC4TFsuPJ+UafRAHMgU=; b=M0NNQZuOE94Fca6I5YeY5d8leV
	JUF/qNwptukFDLAxdCYlWsjZYWeVt27nG5EmLSDwpgDcrsIQl/sQedRGoWPv/bKbTOPm3lBiAtE+s
	e4txY4apMPhJkXJ6vR18P5VPyOZJv89WEkG969/HBbkTod/eSPUGkULtRo7Wd7N3JVvLsv6liUwdx
	Z8/XPZGsGAhh3NlRE1HePuQKuG9RyL26Xy8rngOqMXiIDKloyGPGXMXXsjJEdqwYUu2gR6PJQec1w
	TX95tk/PkPKARiL7s8iafKC7I0PRlHr+556I99QQOpc90TemYNLZqzGZ0gBGCmONOLCji42wECPr4
	u+Ht5DuA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rQXGO-003X7C-0t;
	Thu, 18 Jan 2024 18:37:16 +0000
Received: from madrid.collaboradmins.com ([2a00:1098:ed:100::25])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rQXGK-003X64-1Y;
	Thu, 18 Jan 2024 18:37:14 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1705603026;
	bh=B12x5CU3LJAATEvwezybaFPvAgE1iCNB0PAo3tZON0Y=;
	h=Date:From:To:Cc:Subject:From;
	b=T1tN/aj+jOtqsSFJBIUGFabkBd+Gj6AIapWW+uI7ctwXpcFOY3P9CrOYWSsAWR0wQ
	 rAgdU8RV7LFieTsYwb5lhSKh64lF8XybTXPoepaFemc4CBuvwgPh7Xg/ROd3IDKcdK
	 vkHOhW46eH4DXdOBCX3DRgjKckb7VYvaYfQcXYi+cJ4MMrC3fWnuMakG2MB9XF8x0Q
	 fKx0fK2REDa0nGx2arEVJjLNAUqpAMpl6YUTVx6FE+2sbLOngGffeCWasFLlJdls9x
	 bKqXovIjuuw9l1E/+w5Ow7Bc0mB9xHlGWyHATrTZ92aJ2oGav87yvE66XP6FpJTgur
	 Hh3/ytjo04XHw==
Received: from notapiano (zone.collabora.co.uk [167.235.23.81])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: nfraprado)
	by madrid.collaboradmins.com (Postfix) with ESMTPSA id EFFA83782079;
	Thu, 18 Jan 2024 18:37:02 +0000 (UTC)
Date: Thu, 18 Jan 2024 15:36:30 -0300
From: =?utf-8?B?TsOtY29sYXMgRi4gUi4gQS4=?= Prado <nfraprado@collabora.com>
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Matthias Brugger <matthias.bgg@gmail.com>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org, kernel@collabora.com,
	Macpaul Lin <macpaul.lin@mediatek.com>,
	Chunfeng Yun <chunfeng.yun@mediatek.com>,
	Chen-Yu Tsai <wenst@chromium.org>
Subject: Probe failure of usb controller @11290000 on MT8195 after
 next-20231221
Message-ID: <9fce9838-ef87-4d1b-b3df-63e1ddb0ec51@notapiano>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240118_103712_714681_6279EE63 
X-CRM114-Status: UNSURE (   9.51  )
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

Hi,

KernelCI has identified a failure in the probe of one of the USB controllers on
the MT8195-Tomato Chromebook [1]:

[   16.336840] xhci-mtk 11290000.usb: uwk - reg:0x400, version:104
[   16.337081] xhci-mtk 11290000.usb: xHCI Host Controller
[   16.337093] xhci-mtk 11290000.usb: new USB bus registered, assigned bus number 5
[   16.357114] xhci-mtk 11290000.usb: clocks are not stable (0x1003d0f)
[   16.357119] xhci-mtk 11290000.usb: can't setup: -110
[   16.357128] xhci-mtk 11290000.usb: USB bus 5 deregistered
[   16.359484] xhci-mtk: probe of 11290000.usb failed with error -110

A previous message [2] suggests that a force-mode phy property that has been
merged might help with addressing the issue, however it's not clear to me how,
given that the controller at 1129000 uses a USB2 phy and the phy driver patch
only looks for the property on USB3 phys.

Worth noting that the issue doesn't always happen. For instance the test did
pass for next-20240110 and then failed again on today's next [3]. But it does
seem that the issue was introduced, or at least became much more likely, between
next-20231221 and next-20240103, given that it never happened out of 10 runs
before, and after that has happened 5 out of 7 times.

Note: On the Tomato Chromebook specifically this USB controller is not connected
to anything.

[1] https://linux.kernelci.org/test/case/id/659ce3506673076a8c52a428/
[2] https://lore.kernel.org/all/239def9b-437b-9211-7844-af4332651df0@mediatek.com/
[3] https://linux.kernelci.org/test/case/id/65a8c66ee89acb56ac52a405/

Thanks,
Nícolas

