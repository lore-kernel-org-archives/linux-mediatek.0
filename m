Return-Path: <SRS0=uiJf=BH=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BB461C433E8
	for <linux-mediatek@archiver.kernel.org>; Tue, 28 Jul 2020 11:19:00 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 8BAEA2065E
	for <linux-mediatek@archiver.kernel.org>; Tue, 28 Jul 2020 11:19:00 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="1qDDHYEE";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="suTlrd3X";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=gmx.net header.i=@gmx.net header.b="Y4T5TGaB"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 8BAEA2065E
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=public-files.de
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-Id:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=uBi3Uyg4LKVGsSQSp7RcWrXHYdJKgLwwsqqXOQFyeNU=; b=1qDDHYEE8o2aGrCxzVXaVzpcM
	sCkmkg8i8GwHbKPhPMwtEWbdn7gaB9dJg9gRICfDEpg8JJliCgy8iGVro0lYAIC7fRnN5cNk6kDxu
	k5UAaiQZHgBQHmFYaqBzU52kOFeDes2XQ9CpTb+KYDj4KO2B9KfAspdH6qNUWS5bTQszZtBhd5JOs
	8ioHYZawr9V221QRYcL1XxHePZcIw+V69uUkC4VLGgIYAyqG/pclYtAuZosQLXG+svAaQtN9Aecdt
	lnPRdindbgnn+yyhrHL8e6HIcWcaEnJ8riKru5ykCAqrFU1APIdJSLA8D2jPlpPVrDug+ycQ6jJzy
	BcqyI15mw==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1k0NdC-0008Nx-7M; Tue, 28 Jul 2020 11:18:50 +0000
Received: from casper.infradead.org ([2001:8b0:10b:1236::1])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1k0Nd9-0008Mw-EN; Tue, 28 Jul 2020 11:18:47 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=casper.20170209; h=Content-Transfer-Encoding:MIME-Version:
 References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:
 Content-Type:Content-ID:Content-Description;
 bh=JjwWFddAdWynk3ZYwPqAbvNXk1S91CACAkdFq8ZgUhU=; b=suTlrd3XIXUbofTSutxdnaxmDJ
 t4Ou/cH429U6l01CGY7s4EoG+g+dB8aRNm0rNsL+5jVupKCZrFjCLYoRuqiioSA7NVNzpCH3nfpUA
 rTB7QDwCf1jyBhlt2VMgRqzeIcWJ/+osVcbx4ILihNe3AaNT+xHhHFLRSKJcJch6XZ1LHZzCtdaQO
 qHhHCBoKab8gYfwreULYA4+4aWBk18H4c6+cXjKBnVzBOGvkasQZlt1JVV8JMZKmEw4oTgQBnr6nk
 iVx8DLU6kfmmt6Xom/XXBoGP0jaWx6hfsZfqFMhKNObInvBjL6acKQPddn6uO4rcEPLkIinZjsJM7
 WEzjGpSg==;
Received: from mout.gmx.net ([212.227.17.22])
 by casper.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1k0Nd5-0006YX-LY; Tue, 28 Jul 2020 11:18:46 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.net;
 s=badeba3b8450; t=1595935105;
 bh=nn4BkbW0oeEmcmd3H6QHuJO7LEA/snDXKRVANzx14BY=;
 h=X-UI-Sender-Class:From:To:Cc:Subject:Date:In-Reply-To:References;
 b=Y4T5TGaBuRt3b8kV1LyAkiduwg0Pe2qyX/uDh1A70EFNHcoeRo3AbL84Ed0E5L4Ci
 9fy+P7/8/XbZytNcRLfs+Qbbe4Ek/IWc2C/s8d2pS0lPw2nRyjbKLn4LWt/DJmpdnH
 AxxaiKJ+plcgGAPLFxsWaaQRXl+ctR610QqCPuXE=
X-UI-Sender-Class: 01bb95c1-4bf8-414a-932a-4f6e2808ef9c
Received: from localhost.localdomain ([80.208.215.239]) by mail.gmx.com
 (mrgmx104 [212.227.17.168]) with ESMTPSA (Nemesis) id
 1MBDj4-1jvSko3s5u-00CiFj; Tue, 28 Jul 2020 13:18:25 +0200
From: Frank Wunderlich <frank-w@public-files.de>
To: linux-mediatek@lists.infradead.org
Subject: [PATCH v2 4/5] drm/mediatek: dpi/dsi: change the getting
 possible_crtc way
Date: Tue, 28 Jul 2020 13:17:59 +0200
Message-Id: <20200728111800.77641-5-frank-w@public-files.de>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20200728111800.77641-1-frank-w@public-files.de>
References: <20200728111800.77641-1-frank-w@public-files.de>
MIME-Version: 1.0
X-Provags-ID: V03:K1:rTF2GSs7JL/heYwGA7znoUaELcob0GxZ4gZI2tIFt+A0aSnsby8
 0XUoXibUcKWysOwTn/CZlW9rpuGJK1GojEZyc2C44706GSiy8/tpQFVhRWP45HlMen+R/4e
 1n7CdNSfTDuS/oJ9dYALJKe0JKchcLjuEAMsxGJNZA1wxc1ce6AFpbtSXwwPzaHP1HtCNqi
 1X/DLBRAf1lZTLoCXaovQ==
X-UI-Out-Filterresults: notjunk:1;V03:K0:RV7oFfUX3MU=:M/4aNAEJjpZZJa0cjUuRDy
 L+eM2xGQG0RnqgxzoVd6drELeZaZId4oJe/xJyShs0HwkT2wheosTwwuILnf2RQBc0brb0ZAN
 3kgK0FgC2+33+gDvC7Sn1sdVkvxbaTnc2WsBgkTgbmpxUHcRcwk7pdZZkxImMFVL6PnNmfoHl
 S3r9AuBOJ+GDA1ZOXLXiAq7+BnBnUPM3YY6kjC/yqaZMlh6sDb9CFbMfCPB/1QP4Mus62JlAp
 nKHOFpKDIBtP+s5Zq+ZGgU3oXXli7enF7H84NmYnY48rO3qsGMx8eMfAH3L3rz3T5iRo9mVug
 lb8/+GNqLADqus314zDsvpnrWth/ekQCZnIMvIrnGGPwgwrDim3fAV+5heOQZSGUaAhR5sU5/
 JhqIKmwtXo7gfcwUOtfZ7p/DrnyhnNnqZNe5QihNZ4eiQ+2yEuMEDwEHiU60iPxGgsexMbZzb
 vxwQdKql69+vWsXTOviDAH4/doIRjTEW85lnK1r7RcOZn2pef9whEKUZeJKb1jZFCfxtCCx26
 CDEts7whrkI/HtKYEtOjJlJzR5/1IoBFeadIfLTHgT/cKNXTojUTFvyupHB9YkJmopSy8KPm5
 mh2e+6jtsM4QvtPJ+bmcZ+AbEv8dwoRSyrT+55cloJ2v/FJO9Q6M3Ct4x+wyKck5Ti/ucMs2t
 bPUx5ta0y1FrgNwyQwmVKdpBQ7GBlTQx2hgZw+f5+9TXJ8FYZf0Jbg0CiipPtro44NoO/x3E/
 AaTCTHXe9dtBtGy2lFrrzzdPmh9WXV0rvuE7etvFmC6u/8yC4ttnlbugQurapc1LRmEX+a9VC
 PxI/44Td8EioDsFiTAoiBti7oIjDjCqxD5qZWB4SitqNWqol4DAIcV3EHP5n51NGW+5DBu1fM
 J+CxAO64WqNWXgdIxPlYcC4M8G30BF5gT//HcCT60n2cxjBdkdRavGkTlM+FONv+JtcmTbbLJ
 n2eHWFSImvm8Y16waIlN5SKMtNy5qxFvHXmgyqPHcxdeOtBp5gio36/sEyj7DBcNESumMTJxV
 SCLCqDCpLP9svdXOuP7l/ZiKhmVDPQJ42wns7bMUOrLTMFvwGDSCqsynNn9EtFuPzlpCO2G8f
 zOkTKcy1my8y5mGqZ6Nu2aiu9tcWYwnM7i9puNmR4xD1sY0wJK6FnhSrcfPOr/3Hxae7A5UDj
 h0xsgMZfaQU2xntgM2jl8C16RynN94gnVY7H4+zufLpj2xmMMaZrYngQ8HBqDoMUiS3ISCaIJ
 M/N+H2nqLFdhZSlVZL1y1Hr//wNT03awmNwDpKw==
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200728_121844_060673_5C598736 
X-CRM114-Status: GOOD (  11.40  )
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
Cc: Chun-Kuang Hu <chunkuang.hu@kernel.org>, Jitao Shi <jitao.shi@mediatek.com>,
 Philipp Zabel <p.zabel@pengutronix.de>,
 Frank Wunderlich <frank-w@public-files.de>, David Airlie <airlied@linux.ie>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Daniel Vetter <daniel@ffwll.ch>, Matthias Brugger <matthias.bgg@gmail.com>,
 linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

From: Jitao Shi <jitao.shi@mediatek.com>

[Detail]
dpi/dsi get the possible_crtc by
mtk_drm_find_possible_crtc_by_comp(*drm_dev, ddp_comp)

Test: build pass and boot to logo

Signed-off-by: Jitao Shi <jitao.shi@mediatek.com>
---
 drivers/gpu/drm/mediatek/mtk_dpi.c | 3 ++-
 drivers/gpu/drm/mediatek/mtk_dsi.c | 3 ++-
 2 files changed, 4 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/mediatek/mtk_dpi.c b/drivers/gpu/drm/mediatek/mtk_dpi.c
index d4f0fb7ad312..e43977015843 100644
--- a/drivers/gpu/drm/mediatek/mtk_dpi.c
+++ b/drivers/gpu/drm/mediatek/mtk_dpi.c
@@ -608,7 +608,8 @@ static int mtk_dpi_bind(struct device *dev, struct device *master, void *data)
 	drm_encoder_helper_add(&dpi->encoder, &mtk_dpi_encoder_helper_funcs);

 	/* Currently DPI0 is fixed to be driven by OVL1 */
-	dpi->encoder.possible_crtcs = BIT(1);
+	dpi->encoder.possible_crtcs =
+		mtk_drm_find_possible_crtc_by_comp(drm_dev, dpi->ddp_comp);

 	ret = drm_bridge_attach(&dpi->encoder, dpi->bridge, NULL, 0);
 	if (ret) {
diff --git a/drivers/gpu/drm/mediatek/mtk_dsi.c b/drivers/gpu/drm/mediatek/mtk_dsi.c
index 270bf22c98fe..c31d9c12d4a9 100644
--- a/drivers/gpu/drm/mediatek/mtk_dsi.c
+++ b/drivers/gpu/drm/mediatek/mtk_dsi.c
@@ -892,7 +892,8 @@ static int mtk_dsi_create_conn_enc(struct drm_device *drm, struct mtk_dsi *dsi)
 	 * Currently display data paths are statically assigned to a crtc each.
 	 * crtc 0 is OVL0 -> COLOR0 -> AAL -> OD -> RDMA0 -> UFOE -> DSI0
 	 */
-	dsi->encoder.possible_crtcs = 1;
+	dsi->encoder.possible_crtcs =
+		mtk_drm_find_possible_crtc_by_comp(drm, dsi->ddp_comp);

 	/* If there's a bridge, attach to it and let it create the connector */
 	if (dsi->bridge) {
--
2.25.1


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
