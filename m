Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 50D46C4345F
	for <linux-mediatek@archiver.kernel.org>; Wed, 17 Apr 2024 08:31:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=cfQdbp/JXnEjniFmtJmtKzsuNgoH0MIWVV90haiaAYs=; b=468MKzl2x6b9d5YjibAprShP0f
	O61GPVyNOFZjU+v9Bn04VC+e/t/moy9VZCVZINdp+ejG4L1Q64SVWvnPW17VWnXxy+zgNqv/6W5Kn
	4hIjBuqO+FB7lvRyVGY03CN1uE9YLbVUVH5Ka3wCRFRGWc0Xq1HAsPfKlV/CLvUyRO/NqIgTlDxk3
	wmKgVzGp67NEa1MpTBULhf2J86b9Gi8ivKJ3E0UNCr9w3mu2sbkEiAlndV0s6VHcgPMAv4gGCuTbt
	DUGYPLeugzpSKDi9x373rZ7jRruKesA9UsUA61rJ/KtzOvPzgLShg6dZnIq75jgNT5DtcTAxJ6mtR
	Ew5IUarw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rx0h4-0000000FDJm-40SG;
	Wed, 17 Apr 2024 08:31:02 +0000
Received: from madrid.collaboradmins.com ([2a00:1098:ed:100::25])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rx0h0-0000000FDIQ-3dwS;
	Wed, 17 Apr 2024 08:31:00 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1713342657;
	bh=hAKoZHGRwe5oOR+gYjYRmI7U+/iTL7eq3fs9/Xu1aqU=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=PEot3oHSw4wT5loY0dZpFv8eiXYny753dDhAVZKZBGyksPkHRuacYII0BK9ALD0dD
	 DebbtnNXmKla5szZK45nxT4sWD+rEyD4i59/JWeB6LEm+tMmwFCDN8U+WBdE5u2ucG
	 mQ5JTOJc2nZ3tbCbv3AZiLwhUvnXVy5YGB8PDm8dkiPy/CdsiWReM+8GjXTcMMw+Dq
	 oETXqmldu52IL/9sXB0/+QjrP3ZevN8A75ItxzP47rmkYzKdxuaTDyKlom+s0jpeI/
	 FuzSDf9TYqz+dVDbKulHemdsjmr9wnMrrGxqDA55pPMnlEO2vEWYEvbLpHp+qemspe
	 pfNE+h722qR9A==
Received: from [100.113.186.2] (cola.collaboradmins.com [195.201.22.229])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by madrid.collaboradmins.com (Postfix) with ESMTPSA id 713E537820F9;
	Wed, 17 Apr 2024 08:30:56 +0000 (UTC)
Message-ID: <f8cd2b23-f5e0-4692-a149-3ec98adb94b8@collabora.com>
Date: Wed, 17 Apr 2024 10:30:55 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1 5/6] regulator: mtk-dvfsrc-regulator: Refactor and add
 MT8192/MT8195 vregs
To: Mark Brown <broonie@kernel.org>
Cc: djakov@kernel.org, robh@kernel.org, krzysztof.kozlowski+dt@linaro.org,
 conor+dt@kernel.org, matthias.bgg@gmail.com, lgirdwood@gmail.com,
 keescook@chromium.org, gustavoars@kernel.org, henryc.chen@mediatek.com,
 linux-pm@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org, kernel@collabora.com,
 wenst@chromium.org, amergnat@baylibre.com
References: <20240416153805.431118-1-angelogioacchino.delregno@collabora.com>
 <20240416153805.431118-6-angelogioacchino.delregno@collabora.com>
 <Zh8dWdE8V8-GhNlF@finisterre.sirena.org.uk>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Content-Language: en-US
In-Reply-To: <Zh8dWdE8V8-GhNlF@finisterre.sirena.org.uk>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240417_013059_199335_4FDFE883 
X-CRM114-Status: UNSURE (   9.54  )
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

Il 17/04/24 02:52, Mark Brown ha scritto:
> On Tue, Apr 16, 2024 at 05:38:04PM +0200, AngeloGioacchino Del Regno wrote:
>> This driver never worked, and never got even compiled, because it was
>> missing the DVFSRC driver entirely, including headers it relies on!
>>
>> Perform a full (or nearly full) refactoring of the MediaTek DVFSRC
>> controlled Regulators driver: this retains support for the MT6873,
>> MT8183 and MT8192 SoCs, and adds MT8195.
>>
>> As part of the refactoring, this driver is now probed using its own
>> devicetree compatible, as this is a child of the main DVFSRC driver
>> and gets probed as a subnode of that.
> 
> Given what you're doing this would probably be easier to review as
> two commits, one removing the existing driver and another adding the new
> code.

Yeah, definitely.... I'll do that for v2.

Cheers,
Angelo

