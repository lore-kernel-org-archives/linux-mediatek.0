Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 73110E7718B
	for <linux-mediatek@archiver.kernel.org>; Mon, 23 Dec 2024 11:27:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=XlHxMROAiLHJCynGrHL06vfC6p3IvfWASkyhGhYoU8w=; b=s1A4rVwnN0WfXNjXgoQegl8PMu
	+vQ2KZ90ZmsVwT4u3mOXww0GNe1+8yZbMGUVKi5wa52SL/fXtDbBq4K9cEmMOhF0trWgzoZfx43rr
	90mEIV+kVky7+K8UhYos775P4TBbatw3bKBlkFS4JpneVFu2SYwskhbJodN4lF0vQvN5oO6fDb7CO
	ItFD7aipYykGGieX+6g45iwdPX6FQVrEMX6ZSsbNjfibxLBKvvsY2iZwN4kR5Z/U9ELpXWAYUr+gL
	6herfcomdYd/0ddP8CddLHR1nlJDnbCzYmGlCIpknhwOoXgiFcUdCWdzP70fszUScgnFor7dWItfO
	eFvgdsDw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tPgaX-00000009tmW-2TBJ;
	Mon, 23 Dec 2024 11:27:05 +0000
Received: from bali.collaboradmins.com ([148.251.105.195])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tPgSL-00000009seh-0WoF;
	Mon, 23 Dec 2024 11:18:38 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1734952715;
	bh=QLyQ/40bE76H9VbgLGGDBjS5cTe4R2nX1hxnkHzKGJw=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=J7hYJXfBjYVrWELRFDnGBJnAomHjbvIsewnpSzJohdUUQKO3lHlUM0Vb/x8pbChXa
	 xLE6hUGr+zusf6JujWwc97jg8+CmZcssCJr3FRS9MiMsTcacmKeHSrRHFKSGcot9kN
	 k2Ggkos3l4hgHFOhiuuFMJU6l1Kh6Aqwry9/4KhVlAIwVnJ9kBMBVWjZ6fZ+JchJw7
	 4QBGG0lCEs0mrAiGbeglBnmB50ZPZvPsrjndeHrBcNZYl8VfP0LByIXItXUt+auHii
	 +4NcUz2WoDgCAXSGl9RbR6PLi4pHA38ovcK/ZolYZNTqcSwedovHvJq4llEBztK9kF
	 WHwZdaPSQz55Q==
Received: from [192.168.1.100] (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits))
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id EB21917E12AC;
	Mon, 23 Dec 2024 12:18:34 +0100 (CET)
Message-ID: <b9c6820d-249d-41fe-a605-acab74afe88a@collabora.com>
Date: Mon, 23 Dec 2024 12:18:34 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] PCI: mediatek-gen3: Enable async probe by default
To: Douglas Anderson <dianders@chromium.org>,
 Ryder Lee <ryder.lee@mediatek.com>, Jianjun Wang
 <jianjun.wang@mediatek.com>, Lorenzo Pieralisi <lpieralisi@kernel.org>,
 =?UTF-8?Q?Krzysztof_Wilczy=C5=84ski?= <kw@linux.com>,
 Bjorn Helgaas <bhelgaas@google.com>
Cc: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>,
 Matthias Brugger <matthias.bgg@gmail.com>, Rob Herring <robh@kernel.org>,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-mediatek@lists.infradead.org, linux-pci@vger.kernel.org
References: <20241220145205.1.Ibf2563896c3b1fc133bb46d3fc96ad0041763922@changeid>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Content-Language: en-US
In-Reply-To: <20241220145205.1.Ibf2563896c3b1fc133bb46d3fc96ad0041763922@changeid>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241223_031837_344185_59A642F8 
X-CRM114-Status: UNSURE (   6.57  )
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

Il 20/12/24 23:52, Douglas Anderson ha scritto:
> Like other PCIe drivers, the mediatek-gen3 driver has a fairly slow
> probe. Turn on async probe since there's no reason to block the rest
> of the system.
> 
> Signed-off-by: Douglas Anderson <dianders@chromium.org>

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>


