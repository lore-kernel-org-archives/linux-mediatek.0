Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 62A57C4345F
	for <linux-mediatek@archiver.kernel.org>; Mon, 22 Apr 2024 10:29:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:Resent-From
	:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=5hLiM/CT/OocTQ3y6fLOr0KCYjsRizag6LTe1e1zo0Q=; b=QPsAHV8Kj/PeOYjtfiURpB2qp7
	uaVwcz2aEaw//2Hejwh4VcMZ1BYq6qdcGvSA1Ea5//sDG3IDII4Vi2UXxneqFo0IdpTJO/e89ZtSP
	FH5/a50m5Y5H3gex1B6u+xlSv0bgWejlJKAgxYQTNktjtRMpWxDkxWV7U/m2TVH65yVc+VmH+BNRC
	mor36KgUkv/EOPw2kYBNgwqMGHQCAL8EFEPq/LkI6KUI/2KMsFBwDbmzHK4D36j5c/YE0T+iy0rzV
	S1kx+3MInzSR/xNDQg6fyqbFa+A56Az9lOGBnXpVP2sz3bittezyBEda3/K689X+hMJWYgKthOKDR
	kTr7+lCA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1ryqv2-0000000D9QA-3gsj;
	Mon, 22 Apr 2024 10:29:04 +0000
Received: from madrid.collaboradmins.com ([46.235.227.194])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1ryquy-0000000D9PK-2hom;
	Mon, 22 Apr 2024 10:29:02 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1713781738;
	bh=DHt+L1NZgy2bz/kCHKVwRnwZpxMBqGkS0kyobZTAHeA=;
	h=Date:Subject:To:References:From:In-Reply-To:From;
	b=aXHYYZ4n2PiIuiChBeoJeEfCMfT/QNK987vorDIA78bQqXUhIyTLyZyDlZPzvqE04
	 8MR3QgZQu6+dUJ/j4jNL1oHHTrsXuk2GA9+47GN/r3vli/dxS1f8CWfuO9Vf1FCe0s
	 UfG7Vo8SycXv3+ezVU6wAryDzwHjYbGjS3g4Z7QLGdLYVU2cuWeFRkTbqKKpya0K2W
	 m686bRCG0E/zvhT5x0ltlqjrH2WaFgp2VxurJoFRHA1Vxv5v9pCUb5+MS8yF+ENPdb
	 vePgyVWRfcmTC0SYJpX3mI5r/v9UeniWwyLadVY7MGAaHlsedM9F8MfCBP3IexO1pE
	 Ycb1sDFYsxt3A==
Received: from [100.113.186.2] (cola.collaboradmins.com [195.201.22.229])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by madrid.collaboradmins.com (Postfix) with ESMTPSA id 4F7313780C22;
	Mon, 22 Apr 2024 10:28:58 +0000 (UTC)
Message-ID: <03e285d1-f718-453f-b5c7-57cc3fd01afc@collabora.com>
Date: Mon, 22 Apr 2024 12:28:57 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] cpufreq: mediatek: Add support for MT7988A
To: Daniel Golle <daniel@makrotopia.org>,
 "Rafael J. Wysocki" <rafael@kernel.org>,
 Viresh Kumar <viresh.kumar@linaro.org>,
 Matthias Brugger <matthias.bgg@gmail.com>, linux-pm@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org
References: <acf4fb446aacfbf6ce7b6e94bf3aad303e0ad4d1.1713545923.git.daniel@makrotopia.org>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Content-Language: en-US
In-Reply-To: <acf4fb446aacfbf6ce7b6e94bf3aad303e0ad4d1.1713545923.git.daniel@makrotopia.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240422_032900_957402_B49198FA 
X-CRM114-Status: UNSURE (   7.87  )
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

Il 19/04/24 18:59, Daniel Golle ha scritto:
> From: Sam Shih <sam.shih@mediatek.com>
> 
> This add cpufreq support for mediatek MT7988A SoC.
> 
> The platform data of MT7988A is different from previous MediaTek SoCs,
> so we add a new compatible and platform data for it.
> 
> Signed-off-by: Sam Shih <sam.shih@mediatek.com>

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>



