Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6FECFC433FE
	for <linux-mediatek@archiver.kernel.org>; Mon, 14 Nov 2022 12:08:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=v0Chla6FrbvsRj/V7o93Jwb0K9dJDq2Z+82QL/7CPMc=; b=GNY3c3s56j0vKAF3PXgZCOhdry
	BbhB4ACQxrlL5n8KuCRbLq9RoaM+Nm9xetPGJTB8piPZdlZY5W9HP9LDPu3xxteD0x1BgLa1BBMjY
	sRhzTXGhy03CedXsIK7F5XNm4jPQDonbKTLgJRywdWVAmIwFpRsCFdWtUoRwND6xFquACP7KQO8hn
	WGWIqkGkduH/51nNk0uidaGMRsAU5kZxx9p8gSQA5CC2TGfOJMcIqxELEBW8Bvs05+fodmejwojEJ
	ccrMInfxwEv4+enjrFDnpAEh74mbCmQm/GP1725Ooch5GiOo+S9pabTGSzGUR8nSNxJ04yU2ch1sE
	Yz2dD59A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ouYFx-000gsw-BU; Mon, 14 Nov 2022 12:08:05 +0000
Received: from mail-wr1-x42e.google.com ([2a00:1450:4864:20::42e])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ouYFj-000gp7-Up; Mon, 14 Nov 2022 12:07:53 +0000
Received: by mail-wr1-x42e.google.com with SMTP id h9so17855525wrt.0;
        Mon, 14 Nov 2022 04:07:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=v0Chla6FrbvsRj/V7o93Jwb0K9dJDq2Z+82QL/7CPMc=;
        b=NU0DJYEl7x+p33l8H4eTIkVmbzTGMYwmrBWF0JqU20kwNL3WwShZM0I+Zt9PxTbTpV
         pIzqiwqouRIu55CvOpCYY1aM0/IozRM8SfvVIwNwHc73WpvVU4lM+MSKKCz7bd5cP1c1
         1J2aZ498vCXxcvDy82NnXgOWozRCNxPNIpAjePwdF9RrvS0dsx3s/k2OqhjTdFL3R2Jc
         GKTrAgzquYBlo++pdyHo2Y0aith7l0OsWRkdAt+/Nys9a6+NLSiLqFt8BN9aG2XmbIJd
         mSaWVfkytWAL8DZ5/GSE9+MLJB2sHKciVe1yRPCPmfgLKFhX6Ksm2TP9PhMqS0jlnEc5
         9cEA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=v0Chla6FrbvsRj/V7o93Jwb0K9dJDq2Z+82QL/7CPMc=;
        b=QKIC7dEpjud9nX7ypqN7aAVY3LkYNVJ6i2pMQjaIcgj93p1Ar3fMevRLhigExrTWMN
         pwJkxCrHuI3FdQImwjdiX8eudfwdZq7wVZqXqH4jFucivK/xpMpRQNZ2BbFnueYS0MCe
         pLWm6g9Mr5ftZdOof3fjmUR4XPZwLI24geYbtAnz15KyWVQ1yzbN2TQob0tLz0X4Ce2N
         RzC4sPNr4vk/qrUgu/tG/TduHCeB3JF1RcqgZevada17rNK2NaFpcW9g+pIUbnv+wVLZ
         aCpLMRE0DoJyLTu0xaQDwWy7fYQrDeEDqp+u9EZHV059jJ9JiSNqhOcPrOdEaNpr2LOp
         kGhw==
X-Gm-Message-State: ANoB5pmpCS966P7o5fj0lYSAK0dmEPm8B4t434t6zwaDBYau+ByNr2au
	GyQCogamqJCoYSTfrDXYc7Y=
X-Google-Smtp-Source: AA0mqf48iZU6uRKsDDAM/vO3CslLT70Dh+24sB8ylByYPvNix4AxyR3/oAJb9j7gwCPlcvP+hZYcPw==
X-Received: by 2002:a5d:4110:0:b0:236:7cdb:3c8b with SMTP id l16-20020a5d4110000000b002367cdb3c8bmr7165739wrp.280.1668427670067;
        Mon, 14 Nov 2022 04:07:50 -0800 (PST)
Received: from [192.168.1.131] ([207.188.167.132])
        by smtp.gmail.com with ESMTPSA id o15-20020a05600c510f00b003c6d21a19a0sm13684389wms.29.2022.11.14.04.07.48
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 14 Nov 2022 04:07:48 -0800 (PST)
Message-ID: <7d674c0c-4cff-d142-225d-80c3309a57ec@gmail.com>
Date: Mon, 14 Nov 2022 13:07:47 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.2
Subject: Re: [PATCH v2] soc: mediatek: Add deprecated compatible to mmsys
Content-Language: en-US
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 matthias.bgg@kernel.org, nancy.lin@mediatek.com
Cc: linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org,
 linux-kernel@vger.kernel.org
References: <20221111082912.14557-1-matthias.bgg@kernel.org>
 <46c17d4b-d130-86a7-b5f8-73c30d7fdfdd@collabora.com>
From: Matthias Brugger <matthias.bgg@gmail.com>
In-Reply-To: <46c17d4b-d130-86a7-b5f8-73c30d7fdfdd@collabora.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221114_040752_056414_692D3B1A 
X-CRM114-Status: UNSURE (   7.85  )
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



On 14/11/2022 12:58, AngeloGioacchino Del Regno wrote:
> Il 11/11/22 09:29, matthias.bgg@kernel.org ha scritto:
>> From: Matthias Brugger <matthias.bgg@gmail.com>
>>
>> For backward compatibility we add the deprecated compatible.
>>
>> Signed-off-by: Matthias Brugger <matthias.bgg@gmail.com>
> 
> Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
> 
> ...And tested on MT8195 Cherry Chromebook.
> 

Applied, thanks for testing!

