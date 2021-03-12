Return-Path: <SRS0=zPgu=IK=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 49611C433DB
	for <linux-mediatek@archiver.kernel.org>; Fri, 12 Mar 2021 14:56:47 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id E4BEE64FB3
	for <linux-mediatek@archiver.kernel.org>; Fri, 12 Mar 2021 14:56:46 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org E4BEE64FB3
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-Id:Date:
	Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=B4IMoJppjANrVGqbWz99xHK8sW+mmk1W2KSDSoN7vzA=; b=AoFyrQdBYM17VoP2iL8snUVaD
	B5d5LnAw4AYjrw+JiRiVIvr5Z8Fc0zaLiyctiDPz9i6sm2veky7stq/ecdon6gGWWuUyQTv9VIsfc
	mmSvB7gF6gsTDXOrb/QTN9bEXLqHVwK/hhJ56HHgqXGt3NVVOiQMaPPMIzzIEHseOhxrzUWhaFlVK
	+4u5JxYND1Xhm9vvhbGUklsEnq0/KZDTPqXjQ1PlSNfiDj0gS7i128UZfgd5Zes8Nq6eF7OEngLsY
	mAtj6BdODjLRIAL6zBp774lQ3Nu3Pah6qewy/+U8cFzex7RGjJEzSjbTpoVzAQejeBDBELa5evtFa
	0oLqMEPwA==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lKjDP-00Bgk8-A4; Fri, 12 Mar 2021 14:56:35 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lKjCy-00Bgeg-VZ; Fri, 12 Mar 2021 14:56:11 +0000
Received: by mail.kernel.org (Postfix) with ESMTPSA id 49D3364FD6;
 Fri, 12 Mar 2021 14:56:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1615560966;
 bh=dYV6M61tO7CKph2cwEeRsM8DUMu4Jp31AOjuDQyUfZs=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=lr0i8NnqRRjht4xrRkUfmgtkN6fA8zTuv4k7uOpDhwIvioPQoNvQD+pJo4V4SnDr8
 29hFbI9yMzqK9So0vqDqYRy4A5fqEivoG6Rd1v0MW7xisNOB4Qym3z0wz+wixCdTpY
 oL6gZyl9Ki2huURi27QwpbpNdhpnJMVVHMFNnk0Pxy+/grf1GZiVOs4JJ9lg4KVxNO
 v9O7u5zb8YRXHPBswo1U6GwjRA/jTimHt8Z7IJuWfQoG065vT/2DSum3fre/zhFc3n
 ORUC9iUM/1GTjrSonSj3oZF/pSnVIIaj1RwSX+uc6JK0IaTbr3Tu8dKfMO2TC7i3mc
 A4BLJ1tOfVQjA==
From: matthias.bgg@kernel.org
To: lee.jones@linaro.org, robh+dt@kernel.org, matthias.bgg@gmail.com,
 lgirdwood@gmail.com, broonie@kernel.org
Cc: devicetree@vger.kernel.org, linux-mediatek@lists.infradead.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 Matthias Brugger <mbrugger@suse.com>
Subject: [PATCH 2/7] dt-bindigns: regulator: mtk: Drop unneeded compatible
Date: Fri, 12 Mar 2021 15:55:40 +0100
Message-Id: <20210312145545.26050-2-matthias.bgg@kernel.org>
X-Mailer: git-send-email 2.30.1
In-Reply-To: <20210312145545.26050-1-matthias.bgg@kernel.org>
References: <20210312145545.26050-1-matthias.bgg@kernel.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210312_145609_688980_5CBD9186 
X-CRM114-Status: GOOD (  11.27  )
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

From: Matthias Brugger <mbrugger@suse.com>

The regulator does not need to have a device tree compatible, if it's
part of an MFD. We leave the node name to the SoC specific name (e.g.
mt6323regulator) to allow older kernels to work with the new binding.

Signed-off-by: Matthias Brugger <mbrugger@suse.com>
---
 .../bindings/regulator/mt6323-regulator.txt        |  2 +-
 .../bindings/regulator/mt6358-regulator.txt        |  4 +---
 .../bindings/regulator/mt6397-regulator.txt        | 14 +++++---------
 3 files changed, 7 insertions(+), 13 deletions(-)

diff --git a/Documentation/devicetree/bindings/regulator/mt6323-regulator.txt b/Documentation/devicetree/bindings/regulator/mt6323-regulator.txt
index a48749db4df36..69f32e1a6702e 100644
--- a/Documentation/devicetree/bindings/regulator/mt6323-regulator.txt
+++ b/Documentation/devicetree/bindings/regulator/mt6323-regulator.txt
@@ -19,7 +19,7 @@ LDO:
 Example:
 
 	pmic: mt6323 {
-		mt6323regulator: regulators {
+		mt6323regulator {
 			mt6323_vproc_reg: buck_vproc{
 				regulator-name = "vproc";
 				regulator-min-microvolt = < 700000>;
diff --git a/Documentation/devicetree/bindings/regulator/mt6358-regulator.txt b/Documentation/devicetree/bindings/regulator/mt6358-regulator.txt
index 9a90a92f2d7e1..ba1214da5bf7c 100644
--- a/Documentation/devicetree/bindings/regulator/mt6358-regulator.txt
+++ b/Documentation/devicetree/bindings/regulator/mt6358-regulator.txt
@@ -23,9 +23,7 @@ Example:
 	pmic {
 		compatible = "mediatek,mt6358";
 
-		mt6358regulator: mt6358regulator {
-			compatible = "mediatek,mt6358-regulator";
-
+		mt6358regulator {
 			mt6358_vdram1_reg: buck_vdram1 {
 				regulator-compatible = "buck_vdram1";
 				regulator-name = "vdram1";
diff --git a/Documentation/devicetree/bindings/regulator/mt6397-regulator.txt b/Documentation/devicetree/bindings/regulator/mt6397-regulator.txt
index c080086d3e629..2b14362ac56e1 100644
--- a/Documentation/devicetree/bindings/regulator/mt6397-regulator.txt
+++ b/Documentation/devicetree/bindings/regulator/mt6397-regulator.txt
@@ -1,11 +1,9 @@
 Mediatek MT6397 Regulator
 
-Required properties:
-- compatible: "mediatek,mt6397-regulator"
-- mt6397regulator: List of regulators provided by this controller. It is named
-  according to its regulator type, buck_<name> and ldo_<name>.
-  The definition for each of these nodes is defined using the standard binding
-  for regulators at Documentation/devicetree/bindings/regulator/regulator.txt.
+List of regulators provided by this controller. It is named
+according to its regulator type, buck_<name> and ldo_<name>.
+The definition for each of these nodes is defined using the standard binding
+for regulators at Documentation/devicetree/bindings/regulator/regulator.txt.
 
 The valid names for regulators are::
 BUCK:
@@ -23,9 +21,7 @@ Example:
 	pmic {
 		compatible = "mediatek,mt6397";
 
-		mt6397regulator: mt6397regulator {
-			compatible = "mediatek,mt6397-regulator";
-
+		mt6397regulator {
 			mt6397_vpca15_reg: buck_vpca15 {
 				regulator-compatible = "buck_vpca15";
 				regulator-name = "vpca15";
-- 
2.30.1


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
