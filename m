Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7F25BD15D8C
	for <linux-mediatek@archiver.kernel.org>; Mon, 21 Oct 2024 13:40:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=AshhJ00JycUwGfeVpQLMR0164B5YJunXVaEUDL3esL4=; b=ztLyrmwKQUU0zYE/ypblUCEiIK
	cOtEkoTMihujH3xOWVe6pTW5Ovq4EPCPSl4nYU68f7jpC08HA1Ci8/Kq2vU1HmS13XoakSDb07XXH
	/JLi/Kg9z/7kTlfrmb/wCcG3MguSqjindjoo3nna8/px8roUKBXwcyLi6FeQYo1QvobMgBxniVVIs
	8eiKvDRztochbL7vmWNwNqHoM2G5KGXJZTMDTyvarpqsvKEWcT+aXdNONlydm5evY9GxV84617mv3
	S64/Z3WNZk0qwR8l9ZCBJxDDlL8ewbfqKddDeORY3HX1W7rG6ItMwek0As5hw0R7VggKfl0xkQNUu
	j6wizvww==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t2sdc-00000007S2h-1Z5Z;
	Mon, 21 Oct 2024 13:40:00 +0000
Received: from bali.collaboradmins.com ([148.251.105.195])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t2sP2-00000007PSN-3q3e;
	Mon, 21 Oct 2024 13:24:58 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1729517095;
	bh=a6no6SukAF7TPDcSQa66DG7acqCpfgzjuCnc6eY9CEY=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=oMhaaCvGRrKoWi7djsxzsCNS6HW+aiFMVwECybnqkd0MRSiLwvj63HVjiScOXdbAb
	 vQZls2RK0wJvk7za/Z5xZcm7x2qT1bk2Ke+81YmNchjyobN0q+UsfJi3p/BolV7z8y
	 hKAPUG9f2KT+iJLKObjiT96SdgO7GfWsPQC9sCwyWFYqyHPwixhVeldh2uL2FT8SZL
	 iDhyrNt4Gu5x4JoFOO7NXqJGV7sFlmMStV329M7fx9XsBKUe8/+cuHUsFidjYCxVfl
	 JKL0w6mX69kf6rweyWirzWHmlVQS92oVNhsjoGxx2bue3F/wXLJNBDCik/i1UvyXYk
	 qX9BU0UlS7lnQ==
Received: from [192.168.1.100] (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits))
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 1DF9017E361A;
	Mon, 21 Oct 2024 15:24:54 +0200 (CEST)
Message-ID: <9fbe6e8e-623a-4c8c-b6ea-c3aea8a5a56d@collabora.com>
Date: Mon, 21 Oct 2024 15:24:54 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 4/6] mfd: mt6397: Add initial support for MT6328
To: Yassine Oudjana <yassine.oudjana@gmail.com>,
 Dmitry Torokhov <dmitry.torokhov@gmail.com>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Sen Chu <sen.chu@mediatek.com>,
 Sean Wang <sean.wang@mediatek.com>, Macpaul Lin <macpaul.lin@mediatek.com>,
 Lee Jones <lee@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>,
 Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
 jason-ch chen <Jason-ch.Chen@mediatek.com>,
 Chen Zhong <chen.zhong@mediatek.com>, Flora Fu <flora.fu@mediatek.com>,
 Alexandre Mergnat <amergnat@baylibre.com>
Cc: Yassine Oudjana <y.oudjana@protonmail.com>, linux-input@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-pm@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org
References: <20241018081050.23592-1-y.oudjana@protonmail.com>
 <20241018081050.23592-5-y.oudjana@protonmail.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Content-Language: en-US
In-Reply-To: <20241018081050.23592-5-y.oudjana@protonmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241021_062457_137675_B4FA8789 
X-CRM114-Status: UNSURE (   9.62  )
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

Il 18/10/24 10:10, Yassine Oudjana ha scritto:
> From: Yassine Oudjana <y.oudjana@protonmail.com>
> 
> The MT6328 PMIC is commonly used with the MT6735 SoC. Add initial
> support for this PMIC.
> 
> Signed-off-by: Yassine Oudjana <y.oudjana@protonmail.com>

You're sending this from another email... and you have to add or change the signoff
to the other email....

...but yeah I know it's still you, so I'm confident to tell you that in your
correctly signed off v2 you can add my

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>

Cheers,
Angelo

