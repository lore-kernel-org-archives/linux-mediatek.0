Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7A473C3DA64
	for <linux-mediatek@archiver.kernel.org>; Tue,  6 Aug 2024 11:10:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Date:Message-Id:Subject:References:In-Reply-To:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=tldYjeD6HK9bxcPewewNG/XgAT3v0NaPxmuaG4zO1Ko=; b=bb7MFEOcfQv/lonx/u/qHXgIW3
	9lSx/+10BUHAG/QANa4Bulg2B8Js9XctyCzEahU2ZZ9V3j6M4UayptWL4iJusRvxM1Xz5N1D7DdBp
	twBsDaS/akzgNtYGaqEAdq/ZPkYOhFQ5Tn4FgRJICsBMObnJEzt1vrJkLpTZcFF4gFWpmow/qoWwJ
	420AxgvZsED/6X4QzG2cd9bTELXioC9AB3RxXcoL7epta+xMwMM1mYz3ds9/CQ68GSN0Tjkm/Bjye
	qEBwxDF7mnb+rnVOA0D55fShP2itjcXrWLYljNwnuRHVdVBr/J4H+T+QAsUBTIHr7dAKix62QoI53
	9uXiCoAg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sbI5i-00000001JMA-1Qbw;
	Tue, 06 Aug 2024 11:10:58 +0000
Received: from sender4-op-o14.zoho.com ([136.143.188.14])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sbI5Q-00000001JKR-0a0O;
	Tue, 06 Aug 2024 11:10:41 +0000
ARC-Seal: i=1; a=rsa-sha256; t=1722942636; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=c8k9o4I1y1cdLbRmlbfHGPW5WEuMiNw87gnTegnFS3PCN8DSi+ce9tRESQBV2dkZ2nNFTnQfqJYrYaQsx1O/Dx8WK2ibEF2zOJY4qVdpb/aQfNRsyUd64OJ70H0TeiK4BW0HG7ExGts7iJSbV6ffDed9dVl7/8l87Na/VIQgMv4=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1722942636; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=tldYjeD6HK9bxcPewewNG/XgAT3v0NaPxmuaG4zO1Ko=; 
	b=QPdiKFX+d0KJIe8be/OCSMB2W+pQzgmKS5cX2+/tutIA+u6qZdr8fhr+pAPzsFdFMFURNyBa2WBYvcIPrjDJd3O7K8snzlK/ciYR7NSyk7GD/MU1jWUzxIcedFE0HIYrKRn1gujauE8ynYUAX+sDI4arS9pgBzJ3qVFL/Xu2RHw=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=collabora.com;
	spf=pass  smtp.mailfrom=angelogioacchino.delregno@collabora.com;
	dmarc=pass header.from=<angelogioacchino.delregno@collabora.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1722942636;
	s=zohomail; d=collabora.com;
	i=angelogioacchino.delregno@collabora.com;
	h=From:From:To:To:Cc:Cc:In-Reply-To:References:Subject:Subject:Message-Id:Message-Id:Date:Date:MIME-Version:Content-Type:Content-Transfer-Encoding:Reply-To;
	bh=tldYjeD6HK9bxcPewewNG/XgAT3v0NaPxmuaG4zO1Ko=;
	b=Bu1tmmLJKycqTbsqWlfb1y8OozfcbVHAzzScDxR3k7dTCCY8VueULsUP3mpJCeo8
	r8zwZEllQXU85Bm/bGxJrZztDfeXvI31Uyd6seKhwSM91z2j5UBnh9F3c8z+QknVQ2F
	XCTj36mbY+bdAJsnkobMvdejrFUrPD51NtFiHjCE=
Received: by mx.zohomail.com with SMTPS id 1722942635898618.9204526741114;
	Tue, 6 Aug 2024 04:10:35 -0700 (PDT)
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
To: Chen-Yu Tsai <wenst@chromium.org>, Fei Shao <fshao@chromium.org>
Cc: Conor Dooley <conor+dt@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Matthias Brugger <matthias.bgg@gmail.com>, Rob Herring <robh@kernel.org>, 
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-kernel@vger.kernel.org, linux-mediatek@lists.infradead.org
In-Reply-To: <20240719045823.3264974-1-fshao@chromium.org>
References: <20240719045823.3264974-1-fshao@chromium.org>
Subject: Re: [PATCH] arm64: dts: mediatek: mt8186-corsola: Update ADSP
 reserved memory region
Message-Id: <172294263338.126161.6244258910224268535.b4-ty@collabora.com>
Date: Tue, 06 Aug 2024 13:10:33 +0200
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.13.0
X-ZohoMailClient: External
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240806_041040_271373_709BEDCC 
X-CRM114-Status: UNSURE (   7.84  )
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

On Fri, 19 Jul 2024 12:58:04 +0800, Fei Shao wrote:
> Corsola firmware reserves the memory region of [0x60000000, 0x61100000)
> exclusively for ADSP usage.
> But in fact, a 6 MB "hole" of [0x60A00000, 0x61000000) didn't get
> assigned to the ADSP node in the Corsola device tree, meaning no audio
> tasks can access and utilize that memory section.
> 
> Update the reserved ADSP memory region to fill the gap.
> 
> [...]

Applied to v6.11-next/dts64, thanks!

[1/1] arm64: dts: mediatek: mt8186-corsola: Update ADSP reserved memory region
      commit: d03521e6c18f62876b3b5c1fbf37e0d8ab9fd1b8

Cheers,
Angelo



