Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 74F70C54E5D
	for <linux-mediatek@archiver.kernel.org>; Mon, 18 Mar 2024 11:31:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=A5EojJ8/ylxD8ofoe3bUZxj23IPdEmUdCQkr+t+M9lE=; b=kq8THpRZULhDHCXKGJYUaxASmI
	4ZyLvMSRguJoXdBeJpSrZ8M4m4dOLxUr3h9eiyr0+b2VdOKUsuKUP63vGAz1OY7XS6Ov8AaeRMisj
	DSG7FoyiTgYpEvrXqvUBtZNlPizCDuwNYN59tkwA/DoH6eZzJ69RA5zFJwkSzPVcO9BJUW4O0+oAo
	Rw3lBPTV5FhmOSWN8ivCc5c/nkjBauN5h6hWFtLCrSGQzl8L1xmLiUf/uKcQojMePEJM/VpQbCBOw
	atsl40U+44mZaJRrwrYjOKkrtBRSsbQZstzVi+24lDGYhjksx1FjWA4NjhKu8QgJFOReD/0MTiKdS
	kiMuOOew==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rmBDT-00000008NRI-3d4V;
	Mon, 18 Mar 2024 11:31:43 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rmA6S-000000087Qh-3cY9;
	Mon, 18 Mar 2024 10:20:24 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:Content-Type
	:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:Message-ID:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=A5EojJ8/ylxD8ofoe3bUZxj23IPdEmUdCQkr+t+M9lE=; b=o4PN7A8bRk9oGC62xbJ4ZbQdSS
	Du7inbpqrbL+MeuhmVZbKbv0/HnF/hyiiDYygFyjovuorjuV153j81rklob+9COZ2rFfYtMQ6W/zQ
	AsWq6bjiSInNrT9RDepEFkZIwiDFB4jVbsZJsyM/pWU3oJtBCfW2Pcjbivchj0CIEGjNN9jdMMZVD
	vqu7voRECps84S+RgI+DqH3APDq33kJmmKFn0M7NO52f2HzLujHewLc4HzagrDDR2L3smL7iZjaQq
	9YSI3smrfcIJO6ylEn2W6wuIAoFuJ4GK6v216Z4ksuFkivnuo6+nx4RLdvjohwfsMyAGDPtic0GBY
	feM9ESSw==;
Received: from madrid.collaboradmins.com ([2a00:1098:ed:100::25])
	by desiato.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rmA6K-0000000CZt1-0PQA;
	Mon, 18 Mar 2024 10:20:20 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1710757215;
	bh=xFqKkyAmJVTNmLBFSihApou28cptANiceTSB76zEC5c=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=audS9/ETDK7z/jTMXazQhkgR0iuRi2oPlSZehNai4j9E3HDhtdId9a1oe4xrWqzwZ
	 rXiOBzlz6JJzJDzFTbu54Fire4ahBBVGiv7xQvTaKfA9K2V9qC5WyiTG52r0BOy/Ro
	 ae6uIFDnPLec74tdDgYCqMxdjtdMljCSsgWgJ5CRUw08MdGk9CSE7fmdUYLD09Q+mm
	 +Ad/2tQ0uYKqhaenIg2Mzh0gYk316Gow8lSAGgZx5ConTm1kUma86/I/ovJ8vjFxmk
	 cumzIyptkRS1/poSnt8cirUUxHAzc/54sppV0xwyFLs07iPrKIdU1R5E+zb75dMaxo
	 qncc04mMMCH/w==
Received: from [100.113.186.2] (cola.collaboradmins.com [195.201.22.229])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by madrid.collaboradmins.com (Postfix) with ESMTPSA id 7F3C9378203E;
	Mon, 18 Mar 2024 10:20:14 +0000 (UTC)
Message-ID: <5557e38b-add0-45a0-8b66-e3af2c33ea24@collabora.com>
Date: Mon, 18 Mar 2024 11:20:14 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 12/14] mips: dts: ralink: mt7621: reorder pcie node
 attributes and children
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
 <20240316045442.31469-13-justin.swartz@risingedge.co.za>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
In-Reply-To: <20240316045442.31469-13-justin.swartz@risingedge.co.za>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240318_102019_222732_D8970A3D 
X-CRM114-Status: UNSURE (   6.28  )
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
> Reorder the attributes and child nodes of the PCIe Controller
> node to meet the DTS style guidelines.
> 
> Signed-off-by: Justin Swartz <justin.swartz@risingedge.co.za>

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>



