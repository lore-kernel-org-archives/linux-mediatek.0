Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C7874C433EF
	for <linux-mediatek@archiver.kernel.org>; Mon, 10 Jan 2022 13:43:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:From:
	References:Cc:To:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Q9QNyaWlRNochtSq4jhj5bmXLhF6XoH8/QQFsI5R8PE=; b=TXXcXGqoEY5YoBmPCfDAicaZX9
	gvICaacCAgOht6WNmKZP7O7IglfxqoClX0avnPLzZxNw6bsYh5lNq2Fm2e1uZh9jhV6jR+vJvf01j
	ik4/PIkKcrwl09gwXHcGyMlehRTgEuc98J9vg6PWILA/T7H2EUTZqtOLcGlxf20gr9n51/VOnUZ6n
	Fc/ZyVUeerEp6Si12qdp3u5IDiONHAAtiv/UsFAAZ3U8P9MNkQbL+6eAkTPpydZMm2pkueqEaGV4V
	0/sOxuS5xFB5wcE5KoIHy5G3UqEVt2NoVIYjIgFMvYQy96811ihqUtJf0moFHGPQFxCwgsTtZOLGA
	AYjHaUMQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1n6uxF-00BZXw-0H; Mon, 10 Jan 2022 13:43:21 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1n6ux4-00BZTm-9R
 for linux-mediatek@lists.infradead.org; Mon, 10 Jan 2022 13:43:11 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1641822186;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=pWO8bUpZLUYe86Yo5GKizn940aDxxY2uX8Eua9eNw/E=;
 b=P8VDKf7md9bsBvDsZtM031TnKTLl7el8b5jHdHXIah7mKnQxQo6kKI+LFXqt8fDk06g/tX
 2uP+VOVzObhPltjUlqRbb17iC6lbW5cuhWjxTwhiRWlZ2s8Xz/d7w1t/B8zgOIck6Tph7i
 BRRaSW3xgesCGL05CcsAKXFgCYVtP+Q=
Received: from mail-oi1-f200.google.com (mail-oi1-f200.google.com
 [209.85.167.200]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-594-Q1XUflZ3Nx-80vIrNu3Ffw-1; Mon, 10 Jan 2022 08:43:05 -0500
X-MC-Unique: Q1XUflZ3Nx-80vIrNu3Ffw-1
Received: by mail-oi1-f200.google.com with SMTP id
 t72-20020acaaa4b000000b002c6f0e4294eso9975812oie.6
 for <linux-mediatek@lists.infradead.org>; Mon, 10 Jan 2022 05:43:05 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-transfer-encoding
 :content-language;
 bh=pWO8bUpZLUYe86Yo5GKizn940aDxxY2uX8Eua9eNw/E=;
 b=eirwAOOfhqbkHrHw61x7kC51uz66VGcEdu3xI+jXUmUS4CfADJc/gnPCqeEb3Sx87J
 fPsBSxtGCUCLgeE76BmW7lc174z6YRtge3BBnFwaCg4D4coze2yHyP9MIMuilYamMNoG
 qjreDp+9jAfDgDdYPGMFXU6pKJXpzwm7poowZa77L+zdbrX0acUfOWBUqSEIFGu9rHMN
 Dt4eOiosKqPej7qqQVT5W6yden7TqZkNbi2GeuEB3dujzF5rJolWYJ0hXN3WQS2e6Nfg
 2F52zyca6r16RoValk6Qfqs9l30MNoWiHaLHyYiR7pVNyXk6549lLfCwYYF2IbFAoGzk
 x9mg==
X-Gm-Message-State: AOAM531VfpJUVHJqcLjHpQ1wUzzDZLKavvb0810GfI/Auda3htISUYkC
 KdLcNJnODSFJ15cRhB0NAcgv7005hGndz9YSifBLqYNNOgpyNJOMGz1VVp9luaOiBjg82yUGHjE
 YXdsPRibOR/3wmGTAwZeuAwQaRfFU1TaV
X-Received: by 2002:a05:6830:4034:: with SMTP id
 i20mr7351271ots.243.1641822184452; 
 Mon, 10 Jan 2022 05:43:04 -0800 (PST)
X-Google-Smtp-Source: ABdhPJwra7ExUsBTMUvid99Z4eMEaJDEt12JpY0FwhcWLFMOignU8NPtKadY96Va2EYt/fw8qI/dxQ==
X-Received: by 2002:a05:6830:4034:: with SMTP id
 i20mr7351243ots.243.1641822183935; 
 Mon, 10 Jan 2022 05:43:03 -0800 (PST)
Received: from localhost.localdomain (024-205-208-113.res.spectrum.com.
 [24.205.208.113])
 by smtp.gmail.com with ESMTPSA id z19sm661908oid.57.2022.01.10.05.43.02
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 10 Jan 2022 05:43:03 -0800 (PST)
Subject: Re: [PATCH] net: ethernet: mtk_eth_soc: fix error checking in
 mtk_mac_config()
To: Jakub Kicinski <kuba@kernel.org>
Cc: nbd@nbd.name, john@phrozen.org, sean.wang@mediatek.com,
 Mark-MC.Lee@mediatek.com, davem@davemloft.net, matthias.bgg@gmail.com,
 linux@armlinux.org.uk, nathan@kernel.org, ndesaulniers@google.com,
 opensource@vdorst.com, netdev@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org,
 linux-kernel@vger.kernel.org, llvm@lists.linux.dev
References: <20220108155003.3991055-1-trix@redhat.com>
 <20220109164333.61dc2e89@kicinski-fedora-PC1C0HJN.hsd1.ca.comcast.net>
From: Tom Rix <trix@redhat.com>
Message-ID: <f3025d42-6ff0-8880-c0e6-3ee45a8556f7@redhat.com>
Date: Mon, 10 Jan 2022 05:43:00 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.1
MIME-Version: 1.0
In-Reply-To: <20220109164333.61dc2e89@kicinski-fedora-PC1C0HJN.hsd1.ca.comcast.net>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=trix@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220110_054310_421099_0139353E 
X-CRM114-Status: GOOD (  18.25  )
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


On 1/9/22 4:43 PM, Jakub Kicinski wrote:
> On Sat,  8 Jan 2022 07:50:03 -0800 trix@redhat.com wrote:
>> From: Tom Rix <trix@redhat.com>
>>
>> Clang static analysis reports this problem
>> mtk_eth_soc.c:394:7: warning: Branch condition evaluates
>>    to a garbage value
>>                  if (err)
>>                      ^~~
>>
>> err is not initialized and only conditionally set.
>> Check err consistently with the rest of mtk_mac_config(),
>> after even possible setting.
>>
>> Fixes: 7e538372694b ("net: ethernet: mediatek: Re-add support SGMII")
>> Signed-off-by: Tom Rix <trix@redhat.com>
>> ---
>>   drivers/net/ethernet/mediatek/mtk_eth_soc.c | 12 +++++++-----
>>   1 file changed, 7 insertions(+), 5 deletions(-)
>>
>> diff --git a/drivers/net/ethernet/mediatek/mtk_eth_soc.c b/drivers/net/ethernet/mediatek/mtk_eth_soc.c
>> index b67b4323cff08..a27e548488584 100644
>> --- a/drivers/net/ethernet/mediatek/mtk_eth_soc.c
>> +++ b/drivers/net/ethernet/mediatek/mtk_eth_soc.c
>> @@ -385,14 +385,16 @@ static void mtk_mac_config(struct phylink_config *config, unsigned int mode,
>>   		       0 : mac->id;
>>   
>>   		/* Setup SGMIISYS with the determined property */
>> -		if (state->interface != PHY_INTERFACE_MODE_SGMII)
>> +		if (state->interface != PHY_INTERFACE_MODE_SGMII) {
>>   			err = mtk_sgmii_setup_mode_force(eth->sgmii, sid,
>>   							 state);
>> -		else if (phylink_autoneg_inband(mode))
>> +			if (err)
>> +				goto init_err;
>> +		} else if (phylink_autoneg_inband(mode)) {
>>   			err = mtk_sgmii_setup_mode_an(eth->sgmii, sid);
>> -
>> -		if (err)
>> -			goto init_err;
>> +			if (err)
>> +				goto init_err;
>> +		}
>>   
>>   		regmap_update_bits(eth->ethsys, ETHSYS_SYSCFG0,
>>   				   SYSCFG0_SGMII_MASK, val);
> Why not init err to 0 before the if or add an else err = 0; branch?

This is the way I would have preferred to do it but the function's 
existing error handling does it this way.

I'll respin the patch.

Tom


>


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
