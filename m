Return-Path: <SRS0=8MsW=7V=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 37ACBC433E2
	for <linux-mediatek@archiver.kernel.org>; Mon,  8 Jun 2020 23:49:24 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id E269720659
	for <linux-mediatek@archiver.kernel.org>; Mon,  8 Jun 2020 23:49:23 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="a57IhpM0";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=kernel.org header.i=@kernel.org header.b="bGZ3deS5"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org E269720659
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=TXim0LvQGL8BpPq1/vXbcFWVR2anHHGjjNFsVHSp1Zg=; b=a57IhpM0SUWw4G
	lXCphMgxfdYJ8gsndYo5XcVueLxLv3WP0Lwu0HiwBMxpCwiaNAM6lpbo2oUB09LgLJ06oo035TvBA
	jWSWE7spn2SglLMuwT9U0RWAeWIrgvtz2wplGxI0saSZ1DBM+cBWQmT/0EVEJesluE52U+WnSV7FH
	v8TfiHdjbik9D9VmegQu9oZ0178AZFuamnIQ1s/zsUiLjEZMNDj+ZEoJTcocStnWqLVEBQRsdYeER
	FSZWpTWpGHl7LQqw08lcxl8iC43CDrX0PyYIWbHTG1wM39AqAtExxm2g2AqNjpj2BVo4k284JTdzs
	j+p44QfDI3Lmhyv905BQ==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jiRVx-0004TI-Tm; Mon, 08 Jun 2020 23:49:13 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jiR74-0002m9-98; Mon, 08 Jun 2020 23:23:35 +0000
Received: from sasha-vm.mshome.net (c-73-47-72-35.hsd1.nh.comcast.net
 [73.47.72.35])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id B9DBB20842;
 Mon,  8 Jun 2020 23:23:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1591658609;
 bh=JpyXvZPwGmhcDX7HBvEqn00iZ7V++vRJV0NKykGQJf4=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=bGZ3deS5CSi9ULJyTo2SuhMYTr2BSPG+XVsvahwyVs5Q+wzBDB2Hz5eBddSvQlApv
 STtUv1vN7u9pOcBo6Rlb+Yk6jTF4PGaPRxebbFDPECnYP4rDJQffyDs7xQfw67HnyI
 JquoYKifkO8O85ZkaGxPoSvwFv+clxtR4XRdtPSg=
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: [PATCH AUTOSEL 4.19 036/106] dt-bindings: display: mediatek: control
 dpi pins mode to avoid leakage
Date: Mon,  8 Jun 2020 19:21:28 -0400
Message-Id: <20200608232238.3368589-36-sashal@kernel.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20200608232238.3368589-1-sashal@kernel.org>
References: <20200608232238.3368589-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200608_162330_436071_16B491E4 
X-CRM114-Status: UNSURE (   8.20  )
X-CRM114-Notice: Please train this message.
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
Cc: Sasha Levin <sashal@kernel.org>, Rob Herring <robh@kernel.org>,
 Jitao Shi <jitao.shi@mediatek.com>, devicetree@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linux-mediatek@lists.infradead.org,
 Chun-Kuang Hu <chunkuang.hu@kernel.org>, linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

From: Jitao Shi <jitao.shi@mediatek.com>

[ Upstream commit b0ff9b590733079f7f9453e5976a9dd2630949e3 ]

Add property "pinctrl-names" to swap pin mode between gpio and dpi mode.
Set the dpi pins to gpio mode and output-low to avoid leakage current
when dpi disabled.

Acked-by: Rob Herring <robh@kernel.org>
Signed-off-by: Jitao Shi <jitao.shi@mediatek.com>
Signed-off-by: Chun-Kuang Hu <chunkuang.hu@kernel.org>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 .../devicetree/bindings/display/mediatek/mediatek,dpi.txt   | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/Documentation/devicetree/bindings/display/mediatek/mediatek,dpi.txt b/Documentation/devicetree/bindings/display/mediatek/mediatek,dpi.txt
index b6a7e7397b8b..b944fe067188 100644
--- a/Documentation/devicetree/bindings/display/mediatek/mediatek,dpi.txt
+++ b/Documentation/devicetree/bindings/display/mediatek/mediatek,dpi.txt
@@ -16,6 +16,9 @@ Required properties:
   Documentation/devicetree/bindings/graph.txt. This port should be connected
   to the input port of an attached HDMI or LVDS encoder chip.
 
+Optional properties:
+- pinctrl-names: Contain "default" and "sleep".
+
 Example:
 
 dpi0: dpi@1401d000 {
@@ -26,6 +29,9 @@ dpi0: dpi@1401d000 {
 		 <&mmsys CLK_MM_DPI_ENGINE>,
 		 <&apmixedsys CLK_APMIXED_TVDPLL>;
 	clock-names = "pixel", "engine", "pll";
+	pinctrl-names = "default", "sleep";
+	pinctrl-0 = <&dpi_pin_func>;
+	pinctrl-1 = <&dpi_pin_idle>;
 
 	port {
 		dpi0_out: endpoint {
-- 
2.25.1


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
