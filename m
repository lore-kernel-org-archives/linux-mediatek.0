Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2C6E5C4829E
	for <linux-mediatek@archiver.kernel.org>; Mon, 12 Feb 2024 22:48:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:References:Cc:To:Subject:From:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ul5k55UQtWoQXPNcb/0pzT+j7IivOX8sLryDaU7Ct7Q=; b=sDWdiW8mmLHlWxNPtoWBUOywvW
	kO76Od4c6DpJPs7EMrogD8pWSDSPG53hr1Of0IcczkRTd/jFyghmiRUqPf6Mq1tdUf6f7yroAWPGT
	oHAN+MelT7NZoWQsrSHjJ8+QIUl2ilwtnrZoFY/X7Lw46uWfI+BqzHkWn/dUK9GyTVP+eWah4g8Gr
	5dVvbMPOAXIZPcS8f/Efnnbs1i4jOVLMchs544FO86EAe2IR+9iZ6OPpagI7ZN1hxGtbT5cqB+mET
	iGQwacSq6HSrMXFShv8cDq4+lsiNyZYNMWKjHt2NPF27QmCCF0RDaHWp9g765EHK2Zb7j5z1l3724
	UGYy5Ufg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rZf6H-00000007CMJ-3EFq;
	Mon, 12 Feb 2024 22:48:33 +0000
Received: from madrid.collaboradmins.com ([46.235.227.194])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rZf6D-00000007CLU-49pY;
	Mon, 12 Feb 2024 22:48:31 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1707778107;
	bh=ul5k55UQtWoQXPNcb/0pzT+j7IivOX8sLryDaU7Ct7Q=;
	h=Date:From:Subject:To:Cc:References:In-Reply-To:From;
	b=WMEzaMb0jF8d4K8ffKjdIN1T6SfXUyxnsga8j71b2gYgKpEhxOCt3Y89KABX5xqd5
	 fbv9vpbeOCuIE88lN74M4DIGVF7qczX91bFOdYuqUJllh3/RebXKfkalUjcPJk001/
	 H8qWuLfeISqog7kruNsqPXPmtA5X2Z9/iRmOSTyS1PkJ67wdaC9kUuvr0xBFRiZBna
	 Ynz6HJodRV8HLqyLBdP/+4MFIDsEpg0pAbX53t+FPuNza7+oTdUtX3aROyY+K/IdMH
	 ZQlgFA8zm9WCFUY694biMeLRpjUTDyzRnrXUe5rCtYxsZY9xaWXbgVXvmcY4ziLuk7
	 rLkrJlA5lSY0Q==
Received: from [100.115.223.179] (cola.collaboradmins.com [195.201.22.229])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: cristicc)
	by madrid.collaboradmins.com (Postfix) with ESMTPSA id D75633780C22;
	Mon, 12 Feb 2024 22:48:26 +0000 (UTC)
Message-ID: <ad65ab14-4e23-43ec-aed8-6bfc59dddb51@collabora.com>
Date: Tue, 13 Feb 2024 00:48:26 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>
Subject: Re: [PATCH v4 01/19] power: reset: atc260x-poweroff: Use
 devm_register_sys_off_handler(RESTART)
To: Andrew Davis <afd@ti.com>
Cc: Sebastian Reichel <sre@kernel.org>,
 Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>,
 Cristian Ciocaltea <cristian.ciocaltea@gmail.com>,
 Florian Fainelli <florian.fainelli@broadcom.com>, Ray Jui
 <rjui@broadcom.com>, Scott Branden <sbranden@broadcom.com>,
 Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konrad.dybcio@linaro.org>, Sean Wang
 <sean.wang@mediatek.com>, Matthias Brugger <matthias.bgg@gmail.com>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 linux-pm@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-actions@lists.infradead.org, linux-arm-msm@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org
References: <20240212162831.67838-1-afd@ti.com>
 <20240212162831.67838-2-afd@ti.com>
Content-Language: en-US
In-Reply-To: <20240212162831.67838-2-afd@ti.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240212_144830_204004_56166412 
X-CRM114-Status: UNSURE (   4.61  )
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

On 2024/02/12, Andrew Davis wrote:
> Use device life-cycle managed register function to simplify probe and
> exit paths.
>
> Signed-off-by: Andrew Davis <afd@ti.com>

Reviewed-by: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>

