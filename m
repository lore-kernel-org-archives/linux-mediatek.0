Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4D7E0C54E58
	for <linux-mediatek@archiver.kernel.org>; Mon, 18 Mar 2024 11:32:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=vfpzFUJshP/8LxBR44vT/HbkCVt7/mbEzEQCHtEi+gY=; b=UxJGvRltJ2+oACAF+Z2BwEo+d2
	SgPOQy9Vv2HjNPXkn1v/WizZDKmZ8wwdOa3Ku2Y+9MPlgu7Xuoq1pgz2eIRvv8iRiDIjkWPJ93yzU
	QEz8ZldN4mGnbpvM/S04RSSZYrloiPWvpkkRr1ngW+AY2PEJ7wKzqqaOT5G4Ks9pCe8QIgmav7s5k
	gormaItqw9fZn0IdOJzBDVzqi8umrPHKuToxZ2fjdshpTl41/jMHPfUHKzs4rwR26njw6adRRCLoV
	IxWze4LmiazmMh8fD5/7eehsj4bfKpogqyRAJ3t2WBLbDdhJ2xy5E08mPVmB+Gdr0/dTJwFKPOzXw
	MJ+0yVVQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rmBEe-00000008OLx-2vMH;
	Mon, 18 Mar 2024 11:32:56 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rmA6d-000000087TX-1lOE;
	Mon, 18 Mar 2024 10:20:35 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:Content-Type
	:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:Message-ID:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=vfpzFUJshP/8LxBR44vT/HbkCVt7/mbEzEQCHtEi+gY=; b=YL8sLpwbox/7P2rd4AV5NratEW
	Vu66x8M7vLP1MdYNyXA+VHye2TLiILPS9j55SH91BYUvF+LvP6usjMiAd3rMdMR8PM539VcgMwong
	qY/6TjSgcG6hEztZQQXBFbDy9txvJ3bEElL/u7fVl8F0wvc/YEMp6irP3fpqk15gnxTKIAOZ5zNSS
	/HKlrDbaVlrbSp9EFKzacyHOrs6d5RBAl0V6Cs0BSUtTTFt5KODrnJ0G375lH0GeGUalgJ19NUUPo
	/uKT0G1H3hXyBXyRXxVITk6IDa3LNbFf5RvidxMVjPYCUoeWIl80LpLNilkG9ed1CjmkHF2HydK7s
	epDRW9fg==;
Received: from madrid.collaboradmins.com ([2a00:1098:ed:100::25])
	by desiato.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rmA6Y-0000000CZxw-2C4t;
	Mon, 18 Mar 2024 10:20:32 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1710757229;
	bh=nhMi7Rz7KxM9Lznhuv/RbMZuGrKl6cfvADSdkTJ1Vjo=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=N5FwsH0IxersJzcBxGdrZ/dpEJ20F/kUFkgpkb54/Z4mp+8L7SO+1ZQXTSP95msUl
	 gwUqoeQzjM9hatAhIwjEtkghbIbQnW04uoYx/p5GcPPFv5yiyPURcSdS/f44SZHoXL
	 hlo2TFYnbJPqxtVcYn2H30lJqs/yj7hhQ/D/KTEe4DCCkPGy6VFbgxAY+WMvEVr5Qx
	 Q4l9Mftn1hb8WMwfb56WlJ6YPqtcBWyURef6y2Ku4WeFCjg9ExZxSK3NmLJHWGd+W8
	 CcowHR6vaAuzXudNt/PnKHJ7e9AbKO2OZMf8ZJM1RVeOoxgK3lMts8O25GR9M6fq0s
	 8sS2uRSFKjGtA==
Received: from [100.113.186.2] (cola.collaboradmins.com [195.201.22.229])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by madrid.collaboradmins.com (Postfix) with ESMTPSA id E38C3378205B;
	Mon, 18 Mar 2024 10:20:28 +0000 (UTC)
Message-ID: <bc3d8b24-fa84-48ad-8750-46ed714a1e28@collabora.com>
Date: Mon, 18 Mar 2024 11:20:28 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 05/14] mips: dts: ralink: mt7621: reorder gpio node
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
 <20240316045442.31469-6-justin.swartz@risingedge.co.za>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
In-Reply-To: <20240316045442.31469-6-justin.swartz@risingedge.co.za>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240318_102030_842409_A20689A3 
X-CRM114-Status: UNSURE (   6.00  )
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
> Shuffle the attributes of the gpio node to appease the DTS
> style guide.
> 
> Signed-off-by: Justin Swartz <justin.swartz@risingedge.co.za>

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>



