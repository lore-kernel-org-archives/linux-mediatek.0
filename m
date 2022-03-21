Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 447ACC433EF
	for <linux-mediatek@archiver.kernel.org>; Mon, 21 Mar 2022 12:07:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Zbglw/4mH2GncS3fpor8EJD/ghi+8qxdiJJ1+PYCYnA=; b=4hjZAv+VYRuauB
	iJNJEHFTqXrAmigtRWsG6yyYhYFmZ2PuGqqL6EY7L26A7D291YFuGeCmxqQPA273GZG39oAQ2J2k6
	YlH5BDP6JKsxHxnX3IcTOJ85S8xGzXt90nzjYRP6D+PhPAHD8u3C6WFZ88RgVvY0a0vtWRf/vKPJc
	1/iWhA5YbtqiDws9yBnRz+qfVi0M5jJwWgK7bW52dEaHV+8HNUBxpAZvj+HrYipdsWSqT+c3gBzxu
	T6G5fgNitfFBXvguJ47vEYNBdq5oKADjNgrzNnir0s0ii3xdUiE8c6i6zNH1DG4DlO/Jdu2BOPtFM
	JUaBlQgndcciIDCoJU6Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nWGos-007bQD-Sm; Mon, 21 Mar 2022 12:07:30 +0000
Received: from bhuna.collabora.co.uk ([46.235.227.227])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nWGm0-007a21-Ac; Mon, 21 Mar 2022 12:04:33 +0000
Received: from [127.0.0.1] (localhost [127.0.0.1])
 (Authenticated sender: kholk11) with ESMTPSA id 720F61F41AD2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1647864271;
 bh=UzxhOf2NhVKjRUYpiqce16Lewn7y1Fq5glhv2OeLnRI=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=S1ujJaUgfcPcVT1svHjJFXwnBa0jclPKigf6SUhmPASinSUOHOKDhxLkoA7cTZe/D
 AyUkn0A3KChC+EiYcerI+xXWfURoiYAu5m9ZadB5qNurY8JGYmVDIFj5N0a6apOjpO
 00m2P1powzR8SGz/iG4elrmtHiNd1pS93tImARfpSFWzrvDk++t0cJr2goxoZpFTRf
 algx/yDmtwZNwr4sAlzSYRzQkzFmUsSexNGKrKQi/mB2lcxqG+UFD8IDKM0hlaDtAy
 USzfcW8fCLmPFl08RgHJl8n2L8eSXiMxBDUeokg6TUFl7o/voBNXClFGhF00KqZ4O4
 NuPO2tislIkzw==
Message-ID: <64ab3cb0-1772-4538-5486-936601c51b30@collabora.com>
Date: Mon, 21 Mar 2022 13:04:28 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.1
Subject: Re: [PATCH v4 09/22] arm64: dts: mt8192: Add PCIe node
Content-Language: en-US
To: Allen-KH Cheng <allen-kh.cheng@mediatek.com>,
 Matthias Brugger <matthias.bgg@gmail.com>, Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
Cc: Project_Global_Chrome_Upstream_Group@mediatek.com,
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, linux-mediatek@lists.infradead.org,
 Chen-Yu Tsai <wenst@chromium.org>, Ryder Lee <ryder.lee@kernel.org>,
 Hui Liu <hui.liu@mediatek.com>
References: <20220318144534.17996-1-allen-kh.cheng@mediatek.com>
 <20220318144534.17996-10-allen-kh.cheng@mediatek.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
In-Reply-To: <20220318144534.17996-10-allen-kh.cheng@mediatek.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220321_050432_584618_AAAEE569 
X-CRM114-Status: UNSURE (   9.31  )
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

Il 18/03/22 15:45, Allen-KH Cheng ha scritto:
> Add PCIe node for mt8192 SoC.
> 
> Signed-off-by: Allen-KH Cheng <allen-kh.cheng@mediatek.com>

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>

> ---
>   arch/arm64/boot/dts/mediatek/mt8192.dtsi | 38 ++++++++++++++++++++++++
>   1 file changed, 38 insertions(+)
> 

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
