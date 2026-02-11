Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 61DF2EB596B
	for <linux-mediatek@archiver.kernel.org>; Wed, 11 Feb 2026 06:33:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=XddYwKWvWxeFWm2+5c3Jwb+Tiu5ZT9PPFTcLqhLE0PQ=; b=az1E+49Xbq/+nDJh4ey9SgDp8k
	J/BWQOKMPASX2tK08ORZRtuEWGi+xkoWMUdAquTDa8ZI0qQ0cVyRuB5GODr5/GiBPAY9WBfqbZ5OE
	p4U+KQ+Rn5A0SJslvYvXOiuzB4rGb86yYxfOYQOodLx5hv81ZQ+prNbAZ8lHgR6ZLrwcJ5KsnCNoG
	Xqr9isiPWoPHWpFI39KOs64zCOhA4XO/xFN+CaoViSI7TTW+qlPKNkJVD++yZzTPj4IFuBc99Tdg5
	cOSCZsA4FUhCb1a75x3T1Ww2ywbd/Q/Vc6M6amHZlPxPGV1T86PMN3IjtDrbTR8GvGcDJiGDwM234
	SqQhhaew==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vq3nE-00000000IHi-0w6I;
	Wed, 11 Feb 2026 06:33:44 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vq3nB-00000000IH3-1YGF;
	Wed, 11 Feb 2026 06:33:42 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 01FEA43911;
	Wed, 11 Feb 2026 06:33:38 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 53300C4CEF7;
	Wed, 11 Feb 2026 06:33:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1770791617;
	bh=XddYwKWvWxeFWm2+5c3Jwb+Tiu5ZT9PPFTcLqhLE0PQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=bhKSoC6G5WlZEUdcANoPXq2fz5kud/Cq6WxKGkb6dZE+EWaCSnTF+L5Qh60jNPILd
	 k1HmeQj+di5yBVQQUlU5xiMeZDd9IOfF1GMVqSRl+6Am9t0edOy1bQyvyEPzNIzeMA
	 qS0KfxWDGuyo/FhHUXoF7cuXoejU++AnfpaJ2yPrJlquaRHKcOiDKMhNhG1FSzYIis
	 H7saib3OPyTwvo63AxAVqsL9X/o4+BASr54BUbUh2c1UqQK8GkyrtNhv5HyoI+TdXr
	 q98cGxMgP9KDN2yg9UZbRWrXzCpVQ2FHxwfpOkRb52ZK+NS6R6eFZF8u56JYAVytCP
	 yzErVmb+5egtQ==
Date: Wed, 11 Feb 2026 07:33:35 +0100
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Yunfei Dong <yunfei.dong@mediatek.com>
Cc: =?utf-8?B?TsOtY29sYXMgRiAuIFIgLiBBIC4=?= Prado <nfraprado@collabora.com>, 
	Sebastian Fricke <sebastian.fricke@collabora.com>, Nicolas Dufresne <nicolas.dufresne@collabora.com>, 
	Hans Verkuil <hverkuil-cisco@xs4all.nl>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, Benjamin Gaignard <benjamin.gaignard@collabora.com>, 
	Nathan Hebert <nhebert@chromium.org>, Daniel Almeida <daniel.almeida@collabora.com>, 
	Hsin-Yi Wang <hsinyi@chromium.org>, Fritz Koenig <frkoenig@chromium.org>, 
	Daniel Vetter <daniel@ffwll.ch>, Steve Cho <stevecho@chromium.org>, linux-media@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, 
	Project_Global_Chrome_Upstream_Group@mediatek.com
Subject: Re: [PATCH v3 01/14] dt-bindings: media: mediatek: vcodec: add
 decoder dt-bindings for mt8196
Message-ID: <20260211-premium-heavy-puma-bb8e7a@quoll>
References: <20260211054149.27249-1-yunfei.dong@mediatek.com>
 <20260211054149.27249-2-yunfei.dong@mediatek.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260211054149.27249-2-yunfei.dong@mediatek.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260210_223341_430831_96FEC76C 
X-CRM114-Status: UNSURE (   7.29  )
X-CRM114-Notice: Please train this message.
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

On Wed, Feb 11, 2026 at 01:41:28PM +0800, Yunfei Dong wrote:
> Add decoder document in dt-bindings yaml file for mt8196 platform.

Getting to bingo, two out of three redundant terms how to call DT
bindings. Drop YAML.

A nit, subject: drop second/last, redundant "dt-bindings". The
"dt-bindings" prefix is already stating that these are dt-bindings.
See also:
https://elixir.bootlin.com/linux/v6.17-rc3/source/Documentation/devicetree/bindings/submitting-patches.rst#L18

Write concise messages. "DT bindings schema yaml text file in kernel" is
not concise.

Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>

Best regards,
Krzysztof


