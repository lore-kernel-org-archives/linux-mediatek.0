Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 48413C433EF
	for <linux-mediatek@archiver.kernel.org>; Mon, 21 Mar 2022 12:09:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=06jz5i7ZISg9kASQqhTrzW0io+bcd1dCmM+pdiUwIL0=; b=dbwbemLpZhnvH2
	MKa5KpBeykVOqaQPrWuTzamx62F1mAMMVzC0lHG61+kvVlhh7Uy7Pr8+D/jbjIyNQixpgWE41yPic
	Qhhr7R8k0yoSzUbKOl8Dd8xekw/FUBq6eHQdEm3V7JFuENHDCY2+jmdALF1kCt2SOwvxpD9jsEls/
	hzO9JCv1YqbmYNmDFbM9aCht8hiKw0US3/O3RFHJW73DYjuhmjQ9nhTF3YpBq36Ev147biItsUfjL
	550lfnSPStFFHf/z3d3n2it/kYEKUXrVDG7tfmYipuLWjWuXCEDvmo2acEd8pI6/NhOxtP+sCK716
	y8HMD4HNZWhzsLgmZCiQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nWGqU-007cFY-OI; Mon, 21 Mar 2022 12:09:10 +0000
Received: from bhuna.collabora.co.uk ([2a00:1098:0:82:1000:25:2eeb:e3e3])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nWGmI-007a8Z-56; Mon, 21 Mar 2022 12:04:51 +0000
Received: from [127.0.0.1] (localhost [127.0.0.1])
 (Authenticated sender: kholk11) with ESMTPSA id 664B51F41849
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1647864289;
 bh=lmrlQJ9djdppGyq+A3UlcSOYdy2Qdz/frLpm/cikP2E=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=ol3UOBmgbzQIxgG7b4jbZXD5kS42ICi7d2ZwTAi+8sf/8LkjIsz99svb2gvxAi2V1
 4F/aoSkKjgt34DklrfGgc3W73F5GTPUtniMlR9OOjB8A8Xt4HpL9RWuSJHDqUveRDy
 1vJ1Bwjh3TXKEglHp32WPz2aGCDLg+QbSskSc/un/1dgJMQ4E2O+Dp4MR+xM4hVLrO
 b0hJLLyNZezyPNTfxzMzabLy9XSeFooM6PR84jXLGgBVcP4L07w7ZgxoFpNsv6uQ4E
 n8fTN6C4uLy3r0JttVLZI5Q9p9EGBeOB4y1i/5kl7/D3QieDDu7eIiFmiLZdlBIqTE
 fJ65piVjo4BuQ==
Message-ID: <480fe795-1813-e5f7-fe1b-756d917e1fe0@collabora.com>
Date: Mon, 21 Mar 2022 13:04:46 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.1
Subject: Re: [PATCH v4 05/22] arm64: dts: mt8192: Add usb-phy node
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
 <20220318144534.17996-6-allen-kh.cheng@mediatek.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
In-Reply-To: <20220318144534.17996-6-allen-kh.cheng@mediatek.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220321_050450_391330_CBFCB01E 
X-CRM114-Status: UNSURE (   9.24  )
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
> Add xhci node for mt8192 SoC.
> 
> Signed-off-by: Allen-KH Cheng <allen-kh.cheng@mediatek.com>

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>

> ---
>   arch/arm64/boot/dts/mediatek/mt8192.dtsi | 22 ++++++++++++++++++++++
>   1 file changed, 22 insertions(+)
> 

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
