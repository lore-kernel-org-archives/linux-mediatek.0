Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5B1A0606A331
	for <linux-mediatek@archiver.kernel.org>; Tue, 17 Nov 2026 10:48:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=zWhu1t6w;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.a=rsa-sha256 header.s=mail header.b=KKdqhzGl
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=RUN7O4VqPfmqBa2m1SYf0FMJzaRQzyuKWgap+ftrtUI=; b=zWhu1t6w078qFd
	87dQzvEV11B4rqOZE/zaYAd8+t1rtcjjdpFC5Ce17JS9YBLK9WGyz4I06BH6KHBJazxPB2uhHwg7i
	qGYxUDTV3ABRkRgRsAmozafKTj7PRemR1QfM8Byqrk91Kd6qqjH8UivPBJ3L1ZfCsuwwxMZaaOpRE
	t1Q+G2B/3w92tzqhFktyIXcB3xosz4Dq6lLa88qEAf+vs7gD5xEjmdT4uASnZlq1xe+si2j5JUwpG
	9uuy/4fc9g12xNeNVwqvv0sGfnSRJspaGoU2awVIE2OcMYkzYSYC7e+1x0THO2rGvOFrjY8ypfRXa
	K1iJagZT3/d0ZXMfa9PA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xTGjf-00000005KSO-0Gi9;
	Tue, 17 Nov 2026 10:48:23 +0000
Received: from bali.collaboradmins.com ([148.251.105.195])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xTGjW-00000005KM9-3n9W;
	Tue, 17 Nov 2026 10:48:16 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1794912493;
	bh=orTpcthCg6xt0FFxOp+32oPMMXPRwoSXOB9hmuEtzZM=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=KKdqhzGl7ss26Gd1p9ybq1A4+RX5yccpkO75+8WDjf3yEi5JN2L1tN4bAtNssE8Zc
	 QQ49jh2I6rcszoPQ9PvZsjc3Akc6imyLZapzk5yyCudW8QVzjGeT9qnJBvx0I8DbCQ
	 WICUb/UBzPC50deyPUdS7Od1pRf8f8uQRsaCZGd8NBsjxoVEVx+Hyg+XB64FCZ2dW7
	 NHwsuKWtnuPZXQeOjcrNEswtLzGIKzWEMjhO7hziXiZhKNxUFy6eYfkbqAYO2DT9FW
	 KMeoNfSbg8f+1VcTZpDC+JYH05raDhMnsbnwUYEpM3U0jNbPR4K7nESzN3kCMCqeJl
	 KrL74qhD6UvDA==
Received: from IcarusMOD.eternityproject.eu (unknown [100.64.1.21])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 71A3517E0BCC;
	Tue, 17 Nov 2026 11:48:12 +0100 (CET)
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
To: Matthias Brugger <matthias.bgg@gmail.com>,
	Coia Prant <coiaprant@gmail.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Flora Fu <flora.fu@mediatek.com>,
	Alexandre Mergnat <amergnat@baylibre.com>,
	soc@kernel.org,
	Roman Vivchar <rva333@protonmail.com>
Cc: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Kevin Hilman <khilman@baylibre.com>,
	Roger Lu <roger.lu@mediatek.com>,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	stable@vger.kernel.org,
	devicetree@vger.kernel.org,
	Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Subject: Re: [PATCH v4 0/3] soc: mediatek: pwrap: mt6572 support + log level fixes
Date: Tue, 17 Nov 2026 11:48:08 +0100
Message-ID: <179491248220.154190.177723023436695190.b4-ty@b4>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20261028-6572-pwrap-v4-0-1780c58d2097@protonmail.com>
References: <20261028-6572-pwrap-v4-0-1780c58d2097@protonmail.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261117_024815_097044_81D006BA 
X-CRM114-Status: GOOD (  10.53  )
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

On Wed, 28 Oct 2026 12:37:49 +0200, Roman Vivchar wrote:
> This patch series adds support for the mt6572 pwrap.
> 
> All known mt6572 devices use mt6323 PMIC, which is already supported
> by the upstream drivers. mt6572 also shares SoC-specific init with
> mt2701.
> 
> Patch 1 adds dt-bindings compatible.
> Patch 2 fixes improper log levels in the driver, improving UX when
> debugging.
> Patch 3 adds mt6572 support.
> 
> [...]

Applied to v7.4-next/soc, thanks!

[1/3] dt-bindings: soc: mediatek: pwrap: add mt6572
      commit: 44584adbef2d5786ff4e4bedef48f476a700248f
[2/3] soc: mediatek: pwrap: use correct log level
      commit: b5c4ee18cc154623cbc04dc41e3642df3b045ce5
[3/3] soc: mediatek: pwrap: add mt6572 support
      commit: 0e19a950e5c1863b3805ba3969ec661396bf1db5

Cheers,
Angelo


