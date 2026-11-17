Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DE4FE606A334
	for <linux-mediatek@archiver.kernel.org>; Tue, 17 Nov 2026 13:30:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=mFiVCs11;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=g52bDE6B
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-Id:Date:Subject:
	From:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Unsubscribe-Post:List-Owner;
	bh=1M+tmkiw13zqQg92Zh2bUVUQ5Nt1cC1rTeaNa/qKMXY=; b=mFiVCs11E/aZdViH5msLtBI3cU
	K2TvuafK3Ouf5LPtTVSTL2eVuY9d2e2xSPruRIiOjAZ+GeeE+l4loTJe307EwfSG+U3f56xjYKau0
	FeSPr36fY6MmN5DhrXyrtdOFDQCTwNcbzWn2kn87s0p3NLcZrI4KLFs0LvetPpjfVF1phPipJLP9q
	QRNyoVHSiU2SUQYW26BH3nTF7wrPciA3xftMGfjAPLoE+QmAoc/0VeBq5VFbK5AI33CQfdFyTB4dx
	l5LvoPLd9XuQq1I6o6pHBOnU6fdq4fhZUrS3LapqUqC5UG14A/SkIP8Kn2T4mNsM8o30FJCbsvB/e
	g8D6+V0A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xTJG4-00000005wN4-1o5C;
	Tue, 17 Nov 2026 13:30:00 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xTJG2-00000005wMA-2hCV;
	Tue, 17 Nov 2026 13:29:58 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 5324B44DD7;
	Tue, 17 Nov 2026 13:29:58 +0000 (UTC)
Authentication-Results: smtp.kernel.org; arc=none smtp.remote-ip=100.80.115.77
ARC-Seal: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256; cv=none;
	t=1794922198;
	b=n2db2MGvTywahUHkwi80igfopV6xLT6ClyGz3/1lzVI9Grnqr7KMf7F7Qe6uBDpXyfri
	 NpbyIDdrbNYAp1JlOKMKXxbGB2FwXnQXLaA2HmHLpmwKeqxcjo8lS0vazVUCkRTDPa7Lu
	 YzDoeErcBn6GCx5QLRf3uvJHVryr9AXTVBR4P3YZBh+uUdzmkzwqXN7R+zFkMsJYd/s54
	 +NN5HL5HlDkM3oV5pYFBWx9PmczANu2ODcJjSdMzCr80Sqsz03+3Xe3Sds8OHJbqUh1yC
	 PxTLRfTBSlWzU92Mv7os2aF6SJ6RPWWLHMIIovAl6ZCL+9wT/IQvuPpwHsTess61gNA==
ARC-Message-Signature: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256;
	c=relaxed/relaxed; t=1794922198;
	h=DKIM-Signature:Received:From:Subject:Date:Message-Id:MIME-Version:
	 Content-Type:Content-Transfer-Encoding:X-B4-Tracking:X-Change-ID:To:
	 Cc:X-Mailer:X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To;
	bh=1M+tmkiw13zqQg92Zh2bUVUQ5Nt1cC1rTeaNa/qKMXY=;
	b=GjFJ8rldZ77NgOwRtPByvUmxrir2/ELYJOJ0khjZjkc2wDofBI4KFihOsXtd7r26x+d3
	 FwXXkDBD211KGtmPveT1yZK+fQQijRJDhx47V7v/rxKdBEznmsaxFIbKxrtbLOvWXBaqs
	 RJzRqD2RjvAVz0OtHSuObTBWFiNJc9uQX3qyjIg8rluJ+8ybdQifuAfFdwdP8tvHsUbOj
	 PYGyX+tPnikhiSjxYmf5oGxafjqzd+8oAd3lmDjV1HFeMUQCA49feGKUv+bU+17nz+0Ur
	 fzItNU8Mf7HnNGN0RzJH1ZsZ9qiKMNi0zTmXZYz6cgZXYk9Ff8L4uVvGh1RQcKfojvw==
ARC-Authentication-Results: i=1; smtp.kernel.org; 
	arc=none smtp.remote-ip=100.80.115.77
Received: from lkml.kernel.org (nexus.subspace.kernel.org [100.80.115.77])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id A6E901F000C6;
	Tue, 17 Nov 2026 13:29:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794922198;
	bh=1M+tmkiw13zqQg92Zh2bUVUQ5Nt1cC1rTeaNa/qKMXY=;
	h=From:Subject:Date:To:Cc:Reply-To;
	b=g52bDE6BvBVq65dKA+1ImApcX6TTHPWrZhbdZJef1hdRIx7bVRAMDuPvZdds6Z9pz
	 Hn7rNbP7sxbvzoQxmckmJFWRt7SnGVKbUbm6L8eHvMMHyhqgWWCyHraLBSjojMTW9Y
	 Mu02fDQTd/erLu96A/VMxyW88nNeCRQA9YDxnLbudAg6FSwYBntuZ4YonEtAF7VIK8
	 IQ76//GjFTw8vKNF5V78YIkfGrvS0oKQ4pdDh4XanOPxWEfSbw8Rb0PDArMt/4L8Bh
	 LdWyZhU7yIYoQFouWX4AMYmupgha9r3sgfrS5H3kxsMf18LwdpRQ8SGQSbzS+bexZU
	 cLws/y8ATs/4w==
Received: from nexus.subspace.kernel.org (localhost [IPv6:::1])
	by lkml.kernel.org (Postfix) with ESMTP id 0649A4A993;
	Tue, 17 Nov 2026 13:29:57 +0000 (UTC)
From: Ben Grisdale via B4 Relay <devnull+bengris32.protonmail.ch@kernel.org>
Subject: [PATCH 0/2] soc: mediatek: pwrap: Add MT8163 support
Date: Tue, 17 Nov 2026 13:28:07 +0000
Message-Id: <20261117-mt8163-pwrap-support-v1-0-b00fa10035a5@protonmail.ch>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/yXMQQ6CQAxA0auQrm1CK6LxKsYFzBStidBMByUh3
 N1Rl2/x/wouScXhXK2Q5KWu01hAuwrCvRtvghqLgWtuieiIz3yido/2Tp2hz2ZTyhgic8915MP
 QQEktyaDLb3u5/u1z/5CQvy/Ytg87GfMaeAAAAA==
X-Change-ID: 20261117-mt8163-pwrap-support-cd22b20d25f4
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 Flora Fu <flora.fu@mediatek.com>, Alexandre Mergnat <amergnat@baylibre.com>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, 
 Ben Grisdale <bengris32@protonmail.ch>
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1794922196; l=935;
 i=bengris32@protonmail.ch; s=20261018; h=from:subject:message-id;
 bh=H/UCJ2qAfxJA3SdM4D1y0mgjHFPRdqf+v5XoA4KVnSE=;
 b=W0fKT3k00Nmsp06bXskA6eG5czcF25ffOkNp0AHPQ5MNuJDV+/5yhMrFAPHpN1uFZ4TZQ6EmC
 09oK9XlsU8wA1UhSSRYGCSFuBvUVmpwz23XJ59d0O6lFyjjMolv/YjC
X-Developer-Key: i=bengris32@protonmail.ch; a=ed25519;
 pk=4ewFRC2yNph/tXokHVzIDlgOA9Hxecf1AlBuD4eOnaU=
X-Endpoint-Received: by B4 Relay for bengris32@protonmail.ch/20261018 with
 auth_id=1233
X-Original-From: Ben Grisdale <bengris32@protonmail.ch>
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

This series adds a new device tree compatible and driver support
for the PMIC wrapper on the MediaTek MT8163 SoC.

All known MT8163 devices use the MT6323 PMIC, which is already
supported upstream. Due to the MT6323 pairing, MT8163 can share
the same reg clock init as MT2701.

An additional series will be sent in future to make the MT6323
device tree usable for arm64 boards.

Signed-off-by: Ben Grisdale <bengris32@protonmail.ch>
---
Ben Grisdale (2):
      dt-bindings: soc: mediatek: pwrap: Add MT8163
      soc: mediatek: pwrap: Add support for MT8163

 .../bindings/soc/mediatek/mediatek,pwrap.yaml           |  1 +
 drivers/soc/mediatek/mtk-pmic-wrap.c                    | 17 +++++++++++++++++
 2 files changed, 18 insertions(+)
---
base-commit: 749a4de370409464cf8501ec5b2451df45c84eb4
change-id: 20261117-mt8163-pwrap-support-cd22b20d25f4

Best regards,
--  
Ben Grisdale <bengris32@protonmail.ch>



