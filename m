Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DA95AC5478C
	for <linux-mediatek@archiver.kernel.org>; Mon,  4 Mar 2024 10:30:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=fJeSLf5lyYmnei4z4zJLC7q4JuAMAZv0VUTNJtJdWdY=; b=TTV7HAs9JRpvjh7KVQsM3RitBz
	GD4tAunXTr2lRqhtAvrb2U2gnGaXQ/AqVLgh1TrWVXgvSXfQjSjk7DmaII6WBb2MIu8PlDfYmE6sx
	+PbcyHY3J8YVMsrQ4H9IbLlfDpnZSf/z+RAROjNKWhgb/dvFo5efPxraWdjQNg/jrB1iGuEsrvI2w
	tGFo9Yk3hnU81BrkkZhEttzxrvbDP6N7adoRNekuB+JU/NHEwzIwTzyPZqXBhK0wPiO/wVXZJsYzC
	jJMx4VUE+yIgtAj/4d1POU+PgatkLj812Tyk4/IECHI9A0QAxG2IxqcadA+5y+5VqA3+UAm9rkEQJ
	7buYsuHg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rh5ax-00000008cl5-1h5E;
	Mon, 04 Mar 2024 10:30:55 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rh5Kq-00000008YTK-2BqA;
	Mon, 04 Mar 2024 10:14:22 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:Content-Type
	:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:Message-ID:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=fJeSLf5lyYmnei4z4zJLC7q4JuAMAZv0VUTNJtJdWdY=; b=JqbsYL8mgQn2Y9KlwCQdg6CnOE
	Ndz7uVwn2JOEWkem/Xz+W+yfdR0HE2xSKfCvHOTsOjz0n3YSuW8BH0LiswRsiaqpZXLi3RPj3/tKv
	ainyHx8bwW/z+h80AMDc05Gv3rRUo6cuhAAls0xGpOqCN+RA5re38Gh/TDjLvWUeWiLI3NwMZGqd3
	1rg09iuplRyINMaJS5VSIRWO5jAHhLsdHFnHsPdChjEZqgQ0gnH7kN3fh4bD8y5wVUNmhKdA3z31C
	rCkyDHlkMURlpxUI1DHkeHQZWjjOgJ1X6ImA7jV1SikpgnGVzoi024VknTJciIYHTaZgvWfw2a4A7
	1n8nnwsw==;
Received: from madrid.collaboradmins.com ([46.235.227.194])
	by desiato.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rh5Jm-00000004myY-3by9;
	Mon, 04 Mar 2024 10:14:13 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1709547179;
	bh=CdD0gojEKaMK1V0uxqyzqCJ3ztwMhtLhWT3fngZDSXE=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=SjAKL/+aWvvIHZ/44a+k7hKEZxUbz7zE5swg3ByjmWr85EF+7rgqb2dZAwh2Mwjrl
	 W6l0kELSAMjmzaDOpGpap5OY/zDE8RWYtsXLpiOh09dzZDugxPYEw6W51GnbHHI1oJ
	 pOXIc+gTJ0D8O3TnApToaFDoplipVKNdqQ5gCaO2qiN+hebRZABz+ZF/lVSis3OhhD
	 ++qjJnX6r9DL9Jhf1PzwpCAjwzK02UQBI+YkOtKDM7QiI92HcdN9q0/rZn2ml8R4eC
	 /nXnivJX0tDueCALX3ZggXKTN31L2MTd+nDfd7Du0tae2417zOhgPgM1g5hvNlHzau
	 nyHxrNpncYozw==
Received: from [100.113.186.2] (cola.collaboradmins.com [195.201.22.229])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by madrid.collaboradmins.com (Postfix) with ESMTPSA id 2FFEF3782091;
	Mon,  4 Mar 2024 10:12:59 +0000 (UTC)
Message-ID: <fcba424c-eb0b-4a43-b657-eeef811809c4@collabora.com>
Date: Mon, 4 Mar 2024 11:12:59 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 3/4] arm64: dts: mediatek: mt7622: fix ethernet controller
 "compatible"
Content-Language: en-US
To: =?UTF-8?B?UmFmYcWCIE1pxYJlY2tp?= <zajec5@gmail.com>,
 Matthias Brugger <matthias.bgg@gmail.com>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>
Cc: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org,
 =?UTF-8?B?UmFmYcWCIE1pxYJlY2tp?= <rafal@milecki.pl>
References: <20240301113506.22944-1-zajec5@gmail.com>
 <20240301113506.22944-4-zajec5@gmail.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
In-Reply-To: <20240301113506.22944-4-zajec5@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240304_101404_225849_C943B4CF 
X-CRM114-Status: UNSURE (   6.22  )
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

Il 01/03/24 12:35, Rafał Miłecki ha scritto:
> From: Rafał Miłecki <rafal@milecki.pl>
> 
> Fix following validation error:
> arch/arm64/boot/dts/mediatek/mt7622-rfb1.dtb: ethernet@1b100000: compatible: ['mediatek,mt7622-eth', 'mediatek,mt2701-eth', 'syscon'] is too long
>          from schema $id: http://devicetree.org/schemas/net/mediatek,net.yaml#
> (and other complains about wrong clocks).
> 
> Signed-off-by: Rafał Miłecki <rafal@milecki.pl>

Fixes tag?

Thanks,
Angelo


