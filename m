Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7DA69E9A76B
	for <linux-mediatek@archiver.kernel.org>; Tue, 24 Mar 2026 11:39:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=wsd8ayXzwZIf2OvsiCFxKkIRxILOgP6+SHpyFDVmOME=; b=J/oMHehnNcGnIppf+I63vt1Adl
	pPw2UALYEFciaYDzL6K4/tNAeiLiUFg/iZbogszEIZ/RJlDmrQk6g273Goqd8PNqZ0aMKguMmUziB
	rbWVjMUWN6BQIpE02paxuvuioODeXax0Ko3CV1eJHfoE53PfFIKY5UnX23MiafppclDKjLbsjvrW1
	+DHpazn7PrF58W5pGliQ6k1ZchWWkkN5fyJSIo2XMSiwnDR90nf1vALgVb2QoroEAxryyizKW8/89
	m1ATjl5XDRxiOsOzDpUwgRt/n1Q2RNNmfsgQoClJBqNtkoSTyuT9R3fvthJDeDjyOLLgKG3kK+oTC
	8N+lzoLQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w506e-00000001I4C-41Qx;
	Tue, 24 Mar 2026 11:39:32 +0000
Received: from mail.cjdns.fr ([5.135.140.105])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w506c-00000001I37-0p7K
	for linux-mediatek@lists.infradead.org;
	Tue, 24 Mar 2026 11:39:31 +0000
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 89E9A3A15BB;
	Tue, 24 Mar 2026 12:39:20 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cjdns.fr; s=dkim;
	t=1774352365; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:content-language:in-reply-to:references;
	bh=wsd8ayXzwZIf2OvsiCFxKkIRxILOgP6+SHpyFDVmOME=;
	b=S81Fyulz3eWDvnLEZMjjxxBAFTnizb9Rf0UKcKtl9/U+bcK2JSO+lkMTy/RZYZmCQXtpi3
	DfMOclCgCcsUWo2N7KqQZ865pi/j25ADGEU3kbl27i1U6T667cth3mnBgH2DJMuss1G9Nq
	417CJsWtGluB4krKR9hpXpOJpucC7sq5xoBmoGvaggW/Yp0zSnC99H7pFQS02w6dXwBnND
	wbeeKVFH+sA+9KpGEWjyf96vKoqrz1NVEnrVLk3rDlbqYj/mEr/jSZPEWpSIBaympBAi+6
	bIYzP/ioBqdsEp4CwFRKX+h/iI7ngrqUWgl/g4qv4EDjXA2SNeM3S97Czg8wbg==
Message-ID: <aae953bb-1cf3-4831-8f50-66fb863ddaf6@cjdns.fr>
Date: Tue, 24 Mar 2026 12:39:19 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird Beta
Subject: Re: [PATCH v3 1/2] dt-bindings: PCI: mediatek: Add support for EcoNet
 EN7528
To: Bjorn Helgaas <helgaas@kernel.org>
Cc: linux-pci@vger.kernel.org, linux-mips@vger.kernel.org,
 naseefkm@gmail.com, ryder.lee@mediatek.com, bhelgaas@google.com,
 lpieralisi@kernel.org, kwilczynski@kernel.org, mani@kernel.org,
 robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
 matthias.bgg@gmail.com, angelogioacchino.delregno@collabora.com,
 ansuelsmth@gmail.com, linux-mediatek@lists.infradead.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20260323213854.GA1082060@bhelgaas>
Content-Language: en-US
From: Caleb James DeLisle <cjd@cjdns.fr>
In-Reply-To: <20260323213854.GA1082060@bhelgaas>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260324_043930_454356_75D2BA8D 
X-CRM114-Status: UNSURE (   5.25  )
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


On 23/03/2026 22:38, Bjorn Helgaas wrote:
> On Fri, Mar 20, 2026 at 09:42:11AM +0000, Caleb James DeLisle wrote:
>> Introduce EcoNet EN7528 SoC compatible in MediaTek PCIe controller
>> binding.
>>
>> EcoNet PCIe controller has the same configuration model as
>> Mediatek v2 but is initiallized more similarly to an MT7621
>> PCIe.
> s/initiallized/initialized/

Oops, thank you.

Caleb


