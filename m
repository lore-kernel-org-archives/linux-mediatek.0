Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3CE37C54E58
	for <linux-mediatek@archiver.kernel.org>; Wed, 20 Mar 2024 15:32:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=/C7653718RlBdSg+k42d/NO73Wvgf5E+DZZfon0Ag+k=; b=dFnNJH39524CcwQn+u4TBJO54j
	34sNWc9A3jOOJVdrbgY5xMcFC1GwJnuBzf+AFN3IhNx89MNchk4irHaapJQ/tmnfpdOqI94O/GOxY
	8PLxhTXKl1BXq4BZEs0a7l4rxb4SbBPPaC6EgP3YrNlB/kKnTxJ2/2OhqGOQRg1SymU6HEMSZrxQA
	P+T9PZ1E/wTdsn3084Yso7cPxT+oSmTTUeCAIaZP66yMHs2H6St49SlsDXSNG6oRkSkJLFEJUqkao
	cem3FvuYaM7v1OZjEhuRTzE2TKWWtLIC6utC1BPnGRXNVQRI+Baa73OOwf2THZ2BxewkKkM6BbBoU
	5b2cZc5A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rmxvu-000000005qV-0RKU;
	Wed, 20 Mar 2024 15:32:56 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rmxvq-000000005pI-2vkB
	for linux-mediatek@lists.infradead.org;
	Wed, 20 Mar 2024 15:32:48 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 9266361000;
	Wed, 20 Mar 2024 15:32:45 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0B5AEC433C7;
	Wed, 20 Mar 2024 15:32:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1710948765;
	bh=gW3iHwL4OWAxkaSXv/fLpVs36bsMw/9vOSHOFPiRlUY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=ewTpx6kCQIMQuWQNuip44aS/k7lJIMqTiEj9UOPx43aH9Nd0OmHYWU+mOBZH8nVA9
	 dLoBXoNPNTIoOS1J9X+5BhUhI2VQI63jjqJoqStvODbguWvZyEVdxBvJi9FDx+Ws0P
	 7NvUjIpd3sdPb2G1LAxyDeP9nYMZvpSnfaDjFhG80+N/05JtXcWDdO+sLNObEUrOdo
	 YKDZcg23PY8q8whhdr0ZeLixnv/+R51kgnCDJstwzhdy1pRXA//dlLvJGvMlgu+DEq
	 2titbGOcS4MmYEiK2g8w+Uq98ns26ZqsvN9Akp9s6ZSg4PaZ5D29ky5USpA/JSNsL0
	 edkWAqRLvnMHw==
Date: Wed, 20 Mar 2024 10:32:42 -0500
From: Rob Herring <robh@kernel.org>
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@kernel.org>
Cc: Nicolas Pitre <nico@fluxnic.net>,
	Daniel Lezcano <daniel.lezcano@linaro.org>,
	linux-pm@vger.kernel.org, linux-mediatek@lists.infradead.org,
	devicetree@vger.kernel.org, Nicolas Pitre <npitre@baylibre.com>
Subject: Re: [PATCH v2 01/13] thermal/drivers/mediatek/lvts_thermal: retrieve
 all calibration bytes
Message-ID: <20240320153242.GA1760306-robh@kernel.org>
References: <20240318212428.3843952-1-nico@fluxnic.net>
 <20240318212428.3843952-2-nico@fluxnic.net>
 <7a529bd6-abac-42d0-980e-3b1b5c46946f@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <7a529bd6-abac-42d0-980e-3b1b5c46946f@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240320_083246_862465_1B2961CC 
X-CRM114-Status: GOOD (  12.66  )
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

On Tue, Mar 19, 2024 at 12:40:20PM +0100, AngeloGioacchino Del Regno wrote:
> Il 18/03/24 22:22, Nicolas Pitre ha scritto:
> > From: Nicolas Pitre <npitre@baylibre.com>
> > 
> > Calibration values are 24-bit wide. Those values so far appear to span
> > only 16 bits but let's not push our luck.
> > 
> 
> I wonder how much feedback you got on v1 - I didn't even look and will not lose
> time with that - but regardless, if you don't add the right people to the Cc field,
> I really don't think that you'll ever get your patches reviewed (and probably also
> not accepted).
> 
> That -- especially if you don't even Cc all the relevant maintainers...!
> 
> Please read:
> https://www.kernel.org/doc/html/latest/process/submitting-patches.html
> 
> P.S.:
> scripts/get_maintainer.pl lvts-8186-8188-patches.patch
> 
> "Rafael J. Wysocki" <rafael@kernel.org> (supporter:THERMAL)
> Daniel Lezcano <daniel.lezcano@linaro.org> (supporter:THERMAL,commit_signer:21/22=95%)
> Zhang Rui <rui.zhang@intel.com> (reviewer:THERMAL)
> Lukasz Luba <lukasz.luba@arm.com> (reviewer:THERMAL)
> Rob Herring <robh@kernel.org> (maintainer:OPEN FIRMWARE AND FLATTENED DEVICE
> TREE BINDINGS)
> Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org> (maintainer:OPEN
> FIRMWARE AND FLATTENED DEVICE TREE BINDINGS)
> Conor Dooley <conor+dt@kernel.org> (maintainer:OPEN FIRMWARE AND FLATTENED
> DEVICE TREE BINDINGS)
> Matthias Brugger <matthias.bgg@gmail.com> (maintainer:ARM/Mediatek SoC
> support,commit_signer:4/22=18%)
> AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
> (maintainer:ARM/Mediatek SoC support,commit_signer:13/22=59%)

> Alexandre Mergnat <amergnat@baylibre.com> (commit_signer:11/22=50%)
> "Nícolas F. R. A. Prado" <nfraprado@collabora.com> (commit_signer:10/22=45%,authored:7/22=32%,added_lines:128/453=28%,removed_lines:45/98=46%)
> Balsam CHIHI <bchihi@baylibre.com>
> (authored:4/22=18%,added_lines:235/453=52%,removed_lines:22/98=22%,in file)
> Chen-Yu Tsai <wenst@chromium.org> (authored:2/22=9%)
> Minjie Du <duminjie@vivo.com> (authored:2/22=9%)
> Frank Wunderlich <frank-w@public-files.de>
> (authored:2/22=9%,added_lines:72/453=16%,removed_lines:17/98=17%)

Please don't suggest to people that commit signers and authors are CCed. 
That results in huge Cc lists of people that probably aren't interested. 
If they are, then they should add themselves to MAINTAINERS.

Rob

