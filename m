Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7A259C54E58
	for <linux-mediatek@archiver.kernel.org>; Mon, 18 Mar 2024 11:32:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=SNlaYgWe9UeXNIiMBc5G2Nm1uKQikabRgBddAssK1RM=; b=joewnEAidk6/PGtZ5FXKwuc1Me
	9zBJtHyYf1RisvEBYbnqh2FuWvgiEl3lKRM1oJt/SOZDebvNqj5jfQCddS4C/pMhg2g7vo7Vq+Jf1
	9x04t9cqj3kZpNnCfq6KG1XslCHoSl2fQwLJ6guIkEOOZ90LAc++aOprBavypTvohLx6YoWklgV9/
	WZNR9OzYuDJh0MC/ZLIH8yXd+lEuvqrn0QOzxMdf7TMzvkzQgjGI4Ql4jNfyMpOBBr6Z6xt+CstMd
	HoqoKU6df4Z34Q2kZtvtpJpnTsmPqI7qXzIBkQYaMelswGld5R0P+tyraXY0E4/pFzHow3zlHXWrV
	TXYHq1nQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rmBEL-00000008O6d-2rj8;
	Mon, 18 Mar 2024 11:32:37 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rmA6V-000000087Rk-3bBk;
	Mon, 18 Mar 2024 10:20:27 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:Content-Type
	:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:Message-ID:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=SNlaYgWe9UeXNIiMBc5G2Nm1uKQikabRgBddAssK1RM=; b=BHIynSjA1j/qdT++amPudGwvUO
	I9SuJmidra418RyQmWN6hwwETTbHjB1P6EhVzCL72YDXAfFlZdw3jFWO+JoADyHrgI2WXKaFq11tZ
	hYe/Ii4RuUmTg1G+qK7y9rGe83ngqHTsLsbK82zAFkExAx26uSvwqYSrgKHkt40dOJo1+GpK2lhVG
	79sIYI9ort7KHFeVrYPte/7FLMCP9zBGSSwnuqepTnKzS5Jn69ctJNPkbOrvivjCdvvEzb2dA4XtX
	Xqae8IL1LqZeztMYSCkzjcq3fb4Rt8BQyej6OM57QSFzN1gem6vr1M6vlxlkkLUN4br3/2BsK5Nvt
	NnrU6YFQ==;
Received: from madrid.collaboradmins.com ([2a00:1098:ed:100::25])
	by desiato.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rmA6R-0000000CZts-35sX;
	Mon, 18 Mar 2024 10:20:26 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1710757221;
	bh=uTZOtHBrwk1ZgvqEya2WCVuR3eGHVxsYo5270w6n4Ec=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=rGBTSQQF5SVvNdlqdbPW16zKYLKo+3gX5VqNkwX/zxCtwZNFJPAbHvrvFGndyScbP
	 5U5Y402CIoxHWmyMS7UToF1BlK8N/JMDLVFQVqVggrrSWK9hBiD/urCLjFoYQiqPF5
	 6J3d12I8ewa9x7KL73xpnG1kBXRORy6oCWE3gUzjOxzOR7XuyJqJZe3oJ/A4gCAdGG
	 toKNlK70ulX0YK1qKtPvKxXDh39tRNInMKNWSs10bw1hFZUkXCRCawTW9vUHgBslmR
	 DNG4nQDy44Nz7SQq7NGVFyR+LqLRbv0RXyJI1g0XvxOWZow3/VjUjBKr50LpL2aG1d
	 s9Rkir4a1Y9nw==
Received: from [100.113.186.2] (cola.collaboradmins.com [195.201.22.229])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by madrid.collaboradmins.com (Postfix) with ESMTPSA id E4E01378209C;
	Mon, 18 Mar 2024 10:20:20 +0000 (UTC)
Message-ID: <dd502eac-a97e-4f3d-9b48-538cc77d41d7@collabora.com>
Date: Mon, 18 Mar 2024 11:20:20 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 06/14] mips: dts: ralink: mt7621: reorder i2c node
 attributes
Content-Language: en-US
To: Justin Swartz <justin.swartz@risingedge.co.za>,
 =?UTF-8?B?QXLEsW7DpyDDnE5BTA==?= <arinc.unal@arinc9.com>,
 Sergio Paracuellos <sergio.paracuellos@gmail.com>,
 Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>,
 Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
 Matthias Brugger <matthias.bgg@gmail.com>
Cc: linux-mips@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org
References: <20240316045442.31469-1-justin.swartz@risingedge.co.za>
 <20240316045442.31469-7-justin.swartz@risingedge.co.za>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
In-Reply-To: <20240316045442.31469-7-justin.swartz@risingedge.co.za>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240318_102024_148008_03AD6470 
X-CRM114-Status: UNSURE (   6.84  )
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

Il 16/03/24 05:54, Justin Swartz ha scritto:
> Rearrange the order of the i2c node's attributes so that they
> are inline with the DTS style guide.
> 
> Signed-off-by: Justin Swartz <justin.swartz@risingedge.co.za>

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>



