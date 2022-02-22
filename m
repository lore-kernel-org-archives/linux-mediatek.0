Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D0C64C433EF
	for <linux-mediatek@archiver.kernel.org>; Tue, 22 Feb 2022 19:18:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Mc5L5I4Lh2b9E+I3sdXePu836d6PUMxGUJCkJBOMTHE=; b=O9fZCWt+lb3Nef
	KO3GwvoD74ulNDyiBgQB+k3NI/hPnPlFCcsJN/Wu+IWyHs1ucJT/YmFpM6khbRGLr2DEULe0dV0wB
	WTx0sHw39Jw3iWWbA55kAzEcBBAcdYMysNkB4g/wbmUn04ffCpUtsh9kyE6rFEbiCdtQUvPK4lJZ6
	fOZNSR3JE+CWBbXid75Lju4KR4Tbg3StCCWZQqOxwwRPs04GdILckpF2IlhANtpXbKwvLl0JGq47D
	kG+aCFZck0R1lrI5f1jpxfhtfAX3Db6VU3/WiUnhPIpPhm/nvRmylzMS3CgYC38rmRkVFhQ6hsBom
	FJQhWCNKeSoCE1kcPm9w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nMagH-00BJWf-AA; Tue, 22 Feb 2022 19:18:37 +0000
Received: from bhuna.collabora.co.uk ([46.235.227.227])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nMag6-00BJTi-0X; Tue, 22 Feb 2022 19:18:27 +0000
Received: from [127.0.0.1] (localhost [127.0.0.1])
 (Authenticated sender: nfraprado) with ESMTPSA id 792E81F431AB
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1645557501;
 bh=7gNHJrZ5EwByIe0R/xxYFVcCgcfa0IAq7r7XiBqEYi8=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=ggmXmTOEqSRBCP/en1qcyXWnO3jz/SjDs3eT0sTKwwcsZ4SmJW/PGndoJjruIE5oQ
 P8Bn5K9zV0KU/7udgF7VbFaLH2P0hE1XdvRkx3fXERvPL/r//7J3QZfIYF03RjLrCr
 spWFeW0gdP1NLrcNDmTYfRD3EHLfO1/JmfTd7LM+17yOWn1BiH4Pqj1GPqOxMtFpuQ
 O1R1aV7DR26YedBgR1Vb0dXl+zXo/8ysWNc4AxiqqXhRuqeYVmvQ3wRTBBwblzvaPi
 QoqJT7QYNjtu7UUbbrfxx4ZNnkEIxu5nqE0Fa7uBOeMyn6q90uAfR+lzH7NGRPdGGS
 mjq87HI8HB9BA==
Date: Tue, 22 Feb 2022 14:18:16 -0500
From: =?utf-8?B?TsOtY29sYXMgRi4gUi4gQS4=?= Prado <nfraprado@collabora.com>
To: Allen-KH Cheng <allen-kh.cheng@mediatek.com>
Cc: Matthias Brugger <matthias.bgg@gmail.com>,
 Rob Herring <robh+dt@kernel.org>,
 --to=Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>,
 Project_Global_Chrome_Upstream_Group@mediatek.com,
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, linux-mediatek@lists.infradead.org,
 Chen-Yu Tsai <wenst@chromium.org>, Ryder Lee <ryder.lee@kernel.org>
Subject: Re: [PATCH v2 01/23] arm64: dts: mt8192: Add power domains controller
Message-ID: <20220222191816.fwxw2zxzbxe65qov@notapiano>
References: <20220218091633.9368-1-allen-kh.cheng@mediatek.com>
 <20220218091633.9368-2-allen-kh.cheng@mediatek.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20220218091633.9368-2-allen-kh.cheng@mediatek.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220222_111826_193650_34675580 
X-CRM114-Status: UNSURE (   6.80  )
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
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On Fri, Feb 18, 2022 at 05:16:11PM +0800, Allen-KH Cheng wrote:
> Add power domains controller node for SoC mt8192.
> =

> Signed-off-by: Allen-KH Cheng <allen-kh.cheng@mediatek.com>

Reviewed-by: N=EDcolas F. R. A. Prado <nfraprado@collabora.com>

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
