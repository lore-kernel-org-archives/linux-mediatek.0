Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 72C7DC2BD09
	for <linux-mediatek@archiver.kernel.org>; Mon, 24 Jun 2024 10:41:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Date:Message-Id:Subject:References:In-Reply-To:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=/GdSPwDLmf8WDEGrEz5YqxFj0VjBoVQG9FRX7BtJXbI=; b=IgI+1kuABUU5z1XktqzYI3aKSa
	f2+UKty9VnLEa89om2KYUbYRVbQ7ADFK9nTMZKVXRyOx1LmYOsGu6RjfTxybs8AsjWdV8nlJEUFpt
	5xwksY7GERcHNgO/yxVl54gXGWSLgvl02f0Io/I3jz0bipuRLpjWzI5lrs55gp8otPhAKg2woYN9/
	Vo1AM+O73h2DFh2J67luwZsyf1hFLXYWS8kmih7bXtV23RtNDfP+oNwzNXzJ3l0CrgUA28JSpd96J
	WIC/B50NI+HHAVc6fu1fyOaNWyqgF9LMPfNIX7vvFFQDqZcr/ZZA5nkGxnQEeA+DJ06Cy8G9n9zG5
	hrZnbAsQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sLh8r-0000000GSVf-378k;
	Mon, 24 Jun 2024 10:41:45 +0000
Received: from madrid.collaboradmins.com ([46.235.227.194])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sLh8l-0000000GSSz-02Op;
	Mon, 24 Jun 2024 10:41:40 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1719225695;
	bh=lRcWFdj1tPIGdt84c7U3m1iIUKW6+NWyO5+tcAGp/Qc=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=uYYshNpjF3He9y+T4oaG9biMebHHNRVnGGSme4yHnIttoAdHs6uGTX7h9XHAMyy3/
	 3kSPksIqTtLky1Vna8RZIQ0SP1qIdSXVkbU1FmxXYclk2Pb84AbNuyMjh8O9RpPNrn
	 YYiMy87Ukde8wp6eosuCKHGCsqutitFhqVePw3KqaPfD1ZUO2AsH/haa0qFDIB1WXK
	 qFosUzUlDUyLInpD1yp8f2gHH8zzdU5Loig9PIzP68dolCo5zTvF5XLpvkp2GU0TXX
	 7uG0FsbqVvcu2fn0GPUdhZjQePYz3S8OlBnbq2IX/U7CjLiq9HuaowoliwZnnPsXEM
	 KQUMdPbJZQDNQ==
Received: from IcarusMOD.eternityproject.eu (cola.collaboradmins.com [195.201.22.229])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by madrid.collaboradmins.com (Postfix) with ESMTPSA id 5533D378216A;
	Mon, 24 Jun 2024 10:41:35 +0000 (UTC)
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
To: Matthias Brugger <matthias.bgg@gmail.com>, 
 Chen-Yu Tsai <wenst@chromium.org>
Cc: devicetree@vger.kernel.org, linux-mediatek@lists.infradead.org, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Rob Herring <robh+dt@kernel.org>, 
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, 
 Conor Dooley <conor+dt@kernel.org>
In-Reply-To: <20240131083931.3970388-1-wenst@chromium.org>
References: <20240131083931.3970388-1-wenst@chromium.org>
Subject: Re: [PATCH] arm64: dts: mediatek: mt8183-kukui-jacuzzi: Add ports
 node for anx7625
Message-Id: <171922569527.118951.2617308405240923693.b4-ty@collabora.com>
Date: Mon, 24 Jun 2024 12:41:35 +0200
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.13.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240624_034139_253815_0EB48E15 
X-CRM114-Status: UNSURE (   8.13  )
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

On Wed, 31 Jan 2024 16:39:29 +0800, Chen-Yu Tsai wrote:
> The anx7625 binding requires a "ports" node as a container for the
> "port" nodes. The jacuzzi dtsi file is missing it.
> 
> Add a "ports" node under the anx7625 node, and move the port related
> nodes and properties under it.
> 
> 
> [...]

Applied to v6.10-next/dts64, thanks!

[1/1] arm64: dts: mediatek: mt8183-kukui-jacuzzi: Add ports node for anx7625
      commit: 96d95052915de95fd26e7a42322653078f19e3bb

Cheers,
Angelo



