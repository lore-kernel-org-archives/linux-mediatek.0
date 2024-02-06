Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 63664C4828D
	for <linux-mediatek@archiver.kernel.org>; Tue,  6 Feb 2024 12:00:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=40lEeZD5Pqyf+Nqe7fUf894tjLhr86AU7nXuMscQWE8=; b=1VS+ZfpSVZUuryp2I7qLK+H7LD
	jbaucPttSWNqn0QCyd7wvzfmw+0hgXH3Qt0xcPJX5HarqNpDt/suxfu5pyCWt3ECeYBAn6enJApt7
	g//opSSLLJFxIYQAzECAq6/u2+Q3EOG7KbWhK1C9k/E+55IbOaPAVk4nL7SPdM2F0y5/ptglc+kFY
	ayvb8Kn3XwXNcs9iBN27Xl/x/YizuuEF20iOL23+1ibo64iUcjJtcFOhA0GxHe9EBwjOrsZA622g/
	mWgV5DcoVyf2hLTtj15iIKetaSV8Yc4kDiepl6HNxqLpBG2SrssU10IdtHP5/gsf1vEo+nGlyrCFU
	G6BaLyxw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rXK86-00000007RMy-3kVu;
	Tue, 06 Feb 2024 12:00:46 +0000
Received: from madrid.collaboradmins.com ([46.235.227.194])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rXHsD-00000006kUr-3SP9;
	Tue, 06 Feb 2024 09:36:15 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1707212172;
	bh=luROSI1t+DKF5ceyQuKSrABuZSi136QYuZumnfZGPPg=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=aSOH7z1VxB4VvzEWSRLptEW7UztO288D3llYuxrHh2Thlop7wogU/Pu/VjRIXOHPM
	 Wxl1BTS6XbGFlNW4EJYD9MzCDn8xtLo1udQlMQOKamuXHkp+HU2IDgoKh83YTMdzRg
	 d0DcfOyesV/75xidwWm0mqt76H5oUKrseaTK7eShCQ24pyq/rP5vKS5KwW0AGtGnXl
	 j9oTT3oS0WE5CpemoNfmQwGpv6pADXLx40vjN0spOmUWVKkGtw+NF0Z8ijD32KAKyU
	 ZzXMoetCRkDBpUkgQHofJYxKJesC9wknBtNKy4KNNf/fNrveCcHCIAhHoE87Ar8TzY
	 2Iup6OK0jRrnQ==
Received: from [100.113.186.2] (cola.collaboradmins.com [195.201.22.229])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by madrid.collaboradmins.com (Postfix) with ESMTPSA id 4506E3782051;
	Tue,  6 Feb 2024 09:36:11 +0000 (UTC)
Message-ID: <bf4b8c00-cb21-4eae-9bf2-7941dcfae437@collabora.com>
Date: Tue, 6 Feb 2024 10:36:10 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 18/19] power: reset: syscon-poweroff: Move device data
 into a struct
Content-Language: en-US
To: Andrew Davis <afd@ti.com>, Sebastian Reichel <sre@kernel.org>,
 Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>,
 Cristian Ciocaltea <cristian.ciocaltea@gmail.com>,
 Florian Fainelli <florian.fainelli@broadcom.com>, Ray Jui
 <rjui@broadcom.com>, Scott Branden <sbranden@broadcom.com>,
 Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konrad.dybcio@linaro.org>, Sean Wang
 <sean.wang@mediatek.com>, Matthias Brugger <matthias.bgg@gmail.com>
Cc: linux-pm@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-actions@lists.infradead.org, linux-arm-msm@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org
References: <20240205194437.180802-1-afd@ti.com>
 <20240205194437.180802-19-afd@ti.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
In-Reply-To: <20240205194437.180802-19-afd@ti.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240206_013614_023369_60B18DCE 
X-CRM114-Status: UNSURE (   7.28  )
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

Il 05/02/24 20:44, Andrew Davis ha scritto:
> Currently all these device data elements are top level global variables.
> Move these into a struct. This will be used in the next patch when
> the global variable usage is removed. Doing this in two steps makes
> the patches easier to read.
> 
> Signed-off-by: Andrew Davis <afd@ti.com>

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>


