Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6A48A606A329
	for <linux-mediatek@archiver.kernel.org>; Tue, 17 Nov 2026 11:00:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=RpjeHqDs;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.a=rsa-sha256 header.s=mail header.b=Yp6Nk3Pw
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Date:Message-Id:Subject:References:In-Reply-To:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=D4QzFqb7Zz3Kw4h7SEQ1KpGp9R9C8saFgSFJQ/eAjQ4=; b=RpjeHqDsxq0Td7
	UPotaD0K4drXpOij+WYJWJiQtJmGtRhslCrC/AGg6w/3nyb0Ng7M77Dl0Zt2nooBJ4/srfxxxOlrD
	GWj3twBzBcyRF5SvGRbbg1S/dk7jvYWvsLdOYAic7b61erQzCpH+Vppafy2gbY4y259ts6l3hSqmY
	RagTEaMUkPAKstBW7hrmLCqdwypaMYOJHHoRnq30CR+QfhUHJJ8oJ6OLXjdAjLT6mjl+XwfEKa8U5
	6WwJzr8+MqUzb7ee3utfXLZHmLYWPBp7dT+GjpSjU7nz8WaK+fOfLRPTEIH3/QCpu2443gyBVQBPt
	QQIM5hO2mtv5eCgC+hTw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xTGv0-00000005NDV-0evZ;
	Tue, 17 Nov 2026 11:00:06 +0000
Received: from bali.collaboradmins.com ([148.251.105.195])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xTGun-00000005N8G-2bG0;
	Tue, 17 Nov 2026 10:59:58 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1794913191;
	bh=4sqjQ5xqn6KI4BUTRNYtOb2A1Sg7FKy/GIO5i6fVqRc=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=Yp6Nk3PwHh7DyyrBFd7rnQo73o45y/B4M0gC57HkBcUbfMWfNRxCgC/ZcLJIANSdM
	 u7KGzQ0cqnKQ7UDEHXwzc9BtFwim1qQ28MVLdQ7Yo7Wb6ubKLT9cLl0wJFbOOLw7yc
	 AiPBhTqcUNlwrjiixVDZjluP/bkANgIK8v0Pkj4ID8z6BuwN1mnCWdjwGdxpJ9Gfui
	 Zc+0OSZGkoBq6A/t54DeqeqXwD+oFJm0AKlu6w61696g4AtKz7ldOJbooHQ9bM9/E/
	 dT4EiuAIElInY79kYRZlG9ccnZJ8dCVv416YvEQOWViT3tMrHUlpraROpusyGRJcHS
	 zCqlwRPoTeHjw==
Received: from IcarusMOD.eternityproject.eu (unknown [100.64.1.21])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 0FD0717E00E8;
	Tue, 17 Nov 2026 11:59:51 +0100 (CET)
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
To: Matthias Brugger <matthias.bgg@gmail.com>, 
 Chen-Yu Tsai <wenst@chromium.org>
Cc: linux-mediatek@lists.infradead.org, 
 linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org
In-Reply-To: <20261106060621.2706658-1-wenst@chromium.org>
References: <20261106060621.2706658-1-wenst@chromium.org>
Subject: Re: [PATCH v2 0/3] arm64: dts: mediatek: mt8390-genio-common: USB
 fixes
Message-Id: <179491319100.156320.17530941908872114428.b4-ty@b4>
Date: Tue, 17 Nov 2026 11:59:51 +0100
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.16.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261117_025955_978509_2325E6DC 
X-CRM114-Status: UNSURE (   8.13  )
X-CRM114-Notice: Please train this message.
X-Spam-Score: -2.1 (--)
X-BeenThere: linux-mediatek@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-mediatek.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-mediatek/>
List-Post: <mailto:linux-mediatek@lists.infradead.org>
List-Help: <mailto:linux-mediatek-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mediatek>,
 <mailto:linux-mediatek-request@lists.infradead.org?subject=subscribe>
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
X-Spam-Status: No, score=-8.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On Fri, 06 Nov 2026 14:06:17 +0800, Chen-Yu Tsai wrote:
> This is v2 of the Genio 510 / 700 EVK USB fixes that came out of the
> MTK XHCI binding fix [1].
> 
> Changes since v1:
> - Patch 1 now also switches the type C port to a source-only port, and
>   limits the source PDO to 5V 1A, matching the hardware (Sashiko)
> - Patch 1 now connects the SuperSpeed and HighSpeed lines to the
>   correct USB hubs
> - New patch 3 fixing swapped USB hub labels
> - Link to v1: https://lore.kernel.org/all/20261103083335.2944847-1-wenst@chromium.org/
> 
> [...]

Applied to v7.4-next/dts64, thanks!

[1/3] arm64: dts: mediatek: mt8390-genio-common: Fix type C port mode and connection
      commit: 1e821a4fb9e852d027a3167facce169f124f4dda
[2/3] arm64: dts: mediatek: mt8390-genio-common: Split out USB hub enable pin mux
      commit: 7c5f621c2bae8b84f24460e83e73e46cfd9e315a
[3/3] arm64: dts: mediatek: mt8390-genio-common: Fix swapped USB hub labels
      commit: 272559211b361a38789223a0ac75875b37f55d7a

Cheers,
Angelo



