Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D2BF5606A32C
	for <linux-mediatek@archiver.kernel.org>; Tue, 17 Nov 2026 14:26:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=B+3OmKwA;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.a=rsa-sha256 header.s=mail header.b=ZPRfs8t+
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Date:Message-Id:Subject:References:In-Reply-To:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=USsCTf90gGZ5jNlFeq762EOZvRFTNKa9FJSOYvXnXuw=; b=B+3OmKwA+nS5hC
	7hQ8kkA4O9MFIbeCk1kzda1wlUlmWpn84wYHIebyfed77I0EQOEJnKe52Frae4Bsbiifw5Z2QN/fT
	81LDucweQxpRBWg0HeI4TTIm5gxsitR7cfdNHzYM9iMq8BHWF2/FTqNLhEFjMr/y6W98OyzFpEsjC
	wkSuVnypvfkBD0nRdLN9oCMhf0kIEDe+wtNme9KcViuQwj4Bld7WnP6Q7zqHgW0LjDEOXS+e7Co6W
	ucEuBeEl6iB25PurdExo9rnRNrcsdoeCoVnafYtxZn6A1CETAMg65FJFZJmHOZY1KvtdOp4VVk5Jn
	Qrmly7PTfYl+e3ABRz3A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xTK98-0000000685o-2A0m;
	Tue, 17 Nov 2026 14:26:54 +0000
Received: from bali.collaboradmins.com ([148.251.105.195])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xTK96-00000006846-1LXi;
	Tue, 17 Nov 2026 14:26:53 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1794925610;
	bh=v9cXNV8E9rY8sB+kcXdolX/QfafWx2QvoQUp5369hBQ=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=ZPRfs8t+igeS59j3GyhUonxkM+rLJkDbIm6NDCg2JSfy4mmmmmElkyxmXyxK12aKu
	 pqFTo5jGtVZj4ki6YbfRKxrVpsMCSk7OWDcWV9wB1p6HvbB+ugsrJyC1zWubsbLGyz
	 Z7LKup9AHVqEuUgwQxJhlOITqNPQVlA4eaOVCKFIIKnBAgW15ysu38EMk3Ad1WEy64
	 5xY4n8XolVaK/OKVkmhNZcAzsruq24DVoYf/tpPFWF1banf9NdzZF/wakuVr/WMdPX
	 WcE+QdoB0oEOvK/1+TR/TD7s5ZWTjMJEPU2f8C2mhVWA7bucdZ2LG2/N7pYGi0tJ/d
	 GK2e1txNaqwjg==
Received: from IcarusMOD.eternityproject.eu (unknown [100.64.1.21])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id B5B5117E0A27;
	Tue, 17 Nov 2026 15:26:49 +0100 (CET)
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
To: Jassi Brar <jassisinghbrar@gmail.com>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 Houlong Wei <houlong.wei@mediatek.com>, 
 Roman Vivchar <rva333@protonmail.com>
Cc: linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org
In-Reply-To: <20260907-6572-gce-v2-0-412a5b037290@protonmail.com>
References: <20260907-6572-gce-v2-0-412a5b037290@protonmail.com>
Subject: Re: [PATCH v2 0/3] MediaTek mt6572 GCE support
Message-Id: <179492560991.199072.1968120807944596875.b4-ty@b4>
Date: Tue, 17 Nov 2026 15:26:49 +0100
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.16.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261117_062652_708628_0F3E5B9E 
X-CRM114-Status: GOOD (  11.37  )
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

On Mon, 07 Sep 2026 21:03:04 +0300, Roman Vivchar wrote:
> This patch series adds support for the Global Command Engine found in
> the mt6572 SoC.
> 
> Notably, the patch 2 introduces legacy ISA format, which is used on
> mt6572, 6582 and 6592 SoCs. mt6577 doesn't have the GCE at all and
> mt6595 is much more close to 6795/8173.
> Patch 3 adds mt6572 platform data and legacy_isa forwarding to the
> instruction JIT.
> 
> [...]

Applied to v7.4-next/soc, thanks!

[1/3] dt-bindings: mailbox: mediatek,gce-mailbox: add mt6572
      commit: 7cb447b0f02bfc4a7c7446c4ee5c7a4fae494ea6
[2/3] soc: mediatek: cmdq-helper: add legacy GCE ISA support
      commit: 381549f189b46daff657f20575d9c46dc0b8ec2e
[3/3] mailbox: mtk-cmdq: add mt6572 support
      commit: 51dba4c52a1f7c242e9ce73187ec69254171d77f

Cheers,
Angelo



