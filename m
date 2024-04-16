Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1E29FC4345F
	for <linux-mediatek@archiver.kernel.org>; Tue, 16 Apr 2024 10:38:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ZRv305zb1u+L8+UiHIiyOFHFfgCV1xdDeLgB4ZGRoy4=; b=Us3Cmx6xjpeLzNEjYMo3RwJ2d9
	GuMXPGIZGXoahZSmkjhGcKj9FQHmmAqOzxAhJy+DMzUF4w6uC0tRLRZSmRcrIXhe76rxOhH6VAIl+
	rYhUPpuPTZdhDrQik3Dipjr6R1njzuQa/hWNcqfBpMpQxd3qdeucqJC8xMPqwrb5lXu6PLKZFvpVL
	NJ0eZPNRNpkIgHrlzAUzprn4gnmBe6tRZj9wR2XN+m9rxbZDJHBXc0xSTShWVb4YyzNoI6ZmUpENr
	7xuW18R3bnPUrc0pA9I1duHKt0OD0gLplLSbBbONfFwPgo5B4mRNnyR12GtXLfn1KCnkMuCpBcNL9
	xLVa+YqA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rwgCy-0000000BpwC-39yV;
	Tue, 16 Apr 2024 10:38:36 +0000
Received: from madrid.collaboradmins.com ([2a00:1098:ed:100::25])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rwgCv-0000000Bpux-2HDS;
	Tue, 16 Apr 2024 10:38:35 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1713263910;
	bh=pK3vpmXoyhjgc5/+MqiOTT24oZivIAniiVbO1jnVuqM=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=J4d6KzkwOJH5ozVybjyzmBm0u1oJN7TflqhG7AA63jTqV03T0tqGS1eyRsKFHcuu3
	 jPKyvtENm5I6a6o3xxJzwv0UWuUICe0IkDxEGQBLbExOZ1oTVpDhfbEG4LtfZofWK6
	 7ZHhOG5DgZO4fgZebNh2Q0ECiF42Q7x0xugerrAVdbVoaUM/MWZmEZBbRH1qsvqLt1
	 66hYXIDQU4uhh3mSWE7WuJ6p8A3SaH/qXQ42vb5NoUes/HdWOsOc2O7jPLBXAVPxrp
	 ee2SRQVw0WQMGc/wkVKuQEPk+cZkTZr6hiZOTl5BX0x5puowD22lYKzIhcwbtlefwu
	 H5HxRum/pijhw==
Received: from [100.113.186.2] (cola.collaboradmins.com [195.201.22.229])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by madrid.collaboradmins.com (Postfix) with ESMTPSA id 5F51F378210B;
	Tue, 16 Apr 2024 10:38:29 +0000 (UTC)
Message-ID: <f3920433-b0fa-4a64-9653-e385bf1eb5c7@collabora.com>
Date: Tue, 16 Apr 2024 12:38:28 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 3/8] scsi: ufs: ufs-mediatek: Remove useless
 mediatek,ufs-boost-crypt property
To: =?UTF-8?B?UGV0ZXIgV2FuZyAo546L5L+h5Y+LKQ==?= <peter.wang@mediatek.com>,
 "linux-scsi@vger.kernel.org" <linux-scsi@vger.kernel.org>
Cc: "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "linux-mediatek@lists.infradead.org" <linux-mediatek@lists.infradead.org>,
 "jejb@linux.ibm.com" <jejb@linux.ibm.com>,
 "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
 "avri.altman@wdc.com" <avri.altman@wdc.com>,
 "martin.petersen@oracle.com" <martin.petersen@oracle.com>,
 "bvanassche@acm.org" <bvanassche@acm.org>,
 "broonie@kernel.org" <broonie@kernel.org>,
 "alim.akhtar@samsung.com" <alim.akhtar@samsung.com>,
 "conor+dt@kernel.org" <conor+dt@kernel.org>,
 "robh@kernel.org" <robh@kernel.org>,
 "lgirdwood@gmail.com" <lgirdwood@gmail.com>,
 "linux-arm-kernel@lists.infradead.org"
 <linux-arm-kernel@lists.infradead.org>,
 "krzysztof.kozlowski+dt@linaro.org" <krzysztof.kozlowski+dt@linaro.org>,
 "matthias.bgg@gmail.com" <matthias.bgg@gmail.com>
References: <20240415110012.148871-1-angelogioacchino.delregno@collabora.com>
 <20240415110012.148871-4-angelogioacchino.delregno@collabora.com>
 <c9634a286fbdb4c98a7fe6703a4eb10d66dfcb9e.camel@mediatek.com>
 <4d60e9e4-9eae-4b0a-abb2-b1ad3d278fc9@collabora.com>
 <93db93aa7eb24a255f97a1a1e8e8d936dc908258.camel@mediatek.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Content-Language: en-US
In-Reply-To: <93db93aa7eb24a255f97a1a1e8e8d936dc908258.camel@mediatek.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240416_033833_759176_411F8E7F 
X-CRM114-Status: GOOD (  16.52  )
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

Il 16/04/24 12:31, Peter Wang (王信友) ha scritto:
> 
>> Yes this causes -> less than half of a millisecond <- of additional
>> boot time
>> if the dvfsrc-supply is present but boost-microvolt is not.
>>
>> I really don't see the problem with that :-)
>>
> 
> Adding a little bit of boot time to one smartphone might not be a
> problem, but when you consider a billion smartphones each adding a
> little bit, the cumulative effect becomes significant. The power
> consumption of these accumulated times will continue to increase,
> contributing to the Earth's carbon emissions. Moreover, removing the
> master switch for this feature doesn't seem to have any benefits other
> than not having to set it in the DTS. Similarly, the master switch for
> VA09 seems to have more disadvantage.
> 

Sorry, but I still don't see how a few *microseconds* more of boot time can
be significant, even related to power consumption during boot.

If that was a few milliseconds, then I'd agree with you, but that's not the case.

Removing the master switch has a benefit: you *lose* a few microseconds of boot
time (so, boots in *few microseconds LESS*) on platforms that would have this set
in devicetree, as this property is redundant with the other activation checks
for those features.

So, there you go: if the majority of MediaTek platforms are already using this
crypt boost feature, then this commit reduces carbon emissions, as those would
boot in a few less microseconds.

Regards,
Angelo

> 
>> Regards,
>> Angelo
>>
>>> Thanks.
>>> Peter
>>>
>>>
>>>
>>>>    	ret = ufs_mtk_init_va09_pwr_ctrl(hba);
>>>>    	if (ret)
>>
>>



