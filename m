Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CFF92C3DA6E
	for <linux-mediatek@archiver.kernel.org>; Wed,  3 Jan 2024 12:22:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=obISvGs9I/FiLIUrUT0YRJl1ktPq7CYVC3XVwciU/UI=; b=j0WtuFZuhbxIL0CmIyzsVfOuMj
	n9saUZDsXVyJ5I+R2efNEpFnB0HY6FEEaGkQ6aiQtnUzXxVeZGlRgP3N8PmZ0QLbJ44YwwszHvQIn
	WdeQyzFUjOe1C8CEJDajxDzG4hqZyuad0Y8YcvDdQaGxoJmJ6yI++p4E6YbQjEmZbhKk2txtJ6nKo
	HLL5QLtNr9aT2x7UM8gAdxZH4cwjm1ISVpeUiZwelWTuacqc++anMpLjomt8nr5sh1LypFpAFu3nN
	pCsXuHqOFgETPVLIpcfrP+nArQz6HKKwraCu0JTlZOvfPN0yx83LM5AxZwf/iWm4lgXTMKREg00WZ
	qLm6I83g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rL0Gb-00Anup-2P;
	Wed, 03 Jan 2024 12:22:37 +0000
Received: from madrid.collaboradmins.com ([46.235.227.194])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rL0GU-00Anpt-2A;
	Wed, 03 Jan 2024 12:22:32 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1704284548;
	bh=lvVhhUPH6kgSD2hH7kfMwPENfYjI5v43CDGfoYJVRe0=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=E9mSVbTYG4tlQT1A7IfwrqibQxxjhvypSmCoxWCccB8QSi16wIajqfsJDJq6dmLJ/
	 PTucrbfUU0HyfT5wkpHwRVnQCpEjRDlAeYxUXI8A86eYgEfrfuxLxAhwA4sZK/UeOg
	 rEk8mYSfJ1ackWN/aW2sFJF5hUwdUjL6sYexWjfCBcBsXE6/CsarDJ1yAZFQ8JNnfI
	 yDL0EGeXpotrbN4wyRjq5lyEZWC66VIARJk7sY5XYDCTRsHMHUEP7LmV831qOMQj9I
	 LdiVTPqGD/+k3u7mHwkl/aRnNvR0i8nyCfq1q3ZUFdEZMfN1FyBezRhLDnxRxr6Cbx
	 dpIUxvcIiyqOQ==
Received: from [100.113.186.2] (cola.collaboradmins.com [195.201.22.229])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by madrid.collaboradmins.com (Postfix) with ESMTPSA id 9BC163781F8C;
	Wed,  3 Jan 2024 12:22:27 +0000 (UTC)
Message-ID: <709e7af4-21d5-408a-9989-98493232421f@collabora.com>
Date: Wed, 3 Jan 2024 13:22:27 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 09/24] arm64: dts: mediatek: mt8173: Enable cros-ec-spi
 as wake source
Content-Language: en-US
To: Mark Hasemeyer <markhas@chromium.org>, LKML <linux-kernel@vger.kernel.org>
Cc: Sudeep Holla <sudeep.holla@arm.com>, Rob Herring <robh@kernel.org>,
 Andy Shevchenko <andriy.shevchenko@intel.com>,
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
 Konrad Dybcio <konrad.dybcio@linaro.org>, Raul Rangel
 <rrangel@chromium.org>, Tzung-Bi Shih <tzungbi@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Matthias Brugger <matthias.bgg@gmail.com>, Rob Herring <robh+dt@kernel.org>,
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org
References: <20240102210820.2604667-1-markhas@chromium.org>
 <20240102140734.v4.9.Ic09ebe116c18e83cc1161f4bb073fea8043f03f3@changeid>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
In-Reply-To: <20240102140734.v4.9.Ic09ebe116c18e83cc1161f4bb073fea8043f03f3@changeid>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240103_042231_292362_DCB78CDB 
X-CRM114-Status: GOOD (  11.63  )
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

Il 02/01/24 22:07, Mark Hasemeyer ha scritto:
> The cros_ec driver currently assumes that cros-ec-spi compatible device
> nodes are a wakeup-source even though the wakeup-source property is not
> defined.
> 
> Some Chromebooks use a separate wake pin, while others overload the
> interrupt for wake and IO. With the current assumption, spurious wakes
> can occur on systems that use a separate wake pin. It is planned to
> update the driver to no longer assume that the EC interrupt pin should
> be enabled for wake.
> 
> Add the wakeup-source property to all cros-ec-spi compatible device
> nodes to signify to the driver that they should still be a valid wakeup
> source.
> 
> Signed-off-by: Mark Hasemeyer <markhas@chromium.org>

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>



