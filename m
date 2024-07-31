Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 808EAC3DA64
	for <linux-mediatek@archiver.kernel.org>; Wed, 31 Jul 2024 08:20:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Date:Message-Id:Subject:References:In-Reply-To:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=1VBbC48pWLPQSIElVzx5CEv4C1CqgS+AJ/KHZrsXmRk=; b=bdj8oc0SQeixcyWRZMmotzeSVM
	Jpplto7eKgviP0pB7Nf1onV2hbGJhLfncMb+BDVuC785VoHsJTfmM8m9g5RnqmD3fAmMu8bngzY87
	3anxEzqSUYFhxbpXQdFOdSdj2JY5YC7BbjsCKdxfi7Nj3EOFymx2OQX2VbHxcqYFVBm0Qt4PyWZRO
	V8vV4OTws00h7i0r7IqoFBBsoLYF975GrtHw74uq1MxqM3h8wGYCVtfPqdJNITOkejEVAMBYh7R72
	L37EpO2BlROErjBf+06XPmiEdIVC16WRIWBovV1ycl6xEzw8t49NW3dxlQWwefbE3yDpGKUbNFwyu
	OZdCKKRA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sZ4ZG-00000000IDW-0YGg;
	Wed, 31 Jul 2024 08:20:18 +0000
Received: from madrid.collaboradmins.com ([46.235.227.194])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sZ4Ym-00000000I7F-05VW;
	Wed, 31 Jul 2024 08:19:49 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1722413984;
	bh=KLZUCxzeOJ7bmWokWFva6t7JItSJeH9Na9Ou99VElKo=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=pXEd/Tc/d44O5iXg1PN+3/mP91j0XIABoTKN5Ng/BuNkTB6sdOo0og8Lj1RHQPw5k
	 TIuW9bQseNthbgIPNxWLP2yd6ppMfQOifVUkUF0KxAlHggs1K2ASm6WIAEBZqB06Hr
	 OUi+6dJyYYTvU0rRYEYE57U9tO+M6VdwjDu5uplHuCF6QdGyKR7/I1L/vFyLqVk0li
	 O5nyaO3D31cUpLyQvf8Ke7Z8I6Erehzxvv0cJTwjoU2SHD0Es3GbrmUEzqRypFCISW
	 D/wTwC1NGEs8TQrjmI3UevVs+oV/f8qf8KdrLTTeUUXZwoB7Iuf3OVBceU7EF8iRgH
	 nnfq6+icpUiuA==
Received: from IcarusMOD.eternityproject.eu (cola.collaboradmins.com [195.201.22.229])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by madrid.collaboradmins.com (Postfix) with ESMTPSA id 2A011378000B;
	Wed, 31 Jul 2024 08:19:44 +0000 (UTC)
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
To: Matthias Brugger <matthias.bgg@gmail.com>, 
 Chen-Yu Tsai <wenst@chromium.org>
Cc: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org, 
 =?utf-8?q?N=C3=ADcolas_F_=2E_R_=2E_A_=2E_Prado?= <nfraprado@collabora.com>
In-Reply-To: <20240731034411.371178-1-wenst@chromium.org>
References: <20240731034411.371178-1-wenst@chromium.org>
Subject: Re: [PATCH 0/3] arm64: dts: mediatek: mt8195: Fix and clean up
 xhci1
Message-Id: <172241398409.37591.6997026723129845017.b4-ty@collabora.com>
Date: Wed, 31 Jul 2024 10:19:44 +0200
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.13.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240731_011948_229263_97F294D9 
X-CRM114-Status: UNSURE (   8.46  )
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

On Wed, 31 Jul 2024 11:44:07 +0800, Chen-Yu Tsai wrote:
> This series fixes and cleans up the representation of xhci1, whether
> used in USB 2.0 only or USB 2.0 + 3.0 designs. This work is a result
> of discussions from the original Kernel CI report [1] on xhci1 failing
> to probe, and subsequent patches [2][3].
> 
> Patch 1 explicitly disables USB 3.0 on the Cherry design. The super
> speed pairs are used for PCIe instead.
> 
> [...]

Applied to v6.11-next/dts64, thanks!

[1/3] arm64: dts: mediatek: mt8195-cherry: Mark USB 3.0 on xhci1 as disabled
      commit: 09d385679487c58f0859c1ad4f404ba3df2f8830
[2/3] arm64: dts: mediatek: mt8395-nio-12l: Mark USB 3.0 on xhci1 as disabled
      commit: be985531a5dd9ca50fc9f3f85b8adeb2a4a75a58
[3/3] arm64: dts: mediatek: mt8195: Assign USB 3.0 PHY to xhci1 by default
      commit: fe035fa6f56c5b8146fcfe4253edbb9e9399ce2d

Cheers,
Angelo



