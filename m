Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7EC6FC4452F
	for <linux-mediatek@archiver.kernel.org>; Tue, 21 Jul 2026 12:44:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=cy3T5pzemSqkA0f9i+O7t2E/ky0Z5/5xbdxpitPxq6g=; b=lQ78o2Sxxh1RXmD+5Hcn0x19ik
	wQHZYcGmPyrzwei2polrRb+GCZsYAi5FAyd8dGJpchrP/VoO/4rym3agghFtZUiBPfY8uqHD/YeAf
	DXbxFtndarwhD2c7A8zThGAjPcsn1FwAqVvTzF+vJEQUZKKYk3XobMGrOr97c2Un9awyN18FLC/u6
	jDTA10yvlGRmatMq2fb5wXJwr3QDvQtYxfGDF1Se+0n1s8WuHRL9AXD7jz79R0FzCYN9eLRmpMvhj
	9BgYDVuWqQlYyZQMfZP06yCaba8kC109jvdjoIelfi45lJhtKT0tkVZJSsbljVA5FC9nW8QJyQb6w
	3cwXzd+A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wm9pd-00000009S0Y-1QM4;
	Tue, 21 Jul 2026 12:44:21 +0000
Received: from mail.cjdns.fr ([5.135.140.105])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wm9pb-00000009Rzw-2dBQ
	for linux-mediatek@lists.infradead.org;
	Tue, 21 Jul 2026 12:44:20 +0000
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id EA4F449398F;
	Tue, 21 Jul 2026 14:44:09 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cjdns.fr; s=dkim;
	t=1784637854; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:content-language:in-reply-to:references;
	bh=cy3T5pzemSqkA0f9i+O7t2E/ky0Z5/5xbdxpitPxq6g=;
	b=VCzThVGyow8jXMatQb36WOM2wmWW5BsSDJSXOGXvMDCjFlKx1+qbqwW1TUdleo/WjqTiIA
	C/VqYpqpho0lDM+l894mAI6UFHz56QcquWQ9URbt/flESC4pzDApujDg1y7JxTg7Pp7mXL
	lckpw6VYybigTDzhxoF1LmKk9afW1O7fwLRIUxT1L4XFmyoPHdCUzlVzkjmEhbtqywtw2z
	QNrHTgnWPqUQnCDplwLuQohsbwsQc/ZxykVNRe8fVSIVavSBlUjyLCATvwx8Jb3D3w2XsP
	BbRwQg16bTdS7lrHtIx+BAIcMZaWSf49IEG3pv0/XOmoOl8yib77DK/Fz5pgRA==
Message-ID: <54817618-9086-4c0d-a871-2bc4f83934be@cjdns.fr>
Date: Tue, 21 Jul 2026 14:44:09 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird Beta
Subject: Re: [PATCH v11] PCI: mediatek: Add support for EcoNet EN7528 SoC
To: Manivannan Sadhasivam <mani@kernel.org>, linux-pci@vger.kernel.org
Cc: linux-mips@vger.kernel.org, naseefkm@gmail.com, ryder.lee@mediatek.com,
 helgaas@kernel.org, lpieralisi@kernel.org, kwilczynski@kernel.org,
 robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
 matthias.bgg@gmail.com, angelogioacchino.delregno@collabora.com,
 ansuelsmth@gmail.com, linux-mediatek@lists.infradead.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20260702150704.265282-1-cjd@cjdns.fr>
 <178412364176.146277.15805522323299213700.b4-ty@b4>
Content-Language: en-US
From: Caleb James DeLisle <cjd@cjdns.fr>
In-Reply-To: <178412364176.146277.15805522323299213700.b4-ty@b4>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260721_054419_855152_8920434A 
X-CRM114-Status: UNSURE (   5.35  )
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


On 15/07/2026 15:54, Manivannan Sadhasivam wrote:
> On Thu, 02 Jul 2026 15:07:04 +0000, Caleb James DeLisle wrote:
>> Add support for the PCIe present on the EcoNet EN7528 (and EN751221) SoCs.
>>
>> These SoCs have a mix of Gen1 and Gen2 capable ports, but the Gen2 ports
>> require re-training after startup.
> Applied, thanks!

Thank YOU for all of the help getting it over the line!

Caleb

>
> [1/1] PCI: mediatek: Add support for EcoNet EN7528 SoC
>        commit: 2077ccb9baa2cbbbccf5f0d8c2196dd9d5e43399
>
> Best regards,

