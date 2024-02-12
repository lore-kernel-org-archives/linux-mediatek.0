Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 00653C4829B
	for <linux-mediatek@archiver.kernel.org>; Mon, 12 Feb 2024 10:24:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Message-ID:In-Reply-To:Date:References:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=OApYkGg25CGtTurxm1VIKUgdxbO6Np5VXQc0RbFGgw4=; b=jtv+sY1/sNDgiKLYz4La9bW7Mi
	Que0XW9gvbq7J6tX01bO4GXsIhfpt6JsFVIqefYbDhkQ/RAElEb1TlVH2mVJGpmTyrZFo/s2eTvYj
	0EcinbLUdsF8RGmk8/X+EAOroeSJKHsB+4yyvMm18UkaLXVaL9+d79PxoS3r99/nXwbJcsMA/rSSn
	LzSKzc5aOJD9TluxsK1iYDxIFeukyfMI4t2v/v9FozE46FdJIbbsYYonHy4injGoftn58RndqtE8p
	J+vGNLnQ+kQzRN3Azhmk9fkcUDnapzA/sMIqyIhxiZmSzCdJOweKHmvmHP2YzxzwtMQnaQHXa2Uut
	30TSW4aQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rZTUT-00000004rW2-29fs;
	Mon, 12 Feb 2024 10:24:45 +0000
Received: from sin.source.kernel.org ([2604:1380:40e1:4800::1])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rZTUQ-00000004rUW-29uz;
	Mon, 12 Feb 2024 10:24:44 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id 2C660CE0E13;
	Mon, 12 Feb 2024 10:24:40 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EC151C433C7;
	Mon, 12 Feb 2024 10:24:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1707733479;
	bh=OApYkGg25CGtTurxm1VIKUgdxbO6Np5VXQc0RbFGgw4=;
	h=From:To:Cc:Subject:References:Date:In-Reply-To:From;
	b=nCZKvqPIm8CDlFuo0UlnnqqemTZx3DK7vgsPkqR3Vgl96gu0NAE1GRNrfqtdpv37i
	 SbsQ8dpYqhsIZwA5K3DNw0QH+BMbVt4qg2uBZU20uBKj1YnRq1RwugzhkGRlqUwXMu
	 2pvRJ8a0tFoetYoD13o+HkTo8Hg9hKjRU7UDRW68qxROw/1qmjWVZpRKvN7CnlAFRC
	 w+vCPMHUHdBAl+7gRmvxlr9QiFm08hPaFESmsKX9xb0scM/39PF6JwvPw97SkFswN5
	 vHx1Ggll/bsPcAfkaOczC8FCBlXF75T6TJweePhr/JpgzTD+V4kf82MOgqa0FCdnjD
	 p6nX3dfNcywVw==
From: Kalle Valo <kvalo@kernel.org>
To: =?utf-8?Q?Rafa=C5=82_Mi=C5=82ecki?= <zajec5@gmail.com>
Cc: Peter Chiu <chui-hao.chiu@mediatek.com>,  Felix Fietkau <nbd@nbd.name>,
  Rob Herring <robh+dt@kernel.org>,  Krzysztof Kozlowski
 <krzysztof.kozlowski+dt@linaro.org>,  Conor Dooley <conor+dt@kernel.org>,
  Lorenzo Bianconi <lorenzo@kernel.org>,  Ryder Lee
 <ryder.lee@mediatek.com>,  Shayne Chen <shayne.chen@mediatek.com>,  Sean
 Wang <sean.wang@mediatek.com>,  Matthias Brugger <matthias.bgg@gmail.com>,
  AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
  linux-wireless@vger.kernel.org,  devicetree@vger.kernel.org,
  linux-kernel@vger.kernel.org,  linux-arm-kernel@lists.infradead.org,
  linux-mediatek@lists.infradead.org
Subject: Re: [PATCH v4] dt-bindings: net: wireless: mt76: add interrupts
 description for MT7986
References: <20231221032648.641-1-chui-hao.chiu@mediatek.com>
	<03d80cad-b72b-44d7-b726-cd8e3d4f81a9@gmail.com>
Date: Mon, 12 Feb 2024 12:24:34 +0200
In-Reply-To: <03d80cad-b72b-44d7-b726-cd8e3d4f81a9@gmail.com>
 (=?utf-8?Q?=22Rafa=C5=82=09Mi=C5=82ecki=22's?= message of "Mon, 12 Feb 2024
 08:20:56 +0100")
Message-ID: <87o7cmou8t.fsf@kernel.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/28.2 (gnu/linux)
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240212_022442_752598_937A128C 
X-CRM114-Status: UNSURE (   9.13  )
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

Rafa=C5=82 Mi=C5=82ecki <zajec5@gmail.com> writes:

> On 21.12.2023 04:26, Peter Chiu wrote:
>> The mt7986 can support four interrupts to distribute the interrupts
>> to different CPUs.
>
> Can we have this patch picked up, please? Felix? Kalle?

Felix has applied this to this tree:

https://github.com/nbd168/wireless/commit/26b98d08fda9ebef33c5eb3e1a6a14be6=
4358caf

--=20
https://patchwork.kernel.org/project/linux-wireless/list/

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatc=
hes

