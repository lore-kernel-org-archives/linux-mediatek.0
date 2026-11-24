Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 61FEE606A31E
	for <linux-mediatek@archiver.kernel.org>; Tue, 24 Nov 2026 11:20:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=s+IyQdDa;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.a=rsa-sha256 header.s=mail header.b=WrnYap2y
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Date:Message-Id:Subject:References:In-Reply-To:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=VNPjORy8JoeEXMa1Lz8mEB6eal9NS2Wh4zVR/rld2fc=; b=s+IyQdDaFqFbTv
	farK8t12vAnvyvoRNz582bYVkhBiM7CIe8XPLhfxW/CQF8sejYkbXHs3AdWWFF5NhFEhgNjxs6p/5
	WnwQ6fjV6z0eYRdRG4r9tTap2F1Gfm2hOUCvfYRJbeL+RRG0aV0/K8jaZogxCoXz1WtTfqCMa/w8A
	/tPBG42lK/4IlJ+bI0IR4BfLajO/cSImx/spnhF8jfyQHCX8UDXV5fD22yb37BW2N7Vp5bIyyeBzt
	S9U5CJWTu+uJzz4sS4knzsE8Ehi4febcrBk8K4bsTK5aQjmtd9uzqfsWU/2339VWAIhC9ORwXJsQO
	d3M2+l+nplRchJR9TaFw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xVoZX-00000006KFq-0FlA;
	Tue, 24 Nov 2026 11:20:27 +0000
Received: from bali.collaboradmins.com ([2a01:4f8:201:9162::2])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xVoZE-00000006KCW-4C29;
	Tue, 24 Nov 2026 11:20:11 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1795519206;
	bh=6fsXMJmK4O/BNhpvy+vd9EhR2CA7pbhjshCDGJBlbG0=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=WrnYap2y/eiBoqLt6q3N+O1cDXj6lKMu10KA4dmA5GcjMr5pKzclng0X+X1wLnXsO
	 xvQFeOmx5z88zKaM7TNoZY8PiAce0waTradrQxQqdKsN/WWYTqqFlE/Rnlu05ZKEk6
	 y2GDuDWPTz6j8PEtFcf8YKp1ipQgSlzFwxRV3r/5bfTWZT8vd8YvtPTdYH1gKn3/Z7
	 2v+SirkcTe1clM9hdX043Pc46VAMjApFLjY3Au7VvH7VNM6XxgU7AaOWCeShnbW62W
	 4BJNo3/rhcvrV0Yb2IOKWeUeBKgMX/QP4D1ih+BK2eiZ4MmC0ohpsE1Hk6WMu2qbSx
	 F+W043sSOMyjg==
Received: from IcarusMOD.eternityproject.eu (unknown [100.64.1.21])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id D8F1A17E0309;
	Tue, 24 Nov 2026 12:20:05 +0100 (CET)
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
To: Matthias Brugger <matthias.bgg@gmail.com>, 
 Chen-Yu Tsai <wenst@chromium.org>
Cc: linux-mediatek@lists.infradead.org, devicetree@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org
In-Reply-To: <20261124100420.613422-1-wenst@chromium.org>
References: <20261124100420.613422-1-wenst@chromium.org>
Subject: Re: [PATCH] arm64: dts: mediatek: mt8192-asurada: Fix swapped
 regulator ramp delays
Message-Id: <179551920584.37930.10948459664476157710.b4-ty@b4>
Date: Tue, 24 Nov 2026 12:20:05 +0100
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.16.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261124_032010_486590_78DD6D90 
X-CRM114-Status: UNSURE (   8.52  )
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

On Tue, 24 Nov 2026 18:04:19 +0800, Chen-Yu Tsai wrote:
> When the ramp delays were added for the MT6315 regulators, the patch
> had mismatching context (due to unmerged patches in between), and thus
> was applied incorrectly. The result was that the ramp delays ended up
> swapped between vbuck1 and vbuck3.
> 
> Fix them and swap them to the correct regulators.
> 
> [...]

Applied to v7.4-next/dts64, thanks!

[1/1] arm64: dts: mediatek: mt8192-asurada: Fix swapped regulator ramp delays
      commit: 12820200fb1898f10589c1cf1b70ee64218b66e7

Cheers,
Angelo



