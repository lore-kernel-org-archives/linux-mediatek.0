Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 135CC606A32C
	for <linux-mediatek@archiver.kernel.org>; Tue, 17 Nov 2026 13:30:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=dFkunWsf;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=hM9J4d5y
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:Cc:To:In-Reply-To:References:Message-Id:
	Content-Type:MIME-Version:Subject:Date:From:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=JUKwPGMQYo18edBpP3+qVXT0aSpgE6kCrGKKM20Fta4=; b=dFkunWsfjoS6EmnfpBgnNQU0H9
	+gMu9KUYdhiiA1tH76eMfHG13WMcvVhV9heQCJftZ+ajh8lgj6V5RTQnyEVypNghWTkhNvRrqvwaa
	WRCwHbh4s1kEDSqmPLW1a0WakgCK6XS/myc2/wUYFTcKOounuBXMigzScIf0SNvXI3nJ5WBKrapLx
	+M8ZNdjnhua//Z2lAYNx/NtpqwnWH8vxBGvz2axRpbL2vC4P2N07YXPf2V2oI1sT8Eb3IJDFa/N6E
	Pan3JF075cOaGifFEERvHTosaQKQtWuq/LjzT+xQeXCtD8qVl7lh9xsSBKf7wH4RSaYqQ6X1UdmHD
	pN3BR1rA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xTJG4-00000005wNt-2vx1;
	Tue, 17 Nov 2026 13:30:00 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xTJG3-00000005wML-06G4;
	Tue, 17 Nov 2026 13:29:59 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id C2D6744DDE;
	Tue, 17 Nov 2026 13:29:58 +0000 (UTC)
Authentication-Results: smtp.kernel.org; arc=none smtp.remote-ip=100.80.115.77
ARC-Seal: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256; cv=none;
	t=1794922198;
	b=DWvVu8Vj2D/GHUGrMH6gVMo0e6A6zFjtu8xxDiTkQzGt46ZNEtyoNDFrXbaOldD9E4Pp
	 +y5aDRX/vPDJpwrT74uMzi8if8zXGHf5Y8+LsZ93RNfG1c4yEhMtbzTf2boUm5h092+zf
	 WangVtgAaf0uHF8aw20FkQljMwwSs9MuNjnY7VklQtkXpcEBPHZghW9Mp7xY1qHFgiZLr
	 kpW3xVGEirn+U758f+/yldHD5Nl+qQK0rW+dY0G/YaCCRKQ2zg3J6nBB3yjL5Jc+rkk/E
	 8quq23LVkJCce9YOSOAk+lFpUfGbhLWUVHhEZeUcPeNjVFr2IZ57osjbmBfnXnj/ppA==
ARC-Message-Signature: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256;
	c=relaxed/relaxed; t=1794922198;
	h=DKIM-Signature:Received:From:Date:Subject:MIME-Version:Content-Type:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To:Content-Transfer-Encoding;
	bh=JUKwPGMQYo18edBpP3+qVXT0aSpgE6kCrGKKM20Fta4=;
	b=Af5+QN/+eo4LNRok2jVlKdA7SCZpHpuM/xyxLcRPMFVb7Y2DoHuWaO6+tCgF42XL501Q
	 bK1lJbAsGvhRrcPkqjXOgLE7PGVHl7o4DqImIG7DbsT2gggQkYq96o74wNBanojrrET2l
	 eQiUSSldZ3KniV7MxSSL60+WdSdE/SjdrLFkbie9XgpbRj/bO+cYbohv344Z3hwkztf5M
	 dA7zZths3V1xf7K9s47xoRbZ4JfcSOqMOJTFXRpmY3uhJR6qXk26nBa+4rMDKdswHiyue
	 fJM08z4fqDMjjKGPEOz4IO+9Wpj7r/rCW4AAKl8D/2WPOC1ZXJpUMeTGFWxIsZG69vg==
ARC-Authentication-Results: i=1; smtp.kernel.org; 
	arc=none smtp.remote-ip=100.80.115.77
Received: from lkml.kernel.org (nexus.subspace.kernel.org [100.80.115.77])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id A6E681F000C4;
	Tue, 17 Nov 2026 13:29:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794922198;
	bh=JUKwPGMQYo18edBpP3+qVXT0aSpgE6kCrGKKM20Fta4=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To;
	b=hM9J4d5y5QcJiLz09ACIHJdee2045D/1I88WIBnURQLy0VB7Czi+a2c1BV4M9X03u
	 UDKRNiclVaO6h6ydnEMOAYyMsvk/5mIVmKN8L/J2t6/w+EDOS3nnHp22B5i/bZlX4X
	 pVVsxDTvvliZK+pikITPdR1boK4tkDb2HZrw4sK8ny2RgNjaMjEKNZbRD+PTvHdbG4
	 0tX80pyO0zf68Okdz69FeYEqVwObh5qXxnuQi3p/SVnjPNSh8c82mWCVVIcROSSYqj
	 6PS2FbqZ8upit2EAu4OFBrAwn5bb26V0FIKp/YxDGDhxZzzudP+kxkgGF6wHl1LZa7
	 weGjshbXU8igg==
Received: from nexus.subspace.kernel.org (localhost [IPv6:::1])
	by lkml.kernel.org (Postfix) with ESMTP id 2343E4A99B;
	Tue, 17 Nov 2026 13:29:57 +0000 (UTC)
From: Ben Grisdale via B4 Relay <devnull+bengris32.protonmail.ch@kernel.org>
Date: Tue, 17 Nov 2026 13:28:08 +0000
Subject: [PATCH 1/2] dt-bindings: soc: mediatek: pwrap: Add MT8163
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Message-Id: <20261117-mt8163-pwrap-support-v1-1-b00fa10035a5@protonmail.ch>
References: <20261117-mt8163-pwrap-support-v1-0-b00fa10035a5@protonmail.ch>
In-Reply-To: <20261117-mt8163-pwrap-support-v1-0-b00fa10035a5@protonmail.ch>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 Flora Fu <flora.fu@mediatek.com>, Alexandre Mergnat <amergnat@baylibre.com>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, 
 Ben Grisdale <bengris32@protonmail.ch>
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1794922196; l=910;
 i=bengris32@protonmail.ch; s=20261018; h=from:subject:message-id;
 bh=GV/5pX+NzfGhR+iyJ7t6HyhLHCTD5LtZGFKHPoKfPAs=;
 b=vrAvGCB+XLv7UU8TZgokSN8oR/McBruaGO/aTnggVHhcFbKi3spHbdqO6nBuZq1ibA3RXMjb/
 r+51jspJwILAHWnlW+yW0UoOEGCyRKPrEmCM03E65L9iGyywp+0sx0z
X-Developer-Key: i=bengris32@protonmail.ch; a=ed25519;
 pk=4ewFRC2yNph/tXokHVzIDlgOA9Hxecf1AlBuD4eOnaU=
X-Endpoint-Received: by B4 Relay for bengris32@protonmail.ch/20261018 with
 auth_id=1233
X-Original-From: Ben Grisdale <bengris32@protonmail.ch>
Content-Transfer-Encoding: 7bit
X-BeenThere: linux-mediatek@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-mediatek.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-mediatek/>
List-Post: <mailto:linux-mediatek@lists.infradead.org>
List-Help: <mailto:linux-mediatek-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mediatek>,
 <mailto:linux-mediatek-request@lists.infradead.org?subject=subscribe>
Reply-To: bengris32@protonmail.ch
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
X-Spam-Status: No, score=-16.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	FREEMAIL_REPLYTO_END_DIGIT,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

From: Ben Grisdale <bengris32@protonmail.ch>

Add a compatible for the PMIC wrapper found on the MediaTek MT8163 SoC.

Signed-off-by: Ben Grisdale <bengris32@protonmail.ch>
---
 Documentation/devicetree/bindings/soc/mediatek/mediatek,pwrap.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/soc/mediatek/mediatek,pwrap.yaml b/Documentation/devicetree/bindings/soc/mediatek/mediatek,pwrap.yaml
index 79b755858bad..de739a8ab75c 100644
--- a/Documentation/devicetree/bindings/soc/mediatek/mediatek,pwrap.yaml
+++ b/Documentation/devicetree/bindings/soc/mediatek/mediatek,pwrap.yaml
@@ -38,6 +38,7 @@ properties:
               - mediatek,mt6873-pwrap
               - mediatek,mt7622-pwrap
               - mediatek,mt8135-pwrap
+              - mediatek,mt8163-pwrap
               - mediatek,mt8173-pwrap
               - mediatek,mt8183-pwrap
               - mediatek,mt8186-pwrap

-- 
2.56.0



