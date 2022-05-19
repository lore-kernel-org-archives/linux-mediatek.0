Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 35F4AC433FE
	for <linux-mediatek@archiver.kernel.org>; Thu, 19 May 2022 15:33:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:Subject:From:References:Cc:To:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=QaNwILRjkl7GYvzhyBUGpAsTT6uypMVv7PEmMmRD4OE=; b=unv+t4dBrk3+2p
	M1DutNRHAU4KjW9CpG1qL/fiTmxDQ/zq1SiJt/iJhH4MvdxICHb3hhjgAGPS/laPC6EKFYVANGbl9
	grhBNT8CgZG+r9lDIoo5livzlcbXUZewTmpDmJFzoRYxNgKTFGRVEDPuIbaVfcLY8iOWOh4KaXWiu
	fkIb4Hyr0orTbyG1vdtNADzlp0YfDMFonpUvPw4SkFbeDwMEhT7EKL/wOIk5cdIBhQozMO/mJpPHx
	r7pfE5ZOEn1RmT67XDH2HFUSO6L5D9ORq7ZBdUWa7uJBHD9MaUdXk2HqbEeehCioDOfT+rEFxXxuy
	6sgvf8debCb5epuxPeZg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nri9J-007zKq-AJ; Thu, 19 May 2022 15:33:13 +0000
Received: from nbd.name ([2a01:4f8:221:3d45::2])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nri9F-007zC8-6u
 for linux-mediatek@lists.infradead.org; Thu, 19 May 2022 15:33:10 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=nbd.name;
 s=20160729; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:Subject:
 From:References:Cc:To:MIME-Version:Date:Message-ID:Sender:Reply-To:Content-ID
 :Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:
 Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe
 :List-Post:List-Owner:List-Archive;
 bh=VXKRNmlYsQ9lj/JBQ2sUU2Yg3wYqbJJEgqqLiKrZpcI=; b=goP4Zhrh57qnXNonS0OqumCV3y
 q9rOgCnV93bntFFJcLW9/bXtOJU/U089/4jev0SHsww8BHJKmNXW+2YZfu6w24SCmQ7srOrnQ9E14
 4g5HOacAjPRaZgiu+K8m35tJnXEkCmXPLozITrFSgFz+3qqDkXIsomccL95jz4ovZoAg=;
Received: from [217.114.218.28] (helo=nf.local)
 by ds12 with esmtpsa (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.89) (envelope-from <nbd@nbd.name>)
 id 1nri93-0001rs-Vg; Thu, 19 May 2022 17:32:58 +0200
Message-ID: <1a399493-bfa5-b40d-a430-c7f3cdd328fb@nbd.name>
Date: Thu, 19 May 2022 17:32:56 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:91.0)
 Gecko/20100101 Thunderbird/91.9.0
Content-Language: en-US
To: Deren Wu <Deren.Wu@mediatek.com>,
 Lorenzo Bianconi <lorenzo.bianconi@redhat.com>
Cc: Sean Wang <sean.wang@mediatek.com>, Soul Huang <Soul.Huang@mediatek.com>, 
 YN Chen <YN.Chen@mediatek.com>, Leon Yen <Leon.Yen@mediatek.com>,
 Eric-SY Chang <Eric-SY.Chang@mediatek.com>, KM Lin <km.lin@mediatek.com>,
 Robin Chiu <robin.chiu@mediatek.com>, CH Yeh <ch.yeh@mediatek.com>,
 Posh Sun <posh.sun@mediatek.com>, Eric Liang <Eric.Liang@mediatek.com>,
 Stella Chang <Stella.Chang@mediatek.com>,
 Evelyn Tsai <evelyn.tsai@mediatek.com>, Ryder Lee <ryder.lee@mediatek.com>,
 Shayne Chen <shayne.chen@mediatek.com>,
 linux-wireless <linux-wireless@vger.kernel.org>,
 linux-mediatek <linux-mediatek@lists.infradead.org>
References: <cover.1652941276.git.deren.wu@mediatek.com>
From: Felix Fietkau <nbd@nbd.name>
Subject: Re: [PATCH 0/3] introduce BIOS SAR support
In-Reply-To: <cover.1652941276.git.deren.wu@mediatek.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220519_083309_537665_B71FB2AE 
X-CRM114-Status: UNSURE (   5.74  )
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On 19.05.22 08:38, Deren Wu wrote:
> From: Deren Wu <deren.wu@mediatek.com>
> 
> Introduce BIOS SAR support for mt7921 serials.
> 
> Deren Wu (3):
>    mt76: add 6G band support in mt76_sar_freq_ranges
>    mt76: mt7921: introduce BIOS SAR support
>    mt76: mt7921: introduce BIOS SAR config in tx power
Please replace BIOS with ACPI throughout the patch.

Thanks,

- Felix

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
