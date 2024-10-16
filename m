Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D42EED1AD29
	for <linux-mediatek@archiver.kernel.org>; Wed, 16 Oct 2024 08:22:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Date:Message-Id:Subject:References:In-Reply-To:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=tvB6IeWzQ3ZIa3Y1DBHiWAUgTZsqrZ09Km3IkMVlUm8=; b=AIvPg5DGz2v4kV8/ZcIZWBbzFI
	j9ikn//pVrmTLj8lYGCk54flS6Z+9vTzjszoF7bzjXsdKr/LzET2Wj+T64t1n4j+sTVRPGVn7f1PN
	QeUm9A4U49uBeFAZeER0YDw/NEv2j9iUW9ShU2EwyhEuzDZXw48sLHAOAms39gsiHb1r7Unty9jG3
	TLDw8FAWLpqrylMUskF1mUHwVQnBcepXNHuDQm+6kdlNcPG3dX5exS1cQuVtqJXXTHk28INCNxDbo
	OrL9ZooY++t9CB/Y9whL+W1WAulS3dBQhDGrQJNtz1sHD2+38DrzhfPyRNPaaXbstVhG2ej83xK5/
	My0u1EMg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t0zIL-0000000B0Q9-2T3N;
	Wed, 16 Oct 2024 08:22:13 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t0z2T-0000000AwiQ-31TG;
	Wed, 16 Oct 2024 08:05:51 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 8A6C15C5A8C;
	Wed, 16 Oct 2024 08:05:44 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DEDE1C4CEC5;
	Wed, 16 Oct 2024 08:05:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1729065948;
	bh=sipAjpeBbrrp16bNbYnn0kiRQmETvkOf3Pt/RzvNzNQ=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=MkyQT3PtTV4YokJbpmI+HkLnZzOtaaiO2iDHzI8ShWFDueovgMkJWeC0epTAVMPTn
	 ep1sWBou6QL3nvaMk7gyPJK8xcqsIzhwAinHOm60Xbw1bUnTkXewq9aZChAeRfwQI9
	 8Wym6RmXNsVq0lUsTw4oG7zyS7za83Dy3+0GOD6UDOJboaXTxAGTY0/S7ETsuzYQvu
	 pZ4xAXaDlk0EkCW4Pr5H01XJ4q/TZI64k7aWAESDdVnx7Xpu1+Edrzfzv0R2N4n4Q5
	 vNiXLDBASTco0VfGmJLwtrjkIAfqdQO4KjjVFGW54pvxagHLTIv5iRiW+UaoDHiozJ
	 oHB9JpFuidbmA==
From: Lee Jones <lee@kernel.org>
To: Sen Chu <sen.chu@mediatek.com>, Sean Wang <sean.wang@mediatek.com>, 
 Lee Jones <lee@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 linux-pm@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-mediatek@lists.infradead.org, 
 Alexandre Mergnat <amergnat@baylibre.com>, 
 Macpaul Lin <macpaul.lin@mediatek.com>
Cc: Bear Wang <bear.wang@mediatek.com>, Pablo Sun <pablo.sun@mediatek.com>, 
 Macpaul Lin <macpaul@gmail.com>, Chris-qj chen <chris-qj.chen@mediatek.com>, 
 MediaTek Chromebook Upstream <Project_Global_Chrome_Upstream_Group@mediatek.com>, 
 Chen-Yu Tsai <wenst@chromium.org>
In-Reply-To: <20241004030148.13366-1-macpaul.lin@mediatek.com>
References: <20241004030148.13366-1-macpaul.lin@mediatek.com>
Subject: Re: (subset) [PATCH v2 1/2] dt-bindings: mfd: mediatek: mt6397:
 add adc, codec and regulators for mt6359
Message-Id: <172906594464.1151212.7462336994993240007.b4-ty@kernel.org>
Date: Wed, 16 Oct 2024 09:05:44 +0100
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Mailer: b4 0.13.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241016_010549_873291_A9A4CC26 
X-CRM114-Status: UNSURE (   9.00  )
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

On Fri, 04 Oct 2024 11:01:47 +0800, Macpaul Lin wrote:
> Since MT6359 PMIC has been added as one of the compatibles of
> "mediatek,mt6397.yaml", the sub-device node of "MT6359 PMIC AUXADC",
> "MT6359 Audio Codec"  and "MT6359 PMIC Regulators" should also be
> contained in this DT Schema as well.
> 
> This patch includes:
>  - add 'adc' property and $ref for 'mediatek,mt6359-auxadc'.
>  - add 'mt6359-regulator' to the compatibles of regulators.
>  - add 'mt6359-codec' to the compatibles of audio-codec.
> 
> [...]

Applied, thanks!

[1/2] dt-bindings: mfd: mediatek: mt6397: add adc, codec and regulators for mt6359
      commit: 5bcecfcaa6d1d4ea1b29082ed1fd077ba4cccb55

--
Lee Jones [李琼斯]


