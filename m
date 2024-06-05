Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4AC2DC25B76
	for <linux-mediatek@archiver.kernel.org>; Wed,  5 Jun 2024 10:34:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=wjMM368z2X3T8NkMBQQVcWwwS77I1mMcWpt9FHGndWA=; b=26bY38GphThRppyM+lqKWRotqd
	wHFd7XmoyRSlvv76iQlyOSH6WD7wiTg+n+48svINM0szd5VtFKEhYS28Aw9cvWn62CWorT/ZeAjfD
	YCTA5vDzkwme3NsNeAykwZK/DfiLZt6a2p5uJaTC1dWLvzjy8NvSxRyCoxo1dfgL5tmG+lqC9movC
	g16cSGn1Wllone0y7t6qIJmw6lEYxk+vaS7gplKhwWD6pkJUdUjOmE+CeSKdF0RFqu609deylacAx
	74MsjwRVNjgr0oCFIi1QeTX+r3KJ++NZ2n60dfA54Mt85cVm81+oehkZ7I1RwvAX2R/xT9VIvolDo
	tyaCNktA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sEny3-00000005aq4-0uj7;
	Wed, 05 Jun 2024 10:34:07 +0000
Received: from madrid.collaboradmins.com ([2a00:1098:ed:100::25])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sEnxz-00000005apa-3RcJ;
	Wed, 05 Jun 2024 10:34:05 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1717583640;
	bh=eH24vgsLERbd3MYpYzbhRI8kWxjPs+cAWp3PbPHeY0g=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=Byc2XsjFNOtmoxmeq1t4/Y6lFk8XI9w58HPODiFSKd+q6R26KtgR7ooUWEd2ERRzS
	 vHrHxs2/hWI++7mhxHeq6zvUIpUQSOvrEy7XpT+5Y6WcxrJ8T2KsTEWRPnX8lvckd8
	 bo0OC1Z39tBMPzR/hct3JWzf/xzzJkI0whMl4Bdf/VPFwxz47PxjNVqeYybm+kmqV1
	 p6Zz+NZxcVq/jqtk4yq/CI1yfegntDNo6Q/53WFkDtl7QkUJxTLBGxxhfspDUzFrwp
	 hCmASjDRKawD/PalbuCdzhHYeXjzpzg5/+TsCbV3Erc6c4C4DDODBD1JvPtwn4veTZ
	 2KUfygeDK8PDQ==
Received: from [100.113.186.2] (cola.collaboradmins.com [195.201.22.229])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by madrid.collaboradmins.com (Postfix) with ESMTPSA id 2602437806BA;
	Wed,  5 Jun 2024 10:34:00 +0000 (UTC)
Message-ID: <7a5679f1-04a9-490e-ad9d-8f7e706c90cf@collabora.com>
Date: Wed, 5 Jun 2024 12:33:59 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] thermal/drivers/mediatek/lvts_thermal: Return error in
 case of invalid efuse data
To: Nicolas Pitre <npitre@baylibre.com>
Cc: Julien Panis <jpanis@baylibre.com>, "Rafael J. Wysocki"
 <rafael@kernel.org>, Daniel Lezcano <daniel.lezcano@linaro.org>,
 Zhang Rui <rui.zhang@intel.com>, Lukasz Luba <lukasz.luba@arm.com>,
 Matthias Brugger <matthias.bgg@gmail.com>, linux-pm@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org
References: <20240603-mtk-thermal-calib-check-v1-1-5d6bf040414c@baylibre.com>
 <af024ad1-93f6-4d7a-b139-7eb2fa12eb81@collabora.com>
 <359n7s98-08p8-177q-n51s-33rs215soqq2@onlyvoer.pbz>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Content-Language: en-US
In-Reply-To: <359n7s98-08p8-177q-n51s-33rs215soqq2@onlyvoer.pbz>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240605_033404_055931_935CE3F1 
X-CRM114-Status: GOOD (  10.80  )
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

Il 04/06/24 18:33, Nicolas Pitre ha scritto:
> On Tue, 4 Jun 2024, AngeloGioacchino Del Regno wrote:
> 
>> Il 03/06/24 14:06, Julien Panis ha scritto:
>>> This patch prevents from registering thermal entries and letting the
>>> driver misbehave if efuse data is invalid. A device is not properly
>>> calibrated if the golden temperature is zero.
>>>
>>> Signed-off-by: Julien Panis <jpanis@baylibre.com>
>>
>> Fixes tag, please.
> 
> What should it refer to? This is arguably a robustness enhancement for a
> defficiency that has been there all along.
> 
> 

If that's been there since day 1, the fixes tag should be the day 1 commit,
of course.

I see that as an important bugfix and not just a robustness enhancement, as
SoCs with uncalibrated LVTS would *not work*, as the kernel would shut down
the system before even loading the userspace.

Regards,
Angelo


