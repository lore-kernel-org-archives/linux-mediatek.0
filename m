Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 43DC2CF31A9
	for <linux-mediatek@archiver.kernel.org>; Wed,  2 Oct 2024 09:35:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Date:Message-Id:Subject:References:In-Reply-To:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=G79XQil3brSkV4vdBoy5ruU8xGFF6Ty4NnMRSCyxIcA=; b=PRVWkHZsXCZtktTVBpir4409iZ
	X9tg6yyx5HphRKjoT9/LT0UMYf13ZA8Gde2aWpkq6LBuM1K6I8BykRq6Z6/x7Oe0DbHMFq3IYLQKv
	AgOR6uQx8CTg7Q7WIQiQ0EL0C9/5r/DoafAR1zqwEg4mozZTar4wWdcPT1VqaJvzLUk/7t2F2P4h+
	Kbq+CVOtrsZfgj1IStQs4wUySPok/soX3I43TP3zx5DUwQdk3CetIHWt4smXb9fVrMszu5bKnu85P
	FUDgh76ENEjFT4DoDm+dDe6+LGGlKLihZkR9N20+biYorCJ6LIV5seDQglMhETs6acs6RiAg15Gog
	idgS/4HA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1svvld-00000005MEf-1FbN;
	Wed, 02 Oct 2024 09:35:33 +0000
Received: from bali.collaboradmins.com ([2a01:4f8:201:9162::2])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1svvjc-00000005Lce-0Cqx;
	Wed, 02 Oct 2024 09:33:29 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1727861606;
	bh=9UNSrYUYZixLR+dbvzU2+reeNrx287LANg9DBYW9CTk=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=m3baZz16WDi3Y13FNPwGjJhvKPpDwJM9tehDnjzEm/mLzd/fL9KKuhuR3GcuWCHEG
	 V1LJUON8Rt/gXA+CA/+g1AjU4Z96fLkXmxCcKjoGwv1wO2kClm6Dv2PHZS1VhMo+Z5
	 4l38PAkjCRJZF2yAkGWsFR4m4jWD+Te3Mmpl6+0BjnAgc+QDp16FbHMPGcOcuB285Y
	 DSoQrybIqd6CWmqwfoxvflZF2yDsHfyI9QOTWriyt+CZd2VO00hcJQxOODetBpjsrZ
	 LtnbyWgkrm5FsyHxDxfQGj7PAYHUmsLtvPUJdpqBUMK4YkouenSaaYUBbP4COvGB1m
	 Gw190fwBJchYQ==
Received: from IcarusMOD.eternityproject.eu (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 3C6AB17E11F6;
	Wed,  2 Oct 2024 11:33:26 +0200 (CEST)
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 Pablo Sun <pablo.sun@mediatek.com>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org
In-Reply-To: <20241002022138.29241-1-pablo.sun@mediatek.com>
References: <20241002022138.29241-1-pablo.sun@mediatek.com>
Subject: Re: (subset) [PATCH v3 0/6] Enable Mali GPU on MediaTek Genio 700
 EVK
Message-Id: <172786160619.39477.3697338680534899940.b4-ty@collabora.com>
Date: Wed, 02 Oct 2024 11:33:26 +0200
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.14.2
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241002_023328_268465_3C0FD91D 
X-CRM114-Status: UNSURE (   7.71  )
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

On Wed, 02 Oct 2024 10:21:32 +0800, Pablo Sun wrote:
> This series is based on linux-next, tag: next-20240927
> 
> Enables the GPU on mt8390-genio-700-evk.dts.
> The panfrost driver probed with dmesg:
> 
> panfrost 13000000.gpu: clock rate = 390000000
> panfrost 13000000.gpu: mali-g57 id 0x9093 major 0x0 minor 0x0 status 0x0
> panfrost 13000000.gpu: features: 00000000,000019f7,
>   issues: 00000003,80000400
> panfrost 13000000.gpu: Features: L2:0x08130206 Shader:0x00000000
>   Tiler:0x00000809 Mem:0x1 MMU:0x00002830 AS:0xff JS:0x7
> panfrost 13000000.gpu: shader_present=0x10005 l2_present=0x1
> [drm] Initialized panfrost 1.2.0 for 13000000.gpu on minor 0
> 
> [...]

Applied to v6.12-next/dts64, thanks!

[1/6] arm64: dts: mediatek: mt8188: Fix wrong clock provider in MFG1 power domain
      https://git.kernel.org/mediatek/c/4007651c
[6/6] arm64: dts: mediatek: mt8390-genio-700-evk: Enable Mali GPU
      https://git.kernel.org/mediatek/c/0158b773

Cheers,
Angelo



