Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E9E45C63797
	for <linux-mediatek@archiver.kernel.org>; Wed,  1 Feb 2023 16:07:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=VpHbTMyuGBdjvn+2lgzn+7pdm9u//Jy8FpkNkUYizn0=; b=uejOGXHUx9Z7a9YLyCT6y5kvHI
	AtzEwhLX0L/pvXgEjBebxFjCSxRlD424AVSgnnLZF5P2liVfoIUNS/LzswOLHb/wOpSoIgl9VgKee
	V9aKliiDrJ781p4IkfgiI/vrG47wR4UD/4OlL9BIU5s8HGxSk2UJbfvfm88sS2g0bUGx2ki1ivHRX
	pVnV/wVbRk73oH/A+DS872UP8q41VmdEgU6GeKPkag+CG2521UigDbuF8vwckmCnlF3var6RX32yB
	pFcMCMxoApwAcI4AOFjNQNHHSAHDbIMwWgVxU5dKLBLd7fZ/mFj3S0d8FUX/kLoswf0w1IhMv7Rjv
	APyOISpQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pNFe9-00Cjku-NC; Wed, 01 Feb 2023 16:07:41 +0000
Received: from nbd.name ([46.4.11.11])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pNFe6-00Cjjw-8i
	for linux-mediatek@lists.infradead.org; Wed, 01 Feb 2023 16:07:39 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=nbd.name;
	s=20160729; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:
	References:Cc:To:Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
	List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=VpHbTMyuGBdjvn+2lgzn+7pdm9u//Jy8FpkNkUYizn0=; b=sevUWYGqtV/jGcd5O4CoDb5GpM
	hwd84qSFRDN+6EXY3V5O34iluSQdMjETEwvRR+ax4LynpZ9uhVjWy0EfOZrfZOji8NBiXK60hQIA1
	nJlVIF8nkWzpAFHIhnHNj2i1FHcGACPO0AC6hVBlO59yU8ongtZjl+dwU00Advqqs6F8=;
Received: from p200300daa717ad0031deeb80938bfca5.dip0.t-ipconnect.de ([2003:da:a717:ad00:31de:eb80:938b:fca5] helo=nf.local)
	by ds12 with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256
	(Exim 4.94.2)
	(envelope-from <nbd@nbd.name>)
	id 1pNFdq-004CvW-Bo; Wed, 01 Feb 2023 17:07:22 +0100
Message-ID: <d6244fd6-62bd-ba07-fe18-dee559594ece@nbd.name>
Date: Wed, 1 Feb 2023 17:07:21 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.6.1
Subject: Re: [PATCH 2/2] linux-firmware: update firmware for MT7916
Content-Language: en-US
To: Shayne Chen <shayne.chen@mediatek.com>, Josh Boyer <jwboyer@kernel.org>
Cc: Lorenzo Bianconi <lorenzo@kernel.org>,
 linux-firmware <linux-firmware@kernel.org>,
 Ryder Lee <ryder.lee@mediatek.com>, Evelyn Tsai <evelyn.tsai@mediatek.com>,
 linux-mediatek <linux-mediatek@lists.infradead.org>,
 linux-wireless <linux-wireless@vger.kernel.org>
References: <20221123110743.22005-1-shayne.chen@mediatek.com>
 <20221123110743.22005-2-shayne.chen@mediatek.com>
From: Felix Fietkau <nbd@nbd.name>
In-Reply-To: <20221123110743.22005-2-shayne.chen@mediatek.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230201_080738_419488_92BC792B 
X-CRM114-Status: UNSURE (   8.40  )
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

On 23.11.22 12:07, Shayne Chen wrote:
> This patch updates firmware files v211120221031 for MT7916 WiFi NIC.
> 
> Signed-off-by: Shayne Chen<shayne.chen@mediatek.com>
More and more users are complaining that this firmware update introduces 
a regression of not being able to support 5 GHz and 6 GHz together 
anymore. Apparently the EEPROM data needs to be patched to limit support 
to one of the two bands, otherwise both don't work.
Switching at runtime apparently doesn't work without a firmware restart.

Is there any chance we could get a firmware that fixes this bug?

Thanks,

- Felix

