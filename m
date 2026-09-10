Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F22DBC88E45
	for <linux-mediatek@archiver.kernel.org>; Thu, 10 Sep 2026 09:30:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=lgm1vRoUMDJ1+grp+pb7fSArVmbDTf7dsSEXhUta1Gc=; b=1EXyGNO8lNFnOtNlRxhS/SiNCt
	+0DYQ8e5XDdukBxziZO3CftOks/lu4khsdMJSbxR1YDT6SSA/kXHuskWtbbeLc+kKL6yOA7DMX27/
	GZDqvebJCh2rREqSORjZPaw2iBMloh++NmSDi1Ges7/2ErP2QIN6U4WmpzIyF6RQSDfVFEAtIk68Z
	bVknIDSE9JjWIbpX2wlJPx6leMkJC8R1jI45dxuCwfKDV60vvh2O4FRDXnRqaVdeUF6i21u/XR/x/
	7EBMpC/49DRuMFNsIgyDKJNHHBRa6/0aFyvsrqrRLEjvDCgBucN2trioAb0mAcJXMU0GaJefUXB1R
	evPqreSQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x4b6w-0000000DtK7-3prc;
	Thu, 10 Sep 2026 09:30:26 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x4b6r-0000000DtGR-0pXa;
	Thu, 10 Sep 2026 09:30:21 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:Content-Type
	:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:Message-ID:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=lgm1vRoUMDJ1+grp+pb7fSArVmbDTf7dsSEXhUta1Gc=; b=fySK5nH1ct8HSZMtpqjZzzkw8d
	PDDQ4lwBHjj993q8jsUAXWqixGlWbzVANPB0b7aDClTFeM2Cj+cxO1hU7yMY6rmy9p9OHINI7OqIG
	u/UbLPkTy10CFRaxUV+U+8Qk26Kl5QM5WRf37mIRhbdG3FRkOKr0YNaeQWJ086Rl6j0Bcnp9PmQJ4
	jxcuEWwzd0omTr0pJFuJK43auKvm7CokNgc6QOdbfVyvtqn3b85jpRR1Ht4yQTIsTjzMdIyXqc3wg
	X4kY5SB4mm2vLKE4HWZbJUVzuzvp3vhQccozmUr2ONovN5VNrCLfeA2NYl1HHAIZtC+EhE7BF2drM
	XadlYpFw==;
Received: from bali.collaboradmins.com ([148.251.105.195])
	by desiato.infradead.org with esmtps (Exim 4.99.2 #2 (Red Hat Linux))
	id 1x4b6o-00000002GSz-1zrA;
	Thu, 10 Sep 2026 09:30:20 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1789032617;
	bh=zRvdzHl8IEtFB205zSAO49VjmRa+ZkiOo7iU4cGtHKQ=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=Elrq5RrzzJLJjhJwzb5Cu/vv6I2zBr3yI0VP6jVbTEqHEIB9ag5DUUvgnED9GaUrC
	 TIyaVdQ5aLwPhol0k1zDYLdw3rHUV3MoMGU9tcpML/6odbE660vsYz1piAfKTUK36C
	 1K4kVufmvNEPYyVsCjVZoMeDEG+74f9MDsCVQX+/IUOPyNplhLmbaN9JCNeVRnJ0S8
	 t6aSknQC0GURfOllw1H021WzZ2EK9xUbDGGr2R3ehlk4Y/CyWzbKW/V/K1vOcCK0PE
	 bhxGbejd3+TfaWE7X2/T8W4MDppSajEEPGEaGMqT2Bl3gCcxgCYPJf8Ux1LbBa/RXV
	 hNsxlMPk7Ngtw==
Received: from [100.64.1.21] (unknown [100.64.1.21])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange x25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id A7DF217E0C7E;
	Thu, 10 Sep 2026 11:30:16 +0200 (CEST)
Message-ID: <f7e00f6a-35b5-4c50-9b3e-a2cec8e435db@collabora.com>
Date: Thu, 10 Sep 2026 11:30:16 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 2/4] dt-bindings: arm: mediatek: Add MT8127 Amazon ford
To: zkh@mailbox.org, Matthias Brugger <matthias.bgg@gmail.com>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Sean Wang <sean.wang@mediatek.com>,
 Wim Van Sebroeck <wim@linux-watchdog.org>, Guenter Roeck <linux@roeck-us.net>
Cc: linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org, devicetree@vger.kernel.org,
 linux-watchdog@vger.kernel.org, zkh1@proton.me,
 Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
References: <20260909-mt8127-amazon-ford-basic-v4-0-e9af5c420ab1@mailbox.org>
 <20260909-mt8127-amazon-ford-basic-v4-2-e9af5c420ab1@mailbox.org>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Content-Language: en-US
In-Reply-To: <20260909-mt8127-amazon-ford-basic-v4-2-e9af5c420ab1@mailbox.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260910_103018_619863_26845EF1 
X-CRM114-Status: UNSURE (   5.84  )
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

On 9/9/26 21:38, Zakariya Hadrami via B4 Relay wrote:
> From: Zakariya Hadrami <zkh@mailbox.org>
> 
> Add entry for the MT8127 based Amazon ford tablet.
> 
> Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
> Signed-off-by: Zakariya Hadrami <zkh@mailbox.org>

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>

