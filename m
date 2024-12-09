Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7A7DBE77173
	for <linux-mediatek@archiver.kernel.org>; Mon,  9 Dec 2024 10:04:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=plYlB8hx13x2qWbK3QPcNqsZiP8Qs9xGsxe6mH2sBEo=; b=Tqci5rwhR22qe21eHalsVZMUFs
	CgX8iDOJNldnUzQ944WfvevBNarmxGpXjQ8koYbUAs+myyOVu3vXndRyz1X88fLpEq8ygSq0dn5pa
	/kFFKGVXWSmUoD8do1FkQRP3heXhWFUJpt/7e9BXXchbyphQNstdYUisiZxrlbH1LDNQVdnR40apD
	X8b1s+j9QIZoAaXRVWe7fSSrlLjIKI9uFqVntiuIBHx1nTE4R9yv0p5gvDlZLWGK/udtwNMz2NoTE
	HtmI1TSM3+qsvhmvBlD4iQnKP5Cq7oUH25CywOK7MOxCTjXYSP3WqVvpqFAT6O2b48Z5AoDNMFNnA
	3o4SlSsw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tKacl-00000007CmM-2xMq;
	Mon, 09 Dec 2024 10:04:19 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tKaPo-000000079OQ-0rSb;
	Mon, 09 Dec 2024 09:50:57 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 2999D5C5859;
	Mon,  9 Dec 2024 09:50:13 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 065D0C4CEE0;
	Mon,  9 Dec 2024 09:50:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1733737855;
	bh=zlE6YzHqonNnZTzFpaPhYq8EhMnagDX5FxmFg80dswc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=iHgxnPPtMCg+g/wB3jTZ2IQptQs7eux5/16ywS+TCnDJNg06oPKJ2WOIq8DCypeLB
	 TAYTmtMHn6VIbxA3/Pv0BFgA9Kuxjy59Yj3sP9W5ARjklVZnyIEF5fYHBdsO15X+z4
	 AjGc4L0XwTCWB4kYDGsLPhUP9ZrjA8xxt3XJNNRJCuxIorH1wi0w4k2ay1IwPhwDFt
	 gz/V8EbGoRGYKr6bav96DPbhXfm+eunbHeBkDONHY4P/Gop8HpnTGCrdeGhIBvzBjZ
	 50IMSxgEf1WngQScqBYXkw6Ep5z1er4CIAPO76NIDJd5ReQcvV67YmsK8eiit4SkBF
	 +5MLF16AKRYkw==
Date: Mon, 9 Dec 2024 10:50:53 +0100
From: Krzysztof Kozlowski <krzk@kernel.org>
To: =?utf-8?B?TsOtY29sYXMgRi4gUi4gQS4=?= Prado <nfraprado@collabora.com>
Cc: Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, Liam Girdwood <lgirdwood@gmail.com>, 
	Mark Brown <broonie@kernel.org>, Trevor Wu <trevor.wu@mediatek.com>, kernel@collabora.com, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, linux-sound@vger.kernel.org
Subject: Re: [PATCH 3/5] ASoC: dt-bindings: mediatek,mt8188-mt6359: Add DSP
 properties
Message-ID: <264jrfp646x4clus6yanbldqkfz6eao3wdveyokxkcbpqufopo@gpr4qacexemp>
References: <20241205-genio700-audio-output-v1-0-0e955c78c29e@collabora.com>
 <20241205-genio700-audio-output-v1-3-0e955c78c29e@collabora.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20241205-genio700-audio-output-v1-3-0e955c78c29e@collabora.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241209_015056_280847_B28DD033 
X-CRM114-Status: GOOD (  10.12  )
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

On Thu, Dec 05, 2024 at 09:13:56AM -0300, N=C3=ADcolas F. R. A. Prado wrote:
> Add the mediatek,adsp and mediatek,dai-link properties to allow
> describing the DSP configuration in the sound card node, as is already
> the case for other MediaTek SoCs.
>=20
> Signed-off-by: N=C3=ADcolas F. R. A. Prado <nfraprado@collabora.com>
> ---
>  .../devicetree/bindings/sound/mediatek,mt8188-mt6359.yaml      | 10 ++++=
++++++
>  1 file changed, 10 insertions(+)
>=20

This looks like conflicting (or applied) work.

Best regards,
Krzysztof


