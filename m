Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A871FC3DA64
	for <linux-mediatek@archiver.kernel.org>; Tue,  6 Aug 2024 08:56:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Date:Message-Id:Subject:References:In-Reply-To:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=46FGarQ+Gb6fnnbVjZJzhYqZv+IqQ+GP8N0sis3nVXc=; b=PrsqeJP34m68OXg5xRbpl53QNU
	iNGusDeIsGzeOSRW0pYlf6N470WZAWriNBXJP5IuEk12xJaPwRev2/7gNHRbCx/kJTw9fjBU5OBCt
	tLtyrhBgBWoj4xw+ztqSkLbicWGL1p/+zx4UHhKVbqBB4vWY7LGky+1Cpo2TLvRQPTFlrEg/vv6Ly
	XPhge/nDV5PsthHK9F2zzOlOWsovck1i67L6RAOV7hXcjbA2wuz2EZ5AS8aMdGdcJRHjx3p57163y
	+ALvMKhY91xr6lEt1mYOLG/2Ty0yuGmCyVkM8iFO/+1sD5Rv78D7QmfwxeZ+CU2E7vBpF8YPYvBI2
	mYe2r3tQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sbFzd-000000011J7-1787;
	Tue, 06 Aug 2024 08:56:33 +0000
Received: from sender4-op-o12.zoho.com ([136.143.188.12])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sbFz3-00000001198-09dS;
	Tue, 06 Aug 2024 08:55:58 +0000
ARC-Seal: i=1; a=rsa-sha256; t=1722934555; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=IeG5P7wMxIGYIvJTYZo+GGRXPr9jU8JXhrRWlaR2GF+XkibIoOVzb06gGD7LZm/OeEVM0402bBn7dJdNguBPd8nYxdMLEvKas6U+GyERViCC4+pLGwq/vNTswAk7M4joHvtZxYUZkmd+hnUY2T2ZF3K8fJKL8S+hi//DGXpZCzs=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1722934555; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=46FGarQ+Gb6fnnbVjZJzhYqZv+IqQ+GP8N0sis3nVXc=; 
	b=feLypRvLUUm/SDmS9Q/S2s2AE6y0XAY1KH5TKGvA2MqJJoox7ftkrQsymWXnR7lIb/yJUu84pB3TmSMNJganiwFlIVwJOwi6sQUiiw74xOl5Ln1Nhc3o5pU45bL03xPFp07j54hUaDAWm0SP/AGOIQtSOKpZ0fdhGPUryDeQC3E=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=collabora.com;
	spf=pass  smtp.mailfrom=angelogioacchino.delregno@collabora.com;
	dmarc=pass header.from=<angelogioacchino.delregno@collabora.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1722934555;
	s=zohomail; d=collabora.com;
	i=angelogioacchino.delregno@collabora.com;
	h=From:From:To:To:Cc:Cc:In-Reply-To:References:Subject:Subject:Message-Id:Message-Id:Date:Date:MIME-Version:Content-Type:Content-Transfer-Encoding:Reply-To;
	bh=46FGarQ+Gb6fnnbVjZJzhYqZv+IqQ+GP8N0sis3nVXc=;
	b=jdsvpt3TKDUcDAJwaVONSQF076JHenq3/e3x/urpn6+FfGIWyXPgJ9UfNksRslrf
	a0hZ+/KO5RuMvmW/Rl+l0NWxnb38ymyWOxFR/5nej/r5J4wZp8W/HqOGJ7AjH4Uj5QW
	9b8MU4YzZM1ymBio5f+ibg9Vs4xjuQZb+pqCW0ow=
Received: by mx.zohomail.com with SMTPS id 1722934552450742.4038831923073;
	Tue, 6 Aug 2024 01:55:52 -0700 (PDT)
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
To: Matthias Brugger <matthias.bgg@gmail.com>, 
 Pin-yen Lin <treapking@chromium.org>
Cc: Rob Herring <robh@kernel.org>, 
 Kiwi Liu <kiwi.liu@mediatek.corp-partner.google.com>, 
 Conor Dooley <conor+dt@kernel.org>, devicetree@vger.kernel.org, 
 Enric Balletbo i Serra <eballetbo@kernel.org>, 
 linux-mediatek@lists.infradead.org, linux-arm-kernel@lists.infradead.org, 
 linux-kernel@vger.kernel.org, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Hsin-Te Yuan <yuanhsinte@chromium.org>, Chen-Yu Tsai <wenst@chromium.org>
In-Reply-To: <20240805065051.3129354-1-treapking@chromium.org>
References: <20240805065051.3129354-1-treapking@chromium.org>
Subject: Re: [PATCH] arm64: dts: mediatek: mt8183: Remove clock from
 mfg_async power domain
Message-Id: <172293454965.67359.1861418696492290008.b4-ty@collabora.com>
Date: Tue, 06 Aug 2024 10:55:49 +0200
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.13.0
X-ZohoMailClient: External
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240806_015557_165530_460CC542 
X-CRM114-Status: UNSURE (   6.29  )
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

On Mon, 05 Aug 2024 14:50:23 +0800, Pin-yen Lin wrote:
> This clock dependency introduced a mutual dependency between mfg_async
> power domain and mt8183-mfgcfg clock, and Mediatek has confirmed that
> this dependency is not needed. Remove this to avoid potential deadlock.
> 
> 

Applied to v6.11-next/dts64, thanks!

[1/1] arm64: dts: mediatek: mt8183: Remove clock from mfg_async power domain
      commit: 8294c090a05d10fa17fc63ffdaa643f1d123addc

Cheers,
Angelo



