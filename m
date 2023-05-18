Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1C84CC77B7D
	for <linux-mediatek@archiver.kernel.org>; Thu, 18 May 2023 09:32:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ZM/ziyY/bEOUp34W06pVqKOvjlg8zMvD18pKLMHentk=; b=vs2A2DWiiQVhc4gym2be/pO8gz
	bphTimnDe/7kSDzTSsevoOBY7pI/uq1huMLTdLbkhJrlchpKRWl2J6+6wFzH6qcC3RGBYv0SDOUvQ
	1U7pMsg5l6nRhJh0pGp/8nkbWoJmeU5yV2QTrCB5TR8kPQKHlDegdTrx9Gyz9Gjy8H1g9eBISWowI
	e4TeRIpCAT3SoGbiQ4meecHR/H+MmgB+LMo/j99K7fqYyU/R+mvhSZuRPVj5hhEoXeclFqcHfgBYR
	CenFJFGOB9H7lADOSBbUrlcoQMvQ+Kdm7p3Icz5+AuaBLoHREEOfNyBnaHO2RH2tAw6oI3PaoMjjT
	5L1YnKig==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pza0E-00CT1L-0R;
	Thu, 18 May 2023 09:32:54 +0000
Received: from madras.collabora.co.uk ([2a00:1098:0:82:1000:25:2eeb:e5ab])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pza0B-00CSz0-0D;
	Thu, 18 May 2023 09:32:52 +0000
Received: from [IPV6:2001:b07:2ed:14ed:a962:cd4d:a84:1eab] (unknown [IPv6:2001:b07:2ed:14ed:a962:cd4d:a84:1eab])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits))
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id 7F84E6605944;
	Thu, 18 May 2023 10:32:49 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1684402369;
	bh=8CEs8jg1IBDKZGJzbEMInnqFtur20E0UOFQ/JDCj71c=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=A+0O3uUdkdzVVDXjDbLdPzKOXPoRj+YP+NsGJcElW54MqQ6451xj/ruGpYOZ8q+28
	 VWaIAiSVAksZjPxGEqNIIXc5sWfkTyQqubo+K2WmU/A7CkUIS4JrWzcvCbgr7+ufqv
	 uR1Nd8YB5pQP0DKv2QnICNCPGRAY0IjYXx7Pyqj9X6on0k3KWntxDniIqc1m2P/vSo
	 U7iQuY5pjeW3c7OJYgwNd0zJ5e9SlFksTfsfzBPXhhs4B4cy8E027tlGvtAr3Hyh1m
	 40ilNyp/qVUE8YE/t1eMSS9Dxo6gQ1JYVwrzJV1cxhveJn+1K8QkHcwXiIkqojcczm
	 jV4ARWX1y9Nkw==
Message-ID: <795845ce-e32e-f503-198d-69e0a21c6f19@collabora.com>
Date: Thu, 18 May 2023 11:32:46 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.1
Subject: Re: [PATCH v2] spmi: mediatek: add device id check
Content-Language: en-US
To: Sen Chu <sen.chu@mediatek.com>, Stephen Boyd <sboyd@kernel.org>,
 Matthias Brugger <matthias.bgg@gmail.com>
Cc: linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org
References: <20230518040729.8789-1-sen.chu@mediatek.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
In-Reply-To: <20230518040729.8789-1-sen.chu@mediatek.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230518_023251_233103_02A57392 
X-CRM114-Status: UNSURE (   6.62  )
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

Il 18/05/23 06:07, Sen Chu ha scritto:
> Add device id check for spmi write API.
> 
> Signed-off-by: Sen Chu <sen.chu@mediatek.com>

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>



