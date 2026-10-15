Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DFDF0CC6B33
	for <linux-mediatek@archiver.kernel.org>; Thu, 15 Oct 2026 14:45:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Date:Message-Id:Subject:References:In-Reply-To:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Cu+kqaxp2LTtL66kVYg1eFWIE3LmRxniGoxkUb1pV6Q=; b=Nwqq76K6GpHiblKsui4MROpXXP
	TkRac1LGXwtpfuPb/xrlpFkTn1+eMYQwvogEkwU1UsN4iyFpiTplPZB8N/1tj/JdZiEkd5iBGg+zm
	S4QU3cuzDNssGK52ClhYNMS4SAY5c5bqmL8/JOa/z9po5Dz6z2ZdkgvAdQc5vl0PQJIXHEAPpvUEp
	aROsSVtt/www1V7aShj9nwlrN7WuGc9odBo4oQC2v7PnaM23n0iA0QQKXs3TW7M+IHxbww5ZDa1VE
	kNBuqK07cjgZU+7FD3cYeO2qfwzHog2FzVzsvNwOnttm4aU1FCtDxc5EyjawaCBFtg5RsKmyeds5A
	Ce+mHFvg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xHMiA-00000000Qid-1H8d;
	Thu, 15 Oct 2026 14:45:38 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xHMi6-00000000Qi9-2IKM;
	Thu, 15 Oct 2026 14:45:36 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id EEA4E439EE;
	Thu, 15 Oct 2026 14:45:33 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 304AC1F000C4;
	Thu, 15 Oct 2026 14:45:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1792075533;
	bh=Cu+kqaxp2LTtL66kVYg1eFWIE3LmRxniGoxkUb1pV6Q=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date;
	b=A8KDxOcVlxsVPVeUTb9z6c3kNCv2Dr1lrWDr9l40cOoWUXL1Aa9evg1lXL0HZO/Zz
	 WJ4G1FmtHGdIq/yYXMZfJZqNjbt9NMUpVkN/vtR4Mzvfp5GKzKyrwAvEA453Qd7RpW
	 wP99QRrUSELooIlXaxd1eJvNM5QC1IenKNGjpIg+zB2LT2WeunlLmM1UJXSCo5WA7b
	 tyATQpPi99r6EB7JJg8bBX4cwJ1lBgWXeHKfDPeFIj7696IzdLwoN8rt3vtje0v0Gd
	 +YNvLWNOlpLLsoSztfgUpWU3yPeS6wL7TT0rhUUVmx10YQEsGxxMH8vU7g+oNU15gg
	 PK543lonFLSyA==
From: Lee Jones <lee@kernel.org>
To: Sen Chu <sen.chu@mediatek.com>, Sean Wang <sean.wang@mediatek.com>, 
 Macpaul Lin <macpaul.lin@mediatek.com>, Lee Jones <lee@kernel.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 Eddie Huang <eddie.huang@mediatek.com>, 
 Alexandre Belloni <alexandre.belloni@bootlin.com>, 
 Ryan Brue <ryanbrue.dev@gmail.com>
Cc: linux-pm@vger.kernel.org, mfd@lists.linux.dev, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, 
 linux-rtc@vger.kernel.org
In-Reply-To: <20260917-rbrue-suez-upstreaming-mt6397-rtc-nvmem-v1-1-558b8f95cfbc@gmail.com>
References: <20260917-rbrue-suez-upstreaming-mt6397-rtc-nvmem-v1-1-558b8f95cfbc@gmail.com>
Subject: Re: (subset) [PATCH 1/2] dt-bindings: mfd: mediatek: mt6397:
 describe the RTC's nvmem layout
Message-Id: <179207552993.2025354.8082190784295988343.b4-ty@b4>
Date: Thu, 15 Oct 2026 15:45:29 +0100
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Mailer: b4 0.16-dev-ad80c
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

On Thu, 17 Sep 2026 23:57:46 -0500, Ryan Brue wrote:
> Four of the MT6397 RTC's alarm registers use only their low bits; the
> high byte of each is storage the clock and the alarm don't touch.
> MediaTek's documentation names them RTC_NEW_SPARE0 to RTC_NEW_SPARE3 and
> assigns the first to a fuel gauge, which is what a battery driver reads
> at boot so that the reported capacity does not jump across a reboot.
> 
> They sit in the RTC's always-on domain, so the driver can offer them as
> a battery-backed nvmem provider. Allow a board to lay cells out over
> them.
> 
> [...]

Applied, thanks!

[1/2] dt-bindings: mfd: mediatek: mt6397: describe the RTC's nvmem layout
      commit: 3606288af5e8c09a14ab5b19e121feec75296354

--
Lee Jones [李琼斯]


