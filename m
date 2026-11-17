Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1C04C606A88E
	for <linux-mediatek@archiver.kernel.org>; Tue, 17 Nov 2026 09:11:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=JIffwnfK;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=bwvWH87o
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:Cc:To:In-Reply-To:References:Message-Id:
	Content-Type:MIME-Version:Subject:Date:From:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=GH2RTnN5eMd0yHmk4Ze/DUPXoCGAt6U5CjnSXWZgI9s=; b=JIffwnfKs1zD0WJhdgrtun+dse
	NxcVewLvZaDodwLR0Aj00BqkoJtJra9JZJ9789gLhh+FSQATgaE0uxlc5nQThJRQVZ4XOMjbvRuqs
	iIl51DaK4LffKfbeb7GcNd8vvHxROYCntPOhbzXlCz/MYLMly2CfXsE/Ggap1My7+83tRp+8S8gWf
	uQnsdIdpr0sMsdu2NxHg4obBazO+DK528O7pneULuJXJuXKs75WvFexXnWHkj69D28LGpvUCKL/nS
	JUrYIxQjEUYpDEBGVIYt2ti+vKS+4lk1mh9sqspmLQS2U3dUYuXqc/qRmq9cE/CqFDpG2diVSZYAi
	SU7enQTw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xTFE5-000000051v3-2gg0;
	Tue, 17 Nov 2026 09:11:41 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xTFE3-000000051sb-2HRb;
	Tue, 17 Nov 2026 09:11:39 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 45325403F2;
	Tue, 17 Nov 2026 09:11:39 +0000 (UTC)
Authentication-Results: smtp.kernel.org; arc=none smtp.remote-ip=100.80.115.77
ARC-Seal: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256; cv=none;
	t=1794906699;
	b=u9WcSmOe74dqZ/RYiXJQwhcYSKLIyUM/k/j97jFx/LsERsWgpgiRABbJLHtiCIH3T7jy
	 Ncr7HnSyXT5QV++SqjWIMCXYbPui1GLMJBxek1bIP9DUqMCnJ6VScJuqXbyhAx44IfOoU
	 w2FMS/TMU5V1H08VWMjrYYokTESnNMlZtjTSTaXX9kZ7xuV4QHv1VjQLjpVPeByMvZDvd
	 5eNHfGNDFwVGI6Y5KCDULYXn3gmE5xaBGj//h729ndd5epKiJWDTLO9sqqZPspUo8+rxT
	 Hgxw4+NG5h3Vhed/1n1yGBZS5CRy8un6maPvtOquGYv1L92dCMo0DNvZJVI3qhaxj3A==
ARC-Message-Signature: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256;
	c=relaxed/relaxed; t=1794906699;
	h=DKIM-Signature:Received:From:Date:Subject:MIME-Version:Content-Type:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To:Content-Transfer-Encoding;
	bh=GH2RTnN5eMd0yHmk4Ze/DUPXoCGAt6U5CjnSXWZgI9s=;
	b=xxNJLNc6obY6OGg67JncRMkyWNsQNTGklC1Wb1BxwD7VubejwfdDyVEWTEnaQ9jApEjO
	 r5Kvv4NQ3YhL5QnnJryx7cPVoYHIWyFvQsbLcjPCS7yl5P6/iRJb72tvcYqoTRoFQ/WG5
	 Fio7WKSF0Dl6qpENOjh21iUJj5gT4s/3zYA2ishtU/tT9Yr9NnShMUuwp3htzrUDLIojK
	 gQLA7mtpbwVWTwvftCXEK00Itm1AuHDVsesCpqMChIl3IPZTm/SqdFwaiBZN/6mX6nuhy
	 696TSNYK98cfOsLQuKOeabhcU/83udBciEzdy/pWuX/hAzGvzSrFaXU6agGyLo+tCWQ==
ARC-Authentication-Results: i=1; smtp.kernel.org; 
	arc=none smtp.remote-ip=100.80.115.77
Received: from lkml.kernel.org (nexus.subspace.kernel.org [100.80.115.77])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id DCF871F000CB;
	Tue, 17 Nov 2026 09:11:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794906699;
	bh=GH2RTnN5eMd0yHmk4Ze/DUPXoCGAt6U5CjnSXWZgI9s=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To;
	b=bwvWH87oYw8WWo+CKwg+5JPKmPodI4SNCBPEU4J8AgA+AauIhY4jkhNt250fKcpzS
	 PDne/4R7usaJkD6fGgQPTio/doep0eF7h30tgaNUTPsb0x5ODxeBOB2lOhHrVTkcro
	 AWBCNPemPLHkipwYbK/n1EaDZMghEaywqp5Hh4yWL0Km21akaUUgNQ48BlXPJdbOZp
	 9mpk+VnoE9HmcoIHkURBWLX4tBwUBk1ZHIBxXTGIoTm1n/9ozIwbDaV2U1wTgySiH8
	 YFJ5wZANDuGb/t+hKCOds3p5/cymCY0NrsS7gJBr3TFIUkFCNkm3r9j3yzWj37pu2L
	 dkB0KlKWnCt+w==
Received: from nexus.subspace.kernel.org (localhost [IPv6:::1])
	by lkml.kernel.org (Postfix) with ESMTP id 5E5574A77B;
	Tue, 17 Nov 2026 09:11:37 +0000 (UTC)
From: Rui Cao via B4 Relay <devnull+i.udp0.com@kernel.org>
Date: Tue, 17 Nov 2026 17:11:33 +0800
Subject: [PATCH v2 3/5] watchdog: mediatek: Add MT6833
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Message-Id: <20261117-mt6833-base-v2-3-058a0685c40c@udp0.com>
References: <20261117-mt6833-base-v2-0-058a0685c40c@udp0.com>
In-Reply-To: <20261117-mt6833-base-v2-0-058a0685c40c@udp0.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 Sean Wang <sean.wang@mediatek.com>, 
 Wim Van Sebroeck <wim@linux-watchdog.org>, 
 Guenter Roeck <linux@roeck-us.net>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 Jiri Slaby <jirislaby@kernel.org>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, 
 linux-watchdog@vger.kernel.org, linux-serial@vger.kernel.org, 
 phone-devel@vger.kernel.org, Roman Vivchar <rva333@protonmail.com>, 
 Rui Cao <i@udp0.com>
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1794906695; l=1016;
 i=i@udp0.com; s=20261107; h=from:subject:message-id;
 bh=b+SMsmXF4lIy9e6odjAYdc3PAu/hTjDn96dpS5CTy+E=;
 b=dIK67eDYZoEmBPQ+hhU+D0gRmd9uuLWDbGnoXMjK4JmWt/tYUhv9JDXMU27TE8XI8gemcGHCy
 InnqM3tQG7oBma8vqXpGLdDhPg59o8gZC1oGUb2ZgHn6kqMJQ4Of6Zo
X-Developer-Key: i=i@udp0.com; a=ed25519;
 pk=XZJKcKgnUUjjyw8KuKy7u2QeIX0JLY/L1Fxzwwje41w=
X-Endpoint-Received: by B4 Relay for i@udp0.com/20261107 with auth_id=1443
X-Original-From: Rui Cao <i@udp0.com>
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
Reply-To: i@udp0.com
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
X-Spam-Status: No, score=-18.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

From: Rui Cao <i@udp0.com>

Match MT6833's watchdog. It works as MT6589's, but its TOPRGU reset
layout isn't known well enough to describe, so it gets no match data
and the driver registers no reset controller for it.

Signed-off-by: Rui Cao <i@udp0.com>
---
 drivers/watchdog/mtk_wdt.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/watchdog/mtk_wdt.c b/drivers/watchdog/mtk_wdt.c
index 1630ab65d59..575233c7911 100644
--- a/drivers/watchdog/mtk_wdt.c
+++ b/drivers/watchdog/mtk_wdt.c
@@ -595,6 +595,7 @@ static const struct of_device_id mtk_wdt_dt_ids[] = {
 	{ .compatible = "mediatek,mt6589-wdt", .data = &mt6589_data },
 	{ .compatible = "mediatek,mt6735-wdt", .data = &mt6735_data },
 	{ .compatible = "mediatek,mt6795-wdt", .data = &mt6795_data },
+	{ .compatible = "mediatek,mt6833-wdt" },
 	{ .compatible = "mediatek,mt7986-wdt", .data = &mt7986_data },
 	{ .compatible = "mediatek,mt7988-wdt", .data = &mt7988_data },
 	{ .compatible = "mediatek,mt8167-wdt", .data = &mt8167_data },

-- 
Git-157)



