Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DD90CC77B7C
	for <linux-mediatek@archiver.kernel.org>; Wed, 10 May 2023 21:16:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Date:To:Cc:From:Subject:
	References:In-Reply-To:Content-Transfer-Encoding:MIME-Version:Content-Type:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=L3nRoWUVzN0fKUzdg5O+f8QWLbxPBkVlKc/rBCupCKE=; b=2oskw5swvRQ/2VAM2iiBsJaMed
	Lh898iZmhveHbzXm2OJhYnavUURZhaA6SHbw5dcJDNqAoo99Z5haEoEtlbBteZnELQvDYHoC3T9He
	cDgN1M7PCpMgF+r49qO9uHM1KTa7y50kNkLKQzTs6D/iSfQdVaBmE6pR9qj+rTc/h4pvU8ZX1xj3V
	E7U3PEfkpvLV7nIPR/xl8sHG52OTYH35Uj9wD8VyNLd4wZtlmQco1Av3mdPkZV12KZaqROHW0e7Wn
	eXKQKF5iB6LnW+G90hJyaYJgeu31tNfeUUine4D1qTZsnB8kKYvH39b5ixbHaUdUSlPYjn1s/XY9w
	pn9/XY0g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pwrAZ-0072JT-2h;
	Wed, 10 May 2023 21:16:19 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pwrAW-0072Ij-2d;
	Wed, 10 May 2023 21:16:17 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 3289A61363;
	Wed, 10 May 2023 21:16:16 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8A17DC433EF;
	Wed, 10 May 2023 21:16:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1683753375;
	bh=L3nRoWUVzN0fKUzdg5O+f8QWLbxPBkVlKc/rBCupCKE=;
	h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
	b=AeBdk7h4G1J77K+qyLd4jfrjhvrtpD0LZVipsVWZ2/Muf6SsizKRgY+VQeED0HZ1+
	 16yWMdCEuRxn7hvGiFPxK6TvZv5ONBKRmaH3j5fySv3MszQb29k9M6xSFEKjw+yV8j
	 LdC5uG3MfewYzosxY740uYQPDatYdFabJpqkYtUnpi2AUsnxiaZq4+bcJMVxnEwpzO
	 pX49XU26A/iqdAnmWnDB83Hfv3YpjNpjiLBZ4oL71p1vmnnpEoNGxt184AfOXjcZ+o
	 zNwLKKxZSJb6FNgwJC8tFHf4kfp9vZJuPqHhaYZV+HQIavXBWQpDLTEI9EeqL1oaAS
	 bG6qf8g1R4mOg==
Message-ID: <d529c118cf8f3db47d2111837ad3a3e1.sboyd@kernel.org>
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20230421111125.2397368-1-wenst@chromium.org>
References: <20230421111125.2397368-1-wenst@chromium.org>
Subject: Re: [PATCH] clk: mediatek: Enable all MT8192 clocks by default
From: Stephen Boyd <sboyd@kernel.org>
Cc: Chen-Yu Tsai <wenst@chromium.org>, Matthias Brugger <matthias.bgg@gmail.com>, AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, =?utf-8?q?N=C3=ADcolas?= F . R . A . Prado <nfraprado@collabora.com>, linux-kernel@vger.kernel.org, linux-mediatek@lists.infradead.org, linux-arm-kernel@lists.infradead.org, linux-clk@vger.kernel.org
To: Chen-Yu Tsai <wenst@chromium.org>
Date: Wed, 10 May 2023 14:16:13 -0700
User-Agent: alot/0.10
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230510_141616_891441_9D570CAC 
X-CRM114-Status: GOOD (  10.92  )
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
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

Quoting Chen-Yu Tsai (2023-04-21 04:11:25)
> Currently the base MT8192 clock drivers are enabled by default, but all
> the other clock drivers need to be enabled by hand. This is extremely
> confusing and inconvenient for end users. For the MT8192 platform to be
> useful, most if not all the clock drivers driving the hardware blocks
> need to be enabled.
>=20
> Enable them by default whenever MT8192 base clock driver is enabled.
>=20
> Signed-off-by: Chen-Yu Tsai <wenst@chromium.org>
> ---

Applied to clk-next

