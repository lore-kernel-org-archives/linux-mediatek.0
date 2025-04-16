Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E5088C369BD
	for <linux-mediatek@archiver.kernel.org>; Wed, 16 Apr 2025 10:31:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Date:Message-Id:Subject:References:In-Reply-To:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=uSKli9psSweFenpFgv766SwvB6pSxSKceg7FY865wEw=; b=BXK9kcKSLmD2jrxODlgKpuOFx8
	eqhXK7Im4reUJnmxqAP+UPkqIMbUGj+dXLTtNebZSul8v3rHYSgUABc+psILWbjq/TJVQ3+EhjxHF
	TkVk5urpG/i7zzppnbz0O8LwRL+0bcUklMRCn+3m9jt4K4rdRQP03zdlaFtgk1WtdEJcTcnkCgzpJ
	TmsrPyJlKK8Q0OaG4pIOSUDNXlvqCCLd/J9Aryaz9l1eNg51foOgBqH7Bob97x+295VwiUP3EzPNt
	/w01e7056XdCSSh7lk+vk0kFHqZNGbe7fBktuTFsbgPLPaSKWRj3BmQRsqiKxaL4vrvBO/4bV318Z
	krn2wVEA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u502z-0000000992W-1G1X;
	Wed, 16 Apr 2025 10:31:13 +0000
Received: from bali.collaboradmins.com ([2a01:4f8:201:9162::2])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u4yH6-00000008qbd-2tiA;
	Wed, 16 Apr 2025 08:37:42 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1744792659;
	bh=SFK4utDb6BiPvIgZqYxn3f+Q+Jaf4K4/kobGg3X7CUw=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=IeoBFVwX2ltZCXPMVn+ySHACWJJN4sHulUsnvMqFYeug52ZWQgBfH2WbnZxmR9d04
	 /1vKBKB0h0NCMJ564QZM5UyiWP1ffShol2DM2etow3w6kbHjEd4SSm/x3b5w7jj/J+
	 QKal0lkL//mqk0ry87XcDDbQe274ek84fv0ZG7n7NFw6LlAGt3ECgBrVqH37LZYUv8
	 i55EIOMaXkiecMwDgl0zp/PW+JIA1PlBdY9+LwZV45CtgJ06KgQqPeFDhuTh5egiEf
	 /P5bkayrf74kuMHao7+9NbOrswg/gppmm52kVCPYjdV2pvrlQ70R6QLQAagZ1BIYZ1
	 evRUB+1sVE8AQ==
Received: from IcarusMOD.eternityproject.eu (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 5127C17E05F7;
	Wed, 16 Apr 2025 10:37:38 +0200 (CEST)
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
To: linus.walleij@linaro.org, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org, 
 matthias.bgg@gmail.com, sean.wang@kernel.org, linux-gpio@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, 
 kernel@collabora.com
In-Reply-To: <20250410144044.476060-1-angelogioacchino.delregno@collabora.com>
References: <20250410144044.476060-1-angelogioacchino.delregno@collabora.com>
Subject: Re: (subset) [PATCH v1 0/3] MediaTek Dimensity 1200 - Add Pin
 Controller support
Message-Id: <174479265826.19309.1291310983060738038.b4-ty@collabora.com>
Date: Wed, 16 Apr 2025 10:37:38 +0200
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.14.2
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250416_013740_901153_C56A3696 
X-CRM114-Status: UNSURE (   7.40  )
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

On Thu, 10 Apr 2025 16:40:41 +0200, AngeloGioacchino Del Regno wrote:
> In preparation for adding basic support for the OnePlus Nord 2 5G
> DN2103 smartphone, this series adds support for the pin controller
> of the MediaTek Dimensity 1200 (MT6893) SoC.
> 
> AngeloGioacchino Del Regno (3):
>   dt-bindings: pinctrl: mediatek: Add support for MT6893
>   pinctrl: mediatek: Add pinctrl driver for MT6893 Dimensity 1200
>   arm64: dts: mediatek: Add MT6893 pinmux macro header file
> 
> [...]

Applied to v6.15-next/dts64, thanks!

[3/3] arm64: dts: mediatek: Add MT6893 pinmux macro header file
      commit: c0f1fd9eeb317ee57b62127c8da48b309da0525d

Cheers,
Angelo



