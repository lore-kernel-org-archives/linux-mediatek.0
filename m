Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 05FF9606D814
	for <linux-mediatek@archiver.kernel.org>; Sat,  7 Nov 2026 14:54:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=GiMhy9mn;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=nNAO/bva
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:Cc:To:In-Reply-To:References:Message-Id:
	Content-Type:MIME-Version:Subject:Date:From:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=X4helYl8DT5g1jeUFTGg5H0ViPqhpi+VcgILtCDOiBY=; b=GiMhy9mnYvFo4cMtFjQOZynwnK
	C17mtMr1KUbQDBB9dmm24yn0sOs/p9CkEQCyUF0UhgXpQ137nwjADC3xmcVMRFxX/lB130cU+0IdK
	UrF2G60jF54L6utHFQNrie+FTZRZkJ2fktw0rqoeCQAvRQ/+IaLsx1Y+ipLXuL9MCOow2mND+lyGI
	1TzlGYuTXe3NzphqS2qhlIrPVE6y9MYOwhcsOsiMSsHrDaYKlgYPSGjwaRK9mtmvJaRNxUxv6wEFN
	F4aF+geqj+ERVU+OR1jpqeoaDJOUNvG+HQnxx1qYDOPsDGxC6BTm6sbtZJYHqQzpDcUrbT+3x/7+b
	Dt4IGLuw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xPhoj-0000000ErWI-2g9p;
	Sat, 07 Nov 2026 14:54:53 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xPhoc-0000000ErRg-2kIq;
	Sat, 07 Nov 2026 14:54:46 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 585F142434;
	Sat,  7 Nov 2026 14:54:45 +0000 (UTC)
Authentication-Results: smtp.kernel.org; arc=none smtp.remote-ip=100.80.115.77
ARC-Seal: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256; cv=none;
	t=1794063285;
	b=O80amJyzx4MbWdYdSk7/YXi3OmIn+bYQHUEIiTyHHs+4lvg31X5tzEkwkUbqWLNmTEUy
	 9LKSSsKxo84Bsl7qq/vGQXiaXMliaWLuFPGY8+Lmxd/KPFtEEtIWyVteKy4Ravv8sQtdI
	 +REVN6snV7bNFog4KP/zvYZ+ob659RDI3uTfc0sEOPsffPuTIPItuK7Drd4RNR8TCZueD
	 F66bsZ5/ADPw2I8LTn8IrlUI8CH1csqq3XiZHzleUDaJR8CvaqQtlckwcxZPK5jIEO/EO
	 tVHn+J+iLd+JXyc+QAEQSi6vxfg6ZouwVeRR70c+9Dim3S0hGOMQxV18mf45JgRI6QA==
ARC-Message-Signature: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256;
	c=relaxed/relaxed; t=1794063285;
	h=DKIM-Signature:Received:From:Date:Subject:MIME-Version:Content-Type:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To:Content-Transfer-Encoding;
	bh=X4helYl8DT5g1jeUFTGg5H0ViPqhpi+VcgILtCDOiBY=;
	b=DMJfv/hImSOL5L1m6Wl0brwoaV+hya03N8V6W6oMmhxdQx9cVAboiByZscHjEdBKwsw0
	 bhDkQ2MAGh11Etm4f1Jcj9DombWrR4kkmRvbB+uA5HQ4wkrR21Wme47mD1xZJXsINeKdj
	 SCgW4FOzJ1v7ys4oOiwY3zpLwwXCNCa+n1hDdX9Dp0PZMzP0XLpLWVvkd2MdzK77Nzg/u
	 jws0EBa6QMCExfaydFsxCinD2V05fglx2dQF5+6VTcTmCt/0IQ7j7b1e8zHRdfWKwkhwT
	 anfUN1jE1flXbKxvPdR4bKRge46W4XXE9ERoCu3VW7fSBu2mFoBG3J3+OdB/pIZdAmw==
ARC-Authentication-Results: i=1; smtp.kernel.org; 
	arc=none smtp.remote-ip=100.80.115.77
Received: from lkml.kernel.org (nexus.subspace.kernel.org [100.80.115.77])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 9839E1F008A5;
	Sat,  7 Nov 2026 14:54:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794063285;
	bh=X4helYl8DT5g1jeUFTGg5H0ViPqhpi+VcgILtCDOiBY=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To;
	b=nNAO/bvasFjPjCJJjz5/iN9ljErNYjH3SM4tAxzJ2vrQvUmQfnBsJKR619UgiaScz
	 dH+A+DW0wpBBX+cNsxR8XSms87LmLGq9EUveQPwpv5dEhbOYYQpZsASI6bGEH7FzL1
	 cp1kG59pTtGSKNXh1l0QBsI0rqPnaAsyLtGwdG2rrxJ4wAZSI6fsg+MuOGMjtzwez1
	 bhIuNhTxUp+HU3MnbotCVJPp7pWYb9zZNkKK+wHGvnsEgxW5Wbr/VgOx8P0YySM40P
	 ZL5nveMYw6r9ALnZxyw5waJ356DYtCpZP2PpfuetmyJ4QRgZmYEdmDMNDrmUScmf13
	 MwWeU5vJfgC5g==
Received: from nexus.subspace.kernel.org (localhost [IPv6:::1])
	by lkml.kernel.org (Postfix) with ESMTP id 2347B47C4B;
	Sat,  7 Nov 2026 14:54:44 +0000 (UTC)
From: Roman Vivchar via B4 Relay <devnull+rva333.protonmail.com@kernel.org>
Date: Sat, 07 Nov 2026 16:54:44 +0200
Subject: [PATCH v3 3/3] usb: mtu3: add mt6595 support
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Message-Id: <20261107-6595-mtu3-v3-3-f36bc569cb47@protonmail.com>
References: <20261107-6595-mtu3-v3-0-f36bc569cb47@protonmail.com>
In-Reply-To: <20261107-6595-mtu3-v3-0-f36bc569cb47@protonmail.com>
To: Chunfeng Yun <chunfeng.yun@mediatek.com>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: linux-usb@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-mediatek@lists.infradead.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Roman Vivchar <rva333@protonmail.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1794063282; l=1155;
 i=rva333@protonmail.com; s=20260510; h=from:subject:message-id;
 bh=MH/mAQtsGq6RAwp6c/enfc7ur+acQQpTl7FnupfzQkI=;
 b=mvwt455QhrE/7f4g4dyCBd2KF5jJ+28D7VdMketYUp6laKqvUH6dksPfr0Koand+BnCQYjGAp
 DOYS/KFdwz0DBrRoHo4fsg2KG5hNXj9JTWDpk/i7FsaDst2oWKKjdtL
X-Developer-Key: i=rva333@protonmail.com; a=ed25519;
 pk=zww/nWjBGoQ4POXCG0BV6fx2iuXK6jx77rsKPA5YK5Y=
X-Endpoint-Received: by B4 Relay for rva333@protonmail.com/20260510 with
 auth_id=777
X-Original-From: Roman Vivchar <rva333@protonmail.com>
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
Reply-To: rva333@protonmail.com
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
X-Spam-Status: No, score=-16.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	FREEMAIL_REPLYTO_END_DIGIT,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

From: Roman Vivchar <rva333@protonmail.com>

Add a platform data for the MediaTek mt6595 SoC MTU3 IP block with a
quirk for single FIFO slot.

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Signed-off-by: Roman Vivchar <rva333@protonmail.com>
---
 drivers/usb/mtu3/mtu3_plat.c | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/drivers/usb/mtu3/mtu3_plat.c b/drivers/usb/mtu3/mtu3_plat.c
index bb67da4704b2..9d633695a9be 100644
--- a/drivers/usb/mtu3/mtu3_plat.c
+++ b/drivers/usb/mtu3/mtu3_plat.c
@@ -611,11 +611,16 @@ static const struct dev_pm_ops mtu3_pm_ops = {
 
 #define DEV_PM_OPS (IS_ENABLED(CONFIG_PM) ? &mtu3_pm_ops : NULL)
 
+static const struct mtu3_platform_data mt6595_platform_data = {
+	.fifo_single_slot = true,
+};
+
 static const struct mtu3_platform_data mt8173_platform_data = {
 	.fifo_single_slot = false,
 };
 
 static const struct of_device_id mtu3_of_match[] = {
+	{ .compatible = "mediatek,mt6595-mtu3", .data = &mt6595_platform_data },
 	{ .compatible = "mediatek,mt8173-mtu3", .data = &mt8173_platform_data },
 	{ .compatible = "mediatek,mtu3", .data = &mt8173_platform_data },
 	{},

-- 
2.56.0



