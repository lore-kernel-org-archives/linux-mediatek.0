Return-Path: <SRS0=9YCi=M3=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.4 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E5779C4338F
	for <linux-mediatek@archiver.kernel.org>; Wed,  4 Aug 2021 07:31:12 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id AC1FF60EB9
	for <linux-mediatek@archiver.kernel.org>; Wed,  4 Aug 2021 07:31:12 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org AC1FF60EB9
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=public-files.de
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:References:In-Reply-To:Date:Subject:Cc:
	To:From:Message-ID:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=B+KX1Nd0GvvqSCnUlbt8MJNYNXb+5WWQZh66+ho0mEg=; b=pfD2EzdZiybCmY
	Aia6RXeH2sslYaxRwygK+F+Ha3XN/XqtxOqRYTcDfcSFI0tee1ERsvfg68I93VMPNQ/lchMAhAcv4
	AEBASWpNCQBmMNab8cnwI7hHHbAPa+9d/0C0bHrfWckCrRbe1Jyt4mZMTqnNRxprE5jXfINDw/vZS
	LDttGnMGb1VQvEPfi6Um6Y2NS1Fu6BBm1fJyQkoItURAJmIsxoii8or6aBvAuDkY30qpis8dmg7kJ
	MUexcr55/Loy1K5puU9s692c3JMHOIrhzW8luylenMfEiQbzmn2exUuq6XHeJ0n7dsWYDGDTIUgx4
	3Xr64Dbbt9vQ+pgqAtAQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mBBMd-0052Cs-W2; Wed, 04 Aug 2021 07:30:56 +0000
Received: from mout.gmx.net ([212.227.17.21])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mBBMO-00528W-8S; Wed, 04 Aug 2021 07:30:42 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.net;
 s=badeba3b8450; t=1628062222;
 bh=P4wBvc85h3fXlWdQcXelaLmQpD4A4GD47g72UVNj57I=;
 h=X-UI-Sender-Class:From:To:Cc:Subject:Date:In-Reply-To:References;
 b=MY1RIEdV/YTZijOtU6ffuHajpvE/20+zoOy4oMIA9PMA3e8aXwTzaWPC7MBwPQv9v
 zxZzXV80UaXChtfhqATFIYAKu67BsJ6Bz3v1inyeOEs2eNHmfydh/xW8GT3DvjbbGy
 U9jSZDDOEcU1R6ZK2AfZFBmrKJZJ899NQx7CctXU=
X-UI-Sender-Class: 01bb95c1-4bf8-414a-932a-4f6e2808ef9c
Received: from [217.61.147.17] ([217.61.147.17]) by web-mail.gmx.net
 (3c-app-gmx-bap67.server.lan [172.19.172.67]) (via HTTP); Wed, 4 Aug 2021
 09:30:21 +0200
MIME-Version: 1.0
Message-ID: <trinity-a5eeacb8-1625-4111-b613-19ee1609b902-1628062221917@3c-app-gmx-bap67>
From: Frank Wunderlich <frank-w@public-files.de>
To: Yongqiang Niu <yongqiang.niu@mediatek.com>
Cc: Chun-Kuang Hu <chunkuang.hu@kernel.org>, Rob Herring
 <robh+dt@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>, Philipp
 Zabel <p.zabel@pengutronix.de>, David Airlie <airlied@linux.ie>, Daniel
 Vetter <daniel@ffwll.ch>, Jassi Brar <jassisinghbrar@gmail.com>, Yongqiang
 Niu <yongqiang.niu@mediatek.com>, Fabien Parent <fparent@baylibre.com>,
 Dennis YC Hsieh <dennis-yc.hsieh@mediatek.com>, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Project_Global_Chrome_Upstream_Group@mediatek.com, Hsin-Yi Wang
 <hsinyi@chromium.org>
Subject: Aw: [PATCH v8, 2/2] soc: mediatek: mmsys: Add mt8192 mmsys routing
 table
Date: Wed, 4 Aug 2021 09:30:21 +0200
Importance: normal
Sensitivity: Normal
In-Reply-To: <1627894773-23872-3-git-send-email-yongqiang.niu@mediatek.com>
References: <1627894773-23872-1-git-send-email-yongqiang.niu@mediatek.com>
 <1627894773-23872-3-git-send-email-yongqiang.niu@mediatek.com>
X-UI-Message-Type: mail
X-Priority: 3
X-Provags-ID: V03:K1:FTFMR063lUiqNFEXMYKR9Nt6kBJb+tvRQII2gEh1asf4eB17tIoXkk2zLgq9ZD1OfoZwa
 zwQa5mpCvFQBtgET6CZ/J7NtfPT9Bk8eILs7hs9zUEJ356V/YkowKCFFYgFuC5vh804RgGRtvI7S
 nN/4NVGY4SKwh3JwOyAbL5N6eyxGAapF+Qt7UbVMzOun+eMRCx/q2qjqlGp3A92+tmr3Oxt4iFpr
 WxfpR8duyZViNpCMnmrdQSeLBnDM9/A+UnMfbmH4lXNI18H4pcGPM373s5b5GEWpkg89+mJ5Ihsq
 mQ=
X-UI-Out-Filterresults: notjunk:1;V03:K0:pe3B7hYMLN8=:xYFKFGHPzPUBrVYDFk7erl
 jCyPvToDYyqeGdTfuO5erRCplUODZQ2TuJJTXrNllkHHVX+Q/xgVq0GKWHQV3KLGEreWxpo7d
 XuU/FRHqPq7uKnltpXonljHTWVPtSv+lp2tPV0+wDrTSU5vYIsrnacPtTmNg2KfT2xbuSKBIJ
 g35lTXsvY70UqFgAtB5vAwdu6cvSdM1vEZFeBpbdJDDdPdVRnh77ajOPurEJTqVU+MO3PlP6e
 VkRPJx0RikfPKW7fd6qRXqGal/KDecSIIxzjFCltzjLYdiYF+XRYwOzKeSGR95hMMMggCdMz8
 iYtXCF1kkmI1b/gGBNPqktDysHJYfO6xC1mUr7zdhtpxS70PkdPdSKP/S/Q2PmzlrXpIPaPdv
 7F3/a30PnTmhxNZElXqCoFQJbFirK3s7LfuzbysOw5tuaTZpqF122rvWqEY6z/RdKlKIxsYKW
 wPieYJYeNVnxgFZkdRfMjwEANhdYzIJkXUaiFwOKT4OydA9m1lie++9HLB7/ew7Irdhr/+2rI
 7xhz9zJtLT2d4i/64rW2kLhXWhraE7ZVKhbJtN21MRQ2eGC/VjY1ItEqfKl14UyNEL/CA/1ps
 FlNKtiSJATQq/OkmLx0fiub23Mve1SBSNWj3XfP8ZsLlAIXg86oaBmnaaTyK3av+huAJ2RRtC
 uZCpWZVNQUG02nrYcaOWBMtHWW3s4s/QfEcDp6rD05SgwQxnB04FXWgv3u8pDFGevUh4Xiu71
 iiUOreyBgptkJa63QoxIL6RfHndWbwa8g8Cu+gMb6g4gxL2i7vV5zVXWV2oln6MXZt5fAtt5a
 Dbie10PssSR6fDvZdVRpeDDnnoQ4EbTxssHUiZY1tjOlujPB48=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210804_003040_643973_F070CF36 
X-CRM114-Status: UNSURE (   6.73  )
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

Hi

can you please test if your device still work after applying this

https://patchwork.kernel.org/project/linux-mediatek/patch/20210729070549.5514-1-linux@fw-web.de/

and

duplicate value constants in your routes?

e.g. changing

+		DDP_COMPONENT_OVL_2L0, DDP_COMPONENT_RDMA0,
+		MT8192_DISP_OVL0_2L_MOUT_EN, MT8192_OVL0_MOUT_EN_DISP_RDMA0,

to

+		DDP_COMPONENT_OVL_2L0, DDP_COMPONENT_RDMA0,
+		MT8192_DISP_OVL0_2L_MOUT_EN, MT8192_OVL0_MOUT_EN_DISP_RDMA0,
+		MT8192_OVL0_MOUT_EN_DISP_RDMA0

regards Frank

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
