Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 496F9C433F5
	for <linux-mediatek@archiver.kernel.org>; Fri,  7 Jan 2022 10:08:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Mm9Fj8lOi9JlbAD5rYcALkSrccXw6KMeSvkgwFMam/8=; b=k7lOiyxwjcCExK
	SXVDDijKEp82vSOK2eMwWQnru5cJleUA8gU2Qyr6PVRD8Goe1uQNt9+jdUj6JhdV2C7GI11m93Kxr
	Vdum8MDwzfS1/Xitmvr3Zv3h8wTdgk89Pcd8EMk1Adygsd/mIqxHs8xkBFdvc0yCcGLwRONAtRAk0
	yw7FlBinaU+lTsLj8IP+g6BmKfbKmqLVekLQOLbeAd76g/o81uIlSY2MuqXgtJBEkq0QGVUhUC4Tl
	mG/e86E3CDF+VrTamKuOhH+/kxl8AuZo0yJ9Qq1p762HQiyV6hyJSSr++MpevOfKoQqpkS8tOt9/Y
	mD5yv0W+7yPZ5RpnksXA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1n5mAx-003FTO-7W; Fri, 07 Jan 2022 10:08:47 +0000
Received: from nbd.name ([2a01:4f8:221:3d45::2])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1n5mAu-003FRk-EI
 for linux-mediatek@lists.infradead.org; Fri, 07 Jan 2022 10:08:46 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=nbd.name;
 s=20160729; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:
 References:Cc:To:Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=D2YLd/fsnlkv7EjOD1sLIxfj4yulGzoSnheV9bcseYQ=; b=pGyE2fv9JvgOyMiEbbK7WLVK4/
 g7iyQpVa4QH71BNvkZkJcPFOwfb6lldioQ0WD0IHOnM2BDySD7XD8XK/lIarubNADpzrjBhICyYCU
 ygucwh/myN7xxiVVMC7LF8tPdA772IQEEAlCfhSepUztNEMmkPv+DE9GiM0SoVEaazRo=;
Received: from p54ae97a7.dip0.t-ipconnect.de ([84.174.151.167] helo=nf.local)
 by ds12 with esmtpsa (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.89) (envelope-from <nbd@nbd.name>)
 id 1n5mAf-0003lU-SL; Fri, 07 Jan 2022 11:08:29 +0100
Message-ID: <97dbf02a-e3c7-aa4a-c404-45fc6189dc10@nbd.name>
Date: Fri, 7 Jan 2022 11:08:28 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:91.0)
 Gecko/20100101 Thunderbird/91.4.1
Subject: Re: [PATCH] mt76: mt7915: fix a couple information leaks
Content-Language: en-US
To: Johannes Berg <johannes@sipsolutions.net>,
 Dan Carpenter <dan.carpenter@oracle.com>
Cc: Lorenzo Bianconi <lorenzo.bianconi83@gmail.com>,
 Ryder Lee <ryder.lee@mediatek.com>, Shayne Chen <shayne.chen@mediatek.com>,
 Sean Wang <sean.wang@mediatek.com>, Kalle Valo <kvalo@kernel.org>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 MeiChia Chiu <meichia.chiu@mediatek.com>,
 Money Wang <Money.Wang@mediatek.com>, linux-wireless@vger.kernel.org,
 linux-mediatek@lists.infradead.org, kernel-janitors@vger.kernel.org
References: <20220107073609.GH22086@kili>
 <f61c6a25c7ad1ed452b4facf38c7e451d47c5dc0.camel@sipsolutions.net>
From: Felix Fietkau <nbd@nbd.name>
In-Reply-To: <f61c6a25c7ad1ed452b4facf38c7e451d47c5dc0.camel@sipsolutions.net>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220107_020844_853405_846806B7 
X-CRM114-Status: GOOD (  13.22  )
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

On 2022-01-07 10:18, Johannes Berg wrote:
> On Fri, 2022-01-07 at 10:36 +0300, Dan Carpenter wrote:
>> Unfortunately this code has stumbled into some deep C standards
>> nonsense.  These two structs have a 3 byte struct hole at the end.  If
>> you partially initialize a struct then the C standard specifies that
>> all the struct holes are zeroed out.  But when you initialize all the
>> members of the struct, as this code does, then struct holes may be left
>> with uninitialized stack data.  This is from C11 section 6.7.9 and how
>> it is implemented in GCC.
> 
> Wow, nice find ...
> 
>> +	memset(&data, 0, sizeof(data));
>> +	data.cmd = cpu_to_le32(MURU_SET_TXC_TX_STATS_EN);
>> +	data.enable = enabled;
>> 
> 
> Maybe add a comment? This is not going to be obvious in the future.
> 
>>  	return mt76_mcu_send_msg(&dev->mt76, MCU_EXT_CMD(MURU_CTRL),
>> &data,
>>  				sizeof(data), false);
> 
> Or maybe instead just mark the thing __packed (and/or explicitly add the
> padding if needed), it seems weird that we'd send something to the
> *firmware* that has a struct layout subject to compiler/arch padding
> rules.
I would also prefer explicitly adding the padding and leaving the rest 
of the code as-is.

- Felix

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
