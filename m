Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 468C6EE4997
	for <linux-mediatek@archiver.kernel.org>; Wed, 11 Sep 2024 11:24:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Wb4jz+UshjLm42YMo5Ot17+HQmIh/ePWbDqtCyhcrSA=; b=XEDm3RE6ZP52hzeo39DExQhs17
	si02EGiZU0RKA7lmwB7eHnUve2IGyA2j6JmfQDJWjnykoXnQrn4+zv5OWnLj7+L7xgNS5UzdWvP8/
	V2ZKYXlaV/9/U8b37yJNZ2aZ4AiWaDMUpmyee9VR+t1FxsD5+RlYNBKEW8eNF9kISzlSCuKAhjQ5a
	7n1+0ug7RYNGFO9z6oJi5TDyLApFkBxNTzXHiJXTw4/hYyHYAttSlXN5ip6tBuDN2MfBiu5Xb0L4A
	ys37l1ZQGzIGUr/dCPAoIqFGEXioTnr+doLJeRadI5GuJCq93+JAL+5Xp45ytHXYRQ5r3oWMG2zmv
	ajVBe4qw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1soLSP-00000009HMs-37aC;
	Wed, 11 Sep 2024 11:24:21 +0000
Received: from a7-49.smtp-out.eu-west-1.amazonses.com ([54.240.7.49])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1soLSN-00000009HLJ-22yR;
	Wed, 11 Sep 2024 11:24:20 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=4232tfv5ebdrjdwkr5zzm7kytdkokgug; d=collabora.com; t=1726053855;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:In-Reply-To:Content-Type:Content-Transfer-Encoding;
	bh=mqYi342WHEdDf+HDPe90o07Mgff6F0tXVtleQjq7ybM=;
	b=Nks8Aqe4s6qQBLPrIVWYyte/c5ASGpSzE8nUKBX3ind0WcjOZ6GirmgsqcJzR+Gf
	pEyfV/ItgN2DE/dMbbC9Dr8S6V/w7cHGbf5pQu1IW3i3EgZ9cIaOeJIMvutMKuzpG8v
	tkmc2/o1DuW9EHgT58o0BmIrp898Sd3Pj1EJR6EpJ66aAcOR2mlGgvqMj2hMYm594Eq
	g52GyExcPgwx5Uj8MVHwvbDtFUCuPZOFjinbexkcNR0sKyKEjRBc+86t/8DmzMAowEs
	XqBSHaZyc5cjh4QWuHo94fUYDnCDi8XUXza66EEgN4a4jmwTJbmb5B1OAhsIKm4U3Kq
	BdNwXJgDrw==
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=uku4taia5b5tsbglxyj6zym32efj7xqv; d=amazonses.com; t=1726053855;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:In-Reply-To:Content-Type:Content-Transfer-Encoding:Feedback-ID;
	bh=mqYi342WHEdDf+HDPe90o07Mgff6F0tXVtleQjq7ybM=;
	b=UWA2pUsIGq+V6/WzlOopiOOkZJ7SfCVozcaygBOON517GwOV4RQMgrqSUDpSFum5
	WhsuhSMcQUE++3fUp/3NyLzUrzWNpamsv6/j+JeUa3+M5ucGfgiw/Z3hl9nQIk8rXHw
	qFlYiz9pW0tlMw06pPLlL17lta82osqy1Jq/R0KI=
Message-ID: <01020191e0d3b260-aab4dc96-e245-49b8-8b77-494823ddce5e-000000@eu-west-1.amazonses.com>
Date: Wed, 11 Sep 2024 11:24:15 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 5/8] arm64: dts: mediatek: mt8188: Add PWM nodes for
 display backlight
To: Fei Shao <fshao@chromium.org>, Matthias Brugger <matthias.bgg@gmail.com>
Cc: Conor Dooley <conor+dt@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Rob Herring <robh@kernel.org>, devicetree@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	linux-mediatek@lists.infradead.org
References: <20240911105131.4094027-1-fshao@chromium.org>
 <20240911105131.4094027-6-fshao@chromium.org>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Content-Language: en-US
In-Reply-To: <20240911105131.4094027-6-fshao@chromium.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Feedback-ID: ::1.eu-west-1.YpP9ZbxnARFfy3Cb5pfsLd/pdsXBCNK0KEM7HforL4k=:AmazonSES
X-SES-Outgoing: 2024.09.11-54.240.7.49
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240911_042419_735127_3A378399 
X-CRM114-Status: UNSURE (   5.50  )
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

Il 11/09/24 12:51, Fei Shao ha scritto:
> Add two hardware PWM nodes for display backlight usage on MT8188 SoC,
> and mark them as disabled by default.
> Boards can enable the necessary PWM node as needed.
> 
> Signed-off-by: Fei Shao <fshao@chromium.org>

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>


