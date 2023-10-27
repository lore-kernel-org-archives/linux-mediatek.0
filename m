Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 022E7C25B47
	for <linux-mediatek@archiver.kernel.org>; Fri, 27 Oct 2023 07:38:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=e0bnuLR62YV+f3p4MAnVZTnhasaQ9mzl6N0rluZOZTY=; b=O0BCacSR+Uftdzz1qGUbcj93uu
	nDSSamAuyFEwcvbPDb79D6noKK1mUE8EieNiRJQolnnBGf9HqHprNEvCvNqIdsculvwWgXCXMF3MY
	9z8SmxzZ3zHpeHScB1Jpw+7WO8EqvXPDQ8jNZY7PG7C3BlLXRtuY5HfofqzYATQNckos0MPmd+pJB
	0AYCo52+1BJUl/tnH6PPPSatvYczLFDm76s046fkzERwKcjJ1+6WoOfTYkEMe88CASvw7fn1QjfB+
	zykf2Oak6ZIijhfS8NOAgpMmpNJ4f+o2i3VYaIpZEAhFRTAy6Ufb90XAsk5/NoBSCyCincGJnm3Kl
	bK/moIiA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qwHQL-00FovZ-0H;
	Fri, 27 Oct 2023 07:38:29 +0000
Received: from madras.collabora.co.uk ([2a00:1098:0:82:1000:25:2eeb:e5ab])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qwHQA-00Fory-26;
	Fri, 27 Oct 2023 07:38:19 +0000
Received: from [192.168.1.100] (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id D2B4766072FC;
	Fri, 27 Oct 2023 08:38:16 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1698392297;
	bh=KInA2GojPxsiZ4s+CEBXwv6jTlgW0TQ/Kg4fkVV8b0I=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=QTgbXtJtUZux2/ebE8We0IPL+OqFw1byOMJOFr86Jh2w1HKHxwENobFRZmOjovRHq
	 8HCB7p9wyY5S24miDWzn+Mql6ijQd5Op8WHl8FWGpVFsneUSXzDWsFflb63BL0Y+KT
	 oQnpu88AuIO1wfsEpOOWYj+pqMhRtlIUn6WUeRNm/9QkSOF9iIqagsEDHUl4b9bprR
	 Du/PAKqf9srzLG4KR8mTdmdMLEW5zcMZkB1k9Z8KYQ+kDlyYKRTNT1+j4pSh8Z1O1q
	 69lGcwPyDiRVyojX9ZOOd9Jw+Fc0p1VvrUs/CGX5tWR5szytRsZ4FelB8v1o4TOLuP
	 4pWoAGiX0e8jw==
Message-ID: <1932ea16-8cb9-423c-9ea7-6b2f4bfe1505@collabora.com>
Date: Fri, 27 Oct 2023 09:38:14 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 7/7] arm64: dts: mt8183: Add jacuzzi pico/pico6 board
Content-Language: en-US
To: Hsin-Yi Wang <hsinyi@chromium.org>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
Cc: Rob Herring <robh+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>,
 =?UTF-8?Q?N=C3=ADcolas_F_=2E_R_=2E_A_=2E_Prado?= <nfraprado@collabora.com>,
 =?UTF-8?Q?Bernhard_Rosenkr=C3=A4nzer?= <bero@baylibre.com>,
 Macpaul Lin <macpaul.lin@mediatek.com>, Sean Wang <sean.wang@mediatek.com>,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org
References: <20231026191343.3345279-1-hsinyi@chromium.org>
 <20231026191343.3345279-8-hsinyi@chromium.org>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
In-Reply-To: <20231026191343.3345279-8-hsinyi@chromium.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231027_003818_821637_2B5454EE 
X-CRM114-Status: UNSURE (   5.98  )
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

Il 26/10/23 21:09, Hsin-Yi Wang ha scritto:
> pico is also known as Acer Chromebook Spin 311.
> 
> Signed-off-by: Hsin-Yi Wang <hsinyi@chromium.org>

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>


