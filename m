Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 26432C3DA61
	for <linux-mediatek@archiver.kernel.org>; Tue, 30 Jul 2024 09:12:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=IHSg4R/Skq63N7a5MZMlz3uDwSVZx1uNLjmO1SPjQnQ=; b=zIBMbw+N0+R6SpbENbbo4/rBiE
	uyy51aB9cRUp/k9p8w6dx3fCCJmqq/BPgpPjDf+PF0hXolPSNK/qSnduGUX6BRMOZlZl/KVQ6+KY/
	/6wbkL2FWGuMiTOk4MlWbUaVP7zrrWhlG4IyJhPlEP4jS/nEtM7yltFEMONFInyEUzz+PS/qqnvu/
	IBNbh2rr+Z0jsG0vqcC0gWKnbcaofKsh7pM4nlypcp4Zl3hC2RU/ekqsXaIbo18uAYlvmvpmKlHwd
	kCHgDGQFvfBlUIY21m/sh6igY+fmILp+lq5BTaYOpqCUSkH0aNK4xWPs7axbz5xgzz5ahzp4lueEy
	G8yvtH4g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sYiuM-0000000ESpH-3SpU;
	Tue, 30 Jul 2024 09:12:38 +0000
Received: from madrid.collaboradmins.com ([46.235.227.194])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sYitW-0000000EScP-1YBm;
	Tue, 30 Jul 2024 09:11:47 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1722330705;
	bh=LEB266Y/Z05ka56vMjBVHaG1mD/x2/PBj7c6e8BC2oE=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=2lPP/0w2qH48P34LkdXlBIfa47AJaeT8FXvKqwdX8wjUXbLa5od5+kRUMK8HGtRu+
	 knpJtwns1OpAphADA6GFZWXMn/P2HPP5uFZNz07YvC0rgyVcqyDVWjTywsaUhJboUL
	 MmYI0ZJx7dmyUZobnkqOVRRegqqkqPGTgSFDcj9YV9N43fkuMamsHxznoA/KhSQzvh
	 6i7loo80FNRnVj92IvQ5DWNkYUlQ3n9Sizv+sT+oaevVKyfAWdZfpZMgaIdJmotOfu
	 r+SAQDlxuY3bvQY/4ixh4I2Labfic6HQ+WrzgI48GoQF4gWm67k2V1d4gpBbEHpPsK
	 KzbQQN5CKKggw==
Received: from [100.113.186.2] (cola.collaboradmins.com [195.201.22.229])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by madrid.collaboradmins.com (Postfix) with ESMTPSA id 289D03780BC9;
	Tue, 30 Jul 2024 09:11:44 +0000 (UTC)
Message-ID: <c2e7392a-1ccd-42c7-9d4d-e079abade2f1@collabora.com>
Date: Tue, 30 Jul 2024 11:11:43 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/2] arm64: dts: mediatek: mt7981: add UART controllers
To: =?UTF-8?B?UmFmYcWCIE1pxYJlY2tp?= <zajec5@gmail.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Jiri Slaby <jirislaby@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>
Cc: linux-serial@vger.kernel.org, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org,
 John Crispin <john@phrozen.org>, Daniel Golle <daniel@makrotopia.org>,
 =?UTF-8?B?UmFmYcWCIE1pxYJlY2tp?= <rafal@milecki.pl>
References: <20240727121447.1016-1-zajec5@gmail.com>
 <20240727121447.1016-2-zajec5@gmail.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Content-Language: en-US
In-Reply-To: <20240727121447.1016-2-zajec5@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240730_021146_563200_105CD146 
X-CRM114-Status: UNSURE (   5.30  )
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

Il 27/07/24 14:14, Rafał Miłecki ha scritto:
> From: Rafał Miłecki <rafal@milecki.pl>
> 
> MT7981 has three on-SoC UART controllers.
> 
> Signed-off-by: Rafał Miłecki <rafal@milecki.pl>

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>


